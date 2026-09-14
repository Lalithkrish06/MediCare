<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <title>MediCare - Register</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
</head>
<body>
<div class="auth-wrapper">
    <div class="auth-card">
        <div class="logo-icon">🏥</div>
        <h2>Create Account</h2>
        <p class="subtitle">Join MediCare – your personal medical assistant</p>

        <% if (request.getAttribute("error") != null) { %>
            <div class="alert alert-danger"><%= request.getAttribute("error") %></div>
        <% } %>

        <form action="${pageContext.request.contextPath}/register" method="post">
            <div class="form-group">
                <label>👤 Full Name</label>
                <input type="text" name="fullName" placeholder="Enter your full name" required maxlength="100"/>
            </div>
            <div class="form-group">
                <label>📧 Email Address</label>
                <input type="email" name="email" placeholder="Enter your email" required/>
            </div>
            <div class="form-group">
                <label>🔒 Password</label>
                <input type="password" name="password" placeholder="Minimum 6 characters" required minlength="6"/>
            </div>
            <div class="form-group">
                <label>🔒 Confirm Password</label>
                <input type="password" name="confirmPassword" placeholder="Re-enter password" required/>
            </div>
            <button type="submit" class="btn-primary">Register & Verify Email →</button>
        </form>

        <div class="auth-links" style="margin-top:20px;">
            Already have an account? <a href="${pageContext.request.contextPath}/login">Login here</a>
        </div>
    </div>
</div>
<footer>&copy; 2024 MediCare &mdash; Developed by LALITH KRISH</footer>
</body>
</html>

