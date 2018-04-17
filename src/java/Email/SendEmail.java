/*
 * Author: Reed Stock
 * Date: 4/11/2018
 * Description: Servlet used to send email with provided messages to provided email
 * addresses.
*/

// Package name
package Email;

// Import statements
import java.util.Properties;  
import javax.mail.*;  
import javax.mail.internet.InternetAddress;  
import javax.mail.internet.MimeMessage;  
  
public class SendEmail {  
    public static void send(String to,String subject,String msg){  

        final String user="test.air.iowa@gmail.com";//change accordingly  
        final String pass="testing123test!";  
        
        // sets SMTP server properties
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getDefaultInstance(properties,  
         new javax.mail.Authenticator() {  
          protected PasswordAuthentication getPasswordAuthentication() {  
           return new PasswordAuthentication(user,pass);  
           }  
        });  
        //2nd step)compose message  
        try {  
            MimeMessage message = new MimeMessage(session);  
            message.setFrom(new InternetAddress(user));  
            message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
            message.setSubject(subject);  
            message.setText(msg);  

            //3rd step)send message  
            Transport.send(message);  

            System.out.println("Done");  

        } catch (MessagingException e) {  
           throw new RuntimeException(e);  
        }  
    }  
}  