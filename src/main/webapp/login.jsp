<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
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
		<div class="row col-lg-12 col-md-12 mt-15">
			<div class="col-lg-4 col-md-8 col-sm-12 offset-lg-4 offset-md-2 ">
				<div class="card">
					<div
						class="col-lg-10  col-md-10 col-sm-12 offset-md-1 offset-lg-1 m-t-5">
						<h2>Login</h2>
					</div>
					<div
						class="col-lg-10  col-md-10 col-sm-12 offset-md-1 offset-lg-1 mt-4">
						<div class="form-group">
							<input type="text" id="emailid" class="form-control" required>
							<label class="form-control-myplaceholder" id="xxEmail"
								for="emailid"> Email-ID</label>

						</div>
					</div>


					<div
						class="col-lg-10  col-md-10 col-sm-12 offset-md-1 offset-lg-1 mt-2">
						<div class="form-group">
							<input id="password" type="password" class="form-control"
								name="password" required> <label
								class="form-control-myplaceholder" for="password">Password</label>
							<span toggle="#password" toggle="#password-field"
								class=" toggle-password" id="eyeid"> <img id="imgff"
								src="images/eye.svg" ></span>

						</div>
					</div>


					<div
						class=" col-lg-10  col-md-10 col-sm-12 offset-md-1 offset-lg-1 ">
						<button class="btn btn-primary" onclick="chekpassword()"
							id="loginbtn" style="margin-left: 0%; width: 100%">Login</button>
					</div>
					<div
						class=" col-lg-10  col-md-10 col-sm-12 offset-md-1 offset-lg-1 mt-3 mb-5">
						<a href="create.jsp">Create New Student</a>
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
				chekpassword();
			}
		});

		var c;
		function chekpassword() {
			var email = $('#emailid').val();
			var password = $('#password').val();

			if (email == null || email == "" || email == undefined) {
				swal("EmailId","Email can't be empty")
				return false;
			}

			if (password == null || password == "" || password == undefined) {
				swal("Password","Password can't be empty")
				return false;
			}

			$('#loginbtn').prop('disabled', true);

			$
					.ajax({
						url : 'login',
						type : 'GET',
						dataType : 'JSON',
						data : {
							'emailid' : email,
							'password' : password,
						},

						success : function(res) {
							$('#loginbtn').prop('disabled', false);
                            console.log(res.present);
							if(res.present == 0){
								swal("Login","Invalid EmailId or Password");
								return false;
							}else{
								window.location ="students.jsp";
							}
							

						}
					})

		}

		/*******************************************************************************
		 * **************************** password Hide/Show*
		 ******************************************************************************/

		$('.toggle-password').click(function() {

			var input = document.getElementById("password");

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
	</script>
</body>
</html>