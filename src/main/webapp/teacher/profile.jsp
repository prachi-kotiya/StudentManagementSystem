<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.sms.model.Teacher"%>

<%
if(session.getAttribute("user")==null){
    response.sendRedirect("../login.jsp");
    return;
}

Teacher teacher = (Teacher) request.getAttribute("teacher");

String error = (String) request.getAttribute("error");

String path = request.getContextPath();

if(error != null){
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Teacher Profile</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body class="bg-light">

<div class="container mt-5">

<div class="alert alert-danger text-center">

<%= error %>

</div>

<a href="<%=path%>/TeacherDashboardServlet" class="btn btn-primary">

Back to Dashboard

</a>

</div>

</body>
</html>

<%
return;
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Teacher Profile</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
    background:#f4f6f9;
    margin:0;
    font-family:Arial;
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

.card{
    border:none;
    border-radius:15px;
}

</style>

</head>

<body>

<div class="sidebar">

<h3>Teacher</h3>

<a href="<%=path%>/TeacherDashboardServlet">Dashboard</a>

<a href="<%=path%>/TeacherProfileServlet">My Profile</a>

<a href="<%=path%>/TeacherStudentsServlet">Students</a>

<a href="<%=path%>/TeacherAttendanceServlet">Attendance</a>

<a href="<%=path%>/TeacherResultsServlet">Results</a>

<a href="<%=path%>/LogoutServlet">Logout</a>

</div>

<div class="main">

<nav class="navbar navbar-dark bg-primary">

<div class="container-fluid">

<span class="navbar-brand">

Teacher Panel

</span>

</div>

</nav>

<div class="container mt-4">

<div class="card shadow">

<div class="card-header bg-primary text-white">

<h3>My Profile</h3>

</div>

<div class="card-body">

<table class="table table-bordered">

<tr>

<th width="30%">Teacher ID</th>

<td><%=teacher.getTeacherId()%></td>

</tr>

<tr>

<th>Name</th>

<td><%=teacher.getFullName()%></td>

</tr>

<tr>

<th>Email</th>

<td><%=teacher.getEmail()%></td>

</tr>

<tr>

<th>Phone</th>

<td><%=teacher.getPhone()%></td>

</tr>

<tr>

<th>Department</th>

<td><%=teacher.getDepartment()%></td>

</tr>

<tr>

<th>Qualification</th>

<td><%=teacher.getQualification()%></td>

</tr>

<tr>

<th>Address</th>

<td><%=teacher.getAddress()%></td>

</tr>

</table>

</div>

</div>

</div>

</div>

</body>

</html>