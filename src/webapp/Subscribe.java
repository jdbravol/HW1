package webapp;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.googlecode.objectify.ObjectifyService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.io.IOException;
import java.util.*;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import static com.googlecode.objectify.ObjectifyService.ofy;

public class Subscribe extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("/Subscribed.jsp");

        //Username
        UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();

        //If user doesn' exist, make him log in
        if(user == null){
            request.getRequestDispatcher("landing.jsp").forward(request, response);
        }

        //Add user to objectify
        else{
            ObjectifyService.register(UserEntity.class);
            ofy().save().entity(new UserEntity(user)).now();
            request.getRequestDispatcher("Subscribed.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

