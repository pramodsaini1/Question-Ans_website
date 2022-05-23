<%-- 
    Document   : oldest_question
    Created on : 1 May, 2022, 10:26:16 AM
    Author     : Genius
--%>
<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
                                           try{
                                               Class.forName("com.mysql.jdbc.Driver");
                                               Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/q&a","root","");
                                               Statement st  = cn.createStatement();
                                               ResultSet rs  = st.executeQuery("select * from askquestion where status=0 order by sn ASC");
                                               while(rs.next()){
                                                   String ans="";
                                                   Statement sp2=cn.createStatement();
                                                   ResultSet rp2 = sp2.executeQuery("select count(*) from  ansquestoin where quecode='"+rs.getString("code")+"' AND status=0");
                                                   while(rp2.next()){
                                                       ans = rp2.getString(1);
                                                   }
                                                   String vie="";
                                                   Statement sp3=cn.createStatement();
                                                   ResultSet rp3 = sp3.executeQuery("select count(*) from  view where qucode='"+rs.getString("code")+"'");
                                                   while(rp3.next()){
                                                       vie = rp3.getString(1);
                                                   }
                                                   String vot="";
                                                   Statement sp4=cn.createStatement();
                                                   ResultSet rp4 = sp4.executeQuery("select count(*) from  upvote where qucode='"+rs.getString("code")+"'");
                                                   while(rp4.next()){
                                                       vot = rp4.getString(1);
                                                   }
                                                  
                                                   %>
                                                   
                                                   <div class="col-sm-12" style="border-bottom:1px solid wheat;border-top:1px solid wheat;">
                                                       <div class="col-sm-1">
                                                           <table class="table table-borderless">
                                                               <tr><td><span><%=vot%></span>&nbsp;votes</td></tr>
                                                               <tr><td><span><%=ans%></span>&nbsp;answer</td></tr>
                                                               <tr><td><span><%=vie%></span>&nbsp;view</td></tr>
                                                           </table>
                                                       </div>
                                                       <div class="col-sm-9">
                                                           <strong><a style="text-decoration:none" href="Question.jsp?code=<%=rs.getString("code")%>"><%=rs.getString("title")%></a></strong>
                                                       </div>
                                                       <div class="col-sm-2">
                                                           <%
                                                            Statement st1 = cn.createStatement();
                                                            ResultSet rs1 = st1.executeQuery("select * from user where email='"+rs.getString("email")+"'");
                                                            out.print("<table class='table table-borderless'>");
                                                            if(rs1.next()){
                                                             
                                                             %>
                                                             
                                                              
                                                               <tr >
                                                                   <td ><img src="profile/<%=rs1.getString("code")%>.jpg"  style="width:50px;height:50px;"></td>
                                                                   <td><%=rs1.getString("name")%></td>
                                                                    
                                                               </tr>
                                                               <tfoot><strong>Asked</strong>&nbsp;&nbsp;<%=rs.getString("dt")%></tfoot>
                                                           
                                                           <%
                                                            }
                                                            out.print(" </table>");
                                                            %>
                                       
                                                       </div>
                                                        <div class="col-sm-5">
                                                    <%
                                                     String s = rs.getString("category");
                                                     String p[] = s.split(",");
                                                      for(int i=0;i<p.length;i++){
                                                         %>
                                                         <button><%=p[i]%></button>
                                                         <%
                                                      }
                                                     %>
                                                       
                                                </div>
                                                   </div><br>
                                                    <%
                                               }
                                           } 
                                           catch(Exception er){
                                               out.print(er.getMessage());
                                           }
                                        
                                        
                                        %>
