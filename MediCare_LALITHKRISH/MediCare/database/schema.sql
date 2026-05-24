-- MediCare Database Schema
-- Run this script in MySQL before deploying the application

CREATE DATABASE IF NOT EXISTS medicare_db;
USE medicare_db;

-- Users table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    is_verified BOOLEAN DEFAULT FALSE,
    otp VARCHAR(10),
    otp_expiry DATETIME,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Symptoms table
CREATE TABLE IF NOT EXISTS symptoms (
    id INT AUTO_INCREMENT PRIMARY KEY,
    symptom_name VARCHAR(100) NOT NULL UNIQUE
);

-- Medicines table
CREATE TABLE IF NOT EXISTS medicines (
    id INT AUTO_INCREMENT PRIMARY KEY,
    medicine_name VARCHAR(150) NOT NULL,
    description TEXT,
    dosage VARCHAR(100),
    side_effects TEXT,
    precautions TEXT
);

-- Symptom-Medicine mapping
CREATE TABLE IF NOT EXISTS symptom_medicine (
    id INT AUTO_INCREMENT PRIMARY KEY,
    symptom_id INT NOT NULL,
    medicine_id INT NOT NULL,
    FOREIGN KEY (symptom_id) REFERENCES symptoms(id),
    FOREIGN KEY (medicine_id) REFERENCES medicines(id)
);

