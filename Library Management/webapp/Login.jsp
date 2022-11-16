<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv='cache-control'
	content='no-cache,no-store,must-revalidate'>
<meta http-equiv='expires' content='0'>
<meta http-equiv='pragma' content='no-cache'>
<title>Login Page</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="css/library.css" rel="stylesheet" type="text/css" />
</head>
<body class="login">
	<a href="index.jsp" class="btn btn-sm btn-primary float-right m-2">Home</a>
	<div class="jumbotron text-white p-4"
		style="background-color: #0000005c;">
		<h2 class="text-center">Library Admin Login </h2>
	</div>
	<div class="container-fluid">

		<div style="margin-top: 120px;"></div>
		<div class="row">
			<div class="offset-4 col-4">
				<div class="card shadow mt-4 p-3">
					<div class="card-body">
						<form method="post" action="validate">
							<input type="hidden" name="screen" value="admin">
							<div class="form-group">
								<label>User ID</label> <input type="text" name="userid" required
									class="form-control" placeholder="User ID">
							</div>
							<div class="form-group">
								<label>Password</label> <input type="password" name="pwd"
									required class="form-control" placeholder="Password">
							</div>
							<input type="submit" value="Login"
								class="btn btn-primary float-right px-3">
						</form>
						<div class="clearfix"></div>
						<jsp:include page="message.jsp" />
					</div>
				</div>

			</div>
		</div>

	</div>
</body>
</html>
