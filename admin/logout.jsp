<%-- 
    Document   : logout
    Created on : 25 Apr, 2022, 9:06:40 AM
    Author     : Genius
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
Cookie c = new Cookie("login","");
 c.setMaxAge(0);
 response.addCookie(c);
 response.sendRedirect("index.jsp");
    
    
    
    
%>
