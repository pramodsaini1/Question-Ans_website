<%-- 
    Document   : update_user
    Created on : 3 May, 2022, 9:49:30 AM
    Author     : Genius
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
String email=null ;
Cookie c[] = request.getCookies();
for(int i=0;i<c.length;i++){
    if(c[i].getName().equals("login")){
        email=c[i].getValue();
        break;
    }
}
if(email==null && session.getAttribute(email)==null){
    response.sendRedirect("login.jsp");
}
else{
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/q&a","root","");
        Statement  st = cn.createStatement();
        ResultSet  rs = st.executeQuery("select * from user where email='"+email+"'");
        if(rs.next()){
            if(request.getParameter("user").length()==0 || request.getParameter("phone").length()==0){
                response.sendRedirect("user_edit.jsp?empty=1");
            }
            else{
                String name = request.getParameter("user");
                String phone = request.getParameter("phone");
                
                PreparedStatement ps = cn.prepareStatement("update user set name=? ,phone=? where email=?");
                ps.setString(1,name);
                ps.setString(2,phone);
                ps.setString(3,email);
                
                if(ps.executeUpdate()>0){
                    response.sendRedirect("user_profile.jsp?updated=1");
                }
                else{
                    response.sendRedirect("user_profile.jsp?again=1");
                }
            }
        }
    }
    catch(Exception er){
        out.print(er.getMessage());
    }
}




%> 