<%-- 
    Document   : changeUploadProcess
    Created on : 2 May, 2022, 6:17:53 PM
    Author     : Genius
--%>

<%@page contentType="text/html" import="java.sql.*,java.io.*" pageEncoding="UTF-8"%>
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
        Statement st  = cn.createStatement();
        ResultSet rs  = st.executeQuery("select * from user where email='"+email+"'");
        if(rs.next()){
            if(request.getParameter("code")==null){
                response.sendRedirect("user_edit.jsp?code_err=1");
            }
            else{
                String code = request.getParameter("code");
                String contentType = request.getContentType();

        String imageSave=null;
        byte dataBytes[]=null;
        String saveFile=null;
        if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0))
        {
        DataInputStream in = new DataInputStream(request.getInputStream());
        int formDataLength = request.getContentLength();
        dataBytes = new byte[formDataLength];
        int byteRead = 0;
        int totalBytesRead = 0;
        while (totalBytesRead < formDataLength)
        {
        byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
        totalBytesRead += byteRead;
        }
         /*String code="";
        try{
            ....
            ...
            ....
        ResultSet rs=st.executeQuery("select code from table_name where email='"+email+"'");
        if(rs.next()){
            code=rs.getString(1);
        }

        } 
        catch(Exception er){

        }*/
        String file = new String(dataBytes);
        /*saveFile = file.substring(file.indexOf("filename=\"") + 10);
        saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
        saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));*/
         saveFile = code+".jpg";
        // out.print(dataBytes);
        int lastIndex = contentType.lastIndexOf("=");
        String boundary = contentType.substring(lastIndex + 1, contentType.length());
        // out.println(boundary);
        int pos;
        pos = file.indexOf("filename=\"");
        pos = file.indexOf("\n", pos) + 1;
        pos = file.indexOf("\n", pos) + 1;
        pos = file.indexOf("\n", pos) + 1;
        int boundaryLocation = file.indexOf(boundary, pos) - 4;
        int startPos = ((file.substring(0, pos)).getBytes()).length;
        int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
        try
        {
        FileOutputStream fileOut = new FileOutputStream(request.getRealPath("/")+"/profile/"+saveFile);


        // fileOut.write(dataBytes);
        fileOut.write(dataBytes, startPos, (endPos - startPos));
        fileOut.flush();
        fileOut.close();
        response.sendRedirect("user_edit.jsp?img_success=1");
        }catch (Exception e)
        {

        response.sendRedirect("user_edit.jsp?img_err=1");
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