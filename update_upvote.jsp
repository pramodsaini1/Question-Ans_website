<%-- 
    Document   : update_upvote
    Created on : 29 Apr, 2022, 3:34:31 PM
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
    out.print("login");
}
else{
    try{
       Class.forName("com.mysql.jdbc.Driver");
       Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/q&a","root","");
       Statement st = cn.createStatement();
       ResultSet rs = st.executeQuery("select * from user where email='"+email+"'");
       if(rs.next()){
           if(request.getParameter("code")!=null && request.getParameter("pr")!=null){
               String code = request.getParameter("code");
               int pr  = Integer.parseInt(request.getParameter("pr"));
                Statement st1 = cn.createStatement();
               ResultSet rs1 = st1.executeQuery("select * from upvote where email='"+email+"' AND qucode='"+code+"' AND vote=0");
               if(rs1.next()){
                   out.print("exist");
               }
               else{
                   PreparedStatement ps = cn.prepareStatement("update upvote set vote=? where email=? AND qucode=?");
                   ps.setInt(1,pr);
                   ps.setString(2,email);
                   ps.setString(3,code);
                   if(ps.executeUpdate()>0){
                       out.print("success");
                   }
               }
                
                
           }
       }
    }
    catch(Exception er){
        out.print(er.getMessage());
    }
}



%> 
 
