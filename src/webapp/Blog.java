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


@WebServlet(name = "Blog")
public class Blog extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //Username
        UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();


        String blogName = request.getParameter("blogName");
        if (blogName == null){
            blogName = "default";
        }
        Key blogKey = KeyFactory.createKey("Blog", blogName);


        String content = request.getParameter("content");
        String title = request.getParameter("title");
        Date date = new Date();


        Entity entry = new Entity("Entry", blogKey);
        entry.setProperty("user", user.getNickname());
        entry.setProperty("date", date);
        entry.setProperty("content", content);
        entry.setProperty("title", title);

        DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
        datastore.put(entry);
        response.sendRedirect("/landing.jpg?blogName=" + blogName);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
