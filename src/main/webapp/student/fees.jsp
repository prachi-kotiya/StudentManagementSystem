<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.List"%>
<%@page import="com.sms.model.User"%>
<%@page import="com.sms.model.Student"%>
<%@page import="com.sms.model.Fee"%>

<%
    // ================= SESSION CHECK =================

    if (session.getAttribute("user") == null) {

        response.sendRedirect(
                request.getContextPath() + "/login.html"
        );

        return;
    }

    User user = (User) session.getAttribute("user");

    // ================= GET DATA =================

    Student student =
            (Student) request.getAttribute("student");

    List<Fee> feeList =
            (List<Fee>) request.getAttribute("feeList");

    String path = request.getContextPath();
%>


<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Student Fees</title>


    <!-- Bootstrap -->

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">


    <!-- Bootstrap Icons -->

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
        rel="stylesheet">


    <style>

        body {

            margin: 0;

            background: #f4f6f9;

            font-family: Arial, Helvetica, sans-serif;

        }


        .navbar {

            padding: 15px 45px;

        }


        .main-container {

            display: flex;

            min-height: calc(100vh - 70px);

        }


        /* ================= SIDEBAR ================= */

        .sidebar {

            width: 280px;

            background: white;

            padding: 25px 20px;

            box-shadow: 2px 0 8px rgba(0,0,0,0.08);

        }


        .sidebar a {

            display: block;

            text-decoration: none;

            color: #333;

            padding: 13px 18px;

            margin-bottom: 8px;

            border-radius: 6px;

            font-size: 16px;

        }


        .sidebar a:hover {

            background: #f1f1f1;

        }


        .sidebar a.active {

            background: #0d6efd;

            color: white;

        }


        .sidebar i {

            margin-right: 10px;

        }


        /* ================= CONTENT ================= */

        .content {

            flex: 1;

            padding: 35px;

        }


        .page-title {

            font-size: 32px;

            margin-bottom: 25px;

        }


        /* ================= STUDENT INFO ================= */

        .student-info {

            background: #eaf4ff;

            border: 1px solid #cfe5ff;

            border-radius: 6px;

            padding: 18px 22px;

            margin-bottom: 25px;

        }


        .student-info strong {

            font-weight: 700;

        }


        /* ================= FEE CARD ================= */

        .fee-card {

            background: white;

            border-radius: 8px;

            padding: 25px;

            box-shadow: 0 3px 12px rgba(0,0,0,0.08);

        }


        .fee-card h5 {

            margin-bottom: 18px;

            font-weight: 600;

        }


        /* ================= TABLE ================= */

        .table {

            margin-bottom: 0;

        }


        .table thead th {

            background: #0d6efd;

            color: white;

            text-align: center;

            vertical-align: middle;

            padding: 12px;

        }


        .table tbody td {

            padding: 12px;

            vertical-align: middle;

            text-align: center;

        }


        /* ================= STATUS ================= */

        .status-paid {

            background: green;

            color: white;

            padding: 6px 14px;

            border-radius: 20px;

            display: inline-block;

        }


        .status-pending {

            background: #ffc107;

            color: black;

            padding: 6px 14px;

            border-radius: 20px;

            display: inline-block;

        }


        /* ================= BACK BUTTON ================= */

        .back-btn {

            margin-top: 25px;

        }


        /* ================= FOOTER ================= */

        footer {

            background: #212529;

            color: white;

            text-align: center;

            padding: 20px;

        }


        footer span {

            color: #0d6efd;

            font-weight: bold;

        }

    </style>

</head>


<body>


<!-- ================= NAVBAR ================= -->

<nav class="navbar navbar-dark bg-primary">

    <div class="container-fluid">


        <span class="navbar-brand mb-0 h1">

            🎓 Student Management System

        </span>


        <div class="text-white">

            Welcome,

            <b>

                <%= user.getFullname() %>

            </b>


            <a

                href="<%=path%>/LogoutServlet"

                class="btn btn-light btn-sm ms-3">

                Logout

            </a>

        </div>

    </div>

</nav>



<!-- ================= MAIN ================= -->

<div class="main-container">


    <!-- ================= SIDEBAR ================= -->

    <div class="sidebar">


        <a href="<%=path%>/StudentDashboardServlet">

            <i class="bi bi-house"></i>

            Dashboard

        </a>


        <a href="<%=path%>/StudentProfileServlet">

            <i class="bi bi-person"></i>

            My Profile

        </a>


        <a href="<%=path%>/StudentAttendanceServlet">

            <i class="bi bi-calendar-check"></i>

            Attendance

        </a>


        <a href="<%=path%>/StudentResultsServlet">

            <i class="bi bi-bar-chart"></i>

            Results

        </a>


        <a
            href="<%=path%>/StudentFeesServlet"
            class="active">

            <i class="bi bi-cash-stack"></i>

            Fees

        </a>


    </div>



    <!-- ================= CONTENT ================= -->

    <div class="content">


        <h1 class="page-title">

            <i class="bi bi-cash-stack"></i>

            My Fees

        </h1>



        <!-- ================= STUDENT INFO ================= -->

        <%
            if (student != null) {
        %>

        <div class="student-info">

            <div class="row">


                <div class="col-md-4">

                    Student Name:

                    <strong>

                        <%= student.getFullName() %>

                    </strong>

                </div>


                <div class="col-md-4">

                    Course:

                    <strong>

                        <%= student.getCourse() %>

                    </strong>

                </div>


                <div class="col-md-4">

                    Semester:

                    <strong>

                        <%= student.getSemester() %>

                    </strong>

                </div>


            </div>

        </div>

        <%
            }
        %>



        <!-- ================= FEE LIST ================= -->

        <div class="fee-card">


            <h5>

                Fee Details

            </h5>


            <div class="table-responsive">


                <table class="table table-bordered">


                    <thead>

                        <tr>

                            <th>#</th>

                            <th>Fee Type</th>

                            <th>Amount</th>

                            <th>Payment Date</th>

                            <th>Status</th>

                        </tr>

                    </thead>


                    <tbody>


                    <%

                        if (feeList != null && !feeList.isEmpty()) {

                            int count = 1;


                            for (Fee fee : feeList) {

                    %>


                        <tr>


                            <td>

                                <%= count++ %>

                            </td>


                            <td>

                                <%= fee.getFeeType() %>

                            </td>


                            <td>

                                ₹ <%= fee.getAmount() %>

                            </td>


                            <td>

                                <%= fee.getPaymentDate() %>

                            </td>


                            <td>


                                <%

                                    String status = fee.getStatus();

                                    if (status != null &&
                                        status.equalsIgnoreCase("Paid")) {

                                %>


                                    <span class="status-paid">

                                        Paid

                                    </span>


                                <%

                                    } else {

                                %>


                                    <span class="status-pending">

                                        <%= status %>

                                    </span>


                                <%

                                    }

                                %>


                            </td>


                        </tr>


                    <%

                            }

                        } else {

                    %>


                        <tr>

                            <td
                                colspan="5"
                                class="text-center">

                                No fee records available.

                            </td>

                        </tr>


                    <%

                        }

                    %>


                    </tbody>


                </table>

            </div>


        </div>



        <!-- ================= BACK ================= -->

        <a
            href="<%=path%>/StudentDashboardServlet"
            class="btn btn-primary back-btn">

            ← Back to Dashboard

        </a>


    </div>

</div>



<!-- ================= FOOTER ================= -->

<footer>

    © 2026

    <span>

        Student Management System

    </span>.

    All rights reserved.

</footer>


</body>

</html>