<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>

    <head>

        <meta charset="UTF-8">
        <title>Admin Dashboard</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

        <style>

            body{
                background:#f4f6f9;
                font-family:Arial,Helvetica,sans-serif;
            }

            .sidebar{
                position:fixed;
                width:240px;
                height:100vh;
                background:#212529;
                padding-top:20px;
            }

            .sidebar h2{
                color:white;
                text-align:center;
                margin-bottom:35px;
            }

            .sidebar a{
                display:block;
                padding:16px;
                color:white;
                text-decoration:none;
                font-size:22px;
            }

            .sidebar a:hover{
                background:#0d6efd;
            }

            .main{
                margin-left:250px;
                padding:25px;
            }

            .card{
                border:none;
                border-radius:18px;
                color:white;
                box-shadow:0 5px 12px rgba(0,0,0,.2);
                transition:.3s;
            }

            .card:hover{
                transform:translateY(-5px);
            }

            .card i{
                font-size:45px;
                margin-bottom:15px;
            }

            .bg1{
                background:#0d6efd;
            }
            .bg2{
                background:#198754;
            }
            .bg3{
                background:#ffc107;
                color:black;
            }
            .bg4{
                background:#0dcaf0;
            }
            .bg5{
                background:#dc3545;
            }

            .chart-box{
                background:white;
                padding:20px;
                border-radius:15px;
                box-shadow:0 5px 10px rgba(0,0,0,.15);
            }

            .activity{
                background:white;
                border-radius:15px;
                box-shadow:0 5px 10px rgba(0,0,0,.15);
            }

            .activity li{
                font-size:18px;
                padding:10px;
            }

            .parent-card{
                background:#6c757d;
                color:white;
                border-radius:18px;
                padding:25px;
                text-align:center;
                margin-bottom:20px;
            }

        </style>

    </head>

    <body>

        <jsp:include page="sidebar.jsp"/>

        <div class="main">

            <div class="d-flex justify-content-between mb-4">

                <h1>Admin Dashboard</h1>

                <h3>Welcome Admin 👋</h3>

            </div>

            <div class="row g-4">

                <div class="col-md-4">

                    <div class="card bg1 text-center p-4">

                        <i class="fa-solid fa-user-graduate"></i>

                        <h3>Students</h3>

                        <h1>${studentCount}</h1>

                    </div>

                </div>

                <div class="col-md-4">

                    <div class="card bg2 text-center p-4">

                        <i class="fa-solid fa-chalkboard-user"></i>

                        <h3>Teachers</h3>

                        <h1>${teacherCount}</h1>

                    </div>

                </div>

                <div class="col-md-4">

                    <div class="card bg3 text-center p-4">

                        <i class="fa-solid fa-calendar-check"></i>

                        <h3>Attendance</h3>

                        <h1>${attendanceCount}</h1>

                    </div>

                </div>

                <div class="col-md-4">

                    <div class="card bg4 text-center p-4">

                        <i class="fa-solid fa-wallet"></i>

                        <h3>Fees</h3>

                        <h1>${feeCount}</h1>

                    </div>

                </div>

                <div class="col-md-4">

                    <div class="card bg5 text-center p-4">

                        <i class="fa-solid fa-square-poll-vertical"></i>

                        <h3>Results</h3>

                        <h1>${resultCount}</h1>

                    </div>

                </div>

                <div class="col-md-4">

                    <div class="card text-center p-4" style="background:#fd7e14;">

                        <i class="fa-solid fa-user-clock"></i>

                        <h3>Pending Approvals</h3>

                        <br>

                        <a href="<%= request.getContextPath()%>/PendingUsersServlet" class="btn btn-light">
                            View Requests
                        </a>

                    </div>

                </div>

            </div>

            <br>
            <div class="row">

                <!-- Chart -->
                <div class="col-md-8">

                    <div class="chart-box">

                        <h3 class="mb-3">Student Statistics</h3>

                        <canvas id="myChart"></canvas>

                    </div>

                </div>

                <!-- Right Side -->
                <div class="col-md-4">

                    <div class="activity p-3">

                        <div class="parent-card">

                            <i class="fa-solid fa-users fa-3x"></i>

                            <h2 class="mt-3">Parents</h2>

                            <h1>${parentCount}</h1>

                        </div>

                        <h4 class="mb-3">Recent Activities</h4>

                        <ul class="list-group">

                            <li class="list-group-item">✅ Student Added</li>

                            <li class="list-group-item">✅ Teacher Added</li>

                            <li class="list-group-item">✅ Attendance Updated</li>

                            <li class="list-group-item">✅ Fee Received</li>

                            <li class="list-group-item">✅ Result Uploaded</li>

                        </ul>

                    </div>

                </div>

            </div>

        </div>

        <script>

            const ctx = document.getElementById("myChart");

            new Chart(ctx, {

                type: 'bar',

                data: {

                    labels: ['Students', 'Teachers', 'Attendance', 'Fees', 'Results'],

                    datasets: [{

                            label: 'Records',

                            data: [

            ${studentCount},

            ${teacherCount},

            ${attendanceCount},

            ${feeCount},

            ${resultCount}

                            ],

                            backgroundColor: [

                                '#0d6efd',

                                '#198754',

                                '#ffc107',

                                '#0dcaf0',

                                '#dc3545'

                            ],

                            borderWidth: 1

                        }]

                },

                options: {

                    responsive: true,

                    plugins: {

                        legend: {

                            display: false

                        }

                    },

                    scales: {

                        y: {

                            beginAtZero: true

                        }

                    }

                }

            });

        </script>

    </body>
</html>