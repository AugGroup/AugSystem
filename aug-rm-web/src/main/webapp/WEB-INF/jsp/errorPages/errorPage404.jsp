<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.springframework.security.core.userdetails.User"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title></title>

<script
	src='<c:url value ="/static/resources/js/jquery-1.11.3.min.js" />'></script>
<script src='<c:url value ="/static/resources/js/bootstrap.min.js"/>'></script>

<link rel="stylesheet" type="text/css" media="all"
	href="<c:url value ='/static/resources/css/bootstrap.min.css'/>"></link>
<link rel="stylesheet" type="text/css" media="all"
	href="<c:url value ="/static/resources/css/bootstrap-theme.min.css"/>" />

</head>
<style>
.error {
	color: #ff0000;
}
#imagePreview{
    width: 150px;
    height: 188px;
    background-position: center;
    background-size: cover;
    -webkit-box-shadow: 0 0 1px 1px rgba(0, 0, 0, .3);
    display: inline-block;
}

.user{
	width: 183px;
	height: 25px;
	font-size: 16px;
	font-family: "SemiBold";
  	margin-right: 95px;
 	float: right;
}

.user2{
	width: 183px;
	height: 25px;
	font-size: 16px;
	font-family: "Regular";
	font-weight: bold;

	margin-right: 95px;
}

header{
	background: #707070;
	height: 65px;
}

a{color:white;}
#footer{background:#FFCC00;
		margin-bottom: }

.body{background:#E0DFDD;
}
#form{
	height: 600px;
}
</style>

<header>
<img src="${pageContext.request.contextPath}/static/decorators/augmentis-logo-hires.png" alt="logo" style="width: 250px; height: 75px;"/>
		<a href="${pageContext.request.contextPath}/applicant"><span class="glyphicon glyphicon-home"></span></a>
		<a href="${pageContext.request.contextPath}/request">Request</a>		
		<a href="${pageContext.request.contextPath}/approve">Approve</a>

		 <div class="user">
			<a href=""><span class="glyphicon glyphicon-user"></span> </a>
			<a href="<c:url value="/logout"/>"><span class="glyphicon glyphicon-log-out"></span>></a>
			<div class="user2">
				<a href="${request.getRequestURL}?locale=en">
				<img src="${pageContext.request.contextPath}/static/decorators/eng_flag.png" alt="logo" class="img-flag" style="width: 30px; height: 20px;"/></a>
				<a href="${request.getRequestURL}?locale=th">		
				<img src="${pageContext.request.contextPath}/static/decorators/thai_flag.jpg" alt="logo" class="img-flag" style="width: 30px; height: 20px;" /></a>
				<div class="btn-group">
  					<button type="button" class="btn btn-sm btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="width: 75px; height: 25px;">
    					Report <span class="caret"></span>
  					</button>
  				<ul class="dropdown-menu">
    				<li><a href="${pageContext.request.contextPath}/report">Report</a></li>
    				<li><a href="${pageContext.request.contextPath}/monthlyReport">monthlyReport</a></li>
 				 </ul>
				</div>
			</div>
		</div> 
	</header>
	<section id="form">
	<f:form action="${pageContext.request.contextPath}/applicant" method="post">

		<h1>Ops! Something went wrong 404</h1><br><br><br>
		<h4><b>Resource Not Found Error Occured, please contact support.</b></h4>
		<button type="submit" class="btn btn-lg btn-default"><span
			class="glyphicon glyphicon-home"></span> Home</button>
	
	</f:form>
	
	</section>


<div id="footer">
		<div class="text">
				<div class="container">
					<p class="text-muted credit">Copyright &copy; <a href="http://www.augmentis.biz/"> augmentis.biz</a></p>
				</div>
		</div>
	</div>
</html>