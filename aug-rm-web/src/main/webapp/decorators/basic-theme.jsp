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
<body  >
	<div class="head">
		<img
			src="${pageContext.request.contextPath}/static/decorators/augmentis-logo-hires.png"
			alt="logo" style="width: 250px; height: 100px;" />
			
			<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#myNavbar">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="https://www.augmentis.biz/">Augmentis</a>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav">
						<li><a href="${pageContext.request.contextPath}/applicant">Applicant</a></li>
						<li><a href="${pageContext.request.contextPath}/application">Application</a></li>
						<li><a href="${pageContext.request.contextPath}/request">Request</a></li>
						<li><a href="${pageContext.request.contextPath}/approve">Approve</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><a href=""><span class="glyphicon glyphicon-user"></span>

								${name}</a></li>
						<li><a href="${pageContext.request.contextPath}/login"><span class="glyphicon glyphicon-log-in"></span>
								Login</a></li>
						<li><a href="<c:url value="j_spring_security_logout" />"><span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
					</ul>
				</div>
			</div>
		</nav>
			
			
	</div>
	<hr />
	<div class="body" >
		<!-- <div class="col-md-9 text-right">
			<ul class="nav nav-tabs" role="navigation">
				<li class="active"><a data-toggle="tab" href="login">Login</a></li>
				<li><a data-toggle="tab" href="main_applicant"><span
						class="glyphicon glyphicon-home"></span> Main Applicant</a></li>
				<li><a data-toggle="tab" href="application"><span
						class="glyphicon glyphicon-education"></span> Appllication</a></li>
			</ul>
		</div> -->
	</div>
	<div>
		<decorator:body />
	</div>
	<hr />

	<div id="footer">
		<div class="container">
			<p class="text-muted credit">Copyright © augmentis.biz </p>
		</div>
	</div>


</body>
</html>