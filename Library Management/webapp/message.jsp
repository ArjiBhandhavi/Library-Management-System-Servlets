<%
    if (session.getAttribute("msg") != null) {
%>
<div class="alert alert-success text-center mt-2">
    <strong><%= session.getAttribute("msg")%></strong>
</div>
<%
        session.removeAttribute("msg");
    }
%>
<%
    if (session.getAttribute("error") != null) {
%>
<div class="alert alert-danger text-center mt-2">
    <strong><%= session.getAttribute("error")%></strong>
</div>
<%
        session.removeAttribute("error");
    }
%>