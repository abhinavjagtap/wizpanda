<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Student</title>
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/floating.css" rel="stylesheet" />
<link href="css/login.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<link href="font/poppins/poppins.css" rel="stylesheet" />
<link href="css/sweetalert.css" rel="stylesheet">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">

</head>
<body>
	<div class="container">
		<div class="row col-lg-12 col-md-12 mt-10">
			<div class="col-lg-4 col-md-8 col-sm-12 offset-lg-4 offset-md-2 ">
				<div class="card">
					<div
						class="col-lg-10  col-md-10 col-sm-12 offset-md-1 offset-lg-1 m-t-5">
						<h2>Create Student</h2>
					</div>
					<div
						class="col-lg-10  col-md-10 col-sm-12 offset-md-1 offset-lg-1 mt-4">
						<div class="form-group">
							<input type="text" id="name" class="form-control" required>
							<label class="form-control-myplaceholder" 
								for="name"> Name</label>

						</div>
					</div>
					<div
						class="col-lg-10  col-md-10 col-sm-12 offset-md-1 offset-lg-1 mt-2">
						<div class="form-group">
							<input type="text" id="email" class="form-control" required>
							<label class="form-control-myplaceholder" 
								for="email"> Email-ID</label>

						</div>
					</div>
					<div
						class="col-lg-10  col-md-10 col-sm-12 offset-md-1 offset-lg-1 mt-2">
						<div class="form-group">
							<input type="text" id="mobno" class="form-control" required>
							<label class="form-control-myplaceholder" 
								for="mobno"> Mobile No</label>

						</div>
					</div>

					<div class="col-lg-10  col-md-10 col-sm-12 offset-md-1 offset-lg-1 mt-2">
						<div class="form-group">
							<input id="pass" type="password" class="form-control"
								name="pass"  required> <label
								class="form-control-myplaceholder" for="pass">Password</label>
							<span toggle="#pass" toggle="#password-field"
								class=" toggle-password" id="eyeid"> <img id="imgff"
								src="images/eye.svg" ></span>
						</div>
					</div>


					<div
						class=" col-lg-10  col-md-10 col-sm-12 offset-md-1 offset-lg-1 ">
						<button class="btn btn-primary" onclick="createStudent()"
							id="createbtn" style="margin-left: 0%; width: 100%">Create</button>
					</div>
					<div
						class=" col-lg-10  col-md-10 col-sm-12 offset-md-1 offset-lg-1 mt-3 mb-5">
						<a href="login.jsp">Login</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="js/jquery-3.5.1.js" type="text/javascript"></script>
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/bootstrap.bundle.min.js" type="text/javascript"></script>
	<script src="js/sweetalert.min.js"></script>
	<script>
		

		/**
		 * **************************** get login Data *
		 * **********************************
		 */

		$(document).keypress(function(event) {
			var keycode = (event.keyCode ? event.keyCode : event.which);
			if (keycode == '13') {
				createStudent();
			}
		});

		
		/*************************** Email-id check for already Exist or not **************************/
		var femailid = 1;
		$("#email").blur(
				function() {
					femailid = 1;
					
					var emailid = $("#email").val();

					$.ajax({
						url : 'student/checkEmailId',
						type : 'GET',
						dataType : 'json',
						data : {
							'emailid' : emailid,
						},
						success : function(result) {
							
							if(result.present == 0){
								femailid = 0;
								} else {
									swal("Email-Id", "Email-Id Is Already Present");
									femailid = 1;
									return false;
								}
						}
					});

				});/*************************** Email-id check for already Exist or not **************************/

	/*************************** Mobile No check for already Exist or not **************************/
		var fmobileno = 1;
		$("#mobno").blur(
				function() {
					fmobileno = 1;
					var mobno = $("#mobno").val();

					$.ajax({
						url : 'student/checkMobileNo',
						type : 'GET',
						dataType : 'json',
						data : {
							'mobno' : mobno
						},
						success : function(result) {
							
							if (result.present == 0) {
								fmobileno = 0;
							} else {
								swal("Mobile No","Mobile No Is Already Present");
								fmobileno = 1;
								return false;
							}
						
						}
					});

				});	/*************************** Mobile No check for already Exist or not **************************/	
	
		function createStudent() {
			
			
			var name = $('#name').val();
			var email = $('#email').val();
			var mobno = $('#mobno').val();
			var password = $('#pass').val();
			var pattern = "[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$";
			var letters = /^(?=[a-zA-Z])(?=.*\d)[A-Za-z\d]{8,16}$/; 
			if (name == null || name == "" || name == undefined) {
				swal("Name", "Please Enter Name");
				return false;
			}
			
			if (email == null || email == "" || email == undefined) {
				swal("Email Id","Email can't be empty");
				return false;
			}
			
			if (!(email.match(pattern))) {
				
				swal("Email Id",'Please Enter Valid Email-Id e.g: aditya12@gmail.com.');
				return false;
			}
			
			if (femailid == 1) {
				
				swal("Email-Id","Email-Id Is Already Present");
				return false;
			}
			
			if (mobno == null || mobno == "" || mobno == undefined) {
				swal("Mobile No","Please Enter Mobile No")
				return false;
			}
			
			if (fmobileno == 1) {
				
				swal("Mobile No","Mobile No Is Already Present");
				return false;
			}

			if (password == null || password == "" || password == undefined) {
				swal("password","Password can't be empty");
				return false;
			}
			
			if(!password.match(letters)){
				swal("Password",'Password must contains\nAtleast one character,\nOne number,\nLength should be 8 to 16');
				return false;
			}
		
			$('#createbtn').prop('disabled', true);

			$.ajax({
						url : 'student/create',
						type : 'POST',
						dataType : 'JSON',
						data : {
							'name' : name,
							'email' : email,
							'mobileno' : mobno,
							'password' : password,
						},

						success : function(res) {
							$('#createbtn').prop('disabled', false);

							if (res == null || res == "") {
								swal("Error");
							} else {
								swal("Student", "Created Succesfully", "success");
								$('#name').val("");
								$('#email').val("");
								$('#pass').val("");
								$('#mobno').val("");
							}

						}
					})

		}

		/*******************************************************************************
		 * **************************** password Hide/Show*
		 ******************************************************************************/

		$('.toggle-password').click(function() {

			var input = document.getElementById("pass");

			if (input.type === "password") {
				$('#imgff').attr('src', 'images/eye.svg');
				input.type = "text";

			} else {
				$('#imgff').attr('src', 'images/eye-off.svg');
				input.type = "password";

			}
		})
		/*******************************************************************************
		 * **************************** password Hide/Show*
		 ******************************************************************************/
		 
		 $("#mobno").keydown(
					function(e) {

						if (e.ctrlKey || e.altKey) {
							e.preventDefault();
						} else {
							var key = e.keyCode;
							if (!((key == 8)
									|| (key >= 48 && key <= 57)
									|| (key >= 96 && key <= 105) || (key == 9))) {
								e.preventDefault();
							}
						}
					});
		
		$("#name").keydown(
				function(e) {
					if (e.ctrlKey || e.altKey) {
						e.preventDefault();
					} else {
						var key = e.keyCode;
						if (!((key == 8) || (key == 32) || (key == 46)
								|| (key >= 35 && key <= 40)
								|| (key >= 65 && key <= 90) || (key == 9))) {
							e.preventDefault();
						}
					}
				});
		
		
		
	</script>
</body>
</html>