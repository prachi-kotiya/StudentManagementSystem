<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.sms.model.Teacher" %>

<%
if(session.getAttribute("user")==null){
    response.sendRedirect("../login.html");
    return;
}

List<Teacher> teacherList = (List<Teacher>) request.getAttribute("teacherList");
String path = request.getContextPath();
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Teachers</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

<style>

body{
    background:#f4f6f9;
    margin:0;
    font-family:Arial,Helvetica,sans-serif;
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
    vertical-align:middle;
    text-align:center;
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
<span class="navbar-brand">Student Management System</span>
</div>
</nav>

<div class="container-fluid mt-4">

<div class="d-flex justify-content-between align-items-center mb-3">

<h2>Teachers List</h2>

<a href="<%=path%>/admin/add-teacher.jsp"
class="btn btn-success">

<i class="bi bi-plus-circle"></i>

Add Teacher

</a>

</div>

<form action="<%=path%>/TeachersServlet" method="get">

<div class="input-group mb-3">

<input
type="text"
name="keyword"
class="form-control"
placeholder="Search by Teacher ID, Name or Email"
value="${param.keyword}">

<button class="btn btn-primary" type="submit">

<i class="bi bi-search"></i>

Search

</button>

<a href="<%=path%>/ExportTeacherPDFServlet"
class="btn btn-danger">

<i class="bi bi-file-earmark-pdf"></i>

Export PDF

</a>

</div>

</form>

<table class="table table-bordered table-hover">
<thead>

<tr>

<th>ID</th>

<th>Teacher ID</th>

<th>Name</th>

<th>Email</th>

<th>Phone</th>

<th>Department</th>

<th>Qualification</th>

<th>Action</th>

</tr>

</thead>

<tbody>

<%

if(teacherList != null && !teacherList.isEmpty()){

    for(Teacher t : teacherList){

%>

<tr>

<td><%=t.getId()%></td>

<td><%=t.getTeacherId()%></td>

<td><%=t.getFullName()%></td>

<td><%=t.getEmail()%></td>

<td><%=t.getPhone()%></td>

<td><%=t.getDepartment()%></td>

<td><%=t.getQualification()%></td>

<td>

<a href="<%=path%>/EditTeacherServlet?id=<%=t.getId()%>"
class="btn btn-warning btn-sm">

<i class="bi bi-pencil-square"></i>

Edit

</a>

<a href="<%=path%>/DeleteTeacherServlet?id=<%=t.getId()%>"
class="btn btn-danger btn-sm"
onclick="return confirm('Delete this teacher?')">

<i class="bi bi-trash"></i>

Delete

</a>

</td>

</tr>

<%

    }

}else{

%>

<tr>

<td colspan="8" class="text-center">

No Teacher Found

</td>

</tr>

<%

}

%>

</tbody>

</table>

</div>

</div>

</body>

</html>