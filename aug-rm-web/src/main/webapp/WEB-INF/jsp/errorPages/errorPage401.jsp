<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<style>
section {
	height: 80%;
	background: #E0DFDD;
	padding-top: 15px;
	padding-bottom: 45px;
}
</style>

<section>
	<div class="row-fluid" style="margin-top: 150px; margin-bottom: 150px;">
		<div class="row" style="margin-right: 10px;">
			<div class="col-md-5">
				<div id="randerleft" align="center">
					<img
						src="${pageContext.request.contextPath}/static/resources/images/errorimage.png"
						style="height: 90%; width: 75%; margin: auto;">
				</div>
			</div>
			<div class="col-md-6">
				<h1>Error! 401</h1>
				<p>The page you are looking for might have been remove, has its
					name and changed or is temporarily unavailable.</p>

				<p>Return to the homepage.</p>
				<div class="gotohome">
					<a id="linkgotohome" href="<%=request.getContextPath()%>/applicant"
						class="btn btn-danger" role="button"> <span
						class="glyphicon glyphicon-home" style="margin-left: 2px;">
					</span> Home
					</a>
				</div>
			</div>
		</div>

	</div>
</section>