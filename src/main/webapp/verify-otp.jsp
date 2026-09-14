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
        <% if (!com.medicare.util.EmailUtil.wasLastEmailSentSuccessfully() && com.medicare.util.EmailUtil.getLastGeneratedOtp() != null) { %>
            <div style="background:#fff3cd;color:#856404;border:1px solid #ffeeba;border-radius:8px;padding:12px;margin-bottom:16px;font-size:13px;text-align:center;">
                ⚠️ <strong>Gmail SMTP not configured yet:</strong><br/>
                Your code is: <strong id="codeValue" style="color:#0d47a1;font-size:17px;letter-spacing:2px;"><%= com.medicare.util.EmailUtil.getLastGeneratedOtp() %></strong><br/>
                <button type="button" onclick="autoFillCode()" style="margin-top:8px;background:#1565c0;color:#fff;border:none;border-radius:6px;padding:6px 14px;font-size:12px;cursor:pointer;font-weight:600;">⚡ Click to Auto-Fill Code</button>
            </div>
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
<footer>&copy; 2024 MediCare &mdash; Developed by LALITH KRISH</footer>

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

function autoFillCode() {
    const codeEl = document.getElementById('codeValue');
    if (codeEl) {
        const code = codeEl.textContent.trim();
        const input = document.querySelector('input[name="otp"]');
        if (input) {
            input.value = code;
            input.focus();
        }
    }
}
</script>
</body>
</html>

