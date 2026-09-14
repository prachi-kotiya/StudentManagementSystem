package com.sms.servlet;

import com.sms.dao.UserDAO;
import com.sms.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/PendingUsersServlet")
public class PendingUsersServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        UserDAO dao = new UserDAO();

        List<User> pendingUsers = dao.getPendingUsers();

        request.setAttribute("pendingUsers", pendingUsers);

        request.getRequestDispatcher("admin/pendingUsers.jsp")
               .forward(request, response);
    }
}