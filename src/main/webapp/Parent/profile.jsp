<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="com.sms.model.Parent" %>

<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("../login.html");
        return;
    }

    Parent parent = (Parent) request.getAttribute("parent");

    String path = request.getContextPath();
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>My Profile</title>

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
    width: 270px;
    height: 100vh;
    position: fixed;
    background: #212529;
}

.sidebar h3 {
    color: white;
    text-align: center;
    padding: 20px;
}

.sidebar a {
    display: block;
    color: white;
    text-decoration: none;
    padding: 14px 25px;
}

.sidebar a:hover {
    background: #0d6efd;
}

.main {
    margin-left: 270px;
}

.navbar {
    height: 75px;
}

.profile-card {
    background: white;
    border-radius: 15px;
    padding: 30px;
    box-shadow: 0 3px 12px rgba(0,0,0,0.08);
}

.info-card {
    background: white;
    border-radius: 12px;
    padding: 20px;
    height: 100%;
    box-shadow: 0 3px 10px rgba(0,0,0,0.06);
}

.info-title {
    color: #6c757d;
    font-size: 14px;
    margin-bottom: 8px;
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
    <i class="bi bi-house"></i> Dashboard
</a>

<a href="<%=path%>/ParentProfileServlet">
    <i class="bi bi-person"></i> My Profile
</a>

<a href="<%=path%>/ParentAttendanceServlet">
    <i class="bi bi-calendar-check"></i> Attendance
</a>

<a href="<%=path%>/ParentResultServlet">
    <i class="bi bi-bar-chart"></i> Results
</a>

<a href="<%=path%>/ParentFeesServlet">
    <i class="bi bi-currency-rupee"></i> Fees
</a>

<a href="<%=path%>/LogoutServlet">
    <i class="bi bi-box-arrow-right"></i> Logout
</a>

</div>


<!-- MAIN -->

<div class="main">

<nav class="navbar navbar-dark bg-primary">

<div class="container-fluid">

<span class="navbar-brand">
Student Management System
</span>

</div>

</nav>


<div class="container-fluid p-4">

<div class="profile-card">

<h2 class="mb-4">

<i class="bi bi-person-circle"></i>

My Profile

</h2>


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
Full Name
</div>

<div class="info-value">
<%=parent.getFullName()%>
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


<div class="col-md-6">

<div class="info-card">

<div class="info-title">
Email
</div>

<div class="info-value">
<%=parent.getEmail()%>
</div>

</div>

</div>


<div class="col-md-6">

<div class="info-card">

<div class="info-title">
Phone
</div>

<div class="info-value">
<%=parent.getPhone()%>
</div>

</div>

</div>


<div class="col-md-6">

<div class="info-card">

<div class="info-title">
Occupation
</div>

<div class="info-value">
<%=parent.getOccupation()%>
</div>

</div>

</div>


<div class="col-md-6">

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

</div>

</body>

</html>