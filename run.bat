@echo off
setlocal
echo ============================================================
echo   MediCare - Medical Symptom ^& Tablet Recommender
echo ============================================================
echo.

set MVN_CMD=mvn
where mvn >nul 2>nul
if %ERRORLEVEL% neq 0 (
    if exist "C:\Maven\bin\mvn.cmd" (
        set MVN_CMD="C:\Maven\bin\mvn.cmd"
    ) else (
        echo [ERROR] Maven not found. Please ensure Maven is in your PATH.
        pause
        exit /b 1
    )
)

echo Starting MediCare Web Server on port 8080...
echo Access the application at: http://localhost:8080/MediCare
echo Press CTRL+C to stop the server.
echo.
%MVN_CMD% jetty:run
pause
