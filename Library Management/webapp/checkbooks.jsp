<%@page import="library.DbConfig"%>
<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include flush="true" page="header.jsp"/>
<h4 class="text-center mb-2 border-bottom pb-2">Check Book Availability</h4>

<div class="row">
	<div class="col-sm-5 mx-auto text-center">
		<form class="form-inline form-group">
			<input type="text" name="search" value="${param.search }" placeholder="Enter book name to search" class="form-control mr-2" style="width:399px;">
			<input type="submit" value="search" class="btn btn-primary">
		</form>
	</div>
</div>
<table class="table table-bordered table-fixed">
    <thead class="table-dark">
    <tr style="position:sticky;top:0;">
        <th style="width:130px">Book ID</th>        
        <th>Book Name </th>
        <th>Author</th>
        <th>Publisher</th>
        <th>Price</th>
        <th>Status</th>
    </tr>
    </thead>
    <tbody style="overflow: scroll">
    <%
    String query="SELECT * FROM books order by bid desc";
    if(request.getParameter("search")!=null){
    	String search=request.getParameter("search");
    	query="SELECT * FROM books where bname like '%"+search+"%' order by bid desc";
    }
        Connection con = DbConfig.connect();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(query);
        while (rs.next()) {
    %>
    
    <tr>                    
        <td><%= rs.getString("bid")%></td>
        <td><%= rs.getString("bname")%></td>
        <td><%= rs.getString("author")%></td>
        <td><%= rs.getString("publisher")%></td>
        <td style="text-align: right">&#8377; <%= rs.getString("price")%></td>
        <td><%= rs.getString("status") %></td>
    </tr>
    <% }
    con.close();
    %> 
    </tbody>
</table>
<jsp:include page="footer.jsp"></jsp:include>