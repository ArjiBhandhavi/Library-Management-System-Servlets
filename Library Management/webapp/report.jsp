<%@page import="java.time.LocalDate"%>
<%@page import="library.DbConfig"%>
<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include flush="true" page="header.jsp"/>
<h4 class="text-center mb-2 border-bottom pb-2">Library Report</h4>
<jsp:include page="message.jsp" />
<table class="table table-bordered table-fixed">
    <thead class="table-dark">
    <tr style="position:sticky;top:0;">
    	<th>Date</th>
        <th>Book ID</th>        
        <th>Book Name </th>
        <th>Author</th>
        <th>Student Id</th>
        <th>Student Name</th>
        <th>Issue/Return</th>
    </tr>
    </thead>
    <tbody style="overflow: scroll">
    <%
        Connection con = DbConfig.connect();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT t.*,b.bname,b.author,s.name FROM btrans t join books b on b.bid=t.bid join students s on s.id=t.stdid order by t.id desc");
        while (rs.next()) {
    %>
    
    <tr>        
    	<td><%= DbConfig.formatDate(rs.getString("trandate"))%></td>            
        <td><%= rs.getString("bid")%></td>
        <td><%= rs.getString("bname")%></td>
        <td><%= rs.getString("author")%></td>
        <td><%= rs.getString("stdid")%></td>
        <td><%= rs.getString("name")%></td>
        <td><%= rs.getBoolean("breturn") ? "Return" :"Issue" %></td>
    </tr>
    <% }
    con.close();
    %> 
    </tbody>
</table>
<jsp:include page="footer.jsp"></jsp:include>