<%-- 
    Document   : check
    Created on : 25 Apr, 2022, 6:19:57 PM
    Author     : Genius
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
if(request.getParameter("email").length()==0||request.getParameter("pass").length()==0){
    response.sendRedirect("login.jsp?empty=1");
}
else{
    String email=request.getParameter("email");
    String pass = request.getParameter("pass");
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/q&a","root","");
        Statement st = cn.createStatement();
        ResultSet rs = st.executeQuery("select * from user where email='"+email+"'");
        if(rs.next()){
            if(rs.getString("password").equals(pass)){
                Cookie c = new Cookie("login",email);
                c.setMaxAge(3600);
                response.addCookie(c);
                session.setAttribute(email, pass);
                session.setMaxInactiveInterval(3600);
                response.sendRedirect("Profile.jsp");
                
                
            }
            else{
                response.sendRedirect("login.jsp?invalid_password=1");
            }
        }
        else{
            response.sendRedirect("login.jsp?invalid_email=1");
        }
    }
    catch(Exception er){
        out.print(er.getMessage());
    }
}






%> 