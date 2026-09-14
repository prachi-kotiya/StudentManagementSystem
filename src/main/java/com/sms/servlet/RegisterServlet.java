package com.sms.servlet;

import java.io.IOException;

import com.sms.dao.UserDAO;
import com.sms.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        User user = new User();

        user.setFullname(request.getParameter("fullname"));
        user.setEmail(request.getParameter("email"));
        user.setPhone(request.getParameter("phone"));
        user.setRole(request.getParameter("role"));
        user.setUsername(request.getParameter("username"));
        user.setPassword(request.getParameter("password"));

        // By default every new registration is Pending
        user.setStatus("Approved");

        UserDAO dao = new UserDAO();

        if (dao.registerUser(user)) {

            response.sendRedirect("login.jsp");

        } else {

            response.getWriter().println("Registration Failed!");

        }
    }
}