  <%
if(request.getParameter("code")==null){
    response.sendRedirect("index.jsp?code_err=1");
}
else{
    String code = request.getParameter("code");
    %>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
  

<!DOCTYPE HTML>
<html>
<head>
<title>Qn & A Website</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Novus Admin Panel Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
SmartPhone Compatible web template, free WebDesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<!-- font CSS -->
<!-- font-awesome icons -->
 
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
 <!-- js-->
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

 <script src="js/modernizr.custom.js"></script>
<!--webfonts-->
<link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>
<!--//webfonts--> 
<!--animate-->
 <link href="css/animate.css" rel="stylesheet" type="text/css" media="all">
<script src="js/wow.min.js"></script>
	<script>
		 new WOW().init();
	</script>
<!--//end-animate-->
<!-- chart -->
<script src="js/Chart.js"></script>
  
<!-- //chart -->
<!--Calender-->
<link rel="stylesheet" href="css/clndr.css" type="text/css" />
<script src="js/underscore-min.js" type="text/javascript"></script>
<script src= "js/moment-2.2.1.js" type="text/javascript"></script>
<script src="js/clndr.js" type="text/javascript"></script>
<script src="js/site.js" type="text/javascript"></script>
<!--End Calender-->
<!-- Metis Menu -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="js/metisMenu.min.js"></script>
<script src="js/custom.js"></script>
<link href="css/custom.css" rel="stylesheet">
<!--//Metis Menu -->
<style>
    
    pre {
        overflow-x: auto;
        white-space: pre-wrap;
        white-space: -moz-pre-wrap;
        white-space: -pre-wrap;
        white-space: -o-pre-wrap;
        word-wrap: break-word;
        background-color: white;
        font-family: verdana;
      }
</style>
<script>
$(document).ready(function(){
     $(".btn.btn-primary").click(function(){
      var code = $(this).attr("id");
      var msg = $("#d-"+code).val();
       $.post(
         "answered.jsp",{code:code,msg:msg},function(data){
                 if(data.trim()=="login"){
                 $("#myModal").modal();
              }
              else if(data.trim()=="success"){
                  $("#dk").html("<div class='alert alert-success'>Answered Submit</div>");
              }
         }
      );
     });
      $(".fa.fa-caret-up").click(function(){
        var code = $(this).attr("id");
        var v  = $("#count-"+code).text();
        var pr = parseInt(v)+1;
        
          $.post(
             "upvote.jsp",{code:code,pr:pr},function(data){
                   if(data.trim()=="login"){
                   $("#myModal").modal();
               }
               else if(data.trim()=="exist"){
                 $("#pk").modal();
               }
               else if(data.trim()=="success"){
                 $("#count-"+code).html("1");
               }
               else if(data.trim()=="updated"){
                 $("#count-"+code).html("1");
               }
             }
          );
     });
     $(".fa.fa-caret-down").click(function(){
        var code = $(this).attr("rel");
        var v  = $("#count-"+code).text();
        var pr = parseInt(v)-1;
        if(pr>=0){
            $.post(
              "update_upvote.jsp",{code:code,pr:pr},function(data){
                  if(data.trim()=="login"){
                    $("#myModal").modal();
                }
                else if(data.trim()=="exist"){
                  $("#pk").modal();
                }
                else if(data.trim()=="success"){
                  $("#count-"+code).html("0");
                }
              }
           );
         }
     });
 
});
 
    
    
</script>
</head>
<div class="modal" id="pk">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header" style="background-color:green;color:white;">
        <h4 class="modal-title">Alert</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
          <h2>You Have Already Voted</h2>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>   
<body class="cbp-spmenu-push">
	<div class="main-content">
		<!--left-fixed -navigation-->
		<div class=" sidebar" role="navigation">
            <div class="navbar-collapse">
				<nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-left" id="cbp-spmenu-s1">
                                    <%
                                        String email=null ;
                                    Cookie d[] = request.getCookies();
                                    for(int i=0;i<d.length;i++){
                                        if(d[i].getName().equals("login")){
                                            email=d[i].getValue();
                                            break;
                                        }
                                    }
                                    if(email==null && session.getAttribute(email)==null){
                                     }
                                    else{
                                        try{
                                            Class.forName("com.mysql.jdbc.Driver");
                                            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/q&a","root","");
                                            Statement st = cn.createStatement();
                                            ResultSet rs = st.executeQuery("select * from user where email='"+email+"'");
                                            if(rs.next()){
                                                %>
 
                                    <img src="profile/<%=rs.getString("code")%>.jpg" style="width:200px;height: 200px;"class="img-fluid rounded-circle thumbnails">
                                     <p style="color:white;margin-right:10px;"><strong >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a style="text-decoration:none;color:white;" href="user_profile.jsp"><%=rs.getString("name")%></a></strong></p><br><br>
                                     <%
                                            }
                                        }
                                        catch(Exception er){
                                            out.print(er.getMessage());
                                        }
                                    }
                                      %>
                                     
                                     <ul class="nav" id="side-menu">
						<li>
							<a href="index.jsp" class="active"><i class="fa fa-home nav_icon"></i><strong>Home</strong></a>
						</li>
                                                <%
                                                  
                                                    if (email == null && session.getAttribute(email) == null) {
                                                        
                                                    }
                                                    else{
                                                        %>
                                                        <li>
							<a href="Profile.jsp" class="active"><i class="fa fa-question-circle nav_icon"></i><strong>Ask Questions</strong></a>
						</li>
                                                <li>
							<a href="ansQue.jsp"><i class="fa fa-reply-all nav_icon"></i><strong>Answer Questions</strong></a>
						</li>
                                                <li>
							<a href="your_que.jsp"><i class="fa fa-question-circle nav_icon"></i><strong>Your Questions</strong></a>
						</li>
                                                  
                                                <li>
							<a href="logout.jsp"><i class="fa fa-sign-out nav_icon"></i><strong>LogOut</strong></a>
						</li>
                                                        
                                                        <%
                                                    }

    
    
                                                %>
					</ul>
					<!-- //sidebar-collapse -->
				</nav>
			</div>
		</div>
		<!--left-fixed -navigation-->
		<!-- header-starts -->
		<div class="sticky-header header-section ">
			<div class="header-left">
				<!--toggle button start-->
				<button id="showLeftPush"><i class="fa fa-bars"></i></button>
				<!--toggle button end-->
				<!--logo -->
				<div class="logo">
					<a href="index.jsp">
						<h1>Qn & A WebSite</h1>
 					</a>
				</div>
				<!--//logo-->
				<!--search-box-->
				<div class="search-box">
					<form class="input">
						<input class="sb-search-input input__field--madoka" placeholder="Search..." type="search" id="input-31" />
						<label class="input__label" for="input-31">
							<svg class="graphic" width="100%" height="100%" viewBox="0 0 404 77" preserveAspectRatio="none">
								<path d="m0,0l404,0l0,77l-404,0l0,-77z"/>
							</svg>
						</label>
					</form>
				</div><!--//end-search-box-->
				<div class="clearfix"> </div>
			</div>
			<div class="header-right">
				<div class="profile_details_left"><!--notifications of menu start -->
                                    <%
                                    if (email == null && session.getAttribute(email) == null) {
                                        %>
                                    <h2><a style="text-decoration: none;" href="login.jsp"><strong>Login</strong></a></h2>
                                    <%
                                    }
                                    else{
                                       %>
                                    <h2><a style="text-decoration: none;" href="logout.jsp"><strong>Logout</strong></a></h2>
                                    <%  
                                    }
                                    %>
					<div class="clearfix"> </div>
				</div>
				<!--notification menu end -->
				<div class="profile_details">		
                                    <div class="user-name">
                                        
                                     </div>
				</div>
				<div class="clearfix"> </div>				
			</div>
			<div class="clearfix"> </div>	
		</div>
		<!-- //header-ends -->
		<!-- main content start-->
		<div id="page-wrapper">
			<div class="main-page">
                             <div class="container-fluid">
                                <div class="row">
                                    <div class="col-sm-1"></div> 
                                    <div class="col-sm-10 w3-card-4 w3-white ">
                                        <%
                                         try{
                                            Class.forName("com.mysql.jdbc.Driver");
                                            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/q&a","root","");
                                            Statement st = cn.createStatement();
                                            ResultSet rs = st.executeQuery("select * from askquestion where code='"+code+"' AND status=0");
                                            if(rs.next()){
                                                String vot="0";
                                                   Statement sp2=cn.createStatement();
                                                   ResultSet rp2 = sp2.executeQuery("select count(*) from  upvote where qucode='"+rs.getString("code")+"' AND email='"+email+"' AND vote=1");
                                                   
                                                   if(rp2.next()){
                                                       vot = rp2.getString(1);
                                                   }
                                                   String vot1="upvote";
                                                   Statement sp3=cn.createStatement();
                                                   ResultSet rp3 = sp3.executeQuery("select count(*) from  upvote where qucode='"+rs.getString("code")+"' AND email='"+email+"' AND vote=1");
                                                   
                                                   if(rp3.next()){
                                                       vot1 ="upvoted";
                                                   }
                                                
                                                
                                                
                                                 if(email!=null && session.getAttribute(email)!=null){
                                                     
                                                       Statement sp5 = cn.createStatement();
                                                       ResultSet rp5 = sp5.executeQuery("select * from view where email='"+email+"' AND qucode='"+code+"'");
                                                       if(rp5.next()){
                                                           
                                                       }
                                                       else{
                                                                PreparedStatement ps = cn.prepareStatement("insert into view values(?,?)");
                                                                ps.setString(1,email);
                                                                ps.setString(2,code);
                                                                if(ps.executeUpdate()>0){

                                                                }
                                                       }
                                                 }
                                                
                                                
                                                
                                                
                                                
                                                %>
                                                <div class="col-sm-12" style="border-bottom:1px solid"> <h2><strong><%=rs.getString("title")%></strong></h2></div><br><br>
                                                 
                                                <div class="col-sm-12">
                                                    <strong><pre ><%=rs.getString("description")%></pre></strong> 
                                                </div>
                                                 
                                                <div class="col-sm-8">
                                                    <%
                                                     String s = rs.getString("category");
                                                     String p[] = s.split(",");
                                                      for(int i=0;i<p.length;i++){
                                                         %>
                                                         <button><strong><%=p[i]%></strong></button>
                                                         <%
                                                      }
                                                     %>
                                                       
                                                </div>
                                                     <div class="col-sm-4">
                                                         <span><strong>vote</strong></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                         <i style="font-size:40px;cursor:pointer;" class="fa fa-caret-up" aria-hidden="true" id="<%=rs.getString("code")%>"></i>&nbsp;&nbsp;&nbsp;<span id="count-<%=rs.getString("code")%>"><%=vot%></span>&nbsp;&nbsp;&nbsp;<i style="font-size:40px;cursor:pointer;" rel="<%=rs.getString("code")%>" class="fa fa-caret-down" aria-hidden="true"></i>
                                                      </div>
                                                <div class="col-sm-7"></div>
                                                <div class="col-sm-5">
                                                    <%
                                                       Statement sp = cn.createStatement();
                                                       ResultSet rp = sp.executeQuery("select * from user where email='"+rs.getString("email")+"'");
                                                       out.print("<table class='table table-borderless'>");
                                                       if(rp.next()){
                                                             
                                                      %>
                                                      <tr><td><td><strong>Asked</strong>&nbsp;<%=rs.getString("dt")%></td></td></tr>
                                                      <tr><td><img src="profile/<%=rp.getString("code")%>.jpg" style="width:70px;height:70px;"</td><td><%=rp.getString("name")%></td></tr>
                                                    <%
                                                       }
                                                       out.print("</table>");
                                                    %>
                                                
                                                </div>
                                                <div class="col-sm-12" id="dk"></div>
                                                <div class="col-sm-12"><h3><strong>Your Answer</strong></h3></div>
                                                 <textarea class="form-control" id="d-<%=rs.getString("code")%>" style="resize:none" rows="8" Placeholder="Add a comment......" cols="8"></textarea><br>
                                                <button class="btn btn-primary" id="<%=rs.getString("code")%>" >Post Your Answer</button>
                                                 <%
                                            }
                                         }
                                         catch(Exception er){
                                             out.print(er.getMessage());
                                         }
    
                                         %>
                                         <br><br><br><br>
                                    </div><br>
                                                                        <div class="col-sm-1"></div> 

                                     
                                </div>
				<div class="clearfix"> </div>
			</div>
		</div><br><br>
		<!--footer-->
		 <footer class="footer">
            <div class="container-fluid" style="background-color:white;">
                        <div>
	        <center> <h3>Follow Us :  <a href="https://www.facebook.com/profile.php?id=100060203576938" target="_blank"><i class="fa fa-facebook"></i></a> &nbsp;<a href="https://twitter.com/PramodK82377407" target="_blank"><i class="fa fa-twitter"></i></a> &nbsp; <a href="https://www.linkedin.com/in/pramod-kumar-saini-98813b1b4/" target="_blank"><i class="fa fa-linkedin"></i></a>&nbsp; <a href="https://www.instagram.com/pramodkumarsaini12/" target="_blank"><i  class="fa fa-instagram"></i></a></h3></center>
                            
                        </div>
						<div class="row"><div class="col-sm-12" >
          <center><br><a href="#" target="_blank">Terms And Condition</a> &nbsp;<a href="#" target="_blank">Privacy Policy</a></center>
         <center><br><h3>Qn & A © 2022</h3></center><br></div></div>
		        <center> <p >Made with ? By <a   href="https://www.linkedin.com/in/pramod-kumar-saini-98813b1b4/ " target="_blank">Pramod Kumar Saini</a></p></center>

  
  
                    </div>
          </footer> 
        <!--//footer-->
	</div>
	<!-- Classie -->
		<script src="js/classie.js"></script>
		<script>
			var menuLeft = document.getElementById( 'cbp-spmenu-s1' ),
				showLeftPush = document.getElementById( 'showLeftPush' ),
				body = document.body;
				
			showLeftPush.onclick = function() {
				classie.toggle( this, 'active' );
				classie.toggle( body, 'cbp-spmenu-push-toright' );
				classie.toggle( menuLeft, 'cbp-spmenu-open' );
				disableOther( 'showLeftPush' );
			};
			

			function disableOther( button ) {
				if( button !== 'showLeftPush' ) {
					classie.toggle( showLeftPush, 'disabled' );
				}
			}
		</script>
	<!--scrolling js-->
	<script src="js/jquery.nicescroll.js"></script>
	<script src="js/scripts.js"></script>
	<!--//scrolling js-->
	<!-- Bootstrap Core JavaScript -->
   <script src="js/bootstrap.js"> </script>
   <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="background-color:green;color:white;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Login</h4>
        </div>
        <div class="modal-body">
            <form method="post" action="check1.jsp?code=<%=code%>">
            <label>Email:</label><input type="email" name="email" class="form-control"><br>
            <label>Password:</label><input type="password" name="pass" class="form-control"><br>
            <input type="submit" value="Login" class="btn btn-success">
            </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
            
         
            
            
            
    </div>
  </div>
</body>
</html>
<%
}
%>