# 🏥 MediCare — Medical Symptom & Medicine Information System

> **A modern Java-based healthcare web application designed to provide symptom-based medicine information through secure authentication, OTP verification, structured medicine data, personalized search history, and a responsive user experience.**

<p align="center">
  <img src="https://img.shields.io/badge/License-MIT-green?style=for-the-badge" alt="MIT License">
  <img src="https://img.shields.io/badge/Java-17-orange?style=for-the-badge&logo=openjdk&logoColor=white" alt="Java 17">
  <img src="https://img.shields.io/badge/JSP%20%26%20Servlets-blue?style=for-the-badge" alt="JSP & Servlets">
  <img src="https://img.shields.io/badge/MySQL-8.0-4479A1?style=for-the-badge&logo=mysql&logoColor=white" alt="MySQL 8.0">
  <img src="https://img.shields.io/badge/Maven-Build-C71A36?style=for-the-badge&logo=apachemaven&logoColor=white" alt="Maven">
</p>

---

## 🌐 Platform Access

<div align="center">

<a href="https://lalimedinova.netlify.app/">
  <img src="https://img.shields.io/badge/⚡%20LIVE%20DEMO-Launch%20MediCare-1565C0?style=for-the-badge" alt="Launch MediCare">
</a>

</div>

---

# 📖 Overview

**MediCare** is a full-stack Java web application focused on making structured healthcare and medicine information easier to access through a clean and user-friendly interface.

The application combines **JSP, Servlets, JDBC, MySQL, authentication, OTP verification, and responsive frontend development** into one complete healthcare-oriented web system.

### Core User Journey

```text
🔐 Create Account
       ↓
📩 Verify Email with OTP
       ↓
🏠 Access Healthcare Workspace
       ↓
🩺 Select Symptoms
       ↓
🔎 Search Medicine Information
       ↓
💊 View Medicine Details
       ↓
📋 Review Dosage & Precautions
       ↓
🗂️ Maintain Search History
```

> ⚠️ **Medical Disclaimer:** MediCare is an educational/software project and is not a substitute for professional medical advice, diagnosis, or treatment. Medicine information should be verified with a qualified healthcare professional before use.

---

# 🎯 Project Vision

The goal of MediCare is to demonstrate how traditional Java web technologies can be combined with database-driven healthcare information workflows.

```text
Authentication
      +
OTP Verification
      +
Symptom Search
      +
Medicine Information
      +
Database Management
      +
Responsive UI
      ↓
Complete Healthcare Information System
```

---

# ✨ Key Features

## 🔐 Secure Authentication

MediCare provides a structured authentication workflow for registered users.

- 👤 User registration
- 🔑 User login
- 📩 OTP-based email verification
- 🔒 BCrypt password hashing
- 🛡️ Session-based authentication
- 🚪 Secure logout
- ⏱️ Session timeout support

---

## 📩 OTP Email Verification

New user accounts can be verified through an email-based OTP workflow.

```text
Registration
     ↓
OTP Generation
     ↓
Email Delivery
     ↓
OTP Verification
     ↓
Account Access
```

Gmail SMTP is used for real email OTP delivery when configured with the required credentials.

---

## 🩺 Symptom-Based Medicine Information

Users can select supported symptoms and retrieve corresponding medicine information stored in the application database.

### Example Symptoms

- 🤕 Headache
- 🌡️ Fever
- 🤧 Cold
- 😷 Cough
- 🔥 Acidity
- ➕ Other supported symptoms

The system uses the selected symptoms to query relevant records through the application's DAO and database layers.

---

## 💊 Medicine Information

For supported medicines, MediCare can present structured information such as:

| Information | Details |
|---|---|
| 💊 Medicine | Medicine name |
| 📏 Dosage | Available dosage information |
| ⚠️ Side Effects | Listed side effects |
| 🛡️ Precautions | Available precautions |

> **Important:** The displayed information is intended for educational purposes and should be verified by a qualified healthcare professional.

---

## 🗂️ Search History

The application can maintain user-associated search history through the database.

This provides a foundation for:

- Previous search tracking
- User-specific records
- Historical symptom searches
- Personalized application workflows

---

## 📱 Responsive User Interface

The application includes a modern web interface featuring:

- 🩺 Symptom selection chips
- 📋 User-friendly forms
- 📩 OTP verification interface
- 💊 Medicine result cards
- 📱 Responsive layouts
- 🎨 Clean healthcare-oriented design

---

# 🏗️ Application Architecture

MediCare follows a structured Java web application architecture separating presentation, request handling, business/data access, and persistence responsibilities.

```text
           👤 USER
              │
              ▼
      ┌───────────────┐
      │      JSP      │
      │ Presentation  │
      └───────┬───────┘
              │
              ▼
      ┌───────────────┐
      │   SERVLETS    │
      │ Request Logic │
      └───────┬───────┘
              │
              ▼
      ┌───────────────┐
      │      DAO      │
      │  Data Access  │
      └───────┬───────┘
              │
              ▼
      ┌───────────────┐
      │     JDBC      │
      │ Connectivity  │
      └───────┬───────┘
              │
              ▼
      ┌───────────────┐
      │     MySQL     │
      │   Database    │
      └───────────────┘
```

