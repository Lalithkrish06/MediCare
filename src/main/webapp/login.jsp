<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <title>MediCare - Login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
</head>
<body>
<div class="auth-wrapper">
    <div class="auth-card">
        <div class="logo-icon">🏥</div>
        <h2>MediCare</h2>
        <p class="subtitle">Login to your medical assistant account</p>

        <% if (request.getAttribute("error") != null) { %>
            <div class="alert alert-danger"><%= request.getAttribute("error") %></div>
        <% } %>
        <% if (request.getAttribute("info") != null) { %>
            <div class="alert alert-info"><%= request.getAttribute("info") %></div>
        <% } %>
        <% if (request.getParameter("registered") != null) { %>
            <div class="alert alert-success">✅ Registration successful! Please login.</div>
        <% } %>
        <% if (request.getParameter("logout") != null) { %>
            <div class="alert alert-info">You have been logged out.</div>
        <% } %>

        <form action="${pageContext.request.contextPath}/login" method="post">
            <div class="form-group">
                <label for="email">📧 Email Address</label>
                <input type="email" id="email" name="email"
                       placeholder="Enter your email" required
                       value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>"/>
            </div>
            <div class="form-group">
                <label for="password">🔒 Password</label>
                <input type="password" id="password" name="password"
                       placeholder="Enter your password" required/>
            </div>
            <button type="submit" class="btn-primary">Login & Verify via Email →</button>
        </form>

        <div class="auth-links" style="margin-top:20px;">
            Don't have an account? <a href="${pageContext.request.contextPath}/register">Register here</a>
        </div>
        <div class="auth-links" style="margin-top:8px;font-size:12px;color:#aaa;">
            After login, an OTP will be sent to your email for secure verification.
        </div>
    </div>
</div>
<footer>&copy; 2024 MediCare &mdash; Developed by LALITH KRISH</footer>
</body>
</html>

