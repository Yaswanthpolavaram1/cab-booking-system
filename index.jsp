<!DOCTYPE html>
<html lang="en" data-bs-theme = "dark">
<head>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
rel="stylesheet" integrity="sha384-
T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
crossorigin="anonymous">
 <script
src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
crossorigin="anonymous"></script>
 <title>Cab Booking System</title>
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
 <a class="nav-link active" aria-current="page" href="./">Book</a>
 </li>
 <li class="nav-item">
 <a class="nav-link" href="./cancel">Manage</a>
 </li>
 <li class="nav-item">
 <a class="nav-link" href="./bookings">View Bookings</a>
 </li>
 <li class="nav-item">
 <a class="nav-link" href="./book">Calculate Fare</a>
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
 <h1 class="mb-4 d-flex justify-content-center">Cab Booking System</h1>
 <div class = "col-md-4">
 <form action="/cab_booking/testdb" method="post">
 <div class="mb-3">
 <label for="name" class="form-label">Name:</label>
 <input type="text" class="form-control" id="name" name="name" required>
 </div>
 <div class="mb-3">
 <label for="mobile" class="form-label">Mobile:</label>
 <input type="text" class="form-control" id="mobile" name="mobile" required>
 </div>
 </div>
 <div class = "col-md-4">
 <div class="mb-3">
 <label for="pickup" class="form-label">Pickup Address:</label>
 <input type="text" class="form-control" id="pickup" name="pickup" required>
 </div>
 <div class="mb-3">
 <label for="destination" class="form-label">Destination Address:</label>
 <input type="text" class="form-control" id="destination" name="destination"
required>
 </div>
 </div>
 <div class = "col-md-4 mt-2">
 <div class="mb-3">
 <label class="form-label">Vehicle Type:</label>
 <div class="form-check mb-2">
 <input class="form-check-input" type="radio" id="sedan" name="vehicle"
value="Sedan" required>
 <label class="form-check-label" for="sedan">Sedan</label>
 </div>
 <div class="form-check mb-2">
 <input class="form-check-input" type="radio" id="suv" name="vehicle"
value="SUV" required>
 <label class="form-check-label" for="suv">SUV</label>
 </div>
 <div class="form-check mb-2">
 <input class="form-check-input" type="radio" id="auto" name="vehicle"
value="Auto" required>
 <label class="form-check-label" for="auto">Auto</label>
 </div>
 <div class="form-check">
 <input class="form-check-input" type="radio" id="bike" name="vehicle"
value="Bike" required>
 <label class="form-check-label" for="bike">Bike</label>
 </div>
 </div>
 </div>
 <div class = "row">
 <div class = "col-md-4">
 </div>
 <div class = "col-md-4 d-flex justify-content-center">
 <button type="submit" class="btn btn-success" name="book">Book Cab</button>
 </div>
 <div class = "col-md-4">
 </div>
 </div>
 </form>
 </div>
 </div>
</body>
</html>
