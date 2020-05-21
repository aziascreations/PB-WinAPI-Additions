﻿;{- Code Header
; ==- Basic Info -================================
;         Name: WinAPI_Types.pbi
;      Version: 0.0.1
;       Author: Herwin Bozet
;  Create date: 20 ‎May ‎2020, ‏‎07:31:25
;
;  Description: A simple set of macros to easily use WinAPI data types in PB
;                programs
;
; ==- Compatibility -=============================
;  Compiler version: PureBasic 5.70 (x86/x64)
;  Operating system: Windows 10 (Previous versions untested)
;
; ==- Sources -===================================
;  https://docs.microsoft.com/en-us/windows/win32/winprog/windows-data-types
; 
; ==- Links & License -===========================
;   Github: https://github.com/aziascreations/PB-WinAPI-Additions
;     Doc.: https://github.com/aziascreations/PB-WinAPI-Additions/Documentation/WinAPI_Types.md
;  License: Unlicense (Only applies to the includes, not Microsoft's API)
;
;}


;- Compiler Options
;{

; The following line is only use to see if it works with it and for debugging.
;EnableExplicit

;}


;- Macros
;{

Macro APIENTRY : WINAPI : EndMacro
Macro ATOM : WORD : EndMacro

Macro BOOL : l : EndMacro
Macro BOOLEAN : BYTE : EndMacro
Macro BYTE : a : EndMacro

;Macro CALLBACK : ??? : EndMacro ;#define CALLBACK __stdcall
Macro CCHAR : b : EndMacro
Macro CHAR : b : EndMacro
Macro COLORREF : l : EndMacro
;Macro CONST : ??? : EndMacro ;#define CONST const

Macro DWORD : l : EndMacro
Macro DWORDLONG : q : EndMacro
Macro DWORD_PTR : i : EndMacro
Macro DWORD32 : l : EndMacro
Macro DWORD64 : q : EndMacro

Macro FLOAT : f : EndMacro

Macro HACCEL : HANDLE : EndMacro

CompilerIf #PB_Compiler_Processor = #PB_Processor_x86
	Macro HALF_PTR : u : EndMacro
CompilerElseIf  #PB_Compiler_Processor = #PB_Processor_x64
	Macro HALF_PTR : l : EndMacro
CompilerEndIf

Macro HANDLE : i : EndMacro
Macro HBITMAP : HANDLE : EndMacro
Macro HBRUSH : HANDLE : EndMacro
Macro HCOLORSPACE : HANDLE : EndMacro
Macro HCONV : HANDLE : EndMacro
Macro HCONVLIST : HANDLE : EndMacro
Macro HCURSOR : HICON : EndMacro
Macro HDC : HANDLE : EndMacro
Macro HDDEDATA : HANDLE : EndMacro
Macro HDESK : HANDLE : EndMacro
Macro HDROP : HANDLE : EndMacro
Macro HDWP : HANDLE : EndMacro
Macro HENHMETAFILE : HANDLE : EndMacro
Macro HFILE : l : EndMacro
Macro HFONT : HANDLE : EndMacro
Macro HGDIOBJ : HANDLE : EndMacro
Macro HGLOBAL : HANDLE : EndMacro
Macro HHOOK : HANDLE : EndMacro
Macro HICON : HANDLE : EndMacro
Macro HINSTANCE : HANDLE : EndMacro
Macro HKEY : HANDLE : EndMacro
Macro HKL : HANDLE : EndMacro
Macro HLOCAL : HANDLE : EndMacro
Macro HMENU : HANDLE : EndMacro
Macro HMETAFILE : HANDLE : EndMacro
Macro HMODULE : HINSTANCE : EndMacro
Macro HMONITOR : HANDLE : EndMacro ; if(WINVER >= 0x0500) typedef HANDLE HMONITOR;
Macro HPALETTE : HANDLE : EndMacro
Macro HPEN : HANDLE : EndMacro
Macro HRESULT : LONG : EndMacro
Macro HRGN : HANDLE : EndMacro
Macro HRSRC : HANDLE : EndMacro
Macro HSZ : HANDLE : EndMacro
Macro HWINSTA : HANDLE : EndMacro
Macro HWND : HANDLE : EndMacro

; Macro INT : l : EndMacro
; Macro INT_PTR : aaaaaaa : EndMacro
; Macro INT8 : aaaaaaa : EndMacro
; Macro INT16 : aaaaaaa : EndMacro
; Macro INT32 : aaaaaaa : EndMacro
; Macro INT64 : aaaaaaa : EndMacro

Macro LANGID : WORD : EndMacro
Macro LCID : DWORD : EndMacro
Macro LCTYPE : DWORD : EndMacro
Macro LGRPID : DWORD : EndMacro
Macro LONG : l : EndMacro
; Macro LONGLONG : aaaaaaa : EndMacro
; ; #if !Defined(_M_IX86)
; ;  typedef __int64 LONGLONG; 
; ; #else
; ;  typedef double LONGLONG;
; ; #endif
; Macro LONG_PTR : aaaaaaa : EndMacro
; ; #if Defined(_WIN64)
; ;  typedef __int64 LONG_PTR; 
; ; #else
; ;  typedef long LONG_PTR;
; ; #endif
Macro LONG32 : l : EndMacro
Macro LONG64 : q : EndMacro
; Macro LPARAM : LONG_PTR : EndMacro
; ; Macro LPBOOL : aaaaaaa : EndMacro ; typedef BOOL far *LPBOOL;
; ; Macro LPBYTE : aaaaaaa : EndMacro ; typedef BYTE far *LPBYTE;
; ; [...]
; Macro aaaaaaa : aaaaaaa : EndMacro
; Macro aaaaaaa : aaaaaaa : EndMacro
; Macro aaaaaaa : aaaaaaa : EndMacro
; Macro aaaaaaa : aaaaaaa : EndMacro
; Macro aaaaaaa : aaaaaaa : EndMacro
; Macro aaaaaaa : aaaaaaa : EndMacro
; Macro aaaaaaa : aaaaaaa : EndMacro
; Macro aaaaaaa : aaaaaaa : EndMacro
; Macro aaaaaaa : aaaaaaa : EndMacro

Macro PDWORD : i : EndMacro
Macro PVOID : i : EndMacro
Macro PHANDLE : i : EndMacro


Macro UCHAR : a : EndMacro
Macro ULONG : l : EndMacro


Macro WCHAR : u : EndMacro
Macro WINAPI : q : EndMacro
Macro WORD : w : EndMacro

;}
