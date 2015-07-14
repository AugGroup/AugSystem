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

.headed{
	background: #707070;
	height: 65px;
}

a{color:white;}
#footer{background:#FFCC00;}

.bod{background:#E0DFDD;}
.body{background:#E0DFDD;}
</style>
<%
	User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	String name = user.getUsername();
%>

<body>
<div class="headed">
	<div class="headLogo" id="headId" >
		<img src="${pageContext.request.contextPath}/static/decorators/augmentis-logo-hires.png" alt="logo" style="width: 250px; height: 75px;"/>
		<a href="${pageContext.request.contextPath}/applicant"><span class="glyphicon glyphicon-home"></span></a>
		<a href="${pageContext.request.contextPath}/request"><spring:message code="request.button"/></a>		
		<a href="${pageContext.request.contextPath}/approve"><spring:message code="request.approve"/></a>

		<div class="user">
			<a href=""><span class="glyphicon glyphicon-user"></span> <%=name %></a>
			<a href="<c:url value="/logout"/>"><span class="glyphicon glyphicon-log-out"></span> <spring:message code="sitemesh.logout"/></a>
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
    				<li><a href="${pageContext.request.contextPath}/report"><spring:message code="report.text"/></a></li>
    				<li><a href="${pageContext.request.contextPath}/monthlyReport"><spring:message code="report.text.monthly"/></a></li>
 				 </ul>
				</div>
			</div>
		</div>
	</div>
</div>
	<div class="body">
		
	<!-------------------- Report Modal -------------------->
	<div class="modal fade" id="reportModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content"></div>
		</div>
	</div>
	
	</div>
	<div class="bod">
		<div class="container">
			<decorator:body />
		</div>
	</div>

	<div id="footer">
		<div class="text">
				<div class="container">
					<p class="text-muted credit">Copyright &copy; <a href="http://www.augmentis.biz/"> augmentis.biz</a></p>
				</div>
		</div>
	</div>
	
<!-------------------- Modal -------------------->	
<script type="text/javascript">
	$(document).ready(function() {
		$('body').on('hidden.bs.modal', '.modal', function () {
			  $(this).removeData('bs.modal');
		});
	});
</script>
	
</body>
</html>