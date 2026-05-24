<%@ page contentType="text/html;charset=UTF-8" session="true" %>
<%@ page import="com.medicare.dao.MedicineDAO, java.util.List" %>
<%
    String userName = (String) session.getAttribute("userName");
    if (userName == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
    MedicineDAO dao = new MedicineDAO();
    List<String> symptoms = dao.getAllSymptoms();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <title>MediCare - Home</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
</head>
<body>

<nav class="navbar">
    <div class="brand">🏥 Medi<span>Care</span></div>
    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/home.jsp">🏠 Home</a>
        <a href="${pageContext.request.contextPath}/logout" class="logout">🚪 Logout</a>
    </div>
</nav>

<div class="home-container">

    <div class="welcome-banner">
        <h1>👋 Welcome, <%= userName %>!</h1>
        <p>Search for your symptoms and get medicine recommendations instantly.</p>
    </div>

    <!-- Stats Row -->
    <div class="stats-row" style="margin-bottom:28px;">
        <div class="stat-card">
            <div class="stat-icon">💊</div>
            <div class="stat-num">20+</div>
            <div class="stat-label">Medicines Available</div>
        </div>
        <div class="stat-card">
            <div class="stat-icon">🩺</div>
            <div class="stat-num">25</div>
            <div class="stat-label">Symptoms Covered</div>
        </div>
        <div class="stat-card">
            <div class="stat-icon">🔒</div>
            <div class="stat-num">OTP</div>
            <div class="stat-label">Secure Login</div>
        </div>
        <div class="stat-card">
            <div class="stat-icon">⚡</div>
            <div class="stat-num">Fast</div>
            <div class="stat-label">Instant Results</div>
        </div>
    </div>

    <!-- Search Form -->
    <div class="search-card">
        <h3>🔍 Search by Symptom</h3>
        <form action="${pageContext.request.contextPath}/search-medicine" method="post">
            <div class="search-row">
                <select name="symptom" id="symptomSelect" required>
                    <option value="">-- Select a Symptom --</option>
                    <% for (String s : symptoms) { %>
                        <option value="<%= s %>"><%= s %></option>
                    <% } %>
                </select>
                <button type="submit">Get Medicine 💊</button>
            </div>
        </form>

        <div style="margin-top:18px;">
            <p class="chips-label">🔥 Common symptoms (click to select):</p>
            <div class="chips">
                <% String[] common = {"Headache","Fever","Cold","Cough","Acidity","Body Pain","Allergy","Sore Throat"}; %>
                <% for (String c : common) { %>
                    <span class="chip" onclick="setSymptom('<%= c %>')"><%= c %></span>
                <% } %>
            </div>
        </div>
    </div>

    <!-- Info Card -->
    <div class="disclaimer">
        ⚠️ <strong>Medical Disclaimer:</strong> The medicine recommendations provided by MediCare are for
        <strong>general informational purposes only</strong> and do not constitute medical advice.
        Always consult a qualified healthcare professional before taking any medication.
    </div>

</div>

<footer>&copy; 2024 MediCare &mdash; Developed by LALITH KRISH &nbsp;|&nbsp; 732924ADR059</footer>

<script>
function setSymptom(name) {
    const sel = document.getElementById('symptomSelect');
    for (let i = 0; i < sel.options.length; i++) {
        if (sel.options[i].value === name) {
            sel.selectedIndex = i;
            break;
        }
    }
}
</script>
</body>
</html>
