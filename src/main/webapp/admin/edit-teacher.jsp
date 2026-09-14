<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.sms.model.Teacher" %>

<%
Teacher teacher = (Teacher) request.getAttribute("teacher");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Teacher</title>

    <style>
        body{
            font-family: Arial, sans-serif;
            background:#f4f6f9;
            padding:30px;
        }

        .container{
            width:500px;
            margin:auto;
            background:white;
            padding:20px;
            border-radius:8px;
        }

        input, textarea{
            width:100%;
            padding:10px;
            margin:8px 0;
            box-sizing:border-box;
        }

        button{
            background:#4CAF50;
            color:white;
            padding:10px 20px;
            border:none;
            cursor:pointer;
        }
    </style>
</head>

<body>

<div class="container">

<h2>Edit Teacher</h2>

<form action="${pageContext.request.contextPath}/UpdateTeacherServlet" method="post">

<input type="hidden" name="id" value="<%=teacher.getId()%>">

<label>Teacher ID</label>
<input type="text" name="teacherId" value="<%=teacher.getTeacherId()%>" required>

<label>Full Name</label>
<input type="text" name="fullName" value="<%=teacher.getFullName()%>" required>

<label>Email</label>
<input type="email" name="email" value="<%=teacher.getEmail()%>" required>

<label>Phone</label>
<input type="text" name="phone" value="<%=teacher.getPhone()%>" required>

<label>Department</label>
<input type="text" name="department" value="<%=teacher.getDepartment()%>" required>

<label>Qualification</label>
<input type="text" name="qualification" value="<%=teacher.getQualification()%>" required>

<label>Address</label>
<textarea name="address"><%=teacher.getAddress()%></textarea>

<br><br>

<button type="submit">Update Teacher</button>

</form>

</div>

</body>
</html>