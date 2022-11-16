<%@page import="library.DbConfig"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String bid=request.getParameter("bid");
    Connection con=DbConfig.connect();
    ResultSet rs=con.createStatement().executeQuery("select * from books where bid="+bid);
    rs.next();
%>
<jsp:include flush="true" page="header.jsp" />

<div class="row">
	<div class="col-sm-12">
		<h4 class="text-center mb-2 border-bottom pb-2">
			Edit Product with id :
			<%= bid %></h4>
		<form method="post" action="savebook">
			<input type="hidden" name="bid" value="<%= bid %>">
			<div class="form-row">
				<div class="col-sm-4">
					<div class="form-group">
						<label>Product Name</label> <input type="text" name="bname"
							class="form-control" value="<%= rs.getString("bname") %>">
					</div>
				</div>
				<div class="col-sm-4">
					<div class="form-group">
						<label>Book Author</label> <input type="text" name="author"
							value="<%= rs.getString("author") %>" class="form-control">
					</div>
				</div>
				<div class="col-sm-4">
					<div class="form-group">
						<label>Book Publisher</label> <input type="text" name="publisher"
							value="<%= rs.getString("publisher") %>" class="form-control">
					</div>
				</div>
				<div class="col-sm-4">
					<div class="form-group">
						<label>Book ISBN</label> <input type="text"
							placeholder="13digit number" value="<%= rs.getString("isbn") %>"
							maxlength="13" name="isbn" class="form-control">
					</div>
				</div>
				<div class="col-sm-4">
					<div class="form-group">
						<label>Product Price</label> <input type="text" name="price"
							class="form-control" value="<%= rs.getString("price") %>">
					</div>
				</div>
				<div class="col-sm-4">
					<div class="form-group">
						<label>Description</label>
						<textarea rows="4" class="form-control" style="resize: none"
							name="descr"><%= rs.getString("descr") %></textarea>
					</div>
				</div>
				</div>
				<input type="submit" value="Save Product"
					class="btn btn-primary float-right">
		</form>
	</div>
</div>
<jsp:include flush="true" page="footer.jsp" />

