# 🏥 MediCare — Medical Symptom & Tablet Recommender

> **Developed by LALITH KRISH | Reg: 732924ADR059**  
> Course: DBMS Project | Java + JSP + JDBC + MySQL + Tomcat 9

---

## 📋 Project Overview

MediCare is a secure full-stack web application where users can:
- **Register** with email + password
- **Verify** their account via OTP sent to email
- **Login** with OTP-based 2-factor authentication
- **Search** symptoms and get **medicine recommendations** with dosage, side effects, and precautions

---

## 🗂️ Project Structure

```
MediCare/
├── pom.xml                          ← Maven build file
├── database/
│   └── schema.sql                   ← MySQL database setup + seed data
└── src/main/
    ├── java/com/medicare/
    │   ├── dao/        UserDAO.java, MedicineDAO.java
    │   ├── model/      User.java, Medicine.java
    │   ├── servlet/    LoginServlet, RegisterServlet, OTPVerifyServlet,
    │   │               MedicineSearchServlet, LogoutServlet
    │   └── util/       DBConnection.java, EmailUtil.java
    └── webapp/
        ├── index.jsp, login.jsp, register.jsp
        ├── verify-otp.jsp, home.jsp, results.jsp
        ├── css/style.css
        └── WEB-INF/web.xml
```

---

## ⚙️ Setup Instructions

### 1. Prerequisites
- JDK 11+
- Apache Maven 3.6+
- Apache Tomcat 9
- MySQL 8.0+
- Gmail account with App Password enabled

---

### 2. Database Setup

1. Open MySQL Workbench or terminal
2. Run the SQL file:
   ```sql
   SOURCE /path/to/MediCare/database/schema.sql;
   ```
3. This creates `medicare_db` with all tables and sample data.

---

### 3. Configure Database Connection

Edit `src/main/java/com/medicare/util/DBConnection.java`:
```java
private static final String URL      = "jdbc:mysql://localhost:3306/medicare_db?...";
private static final String USER     = "root";
private static final String PASSWORD = "your_mysql_password";
```

---

### 4. Configure Gmail SMTP (for OTP emails)

Edit `src/main/java/com/medicare/util/EmailUtil.java`:
```java
private static final String FROM_EMAIL   = "your_gmail@gmail.com";
private static final String APP_PASSWORD = "xxxx xxxx xxxx xxxx"; // 16-char app password
```

**To generate Gmail App Password:**
1. Go to Google Account → Security → 2-Step Verification → App Passwords
2. Create a new app password for "Mail"
3. Paste the 16-character code above

---

### 5. Build & Deploy

```bash
# Build WAR file
mvn clean package

# Copy to Tomcat
cp target/MediCare.war /path/to/tomcat9/webapps/

# Start Tomcat
/path/to/tomcat9/bin/startup.sh
```

---

### 6. Access Application

Open: `http://localhost:8080/MediCare`

---

## 🔐 Authentication Flow

```
Register → Enter Email+Password → OTP sent to email
         → Enter OTP → Account Verified → Login page

Login → Enter Email+Password → OTP sent to email
      → Enter OTP → Access Home Dashboard
```

---

## 💊 Features

| Feature | Description |
|---------|-------------|
| Email OTP Login | Secure 2FA via Gmail SMTP |
| BCrypt Passwords | Industry-standard hashing |
| Session Management | Auto-logout after 30 min |
| 25 Symptoms | Headache, Fever, Cold, etc. |
| 20+ Medicines | With dosage & precautions |
| Search History | Logged per user |
| Responsive UI | Clean medical blue theme |

---

## 🛠️ Tech Stack

| Layer | Technology |
|-------|-----------|
| Frontend | JSP, HTML5, CSS3 |
| Backend | Java Servlets |
| Database | MySQL 8.0 + JDBC |
| Build | Apache Maven |
| Server | Apache Tomcat 9 |
| Email | JavaMail (Gmail SMTP) |
| Security | BCrypt + OTP |

---

## 📸 Sample Screens

1. **Login Page** — Email + Password form
2. **Register Page** — Full name, email, password
3. **OTP Verification** — 6-digit code + countdown timer
4. **Home Dashboard** — Symptom dropdown + quick chips
5. **Results Page** — Medicine cards with dosage details

---

*© 2024 MediCare | LALITH KRISH | 732924ADR059*
