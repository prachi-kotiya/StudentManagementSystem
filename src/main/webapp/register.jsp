<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register | Student Management System</title>

    <link rel="stylesheet" href="css/register.css">

    <link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
<body>

<div class="container">

    <div class="register-card">

        <div class="logo">
            <i class="fas fa-user-plus"></i>
        </div>

        <h1>Create Account</h1>
        <p>Register to access the system</p>

        <form action="register" method="post">

            <div class="input-box">
                <i class="fas fa-user"></i>
                <input type="text" placeholder="Full Name" name="fullname" required>
            </div>

            <div class="input-box">
                <i class="fas fa-envelope"></i>
                <input type="email" placeholder="Email Address" name="email" required>
            </div>

            <div class="input-box">
                <i class="fas fa-phone"></i>
                <input type="text" placeholder="Phone Number" name="phone" required>
            </div>

            <div class="input-box">
                <i class="fas fa-users"></i>

                <select required name="role">
                    <option value="">Select Role</option>
                    <option>Student</option>
                    <option>Teacher</option>
                    <option>Parent</option>
                </select>
            </div>

            <div class="input-box">
                <i class="fas fa-user-circle"></i>
                <input type="text" placeholder="Username" name="username" required>
            </div>

            <div class="input-box">
                <i class="fas fa-lock"></i>
                <input type="password" placeholder="Password" name="password" required>
            </div>

            <div class="input-box">
                <i class="fas fa-lock"></i>
                <input type="password" placeholder="Confirm Password" required>
            </div>

            <button type="submit">
                Register
            </button>

        </form>

        <div class="bottom-links">

            <p>
                Already have an account?
                <a href="login.jsp.html">Login</a>
            </p>

            <a href="index.html" class="home-btn">
                ? Back To Home
            </a>

        </div>

    </div>

</div>

</body>
</html>