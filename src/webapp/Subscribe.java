package webapp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.io.IOException;
import java.util.*;

public class Subscribe extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/landing.jsp").forward(request, response);

        //Username
        UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();

        if(user == null){
            response.sendRedirect("/landing.jsp?entry=" + entry);
        }
    }
}

