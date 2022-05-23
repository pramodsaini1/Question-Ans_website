<%-- 
    Document   : Registration
    Created on : 25 Apr, 2022, 9:50:18 AM
    Author     : Genius
--%>

<%@page contentType="text/html" import="java.sql.*,java.util.*" pageEncoding="UTF-8"%>
<%
if(request.getParameter("user").length()==0||request.getParameter("email").length()==0||request.getParameter("phone").length()==0||request.getParameter("pass").length()==0||request.getParameter("interst").length()==0){
    response.sendRedirect("Register.jsp?empty=1");
}
else{
    String name = request.getParameter("user");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String pass  = request.getParameter("pass");
    String interst="";
    String ptr="";
    String s[] = request.getParameterValues("interst");
         for(int i=0;i<s.length;i++){
             interst  = interst + ptr + s[i];
             ptr=",";
             
         } 
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/q&a","root","");
        Statement st = cn.createStatement();
        
        int sn=0;
        String code="";
        
        ResultSet rs = st.executeQuery("select MAX(sn) from user");
        if(rs.next()){
            sn =rs.getInt(1);
        }
        sn = sn+1;
        
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
        int warn=0;
        PreparedStatement ps = cn.prepareStatement("insert into user values(?,?,?,?,?,?,?,?,?)");
        ps.setInt(1,sn);
        ps.setString(2,code);
        ps.setString(3,name);
        ps.setString(4,email);
        ps.setString(5,phone);
        ps.setString(6,pass);
        ps.setString(7,interst);
        ps.setInt(8,warn);
        ps.setInt(9,status);
        
        if(ps.executeUpdate()>0){
            response.sendRedirect("user_image.jsp?code="+code+"&success=1");
        }
        else{
            response.sendRedirect("Register.jsp?again=1");
        }
        
        
    }
    catch(Exception er){
        out.print(er.getMessage());
    }
}




%> 
