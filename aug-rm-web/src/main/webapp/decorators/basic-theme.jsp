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
<style>
.error {
	color: #ff0000;
}
/* #imagePreview {
    width: 180px;
    height: 180px;
    background-position: center center;
    background-size: cover;
    -webkit-box-shadow: 0 0 1px 1px rgba(0, 0, 0, .3);
    display: inline-block;
} */
</style>

<body  >
	<div class="headLogo" id="headId" >
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
						<li><a href="${pageContext.request.contextPath}/request">Request</a></li>
						<li><a href="${pageContext.request.contextPath}/approve">Approve</a></li>
						<li><a href="${pageContext.request.contextPath}/report">Report</a></li>
						<%-- <li class="dropdown">
         					 <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Report <span class="caret"></span></a>
         					 <ul class="dropdown-menu">
         					 	<li><a data-toggle="modal" data-backdrop="static" data-keyboard="false" data-target="#reportModal" href="${pageContext.request.contextPath}/modalEEReport">EE Report</a> </li>
            					<li><a data-toggle="modal" data-backdrop="static" data-keyboard="false" data-target="#reportModal" href="${pageContext.request.contextPath}/modalDegreeReport">Degree Report</a> </li>
            					<li><a data-toggle="modal" data-backdrop="static" data-keyboard="false" data-target="#reportModal" href="${pageContext.request.contextPath}/modalMajorReport">Major Report</a> </li>
         					 	<li><a data-toggle="modal" data-backdrop="static" data-keyboard="false" data-target="#reportModal" href="${pageContext.request.contextPath}/modalPositionReport">Position Report</a> </li>
         					 	<li class="divider"></li>	
         					 	<li><a data-toggle="modal" data-backdrop="static" data-keyboard="false" data-target="#reportModal" href="${pageContext.request.contextPath}/modalMonthlyReport">Monthly Report</a></li>
         					 </ul>
        				</li> --%>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="${pageContext.request.contextPath}/login?locale=en">EN</a></li>
						<li><a href="${pageContext.request.contextPath}/login?locale=th">TH</a></li>
						<li><a href=""><span class="glyphicon glyphicon-user"></span> ${name}</a></li>
						<li><a href="<c:url value="j_spring_security_logout" />"><span class="glyphicon glyphicon-log-out"></span> <spring:message code="sitemesh.logout"/></a></li>
					</ul>
				</div>
			</div>
		</nav>
			
			
	</div>
	<hr />
	<div class="body">
		
	<!-------------------- Report Modal -------------------->
	<div class="modal fade" id="reportModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content"></div>
		</div>
	</div>
	
	</div>
	<div>
		<div class="container">
			<decorator:body />
		</div>
	</div>
	<hr />

	<div id="footer">
		<div class="container">
			<p class="text-muted credit">Copyright &copy; <a href="http://www.augmentis.biz/" > augmentis.biz</a></p>
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