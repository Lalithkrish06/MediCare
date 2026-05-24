<%@ page contentType="text/html;charset=UTF-8" session="true" %>
<%
    String pendingEmail = (String) session.getAttribute("pendingEmail");
    if (pendingEmail == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
    String maskedEmail = pendingEmail.replaceAll("(.).+(@.+)", "$1****$2");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <title>MediCare - OTP Verification</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
</head>
<body>
<div class="auth-wrapper">
    <div class="auth-card">
        <div class="logo-icon">📧</div>
        <h2>OTP Verification</h2>
        <p class="subtitle">
            A 6-digit code has been sent to<br/>
            <strong style="color:#1565c0;"><%= maskedEmail %></strong>
        </p>

        <% if (request.getAttribute("error") != null) { %>
            <div class="alert alert-danger"><%= request.getAttribute("error") %></div>
        <% } %>
        <% if (request.getAttribute("info") != null) { %>
            <div class="alert alert-info"><%= request.getAttribute("info") %></div>
        <% } %>

        <form action="${pageContext.request.contextPath}/verify-otp" method="post">
            <div class="form-group">
                <label>Enter OTP</label>
                <input type="text" name="otp" class="otp-input"
                       placeholder="_ _ _ _ _ _"
                       maxlength="6" minlength="6" pattern="[0-9]{6}"
                       required autocomplete="one-time-code"/>
            </div>
            <button type="submit" class="btn-primary">✅ Verify OTP</button>
        </form>

        <div class="otp-timer">
            OTP expires in: <span id="countdown">10:00</span>
        </div>

        <div class="auth-links" style="margin-top:20px;">
            <a href="${pageContext.request.contextPath}/login.jsp">← Back to Login</a>
        </div>
    </div>
</div>
<footer>&copy; 2024 MediCare &mdash; Developed by LALITH KRISH &nbsp;|&nbsp; 732924ADR059</footer>

<script>
// Countdown timer 10 minutes
let total = 10 * 60;
const el = document.getElementById('countdown');
const t = setInterval(() => {
    if (total <= 0) { clearInterval(t); el.textContent = 'Expired'; el.style.color='#e53935'; return; }
    const m = Math.floor(total / 60), s = total % 60;
    el.textContent = m + ':' + String(s).padStart(2, '0');
    total--;
}, 1000);
</script>
</body>
</html>
