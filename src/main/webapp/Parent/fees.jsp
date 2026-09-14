<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.sms.model.Student"%>
<%@page import="com.sms.model.Fee"%>

<%
if (session.getAttribute("user") == null) {

    response.sendRedirect(
        request.getContextPath() + "/login.html"
    );

    return;
}

Student student =
    (Student) request.getAttribute("student");

List<Fee> feeList =
    (List<Fee>) request.getAttribute("feeList");

String path = request.getContextPath();
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Fees</title>

<link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">

<link
href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
rel="stylesheet">

<style>

body{
    background:#f4f6f9;
    margin:0;
    font-family:Arial,Helvetica,sans-serif;
}

.sidebar{
    width:250px;
    height:100vh;
    background:#212529;
    position:fixed;
    left:0;
    top:0;
}

.sidebar h3{
    color:white;
    text-align:center;
    padding:20px;
    margin:0;
}

.sidebar a{
    display:block;
    color:white;
    padding:12px 20px;
    text-decoration:none;
}

.sidebar a:hover{
    background:#0d6efd;
}

.main{
    margin-left:250px;
}

.navbar{
    padding:15px 20px;
}

.content{
    padding:30px;
}

.card{
    border:none;
    border-radius:12px;
    box-shadow:0 3px 10px rgba(0,0,0,0.08);
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

.badge-paid{
    background:green;
    color:white;
    padding:6px 12px;
    border-radius:20px;
}

.badge-pending{
    background:red;
    color:white;
    padding:6px 12px;
    border-radius:20px;
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

<a href="<%=path%>/ParentResultsServlet">

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

<span class="navbar-brand">

Student Management System

</span>

</nav>


<div class="content">

<div class="card p-4">

<h3>

Fee Details

</h3>

<p class="text-muted">

Student:
<strong>
<%=student.getFullName()%>
</strong>

&nbsp; | &nbsp;

Student ID:
<strong>
<%=student.getId()%>
</strong>

</p>


<table class="table table-bordered table-hover mt-4">

<thead>

<tr>

<th>Fee Type</th>

<th>Amount</th>

<th>Payment Date</th>

<th>Status</th>

</tr>

</thead>

<tbody>

<%

if(feeList != null && !feeList.isEmpty()){

    for(Fee fee : feeList){

%>

<tr>

<td>
<%=fee.getFeeType()%>
</td>

<td>
₹ <%=fee.getAmount()%>
</td>

<td>
<%=fee.getPaymentDate()%>
</td>

<td>

<%

if("Paid".equalsIgnoreCase(fee.getStatus())){

%>

<span class="badge-paid">
Paid
</span>

<%

}else{

%>

<span class="badge-pending">
<%=fee.getStatus()%>
</span>

<%

}

%>

</td>

</tr>

<%

    }

}else{

%>

<tr>

<td colspan="4"
class="text-center text-muted">

No Fee Records Found

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