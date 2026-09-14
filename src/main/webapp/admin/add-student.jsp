<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
    <head>

        <meta charset="UTF-8">

        <title>Add Student</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

        <style>

            body{
                background:#f4f6f9;
            }

            .container{
                width:600px;
                margin:40px auto;
                background:#fff;
                padding:30px;
                border-radius:10px;
                box-shadow:0 0 10px rgba(0,0,0,.2);
            }

            h2{
                text-align:center;
                margin-bottom:20px;
            }

        </style>

    </head>

    <body>

        <div class="container">

            <h2>Add New Student</h2>

            <form action="${pageContext.request.contextPath}/AddStudentServlet"
                  method="post">

                <div class="mb-3">
                    <label class="form-label">Full Name</label>
                    <input type="text"
                           name="fullName"
                           class="form-control"
                           required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <input type="email"
                           name="email"
                           class="form-control"
                           required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Phone</label>
                    <input type="text"
                           name="phone"
                           class="form-control"
                           required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Course</label>
                    <input type="text"
                           name="course"
                           class="form-control"
                           required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Semester</label>
                    <input type="text"
                           name="semester"
                           class="form-control"
                           required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Address</label>
                    <textarea name="address"
                              class="form-control"
                              rows="4"></textarea>
                </div>

                <button type="submit"
                        class="btn btn-success">
                    Save Student
                </button>

                <a href="${pageContext.request.contextPath}/StudentsServlet"
                   class="btn btn-secondary">
                    Cancel
                </a>

            </form>

        </div>

    </body>
</html>