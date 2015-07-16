<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>Error 404 page</title>
<style >


#imagePreview {
    width: 150px;
    height: 150px;
    background-position: center;
    background-size: cover;
    -webkit-box-shadow: 0 0 1px 1px rgba(0, 0, 0, .3);
    display: inline-block;
}
body {
 	-moz-background-size: cover;
	-webkit-background-size: cover;
	background-size: cover;
	background-position: top center !important;
	background-repeat: no-repeat !important;
	background-attachment: fixed; 
} 


h1{
	border: none; 
	box-shadow: none;
	margin: 0; 
	padding: 0;
	font-size: 4.5em; 
	text-shadow: 3px 3px 0 rgba(0, 0, 0, 0.1);
	font-family: 'Dosis-SemiBold';
	font-weight: bold;
}
 

.navbar-header {
    margin-left:5%;
}

.contain{ 
	margin-top: 5%;
}

.navbar-inverse {
	position:absolute;
	background-color: #707070;
	background-image: linear-gradient(to bottom, #707070 0%, #707070 100%); 
	border-color: #C7A5A5;
	height: 72px;
}

.navbar-inverse .navbar-nav > li > a{
	color:#fff;
}


#bgLogout{
	margin-top:2%;
	background-color: #ffffff;
	height: 100%;
	width: 100%;
	padding-top:2%;
	padding-bottom: 2%;
}


.navbar-default{
	background-image: linear-gradient(to bottom, #ffc000 0%, #ffc000 100%); 
}

a{
	color: #fff;
}


.navbar-link-report b{
	width:5px;
	height:5px;
	margin-top:5px;
	padding-left:2px;
	margin-left:5px;
	border:1px solid white; 
	font-family: Dosis-Regular;
	font-size:13px;
	color:#fff;
} 


#Logout {
    position: absolute;
    right: 2%;
    margin-top: 10px;
}

#bgLogout {
     background-color: #ffffff;
     width: 183px;
     height: 25px;
     font-size: 16px;
     text-align: center;
     color: #808080;
}

#profileUser {
     background-color: #ffd800;
     width: 160px;
     height: 200px;
     right: 5px;
}

#userEmpID {
     color: #636666;
     font-family: Dosis-Regular;
}

#linkLogout {
     color: #636666;
     text-decoration: none;
     font-family: Dosis-Regular;
}


/* Tab Setting */
.tab-content {
    background-color: #eeeeee;
    border: 5px solid #eeeeee;
    border-radius: 3px;
}

.nav-tabs > li.active > a, .nav-tabs > li.active > a:hover, .nav-tabs > li.active > a:focus {
    color: #fa9900;
    cursor: pointer;
    background-color: #eeeeee;
    border: 1px solid #dddddd;
    border-bottom-color: transparent;
    border-top: 3px solid #fa9900;
    border-radius: 3px;
}

.nav-tabs > li > a {
    color: #414141;
    cursor: pointer;
    background-color: #eeeeee;
    border: 1px solid #dddddd;
    border-top: 3px solid #414141;
    border-radius: 3px;
}


.nav-tabs > li > a:hover {
    color: #b1b1b1;
    cursor: pointer;
    background-color: #eeeeee;
    border: 1px solid #dddddd;
    border-top: 3px solid #b1b1b1;
    border-radius: 3px;
}

.navbar-defaults .navbar-nav > li > a {
    height: 65px;
    padding-top: 25px;
    padding-left: 20px;
    padding-right: 20px;
    font-family: Dosis-SemiBold;
    font-weight: bold;
    font-size: 18px;
    background-color: #707070;
    color: white;
    
}

.navbar-defaults .navbar-nav > li > a:hover {
    background-color: #ff9900;
    color: white;
}

.navbar-defaults .navbar-nav > li > a:focus {
    background-color: #ff9900;
    color: white;
}


.navbar-defaults {

    border-color: transparent;
}


.navbar-link {
	position:center;
}

.navbar-link img {
	width:40px;
	height:25px;
	border:1px solid white; 
	padding-left:7px;
	padding-right:7px;
	margin-top:5px;
	margin-right:7px;
}

.navbar-link > img:hover {
	background-color: #fff;
    color: white;
}

.navbar-link > img:focus{
    background-color: #fff;
    color: white;
}


.navbar-link > img:visited{
    background-color: #fff;
    color: #292929;        
}

.navbar-link-report b{
	width:75px;
	height:25px;
	margin-top:5px;
	padding-left:3px;
	margin-left:5px;
	border:1px solid white; 
	font-family: Dosis-Regular;
	font-size:16px;
	color:#fff;
}

.navbar-defaults > a:hover > b {
    background-color: #fff;
    color: #292929;        
}

.navbar-defaults > a:focus > b {
       	background-color: #fff;
        color: #292929;       
}



.container{
	margin-left:40px;
	margin-right:40px;
	width: 93%;

}

/* .pull-right{
	padding-right:55px;
} */

/* #randerleft{
    display:table-cell;
    vertical-align: middle;
    height: 450px;
    width: 490px;
} */


p{
	margin-top: 4%;
	/* margin-right:10%; */
	font-family: Dosis-SemiBold;
	font-size: 1.6em;
}


.btn-default{
	background-color: #000;
} 

.btn{
	border-radius:0;
}

/* .btn-lg{
	border-radius:0;
} */

.btn-danger{
	 background-color: #ff0000;
	 /* -moz-box-shadow:    inset 0 0 10px #c01717;
     -webkit-box-shadow: inset 0 0 10px #c01717;
     box-shadow:         inset 0 0 10px #c01717; */
     
    -moz-box-shadow:    inset  0 -15px 15px -15px grey;
    -webkit-box-shadow: inset  0 -15px 15px -15px grey;
     box-shadow:        inset  0 -15px 15px -15px grey;
}

#linkgotohome{
	font-family: Dosis-SemiBold;
	font-size: 1.5em;
}

/* .pull-right{
	padding-right: 2%;
	margin-top: 1%;
	color: #ED7E21;
} */

.footercontain{
	padding-right: 2%;
	margin-top: 1%;
	color: #fff;
}

#home{
	width: 100%;
	height: 100%;
}


.fonthome{
	font-size:  18px;
	text-align: center;
	margin-top: 50%;
}

.linkhome {
  	width: 60px;
  	height: 71px;
}

#home >  li > a:hover {
	background-color: #ff9900;
	color: white;
}

</style>

</head>
<body>




<br/>

  <div class="row-fluid"  style=" margin-top: 150px;margin-bottom: 150px;">	 <!-- style=" margin-top: 100px;margin-bottom: 100px;" -->
	
   <div class="row" style=" margin-right:10px;">
	<div class="col-lg-5 col-md-5">
	          <div id="randerleft" align="center">
	            <img src="${pageContext.request.contextPath}/resources/images/errorimage.png"  style="height:90%;width:75%;margin: auto;">
	         </div>  	         
	</div>
	
	<div class="col-lg-6 col-md-6">
	          <h1>Error! 404</h1>	    
			  <p>The page you are looking for might have been remove,
			  has its name and changed or is
			  temporarily unavailable.</p>
			  
			  <p>Return to the homepage.</p>
			  <div class="gotohome">
				  	<a id="linkgotohome" href="<%=request.getContextPath()%>/listemployee" class="btn btn-danger" role="button">
				  	<span class="glyphicon glyphicon-home" staria-hidden="true" style="margin-left: 2px;">
				  	</span>
				  	Home
				  	</a>    
			  </div>
	</div>
  </div>
	
  </div> 


<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>


