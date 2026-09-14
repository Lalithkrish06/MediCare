package com.medicare.util;

import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;
import java.util.Random;

/**
 * Email utility for sending OTP verification mails.
 * Configure with your Gmail SMTP credentials.
 */
public class EmailUtil {

    private static final Properties appProps = new Properties();

    static {
        try (java.io.InputStream in = EmailUtil.class.getClassLoader().getResourceAsStream("config.properties")) {
            if (in != null) {
                appProps.load(in);
            }
        } catch (Exception e) {
            System.err.println("[WARN] Could not load config.properties: " + e.getMessage());
        }
    }

    private static String getFromEmail() {
        if (System.getenv("MEDICARE_EMAIL") != null && !System.getenv("MEDICARE_EMAIL").trim().isEmpty()) {
            return System.getenv("MEDICARE_EMAIL").trim();
        }
        return appProps.getProperty("mail.smtp.email", "your_email@gmail.com").trim();
    }

    private static String getAppPassword() {
        if (System.getenv("MEDICARE_EMAIL_PASS") != null && !System.getenv("MEDICARE_EMAIL_PASS").trim().isEmpty()) {
            return System.getenv("MEDICARE_EMAIL_PASS").trim();
        }
        return appProps.getProperty("mail.smtp.app_password", "your_app_password_here").trim();
    }

    private static volatile String lastGeneratedOtp = null;
    private static volatile boolean lastEmailSentSuccessfully = false;

    /**
     * Generates a 6-digit OTP string.
     */
    public static String generateOTP() {
        Random rnd = new Random();
        int otp = 100000 + rnd.nextInt(900000);
        lastGeneratedOtp = String.valueOf(otp);
        return lastGeneratedOtp;
    }

    public static String getLastGeneratedOtp() {
        return lastGeneratedOtp;
    }

    public static boolean wasLastEmailSentSuccessfully() {
        return lastEmailSentSuccessfully;
    }

    /**
     * Sends OTP email to the specified recipient.
     * If SMTP fails or dummy credentials are detected, prints the OTP to console.
     *
     * @param toEmail   Recipient email address
     * @param otp       The OTP code to send
     * @param userName  Recipient's display name
     */
    public static void sendOTPEmail(String toEmail, String otp, String userName) {
        lastGeneratedOtp = otp;
        lastEmailSentSuccessfully = false;

        // Print to server console for testing/development
        System.out.println("=================================================");
        System.out.println("  [MEDICARE OTP DISPATCH]");
        System.out.println("  Recipient: " + userName + " <" + toEmail + ">");
        System.out.println("  OTP Code : " + otp);
        System.out.println("=================================================");

        String fromEmail = getFromEmail();
        String appPassword = getAppPassword();

        // If credentials are placeholders, skip SMTP network attempt
        if ("your_email@gmail.com".equalsIgnoreCase(fromEmail) ||
            "your_app_password_here".equalsIgnoreCase(appPassword)) {
            System.out.println("[INFO] Gmail SMTP placeholder credentials detected. Using console OTP mode.");
            return;
        }

        try {
            Properties props = new Properties();
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

            Session session = Session.getInstance(props, new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, appPassword);
                }
            });

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail, "MediCare Support"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject("MediCare - Your Login OTP Verification Code");

            String htmlContent =
                "<!DOCTYPE html>" +
                "<html><body style='font-family:Arial,sans-serif;background:#f4f4f4;padding:20px;'>" +
                "<div style='max-width:500px;margin:auto;background:#fff;border-radius:10px;padding:30px;" +
                "box-shadow:0 2px 8px rgba(0,0,0,0.1);'>" +
                "<h2 style='color:#2c7be5;text-align:center;'>🏥 MediCare</h2>" +
                "<hr style='border:1px solid #eee;'/>" +
                "<p>Hello <strong>" + userName + "</strong>,</p>" +
                "<p>Your one-time password (OTP) for MediCare login is:</p>" +
                "<div style='text-align:center;margin:25px 0;'>" +
                "<span style='font-size:36px;font-weight:bold;letter-spacing:8px;" +
                "color:#2c7be5;background:#f0f6ff;padding:15px 30px;border-radius:8px;'>" +
                otp + "</span></div>" +
                "<p style='color:#888;font-size:13px;'>This OTP is valid for <strong>10 minutes</strong>. " +
                "Do not share it with anyone.</p>" +
                "<p style='color:#888;font-size:13px;'>If you did not request this, please ignore this email.</p>" +
                "<hr style='border:1px solid #eee;'/>" +
                "<p style='text-align:center;color:#aaa;font-size:12px;'>" +
                "&copy; 2024 MediCare &mdash; Developed by LALITH KRISH</p>" +
                "</div></body></html>";

            message.setContent(htmlContent, "text/html; charset=utf-8");
            Transport.send(message);
            lastEmailSentSuccessfully = true;
            System.out.println("[INFO] OTP email successfully delivered to: " + toEmail);

        } catch (Exception e) {
            System.err.println("[WARN] Could not send OTP email via SMTP (" + e.getMessage() + ").");
            System.err.println("[INFO] Use OTP code " + otp + " from server console to complete verification.");
        }
    }
}
