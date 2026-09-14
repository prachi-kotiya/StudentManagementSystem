<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.sms.model.Result" %>

<%
if(session.getAttribute("user")==null){
    response.sendRedirect("../login.html");
    return;
}

List<Result> resultList=(List<Result>)request.getAttribute("resultList");
String path=request.getContextPath();
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Results</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

<style>

body{
    background:#f4f6f9;
    margin:0;
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
    text-align:center;
    vertical-align:middle;
}

</style>

</head>

<body>

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

<div class="main">

<nav class="navbar navbar-dark bg-primary">

<div class="container-fluid">

<span class="navbar-brand">

Student Management System

</span>

</div>

</nav>

<div class="container-fluid mt-4">

<div class="d-flex justify-content-between mb-3">

<h2>Result Management</h2>

<a href="<%=path%>/ResultFormServlet"
class="btn btn-success">

<i class="bi bi-plus-circle"></i>

Add Result

</a>

</div>

<div class="input-group mb-3">

<input
type="text"
id="searchInput"
class="form-control"
placeholder="Search Student">

<button class="btn btn-primary">

<i class="bi bi-search"></i>

Search

</button>

</div>

<table class="table table-bordered table-hover" id="resultTable">

<thead>

<tr>

<th>ID</th>

<th>Student</th>

<th>Subject</th>

<th>Marks</th>

<th>Grade</th>

<th>Exam Date</th>

<th>Action</th>

</tr>

</thead>

<tbody>

<%

if(resultList!=null){

for(Result r:resultList){

%>

<tr>

<td><%=r.getId()%></td>

<td><%=r.getStudentName()%></td>

<td><%=r.getSubject()%></td>

<td><%=r.getMarks()%></td>

<td>

<%

String grade=r.getGrade();

String badge="bg-secondary";

if("A+".equalsIgnoreCase(grade) || "A".equalsIgnoreCase(grade)){
    badge="bg-success";
}else if("B+".equalsIgnoreCase(grade) || "B".equalsIgnoreCase(grade)){
    badge="bg-primary";
}else if("C".equalsIgnoreCase(grade)){
    badge="bg-warning text-dark";
}else{
    badge="bg-danger";
}

%>

<span class="badge <%=badge%>">
<%=grade%>
</span>

</td>

<td><%=r.getExamDate()%></td>

<td>

<a href="<%=path%>/EditResultServlet?id=<%=r.getId()%>"
class="btn btn-warning btn-sm">

<i class="bi bi-pencil-square"></i>

</a>

<a href="<%=path%>/DeleteResultServlet?id=<%=r.getId()%>"
class="btn btn-danger btn-sm"
onclick="return confirm('Delete this result?')">

<i class="bi bi-trash"></i>

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

<script>

const search=document.getElementById("searchInput");

search.addEventListener("keyup",function(){

let filter=this.value.toUpperCase();

let rows=document.querySelector("#resultTable tbody").rows;

for(let i=0;i<rows.length;i++){

let txt=rows[i].cells[1].textContent.toUpperCase();

rows[i].style.display=txt.indexOf(filter)>-1?"":"none";

}

});

</script>

</body>

</html>