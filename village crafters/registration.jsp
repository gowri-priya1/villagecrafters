<!DOCTYPE html>
<html lang="en">
<head>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <style>
 body {
 background-image: url('Handicraft.jpg');
 background-size: cover;
 font-family: Arial, sans-serif;
 margin: 0;
 padding: 0;
 }
 .container {
 position: absolute;
 top: 100%;
 left: 50%;
transform: translate(-50%, -50%);
 background-color: darkred;
 box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
 border: 2px solid black;
 border-radius: 5px;
 padding: 20px;
 width: 500px;
 }
 h1 {
 text-align: center;
 color: #f4f4f4;
 }
 label {
 display: block;
 margin-bottom: 10px;
 color: #f4f4f4;
 }
 input,select,button {
 width: 100%;
 padding: 10px;
 margin-bottom: 15px;
 box-sizing: border-box;
 border: 1px solid #ccc;
 border-radius: 4px;
 }
 button {
 background-color: #4CAF50;
 color: white;
 border: none;
 border-radius: 4px;
 cursor: pointer;
 font-size: 16px;
 }
 button:hover {
 background-color: #45a049;
 }
 .error-message {
 color: red;
 font-size: 14px;
 }
 .occ {
 display: none;
 }
 @media (max-width: 600px) { /* Media query for responsiveness */
 .container {
 width: 90%;
 }
 }
 </style>
 <title>REGISTRATION</title>
</head>
<body>
 <div class="container">
 <h1>Register</h1>
 <form  action = "connect.jsp" method="post">
 <label id="Name">Name:
 <input type="text" id="name" placeholder="Enter your name" name="Name" required>
 </label>
 <br> <br>
 <label id="Email">Email:
 <input type="email" id="e_mail" placeholder="Email" name="e_mail" required>
 <span id="email-error" class="error-message"></span>
 </label>
 <br><br>
 <label id="Contactnumber">Contact number:
 <input type="tel" id="contno" placeholder="Enter number" onblur="validatephone()" name="contno"
required>
 <span id="phone-error" class="error-message"></span>
 </label>
 <br><br>
 <label id="Address">Residential address:
 <input type="text" id="address" placeholder="Enter address" name="address" required>
 </label>
 <br><br>
 <label id="Area">Area:
 <input type="text" id="area" placeholder="Enter area" name ="area" required>
 </label>
 <br><br>
 <label for="role">Role:
 <select id="role" name="role" onchange="roledropdown()" required>
 <option value="" disabled selected>--------</option>
 <option value="seller">Seller</option>
 <option value="buyer">Buyer</option>
 <option value="learner">Learner</option>
 </select>
 </label>
 <div class="occ">
 <label for="occupation">Occupation type:
 <select id="occupation" name="occupation">
 <option value="" disabled selected>--------</option>
 <option value="DIY Crafter" name="occupation">DIY Crafter</option>
 <option value="Artisan" name="occupation">Local Artisan</option>
 </select>
 </label>
 </div>
 <br> <br>
 <!-- <label id="Password">Password:
 <input type="password" id="Password" placeholder="Enter password"
onblur="validatepass()" required>
 <span id="pass-error" class="error-message"></span>
 </label>
 <br><br>
 <label id="Password2">Confirm Password:
 <input type="password" id="Password2" placeholder="Enter password" required>
 <span id="confirm-pass-error" class="error-message"></span>
 </label>
 <br><br> -->
 <button type="submit">REGISTER</button>
 </form>
 </div>
  <script>
 function roledropdown() {
 var role1 = document.getElementById("role");
 var occ = document.querySelector(".occ");
 if (role1.value === "seller") {
 occ.style.display = "block";
 } else {
 occ.style.display = "none";
 }
 }
 function validatephone() {
 var phone = document.getElementById("contno");
 var phoneerror = document.getElementById("phone-error");
 if (phone.value.length !== 10) {
 phoneerror.textContent = "INVALID PHONE NO";
 } else {
 phoneerror.textContent = "";
 }
 }
 function validatepass() {
 var password = document.getElementById("Password");
 var passerror = document.getElementById("pass-error");
 if (password.value.length < 6) {
 passerror.textContent = "Password must be at least 6 characters";
 } else {
 passerror.textContent = "";
 }
 }
 function validateForm() {
 var email = document.getElementById("e_mail");
 var emailerror = document.getElementById("email-error");
 var password = document.getElementById("Password");
 var confirmPass = document.getElementById("Password2");
 var confirmPassError = document.getElementById("confirm-pass-error");
 if (!isValidEmail(email.value)) { // Validate email
 emailerror.textContent = "Invalid email address";
 return false;
 } else {
 emailerror.textContent = "";
 }
 if (password.value !== confirmPass.value) { // Validate password match
 confirmPassError.textContent = "Passwords do not match";
 return false;
 } else {
 confirmPassError.textContent = "";
 }
 return true;
 }
function isValidEmail(email) { // Basic email validation using a regular expression
 var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
 return emailRegex.test(email);
 }
 </script>
</body>
</html>