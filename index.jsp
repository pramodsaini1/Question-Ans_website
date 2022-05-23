<%-- 
    Document   : index
    Created on : 23 Apr, 2022, 3:47:26 PM
    Author     : Genius
--%>

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
<script>
$(document).ready(function(){
  $(".c2").click(function(){
    $.post(
       "new_question.jsp",{0:0},function(data){
          $("#new").html(data); 
       }
    );
  
  });
   $(".c3").click(function(){
     $.post(
       "oldest_question.jsp",{0:0},function(data){
          $("#new").html(data); 
       }
    );
  
  });
 
});
    
</script>
</head> 
<body class="cbp-spmenu-push">
	<div class="main-content">
		<!--left-fixed -navigation-->
		<div class=" sidebar" role="navigation">
            <div class="navbar-collapse">
				<nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-left" id="cbp-spmenu-s1">
					<ul class="nav" id="side-menu">
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
                                <div class="row w3-card w3-white  "  >
                                    <div class="col-sm-12  "><h2><strong>Top Questions</strong></h2><br>
                                        <div class="col-sm-9"></div>
                                        <div class="col-sm-3">
                                        <div class="btn-group">
                                            <button class="btn btn-success c1">Intersting</button> 
                                            <button  class="btn btn-success c2">Newest</button> 
                                            <button  class="btn btn-success c3">Oldest</button> 
                                        </div><br>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 " style="margin-top:10px;" id="new">
                                        <%
                                           try{
                                               Class.forName("com.mysql.jdbc.Driver");
                                               Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/q&a","root","");
                                               Statement st  = cn.createStatement();
                                               ResultSet rs  = st.executeQuery("select * from askquestion where status=0");
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
                                        <br>
                                    </div>
                                    
                                </div>
                                
                                
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
</body>
</html>