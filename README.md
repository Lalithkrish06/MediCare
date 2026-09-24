# 🏥 MediCare — Medical Symptom & Medicine Information System

<p align="center">
  <b>Smart Symptom-Based Medicine Information Platform</b>
  <br>
  <i>Built with Java, JSP, Servlets, JDBC & MySQL</i>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Java-17-orange?style=for-the-badge&logo=openjdk" alt="Java 17">
  <img src="https://img.shields.io/badge/JSP-%26-Servlets-blue?style=for-the-badge" alt="JSP and Servlets">
  <img src="https://img.shields.io/badge/MySQL-8.0-blue?style=for-the-badge&logo=mysql" alt="MySQL 8.0">
  <img src="https://img.shields.io/badge/Maven-Build-red?style=for-the-badge&logo=apachemaven" alt="Maven">
</p>

---

### 🏥 MediNova

**Modern healthcare web application for medical information and assistance.**

🌐 **Live Demo:** 

👉 https://lalimedinova.netlify.app/

---

## 📌 Overview



The application uses **JSP and Servlets** for the web layer, **JDBC** for database connectivity, and **MySQL** for persistent data storage.

> ⚠️ **Medical Disclaimer:** MediCare is an educational/software project and is not a substitute for professional medical advice, diagnosis, or treatment. Medicine information should be verified with a qualified healthcare professional before use.

---

# ✨ Key Features

### 🔐 Secure Authentication

* User registration and login
* OTP-based email verification
* BCrypt password hashing
* Session-based authentication
* Secure logout and session timeout

### 💊 Symptom-Based Medicine Information

Users can select symptoms such as:

* Headache
* Fever
* Cold
* Cough
* Acidity
* And other supported symptoms

The system retrieves corresponding medicine information from the MySQL database.

### 📋 Medicine Details

For supported medicines, the application can display:

* 💊 Medicine name
* 📏 Dosage information
* ⚠️ Side effects
* 🛡️ Precautions

### 🗂️ Search History

User searches can be tracked in the MySQL database, allowing the application to maintain a history associated with the user's session/account.

### 📱 Responsive UI

A clean and modern interface with:

* Symptom selection chips
* Responsive layouts
* User-friendly forms
* OTP verification interface
* Medicine result cards

---

# 🛠️ Technology Stack

| Technology                   | Purpose                              |
| ---------------------------- | ------------------------------------ |
| ☕ **Java 17**                | Core application development         |
| 🌐 **JSP**                   | Dynamic web pages                    |
| ⚙️ **Servlets**              | Request handling & application logic |
| 🔗 **JDBC**                  | Database connectivity                |
| 🗄️ **MySQL 8.0**            | Data storage                         |
| 📦 **Maven**                 | Dependency & build management        |
| 🚀 **Jetty / Apache Tomcat** | Web application server               |
| 🔐 **BCrypt**                | Password hashing                     |
| 📧 **Gmail SMTP**            | OTP email delivery                   |

---

# 📂 Project Architecture

```text
MediCare-main/
│
├── pom.xml
├── run.bat
├── build.bat
│
├── database/
│   └── schema.sql
│
└── src/
    └── main/
        ├── java/
        │   └── com/
        │       └── medicare/
        │           ├── dao/
        │           │   ├── UserDAO.java
        │           │   └── MedicineDAO.java
        │           │
        │           ├── model/
        │           │   ├── User.java
        │           │   └── Medicine.java
        │           │
        │           ├── servlet/
        │           │   ├── LoginServlet.java
        │           │   ├── RegisterServlet.java
        │           │   ├── OTPServlet.java
        │           │   ├── SearchServlet.java
        │           │   └── LogoutServlet.java
        │           │
        │           └── util/
        │               ├── DBConnection.java
        │               └── EmailUtil.java
        │
        └── webapp/
            ├── WEB-INF/
            │   └── web.xml
            │
            ├── css/
            │   └── style.css
            │
            ├── index.jsp
            ├── login.jsp
            ├── register.jsp
            ├── verify-otp.jsp
            ├── home.jsp
            └── results.jsp
```

