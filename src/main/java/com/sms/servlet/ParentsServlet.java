package com.sms.servlet;

import com.sms.dao.ParentDAO;
import com.sms.model.Parent;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/ParentsServlet")
public class ParentsServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {


        ParentDAO dao = new ParentDAO();


        List<Parent> parentList = dao.getAllParents();


        request.setAttribute("parentList", parentList);


        request.getRequestDispatcher("/admin/parents.jsp")
                .forward(request, response);

    }

}