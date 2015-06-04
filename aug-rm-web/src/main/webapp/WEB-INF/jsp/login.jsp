<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>

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
	<h1>Log-In</h1>

	<div class="container">
		<img src="${pageContext.servletContext.contextPath}/static/resources/images/p_logo.png" alt="Image Error">
		
		<form class="form-inline" name="form" id="form" action="${pageContext.request.contextPath}/applicant" method="post">
		
			<div class="form-group">
				<label for="userName">Username:</label>
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