<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.sms.model.Result"%>

<%
Result result = (Result) request.getAttribute("result");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Edit Result</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body>

<div class="container mt-5">

<div class="card shadow">

<div class="card-header bg-warning">

<h3>Edit Result</h3>

</div>

<div class="card-body">

<form action="${pageContext.request.contextPath}/UpdateResultServlet" method="post">

<input
type="hidden"
name="id"
value="<%=result.getId()%>">

<div class="mb-3">

<label>Student ID</label>

<input
type="number"
name="studentId"
class="form-control"
value="<%=result.getStudentId()%>"
required>

</div>

<div class="mb-3">

<label>Subject</label>

<input
type="text"
name="subject"
class="form-control"
value="<%=result.getSubject()%>"
required>

</div>

<div class="mb-3">

<label>Marks</label>

<input
type="number"
step="0.01"
name="marks"
class="form-control"
value="<%=result.getMarks()%>"
required>

</div>

<div class="mb-3">

<label>Grade</label>

<input
type="text"
name="grade"
class="form-control"
value="<%=result.getGrade()%>"
required>

</div>

<div class="mb-3">

<label>Exam Date</label>

<input
type="date"
name="examDate"
class="form-control"
value="<%=result.getExamDate()%>"
required>

</div>

<button class="btn btn-success">

Update Result

</button>

<a href="${pageContext.request.contextPath}/ResultListServlet"
class="btn btn-secondary">

Back

</a>

</form>

</div>

</div>

</div>

</body>

</html>