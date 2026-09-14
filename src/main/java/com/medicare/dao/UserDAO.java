package com.medicare.dao;

import com.medicare.model.User;
import com.medicare.util.DBConnection;

import java.sql.*;
import java.time.LocalDateTime;

public class UserDAO {

    /** Register a new user (unverified). */
    public boolean registerUser(User user) throws SQLException {
        String sql = "INSERT INTO users (full_name, email, password_hash, is_verified) VALUES (?, ?, ?, false)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, user.getFullName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPasswordHash());
            return ps.executeUpdate() > 0;
        }
    }

    /** Check if an email already exists. */
    public boolean emailExists(String email) throws SQLException {
        String sql = "SELECT id FROM users WHERE email = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        }
    }

    /** Retrieve user by email. */
    public User getUserByEmail(String email) throws SQLException {
        String sql = "SELECT * FROM users WHERE email = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setFullName(rs.getString("full_name"));
                u.setEmail(rs.getString("email"));
                u.setPasswordHash(rs.getString("password_hash"));
                u.setVerified(rs.getBoolean("is_verified"));
                u.setOtp(rs.getString("otp"));
                u.setOtpExpiry(rs.getTimestamp("otp_expiry"));
                u.setCreatedAt(rs.getTimestamp("created_at"));
                return u;
            }
        }
        return null;
    }

    /** Save OTP and expiry (10 minutes from now) for the user. */
    public boolean saveOTP(String email, String otp) throws SQLException {
        String sql = "UPDATE users SET otp = ?, otp_expiry = ? WHERE email = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            Timestamp expiry = Timestamp.valueOf(LocalDateTime.now().plusMinutes(10));
            ps.setString(1, otp);
            ps.setTimestamp(2, expiry);
            ps.setString(3, email);
            return ps.executeUpdate() > 0;
        }
    }

    /** Verify OTP and mark user as verified if valid. */
    public String verifyOTP(String email, String otp) throws SQLException {
        String sql = "SELECT otp, otp_expiry FROM users WHERE email = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String storedOtp = rs.getString("otp");
                Timestamp expiry = rs.getTimestamp("otp_expiry");

                if (storedOtp == null || !storedOtp.equals(otp)) {
                    return "INVALID_OTP";
                }
                if (expiry == null || expiry.before(new Timestamp(System.currentTimeMillis()))) {
                    return "EXPIRED_OTP";
                }
                // Mark verified and clear OTP
                clearOTPAndVerify(email, conn);
                return "SUCCESS";
            }
        }
        return "USER_NOT_FOUND";
    }

    private void clearOTPAndVerify(String email, Connection conn) throws SQLException {
        String sql = "UPDATE users SET is_verified = true, otp = NULL, otp_expiry = NULL WHERE email = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            ps.executeUpdate();
        }
    }

    /** Log search history for a user. */
    public void logSearch(int userId, String symptom) throws SQLException {
        String sql = "INSERT INTO search_history (user_id, symptom_searched) VALUES (?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setString(2, symptom);
            ps.executeUpdate();
        }
    }
}
