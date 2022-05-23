<%-- 
    Document   : answered
    Created on : 27 Apr, 2022, 10:25:09 PM
    Author     : Genius
--%>

<%@page contentType="text/html" import="java.sql.*,java.util.*" pageEncoding="UTF-8"%>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%
String email=null ;
Cookie c[] = request.getCookies();
for(int i=0;i<c.length;i++){
    if(c[i].getName().equals("login")){
        email = c[i].getValue();
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
        ResultSet rs = st.executeQuery("Select * from user where email='"+email+"'");
        if(rs.next()){
            if(request.getParameter("code")!=null && request.getParameter("msg")!=null){
                String qcode = request.getParameter("code");
                String msg  = request.getParameter("msg");
                
                int sn=0;
                String code="";
                
                Statement st1 = cn.createStatement();
                ResultSet rs1 = st1.executeQuery("select MAX(sn) from ansquestoin");
                if(rs1.next()){
                    sn=rs1.getInt(1);
                }
                sn=sn+1;
                
                LinkedList l = new LinkedList();
                for(char p='A';p<='Z';p++){
                    l.add(p+"");
                }
                for(char p='a';p<='z';p++){
                    l.add(p+"");
                }
                for(char p='0';p<='9';p++){
                    l.add(p+"");
                }
                Collections.shuffle(l);
                for(int i=0;i<=6;i++){
                    code = code+l.get(i);
                }
                code = code+"_"+sn;
                int status=0;
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    String date = sdf.format(new Date());
                PreparedStatement ps = cn.prepareStatement("insert into ansquestoin values(?,?,?,?,?,?,?)");
                ps.setInt(1,sn);
                ps.setString(2,code);
                ps.setString(3,email);
                ps.setString(4,msg);
                ps.setString(5,qcode);
                ps.setString(6,date);
                ps.setInt(7,status);
                
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