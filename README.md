# 🏥 MediCare — Medical Symptom & Medicine Recommendation System

> **Developed by LALITH KRISH**  
> **Department:** Artificial Intelligence & Data Science  
> **Technology Stack:** Java | JSP | Servlets | JDBC | MySQL | Maven | Apache Tomcat

---

# 📌 Project Overview

MediCare is a secure full-stack healthcare web application designed to provide users with symptom-based medicine recommendations through a clean and responsive interface. The system includes OTP-based authentication, secure password handling, session management, and an intelligent medicine recommendation module.

The application allows users to register, verify accounts through email OTP, securely log in, search symptoms, and receive medicine suggestions with dosage instructions, side effects, and precautions.

---

# 🚀 Key Features

- 🔐 OTP-based User Authentication
- 🔒 Secure Password Encryption using BCrypt
- 💊 Symptom-based Medicine Recommendation
- 📧 Email Verification using Gmail SMTP
- 🗂️ Search History Tracking
- ⏳ Session Timeout Management
- 📱 Responsive User Interface
- 🛡️ Secure Login & Logout System
- ⚡ Full CRUD Database Integration

---

# 🛠️ Technologies Used

| Category | Technology |
|---|---|
| Frontend | JSP, HTML5, CSS3 |
| Backend | Java Servlets |
| Database | MySQL 8.0 |
| Connectivity | JDBC |
| Build Tool | Apache Maven |
| Server | Apache Tomcat 9 |
| Authentication | OTP + BCrypt |
| Email Service | JavaMail API |

---

# 📂 Project Structure

```text
MediCare/
├── pom.xml
├── database/
│   └── schema.sql
├── screenshots/
│   ├── login.png
│   ├── register.png
│   └── dashboard.png
├── src/main/
│   ├── java/com/medicare/
│   │   ├── dao/
│   │   ├── model/
│   │   ├── servlet/
│   │   └── util/
│   └── webapp/
│       ├── css/
│       ├── WEB-INF/
│       ├── index.jsp
│       ├── login.jsp
│       ├── register.jsp
│       ├── home.jsp
│       └── results.jsp

