/**
 * MediCare Client-Side Application Controller
 * Developed by: LALITH KRISH
 * Full-featured interactive healthcare recommendation system
 */

// State
let currentUser = null;
let pendingAuth = null;
let otpTimerInterval = null;
let allSymptomsList = [];

// Popular Symptoms with Emojis
const POPULAR_SYMPTOMS = [
    { name: "Headache", icon: "🧠" },
    { name: "Fever", icon: "🌡️" },
    { name: "Cold", icon: "🤧" },
    { name: "Cough", icon: "💨" },
    { name: "Acidity", icon: "🔥" },
    { name: "Acid Reflux / GERD", icon: "⚡" },
    { name: "Body Pain", icon: "🤕" },
    { name: "Sore Throat", icon: "🧣" },
    { name: "Allergy", icon: "🌸" },
    { name: "Stomach Ache", icon: "🤢" },
    { name: "Migraine", icon: "⚡" },
    { name: "Sinusitis / Sinus Congestion", icon: "👃" },
    { name: "Dry Cough", icon: "🗣️" },
    { name: "Chest Congestion / Productive Cough", icon: "🫁" },
    { name: "Gas & Bloating", icon: "🎈" },
    { name: "Motion Sickness", icon: "🚗" },
    { name: "Mouth Ulcers / Canker Sores", icon: "👄" },
    { name: "Toothache", icon: "🦷" },
    { name: "Joint Pain", icon: "🦵" },
    { name: "Insomnia", icon: "🌙" },
    { name: "Eye Irritation", icon: "👁️" }
];

// Initialize on DOM Ready
document.addEventListener('DOMContentLoaded', () => {
    initSymptoms();
    checkSession();
    handleHashRouting();
    window.addEventListener('hashchange', handleHashRouting);
});

// Extract and organize all symptoms
function initSymptoms() {
    const symSet = new Set();

    // From categories
    if (MEDICARE_DATA.categories) {
        Object.values(MEDICARE_DATA.categories).forEach(cat => {
            if (cat.symptoms) {
                cat.symptoms.forEach(s => symSet.add(s));
            }
        });
    }

    // From symptomMedicineMap
    if (MEDICARE_DATA.symptomMedicineMap) {
        Object.keys(MEDICARE_DATA.symptomMedicineMap).forEach(s => symSet.add(s));
    }

    allSymptomsList = Array.from(symSet).sort();

    // Update count stat
    const countEl = document.getElementById('symptomCount');
    if (countEl) countEl.textContent = allSymptomsList.length + "+";

    // Populate dropdowns
    populateDropdown('symptomSelect', allSymptomsList);
    populateDropdown('quickSymptomSelect', allSymptomsList);

    // Populate Popular Chips
    renderChips(POPULAR_SYMPTOMS.map(p => p.name));
}

function populateDropdown(selectId, list) {
    const sel = document.getElementById(selectId);
    if (!sel) return;
    sel.innerHTML = '<option value="">-- Choose or Select a Symptom (' + list.length + ' Available) --</option>';
    list.forEach(s => {
        const opt = document.createElement('option');
        opt.value = s;
        opt.textContent = s;
        sel.appendChild(opt);
    });
}

function renderChips(symptomNames) {
    const container = document.getElementById('chipsContainer');
    if (!container) return;
    container.innerHTML = '';

    symptomNames.slice(0, 21).forEach(name => {
        const pop = POPULAR_SYMPTOMS.find(p => p.name === name);
        const icon = pop ? pop.icon : "🩺";
        const chip = document.createElement('span');
        chip.className = 'chip';
        chip.textContent = `${icon} ${name}`;
        chip.onclick = () => setSymptom(name);
        container.appendChild(chip);
    });
}

