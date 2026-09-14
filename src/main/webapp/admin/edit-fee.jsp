<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.sms.model.Fee"%>
<%@ page import="java.util.List"%>
<%@ page import="com.sms.model.Student"%>

<%
Fee fee = (Fee) request.getAttribute("fee");
List<Student> studentList = (List<Student>) request.getAttribute("studentList");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Edit Fee</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body class="bg-light">

<div class="container mt-5">

<div class="card shadow">

<div class="card-header bg-warning">

<h3>Edit Fee</h3>

</div>

<div class="card-body">

<form action="${pageContext.request.contextPath}/UpdateFeeServlet" method="post">

<input
type="hidden"
name="id"
value="<%=fee.getId()%>">

<div class="mb-3">

<label>Select Student</label>

<select name="studentId" class="form-select">

<%
for(Student s : studentList){
%>

<option value="<%=s.getId()%>"

<%
if(s.getId()==fee.getStudentId()){
%>

selected

<%
}
%>

>

<%=s.getStudentId()%> - <%=s.getFullName()%>

</option>

<%
}
%>

</select>

</div>

<div class="mb-3">

<label>Amount</label>

<input
type="number"
step="0.01"
name="amount"
value="<%=fee.getAmount()%>"
class="form-control"
required>

</div>

<div class="mb-3">

<label>Fee Type</label>

<input
type="text"
name="feeType"
value="<%=fee.getFeeType()%>"
class="form-control"
required>

</div>

<div class="mb-3">

<label>Payment Date</label>

<input
type="date"
name="paymentDate"
value="<%=fee.getPaymentDate()%>"
class="form-control"
required>

</div>

<div class="mb-3">

<label>Status</label>

<select name="status" class="form-select">

<option value="Paid"

<%
if("Paid".equals(fee.getStatus())){
%>

selected

<%
}
%>

>

Paid

</option>

<option value="Pending"

<%
if("Pending".equals(fee.getStatus())){
%>

selected

<%
}
%>

>

Pending

</option>

</select>

</div>

<button class="btn btn-success">

Update Fee

</button>

<a href="${pageContext.request.contextPath}/FeeListServlet"
class="btn btn-secondary">

Back

</a>

</form>

</div>

</div>

</div>

</body>

</html>