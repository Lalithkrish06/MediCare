<%@ page contentType="text/html;charset=UTF-8" session="true" %>
<%@ page import="com.medicare.model.Medicine, java.util.List" %>
<%
    String userName = (String) session.getAttribute("userName");
    if (userName == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
    String symptom = (String) request.getAttribute("searchedSymptom");
    List<Medicine> medicines = (List<Medicine>) request.getAttribute("medicines");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <title>MediCare - Results for <%= symptom %></title>
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

<div class="results-container">

    <a href="${pageContext.request.contextPath}/home.jsp" class="back-btn">← Back to Search</a>

    <div class="results-header">
        <h2>💊 Medicine Recommendations for: <em><%= symptom %></em></h2>
        <p>Found <strong><%= medicines != null ? medicines.size() : 0 %></strong> recommended medicine(s) for your symptom.</p>
    </div>

    <% if (medicines == null || medicines.isEmpty()) { %>
        <div class="no-results">
            <div class="icon">🤷</div>
            <h3>No medicines found for "<%= symptom %>"</h3>
            <p>This symptom may not be in our database yet. Please consult a doctor.</p>
        </div>
    <% } else { %>
        <% for (Medicine med : medicines) { %>
            <div class="med-card">
                <h3>💊 <%= med.getMedicineName() %></h3>
                <p class="description"><%= med.getDescription() != null ? med.getDescription() : "" %></p>
                <div class="med-detail-grid">
                    <div class="med-detail-item">
                        <div class="detail-label">📋 Dosage</div>
                        <div class="detail-value"><%= med.getDosage() != null ? med.getDosage() : "As prescribed" %></div>
                    </div>
                    <div class="med-detail-item">
                        <div class="detail-label">⚠️ Side Effects</div>
                        <div class="detail-value"><%= med.getSideEffects() != null ? med.getSideEffects() : "None significant" %></div>
                    </div>
                    <div class="med-detail-item" style="grid-column: span 2;">
                        <div class="detail-label">🛡️ Precautions</div>
                        <div class="detail-value"><%= med.getPrecautions() != null ? med.getPrecautions() : "Follow doctor's advice" %></div>
                    </div>
                </div>
            </div>
        <% } %>
    <% } %>

    <div class="disclaimer">
        ⚠️ <strong>Disclaimer:</strong> This information is for general awareness only.
        Do NOT self-medicate. Always consult a licensed medical professional for diagnosis and treatment.
    </div>

</div>

<footer>&copy; 2024 MediCare &mdash; Developed by LALITH KRISH &nbsp;|&nbsp; 732924ADR059</footer>
</body>
</html>
