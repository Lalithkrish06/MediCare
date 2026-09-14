USE medicare_db;

-- 1. Insert new symptoms
INSERT IGNORE INTO symptoms (symptom_name) VALUES
('Sinusitis / Sinus Congestion'),
('Dry Cough'),
('Chest Congestion / Productive Cough'),
('Wheezing / Asthma (Mild)'),
('Acid Reflux / GERD'),
('Gas & Bloating'),
('Food Poisoning'),
('Muscle Spasms / Cramps'),
('Neck Pain / Cervical Spondylosis'),
('Knee Pain / Arthritis'),
('Sprain & Swelling'),
('Mouth Ulcers / Canker Sores'),
('Gingivitis / Swollen Gums'),
('Conjunctivitis / Pink Eye'),
('Dry Eyes'),
('Ear Infection / Discharge'),
('Motion Sickness'),
('Dizziness & Vertigo'),
('Dehydration'),
('Severe Allergy / Urticaria (Hives)'),
('Fungal Skin Infection / Ringworm'),
('Acne / Pimples'),
('Sunburn & Prickly Heat'),
('Eczema & Itchy Skin'),
('High Blood Pressure / Hypertension'),
('High Cholesterol'),
('Iron Deficiency / Anemia'),
('Urinary Tract Infection (UTI)'),
('Menstrual Cramps / Period Pain'),
('Heatstroke / Exhaustion');

