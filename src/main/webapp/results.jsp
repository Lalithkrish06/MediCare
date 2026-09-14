<%@ page contentType="text/html;charset=UTF-8" session="true" %>
<%@ page import="com.medicare.model.Medicine, com.medicare.dao.MedicineDAO, java.util.List" %>
<%
    String userName = (String) session.getAttribute("userName");
    if (userName == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
    String symptom = (String) request.getAttribute("searchedSymptom");
    List<Medicine> medicines = (List<Medicine>) request.getAttribute("medicines");
    MedicineDAO dao = new MedicineDAO();
    List<String> allSymptoms = dao.getAllSymptoms();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <title>MediCare - Recommendations for <%= symptom != null ? symptom : "Symptom" %></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
    <style>
        .med-card {
            border-left: 6px solid #1565c0;
            background: #fff;
            margin-bottom: 24px;
            padding: 26px 30px;
            border-radius: 14px;
            box-shadow: 0 4px 18px rgba(0,0,0,0.06);
        }
        .med-title-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1.5px solid #eef2f7;
            padding-bottom: 12px;
            margin-bottom: 14px;
        }
        .med-badge {
            background: #e3f2fd;
            color: #1565c0;
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 700;
            letter-spacing: 0.5px;
        }
        .med-instructions-box {
            background: #f0f7ff;
            border-radius: 8px;
            border: 1px dashed #90caf9;
            padding: 12px 16px;
            margin-top: 14px;
            font-size: 13px;
            color: #0d47a1;
        }
        .home-care-card {
            background: #fff;
            border-radius: 14px;
            padding: 24px 28px;
            margin-top: 24px;
            box-shadow: 0 4px 16px rgba(0,0,0,0.06);
            border-top: 4px solid #43a047;
        }
        .home-care-card h3 {
            color: #2e7d32;
            font-size: 17px;
            margin-bottom: 12px;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        .home-care-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        .home-care-list li {
            font-size: 13.5px;
            color: #444;
            line-height: 1.6;
            margin-bottom: 8px;
            padding-left: 22px;
            position: relative;
        }
        .home-care-list li::before {
            content: "🌿";
            position: absolute;
            left: 0;
            font-size: 12px;
        }
        .quick-again-card {
            background: #fff;
            border-radius: 14px;
            padding: 20px 24px;
            margin-top: 24px;
            box-shadow: 0 4px 16px rgba(0,0,0,0.06);
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 16px;
            flex-wrap: wrap;
        }
        .quick-again-card select {
            flex: 1;
            min-width: 220px;
            padding: 10px 14px;
            border: 1.5px solid #ccc;
            border-radius: 8px;
            font-size: 14px;
        }
        .quick-again-card button {
            padding: 10px 22px;
            background: #1565c0;
            color: #fff;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
        }
        .quick-again-card button:hover {
            background: #0d47a1;
        }
    </style>
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

    <a href="${pageContext.request.contextPath}/home.jsp" class="back-btn">← Back to Symptom Search</a>

    <div class="results-header">
        <h2>💊 Recommended Tablets & Medicines for: <em style="color:#0d47a1;"><%= symptom %></em></h2>
        <p>Found <strong><%= medicines != null ? medicines.size() : 0 %></strong> clinically recognized tablet/medicine option(s) for this condition.</p>
    </div>

    <% if (medicines == null || medicines.isEmpty()) { %>
        <div class="no-results">
            <div class="icon">🩺</div>
            <h3>No specific tablets found for "<%= symptom %>"</h3>
            <p>This condition may require personalized clinical evaluation, laboratory tests, or prescription from a physician.</p>
            <div style="margin-top:20px;">
                <a href="${pageContext.request.contextPath}/home.jsp" class="btn-primary" style="display:inline-block;max-width:240px;text-decoration:none;text-align:center;">← Try Another Symptom</a>
            </div>
        </div>
    <% } else { %>
        <% for (Medicine med : medicines) { %>
            <div class="med-card">
                <div class="med-title-row">
                    <h3>💊 <%= med.getMedicineName() %></h3>
                    <span class="med-badge">VERIFIED MEDICATION</span>
                </div>
                
                <p class="description"><%= med.getDescription() != null ? med.getDescription() : "Standard pharmaceutical formulation for this symptom." %></p>
                
                <div class="med-detail-grid">
                    <div class="med-detail-item">
                        <div class="detail-label">📋 Dosage &amp; Frequency</div>
                        <div class="detail-value"><strong><%= med.getDosage() != null ? med.getDosage() : "As directed by physician" %></strong></div>
                    </div>
                    <div class="med-detail-item">
                        <div class="detail-label">⚠️ Common Side Effects</div>
                        <div class="detail-value"><%= med.getSideEffects() != null ? med.getSideEffects() : "None significant under normal dosage" %></div>
                    </div>
                    <div class="med-detail-item" style="grid-column: span 2;">
                        <div class="detail-label">🛡️ Safety Precautions &amp; Contraindications</div>
                        <div class="detail-value"><%= med.getPrecautions() != null ? med.getPrecautions() : "Follow physician instructions. Avoid self-escalation of dosage." %></div>
                    </div>
                </div>

                <div class="med-instructions-box">
                    💡 <strong>Tablet Administration Instructions:</strong>
                    Swallow tablet whole with a full glass of water. Do not crush, chew, or break sustained-release capsules. 
                    If gastrointestinal irritation occurs, take immediately after meals. Store in a cool, dry place away from direct sunlight.
                </div>
            </div>
        <% } %>

        <!-- Home Care & Supportive Instructions -->
        <div class="home-care-card">
            <h3>🌿 Supportive Home Care &amp; Recovery Guidance for <%= symptom %></h3>
            <ul class="home-care-list">
                <li><strong>Adequate Hydration:</strong> Drink at least 2.5 to 3 liters of fluids daily (warm water, broths, electrolyte drinks) to support recovery.</li>
                <li><strong>Rest &amp; Sleep:</strong> Ensure 7–8 hours of sound sleep; physical rest is essential for tissue recovery and immune defense.</li>
                <li><strong>Dietary Recommendation:</strong> Eat light, freshly prepared, nutrient-dense meals. Avoid excessively spicy, oily, or processed foods during recovery.</li>
                <li><strong>Monitor Symptoms:</strong> Note any changes in symptom severity, body temperature, or new complications over 48–72 hours.</li>
                <li><strong>Emergency Threshold:</strong> If your condition worsens or high fever, chest pain, or breathlessness develops, visit the nearest emergency room immediately.</li>
            </ul>
        </div>

        <!-- Quick Switcher Bar -->
        <div class="quick-again-card">
            <div>
                <strong>Check Another Symptom:</strong>
                <div style="font-size:12px;color:#777;">Search another condition instantly without returning to home.</div>
            </div>
            <form action="${pageContext.request.contextPath}/search-medicine" method="post" style="display:flex;gap:10px;align-items:center;flex:1;max-width:500px;">
                <select name="symptom" required>
                    <option value="">-- Select Another Symptom --</option>
                    <% for (String s : allSymptoms) { %>
                        <option value="<%= s %>" <%= s.equalsIgnoreCase(symptom) ? "selected" : "" %>><%= s %></option>
                    <% } %>
                </select>
                <button type="submit">View Tablets →</button>
            </form>
        </div>
    <% } %>

    <div class="disclaimer">
        ⚠️ <strong>Important Medical Safety Notice:</strong> The tablet recommendations and instructions shown here are for
        <strong>educational and informational guidance only</strong>. Always read the physical medicine package insert.
        Consult a certified healthcare provider or registered pharmacist before starting any new medication, particularly if pregnant, nursing, elderly, or managing chronic conditions.
    </div>

</div>

<footer>&copy; 2024 MediCare &mdash; Developed by LALITH KRISH</footer>
</body>
</html>
