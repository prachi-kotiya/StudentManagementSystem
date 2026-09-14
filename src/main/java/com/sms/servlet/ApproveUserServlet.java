package com.sms.servlet;

import com.sms.dao.ParentDAO;
import com.sms.dao.StudentDAO;
import com.sms.dao.TeacherDAO;
import com.sms.dao.UserDAO;
import com.sms.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/ApproveUserServlet")
public class ApproveUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        UserDAO dao = new UserDAO();

        User user = dao.getUserById(id);

        if (user != null) {

            dao.approveUser(id);

            if ("Student".equalsIgnoreCase(user.getRole())) {

                new StudentDAO().addStudentFromUser(user);

            } else if ("Teacher".equalsIgnoreCase(user.getRole())) {

                new TeacherDAO().addTeacherFromUser(user);

            } else if ("Parent".equalsIgnoreCase(user.getRole())) {

                new ParentDAO().addParentFromUser(user);
            }
        }

        response.sendRedirect("PendingUsersServlet");
    }
}
