<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.sms.model.Student"%>

<%
List<Student> studentList =
(List<Student>) request.getAttribute("studentList");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Students</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
    margin:0;
    padding:0;
    background:#f5f6fa;
    font-family:Arial,sans-serif;
}

.sidebar{
    position:fixed;
    left:0;
    top:0;
    width:250px;
    height:100%;
    background:#212529;
    padding-top:20px;
}

.sidebar h3{
    color:white;
    text-align:center;
    margin-bottom:30px;
}

.sidebar a{
    display:block;
    color:white;
    text-decoration:none;
    padding:15px 25px;
    transition:.3s;
}

.sidebar a:hover{
    background:#0d6efd;
}

.main-content{
    margin-left:250px;
    padding:30px;
}

.card{
    border:none;
    border-radius:12px;
    box-shadow:0 2px 8px rgba(0,0,0,.15);
}

.table th{
    background:#0d6efd;
    color:white;
}

</style>

</head>

<body>

<!-- Sidebar -->

<div class="sidebar">

<h3>Teacher Panel</h3>

<a href="<%=request.getContextPath()%>/TeacherDashboardServlet">
Dashboard
</a>

<a href="<%=request.getContextPath()%>/TeacherStudentsServlet">
Students
</a>

<a href="<%=request.getContextPath()%>/TeacherAttendanceServlet">
Attendance
</a>

<a href="<%=request.getContextPath()%>/TeacherProfileServlet">
Profile
</a>

<a href="<%=request.getContextPath()%>/LogoutServlet">
Logout
</a>

</div>

<div class="main-content">

<div class="card p-4">

<div class="d-flex justify-content-between align-items-center mb-3">

<h3>Students</h3>

<form action="<%=request.getContextPath()%>/TeacherStudentsServlet"
      method="get"
      class="d-flex">

<input type="text"
       name="search"
       class="form-control me-2"
       placeholder="Search Student">

<button class="btn btn-primary">
Search
</button>

</form>

</div>

<table class="table table-bordered table-hover">

<thead>

<tr>

<th>ID</th>
<th>Student ID</th>
<th>Full Name</th>
<th>Email</th>
<th>Phone</th>
<th>Course</th>
<th>Semester</th>
<th>Address</th>

</tr>

</thead>

<tbody>

<%

if(studentList!=null){

for(Student s : studentList){

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