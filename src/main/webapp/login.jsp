<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | Student Management System</title>

    <link rel="stylesheet" href="css/login.css">

    <link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>

<body>

<div class="container">

    <div class="login-card">

        <div class="logo">
            <i class="fas fa-user-graduate"></i>
        </div>

        <h1>Welcome Back</h1>
        <p>Login to continue</p>
<%
String error = (String) request.getAttribute("error");

if(error != null){
%>

<div class="alert alert-danger">
    <%= error %>
</div>

<%
}
%>
        <form action="LoginServlet" method="post">

            <div class="input-box">
                <i class="fas fa-user"></i>
                <input type="text" placeholder="Username" name="username" required>
            </div>

            <div class="input-box">
                <i class="fas fa-lock"></i>
                <input type="password" placeholder="Password" name="password" required>
            </div>

            <div class="options">
                <label>
                    <input type="checkbox">
                    Remember Me
                </label>

                <a href="#">Forgot Password?</a>
            </div>

            <button type="submit">
                Login
            </button>

        </form>

        <div class="bottom-links">
            <p>
                Don't have an account?
                <a href="register.html">Register</a>
            </p>

            <a href="index.html" class="home-btn">
                ← Back To Home
            </a>
        </div>

    </div>

</div>

</body>
</html>