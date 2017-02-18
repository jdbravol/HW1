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
import java.util.List;

public class Unsubscribe extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Username
        UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();

        //if user is not null
        if(user!= null){
            ObjectifyService.register(UserEntity.class);

            List<UserEntity> usersSubscribed = ObjectifyService.ofy().load().type(UserEntity.class).list();

            for(UserEntity e : usersSubscribed){
                if(user.equals(e.getUser())){
                    ObjectifyService.ofy().delete().entity(e).now();
                }
            }
        }

        response.sendRedirect("/landing.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}