-- Search history
CREATE TABLE IF NOT EXISTS search_history (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    symptom_searched VARCHAR(200),
    searched_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- =========================================================
-- SEED DATA: Symptoms
-- =========================================================
INSERT IGNORE INTO symptoms (symptom_name) VALUES
('Headache'), ('Fever'), ('Cold'), ('Cough'), ('Sore Throat'),
('Body Pain'), ('Stomach Ache'), ('Nausea'), ('Vomiting'), ('Diarrhea'),
('Constipation'), ('Allergy'), ('Back Pain'), ('Joint Pain'), ('Skin Rash'),
('Acidity'), ('Indigestion'), ('Fatigue'), ('Anxiety'), ('Insomnia'),
('Eye Irritation'), ('Toothache'), ('Ear Pain'), ('Migraine'), ('Diabetes');

-- =========================================================
-- SEED DATA: Medicines
-- =========================================================
INSERT IGNORE INTO medicines (medicine_name, description, dosage, side_effects, precautions) VALUES
('Paracetamol 500mg','Pain reliever and fever reducer','1 tablet every 4–6 hours, max 4 tablets/day','Nausea, stomach upset','Do not exceed recommended dose. Avoid alcohol.'),
('Ibuprofen 400mg','Anti-inflammatory and pain reliever','1 tablet 3 times daily after food','Stomach irritation, dizziness','Take with food. Not for children under 12.'),
('Cetirizine 10mg','Antihistamine for allergies','1 tablet once daily at night','Drowsiness, dry mouth','Avoid driving. Not for pregnant women without doctor advice.'),
('Amoxicillin 500mg','Antibiotic for bacterial infections','1 capsule 3 times daily for 5–7 days','Nausea, diarrhea, rash','Complete the full course. Consult doctor first.'),
('Omeprazole 20mg','Proton pump inhibitor for acidity','1 capsule before breakfast daily','Headache, diarrhea','Not for long-term use without doctor advice.'),
('ORS (Oral Rehydration Salts)','Rehydration therapy for diarrhea/vomiting','Dissolve 1 sachet in 1 litre water, sip frequently','None significant','Safe for all ages. Keep patient hydrated.'),
('Loperamide 2mg','Anti-diarrheal medication','2 mg initially, then 1 mg after each loose stool, max 8 mg/day','Constipation, dizziness','Not for children under 6. Consult doctor if fever present.'),
('Metformin 500mg','Oral medication for Type 2 Diabetes','1 tablet twice daily after meals','Nausea, stomach upset','Monitor blood glucose regularly. Not for kidney disease.'),
('Loratadine 10mg','Non-drowsy antihistamine','1 tablet once daily','Headache, dry mouth','Safe during daytime. Avoid alcohol.'),
('Aspirin 75mg','Blood thinner and pain reliever','1 tablet daily after food (low dose)','Stomach bleeding risk','Not for children. Avoid if allergic to NSAIDs.'),
('Diclofenac 50mg','NSAID for joint and body pain','1 tablet 2–3 times daily after meals','GI upset, swelling','Use lowest effective dose. Not for long-term.'),
('Azithromycin 500mg','Antibiotic for respiratory infections','1 tablet daily for 3–5 days','Nausea, abdominal pain','Complete full course. Consult doctor first.'),
('Ranitidine 150mg','H2 blocker for indigestion','1 tablet twice daily before meals','Headache, constipation','Do not use for more than 2 weeks without advice.'),
('Betahistine 8mg','For vertigo and ear disorders','1 tablet 3 times daily','Nausea, headache','Take with food.'),
('Melatonin 3mg','Sleep aid for insomnia','1 tablet 30 min before bedtime','Drowsiness, headache','Short-term use only. Avoid if pregnant.'),
('Antacid (Gelusil/Digene)','Fast relief for acidity and heartburn','2 tablets/10ml after meals and at bedtime','Constipation (calcium-based)','Do not take with other medications simultaneously.'),
('Chloramphenicol Eye Drops','Antibiotic eye drops for eye infections','1–2 drops every 6 hours','Temporary stinging','Wash hands before use. Do not touch dropper tip to eye.'),
('Clove Oil','Natural remedy for toothache','Apply 1–2 drops on cotton to affected area','Mild burning','For temporary relief only. Consult dentist.'),
('Diphenhydramine 25mg','Antihistamine for sleep and allergy','1 tablet at bedtime','Drowsiness, dry mouth','Do not drive. Not for children under 12.'),
('Vitamin B-Complex','Nutritional supplement for fatigue','1 tablet daily after meals','None significant','Safe for long-term use.');

-- =========================================================
-- SEED DATA: Symptom-Medicine mapping
-- =========================================================
-- Headache (1) -> Paracetamol (1), Ibuprofen (2), Aspirin (10)
INSERT IGNORE INTO symptom_medicine (symptom_id, medicine_id) VALUES
(1,1),(1,2),(1,10),
-- Fever (2) -> Paracetamol (1), Ibuprofen (2)
(2,1),(2,2),
-- Cold (3) -> Cetirizine (3), Loratadine (9), Paracetamol (1)
(3,3),(3,9),(3,1),
-- Cough (4) -> Azithromycin (12), Amoxicillin (4)
(4,12),(4,4),
-- Sore Throat (5) -> Amoxicillin (4), Azithromycin (12), Paracetamol (1)
(5,4),(5,12),(5,1),
-- Body Pain (6) -> Ibuprofen (2), Diclofenac (11), Paracetamol (1)
(6,2),(6,11),(6,1),
-- Stomach Ache (7) -> Omeprazole (5), Antacid (16), Ranitidine (13)
(7,5),(7,16),(7,13),
-- Nausea (8) -> ORS (6), Omeprazole (5)
(8,6),(8,5),
-- Vomiting (9) -> ORS (6)
(9,6),
-- Diarrhea (10) -> ORS (6), Loperamide (7)
(10,6),(10,7),
-- Constipation (11) -> Antacid (16)
(11,16),
-- Allergy (12) -> Cetirizine (3), Loratadine (9), Diphenhydramine (19)
(12,3),(12,9),(12,19),
-- Back Pain (13) -> Diclofenac (11), Ibuprofen (2)
(13,11),(13,2),
-- Joint Pain (14) -> Diclofenac (11), Ibuprofen (2), Aspirin (10)
(14,11),(14,2),(14,10),
-- Skin Rash (15) -> Cetirizine (3), Loratadine (9)
(15,3),(15,9),
-- Acidity (16) -> Omeprazole (5), Antacid (16), Ranitidine (13)
(16,5),(16,16),(16,13),
-- Indigestion (17) -> Antacid (16), Omeprazole (5)
(17,16),(17,5),
-- Fatigue (18) -> Vitamin B-Complex (20)
(18,20),
-- Anxiety (19) -> Melatonin (15)
(19,15),
-- Insomnia (20) -> Melatonin (15), Diphenhydramine (19)
(20,15),(20,19),
-- Eye Irritation (21) -> Chloramphenicol Eye Drops (17)
(21,17),
-- Toothache (22) -> Clove Oil (18), Ibuprofen (2)
(22,18),(22,2),
-- Ear Pain (23) -> Betahistine (14), Amoxicillin (4)
(23,14),(23,4),
-- Migraine (24) -> Paracetamol (1), Ibuprofen (2)
(24,1),(24,2),
-- Diabetes (25) -> Metformin (8)
(25,8);
