<%-- 
    Document   : your_que
    Created on : 26 Apr, 2022, 10:03:30 AM
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
    response.sendRedirect("login.jsp");
}
else{
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/q&a","root","");
        Statement st  = cn.createStatement();
        ResultSet rs = st.executeQuery("select * from user where email='"+email+"'");
        if(rs.next()){
            %>
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
<style>
    
    pre {
        overflow-x: auto;
        white-space: pre-wrap;
        white-space: -moz-pre-wrap;
        white-space: -pre-wrap;
        white-space: -o-pre-wrap;
        word-wrap: break-word;
        background-color:solid wheat;
        font-family: verdana;
      }
</style>
<script>
    $(document).ready(function(){
       $(".fa.fa-trash-o").click(function(){
          var code = $(this).attr("rel");
          $.post(
             "your_que_delete.jsp",{code:code},function(data){
                 if(data.trim()=="success"){
                    $("#r"+code).fadeOut(1000);
                 }
             }
          );
       
       });
        
        
    });
    $(document).on("click",".fa.fa-edit",function(){
       var code = $(this).attr("id");
       var msg  = $("#d"+code).text();
       var msg1 = $("#pk-"+code).text();
         $("#d"+code).html("<input type='text' class='form-control' value='"+msg+"' id='f"+code+"'>");
       $("#pk-"+code).html("<textarea class='form-control' style='resize:none' row='3' cols='3' id='dk"+code+"'>"+msg1+"</textarea>");
       $(this).attr("class","fa fa-save");
       $(this).css("color","blue");
    
    });
    $(document).on("click",".fa.fa-save",function(){
      var code = $(this).attr("id");
      var msg = $("#f"+code).val();
      var msg1 = $("#dk"+code).val();
          $.post(
             "your_que_update.jsp",{code:code,msg:msg,msg1:msg1},function(data){
               if(data.trim()=="success"){
                $("#d"+code).html("<strong>"+msg+"</strong>");
                $("#pk-"+code).html("<pre>"+msg1+"</pre>");
                $("#"+code).attr("class","fa fa-edit");
                $(this).css("color","blue");
           }
        
        }
      );
      
    
    });
</script>



<!--End Calender-->
<!-- Metis Menu -->
 <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<script src="js/metisMenu.min.js"></script>
<script src="js/custom.js"></script>
<link href="css/custom.css" rel="stylesheet">
<!--//Metis Menu -->
</head> 
<body class="cbp-spmenu-push">
	<div class="main-content">
		<!--left-fixed -navigation-->
		<div class=" sidebar" role="navigation">
            <div class="navbar-collapse">
				<nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-left" id="cbp-spmenu-s1">
                                     <img src="profile/<%=rs.getString("code")%>.jpg" style="width:200px;height: 200px;"class="img-fluid rounded-circle thumbnails">
                                     <p style="color:white;margin-right:10px;"><strong >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a style="text-decoration:none;color:white;" href="user_profile.jsp"><%=rs.getString("name")%></a></strong></p><br><br>
					<ul class="nav" id="side-menu">
 						 
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
					<a href="index.html">
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
					<ul class="nofitications-dropdown">
						   
					</ul>
					<div class="clearfix"> </div>
				</div>
				<!--notification menu end -->
				<div class="profile_details">		
					<ul>
						<li class="dropdown profile_details_drop">
                                                    <div class="profile_img">	
 			            <div class="user-name">
                                <%
                                                                             if(email==null){
                                                                            %>
										<p style="margin-right:200px;" ><a href="login.jsp"> Login</a></p>
                                                                                
                                                                                <%
                                                                             }
                                                                             else{
                                                                                 %>
                                                                                 <p style="margin-right:200px;"><a href="logout.jsp">Logout</a></p>
                                                                                 <%
                                                                             }
                                                                                 %> 
                                    </div>
                                </div>
 								<div class="profile_img">	
 									<div class="user-name">
                                                                             
									</div>
									 
								</div>	
							</a>
							 
						</li>
					</ul>
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
                                     
                                    <div class="col-sm-12 w3-card w3-white">
                                         
                                        <div class="col-sm-12" ><strong><center><h2>Your Questions</h2></center></strong></div><br><br><br><br>
                                        <h4><center><strong>Your All Questions Are Shown Here. You can Optimized All Of Them.</strong></center></h4><br><br><br>
                                         
                                        <div class="col-sm-12" ><strong><center><h2 style="color:brown;">Optimized Your Questions</h2></center></strong></div><br><br><br><br>
                                        
                                        <%
                                           Statement st1 = cn.createStatement();
                                           ResultSet rs1 = st1.executeQuery("select * from askquestion where email='"+email+"' AND status=0");
                                             while(rs1.next()){
                                                 String ans="";
                                                   Statement sp2=cn.createStatement();
                                                   ResultSet rp2 = sp2.executeQuery("select count(*) from  ansquestoin where quecode='"+rs1.getString("code")+"' AND status=0");
                                                   while(rp2.next()){
                                                       ans = rp2.getString(1);
                                                   }
                                                   String vie="";
                                                   Statement sp3=cn.createStatement();
                                                   ResultSet rp3 = sp3.executeQuery("select count(*) from  view where qucode='"+rs1.getString("code")+"'");
                                                   while(rp3.next()){
                                                       vie = rp3.getString(1);
                                                   }
                                                   String vot="";
                                                   Statement sp4=cn.createStatement();
                                                   ResultSet rp4 = sp4.executeQuery("select count(*) from  upvote where qucode='"+rs1.getString("code")+"'");
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
                                                           <strong><a style="text-decoration:none" id="d<%=rs1.getString("code")%>"><%=rs1.getString("title")%></a></strong><br>
                                                           <pre id="pk-<%=rs1.getString("code")%>"><%=rs1.getString("description")%></pre>
                                                       </div>
                                                       <div class="col-sm-2">
                                                           <table class="table table-borderless">
                                                               <tr>
                                                                   <td><i style="float:right; font-size:25px;cursor:pointer;color:blue" id="<%=rs1.getString("code")%>" class="fa fa-edit"></i></td>
                                                                  <td><i style="float:right;font-size:25px;cursor:pointer;color:red" rel="<%=rs1.getString("code")%>" class="fa fa-trash-o"></i></td>
                                                                </tr>
                                                           </table>
                                                       </div>
                                               
                                               <%
                                           }
                                                                              
                                                                             
                                        %>
                                        
                                     </div>
                                </div><br><br>
                                         
				<div class="clearfix"> </div>
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
         <center><br><h3>Qn & A ?? 2022</h3></center><br></div></div>
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
            
            <%
        }
    }
    catch(Exception er){
        out.print(er.getMessage());
    }
}




%> 