<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.List" %>
<%@ page import="com.sms.model.Parent" %>
<%@ page import="com.sms.model.Result" %>

<%
    // Check login
    if (session.getAttribute("user") == null) {

        response.sendRedirect(
                request.getContextPath() + "/login.html"
        );

        return;
    }

    Parent parent =
            (Parent) request.getAttribute("parent");

    List<Result> resultList =
            (List<Result>) request.getAttribute("resultList");

    String path = request.getContextPath();
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Results - Parent Dashboard</title>

<link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">

<link
href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
rel="stylesheet">

<style>

body {
    margin: 0;
    background: #f4f6f9;
    font-family: Arial, Helvetica, sans-serif;
}

/* Sidebar */

.sidebar {
    width: 250px;
    height: 100vh;
    position: fixed;
    background: #212529;
    left: 0;
    top: 0;
}

.sidebar h3 {
    color: white;
    text-align: center;
    padding: 20px;
    margin-bottom: 10px;
}

.sidebar a {
    display: block;
    color: white;
    text-decoration: none;
    padding: 13px 25px;
    font-size: 16px;
}

.sidebar a:hover {
    background: #0d6efd;
}

.sidebar a.active {
    background: #0d6efd;
}

/* Main */

.main {
    margin-left: 250px;
}

/* Navbar */

.navbar {
    height: 75px;
}

/* Content */

.content {
    padding: 30px;
}

.page-title {
    margin-bottom: 25px;
}

/* Card */

.result-card {
    background: white;
    border-radius: 12px;
    padding: 25px;
    box-shadow: 0 3px 12px rgba(0,0,0,0.08);
}

/* Table */

.table th {
    background: #0d6efd;
    color: white;
    text-align: center;
}

.table td {
    text-align: center;
    vertical-align: middle;
}

.badge-grade {
    font-size: 14px;
    padding: 7px 12px;
}

</style>

</head>

<body>


<!-- ================= SIDEBAR ================= -->

<div class="sidebar">

    <h3>SMS</h3>

    <a href="<%=path%>/ParentDashboardServlet">
        <i class="bi bi-house"></i>
        Dashboard
    </a>

    <a href="<%=path%>/ParentProfileServlet">
        <i class="bi bi-person"></i>
        My Profile
    </a>

    <a href="<%=path%>/ParentAttendanceServlet">
        <i class="bi bi-calendar-check"></i>
        Attendance
    </a>

    <a href="<%=path%>/ParentResultServlet" class="active">
        <i class="bi bi-bar-chart"></i>
        Results
    </a>

    <a href="<%=path%>/ParentFeesServlet">
        <i class="bi bi-currency-rupee"></i>
        Fees
    </a>

    <a href="<%=path%>/LogoutServlet">
        <i class="bi bi-box-arrow-right"></i>
        Logout
    </a>

</div>


<!-- ================= MAIN ================= -->

<div class="main">


    <!-- Navbar -->

    <nav class="navbar navbar-dark bg-primary">

        <div class="container-fluid">

            <span class="navbar-brand">
                Student Management System
            </span>

        </div>

    </nav>


    <!-- Content -->

    <div class="content">

        <div class="d-flex justify-content-between align-items-center page-title">

            <div>

                <h2>
                    <i class="bi bi-bar-chart"></i>
                    Student Results
                </h2>

                <p class="text-muted">
                    Academic results of your child
                </p>

            </div>

            <a href="<%=path%>/ParentDashboardServlet"
               class="btn btn-secondary">

                <i class="bi bi-arrow-left"></i>
                Dashboard

            </a>

        </div>


        <!-- Student Information -->

        <div class="result-card mb-4">

            <div class="row">

                <div class="col-md-4">

                    <strong>Parent Name</strong>

                    <div class="mt-1">
                        <%=parent.getFullName()%>
                    </div>

                </div>


                <div class="col-md-4">

                    <strong>Student ID</strong>

                    <div class="mt-1">
                        <%=parent.getStudentId()%>
                    </div>

                </div>


                <div class="col-md-4">

                    <strong>Email</strong>

                    <div class="mt-1">
                        <%=parent.getEmail()%>
                    </div>

                </div>

            </div>

        </div>


        <!-- Result Table -->

        <div class="result-card">

            <h4 class="mb-4">
                Examination Results
            </h4>


            <div class="table-responsive">

                <table class="table table-bordered table-hover">

                    <thead>

                        <tr>

                            <th>S.No.</th>

                            <th>Subject</th>

                            <th>Marks</th>

                            <th>Grade</th>

                            <th>Exam Date</th>

                        </tr>

                    </thead>


                    <tbody>

                    <%
                        if (resultList != null &&
                            !resultList.isEmpty()) {

                            int count = 1;

                            for (Result result : resultList) {
                    %>

                        <tr>

                            <td>
                                <%=count++%>
                            </td>

                            <td>
                                <%=result.getSubject()%>
                            </td>

                            <td>
                                <%=result.getMarks()%>
                            </td>

                            <td>

                                <span class="badge bg-success badge-grade">

                                    <%=result.getGrade()%>

                                </span>

                            </td>

                            <td>
                                <%=result.getExamDate()%>
                            </td>

                        </tr>

                    <%
                            }

                        } else {
                    %>

                        <tr>

                            <td colspan="5"
                                class="text-center text-muted py-4">

                                <i class="bi bi-info-circle"></i>

                                No results available yet.

                            </td>

                        </tr>

                    <%
                        }
                    %>

                    </tbody>

                </table>

            </div>

        </div>

    </div>

</div>


</body>

</html>