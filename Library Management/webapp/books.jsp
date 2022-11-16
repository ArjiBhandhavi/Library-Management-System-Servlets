<%@page import="library.DbConfig"%>
<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include flush="true" page="header.jsp"/>
<a href="addbook.jsp" class="btn btn-primary btn-sm float-right">Add New</a>
<h4 class="text-center mb-2 border-bottom pb-2">Books List</h4>
<jsp:include page="message.jsp" />
<table class="table table-bordered table-fixed">
    <thead class="table-dark">
    <tr style="position:sticky;top:0;">
        <th style="width:130px">Book ID</th>        
        <th>Book Name </th>
        <th>Author</th>
        <th>Publisher</th>
        <th>Price</th>
        <th>Status</th>
        <th>Action</th>        
    </tr>
    </thead>
    <tbody style="overflow: scroll">
    <%
        Connection con = DbConfig.connect();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM books order by bid desc");
        while (rs.next()) {
    %>
    
    <tr>                    
        <td><%= rs.getString("bid")%></td>
        <td><%= rs.getString("bname")%></td>
        <td><%= rs.getString("author")%></td>
        <td><%= rs.getString("publisher")%></td>
        <td style="text-align: right">&#8377; <%= rs.getString("price")%></td>
        <td><%= rs.getString("status") %></td>
        <td><a href="editbook.jsp?bid=<%= rs.getString("bid") %>" class="btn btn-sm btn-primary">Edit</a>
            </td>                    
    </tr>
    <% }
    con.close();
    %> 
    </tbody>
</table>
<jsp:include page="footer.jsp"></jsp:include>