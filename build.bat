@echo off
setlocal
echo ============================================================
echo   MediCare - Building WAR Package
echo ============================================================
echo.

set MVN_CMD=mvn
where mvn >nul 2>nul
if %ERRORLEVEL% neq 0 (
    if exist "C:\Maven\bin\mvn.cmd" (
        set MVN_CMD="C:\Maven\bin\mvn.cmd"
    ) else (
        echo [ERROR] Maven not found.
        pause
        exit /b 1
    )
)

%MVN_CMD% clean package
if %ERRORLEVEL% equ 0 (
    echo.
    echo ============================================================
    echo   BUILD SUCCESS!
    echo   WAR File: target\MediCare.war
    echo   Deploy target\MediCare.war to Tomcat webapps/ or run run.bat!
    echo ============================================================
) else (
    echo.
    echo [ERROR] Build failed.
)
pause
