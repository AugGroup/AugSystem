
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	
<script src='<c:url value ="/static/resources/js/jquery-1.11.3.min.js" />'></script>
<script src='<c:url value ="/static/resources/js/bootstrap.min.js"/>'></script>

<link rel="stylesheet" type="text/css" media="all" href="<c:url value ='/static/resources/css/bootstrap.min.css'/>" ></link>
<link rel="stylesheet" type="text/css" media="all" href="<c:url value ="/static/resources/css/bootstrap-theme.min.css"/>" />

<script src='<c:url value ="/static/resources/js/bootstrap-datepicker.min.js"/>'></script>
<link rel="stylesheet" type="text/css" media="all" href="<c:url value ="/static/resources/css/bootstrap-datepicker3.min.css"/>" />
<link rel="stylesheet" type="text/css" media="all" href="<c:url value ="/static/resources/css/bootstrap-datepicker3.standalone.min.css"/>" />

<script src='<c:url value ="/static/resources/js/jquery.dataTables.min.js"/>'></script>
<link rel="stylesheet" type="text/css" media="all" href="<c:url value ="/static/resources/css/jquery.dataTables.min.css"/>" />


<script src='<c:url value ="/static/resources/js/pnotify.custom.min.js"/>'></script>
<link rel="stylesheet" type="text/css" media="all" href="<c:url value ="/static/resources/js/pnotify.custom.min.css"/>" />

<script src='<c:url value ="/static/resources/js/jquery.validate.min.js"/>'></script>
<script src='<c:url value ="/static/resources/js/additional-methods.min.js"/>'></script>
</head>
<body>
	<h1>Header</h1>
	<p>
		<b>Navigation</b>
	</p>
	<hr />
	<decorator:body />
	<hr />
	<h1>
		Footer</b>
	</h1>
</body>
</html>