---

# 🚀 Getting Started

## Prerequisites

Before running MediCare, install:

* ☕ Java 17+
* 📦 Maven
* 🗄️ MySQL 8.0+
* 🌐 Jetty or Apache Tomcat
* 📧 Gmail account with App Password *(only required for real email OTP)*
---

# 🔄 Application Flow

```text
                 ┌─────────────────┐
                 │   User Visits   │
                 │    MediCare     │
                 └────────┬────────┘
                          │
                          ▼
                 ┌─────────────────┐
                 │ Register / Login│
                 └────────┬────────┘
                          │
                          ▼
                 ┌─────────────────┐
                 │   OTP Verify    │
                 └────────┬────────┘
                          │
                          ▼
                 ┌─────────────────┐
                 │ Symptom Selector│
                 └────────┬────────┘
                          │
                          ▼
                 ┌─────────────────┐
                 │   Search DAO    │
                 └────────┬────────┘
                          │
                          ▼
                 ┌─────────────────┐
                 │  MySQL Database │
                 └────────┬────────┘
                          │
                          ▼
                 ┌─────────────────┐
                 │ Medicine Info   │
                 │ Dosage / Safety │
                 └─────────────────┘
```

---

# 🧠 What I Learned

This project provided practical experience in:

* Java web application development
* JSP & Servlet architecture
* MVC-style application organization
* JDBC and MySQL integration
* Authentication and OTP workflows
* Password hashing
* Session management
* CRUD/database operations
* Maven project management
* WAR deployment
* Responsive frontend development
* Environment-based configuration

---

# 📈 Future Improvements

Possible future enhancements include:

* 🤖 AI-assisted symptom analysis
* 🩺 Doctor consultation integration
* 📅 Appointment scheduling
* 💬 Medical chatbot with safety guardrails
* 📊 Personalized health dashboards
* 🔔 Medication reminders
* 🧾 Prescription/document management
* 🔍 Advanced medicine search and filtering
* ☁️ Cloud deployment
* 🔐 Enhanced production security

---

# 🎯 Project Goals

The main goals of MediCare are to demonstrate how a Java-based web application can combine:

**Authentication + Database Management + Symptom Search + Medicine Information + Responsive UI**

into one complete application.

---

## 🏥 MediCare — Medical Symptom & Medicine Information System

> A Java-based healthcare web application for symptom-based medicine information.

<p align="center">
  <a href="https://lalimedinova.netlify.app/">
    <img src="https://img.shields.io/badge/🚀%20LIVE%20DEMO-Launch%20MediCare-1565C0?style=for-the-badge" alt="Launch MediCare">
  </a>
</p>

---

## 📸 Project Screenshots

### 🔐 Secure Login
<p align="center">
  <img width="1892" height="1008" alt="Screenshot 2026-09-15 173239" src="https://github.com/user-attachments/assets/f85e6939-c128-4bb0-9de1-2068bea5874e" />

</p>

---

### 📩 OTP Verification
<p align="center">
  <img width="1870" height="986" alt="Screenshot 2026-09-15 173256" src="https://github.com/user-attachments/assets/86e58aa8-b6c2-4c65-9881-d9df9666ea1f" />

</p>

---

### 🏠 Healthcare Dashboard
<p align="center">
  <img width="1881" height="1007" alt="Screenshot 2026-09-15 173336" src="https://github.com/user-attachments/assets/3e56d098-1544-4976-bcfa-f766f2c0843b" />

</p>

---

### 💊 Medicine Information & Recommendations
<p align="center">
  <img width="1896" height="1006" alt="Screenshot 2026-09-15 173358" src="https://github.com/user-attachments/assets/7c6f6c80-779b-42e9-9f6d-4a676098fb23" />

</p>

---

# 👨‍💻 Author

### LALITH KRISH

**Java Developer | Data Analytics Enthusiast | Full-Stack Project Builder**

---

## ⭐ Support

If you find this project useful or interesting, consider giving the repository a ⭐ on GitHub.

---

> **MediCare — Making healthcare information easier to access through technology.**
