package com.sms.servlet;

import com.sms.dao.ParentDAO;
import com.sms.model.Parent;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddParentServlet")
public class AddParentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        Parent parent = new Parent();

        parent.setStudentId(Integer.parseInt(request.getParameter("studentId")));
        parent.setFullName(request.getParameter("fullName"));
        parent.setEmail(request.getParameter("email"));
        parent.setPhone(request.getParameter("phone"));
        parent.setOccupation(request.getParameter("occupation"));
        parent.setAddress(request.getParameter("address"));

        ParentDAO dao = new ParentDAO();

        boolean status = dao.addParent(parent);
        if (status) {

            response.sendRedirect(request.getContextPath() + "/ParentsServlet");

        } else {

            response.getWriter().println("Failed to Add Parent.");

        }
    }
}
