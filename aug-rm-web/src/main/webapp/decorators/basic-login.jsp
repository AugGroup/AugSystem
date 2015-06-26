
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
	src='<c:url value ="/static/resources/js/pnotify.custom.min.js"/>'></script>
<link rel="stylesheet" type="text/css" media="all"
	href="<c:url value ="/static/resources/css/pnotify.custom.min.css"/>" />

<script
	src='<c:url value ="/static/resources/js/jquery.validate.min.js"/>'></script>
<script
	src='<c:url value ="/static/resources/js/additional-methods.min.js"/>'></script>
	
<script
	src='<c:url value ="/static/resources/js/jquery.maskedinput.js" />'></script>
	<script
	src='<c:url value ="/static/resources/js/jquery.maskedinput.min.js" />'></script>

</head>
<style>
/* #bodyId{ */
/* 	background: */
/* 		url('${pageContext.request.contextPath}/static/decorators/intro-bg.jpg') */
/* 		fixed; */
/* } */

body {
background-image: url(${pageContext.request.contextPath}/static/decorators/body1.jpg);
-moz-background-size: cover;
-webkit-background-size: cover;
background-size: cover;
background-position: top center !important;
background-repeat: no-repeat !important;
background-attachment: fixed;
} 

#loginForm{
	height:500px;
    width: 245px;
    margin: 0 auto;  
}

</style>
<body>
	<div class="headLogo" id="headId" >
		 <img
			src="${pageContext.request.contextPath}/static/decorators/augmentis-logo-hires.png"
			alt="logo" style="width: 250px; height: 100px;" />
		<div class="form-group" align="right">
			<a href="${pageContext.request.contextPath}/login?locale=en">EN</a>
			<a href="${pageContext.request.contextPath}/login?locale=th">TH</a>
		</div>
	</div>
	<div>
		<decorator:body />
	</div>

	<div id="footer">
		<div class="container">
			<p class="text-muted credit">Copyright &copy; <a href="http://www.augmentis.biz/" > augmentis.biz</a></p>
		</div>
	</div>


</body>
</html>