package webapp;

import com.google.appengine.api.datastore.*;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

import static com.googlecode.objectify.ObjectifyService.ofy;


@WebServlet(name = "Blog")
public class Blog extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //Username
        UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();
        String content = request.getParameter("content");
        String title = request.getParameter("title");
        Date date = new Date();

        Entry entry = new Entry(user, content, title);

        ObjectifyService.register(Entry.class);
        ofy().save().entity(entry).now();

        response.sendRedirect("/landing.jsp?entry=" + entry);


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
