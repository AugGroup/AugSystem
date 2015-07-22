<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.springframework.security.core.userdetails.User"%>
<%@page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script
	src='<c:url value ="/static/resources/js/jquery-1.11.3.min.js" />'></script>
<script src='<c:url value ="/static/resources/js/bootstrap.min.js"/>'></script>

<link rel="stylesheet" type="text/css" media="all"
	href="<c:url value ='/static/resources/css/bootstrap.min.css'/>"></link>
<link rel="stylesheet" type="text/css" media="all"
	href="<c:url value ="/static/resources/css/bootstrap-theme.min.css"/>" />

<script
	src='<c:url value ="/static/resources/js/jquery.bootstrap.wizard.js"/>'></script>
<script
	src='<c:url value ="/static/resources/js/jquery.bootstrap.wizard.min.js"/>'></script>

<script
	src='<c:url value ="/static/resources/js/jquery.validate.min.js"/>'></script>
<script
	src='<c:url value ="/static/resources/js/additional-methods.min.js"/>'></script>
<title>Error 404 page</title>
<style>
section {
	height: 80%;
	background: #E0DFDD;
	padding-top: 70px;
}
</style>

</head>
<body>
 <jsp:include page="header.jsp"></jsp:include>
 <section>
  <div class="row-fluid"  style=" margin-top: 150px;margin-bottom: 150px;">
  	<div class="row" style=" margin-right:10px;">
		<div class="col-lg-5 col-md-5">
			<div id="randerleft" align="center">
				<img src="${pageContext.request.contextPath}/static/resources/images/errorimage.png"  style="height:90%;width:75%;margin: auto;">
	        </div>  	         
		</div>
		<div class="col-lg-6 col-md-6">
			<h1>Error! 404  web.xml</h1>	    
<!-- 			<p>The page you are looking for might have been remove,
			  has its name and changed or is
			  temporarily unavailable.</p> -->
			  
			<p>The server has not found anything matching the URL.</p>
			  
			  <p>Return to the homepage.</p>
			  <div class="gotohome">
				  	<a id="linkgotohome" href="<%=request.getContextPath()%>/applicant" class="btn btn-danger" role="button">
				  	<span class="glyphicon glyphicon-home" staria-hidden="true" style="margin-left: 2px;">
				  	</span>
				  	Home </a>    
			  </div>
		</div>
		</div>
	</div>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>


