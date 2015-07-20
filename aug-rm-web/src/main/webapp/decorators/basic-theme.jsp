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

<script src='<c:url value ="/static/resources/js/jquery-1.11.3.min.js" />'></script>
<script src='<c:url value ="/static/resources/js/bootstrap.min.js"/>'></script>

<link rel="stylesheet" type="text/css" media="all"
	href="<c:url value ='/static/resources/css/bootstrap.min.css'/>"></link>
<link rel="stylesheet" type="text/css" media="all"
	href="<c:url value ="/static/resources/css/bootstrap-theme.min.css"/>" />

<script
	src='<c:url value ="/static/resources/js/bootstrap-datepicker.min.js"/>'></script>
<link rel="stylesheet" type="text/css" media="all"
	href="<c:url value ="/static/resources/css/bootstrap-datepicker3.min.css"/>" />

<script
	src='<c:url value ="/static/resources/js/jquery.dataTables.min.js"/>'></script>
<link rel="stylesheet" type="text/css" media="all"
	href="<c:url value ="/static/resources/css/jquery.dataTables.min.css"/>" />
	
<script
	src='<c:url value ="/static/resources/js/jquery.bootstrap.wizard.js"/>'></script>
<script
	src='<c:url value ="/static/resources/js/jquery.bootstrap.wizard.min.js"/>'></script>


<script src='<c:url value ="/static/resources/js/pnotify.custom.min.js"/>'></script>
<link rel="stylesheet" type="text/css" media="all"
	href="<c:url value ="/static/resources/css/pnotify.custom.min.css"/>" />

<script src='<c:url value ="/static/resources/js/jquery.validate.min.js"/>'></script>
<script src='<c:url value ="/static/resources/js/additional-methods.min.js"/>'></script>
	
<script src='<c:url value ="/static/resources/js/jquery.inputmask.bundle.js" />'></script>
<script src='<c:url value ="/static/resources/js/jquery.inputmask.bundle.min.js" />'></script>
	<%-- 
 	<script src='<c:url value ="/static/resources/js/fileinput.min.js"/>'></script>
	<link rel="stylesheet" type="text/css" media="all" href="<c:url value ="/static/resources/css/fileinput.min.css"/>" /> --%>

<script src='<c:url value ="/static/resources/js/jquery.maskedinput.js" />'></script>
<script src='<c:url value ="/static/resources/js/jquery.maskedinput.js" />'></script>

<script src='<c:url value ="/static/resources/js/dataTables.bootstrap.js"/>'></script>
<link rel="stylesheet" type="text/css" media="all"
	href="<c:url value ="/static/resources/css/dataTables.bootstrap.css"/>" />
	<script src='<c:url value ="/static/resources/js/moment.js"/>'></script>
	<script src='<c:url value ="/static/resources/js/daterangepicker.js"/>'></script>
	<link rel="stylesheet" type="text/css" media="all" href="<c:url value ="/static/resources/css/daterangepicker-bs3.css"/>" /> 

</head>
<style>
.error {
	color: #ff0000;
}
#imagePreview{
	margin-top: 25px;
    margin-bottom: 25px;
    margin-right: 75px;
    margin-left: 75px;
    width: 150px;
    height: 188px;
    background-position: center;
    background-size: cover;
/*     -webkit-box-shadow: 0 0 1px 1px rgba(0, 0, 0, .3); */
   -webkit-box-shadow: inset 0 0 10px #000000;
   display: inline-block;
}

#headId{
	margin-left: 40px;
}

.user{
	width: 183px;
	height: 25px;
	background:white;
	font-size: 16px;
	font-family: "SemiBold";
  	margin-right: 95px;
  	padding-left: 25px;
 	float: right;
}

.user2{
	width: 183px;
	height: 25px;
	margin-top: 5px;
	font-size: 16px;
	font-family: "Regular";
	font-weight: bold;
}

.btn btn-sm btn-info dropdown-toggle{
	background: #707070;
}

.headed{
	background: #707070;
	height: 65px;
}

/* a{color:white;} */
#footer{
background:#FFC000;
}

p{

	float:right;
}

.body{
	padding-left: 0px;
	padding-right: 0px;
	padding-top: 25px;
	background:#CAC9C7;
}

.container{

	position:relative;
	margin-left: auto;
	margin-right: auto;
	padding-right: 0px;
	padding-left: 0px;
	font-family: "Regular";
}

#btn_report{
	width: 75px;
	height: 25px;
	background: #707070;
	border: 1px solid #707070;
}

</style>
<%
	User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	String name = user.getUsername();
%>

<body>
<div class="headed">
  <div class="col-sm-12 col-xs-12 col-md-12 col-lg-12">
	<div class="headLogo" id="headId" >
		<img src="${pageContext.request.contextPath}/static/decorators/augmentis.jpg" alt="logo" style="width: 170px; height: 75px;"/>
		<a href="${pageContext.request.contextPath}/applicant" style="color:#ffffff;"><span class="glyphicon glyphicon-home"></span></a>
		<a href="${pageContext.request.contextPath}/request" style="color:#ffffff;"><spring:message code="request.button"/></a>		
		<a href="${pageContext.request.contextPath}/approve" style="color:#ffffff;"><spring:message code="request.approve"/></a>

		<div class="user">
			<a href="<c:url value="/logout"/>" style="color:#707070;"><span class="glyphicon glyphicon-log-out"></span> <spring:message code="sitemesh.logout"/></a>
			<a href=""  style="color:#707070;"><span class="glyphicon glyphicon-user" ></span> <%=name %></a>
			<div class="user2">
				<a href="${request.getRequestURL}?locale=en">
				<img src="${pageContext.request.contextPath}/static/decorators/eng_flag.png" alt="logo" class="img-flag" style="width: 40px; height: 25px;"/></a>
				<a href="${request.getRequestURL}?locale=th">		
				<img src="${pageContext.request.contextPath}/static/decorators/thai_flag.jpg" alt="logo" class="img-flag" style="width: 40px; height: 25px;" /></a>
				<div class="btn-group">
  					<button type="button" class="btn btn-defult dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="btn_report" style="color: #ffffff;">
    					<spring:message code="report.text"/> <span class="caret"></span>
  					</button>
  				<ul class="dropdown-menu">
    				<li><a href="${pageContext.request.contextPath}/report" style="	font-size: 16px; color: #292929;"><spring:message code="report.text"/></a></li>
    				<li><a href="${pageContext.request.contextPath}/monthlyReport"><spring:message code="report.text.monthly"/></a></li>
 				 </ul>
				</div>
			</div>
		</div>
	</div>
  </div>
</div>
	
	<div class="body">
		<decorator:body />
	</div>

	<div id="footer">
		<div class="text">
				<div class="container">
					<p class="text-muted credit">&copy; 2011-2015 Augmentis (Thailand) Limited. All rights reserved.</p>
				</div>
		</div>
	</div>
	

	
</body>
</html>