<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<style>
.body {
	height: 100%;
	background: #E0DFDD;
	padding-top: 15px;
	padding-bottom: 45px;
}
p{
	float: left;
	padding: 5px;
	width: 100%;
}

.gotohome{
	margin: 5px;
}
</style>

<section>
  <div class="row-fluid"  style=" margin-top: 150px;margin-bottom: 150px;">
  	<div class="row" style=" margin-right:10px;">
		<div class="col-md-5">
			<div id="randerleft" align="center">
				<img src="${pageContext.request.contextPath}/static/resources/images/errorimage.png"  style="height:90%;width:75%;margin: auto;">
	        </div>  	         
		</div>
		<div class="col-md-6">
			<h1>Error! 400</h1>	    
			<p>User fill wrong informations. Please check it again.
			<br><br><br>
			
			Return to the home page.</p>
			<div class="gotohome">
				<a id="linkgotohome" href="<%=request.getContextPath()%>/applicant" class="btn btn-danger" role="button">
				<span class="glyphicon glyphicon-home" style="margin-left: 2px;"></span>
				 Home </a>
			</div>
		</div>
	</div>
</div>
</section>