<%-- 
    Document   : your_que_update
    Created on : 26 Apr, 2022, 11:13:41 AM
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
             if(request.getParameter("code")!=null && request.getParameter("msg")!=null && request.getParameter("msg1")!=null){
                 String code = request.getParameter("code");
                String msg  = request.getParameter("msg");
                String msg1  = request.getParameter("msg1");
                
                PreparedStatement ps = cn.prepareStatement("update askquestion set title=?,description=? where email=? AND code=? AND status=0");
                ps.setString(1,msg);
                ps.setString(2,msg1);
                ps.setString(3,email);
                ps.setString(4,code);
                
                if(ps.executeUpdate()>0){
                     out.print("success");
                }
            }
        }
    }
    catch(Exception er){
        out.print(er.getMessage());
    }
}
    
    
    
%>
