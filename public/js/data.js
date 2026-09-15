// MediCare Medical Database (55+ Symptoms & 44+ Verified Medicines)
const MEDICARE_DATA = {
    categories: {
        respiratory: { name: "🫁 Respiratory & Cold", icon: "🫁", symptoms: ['Cold', 'Cough', 'Dry Cough', 'Chest Congestion / Productive Cough', 'Sore Throat', 'Sinusitis / Sinus Congestion', 'Wheezing / Asthma (Mild)'] },
        digestive: { name: "🍽️ Digestive & Gut", icon: "🍽️", symptoms: ['Acidity', 'Acid Reflux / GERD', 'Indigestion', 'Stomach Ache', 'Gas & Bloating', 'Food Poisoning', 'Nausea', 'Vomiting', 'Diarrhea', 'Constipation'] },
        pain: { name: "🧠 Head & Body Pain", icon: "🧠", symptoms: ['Headache', 'Migraine', 'Body Pain', 'Back Pain', 'Joint Pain', 'Knee Pain / Arthritis', 'Muscle Spasms / Cramps', 'Neck Pain / Cervical Spondylosis', 'Sprain & Swelling', 'Toothache', 'Ear Pain', 'Menstrual Cramps / Period Pain'] },
        skin: { name: "🧴 Skin & Allergy", icon: "🧴", symptoms: ['Allergy', 'Skin Rash', 'Severe Allergy / Urticaria (Hives)', 'Fungal Skin Infection / Ringworm', 'Acne / Pimples', 'Sunburn & Prickly Heat', 'Eczema & Itchy Skin'] },
        ent: { name: "👁️ Eyes, Ears & Teeth", icon: "👁️", symptoms: ['Eye Irritation', 'Conjunctivitis / Pink Eye', 'Dry Eyes', 'Ear Pain', 'Ear Infection / Discharge', 'Toothache', 'Gingivitis / Swollen Gums', 'Mouth Ulcers / Canker Sores'] },
        general: { name: "⚡ Lifestyle & Chronic", icon: "⚡", symptoms: ['Fever', 'Fatigue', 'Insomnia', 'Anxiety', 'Motion Sickness', 'Dizziness & Vertigo', 'Dehydration', 'Heatstroke / Exhaustion', 'High Blood Pressure / Hypertension', 'High Cholesterol', 'Iron Deficiency / Anemia', 'Diabetes', 'Urinary Tract Infection (UTI)'] }
    },
    medicines: {
        "Paracetamol 500mg": {
            description: "Pain reliever and fever reducer.",
            dosage: "1 tablet every 4–6 hours, max 4 tablets/day",
            sideEffects: "Nausea, stomach upset if overdosed",
            precautions: "Do not exceed recommended dose. Avoid alcohol.",
            instructions: "Take with water after light food."
        },
        "Dolo 650mg": {
            description: "High potency paracetamol for severe fever, body ache, and post-vaccination fever.",
            dosage: "1 tablet 3 times a day after food. Maximum 3 tablets daily.",
            sideEffects: "Mild nausea, stomach upset if taken continuously.",
            precautions: "Do not take with other paracetamol products. Avoid alcohol.",
            instructions: "Swallow whole with water strictly after meals."
        },
        "Ibuprofen 400mg": {
            description: "Anti-inflammatory and pain reliever.",
            dosage: "1 tablet 3 times daily after food",
            sideEffects: "Stomach irritation, dizziness",
            precautions: "Take with food. Not for children under 12.",
            instructions: "Never take on an empty stomach. Take with a full glass of water."
        },
        "Cetirizine 10mg": {
            description: "Antihistamine for allergies, runny nose, and sneezing.",
            dosage: "1 tablet once daily at night",
            sideEffects: "Drowsiness, dry mouth",
            precautions: "Avoid driving or operating machinery. Not for pregnant women without advice.",
            instructions: "Best taken at bedtime due to mild sedative effects."
        },
        "Amoxicillin 500mg": {
            description: "Antibiotic for bacterial infections of throat, chest, and ear.",
            dosage: "1 capsule 3 times daily for 5–7 days",
            sideEffects: "Nausea, diarrhea, mild rash",
            precautions: "Complete the full course. Consult doctor first.",
            instructions: "Take at evenly spaced intervals throughout the day."
        },
        "Omeprazole 20mg": {
            description: "Proton pump inhibitor for acidity and stomach ulcers.",
            dosage: "1 capsule before breakfast daily",
            sideEffects: "Headache, diarrhea",
            precautions: "Not for long-term use without doctor advice.",
            instructions: "Take 30 minutes before morning breakfast with plain water."
        },
        "Pantoprazole 40mg": {
            description: "Proton-pump inhibitor for acute acid reflux, GERD, and peptic ulcer relief.",
            dosage: "1 tablet once daily in the morning on an empty stomach, 30 min before breakfast.",
            sideEffects: "Headache, mild abdominal pain, flatulence.",
            precautions: "Swallow whole with water; do not crush or chew.",
            instructions: "Take regularly for 7–14 days as indicated."
        },
        "Montelukast 10mg + Levocetirizine 5mg": {
            description: "Dual-action antihistamine and leukotriene inhibitor for allergic rhinitis, chronic sneezing, and wheezing.",
            dosage: "1 tablet once daily at bedtime.",
            sideEffects: "Drowsiness, dry mouth, mild headache.",
            precautions: "Avoid driving. Consult physician if asthma is acute.",
            instructions: "Take with water at night before sleeping."
        },
        "Dextromethorphan HBr 10mg/5ml Syrup": {
            description: "Centrally-acting cough suppressant for non-productive dry, hacking cough.",
            dosage: "10 ml 3–4 times daily as needed. Max 40 ml in 24 hours.",
            sideEffects: "Dizziness, mild sedation, nausea.",
            precautions: "Not recommended for wet/productive cough with mucus. Stay hydrated.",
            instructions: "Do not drink water immediately after taking syrup to allow throat coating."
        },
        "Guaifenesin 100mg/5ml Expectorant": {
            description: "Mucus thinning expectorant to clear chest congestion and wet cough.",
            dosage: "10–20 ml every 4 hours after meals with plenty of warm water.",
            sideEffects: "Nausea, stomach upset if taken on empty stomach.",
            precautions: "Drink plenty of warm fluids to enhance mucus clearance.",
            instructions: "Pair with warm steam inhalation."
        },
        "Meftal-Spas (Mefenamic Acid + Dicyclomine)": {
            description: "Antispasmodic and NSAID pain reliever for stomach cramps and menstrual cramps.",
            dosage: "1 tablet 2–3 times daily strictly after food when pain occurs.",
            sideEffects: "Dry mouth, blurred vision, dizziness, acidity.",
            precautions: "Do not take on an empty stomach. Not for patients with glaucoma.",
            instructions: "Take strictly after food."
        },
        "Domperidone 10mg": {
            description: "Prokinetic antiemetic for nausea, vomiting, and gastric fullness.",
            dosage: "1 tablet 15–30 minutes before meals, up to 3 times daily.",
            sideEffects: "Dry mouth, headache, mild abdominal cramps.",
            precautions: "Do not use continuously for more than 7 days.",
            instructions: "Take 15–30 minutes prior to meals."
        },
        "Ondansetron 4mg": {
            description: "Serotonin 5-HT3 receptor antagonist for acute nausea, vomiting, and food poisoning.",
            dosage: "1 tablet dissolved on tongue or swallowed 30 min before food, 2 times daily.",
            sideEffects: "Headache, constipation, fatigue.",
            precautions: "Inform doctor if history of heart rhythm irregularities.",
            instructions: "Dissolve on tongue or swallow with minimal water."
        },
        "Simethicone 80mg": {
            description: "Anti-foaming agent that breaks gas bubbles to relieve bloating, fullness, and flatulence.",
            dosage: "1–2 chewable tablets after meals and at bedtime as needed.",
            sideEffects: "None significant.",
            precautions: "Chew tablets thoroughly before swallowing.",
            instructions: "Chew well; do not swallow whole."
        },
        "ORS (Oral Rehydration Salts)": {
            description: "Rehydration therapy for diarrhea, vomiting, and dehydration.",
            dosage: "Dissolve 1 sachet in 1 litre clean water, sip frequently",
            sideEffects: "None significant",
            precautions: "Safe for all ages. Use within 24 hours of mixing.",
            instructions: "Discard any mixed solution after 24 hours."
        },
        "Loperamide 2mg": {
            description: "Anti-diarrheal medication.",
            dosage: "2 mg initially, then 1 mg after each loose stool, max 8 mg/day",
            sideEffects: "Constipation, dizziness",
            precautions: "Not for children under 6. Consult doctor if fever present.",
            instructions: "Stop taking as soon as stools become normal."
        },
        "Metformin 500mg": {
            description: "Oral medication for Type 2 Diabetes management.",
            dosage: "1 tablet twice daily after meals",
            sideEffects: "Nausea, stomach upset",
            precautions: "Monitor blood glucose regularly. Not for kidney disease.",
            instructions: "Take with or immediately after meals to reduce stomach upset."
        },
        "Loratadine 10mg": {
            description: "Non-drowsy antihistamine for day-time allergy relief.",
            dosage: "1 tablet once daily in the morning",
            sideEffects: "Headache, dry mouth",
            precautions: "Safe during daytime. Avoid alcohol.",
            instructions: "Can be taken with or without food."
        },
        "Aspirin 75mg": {
            description: "Blood thinner and mild pain reliever.",
            dosage: "1 tablet daily after food (low dose)",
            sideEffects: "Stomach bleeding risk",
            precautions: "Not for children. Avoid if allergic to NSAIDs.",
            instructions: "Take with meals."
        },
        "Diclofenac 50mg": {
            description: "NSAID for acute joint, neck, and body pain.",
            dosage: "1 tablet 2–3 times daily after meals",
            sideEffects: "GI upset, heartburn",
            precautions: "Use lowest effective dose. Not for long-term use without PPI.",
            instructions: "Strictly after food."
        },
        "Azithromycin 500mg": {
            description: "Antibiotic for respiratory and acne infections.",
            dosage: "1 tablet daily for 3–5 days",
            sideEffects: "Nausea, abdominal pain",
            precautions: "Complete full course. Consult doctor first.",
            instructions: "Take 1 hour before or 2 hours after meals."
        },
        "Ranitidine 150mg": {
            description: "H2 blocker for indigestion and heartburn.",
            dosage: "1 tablet twice daily before meals",
            sideEffects: "Headache, constipation",
            precautions: "Do not use for more than 2 weeks without advice.",
            instructions: "Take 30 minutes before meal."
        },
        "Betahistine 8mg": {
            description: "For vertigo, dizziness, and inner ear balance disorders.",
            dosage: "1 tablet 3 times daily",
            sideEffects: "Nausea, headache",
            precautions: "Take with food.",
            instructions: "Take after food."
        },
        "Melatonin 3mg": {
            description: "Sleep aid for insomnia and jet lag.",
            dosage: "1 tablet 30 min before bedtime",
            sideEffects: "Drowsiness, morning grogginess",
            precautions: "Short-term use only. Avoid if pregnant.",
            instructions: "Take in a dim environment 30 minutes before desired sleep."
        },
        "Antacid (Gelusil/Digene)": {
            description: "Fast relief for acidity, indigestion, and heartburn.",
            dosage: "2 tablets or 10ml liquid after meals and at bedtime",
            sideEffects: "Constipation or mild laxative effect",
            precautions: "Do not take simultaneously with other medications.",
            instructions: "Chew thoroughly after food."
        },
        "Chloramphenicol Eye Drops": {
            description: "Antibiotic eye drops for eye infections and bacterial conjunctivitis.",
            dosage: "1–2 drops every 6 hours into affected eye",
            sideEffects: "Temporary stinging",
            precautions: "Wash hands before use. Do not touch dropper tip to eye.",
            instructions: "Close eye gently for 1-2 minutes after instilling drops."
        },
        "Carboxymethylcellulose 0.5% Eye Drops": {
            description: "Lubricant artificial tears for burning, stinging, and dryness of the eyes.",
            dosage: "1–2 drops in the affected eye(s) 4–6 times daily as needed.",
            sideEffects: "Brief blurriness right after instillation.",
            precautions: "Discard bottle 30 days after opening.",
            instructions: "Safe for long-term daily use."
        },
        "Clove Oil": {
            description: "Natural remedy for toothache and dental pain.",
            dosage: "Apply 1–2 drops on cotton to affected tooth",
            sideEffects: "Mild burning sensation",
            precautions: "For temporary relief only. Consult dentist.",
            instructions: "Apply only to affected tooth; avoid swallowing."
        },
        "Diphenhydramine 25mg": {
            description: "Antihistamine for acute allergy and sleep induction.",
            dosage: "1 tablet at bedtime",
            sideEffects: "Drowsiness, dry mouth",
            precautions: "Do not drive. Not for children under 12.",
            instructions: "Take strictly at bedtime."
        },
        "Vitamin B-Complex": {
            description: "Nutritional supplement for fatigue, nerve health, and mouth ulcers.",
            dosage: "1 tablet daily after meals",
            sideEffects: "Bright yellow urine (harmless riboflavin)",
            precautions: "Safe for long-term use.",
            instructions: "Take with breakfast or lunch."
        },
        "Clotrimazole 1% Topical Cream": {
            description: "Broad-spectrum antifungal cream for ringworm, athlete's foot, and jock itch.",
            dosage: "Apply thin layer to affected clean dry area 2–3 times daily for 2–4 weeks.",
            sideEffects: "Local burning, redness, mild skin irritation.",
            precautions: "Continue treatment for 1–2 weeks after symptoms disappear to prevent relapse.",
            instructions: "Wash and dry area completely before application."
        },
        "Triamcinolone Acetonide 0.1% Paste": {
            description: "Corticosteroid paste providing fast relief and coating for painful mouth ulcers.",
            dosage: "Apply small dab to ulcer at bedtime after meals. Do not rub.",
            sideEffects: "Mild stinging upon application.",
            precautions: "Do not eat or drink for 30 minutes after application.",
            instructions: "Dab gently onto lesion; it forms a protective film."
        },
        "Cinnarizine 25mg": {
            description: "Antihistamine and calcium antagonist for motion sickness, vertigo, and inner ear balance disorders.",
            dosage: "1 tablet 2 hours before travel, then 1 tablet every 8 hours during journey.",
            sideEffects: "Drowsiness, weight gain with long-term use.",
            precautions: "Causes sleepiness. Avoid alcohol while taking this medicine.",
            instructions: "Take 2 hours before departure."
        },
        "Chlorpheniramine Maleate 4mg": {
            description: "Antiallergic tablet for hives, acute itching, sneezing, and watery eyes.",
            dosage: "1 tablet every 4–6 hours as needed. Max 24mg per day.",
            sideEffects: "Marked sedation, dry mouth, urinary retention.",
            precautions: "Do not drive or operate machinery. Avoid in elderly with prostate issues.",
            instructions: "Avoid driving."
        },
        "Amlodipine 5mg": {
            description: "Calcium channel blocker for high blood pressure and angina prevention.",
            dosage: "1 tablet once daily at the same time every day (morning or night).",
            sideEffects: "Ankle swelling (edema), dizziness, flushing.",
            precautions: "Do not stop abruptly. Monitor blood pressure regularly.",
            instructions: "Take consistently at the same time daily."
        },
        "Atorvastatin 10mg": {
            description: "Statin lipid-lowering medication for hypercholesterolemia and heart disease prevention.",
            dosage: "1 tablet once daily at night after food.",
            sideEffects: "Muscle ache, mild digestive discomfort.",
            precautions: "Report unexplained muscle tenderness to physician. Avoid grapefruit juice.",
            instructions: "Take at night."
        },
        "Ferrous Ascorbate 100mg + Folic Acid 1.5mg": {
            description: "Iron supplement for iron deficiency anemia, fatigue, and hemoglobin replenishment.",
            dosage: "1 tablet once daily after meals with citrus juice/water. Avoid milk or tea.",
            sideEffects: "Black stools (harmless), constipation, mild nausea.",
            precautions: "Take 2 hours apart from calcium supplements or antacids.",
            instructions: "Take with Vitamin C / orange juice for best absorption."
        },
        "Nitrofurantoin 100mg": {
            description: "Antibacterial medication specifically targeting urinary tract infections (UTI).",
            dosage: "1 tablet twice daily with food for 5–7 days.",
            sideEffects: "Nausea, dark yellow/brown urine (normal).",
            precautions: "Complete full prescribed course even if symptoms improve early.",
            instructions: "Take with food or milk."
        },
        "Ofloxacin 200mg + Ornidazole 500mg": {
            description: "Combined antibiotic and antiprotozoal for severe gastroenteritis, dysentery, and food poisoning.",
            dosage: "1 tablet twice daily after meals for 3–5 days.",
            sideEffects: "Metallic taste, nausea, dizziness.",
            precautions: "Avoid all alcohol during treatment and for 48 hours after. Complete full course.",
            instructions: "Take after a full meal."
        },
        "Thiocolchicoside 4mg + Aceclofenac 100mg": {
            description: "Muscle relaxant and NSAID pain reliever for acute muscle spasms, neck stiffness, and sprains.",
            dosage: "1 tablet twice daily strictly after meals for 5 days.",
            sideEffects: "Gastric discomfort, drowsiness.",
            precautions: "Do not take on empty stomach. Avoid in patients with peptic ulcers.",
            instructions: "Take with food."
        },
        "Benzydamine 0.15% Mouthwash": {
            description: "Anti-inflammatory and analgesic mouth gargle for sore throat and painful gums.",
            dosage: "Rinse or gargle with 15 ml undiluted for 30 seconds every 2–3 hours. Do not swallow.",
            sideEffects: "Numbness or stinging in mouth.",
            precautions: "Do not swallow. Not suitable for children under 6.",
            instructions: "Gargle and spit out."
        },
        "Calamine Lotion": {
            description: "Soothing topical lotion for insect bites, sunburn, prickly heat, and chickenpox itching.",
            dosage: "Shake well and apply gently over affected skin with cotton 3–4 times daily.",
            sideEffects: "Mild dryness.",
            precautions: "For external use only. Keep away from eyes and open wounds.",
            instructions: "Shake bottle well before application."
        },
        "Saline Nasal Spray 0.65%": {
            description: "Gentle isotonic saline spray to moisten nasal passages and loosen thick mucus.",
            dosage: "2–3 sprays in each nostril 3–4 times daily as needed.",
            sideEffects: "None significant.",
            precautions: "Non-addictive, safe for daily long-term use across all age groups.",
            instructions: "Blow nose gently before spraying."
        },
        "Hydrocortisone 1% Topical Cream": {
            description: "Mild steroid cream for itchy skin flare-ups, dermatitis, eczema, and localized rashes.",
            dosage: "Apply sparingly to affected area 1–2 times daily for up to 7 days.",
            sideEffects: "Skin thinning if used excessively.",
            precautions: "Do not use on face or broken skin without doctor supervision.",
            instructions: "Apply only a thin film to the affected skin."
        }
    },
    symptomMedicineMap: {
        'Headache': ['Paracetamol 500mg', 'Dolo 650mg', 'Ibuprofen 400mg', 'Aspirin 75mg'],
        'Fever': ['Paracetamol 500mg', 'Dolo 650mg', 'Ibuprofen 400mg'],
        'Cold': ['Cetirizine 10mg', 'Loratadine 10mg', 'Paracetamol 500mg'],
        'Cough': ['Azithromycin 500mg', 'Amoxicillin 500mg', 'Dextromethorphan HBr 10mg/5ml Syrup'],
        'Dry Cough': ['Dextromethorphan HBr 10mg/5ml Syrup', 'Cetirizine 10mg'],
        'Chest Congestion / Productive Cough': ['Guaifenesin 100mg/5ml Expectorant', 'Amoxicillin 500mg'],
        'Wheezing / Asthma (Mild)': ['Montelukast 10mg + Levocetirizine 5mg', 'Cetirizine 10mg'],
        'Sinusitis / Sinus Congestion': ['Saline Nasal Spray 0.65%', 'Cetirizine 10mg', 'Paracetamol 500mg'],
        'Sore Throat': ['Amoxicillin 500mg', 'Azithromycin 500mg', 'Benzydamine 0.15% Mouthwash'],
        'Body Pain': ['Ibuprofen 400mg', 'Diclofenac 50mg', 'Paracetamol 500mg'],
        'Stomach Ache': ['Omeprazole 20mg', 'Antacid (Gelusil/Digene)', 'Ranitidine 150mg'],
        'Acid Reflux / GERD': ['Pantoprazole 40mg', 'Antacid (Gelusil/Digene)', 'Domperidone 10mg'],
        'Acidity': ['Pantoprazole 40mg', 'Omeprazole 20mg', 'Antacid (Gelusil/Digene)'],
        'Indigestion': ['Antacid (Gelusil/Digene)', 'Omeprazole 20mg'],
        'Gas & Bloating': ['Simethicone 80mg', 'Antacid (Gelusil/Digene)', 'Domperidone 10mg'],
        'Food Poisoning': ['ORS (Oral Rehydration Salts)', 'Ondansetron 4mg', 'Ofloxacin 200mg + Ornidazole 500mg'],
        'Nausea': ['ORS (Oral Rehydration Salts)', 'Domperidone 10mg', 'Ondansetron 4mg'],
        'Vomiting': ['ORS (Oral Rehydration Salts)', 'Ondansetron 4mg', 'Domperidone 10mg'],
        'Diarrhea': ['ORS (Oral Rehydration Salts)', 'Loperamide 2mg'],
        'Constipation': ['Antacid (Gelusil/Digene)'],
        'Back Pain': ['Diclofenac 50mg', 'Ibuprofen 400mg'],
        'Joint Pain': ['Diclofenac 50mg', 'Ibuprofen 400mg', 'Aspirin 75mg'],
        'Knee Pain / Arthritis': ['Diclofenac 50mg', 'Ibuprofen 400mg', 'Paracetamol 500mg'],
        'Muscle Spasms / Cramps': ['Thiocolchicoside 4mg + Aceclofenac 100mg', 'Ibuprofen 400mg'],
        'Neck Pain / Cervical Spondylosis': ['Thiocolchicoside 4mg + Aceclofenac 100mg', 'Diclofenac 50mg'],
        'Sprain & Swelling': ['Ibuprofen 400mg', 'Thiocolchicoside 4mg + Aceclofenac 100mg'],
        'Migraine': ['Paracetamol 500mg', 'Ibuprofen 400mg'],
        'Allergy': ['Cetirizine 10mg', 'Loratadine 10mg', 'Diphenhydramine 25mg'],
        'Severe Allergy / Urticaria (Hives)': ['Chlorpheniramine Maleate 4mg', 'Montelukast 10mg + Levocetirizine 5mg', 'Calamine Lotion'],
        'Skin Rash': ['Cetirizine 10mg', 'Loratadine 10mg', 'Calamine Lotion'],
        'Fungal Skin Infection / Ringworm': ['Clotrimazole 1% Topical Cream'],
        'Acne / Pimples': ['Azithromycin 500mg', 'Clotrimazole 1% Topical Cream'],
        'Sunburn & Prickly Heat': ['Calamine Lotion', 'Paracetamol 500mg'],
        'Eczema & Itchy Skin': ['Hydrocortisone 1% Topical Cream', 'Cetirizine 10mg', 'Calamine Lotion'],
        'Toothache': ['Clove Oil', 'Ibuprofen 400mg'],
        'Gingivitis / Swollen Gums': ['Benzydamine 0.15% Mouthwash', 'Clove Oil', 'Amoxicillin 500mg'],
        'Mouth Ulcers / Canker Sores': ['Triamcinolone Acetonide 0.1% Paste', 'Vitamin B-Complex'],
        'Ear Pain': ['Betahistine 8mg', 'Amoxicillin 500mg', 'Paracetamol 500mg'],
        'Ear Infection / Discharge': ['Amoxicillin 500mg', 'Paracetamol 500mg'],
        'Eye Irritation': ['Chloramphenicol Eye Drops', 'Carboxymethylcellulose 0.5% Eye Drops'],
        'Conjunctivitis / Pink Eye': ['Chloramphenicol Eye Drops', 'Carboxymethylcellulose 0.5% Eye Drops'],
        'Dry Eyes': ['Carboxymethylcellulose 0.5% Eye Drops'],
        'Motion Sickness': ['Cinnarizine 25mg', 'Domperidone 10mg'],
        'Dizziness & Vertigo': ['Betahistine 8mg', 'Cinnarizine 25mg'],
        'Fatigue': ['Vitamin B-Complex', 'Ferrous Ascorbate 100mg + Folic Acid 1.5mg'],
        'Iron Deficiency / Anemia': ['Ferrous Ascorbate 100mg + Folic Acid 1.5mg', 'Vitamin B-Complex'],
        'Insomnia': ['Melatonin 3mg', 'Diphenhydramine 25mg'],
        'Anxiety': ['Melatonin 3mg'],
        'Dehydration': ['ORS (Oral Rehydration Salts)'],
        'Heatstroke / Exhaustion': ['ORS (Oral Rehydration Salts)', 'Paracetamol 500mg', 'Vitamin B-Complex'],
        'High Blood Pressure / Hypertension': ['Amlodipine 5mg'],
        'High Cholesterol': ['Atorvastatin 10mg'],
        'Diabetes': ['Metformin 500mg'],
        'Urinary Tract Infection (UTI)': ['Nitrofurantoin 100mg', 'Paracetamol 500mg'],
        'Menstrual Cramps / Period Pain': ['Meftal-Spas (Mefenamic Acid + Dicyclomine)', 'Ibuprofen 400mg']
    }
};
