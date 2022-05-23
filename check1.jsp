<%-- 
    Document   : check1
    Created on : 27 Apr, 2022, 11:51:51 PM
    Author     : Genius
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>

<%
if(request.getParameter("code")==null){
    response.sendRedirect("index.jsp?code_err=1");
}
else{
    String code = request.getParameter("code");
                if(request.getParameter("email").length()==0||request.getParameter("pass").length()==0){
                response.sendRedirect("index.jsp?empty=1");
               }
              else{
                String email = request.getParameter("email");
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
                            session.setMaxInactiveInterval(3500);
                            response.sendRedirect("Question.jsp?code="+code+"");
                        }
                        else{
                            response.sendRedirect("index.jsp?invalid_pass=1");
                        }
                    }
                    else{
                        response.sendRedirect("index.jsp?invalid_email=1");
                    }
                }
                catch(Exception er){
                    out.print(er.getMessage());
                }
            }
}
%>

