package webapp;

import com.googlecode.objectify.ObjectifyService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

public class Email {

    public void SendEmail() {

        String message = "New Posts have been added to TheBlog";
        ObjectifyService.register(String.class);
        List<String> emails = ObjectifyService.ofy().load().type(String.class).list();
        if (emails.isEmpty()) {
            return;
        } else {
            Properties prop = System.getProperties();
            prop.put("mail.smtp.host", "smtp.gmail.com");
            prop.put("mail.smtp.auth", "true");
            prop.put("mail.smtp.port", "465");
            prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            prop.put("mail.smtp.socketFactory.port", "465");
            prop.put("mail.smtp.socketFactory.fallback", "false");

            Session mailSession = Session.getDefaultInstance(prop, null);
            mailSession.setDebug(true);

            Message mailMessage = new MimeMessage(mailSession);
            try {
                mailMessage.setFrom(new InternetAddress("theblog461l@gmail.com"));

                for (String email : emails) {
                    mailMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
                    mailMessage.setSubject("TheBlog Updates");
                    mailMessage.setContent(message, "text/html");
                    Transport transport = mailSession.getTransport("smtp");
                    transport.connect("smtp.gmail.com", "theblog461l@gmail.com", "DummyPassword");
                    transport.sendMessage(mailMessage, mailMessage.getAllRecipients());
                }

            } catch (MessagingException e) {
                e.printStackTrace();
            }
        }
    }
}

