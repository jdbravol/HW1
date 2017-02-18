package webapp;

import com.google.appengine.api.users.User;
import com.googlecode.objectify.Objectify;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
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

public class Email extends HttpServlet {

    public void sendEmail() {

        ObjectifyService.register(Entry.class);
        List<Entry> blogPosts = ObjectifyService.ofy().load().type(Entry.class).list();
        String message = "The latest Posts that have been added to TheBlog are: \n";
        Date date = new Date();
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        int day = cal.get(Calendar.DATE);
        for(Entry entry: blogPosts){
            Date postDate = entry.date;
            Calendar cal2 = Calendar.getInstance();
            cal2.setTime(postDate);
            if (cal.get(Calendar.DATE) == cal2.get(Calendar.DATE)){
                message = message.concat(entry.title + "\n");
                message = message.concat(entry.content +"\n");
                message = message.concat("---------------------------\n");
            }
        }

        ObjectifyService.register(User.class);
        List<User> emails = ObjectifyService.ofy().load().type(User.class).list();
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

                for (User email : emails) {
                    mailMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(email.getEmail()));
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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            sendEmail();
        }
        catch (Exception ex) {
        }

    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        doGet(req, resp);
    }
}

