<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.sms.model.Student" %>

<%
if(session.getAttribute("user")==null){
    response.sendRedirect("../login.html");
    return;
}

List<Student> studentList=(List<Student>)request.getAttribute("studentList");
String path=request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Students</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

<style>
body{
    background:#f4f6f9;
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
}
</style>

</head>

<body>

<div class="sidebar">

<h3>SMS</h3>

<a href="<%=path%>/DashboardServlet">
Dashboard
</a>

<a href="<%=path%>/StudentsServlet">
Students
</a>

<a href="<%=path%>/TeachersServlet">
Teachers
</a>

<a href="<%=path%>/ParentsServlet">
Parents
</a>

<a href="<%=path%>/AttendanceListServlet">
Attendance
</a>

<a href="<%=path%>/FeeListServlet">
Fees
</a>

<a href="<%=path%>/ResultListServlet">
Results
</a>

<a href="<%=path%>/LogoutServlet">
Logout
</a>

</div>

<div class="main">

<nav class="navbar navbar-dark bg-primary">
<div class="container-fluid">
<span class="navbar-brand">Student Management System</span>
</div>
</nav>

<div class="container-fluid mt-4">

<div class="d-flex justify-content-between mb-3">

<h2>Students List</h2>

<a href="<%=path%>/admin/add-student.jsp"
class="btn btn-success">
Add Student
</a>

</div>

<form action="<%=path%>/StudentsServlet" method="get">

<div class="input-group mb-3">

<input type="text"
name="search"
class="form-control"
placeholder="Search Student">

<button class="btn btn-primary">
Search
</button>

</div>

</form>

<table class="table table-bordered">

<thead>

<tr>
<th>ID</th>
<th>Student ID</th>
<th>Name</th>
<th>Email</th>
<th>Phone</th>
<th>Course</th>
<th>Semester</th>
<th>Address</th>
<th>Action</th>
</tr>

</thead>

<tbody>

<%
if(studentList!=null){
for(Student s:studentList){
%>

<tr>

<td><%=s.getId()%></td>
<td><%=s.getStudentId()%></td>
<td><%=s.getFullName()%></td>
<td><%=s.getEmail()%></td>
<td><%=s.getPhone()%></td>
<td><%=s.getCourse()%></td>
<td><%=s.getSemester()%></td>
<td><%=s.getAddress()%></td>

<td>

<a href="<%=path%>/EditStudentServlet?id=<%=s.getId()%>"
class="btn btn-warning btn-sm">
Edit
</a>

<a href="<%=path%>/DeleteStudentServlet?id=<%=s.getId()%>"
class="btn btn-danger btn-sm"
onclick="return confirm('Delete this student?')">
Delete
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

</body>
</html>