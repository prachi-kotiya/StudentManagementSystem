package com.sms.servlet;

import com.sms.dao.ParentDAO;
import com.sms.dao.ResultDAO;
import com.sms.model.Parent;
import com.sms.model.Result;
import com.sms.model.User;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ParentResultServlet")
public class ParentResultServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Check login
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login.html"
            );

            return;
        }

        // Get logged-in user
        User user = (User) session.getAttribute("user");

        // Get parent using email
        ParentDAO parentDAO = new ParentDAO();

        Parent parent = parentDAO.getParentByEmail(user.getEmail());

        if (parent == null) {

            response.getWriter().println("Parent record not found.");

            return;
        }

        // Get student's ID
        int studentId = parent.getStudentId();

        // Get results
        ResultDAO resultDAO = new ResultDAO();

        List<Result> resultList =
                resultDAO.getResultsByStudentId(studentId);

        // Send data to JSP
        request.setAttribute("parent", parent);
        request.setAttribute("resultList", resultList);

        // Open result page
        request.getRequestDispatcher(
                "/Parent/results.jsp"
        ).forward(request, response);
    }
}