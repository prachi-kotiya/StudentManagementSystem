<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.sms.model.Student" %>

<%
    List<Student> studentList = (List<Student>) request.getAttribute("studentList");
%>

<!DOCTYPE html>
<html>
    <head>

        <meta charset="UTF-8">

        <title>Add Result</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    </head>

    <body>

        <div class="container mt-5">

            <div class="card shadow">

                <div class="card-header bg-primary text-white">
                    <h3>Add Student Result</h3>
                </div>

                <div class="card-body">

                    <form action="${pageContext.request.contextPath}/AddResultServlet" method="post">

                        <!-- Student Dropdown -->
                        <div class="mb-3">

                            <label class="form-label">Select Student</label>

                            <select name="studentId" class="form-select" required>

                                <option value="">Select Student</option>

                                <%
                                    if (studentList != null) {
                                        for (Student s : studentList) {
                                %>

                                <option value="<%=s.getId()%>">
                                    <%=s.getStudentId()%> - <%=s.getFullName()%>
                                </option>

                                <%
                                        }
                                    }
                                %>

                            </select>

                        </div>

                        <!-- Subject -->
                        <div class="mb-3">

                            <label class="form-label">Subject</label>

                            <input type="text"
                                   name="subject"
                                   class="form-control"
                                   required>

                        </div>

                        <!-- Marks -->
                        <div class="mb-3">

                            <label class="form-label">Marks</label>

                            <input type="number"
                                   step="0.01"
                                   name="marks"
                                   class="form-control"
                                   required>

                        </div>

                        <!-- Grade -->
                        <div class="mb-3">

                            <label class="form-label">Grade</label>

                            <select name="grade" class="form-select" required>

                                <option value="">Select Grade</option>
                                <option>A+</option>
                                <option>A</option>
                                <option>B+</option>
                                <option>B</option>
                                <option>C</option>
                                <option>D</option>
                                <option>F</option>

                            </select>

                        </div>

                        <!-- Exam Date -->
                        <div class="mb-3">

                            <label class="form-label">Exam Date</label>

                            <input type="date"
                                   name="examDate"
                                   class="form-control"
                                   required>

                        </div>

                        <button type="submit" class="btn btn-success">
                            Save Result
                        </button>

                        <a href="${pageContext.request.contextPath}/ResultListServlet"
                           class="btn btn-secondary">
                            View Results
                        </a>

                    </form>

                </div>

            </div>

        </div>

    </body>
</html>