<%@page import="library.DbConfig"%>
<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include flush="true" page="header.jsp"/>
<h4 class="text-center mb-2 border-bottom pb-2">Issue Books</h4>

<div class="container">
	<div class="row">
		<div class="col-sm-6 mx-auto">
			<div class="card shadow">
			<div class="card-body">
				<form>
					<div class="form-row form-group">
						<label class="col-sm-4 col-form-label">Book Id</label>
						<div class="col-sm-8">
							<div class="input-group">
							<input type="text" name="bookid" value="${param.bookid }" class="form-control">
							<button class="btn btn-primary input-group-append">Search</button>
							</div>
						</div>
					</div>
				</form>
				<%
				if(request.getParameter("bookid")!=null){
				String bookid=request.getParameter("bookid");
				Connection con=DbConfig.connect();
				ResultSet rs=con.createStatement().executeQuery("select * from books where bid="+bookid);
				if(rs.next()){
					if(rs.getString("Status").equals("Available")){%>
				<form>
					<input type="hidden" name="bookid" value="${param.bookid }">
					
					<div class="form-row form-group">
						<label class="col-sm-4 col-form-label">Book Name</label>
						<div class="col-sm-8">
							<input type="text" readonly value="<%= rs.getString("bname") %>" class="form-control">
						</div>
					</div>
					
					<div class="form-row form-group">
						<label class="col-sm-4 col-form-label">Student Id</label>
						<div class="col-sm-8">
							<div class="input-group">
							<input type="text" name="stdid" value="${param.stdid }" class="form-control">
							<button class="btn btn-primary input-group-append">Search</button>
							</div>
						</div>
					</div>
				</form>
					<%
					if(request.getParameter("stdid")!=null){
						String stdid=request.getParameter("stdid");
						ResultSet rs2=con.createStatement().executeQuery("select * from students where id="+stdid);
						if(rs2.next()){%>
							<form method="post" action="issue">
								<input type="hidden" name="bid" value="${param.bookid }">
								<input type="hidden" name="stdid" value="${param.stdid }">
								
								<div class="form-row form-group">
									<label class="col-sm-4 col-form-label">Student Name</label>
									<div class="col-sm-8">
										<input type="text" readonly value="<%= rs2.getString("name") %>" class="form-control">
									</div>
								</div>
								
								
								<button class="btn btn-primary float-right">Issue Book</button>
							</form>
						<%
						con.close();
						}
						
						else{%>
							<h6 class="text-danger font-weight-bold text-center">Invalid Student Id</h6>
						<% }
						}
					}
					else{%>
						<h6 class="text-danger font-weight-bold text-center">Book not available</h6>
					<%}
				}else{%>
					<h6 class="text-danger font-weight-bold text-center">Invalid book id</h6>
				<% } } %>
			</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="footer.jsp"></jsp:include>