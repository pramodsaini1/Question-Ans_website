<%-- 
    Document   : warn
    Created on : 20 May, 2022, 11:48:14 PM
    Author     : Genius
--%>

<%@page contentType="text/html"import="java.sql.*" pageEncoding="UTF-8"%>
<%
String email=null;
Cookie c[] = request.getCookies();
for(int i=0;i<c.length;i++){
    if(c[i].getName().equals("login")){
        email=c[i].getValue();
        break;
    }
}
if(email==null && session.getAttribute(email)==null){
    response.sendRedirect("index.jsp");
}
else{
     try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/q&a","root","");
        Statement st = cn.createStatement();
        ResultSet rs = st.executeQuery("select * from login");
        if(rs.next()){
             if(request.getParameter("p")!=null && request.getParameter("code")!=null){
                int p = Integer.parseInt(request.getParameter("p"));
                String code = request.getParameter("code");
                PreparedStatement ps = cn.prepareStatement("update user set warning=? where code=?");
                ps.setInt(1,p);
                 ps.setString(2,code);
                
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
