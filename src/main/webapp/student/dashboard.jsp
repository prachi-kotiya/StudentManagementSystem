<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.sms.model.User"%>

<%
if(session.getAttribute("user")==null){
    response.sendRedirect(request.getContextPath() + "/login.html");
    return;
}

User user = (User)session.getAttribute("user");

String path = request.getContextPath();
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Student Dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
      rel="stylesheet">

<style>

body{
    margin:0;
    background:#f4f6f9;
    font-family:Arial, Helvetica, sans-serif;
}

.navbar{
    padding:15px 25px;
}

.content{
    padding:30px;
}

.card{
    border:none;
    border-radius:15px;
    box-shadow:0 3px 10px rgba(0,0,0,.12);
}

.dashboard-card{
    height:100%;
}

</style>

</head>

<body>

<!-- NAVBAR -->

<nav class="navbar navbar-dark bg-primary">

    <div class="container-fluid">

        <span class="navbar-brand">
            🎓 Student Management System
        </span>

        <div class="text-white">

            Welcome,
            <b><%= user.getFullname() %></b>

            <a href="<%=path%>/LogoutServlet"
               class="btn btn-light btn-sm ms-3">

                Logout

            </a>

        </div>

    </div>

</nav>


<!-- CONTENT -->

<div class="content">

    <h2 class="mb-4">
        👋 Student Dashboard
    </h2>


    <div class="row g-4">


        <!-- PROFILE -->

        <div class="col-md-3">

            <div class="card bg-primary text-white dashboard-card">

                <div class="card-body">

                    <h5>
                        <i class="bi bi-person"></i>
                        My Profile
                    </h5>

                    <p>
                        View Student Information
                    </p>

                    <a href="<%=path%>/StudentProfileServlet"
                       class="btn btn-light btn-sm">

                        View Profile

                    </a>

                </div>

            </div>

        </div>


        <!-- ATTENDANCE -->

        <div class="col-md-3">

            <div class="card bg-success text-white dashboard-card">

                <div class="card-body">

                    <h5>
                        <i class="bi bi-calendar-check"></i>
                        Attendance
                    </h5>

                    <p>
                        View Your Attendance
                    </p>

                    <a href="<%=path%>/StudentAttendanceServlet"
                       class="btn btn-light btn-sm">

                        View Attendance

                    </a>

                </div>

            </div>

        </div>


        <!-- RESULTS -->

        <div class="col-md-3">

            <div class="card bg-warning text-dark dashboard-card">

                <div class="card-body">

                    <h5>
                        <i class="bi bi-bar-chart"></i>
                        Results
                    </h5>

                    <p>
                        View Your Results
                    </p>

                    <a href="<%=path%>/StudentResultsServlet"
                       class="btn btn-dark btn-sm">

                        View Results

                    </a>

                </div>

            </div>

        </div>


        <!-- FEES -->

        <div class="col-md-3">

            <div class="card bg-info text-dark dashboard-card">

                <div class="card-body">

                    <h5>
                        <i class="bi bi-cash-stack"></i>
                        Fees
                    </h5>

                    <p>
                        View Fee Details
                    </p>

                    <a href="<%=path%>/StudentFeesServlet"
                       class="btn btn-dark btn-sm">

                        View Fees

                    </a>

                </div>

            </div>

        </div>


    </div>


    <!-- NOTICES -->

    <div class="row mt-4">

        <div class="col-md-12">

            <div class="card">

                <div class="card-header bg-dark text-white">

                    Latest Notices

                </div>

                <div class="card-body">

                    <ul>

                        <li>
                            📢 Welcome to Student Management System
                        </li>

                        <li>
                            📢 Semester Exams start next month.
                        </li>

                        <li>
                            📢 Submit Fees before the due date.
                        </li>

                    </ul>

                </div>

            </div>

        </div>

    </div>

</div>

</body>

</html>