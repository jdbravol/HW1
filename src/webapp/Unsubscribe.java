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

public class Unsubscribe extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/landing.jsp").forward(request, response);

        //Username
        UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();

        //if user is not null
        if(user!= null){
            ObjectifyService.register(User.class);
            ObjectifyService.ofy().delete().entity(user).now();
        }

        response.sendRedirect("/landing.jsp");
    }
}

