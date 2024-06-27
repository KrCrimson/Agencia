/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author windows10
 */

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class PasswordRecovery {
    private String userEmail;

    public PasswordRecovery(String userEmail) {
        this.userEmail = userEmail;
    }

    public void sendRecoveryEmail() throws MessagingException {
        String host = "smtp.gmail.com";
        String from = "sebastianarce2010@gmail.com";
        String pass = "12345";

        Properties props = System.getProperties();
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.user", from);
        props.put("mail.smtp.password", pass);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");

        Session session = Session.getDefaultInstance(props, null);
        MimeMessage message = new MimeMessage(session);

        message.setFrom(new InternetAddress(from));
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(userEmail));

        message.setSubject("Password Recovery");
        message.setText("To reset your password, click the link below:\n" +
                "http://www.example.com/reset-password?email=" + userEmail);

        Transport transport = session.getTransport("smtp");
        transport.connect(host, from, pass);
        transport.sendMessage(message, message.getAllRecipients());
        transport.close();
    }
}
