<html data-bs-theme="dark">
<head>
 <meta charset="UTF-8">
 <title>Cab Booking System</title>
 <link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
rel="stylesheet" integrity="sha384-
T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
crossorigin="anonymous">
 <script
src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
crossorigin="anonymous"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
 <div class="container-fluid">
 <a class="navbar-brand" href="./">Xpress Taxi</a>
 <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bstarget="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle
navigation">
 <span class="navbar-toggler-icon"></span>
 </button>
 <div class="collapse navbar-collapse" id="navbarNav">
 <ul class="navbar-nav">
 <li class="nav-item">
 <a class="nav-link" aria-current="page" href="./">Book</a>
 </li>
 <li class="nav-item">
 <a class="nav-link" href="./cancel">Manage</a>
 </li>
 <li class="nav-item">
 <a class="nav-link" href="./bookings">View Bookings</a>
 </li>
 <li class="nav-item">
 <a class="nav-link active" href="./book">Calculate Fare</a>
 </li>
 <li class="nav-item">
 <a class="nav-link" href="./register">Register Vehicle</a>
 </li>
 </ul>
 </div>
 </div>
</nav>
<div class="container mt-5">
<div class = "row">
<div class = "col-md-4">
 <h2 class="mb-4">Fare Calculation</h2>
 <form method="post">
 <div class="mb-3">
 <label for="distance" class="form-label">Distance:</label>
 <input type="number" class="form-control" id="distance" name="distance"
required>
 </div>
 <div class="mb-3">
 <label class="form-label">Select Vehicle Type:</label><br>
 <div class="form-check form-check-inline">
 <input class="form-check-input" type="radio" id="Auto"
name="vehicleType" value="Auto">
 <label class="form-check-label" for="Auto">Auto</label>
 </div>
 <div class="form-check form-check-inline">
 <input class="form-check-input" type="radio" id="sedan"
name="vehicleType" value="Sedan">
 <label class="form-check-label" for="sedan">Sedan</label>
 </div>
 <div class="form-check form-check-inline">
 <input class="form-check-input" type="radio" id="suv"
name="vehicleType" value="SUV">
 <label class="form-check-label" for="suv">SUV</label>
 </div>
 <div class="form-check form-check-inline">
 <input class="form-check-input" type="radio" id="bike"
name="vehicleType" value="Bike">
 <label class="form-check-label" for="bike">Bike</label>
 </div>
 </div>
 <button type="submit" class="btn btn-primary">Check Fare</button>
 </form>
 </div>
 </div>
 <%
 int distance = 0;
 String vehicleType = request.getParameter("vehicleType");
 int amount = 0;
 if (request.getMethod().equalsIgnoreCase("post")) {
 distance = Integer.parseInt(request.getParameter("distance"));
 if (vehicleType != null) {
 switch (vehicleType) {
 case "Auto":
 amount = 20;
break;
 case "Sedan":
 amount = 30;
 break;
 case "SUV":
 amount = 35;
break;
 case "Bike":
 amount = 15;
break;
 default:
 amount = 0;
 }
 }
 }
 %>
 <p class="mt-3">Approximate Fare: <%= amount * distance %></p>
 </div>
</body>
</html>