-- 2. Insert new medicines
INSERT IGNORE INTO medicines (medicine_name, description, dosage, side_effects, precautions) VALUES
('Dolo 650mg','High potency paracetamol for severe fever, body ache, and post-vaccination fever.','1 tablet 3 times a day after food. Maximum 3 tablets daily.','Mild nausea, stomach upset if taken continuously.','Do not take with other paracetamol products. Avoid alcohol.'),
('Pantoprazole 40mg','Proton-pump inhibitor for acute acid reflux, GERD, and peptic ulcer relief.','1 tablet once daily in the morning on an empty stomach, 30 min before breakfast.','Headache, mild abdominal pain, flatulence.','Swallow whole with water; do not crush or chew. Take regularly for 7–14 days.'),
('Montelukast 10mg + Levocetirizine 5mg','Dual-action antihistamine and leukotriene inhibitor for allergic rhinitis, chronic sneezing, and wheezing.','1 tablet once daily at bedtime.','Drowsiness, dry mouth, mild headache.','Avoid driving or operating machinery. Consult physician if asthma is acute.'),
('Dextromethorphan HBr 10mg/5ml Syrup','Centrally-acting cough suppressant for non-productive dry, hacking cough.','10 ml 3–4 times daily as needed. Max 40 ml in 24 hours.','Dizziness, mild sedation, nausea.','Not recommended for wet/productive cough with mucus. Stay hydrated.'),
('Guaifenesin 100mg/5ml Expectorant','Mucus thinning expectorant to clear chest congestion and wet cough.','10–20 ml every 4 hours after meals with plenty of warm water.','Nausea, stomach upset if taken on empty stomach.','Drink plenty of warm fluids to enhance mucus clearance.'),
('Meftal-Spas (Mefenamic Acid + Dicyclomine)','Antispasmodic and NSAID pain reliever for stomach cramps and menstrual cramps.','1 tablet 2–3 times daily strictly after food when pain occurs.','Dry mouth, blurred vision, dizziness, acidity.','Do not take on an empty stomach. Not for patients with glaucoma or kidney disease.'),
('Domperidone 10mg','Prokinetic antiemetic for nausea, vomiting, and gastric fullness.','1 tablet 15–30 minutes before meals, up to 3 times daily.','Dry mouth, headache, mild abdominal cramps.','Do not use continuously for more than 7 days without medical review.'),
('Ondansetron 4mg','Serotonin 5-HT3 receptor antagonist for acute nausea, vomiting, and food poisoning.','1 tablet dissolved on tongue or swallowed 30 min before food, 2 times daily.','Headache, constipation, fatigue.','Inform doctor if history of heart rhythm irregularities.'),
('Simethicone 80mg','Anti-foaming agent that breaks gas bubbles to relieve bloating, fullness, and flatulence.','1–2 chewable tablets after meals and at bedtime as needed.','None significant.','Chew tablets thoroughly before swallowing. Safe for most adults.'),
('Clotrimazole 1% Topical Cream','Broad-spectrum antifungal cream for ringworm, athlete''s foot, and jock itch.','Apply thin layer to affected clean dry area 2–3 times daily for 2–4 weeks.','Local burning, redness, mild skin irritation.','Continue treatment for 1–2 weeks after symptoms disappear to prevent relapse.'),
('Triamcinolone Acetonide 0.1% Paste','Corticosteroid paste providing fast relief and coating for painful mouth ulcers.','Apply small dab to ulcer at bedtime after meals. Do not rub.','Mild stinging upon application.','Do not eat or drink for 30 minutes after application.'),
('Carboxymethylcellulose 0.5% Eye Drops','Lubricant artificial tears for burning, stinging, and dryness of the eyes.','1–2 drops in the affected eye(s) 4–6 times daily as needed.','Brief blurriness right after instillation.','Discard bottle 30 days after opening. Do not touch dropper tip to eye.'),
('Cinnarizine 25mg','Antihistamine and calcium antagonist for motion sickness, vertigo, and inner ear balance disorders.','1 tablet 2 hours before travel, then 1 tablet every 8 hours during journey.','Drowsiness, weight gain with long-term use.','Causes sleepiness. Avoid alcohol while taking this medicine.'),
('Chlorpheniramine Maleate 4mg','Antiallergic tablet for hives, acute itching, sneezing, and watery eyes.','1 tablet every 4–6 hours as needed. Max 24mg per day.','Marked sedation, dry mouth, urinary retention.','Do not drive or operate machinery. Avoid in elderly with prostate issues.'),
('Amlodipine 5mg','Calcium channel blocker for high blood pressure and angina prevention.','1 tablet once daily at the same time every day (morning or night).','Ankle swelling (edema), dizziness, flushing.','Do not stop abruptly. Monitor blood pressure regularly.'),
('Atorvastatin 10mg','Statin lipid-lowering medication for hypercholesterolemia and heart disease prevention.','1 tablet once daily at night after food.','Muscle ache, mild digestive discomfort.','Report unexplained muscle tenderness to physician. Avoid grapefruit juice.'),
('Ferrous Ascorbate 100mg + Folic Acid 1.5mg','Iron supplement for iron deficiency anemia, fatigue, and hemoglobin replenishment.','1 tablet once daily after meals with citrus juice/water. Avoid milk or tea.','Black stools (harmless), constipation, mild nausea.','Take 2 hours apart from calcium supplements or antacids.'),
('Nitrofurantoin 100mg','Antibacterial medication specifically targeting urinary tract infections (UTI).','1 tablet twice daily with food for 5–7 days.','Nausea, loss of appetite, dark yellow/brown urine (normal).','Complete full prescribed course even if symptoms improve early.'),
('Ofloxacin 200mg + Ornidazole 500mg','Combined antibiotic and antiprotozoal for severe gastroenteritis, dysentery, and food poisoning.','1 tablet twice daily after meals for 3–5 days.','Metallic taste, nausea, dizziness.','Avoid all alcohol during treatment and for 48 hours after. Complete full course.'),
('Thiocolchicoside 4mg + Aceclofenac 100mg','Muscle relaxant and NSAID pain reliever for acute muscle spasms, neck stiffness, and sprains.','1 tablet twice daily strictly after meals for 5 days.','Gastric discomfort, drowsiness.','Do not take on empty stomach. Avoid in patients with peptic ulcers.'),
('Benzydamine 0.15% Mouthwash','Anti-inflammatory and analgesic mouth gargle for sore throat and painful gums.','Rinse or gargle with 15 ml undiluted for 30 seconds every 2–3 hours. Do not swallow.','Numbness or stinging in mouth.','Do not swallow. Not suitable for children under 6.'),
('Calamine Lotion','Soothing topical lotion for insect bites, sunburn, prickly heat, and chickenpox itching.','Shake well and apply gently over affected skin with cotton 3–4 times daily.','Mild dryness.','For external use only. Keep away from eyes and open wounds.'),
('Saline Nasal Spray 0.65%','Gentle isotonic saline spray to moisten nasal passages and loosen thick mucus.','2–3 sprays in each nostril 3–4 times daily as needed.','None significant.','Non-addictive, safe for daily long-term use across all age groups.'),
('Hydrocortisone 1% Topical Cream','Mild steroid cream for itchy skin flare-ups, dermatitis, eczema, and localized rashes.','Apply sparingly to affected area 1–2 times daily for up to 7 days.','Skin thinning if used excessively.','Do not use on face or broken skin without doctor supervision.');