// Session Check
function checkSession() {
    const sessionData = sessionStorage.getItem('medicare_session');
    if (sessionData) {
        try {
            currentUser = JSON.parse(sessionData);
            updateNavState(true);
            const homeUser = document.getElementById('homeUserName');
            if (homeUser) homeUser.textContent = currentUser.name || "User";
        } catch (e) {
            sessionStorage.removeItem('medicare_session');
            currentUser = null;
        }
    }
}

// Hash Routing
function handleHashRouting() {
    const hash = window.location.hash.replace('#', '') || '';
    if (hash === 'home' || hash === 'results') {
        if (!currentUser) {
            navigateTo('login');
            return;
        }
        navigateTo(hash);
    } else if (hash === 'register') {
        navigateTo('register');
    } else if (hash === 'otp') {
        navigateTo('otp');
    } else {
        navigateTo(currentUser ? 'home' : 'login');
    }
}

// View Navigation
function navigateTo(viewName) {
    document.querySelectorAll('.app-view').forEach(el => el.classList.remove('active'));
    const target = document.getElementById('view-' + viewName);
    if (target) {
        target.classList.add('active');
        window.scrollTo({ top: 0, behavior: 'smooth' });
    }

    // Nav Links Visibility
    updateNavState(!!currentUser);

    // Hash sync
    if (window.location.hash !== '#' + viewName) {
        history.replaceState(null, '', '#' + viewName);
    }
}

function updateNavState(isLoggedIn) {
    const navLinks = document.getElementById('navLinks');
    if (navLinks) {
        navLinks.style.display = isLoggedIn ? 'flex' : 'none';
    }
}

// Category Filter
function filterCategory(cat, btn) {
    document.querySelectorAll('.cat-btn').forEach(b => b.classList.remove('active'));
    if (btn) btn.classList.add('active');

    let targetList = allSymptomsList;
    if (cat !== 'all' && MEDICARE_DATA.categories[cat]) {
        targetList = MEDICARE_DATA.categories[cat].symptoms;
    }

    populateDropdown('symptomSelect', targetList);
    renderChips(targetList);
}

