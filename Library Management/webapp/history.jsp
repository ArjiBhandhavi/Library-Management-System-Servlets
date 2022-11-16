<%@page import="java.time.LocalDate"%>
<%@page import="library.DbConfig"%>
<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include flush="true" page="header.jsp"/>
<h4 class="text-center mb-2 border-bottom pb-2">Books History</h4>
<jsp:include page="message.jsp" />
<table class="table table-bordered table-fixed">
    <thead class="table-dark">
    <tr style="position:sticky;top:0;">
    	<th>Id</th>
    	<th>Date</th>
        <th>Book ID</th>        
        <th>Book Name </th>
        <th>Author</th>
        <th>Price</th>
        <th>Return/Issue</th>
    </tr>
    </thead>
    <tbody style="overflow: scroll">
    <%
        Connection con = DbConfig.connect();
        Statement st = con.createStatement();
        final String sql="select t.*,b.bname,b.author,b.price from btrans t join books b on t.bid=b.bid "+
        		"where stdid="+session.getAttribute("id")+" order by id desc";
        ResultSet rs = st.executeQuery(sql);
        while (rs.next()) {
    %>
    <tr>        
    <td><%= rs.getString("id") %></td>
    	<td><%= DbConfig.formatDate(rs.getString("trandate"))%></td>            
        <td><%= rs.getString("bid")%></td>
        <td><%= rs.getString("bname")%></td>
        <td><%= rs.getString("author")%></td>
        <td>&#8377; <%= rs.getString("price")%></td>
        <td><%
        if(rs.getBoolean("breturn") && rs.getBoolean("issue")) { %>
        Issue
        <%}else if(rs.getBoolean("breturn")) { %>
        Return
        <% } else { %>
        Issue
        <%} %>
        </td>
    </tr>
    <% }
    con.close();
    %> 
    </tbody>
</table>
<jsp:include page="footer.jsp"></jsp:include>