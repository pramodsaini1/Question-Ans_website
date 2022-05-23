<%-- 
    Document   : logout
    Created on : 25 Apr, 2022, 6:47:02 PM
    Author     : Genius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
Cookie c = new Cookie("login","");
 c.setMaxAge(0);
 response.addCookie(c);
 response.sendRedirect("login.jsp");
    
    
    
    
%>
