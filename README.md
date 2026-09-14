# 🏥 MediCare — Medical Symptom & Tablet Recommender

> **Developed by LALITH KRISH**  
> **Technology Stack:** Java 17 | JSP | Servlets | JDBC | MySQL 8.0 | Maven | Jetty / Apache Tomcat

---

## 🚀 Quick Start (1-Click Run)

### Method 1: Using `run.bat` (Recommended)
Simply double-click **`run.bat`** in the project folder, or run in PowerShell/Terminal:
```powershell
.\run.bat
```
Then open your browser to:
👉 **`http://localhost:8080/MediCare`**

### Method 2: Using Maven Command Line
```bash
mvn clean jetty:run
```
Access at **`http://localhost:8080/MediCare`**.

### Method 3: Deploy WAR to Apache Tomcat
To generate the production WAR archive:
```bash
.\build.bat
# OR
mvn clean package
```
Copy `target/MediCare.war` to your Tomcat `webapps/` folder and start Tomcat.

---

## 📋 Features

- 🔐 **OTP-based User Authentication** (Supports real Gmail SMTP or instant Demo Mode with on-screen & console OTP fallback).
- 🔒 **Secure Password Hashing** using BCrypt.
- 💊 **Symptom-based Medicine Recommendation** (Headache, Fever, Cold, Cough, Acidity, etc.).
- 📋 **Dosage, Side Effects, and Precautions** for all recommended medications.
- 🗂️ **Search History Tracking** in MySQL database per user session.
- ⏳ **Session Management** with secure logout and timeout handling.
- 📱 **Clean & Modern Responsive Interface** with instant symptom selection chips.

---

## 🗄️ Database Setup (MySQL)

1. Ensure MySQL 8.0 is running on `localhost:3306`.
2. Run `database/schema.sql` to initialize `medicare_db` with all 25 symptoms and 20+ medicines:
   ```sql
   SOURCE database/schema.sql;
   ```
3. Database credentials can be customized in `src/main/java/com/medicare/util/DBConnection.java` or via environment variables:
   - `MEDICARE_DB_URL` (default: `jdbc:mysql://localhost:3306/medicare_db`)
   - `MEDICARE_DB_USER` (default: `root`)
   - `MEDICARE_DB_PASS` (default: `Lali@2006`)

---

## 📧 Email & OTP Configuration

- **Demo / Offline Mode (Automatic)**: If Gmail credentials are left default, OTP codes are automatically printed to the terminal console and shown on the verification page for immediate offline testing.
- **Production Gmail SMTP**: Set your Gmail address and 16-character App Password in `EmailUtil.java` or via environment variables:
   - `MEDICARE_EMAIL`: `your_email@gmail.com`
   - `MEDICARE_EMAIL_PASS`: `xxxx xxxx xxxx xxxx`

---

## 📂 Project Structure

```text
MediCare-main/
├── pom.xml                   ← Standard Maven build file
├── run.bat                   ← 1-Click launcher (Jetty server)
├── build.bat                 ← 1-Click WAR packager
├── database/
│   └── schema.sql            ← MySQL schema and seed data
└── src/main/
    ├── java/com/medicare/
    │   ├── dao/              ← UserDAO.java, MedicineDAO.java
    │   ├── model/            ← User.java, Medicine.java
    │   ├── servlet/          ← Servlets (Login, Register, OTP, Search, Logout)
    │   └── util/             ← DBConnection.java, EmailUtil.java
    └── webapp/
        ├── WEB-INF/
        │   └── web.xml       ← Deployment descriptor
        ├── css/
        │   └── style.css     ← UI styling
        ├── index.jsp         ← Welcome / redirect page
        ├── login.jsp         ← Login form
        ├── register.jsp      ← Registration form
        ├── verify-otp.jsp    ← OTP entry & countdown timer
        ├── home.jsp          ← Symptom selector dashboard
        └── results.jsp       ← Medicine recommendations
```