-- 3. Dynamic mappings using subqueries
-- Sinusitis
INSERT IGNORE INTO symptom_medicine (symptom_id, medicine_id)
SELECT s.id, m.id FROM symptoms s, medicines m WHERE s.symptom_name='Sinusitis / Sinus Congestion' AND m.medicine_name IN ('Saline Nasal Spray 0.65%', 'Cetirizine 10mg', 'Paracetamol 500mg');

-- Dry Cough
INSERT IGNORE INTO symptom_medicine (symptom_id, medicine_id)
SELECT s.id, m.id FROM symptoms s, medicines m WHERE s.symptom_name='Dry Cough' AND m.medicine_name IN ('Dextromethorphan HBr 10mg/5ml Syrup', 'Cetirizine 10mg');

-- Chest Congestion
INSERT IGNORE INTO symptom_medicine (symptom_id, medicine_id)
SELECT s.id, m.id FROM symptoms s, medicines m WHERE s.symptom_name='Chest Congestion / Productive Cough' AND m.medicine_name IN ('Guaifenesin 100mg/5ml Expectorant', 'Amoxicillin 500mg');

-- Wheezing / Asthma (Mild)
INSERT IGNORE INTO symptom_medicine (symptom_id, medicine_id)
SELECT s.id, m.id FROM symptoms s, medicines m WHERE s.symptom_name='Wheezing / Asthma (Mild)' AND m.medicine_name IN ('Montelukast 10mg + Levocetirizine 5mg', 'Cetirizine 10mg');

-- Acid Reflux / GERD
INSERT IGNORE INTO symptom_medicine (symptom_id, medicine_id)
SELECT s.id, m.id FROM symptoms s, medicines m WHERE s.symptom_name='Acid Reflux / GERD' AND m.medicine_name IN ('Pantoprazole 40mg', 'Antacid (Gelusil/Digene)', 'Domperidone 10mg');

-- Gas & Bloating
INSERT IGNORE INTO symptom_medicine (symptom_id, medicine_id)
SELECT s.id, m.id FROM symptoms s, medicines m WHERE s.symptom_name='Gas & Bloating' AND m.medicine_name IN ('Simethicone 80mg', 'Antacid (Gelusil/Digene)', 'Domperidone 10mg');

-- Food Poisoning
INSERT IGNORE INTO symptom_medicine (symptom_id, medicine_id)
SELECT s.id, m.id FROM symptoms s, medicines m WHERE s.symptom_name='Food Poisoning' AND m.medicine_name IN ('ORS (Oral Rehydration Salts)', 'Ondansetron 4mg', 'Ofloxacin 200mg + Ornidazole 500mg');

-- Muscle Spasms / Cramps
INSERT IGNORE INTO symptom_medicine (symptom_id, medicine_id)
SELECT s.id, m.id FROM symptoms s, medicines m WHERE s.symptom_name='Muscle Spasms / Cramps' AND m.medicine_name IN ('Thiocolchicoside 4mg + Aceclofenac 100mg', 'Ibuprofen 400mg');

-- Neck Pain / Cervical Spondylosis
INSERT IGNORE INTO symptom_medicine (symptom_id, medicine_id)
SELECT s.id, m.id FROM symptoms s, medicines m WHERE s.symptom_name='Neck Pain / Cervical Spondylosis' AND m.medicine_name IN ('Thiocolchicoside 4mg + Aceclofenac 100mg', 'Diclofenac 50mg');