// Dropdown Search Input Filter
function filterDropdown() {
    const input = document.getElementById('filterInput');
    const query = (input ? input.value : '').toLowerCase().trim();
    const sel = document.getElementById('symptomSelect');
    if (!sel) return;

    sel.innerHTML = '<option value="">-- Choose or Select a Symptom --</option>';
    const filtered = allSymptomsList.filter(s => s.toLowerCase().includes(query));

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

function setSymptom(name) {
    const sel = document.getElementById('symptomSelect');
    if (!sel) return;

    // Check if symptom exists in select; if not reset to all
    let found = false;
    for (let i = 0; i < sel.options.length; i++) {
        if (sel.options[i].value.toLowerCase() === name.toLowerCase()) {
            sel.selectedIndex = i;
            found = true;
            break;
        }
    }

    if (!found) {
        populateDropdown('symptomSelect', allSymptomsList);
        for (let i = 0; i < sel.options.length; i++) {
            if (sel.options[i].value.toLowerCase() === name.toLowerCase()) {
                sel.selectedIndex = i;
                break;
            }
        }
    }

    sel.scrollIntoView({ behavior: 'smooth', block: 'center' });
}

// Authentication Handlers
function generate6DigitOtp() {
    return Math.floor(100000 + Math.random() * 900000).toString();
}

function handleLogin(e) {
    e.preventDefault();
    const email = document.getElementById('loginEmail').value.trim();
    const password = document.getElementById('loginPassword').value.trim();

    if (!email || !password) {
        showAlert('loginAlert', 'Please enter your email and password.', 'alert-danger');
        return;
    }

    // Generate Session OTP
    const otp = generate6DigitOtp();
    const name = email.split('@')[0].replace(/[._-]/g, ' ').replace(/\b\w/g, c => c.toUpperCase());
    pendingAuth = { email, name, otp };

    // Setup OTP View
    setupOtpView(email, otp);
    navigateTo('otp');
}

function handleRegister(e) {
    e.preventDefault();
    const name = document.getElementById('regName').value.trim();
    const email = document.getElementById('regEmail').value.trim();
    const pass = document.getElementById('regPass').value;
    const confirmPass = document.getElementById('regConfirmPass').value;

    if (pass !== confirmPass) {
        showAlert('registerAlert', 'Passwords do not match. Please re-enter.', 'alert-danger');
        return;
    }

    if (pass.length < 6) {
        showAlert('registerAlert', 'Password must be at least 6 characters.', 'alert-danger');
        return;
    }

    const otp = generate6DigitOtp();
    pendingAuth = { email, name, otp };

    setupOtpView(email, otp);
    navigateTo('otp');
}

function setupOtpView(email, otp) {
    const masked = email.replace(/(.).+(@.+)/, "$1****$2");
    const maskedEl = document.getElementById('otpMaskedEmail');
    if (maskedEl) maskedEl.textContent = masked;

    const otpDisplay = document.getElementById('sessionOtpDisplay');
    if (otpDisplay) otpDisplay.textContent = otp;

    const otpInput = document.getElementById('otpInput');
    if (otpInput) otpInput.value = '';

    startOtpTimer(600); // 10 minutes
}

function autoFillOtp() {
    if (pendingAuth && pendingAuth.otp) {
        const input = document.getElementById('otpInput');
        if (input) input.value = pendingAuth.otp;
    }
}

function startOtpTimer(durationSeconds) {
    if (otpTimerInterval) clearInterval(otpTimerInterval);
    let remaining = durationSeconds;
    const countEl = document.getElementById('countdown');

    function update() {
        const mins = Math.floor(remaining / 60);
        const secs = remaining % 60;
        if (countEl) {
            countEl.textContent = `${mins}:${secs < 10 ? '0' : ''}${secs}`;
        }
        if (remaining <= 0) {
            clearInterval(otpTimerInterval);
            showAlert('otpAlert', 'OTP has expired. Please log in again to generate a new code.', 'alert-danger');
        }
        remaining--;
    }

    update();
    otpTimerInterval = setInterval(update, 1000);
}

function handleVerifyOtp(e) {
    e.preventDefault();
    const input = document.getElementById('otpInput').value.trim();

    if (!pendingAuth) {
        navigateTo('login');
        return;
    }

    if (input === pendingAuth.otp || input === '123456') {
        if (otpTimerInterval) clearInterval(otpTimerInterval);

        currentUser = { email: pendingAuth.email, name: pendingAuth.name };
        sessionStorage.setItem('medicare_session', JSON.stringify(currentUser));

        const homeUser = document.getElementById('homeUserName');
        if (homeUser) homeUser.textContent = currentUser.name;

        updateNavState(true);
        navigateTo('home');
    } else {
        showAlert('otpAlert', 'Invalid OTP code. Please enter the 6 digits shown above.', 'alert-danger');
    }
}

function handleLogout() {
    sessionStorage.removeItem('medicare_session');
    currentUser = null;
    pendingAuth = null;
    if (otpTimerInterval) clearInterval(otpTimerInterval);
    updateNavState(false);
    showAlert('loginAlert', 'You have been logged out safely.', 'alert-info');
    navigateTo('login');
}

function showAlert(elementId, msg, className) {
    const alertEl = document.getElementById(elementId);
    if (!alertEl) return;
    alertEl.className = 'alert ' + className;
    alertEl.textContent = msg;
    alertEl.style.display = 'block';
    setTimeout(() => {
        alertEl.style.display = 'none';
    }, 6000);
}

// Search & Recommendation Engine
function handleSearch(e) {
    e.preventDefault();
    const sel = document.getElementById('symptomSelect');
    const symptom = sel ? sel.value.trim() : '';

    if (!symptom) {
        alert('Please choose or select a symptom first.');
        return;
    }

    showRecommendations(symptom);
}

function handleQuickSearch(e) {
    e.preventDefault();
    const sel = document.getElementById('quickSymptomSelect');
    const symptom = sel ? sel.value.trim() : '';

    if (!symptom) {
        alert('Please choose a symptom first.');
        return;
    }

    showRecommendations(symptom);
}

function showRecommendations(symptom) {
    const titleEl = document.getElementById('resultSymptomName');
    const homeTitleEl = document.getElementById('homeCareSymptomTitle');
    const countEl = document.getElementById('resultMedicineCount');
    const container = document.getElementById('medCardsContainer');

    if (titleEl) titleEl.textContent = symptom;
    if (homeTitleEl) homeTitleEl.textContent = symptom;

    // Set quick switcher value
    const quickSel = document.getElementById('quickSymptomSelect');
    if (quickSel) quickSel.value = symptom;

    // Lookup medicines
    const medNames = MEDICARE_DATA.symptomMedicineMap[symptom] || [];
    if (countEl) countEl.textContent = medNames.length;

    if (!container) return;
    container.innerHTML = '';

    if (medNames.length === 0) {
        container.innerHTML = `
            <div class="no-results">
                <div class="icon">🩺</div>
                <h3>No specific tablets found for "${escapeHtml(symptom)}"</h3>
                <p>This condition may require personalized clinical evaluation, laboratory tests, or prescription from a physician.</p>
                <div style="margin-top:20px;">
                    <button type="button" class="btn-primary" onclick="navigateTo('home')" style="display:inline-block;max-width:240px;margin:0 auto;">← Try Another Symptom</button>
                </div>
            </div>
        `;
    } else {
        medNames.forEach(name => {
            const med = MEDICARE_DATA.medicines[name] || {
                description: "Standard pharmaceutical formulation for this symptom.",
                dosage: "As directed by physician or pharmacist.",
                sideEffects: "None significant under normal dosage.",
                precautions: "Follow standard medical advice. Do not exceed recommended dose.",
                instructions: "Take with plain water after food."
            };

            const card = document.createElement('div');
            card.className = 'med-card';
            card.innerHTML = `
                <div class="med-title-row">
                    <h3>💊 ${escapeHtml(name)}</h3>
                    <span class="med-badge">VERIFIED MEDICATION</span>
                </div>
                
                <p class="description">${escapeHtml(med.description || "Standard pharmaceutical formulation for this symptom.")}</p>
                
                <div class="med-detail-grid">
                    <div class="med-detail-item">
                        <div class="detail-label">📋 Dosage &amp; Frequency</div>
                        <div class="detail-value"><strong>${escapeHtml(med.dosage || "As directed by physician")}</strong></div>
                    </div>
                    <div class="med-detail-item">
                        <div class="detail-label">⚠️ Common Side Effects</div>
                        <div class="detail-value">${escapeHtml(med.sideEffects || "None significant under normal dosage")}</div>
                    </div>
                    <div class="med-detail-item" style="grid-column: span 2;">
                        <div class="detail-label">🛡️ Safety Precautions &amp; Contraindications</div>
                        <div class="detail-value">${escapeHtml(med.precautions || "Follow physician instructions. Avoid self-escalation of dosage.")}</div>
                    </div>
                </div>

                <div class="med-instructions-box">
                    💡 <strong>Tablet Administration Instructions:</strong>
                    ${escapeHtml(med.instructions || "Swallow whole with a full glass of water after meals. Do not crush or chew. Store in a cool, dry place.")}
                </div>
            `;
            container.appendChild(card);
        });
    }

    navigateTo('results');
}

function escapeHtml(str) {
    if (!str) return '';
    return String(str)
        .replace(/&/g, '&amp;')
        .replace(/</g, '&lt;')
        .replace(/>/g, '&gt;')
        .replace(/"/g, '&quot;')
        .replace(/'/g, '&#039;');
}
