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
    // Local MySQL credentials with environment variable overrides
    // -------------------------------------------------------
    private static final String URL = System.getenv("MEDICARE_DB_URL") != null
            ? System.getenv("MEDICARE_DB_URL")
            : "jdbc:mysql://localhost:3306/medicare_db?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";

    private static final String USER = System.getenv("MEDICARE_DB_USER") != null
            ? System.getenv("MEDICARE_DB_USER")
            : "root";

    private static final String PASSWORD = System.getenv("MEDICARE_DB_PASS") != null
            ? System.getenv("MEDICARE_DB_PASS")
            : "Lali@2006";
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
