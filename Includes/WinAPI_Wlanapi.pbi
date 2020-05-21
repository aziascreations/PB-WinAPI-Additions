;{- Code Header
; ==- Basic Info -================================
;         Name: WinAPI_Wlanapi.pbi
;      Version: 0.0.1
;       Author: Herwin Bozet
;  Create date: 21 ‎May ‎2020, ‏‎09:16:22
;
;  Description: Contains a basic subset of the functions, structs and constants
;                provided by Wlanapi.h
;
; ==- Compatibility -=============================
;  Compiler version: PureBasic 5.70 (x86/x64)
;  Operating system: Windows 10 (Previous versions untested)
;
; ==- Sources -===================================
;  https://docs.microsoft.com/en-us/windows/win32/api/wlanapi/
; 
; ==- Links & License -===========================
;   Github: https://github.com/aziascreations/PB-WinAPI-Additions
;     Doc.: https://github.com/aziascreations/PB-WinAPI-Additions/Documentation/WinAPI_Wlanapi.md
;  License: Unlicense
;
;}


;- Compiler Options
;{

XIncludeFile "./WinAPI_Types.pbi"

; The following line is only use to see if it works with it and for debugging.
;EnableExplicit

;}


;- WinAPI Common Checks
;{

CompilerIf Not Defined(WinAPI_SDK_PATH$, #PB_Constant)
	CompilerError "#WinAPI_SDK_PATH$ isn't defined !"
CompilerEndIf

;}


;- Constants
;{

#DOT11_SSID_MAX_LENGTH = 32

; #define WLAN_MAX_NAME_LENGTH L2_PROFILE_MAX_NAME_LENGTH
; derived from a sizeof()
#WLAN_MAX_NAME_LENGTH = 256


#WLAN_MAX_PHY_TYPE_NUMBER = 8
;}


;- Enums
;{

; https://docs.microsoft.com/en-us/windows/win32/api/wlanapi/ne-wlanapi-wlan_interface_state~r1
Enumeration WLAN_INTERFACE_STATE
	#wlan_interface_state_not_ready
	#wlan_interface_state_connected
	#wlan_interface_state_ad_hoc_network_formed
	#wlan_interface_state_disconnecting
	#wlan_interface_state_disconnected
	#wlan_interface_state_associating
	#wlan_interface_state_discovering
	#wlan_interface_state_authenticating
EndEnumeration

Macro WLAN_INTERFACE_STATE : l : EndMacro
Macro PWLAN_INTERFACE_STATE : i : EndMacro

;}


;- Structures
;{

; https://docs.microsoft.com/en-us/windows/win32/nativewifi/dot11-ssid
; typedef struct _DOT11_SSID {
;   ULONG uSSIDLength;
;   UCHAR ucSSID[DOT11_SSID_MAX_LENGTH];
; } DOT11_SSID, *PDOT11_SSID;
Structure DOT11_SSID
	uSSIDLength.ULONG
	ucSSID.UCHAR[#DOT11_SSID_MAX_LENGTH]
EndStructure
Macro PDOT11_SSID : DOT11_SSID : EndMacro



; https://docs.microsoft.com/en-us/windows/win32/api/wlanapi/ns-wlanapi-wlan_interface_info
; typedef struct _WLAN_INTERFACE_INFO {
;   GUID                 InterfaceGuid;
;   WCHAR                strInterfaceDescription[WLAN_MAX_NAME_LENGTH];
;   WLAN_INTERFACE_STATE isState;
; } WLAN_INTERFACE_INFO, *PWLAN_INTERFACE_INFO;
Structure WLAN_INTERFACE_INFO
	InterfaceGuid.GUID
	strInterfaceDescription.WCHAR[#WLAN_MAX_NAME_LENGTH]
	isState.WLAN_INTERFACE_STATE
EndStructure
Macro PWLAN_INTERFACE_INFO : i : EndMacro


; https://docs.microsoft.com/en-us/windows/win32/api/wlanapi/ns-wlanapi-wlan_interface_info_list
; typedef struct _WLAN_INTERFACE_INFO_LIST {
;   DWORD               dwNumberOfItems;
;   DWORD               dwIndex;
; #if ...
;   WLAN_INTERFACE_INFO *InterfaceInfo[];
; #else
;   WLAN_INTERFACE_INFO InterfaceInfo[1];
; #endif
; } WLAN_INTERFACE_INFO_LIST, *PWLAN_INTERFACE_INFO_LIST;
Structure WLAN_INTERFACE_INFO_LIST
	dwNumberOfItems.DWORD
	dwIndex.DWORD
	; Derived with a couple of sizeof
	InterfaceInfo.WLAN_INTERFACE_INFO[1]
EndStructure
Macro PWLAN_INTERFACE_INFO_LIST : i : EndMacro


; https://docs.microsoft.com/en-us/windows/win32/api/wlanapi/ns-wlanapi-wlan_raw_data
; typedef struct _WLAN_RAW_DATA {
;   DWORD dwDataSize;
; #if ...
;   BYTE  *DataBlob[];
; #else
;   BYTE  DataBlob[1];
; #endif
; } WLAN_RAW_DATA, *PWLAN_RAW_DATA;
Structure WLAN_RAW_DATA
	dwDataSize.DWORD
	DataBlob.BYTE[1]
EndStructure
Macro PWLAN_RAW_DATA : WLAN_RAW_DATA : EndMacro




; https://docs.microsoft.com/en-us/windows/win32/nativewifi/dot11-bss-type
; typedef enum _DOT11_BSS_TYPE { 
;   dot11_BSS_type_infrastructure  = 1,
;   dot11_BSS_type_independent     = 2,
;   dot11_BSS_type_any             = 3
; } DOT11_BSS_TYPE, *PDOT11_BSS_TYPE;
Macro DOT11_BSS_TYPE : l : EndMacro

#dot11_BSS_type_infrastructure = 1
#dot11_BSS_type_independent = 2
#dot11_BSS_type_any = 3

; https://docs.microsoft.com/en-us/windows/win32/nativewifi/wlan-reason-code
Macro WLAN_REASON_CODE : DWORD : EndMacro

; https://docs.microsoft.com/en-us/windows/win32/nativewifi/dot11-phy-type
; typedef enum _DOT11_PHY_TYPE { 
;   dot11_phy_type_unknown     = 0,
;   dot11_phy_type_any         = 0,
;   dot11_phy_type_fhss        = 1,
;   dot11_phy_type_dsss        = 2,
;   dot11_phy_type_irbaseband  = 3,
;   dot11_phy_type_ofdm        = 4,
;   dot11_phy_type_hrdsss      = 5,
;   dot11_phy_type_erp         = 6,
;   dot11_phy_type_ht          = 7,
;   dot11_phy_type_vht         = 8,
;   dot11_phy_type_IHV_start   = 0x80000000,
;   dot11_phy_type_IHV_end     = 0xffffffff
; } DOT11_PHY_TYPE, *PDOT11_PHY_TYPE;
Macro DOT11_PHY_TYPE : l : EndMacro

; > WLAN_SIGNAL_QUALITY is of type ULONG
Macro WLAN_SIGNAL_QUALITY : ULONG : EndMacro


; https://docs.microsoft.com/en-us/windows/win32/nativewifi/dot11-auth-algorithm
; typedef enum _DOT11_AUTH_ALGORITHM { 
;   DOT11_AUTH_ALGO_80211_OPEN        = 1,
;   DOT11_AUTH_ALGO_80211_SHARED_KEY  = 2,
;   DOT11_AUTH_ALGO_WPA               = 3,
;   DOT11_AUTH_ALGO_WPA_PSK           = 4,
;   DOT11_AUTH_ALGO_WPA_NONE          = 5,
;   DOT11_AUTH_ALGO_RSNA              = 6,
;   DOT11_AUTH_ALGO_RSNA_PSK          = 7,
;   DOT11_AUTH_ALGO_IHV_START         = 0x80000000,
;   DOT11_AUTH_ALGO_IHV_END           = 0xffffffff
; } DOT11_AUTH_ALGORITHM, *PDOT11_AUTH_ALGORITHM;
Macro DOT11_AUTH_ALGORITHM : l : EndMacro

; https://docs.microsoft.com/en-us/windows/win32/nativewifi/dot11-cipher-algorithm
; typedef enum _DOT11_CIPHER_ALGORITHM { 
;   DOT11_CIPHER_ALGO_NONE           = 0x00,
;   DOT11_CIPHER_ALGO_WEP40          = 0x01,
;   DOT11_CIPHER_ALGO_TKIP           = 0x02,
;   DOT11_CIPHER_ALGO_CCMP           = 0x04,
;   DOT11_CIPHER_ALGO_WEP104         = 0x05,
;   DOT11_CIPHER_ALGO_WPA_USE_GROUP  = 0x100,
;   DOT11_CIPHER_ALGO_RSN_USE_GROUP  = 0x100,
;   DOT11_CIPHER_ALGO_WEP            = 0x101,
;   DOT11_CIPHER_ALGO_IHV_START      = 0x80000000,
;   DOT11_CIPHER_ALGO_IHV_END        = 0xffffffff
; } DOT11_CIPHER_ALGORITHM, *PDOT11_CIPHER_ALGORITHM;
Macro DOT11_CIPHER_ALGORITHM : l : EndMacro


; https://docs.microsoft.com/en-us/windows/win32/api/wlanapi/ns-wlanapi-wlan_available_network
; typedef struct _WLAN_AVAILABLE_NETWORK {
;   WCHAR                  strProfileName[WLAN_MAX_NAME_LENGTH];
;   DOT11_SSID             dot11Ssid;
;   DOT11_BSS_TYPE         dot11BssType;
;   ULONG                  uNumberOfBssids;
;   BOOL                   bNetworkConnectable;
;   WLAN_REASON_CODE       wlanNotConnectableReason;
;   ULONG                  uNumberOfPhyTypes;
;   DOT11_PHY_TYPE         dot11PhyTypes[WLAN_MAX_PHY_TYPE_NUMBER];
;   BOOL                   bMorePhyTypes;
;   WLAN_SIGNAL_QUALITY    wlanSignalQuality;
;   BOOL                   bSecurityEnabled;
;   DOT11_AUTH_ALGORITHM   dot11DefaultAuthAlgorithm;
;   DOT11_CIPHER_ALGORITHM dot11DefaultCipherAlgorithm;
;   DWORD                  dwFlags;
;   DWORD                  dwReserved;
; } WLAN_AVAILABLE_NETWORK, *PWLAN_AVAILABLE_NETWORK;
Structure WLAN_AVAILABLE_NETWORK
	strProfileName.WCHAR[#WLAN_MAX_NAME_LENGTH]
	dot11Ssid.DOT11_SSID
	dot11BssType.DOT11_BSS_TYPE
	uNumberOfBssids.ULONG
	bNetworkConnectable.BOOL
	wlanNotConnectableReason.WLAN_REASON_CODE
	uNumberOfPhyTypes.ULONG
	dot11PhyTypes.DOT11_PHY_TYPE[#WLAN_MAX_PHY_TYPE_NUMBER]
	bMorePhyTypes.BOOL
	wlanSignalQuality.WLAN_SIGNAL_QUALITY
	bSecurityEnabled.BOOL
	dot11DefaultAuthAlgorithm.DOT11_AUTH_ALGORITHM
	dot11DefaultCipherAlgorithm.DOT11_CIPHER_ALGORITHM
	dwFlags.DWORD
	dwReserved.DWORD
EndStructure
Macro PWLAN_AVAILABLE_NETWORK : WLAN_AVAILABLE_NETWORK : EndMacro


; https://docs.microsoft.com/en-us/windows/win32/api/wlanapi/ns-wlanapi-wlan_available_network_list
; typedef struct _WLAN_AVAILABLE_NETWORK_LIST {
;   DWORD                  dwNumberOfItems;
;   DWORD                  dwIndex;
; #if ...
;   WLAN_AVAILABLE_NETWORK *Network[];
; #else
;   WLAN_AVAILABLE_NETWORK Network[1];
; #endif
; } WLAN_AVAILABLE_NETWORK_LIST, *PWLAN_AVAILABLE_NETWORK_LIST;
Structure WLAN_AVAILABLE_NETWORK_LIST
	dwNumberOfItems.DWORD
	dwIndex.DWORD
	Network.WLAN_AVAILABLE_NETWORK[1]
EndStructure
Macro PWLAN_AVAILABLE_NETWORK_LIST : WLAN_AVAILABLE_NETWORK_LIST : EndMacro

#WLAN_AVAILABLE_NETWORK_INCLUDE_ALL_ADHOC_PROFILES = $00000001
#WLAN_AVAILABLE_NETWORK_INCLUDE_ALL_MANUAL_HIDDEN_PROFILES = $00000002

;}


;- Imports
;{

CompilerIf #PB_Compiler_Processor = #PB_Processor_x86
	Import #WinAPI_SDK_PATH$ + "\um\x86\Wlanapi.lib"
		
	CompilerIf #False:EndImport:CompilerEndIf ; Indentation fix
CompilerElseIf #PB_Compiler_Processor = #PB_Processor_x64
	Import #WinAPI_SDK_PATH$ + "\um\x64\Wlanapi.lib"
		
	CompilerIf #False:EndImport:CompilerEndIf ; Indentation fix
CompilerElse
	CompilerError "Unable to import Wlanapi.lib for the current architecture !"
CompilerEndIf


; https://docs.microsoft.com/en-us/windows/win32/api/wlanapi/nf-wlanapi-wlanopenhandle
WlanOpenHandle.DWORD(dwClientVersion.DWORD, pReserved.PVOID, pdwNegotiatedVersion.PDWORD, phClientHandle.PHANDLE)

; https://docs.microsoft.com/en-us/windows/win32/api/wlanapi/nf-wlanapi-wlanclosehandle
WlanCloseHandle.DWORD(hClientHandle.HANDLE, pReserved.PVOID)

; https://docs.microsoft.com/en-us/windows/win32/api/wlanapi/nf-wlanapi-wlanenuminterfaces
WlanEnumInterfaces.DWORD(hClientHandle.HANDLE, pReserved.PVOID, ppInterfaceList.PWLAN_INTERFACE_INFO_LIST)

; https://docs.microsoft.com/en-us/windows/win32/api/wlanapi/nf-wlanapi-wlanfreememory
WlanFreeMemory(pMemory.PVOID)

; https://docs.microsoft.com/en-us/windows/win32/api/wlanapi/nf-wlanapi-wlanscan
; DWORD WlanScan(
;   HANDLE               hClientHandle,
;   const GUID           *pInterfaceGuid,
;   const PDOT11_SSID    pDot11Ssid,
;   const PWLAN_RAW_DATA pIeData,
;   PVOID                pReserved
; );
; WlanScan.DWORD(hClientHandle.HANDLE, *pInterfaceGuid, *pDot11Ssid.PDOT11_SSID, *pIeData.PWLAN_RAW_DATA, pReserved.PVOID)
; TODO: Unsure about the parameters' type

; https://docs.microsoft.com/en-us/windows/win32/api/wlanapi/nf-wlanapi-wlangetavailablenetworklist
; DWORD WlanGetAvailableNetworkList(
;   HANDLE                       hClientHandle,
;   const GUID                   *pInterfaceGuid,
;   DWORD                        dwFlags,
;   PVOID                        pReserved,
;   PWLAN_AVAILABLE_NETWORK_LIST *ppAvailableNetworkList
; );
WlanGetAvailableNetworkList.DWORD(hClientHandle.HANDLE, *pInterfaceGuid.GUID, dwFlags.DWORD,
                                  pReserved.PVOID, *ppAvailableNetworkList.PWLAN_AVAILABLE_NETWORK_LIST)

EndImport

;}
