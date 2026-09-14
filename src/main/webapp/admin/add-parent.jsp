<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.sms.model.Student" %>

<%
    List<Student> studentList
            = (List<Student>) request.getAttribute("studentList");
%>

<!DOCTYPE html>
<html>

    <head>

        <meta charset="UTF-8">

        <title>Add Parent</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

        <style>

            body{
                background:#f4f6f9;
                font-family:Arial,Helvetica,sans-serif;
            }

            .container{
                width:650px;
                margin:40px auto;
                background:#fff;
                padding:30px;
                border-radius:10px;
                box-shadow:0 0 10px rgba(0,0,0,.1);
            }

            h2{
                text-align:center;
                margin-bottom:25px;
            }

            .form-label{
                font-weight:bold;
            }

            .btn-save{
                background:#198754;
                color:white;
            }

        </style>

    </head>

    <body>

        <div class="container">

            <h2>Add Parent</h2>

            <form action="<%=request.getContextPath()%>/AddParentServlet"
                  method="post">


                <div class="mb-3">

                    <label class="form-label">

                        Student

                    </label>

                    <select
                        name="studentId"
                        class="form-select"
                        required>

                        <option value="">

                            Select Student

                        </option>

                        <%

                            if (studentList != null) {

                                for (Student s : studentList) {

                        %>

                        <option value="<%=s.getId()%>">

                            <%=s.getStudentId()%> -
                            <%=s.getFullName()%>

                        </option>

                        <%

                                }

                            }

                        %>

                    </select>

                </div>

                <div class="mb-3">

                    <label class="form-label">

                        Full Name

                    </label>

                    <input
                        type="text"
                        name="fullName"
                        class="form-control"
                        required>

                </div>

                <div class="mb-3">

                    <label class="form-label">

                        Email

                    </label>

                    <input
                        type="email"
                        name="email"
                        class="form-control"
                        required>

                </div>

                <div class="mb-3">

                    <label class="form-label">

                        Phone

                    </label>

                    <input
                        type="text"
                        name="phone"
                        class="form-control"
                        required>

                </div>

                <div class="mb-3">

                    <label class="form-label">

                        Occupation

                    </label>

                    <input
                        type="text"
                        name="occupation"
                        class="form-control"
                        required>

                </div>

                <div class="mb-3">

                    <label class="form-label">

                        Address

                    </label>

                    <textarea
                        name="address"
                        rows="4"
                        class="form-control"></textarea>

                </div>

                <div class="text-center">

                    <button
                        type="submit"
                        class="btn btn-save">

                        Add Parent

                    </button>

                    <a href="<%=request.getContextPath()%>/ParentsServlet"
                       class="btn btn-secondary">

                        Cancel

                    </a>

                </div>

            </form>

        </div>

    </body>

</html>