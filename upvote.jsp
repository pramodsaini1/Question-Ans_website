<%-- 
    Document   : upvote
    Created on : 29 Apr, 2022, 12:06:43 PM
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
               int vot=0;
                Statement sp = cn.createStatement();
                ResultSet rp = sp.executeQuery("select * from upvote where email='"+email+"' AND qucode='"+code+"'");
                if(rp.next()){
                    vot=rp.getInt("vote");
                }
               
               Statement st1 = cn.createStatement();
               ResultSet rs1 = st1.executeQuery("select * from upvote where email='"+email+"' AND qucode='"+code+"'AND vote=1");
               if(rs1.next()){
                   out.print("exist");
               }
                
               else{
                   PreparedStatement ps = cn.prepareStatement("insert into upvote values(?,?,?)");
                   ps.setString(1,email);
                   ps.setString(2,code);
                   ps.setInt(3,pr);
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
