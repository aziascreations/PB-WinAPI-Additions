
; This a the path to the root of the Windows SDK that you candownload here:
; https://developer.microsoft.com/en-us/windows/downloads/windows-10-sdk/

; It is used to load the .lib files when compiling which avoids having to load the functions
;  one by one from the DLLs manually at runtime.
#WinAPI_SDK_PATH$ = "C:\Program Files (x86)\Windows Kits\10\Lib\10.0.19041.0\"