-- Knee Pain / Arthritis
INSERT IGNORE INTO symptom_medicine (symptom_id, medicine_id)
SELECT s.id, m.id FROM symptoms s, medicines m WHERE s.symptom_name='Knee Pain / Arthritis' AND m.medicine_name IN ('Diclofenac 50mg', 'Ibuprofen 400mg', 'Paracetamol 500mg');

-- Sprain & Swelling
INSERT IGNORE INTO symptom_medicine (symptom_id, medicine_id)
SELECT s.id, m.id FROM symptoms s, medicines m WHERE s.symptom_name='Sprain & Swelling' AND m.medicine_name IN ('Ibuprofen 400mg', 'Thiocolchicoside 4mg + Aceclofenac 100mg');

-- Mouth Ulcers / Canker Sores
INSERT IGNORE INTO symptom_medicine (symptom_id, medicine_id)
SELECT s.id, m.id FROM symptoms s, medicines m WHERE s.symptom_name='Mouth Ulcers / Canker Sores' AND m.medicine_name IN ('Triamcinolone Acetonide 0.1% Paste', 'Vitamin B-Complex');

-- Gingivitis / Swollen Gums
INSERT IGNORE INTO symptom_medicine (symptom_id, medicine_id)
SELECT s.id, m.id FROM symptoms s, medicines m WHERE s.symptom_name='Gingivitis / Swollen Gums' AND m.medicine_name IN ('Benzydamine 0.15% Mouthwash', 'Clove Oil', 'Amoxicillin 500mg');

-- Conjunctivitis / Pink Eye
INSERT IGNORE INTO symptom_medicine (symptom_id, medicine_id)
SELECT s.id, m.id FROM symptoms s, medicines m WHERE s.symptom_name='Conjunctivitis / Pink Eye' AND m.medicine_name IN ('Chloramphenicol Eye Drops', 'Carboxymethylcellulose 0.5% Eye Drops');

-- Dry Eyes
INSERT IGNORE INTO symptom_medicine (symptom_id, medicine_id)
SELECT s.id, m.id FROM symptoms s, medicines m WHERE s.symptom_name='Dry Eyes' AND m.medicine_name IN ('Carboxymethylcellulose 0.5% Eye Drops');

-- Ear Infection / Discharge
INSERT IGNORE INTO symptom_medicine (symptom_id, medicine_id)
SELECT s.id, m.id FROM symptoms s, medicines m WHERE s.symptom_name='Ear Infection / Discharge' AND m.medicine_name IN ('Amoxicillin 500mg', 'Paracetamol 500mg');

-- Motion Sickness
INSERT IGNORE INTO symptom_medicine (symptom_id, medicine_id)
SELECT s.id, m.id FROM symptoms s, medicines m WHERE s.symptom_name='Motion Sickness' AND m.medicine_name IN ('Cinnarizine 25mg', 'Domperidone 10mg');

-- Dizziness & Vertigo
INSERT IGNORE INTO symptom_medicine (symptom_id, medicine_id)
SELECT s.id, m.id FROM symptoms s, medicines m WHERE s.symptom_name='Dizziness & Vertigo' AND m.medicine_name IN ('Betahistine 8mg', 'Cinnarizine 25mg');

-- Dehydration
INSERT IGNORE INTO symptom_medicine (symptom_id, medicine_id)
SELECT s.id, m.id FROM symptoms s, medicines m WHERE s.symptom_name='Dehydration' AND m.medicine_name IN ('ORS (Oral Rehydration Salts)');

-- Severe Allergy / Urticaria (Hives)
INSERT IGNORE INTO symptom_medicine (symptom_id, medicine_id)
SELECT s.id, m.id FROM symptoms s, medicines m WHERE s.symptom_name='Severe Allergy / Urticaria (Hives)' AND m.medicine_name IN ('Chlorpheniramine Maleate 4mg', 'Montelukast 10mg + Levocetirizine 5mg', 'Calamine Lotion');

-- Fungal Skin Infection / Ringworm
INSERT IGNORE INTO symptom_medicine (symptom_id, medicine_id)
SELECT s.id, m.id FROM symptoms s, medicines m WHERE s.symptom_name='Fungal Skin Infection / Ringworm' AND m.medicine_name IN ('Clotrimazole 1% Topical Cream');

