<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Craftsman Profile</title>
    <!-- CSS and other head content here -->
    <style>
        body {
            background-image: url('bg.jpg'); 
            background-size: cover;
            background-repeat: no-repeat;
            font-family: Arial, sans-serif;
            color: #333;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1, h2 {
            text-align: center;
        }
        #profilePic{
            border-radius: 50%;
            display: block;
            margin: 0 auto;
            width: 150px;
            height: 150px;
            object-fit: cover;
        }
        #editProfileForm {
            margin-top: 20px;
        }
        label {
            font-weight: bold;
        }
        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 8px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
        }
        input[type="file"] {
            margin-top: 5px;
        }
        .gallery {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            margin-top: 20px;
        }
        .gallery img {
            margin: 5px;
            max-width: 200px;
            height: auto;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0,0,0,0.1);
            transition: transform 0.3s ease-in-out;
        }
        .gallery img:hover {
            transform: scale(1.1);
        }
        .button {
            display: block;
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            background-color: #ff7b00;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
        }
        .button:hover {
            background-color: #e66000;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Your Profile</h1>
        <div id="profileDetails">
            <% 
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydbuser", "root", "root");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM diycrafter");

                    while (rs.next()) {
                        String name = rs.getString("name");
                        String role = rs.getString("role");
                        String address = rs.getString("address");
                        String area = rs.getString("area");
                       
            %>
            <div>
                <h2><%= name %></h2>
                <p>Role: <%= role %></p>
                <p>Address: <%= address %></p>
                <p>Area: <%= area %></p>
                
            </div>
            <% 
                    }
                    con.close();
                } catch (Exception e) {
                    out.println(e);
                }
            %>
        </div>
        <button id="editProfileBtn" class="button"><i class="fas fa-user-edit"></i> Edit Profile</button>
        <form action="" id="editProfileForm" style="display: none;" enctype="multipart/form-data">
            <h2>Edit Profile</h2>
            <label for="names">Name:</label>
            <input type="text" id="names" value="pattu" name="names"><br>
            <label for="specialties">Specialty:</label>
            <input type="text" id="specialties" value="joker" name="specialties"><br>
            <label for="locations">Location:</label>
            <input type="text" id="locations" value="delhi" name="locations"><br>
            <!-- <label for="numSold">Number of Things Sold:</label>
            <input type="number" id="numSold" value="10" name="numSold"><br> -->
            <label for="profilePicUpload">Profile Picture:</label>
            <input type="file" id="profilePicUpload" name="profilePic"><br>
            <label for="workPhotosUpload">Work Photos:</label>
            <input type="file" id="workPhotosUpload" name="workPhotos" multiple><br>
            <button type="button" id="saveProfileBtn" class="button"><i class="fas fa-save"></i> Save</button>
        </form>
    </div>
    <!-- JavaScript and other body content here -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#editProfileBtn').click(function() {
                $('#profileDetails').slideToggle();
                $('#editProfileForm').slideToggle();
            });

            $('#saveProfileBtn').click(function() {
                var name = $('#names').val();
                var specialty = $('#specialties').val();
                var location = $('#locations').val();
            
               

                // Prepare form data
                var formData = new FormData();
                formData.append('names', names);
                formData.append('specialties', specialties);
                formData.append('locations', locations);
               
                // formData.append('profilePic', profilePic);
                

                // Send AJAX request to update profile
                $.ajax({
                    url: 'updateprofile.jsp', // Your server-side script to handle the update
                    type: 'POST',
                    data: formData,
                    contentType: false,
                    processData: false,
                    success: function(response) {
                        // Handle success response
                        console.log(response);
                    },
                    error: function(xhr, status, error) {
                        // Handle error
                        console.error(xhr.responseText);
                    }
                });

                // Hide the edit form and show the profile details
                $('#editProfileForm').slideUp();
                $('#profileDetails').slideDown();
            });
        });
    </script>
</body>
</html>

