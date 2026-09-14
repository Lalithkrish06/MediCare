@echo off
setlocal
echo ============================================================
echo   MediCare - Gmail SMTP Quick Setup
echo ============================================================
echo.
echo To send OTP emails directly to your Gmail inbox:
echo 1. Generate a 16-letter App Password at:
echo    https://myaccount.google.com/apppasswords
echo.
set /p SENDER_EMAIL="Enter your Gmail address: "
set /p APP_PASS="Enter your 16-character App Password: "
echo.
(
echo # ============================================================
echo # MediCare Application Configuration
echo # ============================================================
echo.
echo # Database Connection (MySQL^)
echo db.url=jdbc:mysql://localhost:3306/medicare_db?useSSL=false^&serverTimezone=UTC^&allowPublicKeyRetrieval=true
echo db.user=root
echo db.password=Lali@2006
echo.
echo # Gmail SMTP Configuration
echo mail.smtp.email=%SENDER_EMAIL%
echo mail.smtp.app_password=%APP_PASS%
) > "src\main\resources\config.properties"

echo [SUCCESS] Gmail credentials saved to config.properties!
echo Restart run.bat to send real emails to your entered mail.
echo.
pause
