package com.medicare.dao;

import com.medicare.model.Medicine;
import com.medicare.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MedicineDAO {

    /** Get all symptom names (for autocomplete/dropdown). */
    public List<String> getAllSymptoms() throws SQLException {
        List<String> list = new ArrayList<>();
        String sql = "SELECT symptom_name FROM symptoms ORDER BY symptom_name";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) list.add(rs.getString("symptom_name"));
        }
        return list;
    }

    /** Get medicines recommended for a given symptom name. */
    public List<Medicine> getMedicinesBySymptom(String symptomName) throws SQLException {
        List<Medicine> list = new ArrayList<>();
        String sql =
            "SELECT m.id, m.medicine_name, m.description, m.dosage, m.side_effects, m.precautions " +
            "FROM medicines m " +
            "JOIN symptom_medicine sm ON m.id = sm.medicine_id " +
            "JOIN symptoms s ON sm.symptom_id = s.id " +
            "WHERE LOWER(s.symptom_name) = LOWER(?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, symptomName);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Medicine med = new Medicine();
                med.setId(rs.getInt("id"));
                med.setMedicineName(rs.getString("medicine_name"));
                med.setDescription(rs.getString("description"));
                med.setDosage(rs.getString("dosage"));
                med.setSideEffects(rs.getString("side_effects"));
                med.setPrecautions(rs.getString("precautions"));
                list.add(med);
            }
        }
        return list;
    }

    /** Full-text search across symptom names (partial match). */
    public List<String> searchSymptoms(String query) throws SQLException {
        List<String> list = new ArrayList<>();
        String sql = "SELECT symptom_name FROM symptoms WHERE LOWER(symptom_name) LIKE LOWER(?) ORDER BY symptom_name LIMIT 10";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, "%" + query + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) list.add(rs.getString("symptom_name"));
        }
        return list;
    }
}
