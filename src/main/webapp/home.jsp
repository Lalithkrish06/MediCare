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
    <title>MediCare - Medical Symptom & Tablet Recommender</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
    <style>
        /* Modern Healthcare Extensions */
        .category-tabs {
            display: flex;
            gap: 10px;
            overflow-x: auto;
            padding-bottom: 12px;
            margin-bottom: 20px;
        }
        .cat-btn {
            background: #fff;
            border: 1.5px solid #bbdefb;
            color: #1565c0;
            padding: 8px 16px;
            border-radius: 24px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            white-space: nowrap;
            transition: all 0.2s;
        }
        .cat-btn:hover, .cat-btn.active {
            background: #1565c0;
            color: #fff;
            border-color: #1565c0;
        }
        .instruction-section {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-top: 28px;
        }
        @media (max-width: 768px) {
            .instruction-section { grid-template-columns: 1fr; }
        }
        .guideline-card {
            background: #fff;
            border-radius: 14px;
            padding: 24px;
            box-shadow: 0 4px 16px rgba(0,0,0,0.06);
            border-top: 4px solid #1565c0;
        }
        .guideline-card.emergency {
            border-top: 4px solid #e53935;
        }
        .guideline-card h4 {
            font-size: 16px;
            margin-bottom: 14px;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        .guideline-card.emergency h4 {
            color: #c62828;
        }
        .guideline-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        .guideline-list li {
            font-size: 13px;
            line-height: 1.6;
            margin-bottom: 10px;
            padding-left: 20px;
            position: relative;
            color: #444;
        }
        .guideline-list li::before {
            content: "✓";
            position: absolute;
            left: 0;
            color: #2e7d32;
            font-weight: bold;
        }
        .guideline-card.emergency .guideline-list li::before {
            content: "⚠";
            color: #e53935;
        }
        .search-helper-text {
            font-size: 12px;
            color: #666;
            margin-top: 6px;
        }
        .quick-filter-input {
            width: 100%;
            padding: 11px 16px;
            border: 1.5px solid #90caf9;
            border-radius: 8px;
            font-size: 14px;
            margin-bottom: 14px;
            outline: none;
            background: #fbfdff;
        }
        .quick-filter-input:focus {
            border-color: #1565c0;
            background: #fff;
        }
        .badge-count {
            background: rgba(255,255,255,0.25);
            padding: 2px 8px;
            border-radius: 12px;
            font-size: 12px;
            margin-left: 6px;
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

<div class="home-container">

    <div class="welcome-banner">
        <h1>👋 Welcome, <%= userName %>!</h1>
        <p>Your intelligent healthcare assistant. Select or search from 55+ symptoms to receive recommended tablets, dosage instructions, precautions, and side effects.</p>
    </div>

    <!-- Stats Row -->
    <div class="stats-row" style="margin-bottom:28px;">
        <div class="stat-card">
            <div class="stat-icon">💊</div>
            <div class="stat-num">44+</div>
            <div class="stat-label">Verified Tablets & Medicines</div>
        </div>
        <div class="stat-card">
            <div class="stat-icon">🩺</div>
            <div class="stat-num"><%= symptoms.size() %></div>
            <div class="stat-label">Symptom Conditions</div>
        </div>
        <div class="stat-card">
            <div class="stat-icon">📋</div>
            <div class="stat-num">Dosage</div>
            <div class="stat-label">Precautions & Timing</div>
        </div>
        <div class="stat-card">
            <div class="stat-icon">🔒</div>
            <div class="stat-num">Secure</div>
            <div class="stat-label">OTP Authentication</div>
        </div>
    </div>

    <!-- Symptom Category Filter Tabs -->
    <div class="category-tabs">
        <button type="button" class="cat-btn active" onclick="filterCategory('all', this)">🌐 All Symptoms</button>
        <button type="button" class="cat-btn" onclick="filterCategory('respiratory', this)">🫁 Respiratory & Cold</button>
        <button type="button" class="cat-btn" onclick="filterCategory('digestive', this)">🍽️ Digestive & Gut</button>
        <button type="button" class="cat-btn" onclick="filterCategory('pain', this)">🧠 Head & Body Pain</button>
        <button type="button" class="cat-btn" onclick="filterCategory('skin', this)">🧴 Skin & Allergy</button>
        <button type="button" class="cat-btn" onclick="filterCategory('ent', this)">👁️ Eyes, Ears & Teeth</button>
        <button type="button" class="cat-btn" onclick="filterCategory('general', this)">⚡ Lifestyle & Chronic</button>
    </div>

    <!-- Search Form -->
    <div class="search-card">
        <h3>🔍 Search Symptom for Tablet Recommendation</h3>

        <!-- Quick filter / search box -->
        <input type="text" id="filterInput" class="quick-filter-input"
               placeholder="🔎 Type to search any symptom (e.g. Headache, Cough, Fever, Acidity, Migraine)..."
               onkeyup="filterDropdown()"/>

        <form action="${pageContext.request.contextPath}/search-medicine" method="post">
            <div class="search-row">
                <select name="symptom" id="symptomSelect" required size="1">
                    <option value="">-- Choose or Select a Symptom (<%= symptoms.size() %> Available) --</option>
                    <% for (String s : symptoms) { %>
                        <option value="<%= s %>"><%= s %></option>
                    <% } %>
                </select>
                <button type="submit">Get Tablets 💊</button>
            </div>
            <div class="search-helper-text">
                💡 Tip: You can type in the box above to immediately filter symptoms, or click any common chip below.
            </div>
        </form>

        <!-- Common Symptom Chips -->
        <div style="margin-top:22px;">
            <p class="chips-label">🔥 Quick Popular Symptoms (Click to Select):</p>
            <div class="chips" id="chipsContainer">
                <% 
                   String[][] popular = {
                       {"Headache", "🧠"}, {"Fever", "🌡️"}, {"Cold", "🤧"}, {"Cough", "💨"},
                       {"Acidity", "🔥"}, {"Acid Reflux / GERD", "⚡"}, {"Body Pain", "🤕"}, 
                       {"Sore Throat", "🧣"}, {"Allergy", "🌸"}, {"Stomach Ache", "🤢"},
                       {"Migraine", "⚡"}, {"Sinusitis / Sinus Congestion", "👃"},
                       {"Dry Cough", "🗣️"}, {"Chest Congestion / Productive Cough", "🫁"},
                       {"Gas & Bloating", "🎈"}, {"Motion Sickness", "🚗"},
                       {"Mouth Ulcers / Canker Sores", "👄"}, {"Toothache", "🦷"},
                       {"Joint Pain", "🦵"}, {"Insomnia", "🌙"}, {"Eye Irritation", "👁️"}
                   };
                   for (String[] p : popular) { 
                %>
                    <span class="chip" onclick="setSymptom('<%= p[0] %>')"><%= p[1] %> <%= p[0] %></span>
                <% } %>
            </div>
        </div>
    </div>

    <!-- Instructions & Safe Medication Guidelines Section -->
    <div class="instruction-section">
        <div class="guideline-card">
            <h4>📋 Patient Medication & Tablet Instructions</h4>
            <ul class="guideline-list">
                <li><strong>Follow Prescribed Dosage:</strong> Never double the dose if you miss one. Strictly adhere to prescribed intervals.</li>
                <li><strong>Food Timing:</strong> Pain relievers (Ibuprofen, Diclofenac) must be taken <em>strictly after meals</em> to protect stomach lining.</li>
                <li><strong>Antacid & PPI Timing:</strong> Take medications like Pantoprazole or Omeprazole <em>30 minutes before breakfast</em> on an empty stomach.</li>
                <li><strong>Hydration:</strong> Always swallow tablets with a full glass of plain water. Never swallow dry.</li>
                <li><strong>Antibiotic Discipline:</strong> Always complete the full course of antibiotics (e.g. Amoxicillin, Azithromycin) even if symptoms improve early.</li>
                <li><strong>Avoid Alcohol:</strong> Do not consume alcohol with painkillers, antihistamines, or antibiotics as it enhances side effects.</li>
            </ul>
        </div>

        <div class="guideline-card emergency">
            <h4>🚨 Emergency Warning Red Flags</h4>
            <ul class="guideline-list">
                <li><strong>Severe Breathlessness:</strong> Sudden difficulty breathing, wheezing, or lips/fingernails turning pale or blue.</li>
                <li><strong>Chest Pain:</strong> Crushing pressure or heaviness in chest radiating to left arm, neck, or back.</li>
                <li><strong>High Unresponsive Fever:</strong> Body temperature exceeding 103°F (39.5°C) that does not reduce with antipyretics.</li>
                <li><strong>Anaphylactic Reaction:</strong> Rapid swelling of lips, tongue, face, or throat accompanied by dizziness or fainting.</li>
                <li><strong>Neurological Signs:</strong> Sudden severe headache ("thunderclap"), slurred speech, or weakness on one side of body.</li>
                <li><strong>Continuous Vomiting:</strong> Inability to keep any liquids down for more than 12 hours leading to severe dehydration.</li>
            </ul>
        </div>
    </div>

    <!-- Medical Disclaimer Card -->
    <div class="disclaimer">
        ⚠️ <strong>Medical Disclaimer:</strong> The medicine recommendations provided by MediCare are designed for
        <strong>educational and informational awareness only</strong>. MediCare does not replace clinical consultation, diagnosis,
        or prescription by a certified medical physician or pharmacist. Always consult your healthcare provider before beginning any treatment.
    </div>

</div>

<footer>&copy; 2024 MediCare &mdash; Developed by LALITH KRISH</footer>

<script>
// Category Data Mapping
const categories = {
    respiratory: ['Cold', 'Cough', 'Dry Cough', 'Chest Congestion / Productive Cough', 'Sore Throat', 'Sinusitis / Sinus Congestion', 'Wheezing / Asthma (Mild)'],
    digestive: ['Acidity', 'Acid Reflux / GERD', 'Indigestion', 'Stomach Ache', 'Gas & Bloating', 'Food Poisoning', 'Nausea', 'Vomiting', 'Diarrhea', 'Constipation'],
    pain: ['Headache', 'Migraine', 'Body Pain', 'Back Pain', 'Joint Pain', 'Knee Pain / Arthritis', 'Muscle Spasms / Cramps', 'Neck Pain / Cervical Spondylosis', 'Sprain & Swelling', 'Toothache', 'Ear Pain', 'Menstrual Cramps / Period Pain'],
    skin: ['Allergy', 'Skin Rash', 'Severe Allergy / Urticaria (Hives)', 'Fungal Skin Infection / Ringworm', 'Acne / Pimples', 'Sunburn & Prickly Heat', 'Eczema & Itchy Skin'],
    ent: ['Eye Irritation', 'Conjunctivitis / Pink Eye', 'Dry Eyes', 'Ear Pain', 'Ear Infection / Discharge', 'Toothache', 'Gingivitis / Swollen Gums', 'Mouth Ulcers / Canker Sores'],
    general: ['Fever', 'Fatigue', 'Insomnia', 'Anxiety', 'Motion Sickness', 'Dizziness & Vertigo', 'Dehydration', 'Heatstroke / Exhaustion', 'High Blood Pressure / Hypertension', 'High Cholesterol', 'Iron Deficiency / Anemia', 'Diabetes', 'Urinary Tract Infection (UTI)']
};

const allOptions = Array.from(document.getElementById('symptomSelect').options).map(o => o.value).filter(v => v !== "");

function setSymptom(name) {
    const sel = document.getElementById('symptomSelect');
    for (let i = 0; i < sel.options.length; i++) {
        if (sel.options[i].value.toLowerCase() === name.toLowerCase()) {
            sel.selectedIndex = i;
            sel.scrollIntoView({ behavior: 'smooth', block: 'center' });
            break;
        }
    }
}

function filterCategory(cat, btn) {
    // Update active button state
    document.querySelectorAll('.cat-btn').forEach(b => b.classList.remove('active'));
    if (btn) btn.classList.add('active');

    const sel = document.getElementById('symptomSelect');
    sel.innerHTML = '<option value="">-- Choose a Symptom --</option>';

    let targetList = allOptions;
    if (cat !== 'all' && categories[cat]) {
        targetList = categories[cat];
    }

    targetList.forEach(s => {
        const opt = document.createElement('option');
        opt.value = s;
        opt.textContent = s;
        sel.appendChild(opt);
    });

    // Update chips display
    const chipsContainer = document.getElementById('chipsContainer');
    chipsContainer.innerHTML = '';
    targetList.slice(0, 15).forEach(s => {
        const span = document.createElement('span');
        span.className = 'chip';
        span.textContent = s;
        span.onclick = () => setSymptom(s);
        chipsContainer.appendChild(span);
    });
}

function filterDropdown() {
    const query = document.getElementById('filterInput').value.toLowerCase().trim();
    const sel = document.getElementById('symptomSelect');
    sel.innerHTML = '<option value="">-- Choose a Symptom --</option>';

    const filtered = allOptions.filter(s => s.toLowerCase().includes(query));
    filtered.forEach(s => {
        const opt = document.createElement('option');
        opt.value = s;
        opt.textContent = s;
        sel.appendChild(opt);
    });

    if (filtered.length === 1) {
        sel.selectedIndex = 1;
    }
}
</script>
</body>
</html>
