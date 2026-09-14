<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.sms.model.Student"%>

<!DOCTYPE html>
<html>
    <head>

        <meta charset="UTF-8">

        <title>Add Fee</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    </head>

    <body>

        <div class="container mt-5">

            <div class="card shadow">

                <div class="card-header bg-success text-white">

                    <h3>Add Fee Payment</h3>

                </div>

                <div class="card-body">

                    <form action="${pageContext.request.contextPath}/AddFeeServlet" method="post">

                        <div class="mb-3">

                            <label>Select Student</label>

                            <select name="studentId" class="form-select" required>

                                <%
                                    List<Student> studentList
                                            = (List<Student>) request.getAttribute("studentList");

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

                        <div class="mb-3">

                            <label>Amount</label>

                            <input type="number"
                                   step="0.01"
                                   name="amount"
                                   class="form-control"
                                   required>

                        </div>

                        <div class="mb-3">

                            <label>Fee Type</label>

                            <input type="text"
                                   name="feeType"
                                   class="form-control"
                                   placeholder="Tuition / Exam / Library"
                                   required>

                        </div>

                        <div class="mb-3">

                            <label>Payment Date</label>

                            <input type="date"
                                   name="paymentDate"
                                   class="form-control"
                                   required>

                        </div>

                        <div class="mb-3">

                            <label>Status</label>

                            <select name="status" class="form-select">

                                <option value="Paid">Paid</option>

                                <option value="Pending">Pending</option>

                            </select>

                        </div>

                        <button class="btn btn-success">

                            Save Fee

                        </button>

                        <a href="${pageContext.request.contextPath}/FeeListServlet"
                           class="btn btn-secondary">

                            View Fees

                        </a>

                    </form>

                </div>

            </div>

        </div>

    </body>
</html>