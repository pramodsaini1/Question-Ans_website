<%-- 
    Document   : delete_category
    Created on : 24 Apr, 2022, 1:15:11 PM
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
if(email!=null && session.getAttribute(email)!=null){
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/q&a","root","");
        Statement st  = cn.createStatement();
        ResultSet rs  = st.executeQuery("select * from login where email='"+email+"'");
        if(rs.next()){
            if(request.getParameter("code")!=null){
                String code = request.getParameter("code");
                int status=1;
                PreparedStatement ps = cn.prepareStatement("update category set status=? where email=? AND code=?");
                ps.setInt(1,status);
                ps.setString(2,email);
                ps.setString(3,code);
                
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