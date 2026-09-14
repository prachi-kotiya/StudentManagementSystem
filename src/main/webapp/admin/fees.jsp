<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.sms.model.Fee" %>

<%
if(session.getAttribute("user")==null){
    response.sendRedirect("../login.html");
    return;
}

List<Fee> feeList = (List<Fee>) request.getAttribute("feeList");
String path = request.getContextPath();
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Fees</title>

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

<h2>Fee Management</h2>

<a href="<%=path%>/AddFeePageServlet"
class="btn btn-success">

<i class="bi bi-plus-circle"></i>

Add Fee

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

<table class="table table-bordered table-hover" id="feeTable">

<thead>

<tr>

<th>ID</th>

<th>Student</th>

<th>Amount</th>

<th>Fee Type</th>

<th>Payment Date</th>

<th>Status</th>

<th>Action</th>

</tr>

</thead>

<tbody>

<%

if(feeList!=null){

for(Fee fee:feeList){

%>

<tr>

<td><%=fee.getId()%></td>

<td><%=fee.getStudentName()%></td>

<td>₹ <%=fee.getAmount()%></td>

<td><%=fee.getFeeType()%></td>

<td><%=fee.getPaymentDate()%></td>

<td>

<%

if("Paid".equalsIgnoreCase(fee.getStatus())){

%>

<span class="badge bg-success">

Paid

</span>

<%

}else{

%>

<span class="badge bg-warning text-dark">

Pending

</span>

<%

}

%>

</td>

<td>

<a href="<%=path%>/EditFeeServlet?id=<%=fee.getId()%>"
class="btn btn-warning btn-sm">

<i class="bi bi-pencil-square"></i>

</a>

<a href="<%=path%>/DeleteFeeServlet?id=<%=fee.getId()%>"
class="btn btn-danger btn-sm"
onclick="return confirm('Delete this fee record?')">

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

let rows=document.querySelector("#feeTable tbody").rows;

for(let i=0;i<rows.length;i++){

let txt=rows[i].cells[1].textContent.toUpperCase();

rows[i].style.display=txt.indexOf(filter)>-1?"":"none";

}

});

</script>

</body>

</html>