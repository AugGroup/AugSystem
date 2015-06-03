<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<html>
<head>
<script src="<c:url value="/static/resources/js/jquery-1.11.3.min.js"/>"></script>
<script src="<c:url value="/static/resources/js/jquery.validate.min.js"/>"></script>
<script src="<c:url value="/static/resources/js/additional-methods.min.js"/>"></script>

<script src="<c:url value="/static/resources/js/bootstrap.min.js"/>"></script>
<link rel="stylesheet" type="text/css" href="<c:url value="/static/resources/css/bootstrap.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/static/resources/css/bootstrap-theme.min.css"/>">

<script src="<c:url value="/static/resources/js/bootstrap-datepicker.min.js"/>"></script>
<link rel="stylesheet" type="text/css" href="<c:url value="/static/resources/css/bootstrap-datepicker.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/static/resources/css/bootstrap-datepicker3.min.css"/>">

<script src="<c:url value="/static/resources/js/pnotify.custom.min.js"/>"></script>
<link rel="stylesheet" type="text/css" href="<c:url value="/static/resources/css/pnotify.custom.min.css"/>">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Insert title here</title>
<style type="text/css">
.error{
color:red;
}
</style>

<script type="text/javascript">
$(document).ready(function() {
	$('#form').validate({
        rules: {
            userName: "required",
            password: {
                required: true,
                minlength: 5
            }
        },
        messages: {
            userName: {
            	required: "Please enter your username"
            },
            password: {
                required: "Please enter a password",
                minlength: "Your password must be at least 5 characters"
        	}
        },
    });
	
	$('#btnSubmit').on('click', function(){
		login();
	});
	
	function login(){
		if($('#form').valid()){
			var userName = 	$('#userName').val();
			var json = {"userName" : userName,
						"password" : password};
		};
	};
});
</script>

</head>

<body>
	<h1>Log-In</h1>

	<div class="container">
		<!-- 	<img alt="Image Error" src="/resources/images/p_logo.png"> -->
		
		<form class="form-inline" name="form" id="form" action="${pageContext.request.contextPath}/applicant" method="post">
		
			<div class="form-group">
				<label for="userName" class="control-label">Username:</label>
				<input type="text" class="form-control" name="userName" id="userName">
			</div><br><br>
			
			<div class="form-group">
				<label for="password" class="control-label">Password:</label> 
				<input type="password" class="form-control" name="password" id="password">
			</div><br><br>
			
			<button type="submit" id="btnSubmit" class="btn btn-primary btn-md">Submit</button>
		</form>
		
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">Modal title</h4>
					</div>
					<div class="modal-body"></div>
					<div class="modal-footer"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>