---

# 🧩 MVC-Style Application Flow

```text
┌─────────────────────┐
│      JSP View       │
│   User Interface    │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│       Servlet       │
│  Request Processing │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│         DAO         │
│ Database Operations │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│        MySQL        │
│  Persistent Storage │
└─────────────────────┘
```

This organization keeps presentation and database responsibilities separated, making the application easier to maintain and extend.

---

# 🛠️ Technology Stack

| Technology | Purpose |
|---|---|
| ☕ **Java 17** | Core application development |
| 🌐 **JSP** | Dynamic web page rendering |
| ⚙️ **Servlets** | Request handling and application logic |
| 🔗 **JDBC** | Java-to-MySQL database connectivity |
| 🗄️ **MySQL 8.0** | Persistent data storage |
| 📦 **Maven** | Dependency and build management |
| 🚀 **Jetty / Apache Tomcat** | Java web application server |
| 🔐 **BCrypt** | Password hashing |
| 📧 **Gmail SMTP** | OTP email delivery |
| 🎨 **HTML / CSS** | Frontend presentation |

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
        │           │
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

# 🔄 Application Workflow

```text
      ┌─────────────────────┐
      │    👤 User Visits   │
      │       MediCare      │
      └──────────┬──────────┘
                 │
                 ▼
      ┌─────────────────────┐
      │  🔐 Register/Login  │
      └──────────┬──────────┘
                 │
                 ▼
      ┌─────────────────────┐
      │    📩 OTP Verify    │
      └──────────┬──────────┘
                 │
                 ▼
      ┌─────────────────────┐
      │ 🩺 Symptom Selector │
      └──────────┬──────────┘
                 │
                 ▼
      ┌─────────────────────┐
      │    🔎 Search DAO    │
      └──────────┬──────────┘
                 │
                 ▼
      ┌─────────────────────┐
      │  🗄️ MySQL Database  │
      └──────────┬──────────┘
                 │
                 ▼
      ┌─────────────────────┐
      │   💊 Medicine Info  │
      │ Dosage/Precautions  │
      └─────────────────────┘
```

---

# 🚀 Getting Started

## 📋 Prerequisites

Before running MediCare, make sure the following are installed:

- ☕ **Java 17+**
- 📦 **Apache Maven**
- 🗄️ **MySQL 8.0+**
- 🌐 **Jetty or Apache Tomcat**
- 📧 **Gmail account with App Password** for real email OTP delivery

---

## 1️⃣ Clone the Repository

```bash
git clone https://github.com/Lalithkrish06/MediCare.git
```

> If your actual GitHub repository uses a different name, replace `MediCare` with the correct repository name.

---

## 2️⃣ Navigate to the Project

```bash
cd MediCare
```

---

## 3️⃣ Configure MySQL

Create the required database and execute the provided SQL schema:

```text
database/schema.sql
```

Then configure the application's database connection according to the project's environment/configuration.

---

## 4️⃣ Configure Email OTP

For real email OTP functionality, configure the Gmail SMTP credentials using a Gmail App Password.

> Never commit real passwords, API keys, or SMTP credentials to GitHub.

---

## 5️⃣ Build the Application

```bash
mvn clean package
```

The generated WAR file can then be deployed to the configured Java web server.

---

# 📸 Project Showcase

## 🔐 Secure Login

<div align="center">

<img width="1892" height="1008" alt="MediCare Secure Login" src="https://github.com/user-attachments/assets/f85e6939-c128-4bb0-9de1-2068bea5874e" />

</div>

---

## 📩 OTP Verification

<div align="center">

<img width="1870" height="986" alt="MediCare OTP Verification" src="https://github.com/user-attachments/assets/86e58aa8-b6c2-4c65-9881-d9df9666ea1f" />

</div>

---

## 🏠 Healthcare Dashboard

<div align="center">

<img width="1881" height="1007" alt="MediCare Healthcare Dashboard" src="https://github.com/user-attachments/assets/3e56d098-1544-4976-bcfa-f766f2c0843b" />

</div>

---

## 💊 Medicine Information & Recommendations

<div align="center">

<img width="1896" height="1006" alt="MediCare Medicine Information" src="https://github.com/user-attachments/assets/7c6f6c80-779b-42e9-9f6d-4a676098fb23" />

</div>

---

# 🎯 Project Highlights

| Area | Implementation |
|---|---|
| ☕ Java Development | Java 17 web application |
| 🌐 Web Architecture | JSP + Servlets |
| 🗄️ Database | MySQL + JDBC |
| 🔐 Authentication | Login + registration + sessions |
| 📩 Verification | Email OTP workflow |
| 🔒 Security | BCrypt password hashing |
| 💊 Healthcare | Symptom-based medicine information |
| 🗂️ Data Management | User/search records |
| 📦 Build System | Maven |
| 🚀 Deployment | WAR-based Java web application |

---

# 🧠 What I Learned

This project provided practical experience in:

