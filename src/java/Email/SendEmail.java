/*
 * Author: Reed Stock
 * Date: 4/11/2018
 * Description: Servlet used to send email with provided messages to provided email
 * addresses.
*/

// Package name
package Email;

// Import statements
import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail {

    public void sendEmail(String email, String password) throws AddressException,
        MessagingException {

        // sets SMTP server properties
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        // Sets admin email and several other parameters
        final String adminEmail = "test.iowa.air@gmail.com";
        final String adminPass = "testtesttest123";
        String toAddress = email; //
        String subject = "Hello new manager!";
        String message = "Your Iowa Air email/username is: " + email +
                "\nYour Weather App password is: " + password;

        // creates a new session with an authenticator
        Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(adminEmail, adminPass);
            }
        };

        // New Session object
        Session session = Session.getInstance(properties, auth);

        // creates a new e-mail message
        Message msg = new MimeMessage(session);

        msg.setFrom(new InternetAddress(adminEmail));
        InternetAddress[] toAddresses = { new InternetAddress(toAddress) };
        msg.setRecipients(Message.RecipientType.TO, toAddresses);
        msg.setSubject(subject);
        msg.setSentDate(new Date());
        // set plain text message
        msg.setText(message);

        // sends the e-mail
        Transport.send(msg);

    }
}