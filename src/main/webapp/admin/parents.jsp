<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="com.sms.model.Parent"%>

<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("../login.html");
        return;
    }

    List<Parent> parentList
            = (List<Parent>) request.getAttribute("parentList");

    String path = request.getContextPath();
%>

<!DOCTYPE html>
<html>

    <head>

        <meta charset="UTF-8">

        <title>Parents</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

        <style>

            body{
                margin:0;
                background:#f4f6f9;
                font-family:Arial,Helvetica,sans-serif;
            }

            .sidebar{
                width:250px;
                height:100vh;
                position:fixed;
                background:#212529;
            }

            .sidebar h3{
                color:white;
                text-align:center;
                padding:20px;
            }

            .sidebar a{
                display:block;
                color:white;
                text-decoration:none;
                padding:12px 20px;
            }

            .sidebar a:hover{
                background:#0d6efd;
            }

            .main{
                margin-left:250px;
            }

            .table th{
                background:#0d6efd;
                color:white;
                text-align:center;
            }

            .table td{
                text-align:center;
                vertical-align:middle;
            }

        </style>

    </head>

    <body>

        <!-- Sidebar -->

        <div class="sidebar">

            <h3>SMS</h3>

            <a href="<%=path%>/DashboardServlet">Dashboard</a>

            <a href="<%=path%>/StudentsServlet">Students</a>

            <a href="<%=path%>/TeachersServlet">Teachers</a>

            <a href="<%=path%>/ParentsServlet">Parents</a>

            <a href="<%=path%>/AttendanceListServlet">Attendance</a>

            <a href="<%=path%>/FeeListServlet">Fees</a>

            <a href="<%=path%>/ResultListServlet">Results</a>

            <a href="<%=path%>/LogoutServlet">Logout</a>

        </div>

        <!-- Main -->

        <div class="main">

            <nav class="navbar navbar-dark bg-primary">

                <div class="container-fluid">

                    <span class="navbar-brand">

                        Student Management System

                    </span>

                </div>

            </nav>

            <div class="container-fluid mt-4">

                <div class="d-flex justify-content-between align-items-center mb-3">

                    <h2>Parents List</h2>

                    <a href="<%=path%>/ParentFormServlet"
                       class="btn btn-success">

                        <i class="bi bi-plus-circle"></i>

                        Add Parent

                    </a>

                </div>

                <form action="<%=path%>/ParentsServlet"
                      method="get">

                    <div class="input-group mb-3">

                        <input
                            type="text"
                            name="keyword"
                            class="form-control"
                            placeholder="Search Parent">

                        <button
                            class="btn btn-primary">

                            <i class="bi bi-search"></i>

                            Search

                        </button>

                    </div>

                </form>

                <table class="table table-bordered table-hover">

                    <thead>

                        <tr>

                            <th>ID</th>

                            <th>Parent ID</th>

                            <th>Student ID</th>

                            <th>Name</th>

                            <th>Email</th>

                            <th>Phone</th>

                            <th>Occupation</th>

                            <th>Address</th>

                            <th>Action</th>

                        </tr>

                    </thead>

                    <tbody>

                        <%

                            if (parentList != null && !parentList.isEmpty()) {

                                for (Parent p : parentList) {

                        %>

                        <tr>

                            <td><%=p.getId()%></td>

                            <td><%=p.getParentId()%></td>

                            <td><%=p.getStudentId()%></td>

                            <td><%=p.getFullName()%></td>

                            <td><%=p.getEmail()%></td>

                            <td><%=p.getPhone()%></td>

                            <td><%=p.getOccupation()%></td>

                            <td><%=p.getAddress()%></td>

                            <td>

                                <a href="<%=path%>/EditParentServlet?id=<%=p.getId()%>"
                                   class="btn btn-warning btn-sm">

                                    <i class="bi bi-pencil-square"></i>

                                    Edit

                                </a>

                                <a href="<%=path%>/DeleteParentServlet?id=<%=p.getId()%>"
                                   class="btn btn-danger btn-sm"
                                   onclick="return confirm('Delete this parent?')">

                                    <i class="bi bi-trash"></i>

                                    Delete

                                </a>

                            </td>

                        </tr>

                        <%

                            }

                        } else {

                        %>

                        <tr>

                            <td colspan="9" class="text-center">

                                No Parent Found

                            </td>

                        </tr>

                        <%    }

                        %>

                    </tbody>

                </table>

            </div>

        </div>

    </body>

</html>