- Java web application development
- JSP and Servlet architecture
- MVC-style application organization
- JDBC and MySQL integration
- Authentication workflows
- OTP-based email verification
- Password hashing
- Session management
- CRUD and database operations
- DAO design
- Maven project management
- WAR packaging and deployment
- Responsive frontend development
- Environment-based configuration

---

# 💼 Real-World Concepts Demonstrated

MediCare demonstrates how enterprise-style Java technologies can be used to build a structured database-driven web application.

### Key Engineering Concepts

```text
User Authentication
        +
Session Management
        +
Email Verification
        +
DAO Architecture
        +
Database Integration
        +
Web Request Handling
        +
Responsive UI
        ↓
Complete Java Web Application
```

---

# 🚀 Future Roadmap

The platform can be extended with additional healthcare-oriented capabilities.

### 🤖 Intelligent Features

- AI-assisted symptom analysis
- Medical information chatbot with safety guardrails
- Advanced medicine search
- Intelligent information retrieval

### 🩺 Healthcare Workflows

- Doctor consultation integration
- Appointment scheduling
- Personalized health dashboards
- Medication reminders

### 📄 Document Management

- Prescription/document management
- Medical report organization
- Structured health records

### ☁️ Platform Improvements

- Cloud deployment
- Improved production security
- Advanced monitoring
- Scalable backend architecture

---

# 🎓 Academic & Technical Value

MediCare brings together multiple important software engineering concepts in a single project:

**Java + JSP + Servlets + JDBC + MySQL + Authentication + OTP + Database Design + Responsive UI**

It provides practical experience in building a complete web application using the Java ecosystem.

---

# 🔐 Security Considerations

The project demonstrates several security-related concepts:

- 🔑 Password hashing with BCrypt
- 🔐 Session-based authentication
- 📩 OTP-based account verification
- 🚪 Secure logout
- 🔒 Environment-based credential configuration

> Production deployment should include additional security hardening, secure secret management, HTTPS, input validation, authorization controls, dependency updates, and comprehensive security testing.

---

# ⚠️ Medical Safety Notice

**MediCare is an educational software project.**

It does **not** replace:

- Professional medical diagnosis
- Doctor consultation
- Prescribed treatment
- Emergency medical services

Medicine information should always be verified with a qualified healthcare professional before making healthcare or medication decisions.

---

# 🌐 Project Links

<div align="center">

<a href="https://lalimedinova.netlify.app/">
  <img src="https://img.shields.io/badge/🚀%20Live%20Demo-MediCare-1565C0?style=for-the-badge" alt="Live Demo">
</a>
<a href="https://lalithkrish.dev/">
  <img src="https://img.shields.io/badge/💼%20Developer%20Portfolio-4285F4?style=for-the-badge" alt="Portfolio">
</a>
<a href="https://github.com/Lalithkrish06">
  <img src="https://img.shields.io/badge/🐙%20GitHub%20Profile-181717?style=for-the-badge&logo=github&logoColor=white" alt="GitHub">
</a>

</div>

---

# 🐛 Issues & Suggestions

Have you found a bug, encountered an issue, or have an idea to improve MediCare?

Your feedback is welcome! 🚀

If you discover a problem or have a feature suggestion, feel free to open an issue on the GitHub repository.

<div align="center">

### 💬 Contribute • Report • Improve

<a href="https://github.com/Lalithkrish06">
  <img src="https://img.shields.io/badge/🐛%20Report%20an%20Issue-EA4335?style=for-the-badge" alt="Report Issue">
</a>

<br><br>

**Have an idea? → Open an issue and help make MediCare better! 🚀**

</div>

---

# 📄 License

This project is licensed under the **MIT License**.

See the `LICENSE` file for more information.

---

# 👨‍💻 Developer

<div align="center">

### ⚡ Lalith Krish

**AI & Data Science Engineer**

*Building intelligent systems • AI applications • Geospatial intelligence • Data-driven solutions*

<br>

<a href="mailto:lalithkrish2006@gmail.com">
  <img src="https://img.shields.io/badge/📧%20Email-lalithkrish2006%40gmail.com-EA4335?style=for-the-badge" alt="Email">
</a>
<a href="https://www.linkedin.com/in/lalithkrish-data/">
  <img src="https://img.shields.io/badge/LinkedIn-Lalith%20Krish-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white" alt="LinkedIn">
</a>
<a href="https://github.com/Lalithkrish06">
  <img src="https://img.shields.io/badge/GitHub-Lalithkrish06-181717?style=for-the-badge&logo=github&logoColor=white" alt="GitHub">
</a>
<a href="https://lalithkrish.dev/">
  <img src="https://img.shields.io/badge/🌐%20Portfolio-lalithkrish.dev-000000?style=for-the-badge" alt="Portfolio">
</a>

</div>

---

# ⭐ Support the Project

If you find **MediCare** useful or interesting:

⭐ Star the repository  
🍴 Fork the project  
🐛 Report issues  
💡 Suggest improvements  
📢 Share the project  

Your support helps improve the project. 🚀

---

<div align="center">

### 🏥 MediCare

**Secure. Informative. Accessible.**

Built with ❤️ using **Java, JSP, Servlets, JDBC & MySQL**.

⭐ **Thanks for visiting MediCare!** ⭐

</div>
