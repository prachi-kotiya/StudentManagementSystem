package com.sms.servlet;

import com.sms.dao.ParentDAO;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/DeleteParentServlet")
public class DeleteParentServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {


        try {

            int id = Integer.parseInt(request.getParameter("id"));


            ParentDAO dao = new ParentDAO();


            boolean status = dao.deleteParent(id);


            if(status){

                response.sendRedirect(
                    request.getContextPath() + "/ParentsServlet"
                );

            }
            else{

                response.getWriter()
                .println("Parent delete failed");

            }


        } catch(Exception e){

            e.printStackTrace();

            response.getWriter()
            .println("Error: " + e.getMessage());

        }

    }

}