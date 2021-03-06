package webapp;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.googlecode.objectify.ObjectifyService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

import static com.googlecode.objectify.ObjectifyService.ofy;


public class Blog extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //Username
        UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();
        String content = request.getParameter("content");
        String title = request.getParameter("title");

        if(content.equals("") || title.equals("") || user == null || content == null || title ==null){
            response.sendRedirect("/landing.jsp");
        }

        else{
            Entry entry = new Entry(user, content, title);

            ObjectifyService.register(Entry.class);
            ofy().save().entity(entry).now();

            response.sendRedirect("/landing.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/writepost.jsp").forward(request, response);
    }
}
