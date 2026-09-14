<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.sms.model.Result"%>

<%
List<Result> resultList =
(List<Result>) request.getAttribute("resultList");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Student Results</title>

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
    top:0;
    left:0;
    width:250px;
    height:100%;
    background:#212529;
}

.sidebar h3{
    color:#fff;
    text-align:center;
    margin:20px 0;
}

.sidebar a{
    display:block;
    color:#fff;
    padding:15px 25px;
    text-decoration:none;
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
    box-shadow:0 2px 10px rgba(0,0,0,.15);
}

.table th{
    background:#0d6efd;
    color:white;
}

</style>

</head>

<body>

<div class="sidebar">

<h3>Teacher Panel</h3>

<a href="<%=request.getContextPath()%>/TeacherDashboardServlet">Dashboard</a>

<a href="<%=request.getContextPath()%>/TeacherStudentsServlet">Students</a>

<a href="<%=request.getContextPath()%>/TeacherAttendanceServlet">Attendance</a>

<a href="<%=request.getContextPath()%>/TeacherResultsServlet">Results</a>

<a href="<%=request.getContextPath()%>/TeacherProfileServlet">Profile</a>

<a href="<%=request.getContextPath()%>/LogoutServlet">Logout</a>

</div>

<div class="main-content">

<div class="card p-4">

<div class="d-flex justify-content-between align-items-center mb-4">

    <h3 class="mb-0">Student Results</h3>

    <a href="<%=request.getContextPath()%>/TeacherResultFormServlet"
       class="btn btn-success">

        + Add Result

    </a>

</div>

<table class="table table-bordered table-hover">

<thead>

<tr>

<th>ID</th>
<th>Student Name</th>
<th>Subject</th>
<th>Marks</th>
<th>Grade</th>
<th>Exam Date</th>

</tr>

</thead>

<tbody>

<%
if(resultList != null){

for(Result r : resultList){
%>

<tr>

<td><%=r.getId()%></td>

<td><%=r.getStudentName()%></td>

<td><%=r.getSubject()%></td>

<td><%=r.getMarks()%></td>

<td>

<%
String grade = r.getGrade();

if("A".equalsIgnoreCase(grade)){
%>

<span class="badge bg-success"><%=grade%></span>

<%
}else if("B".equalsIgnoreCase(grade)){
%>

<span class="badge bg-primary"><%=grade%></span>

<%
}else if("C".equalsIgnoreCase(grade)){
%>

<span class="badge bg-warning text-dark"><%=grade%></span>

<%
}else{
%>

<span class="badge bg-danger"><%=grade%></span>

<%
}
%>

</td>

<td><%=r.getExamDate()%></td>

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