
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
</head>
<body>
	<div class="container">
		<img
			src="${pageContext.request.contextPath}/static/decorators/augmentis-logo-hires.png"
			alt="logo" style="width: 600px; height: 250px;" />
	</div>
	<hr />
	<decorator:body />


	<hr />

	<div id="footer">
		<div class="container">
			<p class="text-muted credit">Copyright � augmentis.co.th</p>
		</div>
	</div>


</body>
</html>