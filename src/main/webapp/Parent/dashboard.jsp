<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.sms.model.Parent" %>

<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/login.html");
        return;
    }

    Parent parent = (Parent) request.getAttribute("parent");

    if (parent == null) {
        response.sendRedirect(request.getContextPath() + "/login.html");
        return;
    }

    String path = request.getContextPath();
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Parent Dashboard</title>

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

        .sidebar {
            width: 250px;
            height: 100vh;
            position: fixed;
            left: 0;
            top: 0;
            background: #212529;
        }

        .sidebar h3 {
            color: white;
            text-align: center;
            padding: 20px;
            margin: 0;
        }

        .sidebar a {
            display: block;
            color: white;
            text-decoration: none;
            padding: 13px 20px;
        }

        .sidebar a:hover {
            background: #0d6efd;
        }

        .main {
            margin-left: 250px;
        }

        .navbar {
            padding: 15px 20px;
        }

        .content {
            padding: 30px;
        }

        .welcome-card {
            background: white;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.08);
            margin-bottom: 25px;
        }

        .info-card {
            background: white;
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.08);
        }

        .info-title {
            color: #6c757d;
            font-size: 14px;
            margin-bottom: 5px;
        }

        .info-value {
            font-size: 18px;
            font-weight: bold;
        }

    </style>

</head>

<body>

<!-- SIDEBAR -->

<div class="sidebar">

    <h3>SMS</h3>

    <a href="<%=path%>/ParentDashboardServlet">
        <i class="bi bi-house"></i>
        Dashboard
    </a>

    <a href="<%=request.getContextPath()%>/ParentProfileServlet">
    <i class="bi bi-person"></i>
    My Profile
</a>

  <a href="<%=request.getContextPath()%>/ParentAttendanceServlet">
    <i class="bi bi-calendar-check"></i>
    Attendance
</a>

    <a href="<%=path%>/ParentResultsServlet">
    <i class="bi bi-bar-chart"></i> Results
</a>

   <a href="<%=request.getContextPath()%>/ParentFeesServlet">
    <i class="bi bi-currency-rupee"></i>
    Fees
</a>

    <a href="<%=path%>/LogoutServlet">
        <i class="bi bi-box-arrow-right"></i>
        Logout
    </a>

</div>


<!-- MAIN -->

<div class="main">

    <nav class="navbar navbar-dark bg-primary">

        <span class="navbar-brand">
            Student Management System
        </span>

    </nav>


    <div class="content">

        <!-- WELCOME -->

        <div class="welcome-card">

            <h2>
                Welcome, <%=parent.getFullName()%> 👋
            </h2>

            <p class="text-muted mb-0">
                Welcome to your Parent Dashboard.
            </p>

        </div>


        <!-- PARENT INFORMATION -->

        <div class="row g-4">

            <div class="col-md-4">

                <div class="info-card">

                    <div class="info-title">
                        Parent ID
                    </div>

                    <div class="info-value">
                        <%=parent.getParentId()%>
                    </div>

                </div>

            </div>


            <div class="col-md-4">

                <div class="info-card">

                    <div class="info-title">
                        Student ID
                    </div>

                    <div class="info-value">
                        <%=parent.getStudentId()%>
                    </div>

                </div>

            </div>


            <div class="col-md-4">

                <div class="info-card">

                    <div class="info-title">
                        Email
                    </div>

                    <div class="info-value">
                        <%=parent.getEmail()%>
                    </div>

                </div>

            </div>


            <div class="col-md-4">

                <div class="info-card">

                    <div class="info-title">
                        Phone
                    </div>

                    <div class="info-value">
                        <%=parent.getPhone()%>
                    </div>

                </div>

            </div>


            <div class="col-md-4">

                <div class="info-card">

                    <div class="info-title">
                        Occupation
                    </div>

                    <div class="info-value">
                        <%=parent.getOccupation()%>
                    </div>

                </div>

            </div>


            <div class="col-md-4">

                <div class="info-card">

                    <div class="info-title">
                        Address
                    </div>

                    <div class="info-value">
                        <%=parent.getAddress()%>
                    </div>

                </div>

            </div>

        </div>

    </div>

</div>

</body>

</html>