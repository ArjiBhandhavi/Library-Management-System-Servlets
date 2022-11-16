<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv='cache-control' content='no-cache,no-store,must-revalidate'>
        <meta http-equiv='expires' content='0'>
        <meta http-equiv='pragma' content='no-cache'>
        <title>Login Page</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/library.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="login">
        <a href="index.jsp" class="btn btn-sm btn-primary float-right m-2">Home</a>
        <div class="jumbotron text-white p-4" style="background-color: #0000005c;">
            <h2 class="text-center">Student Portal</h2>
        </div>
        <div class="container">
            <jsp:include page="message.jsp"/>
            <div class="row">
                <div class="col-sm-5">
                <div class="card shadow mt-4">
                	<div class="card-header text-center">
                		<h5>Student Login</h5>
                	</div>
                	<div class="card-body">
                	<form method="post" action="validate">
                	<input type="hidden" name="screen" value="student">
                        <div class="form-group">
                            <label>User ID</label>
                            <input type="text" name="userid" required class="form-control"
                                   placeholder="User ID">
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" name="pwd" required class="form-control"
                                   placeholder="Password">
                        </div>
                        <input type="submit" value="Login" class="btn btn-primary float-right px-3">
                    </form>
                	</div>
                </div>
                                
                </div>
                
                <div class="col-sm-6 offset-1">
                <div class="card shadow">
                <div class="card-header text-center">
                	<h5>Student Registration</h5>
                </div>
                	<div class="card-body">                	
                	<form method="post" action="regstudent">
                        <div class="form-group form-row">                        
                            <label class="col-sm-4 col-form-label">Name</label>
                            <div class="col-sm-8">
                            <input type="text" name="name" required class="form-control"
                                   placeholder="Student Name">
                            </div>
                        </div>
                        <div class="form-group form-row">                        
                            <label class="col-sm-4 col-form-label">Address</label>
                            <div class="col-sm-8">
                            <input type="text" name="address" required class="form-control"
                                   placeholder="Address">
                        </div>
                        </div>
						<div class="form-group form-row">                        
                            <label class="col-sm-4 col-form-label">Phone</label>
                            <div class="col-sm-8">
                            <input type="text" name="phone" maxlength="10" required class="form-control"
                                   placeholder="Contact Number">
                        </div>
                        </div>
						<div class="form-group form-row">                        
                            <label class="col-sm-4 col-form-label">Email Id</label>
                            <div class="col-sm-8">
                            <input type="email" name="email" required class="form-control"
                                   placeholder="Email Address">
                        </div>
                        </div>
                        
                        <div class="form-group form-row">                        
                            <label class="col-sm-4 col-form-label">Gender</label>
                            <div class="col-sm-8">
                            <select name="gender" required class="form-control">	
                            	<option value="">Select Gender</option>
                            	<option>Male</option>
                            	<option>Female</option>
                            </select>
                        </div>
                        </div>

                       <div class="form-group form-row">                        
                            <label class="col-sm-4 col-form-label">Password</label>
                            <div class="col-sm-8">
                            <input type="password" name="pwd" required class="form-control"
                                   placeholder="Password">
                        </div>
                        </div>
                        <input type="submit" value="Register" class="btn btn-primary float-right px-3">
                    </form>
                	</div>
                </div>
                                
                </div>
            </div>
			<jsp:include page="message.jsp"></jsp:include>
        </div>        
    </body>
</html>
