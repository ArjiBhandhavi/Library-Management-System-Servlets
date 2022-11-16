<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link rel="icon" href="images/logo.png"/>
    </head>
    <body>
        <div class="container-fluid ">
            <div class="row">
                <div class="col-2 bg-dark fixed-top h-100 px-0 py-0"> 
                    <div class="card">
                        <img src="images/liblogo.png" class="card-img-top" style="height:150px;">
                        <div class="card-header text-center">
                            ${sessionScope.uname }
                        </div>
                        <div class="card-header text-center">
                            ${sessionScope.role }
                        </div>
                        <ul class="list-group list-group-flush">
                        	<%
                        	if(session.getAttribute("role").toString().equals("Admin")) { 
                        	%>
                            <a href="adminhome.jsp" class="list-group-item list-group-item-action">Home</a>
                            <a href="books.jsp" class="list-group-item list-group-item-action">Books</a>
                            <a href="issuebook.jsp" class="list-group-item list-group-item-action">Issue Books</a>                            
                            <a href="returnbook.jsp" class="list-group-item list-group-item-action">Return Books</a>
                            <a href="users.jsp" class="list-group-item list-group-item-action">Users</a>
                            <a href="report.jsp" class="list-group-item list-group-item-action">Reports</a>
                            <% } else {%>
                            <a href="studenthome.jsp" class="list-group-item list-group-item-action">Home</a>
                            <a href="checkbooks.jsp" class="list-group-item list-group-item-action">Search Books</a>
                            <a href="mybooks.jsp" class="list-group-item list-group-item-action">Issued Books</a>
                            <a href="history.jsp" class="list-group-item list-group-item-action">Book History</a>
                            <% } %>
                            <a href="ChangePwd.jsp" class="list-group-item list-group-item-action">Change Password</a>
                            <a href="logout" class="list-group-item list-group-item-action">Logout</a>
                        </ul>
                    </div>
                </div>
                <div class="col offset-2 p-0">
                    <div class="jumbotron text-center text-white bg-dark p-3 mb-0">
                        <h4>${sessionScope.role } Role Portal</h4>
                    </div>
                    <div class="p-3" style="min-height:80vh;">

