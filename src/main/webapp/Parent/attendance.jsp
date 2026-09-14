<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.List" %>
<%@ page import="com.sms.model.Attendance" %>
<%@ page import="com.sms.model.Parent" %>

<%
    if (session.getAttribute("user") == null) {

        response.sendRedirect("../login.html");
        return;
    }

    List<Attendance> attendanceList =
            (List<Attendance>) request.getAttribute("attendanceList");

    Parent parent =
            (Parent) request.getAttribute("parent");

    String path = request.getContextPath();
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>My Child Attendance</title>

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

.card-box {
    background: white;
    border-radius: 15px;
    padding: 25px;
    box-shadow: 0 3px 12px rgba(0,0,0,0.08);
}

.table th {
    background: #0d6efd;
    color: white;
    text-align: center;
}

.table td {
    text-align: center;
    vertical-align: middle;
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

<a href="<%=path%>/ParentProfileServlet">
    <i class="bi bi-person"></i>
    My Profile
</a>

<a href="<%=path%>/ParentAttendanceServlet">
    <i class="bi bi-calendar-check"></i>
    Attendance
</a>

<a href="<%=path%>/ParentResultServlet">
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


<div class="card-box">


<div class="d-flex justify-content-between align-items-center mb-4">

<div>

<h2>
<i class="bi bi-calendar-check"></i>
Attendance
</h2>

<%
if (parent != null) {
%>

<p class="text-muted mb-0">

Student ID:
<strong><%=parent.getStudentId()%></strong>

</p>

<%
}
%>

</div>

</div>


<table class="table table-bordered table-hover">

<thead>

<tr>

<th>ID</th>

<th>Student Name</th>

<th>Date</th>

<th>Status</th>

</tr>

</thead>


<tbody>

<%

if (attendanceList != null &&
        !attendanceList.isEmpty()) {

    for (Attendance a : attendanceList) {

%>

<tr>

<td>
<%=a.getId()%>
</td>

<td>
<%=a.getStudentName()%>
</td>

<td>
<%=a.getAttendanceDate()%>
</td>

<td>

<%
String status = a.getStatus();

if ("Present".equalsIgnoreCase(status)) {
%>

<span class="badge bg-success">
Present
</span>

<%
} else if ("Absent".equalsIgnoreCase(status)) {
%>

<span class="badge bg-danger">
Absent
</span>

<%
} else if ("Late".equalsIgnoreCase(status)) {
%>

<span class="badge bg-warning text-dark">
Late
</span>

<%
} else {
%>

<span class="badge bg-secondary">
<%=status%>
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

<td colspan="4" class="text-center">

No attendance records found.

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

</body>

</html>