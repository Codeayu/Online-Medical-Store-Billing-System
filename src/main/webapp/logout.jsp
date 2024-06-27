<%@ page import="javax.servlet.http.HttpSession" %>
<%
session = request.getSession();
session.invalidate();
response.sendRedirect("index.html");
%>