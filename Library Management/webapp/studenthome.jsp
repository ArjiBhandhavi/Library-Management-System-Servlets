<%@page import="java.sql.ResultSet"%>
<%@page import="library.DbConfig"%>
<%@page import="java.sql.Connection"%>
<jsp:include page="header.jsp"></jsp:include>

<h4 class="title">Student Dashboard</h4>

<%
Connection con=DbConfig.connect();
ResultSet rs=con.createStatement().executeQuery("select * from students where id="+session.getAttribute("id"));
rs.next();
%>
<table class="table table-bordered">
	<tr>
		<th>Name</th>
		<th><%= rs.getString("name") %></th>
	</tr>
	<tr>
		<th>Address</th>
		<th><%= rs.getString("address") %></th>
	</tr>
	<tr>
		<th>Email Address</th>
		<th><%= rs.getString("email") %></th>
	</tr>
	<tr>
		<th>Gender</th>
		<th><%= rs.getString("gender") %></th>
	</tr>
	<tr>
		<th>Contact Number</th>
		<th><%= rs.getString("phone") %></th>
	</tr>
	
</table>

<% con.close(); %>
<jsp:include page="footer.jsp"></jsp:include>