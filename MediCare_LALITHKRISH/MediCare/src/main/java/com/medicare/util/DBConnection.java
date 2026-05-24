package com.medicare.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Database connection utility for MediCare application.
 * Uses MySQL via JDBC.
 */
public class DBConnection {

    // -------------------------------------------------------
    // CHANGE these values to match your local MySQL setup
    // -------------------------------------------------------
    private static final String URL      = "jdbc:mysql://localhost:3306/medicare_db?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
    private static final String USER     = "root";
    private static final String PASSWORD = "Lali@2006";
    // -------------------------------------------------------

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("MySQL JDBC Driver not found!", e);
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
