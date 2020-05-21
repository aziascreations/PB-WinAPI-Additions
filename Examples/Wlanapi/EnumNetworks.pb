;{- Code Header
; ==- Basic Info -================================
;         Name: EnumNetworks.pb
;      Version: N/A
;       Author: Herwin Bozet
;  Create date: ‎21 ‎May ‎2020, ‏‎11:09:57
;
;  Description: A simple example that shows you how to list every wireless network
;                seen by every interfaces.
;
; ==- Compatibility -=============================
;  Compiler version: PureBasic 5.70 (x86/x64)
;  Operating system: Windows 10 (Previous versions untested)
; 
; ==- Links & License -===========================
;   Github: https://github.com/aziascreations/PB-WinAPI-Additions
;  License: Unlicense
;
;}


;- Compiler directives
;{

; If you get "87" as a return value from WlanGetAvailableNetworkList(), you most likely forgot the @ before *pBssList.

;}


;- Compiler directives
;{

EnableExplicit

XIncludeFile "../ExampleCommons.pbi"
XIncludeFile "../../Includes/WinAPI_Wlanapi.pbi"

;}


;- Code
;{

; Choosing which version of the API should be accessed...
; You can just use 2 since Windows XP has reached EOL years ago.

Define dwMaxClient.DWORD
Define WindowsVersion = OSVersion()

If WindowsVersion >= #PB_OS_Windows_XP And WindowsVersion < #PB_OS_Windows_Vista
	; Windows SP2 & SP3
	dwMaxClient = 1
ElseIf WindowsVersion >= #PB_OS_Windows_Vista
	; Modern versions of Windows
	dwMaxClient = 2
Else
	Debug "Your version of windows is too old to use this API !"
	End
EndIf


; Grabbing a handle and "negotiating" which version of the API should be used...

Define dwClientVersion.DWORD
Define dwNegotiatedVersion.DWORD
Define hClient.HANDLE

If WlanOpenHandle(dwMaxClient, #Null, @dwNegotiatedVersion, @hClient) <> #ERROR_SUCCESS
	Debug "Failed to get a handle !"
	End
EndIf


; Grabbing the list of wireless network interfaces available...

Define *pIfList.WLAN_INTERFACE_INFO_LIST

If WlanEnumInterfaces(hClient, #Null, @*pIfList) <> #ERROR_SUCCESS
	Debug "Failed to enumerate wlan interfaces !"
	WlanCloseHandle(hClient, #Null)
	End
EndIf


; Iterating over every interface...

; This value is not required, but it makes it easier to interact with the "*pIfList\InterfaceInfo[...]" list.
Define *IfInfo.WLAN_INTERFACE_INFO
Define i.i

For i=0 To *pIfList\dwNumberOfItems - 1
	; We have to temporarely disable the debugger to avoid getting an error since we go out of
	;  bounds when reading the "*pIfList\InterfaceInfo[...]" list.
	DisableDebugger
	*IfInfo = *pIfList\InterfaceInfo[i]
	EnableDebugger
	
	
	; Printing the interface description and GUID...
	
	Define ifGUID.s{78}
	StringFromGUID2_(*IfInfo\InterfaceGuid, @ifGUID, 39)
	Debug Str(i) + " -> " + PeekS(@*IfInfo\strInterfaceDescription, #WLAN_MAX_NAME_LENGTH) + " -> " + ifGUID
	
	
	; Iterating over the list of available networks...
	
	Define *pBssList.WLAN_AVAILABLE_NETWORK_LIST
    Define *pBssEntry.WLAN_AVAILABLE_NETWORK
	Define j.i
	
	If WlanGetAvailableNetworkList(hClient, *IfInfo\InterfaceGuid, 0, 0, @*pBssList) = #ERROR_SUCCESS
		Debug "L__> Found "+Str(*pBssList\dwNumberOfItems)+" network(s) !"
		
		For j = 0 To *pBssList\dwNumberOfItems - 1
			; Same thing as before.
			DisableDebugger
			*pBssEntry = @*pBssList\Network[j]
			EnableDebugger
			
			; Printing the network informations...
			Debug "  L__> " + PeekS(@*pBssEntry\dot11Ssid\ucSSID, *pBssEntry\dot11Ssid\uSSIDLength, #PB_Ascii)
			
			;If *pBssEntry\bSecurityEnabled
			;	Debug "    L__> Security: "+"???"
			;EndIf
		Next
		
		; Cleaning up...
		WlanFreeMemory(*pBssList)
	Else
		Debug "L__> Failed to enumerate networks !"
	EndIf
	
	Debug ""
Next


; Cleaning up...
WlanFreeMemory(*pIfList)
WlanCloseHandle(hClient, #Null)

;}