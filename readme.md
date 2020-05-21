# PureBasic Win32 API Additions

This repository contains set of includes that give you access to some functions, structures and constants from the win32 api that aren't available by default.

<b>This projects is just getting started, you shouldn't use any part of it right now !</b>

## Usage

### Windows SDK

Every include in this repository "loads" the functions from the ```.lib``` files at compile time instead of loading them from the ```.dll``` files at runtime.<br>
You will therefore have to declare a constant in your project or at the top of you source code that points to the root of where your Windows SDK is installed.

Here is how it should look like:
```
#WinAPI_SDK_PATH$ = "C:\Program Files (x86)\Windows Kits\10\Lib\10.0.19041.0\"
```

The system allows you [to just have to] include the ```.pbi``` files and not have to worry about whether or not the functions loaded correctly.

If you wish to download it, you can do so here: [developer.microsoft.com](https://developer.microsoft.com/en-us/windows/downloads/windows-10-sdk/).


[What to include]


## Includes


### Wlanapi

* (Official doc)[https://docs.microsoft.com/en-us/windows/win32/api/wlanapi/]


## License

[Unlicense](LICENSE)
