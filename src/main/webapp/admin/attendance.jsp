<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.sms.model.Attendance" %>

<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("../login.html");
        return;
    }

    List<Attendance> attendanceList = (List<Attendance>) request.getAttribute("attendanceList");
    String path = request.getContextPath();
%>

<!DOCTYPE html>
<html>

    <head>

        <meta charset="UTF-8">
        <title>Attendance</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

        <style>

            body{
                background:#f4f6f9;
                margin:0;
            }

            .sidebar{
                width:250px;
                min-height:100vh;
                background:#212529;
                position:fixed;
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

        <div class="main">

            <nav class="navbar navbar-dark bg-primary">

                <div class="container-fluid">

                    <span class="navbar-brand">

                        Student Management System

                    </span>

                </div>

            </nav>

            <div class="container-fluid mt-4">

                <div class="d-flex justify-content-between mb-3">

                    <h2>Attendance List</h2>

                    <a href="<%=path%>/AttendanceFormServlet"
                       class="btn btn-success">

                        <i class="bi bi-plus-circle"></i>

                        Add Attendance

                    </a>

                </div>

                <div class="input-group mb-3">

                    <input
                        type="text"
                        id="searchInput"
                        class="form-control"
                        placeholder="Search Student">

                    <button class="btn btn-primary">

                        <i class="bi bi-search"></i>

                        Search

                    </button>

                </div>

                <table class="table table-bordered table-hover" id="attendanceTable">

                    <thead>

                        <tr>

                            <th>ID</th>

                            <th>Student Name</th>

                            <th>Date</th>

                            <th>Status</th>

                            <th>Action</th>

                        </tr>

                    </thead>

                    <tbody>

                        <%

                            if (attendanceList != null) {

                                for (Attendance a : attendanceList) {

                        %>

                        <tr>

                            <td><%=a.getId()%></td>

                            <td><%=a.getStudentName()%></td>

                            <td><%=a.getAttendanceDate()%></td>

                            <td>

                                <%

                                    if ("Present".equalsIgnoreCase(a.getStatus())) {

                                %>

                                <span class="badge bg-success">Present</span>

                                <%} else if ("Absent".equalsIgnoreCase(a.getStatus())) {

                                %>

                                <span class="badge bg-danger">Absent</span>

                                <%} else if ("Late".equalsIgnoreCase(a.getStatus())) {

                                %>

                                <span class="badge bg-warning text-dark">Late</span>

                                <%} else {

                                %>

                                <span class="badge bg-secondary"><%=a.getStatus()%></span>

                                <%

                                    }

                                %>

                            </td>

                            <td>

                                <a href="<%=path%>/EditAttendanceServlet?id=<%=a.getId()%>"
                                   class="btn btn-warning btn-sm">

                                    <i class="bi bi-pencil-square"></i>

                                </a>

                                <a href="<%=path%>/DeleteAttendanceServlet?id=<%=a.getId()%>"
                                   class="btn btn-danger btn-sm"
                                   onclick="return confirm('Delete this attendance record?')">

                                    <i class="bi bi-trash"></i>

                                </a>

                            </td>

                        </tr>

                        <%

                                }

                            }

                        %>

                    </tbody>

                </table>

            </div>

        </div>

        <script>

            const search = document.getElementById("searchInput");

            search.addEventListener("keyup", function () {

                let filter = this.value.toUpperCase();

                let rows = document.querySelector("#attendanceTable tbody").rows;

                for (let i = 0; i < rows.length; i++) {

                    let txt = rows[i].cells[1].textContent.toUpperCase();

                    rows[i].style.display = txt.indexOf(filter) > -1 ? "" : "none";

                }

            });

        </script>

    </body>

</html>