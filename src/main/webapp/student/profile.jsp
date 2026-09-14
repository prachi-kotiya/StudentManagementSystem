<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.sms.model.Student"%>

<%
Student student = (Student)request.getAttribute("student");

if(student==null){
%>

<h2 style="color:red;text-align:center;margin-top:50px;">
Student Profile Not Found
</h2>

<%
return;
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Student Profile</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
    background:#f4f6f9;
}

.profile-card{
    max-width:850px;
    margin:auto;
    margin-top:40px;
    border-radius:15px;
    box-shadow:0 3px 12px rgba(0,0,0,.15);
}

.profile-header{
    background:#0d6efd;
    color:white;
    padding:20px;
    border-radius:15px 15px 0 0;
}

.table td{
    padding:14px;
}

</style>

</head>

<body>

<div class="container">

<div class="card profile-card">

<div class="profile-header">

<h2>👤 Student Profile</h2>

</div>

<div class="card-body">

<table class="table table-bordered">

<tr>
<th>Student ID</th>
<td><%=student.getStudentId()%></td>
</tr>

<tr>
<th>Full Name</th>
<td><%=student.getFullName()%></td>
</tr>

<tr>
<th>Email</th>
<td><%=student.getEmail()%></td>
</tr>

<tr>
<th>Phone</th>
<td><%=student.getPhone()%></td>
</tr>

<tr>
<th>Course</th>
<td><%=student.getCourse()%></td>
</tr>

<tr>
<th>Semester</th>
<td><%=student.getSemester()%></td>
</tr>

<tr>
<th>Address</th>
<td><%=student.getAddress()%></td>
</tr>

</table>

<div class="text-center">

<a href="<%=request.getContextPath()%>/student/dashboard.jsp"
   class="btn btn-primary">
    🏠 Back to Dashboard
</a>

</div>

</div>

</div>

</div>

</body>

</html>