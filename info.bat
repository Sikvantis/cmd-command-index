@echo off
setlocal EnableDelayedExpansion

rem === Use current script folder ===
set "cmdFolder=%~dp0"

echo Commands:
echo.

set "pad=                                                                                                    "

rem === Find longest filename ===
set "maxLen=0"

for %%f in ("%cmdFolder%*.bat") do (
    if /I not "%%~nxf"=="info.bat" (

        call :strlen "%%~nf" len

        if !len! GTR !maxLen! (
            set "maxLen=!len!"
        )
    )
)

rem === Add spacing ===
set /a colWidth=maxLen + 5

rem === Display commands ===
for %%f in ("%cmdFolder%*.bat") do (

    if /I not "%%~nxf"=="info.bat" (

        set "cmd=%%~nf"
        set "desc=No description available."

        rem === Read first :: line ===
        for /f "usebackq delims=" %%l in (`findstr /B "::" "%%f"`) do (
            if "!desc!"=="No description available." (
                set "desc=%%l"
                set "desc=!desc:~2!"
            )
        )

        rem === Align output ===
        set "output=!cmd!!pad!"
        set "output=!output:~0,%colWidth%!"

        echo !output!- !desc!
    )
)

echo.
echo ### Add a line starting with "::" for descriptions ###
echo.

exit /b

rem === String length function ===
:strlen
setlocal EnableDelayedExpansion
set "s=%~1"
set len=0

:strlen_loop
if defined s (
    set "s=!s:~1!"
    set /a len+=1
    goto strlen_loop
)

endlocal & set "%~2=%len%"
exit /b