-- Acne / Pimples
INSERT IGNORE INTO symptom_medicine (symptom_id, medicine_id)
SELECT s.id, m.id FROM symptoms s, medicines m WHERE s.symptom_name='Acne / Pimples' AND m.medicine_name IN ('Azithromycin 500mg', 'Clotrimazole 1% Topical Cream');

-- Sunburn & Prickly Heat
INSERT IGNORE INTO symptom_medicine (symptom_id, medicine_id)
SELECT s.id, m.id FROM symptoms s, medicines m WHERE s.symptom_name='Sunburn & Prickly Heat' AND m.medicine_name IN ('Calamine Lotion', 'Paracetamol 500mg');

-- Eczema & Itchy Skin
INSERT IGNORE INTO symptom_medicine (symptom_id, medicine_id)
SELECT s.id, m.id FROM symptoms s, medicines m WHERE s.symptom_name='Eczema & Itchy Skin' AND m.medicine_name IN ('Hydrocortisone 1% Topical Cream', 'Cetirizine 10mg', 'Calamine Lotion');

-- High Blood Pressure / Hypertension
INSERT IGNORE INTO symptom_medicine (symptom_id, medicine_id)
SELECT s.id, m.id FROM symptoms s, medicines m WHERE s.symptom_name='High Blood Pressure / Hypertension' AND m.medicine_name IN ('Amlodipine 5mg');

-- High Cholesterol
INSERT IGNORE INTO symptom_medicine (symptom_id, medicine_id)
SELECT s.id, m.id FROM symptoms s, medicines m WHERE s.symptom_name='High Cholesterol' AND m.medicine_name IN ('Atorvastatin 10mg');

-- Iron Deficiency / Anemia
INSERT IGNORE INTO symptom_medicine (symptom_id, medicine_id)
SELECT s.id, m.id FROM symptoms s, medicines m WHERE s.symptom_name='Iron Deficiency / Anemia' AND m.medicine_name IN ('Ferrous Ascorbate 100mg + Folic Acid 1.5mg', 'Vitamin B-Complex');

-- Urinary Tract Infection (UTI)
INSERT IGNORE INTO symptom_medicine (symptom_id, medicine_id)
SELECT s.id, m.id FROM symptoms s, medicines m WHERE s.symptom_name='Urinary Tract Infection (UTI)' AND m.medicine_name IN ('Nitrofurantoin 100mg', 'Paracetamol 500mg');

-- Menstrual Cramps / Period Pain
INSERT IGNORE INTO symptom_medicine (symptom_id, medicine_id)
SELECT s.id, m.id FROM symptoms s, medicines m WHERE s.symptom_name='Menstrual Cramps / Period Pain' AND m.medicine_name IN ('Meftal-Spas (Mefenamic Acid + Dicyclomine)', 'Ibuprofen 400mg');

-- Heatstroke / Exhaustion
INSERT IGNORE INTO symptom_medicine (symptom_id, medicine_id)
SELECT s.id, m.id FROM symptoms s, medicines m WHERE s.symptom_name='Heatstroke / Exhaustion' AND m.medicine_name IN ('ORS (Oral Rehydration Salts)', 'Paracetamol 500mg', 'Vitamin B-Complex');

-- Add Dolo 650mg and Pantoprazole 40mg to existing fever & headache & acidity
INSERT IGNORE INTO symptom_medicine (symptom_id, medicine_id)
SELECT s.id, m.id FROM symptoms s, medicines m WHERE s.symptom_name='Fever' AND m.medicine_name='Dolo 650mg';

INSERT IGNORE INTO symptom_medicine (symptom_id, medicine_id)
SELECT s.id, m.id FROM symptoms s, medicines m WHERE s.symptom_name='Headache' AND m.medicine_name='Dolo 650mg';

INSERT IGNORE INTO symptom_medicine (symptom_id, medicine_id)
SELECT s.id, m.id FROM symptoms s, medicines m WHERE s.symptom_name='Acidity' AND m.medicine_name='Pantoprazole 40mg';
