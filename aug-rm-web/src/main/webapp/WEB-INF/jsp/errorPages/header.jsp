<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.springframework.security.core.userdetails.User"%>
<%@page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<style>
#imagePreview {
	width: 150px;
	height: 188px;
	background-position: center;
	background-size: cover;
	-webkit-box-shadow: 0 0 1px 1px rgba(0, 0, 0, .3);
	display: inline-block;
}

#headId {
	margin-left: 40px;
}

.user {
	width: 183px;
	height: 25px;
	background: white;
	font-size: 16px;
	font-family: "SemiBold";
	margin-right: 95px;
	padding-left: 25px;
	float: right;
}

.user2 {
	width: 183px;
	height: 25px;
	margin-top: 5px;
	font-size: 16px;
	font-family: "Regular";
	font-weight: bold;
}

header {
	background: #707070;
	height: 65px;
}

#footer {
	background: #FFCC00;
}

#flag {
	width: 85px;
	height: 25px;
	margin: 0px;
}
</style>

<header class="header">
	<div class="headLogo" id="headId">
		<img
			src="${pageContext.request.contextPath}/static/decorators/augmentis.jpg"
			alt="logo" style="width: 170px; height: 75px;" /> <a
			href="${pageContext.request.contextPath}/applicant"
			style="color: #ffffff;"><span class="glyphicon glyphicon-home"></span></a>
		<a href="${pageContext.request.contextPath}/request"
			style="color: #ffffff;"><spring:message code="request.button" /></a>
		<a href="${pageContext.request.contextPath}/approve"
			style="color: #ffffff;"><spring:message code="request.approve" /></a>

		<div class="user">
			<a href="<c:url value="/logout"/>" style="color: black;"><span
				class="glyphicon glyphicon-log-out"></span> <spring:message
					code="sitemesh.logout" /></a> |<a href="" style="color: black;"><span
				class="glyphicon glyphicon-user"></span>${user.username}</a>
			<div class="user2">
				<a href="${request.getRequestURL}?locale=en"> <img
					src="${pageContext.request.contextPath}/static/decorators/eng_flag.png"
					alt="logo" class="img-flag" style="width: 40px; height: 25px;" /></a> <a
					href="${request.getRequestURL}?locale=th"> <img
					src="${pageContext.request.contextPath}/static/decorators/thai_flag.jpg"
					alt="logo" class="img-flag" style="width: 40px; height: 25px;" /></a>
				<div class="btn-group">
					<button type="button" class="btn btn-sm btn-info dropdown-toggle"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
						style="width: 75px; height: 25px;">
						Report <span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
						<li><a href="${pageContext.request.contextPath}/report"><spring:message
									code="report.text" /></a></li>
						<li><a
							href="${pageContext.request.contextPath}/monthlyReport"><spring:message
									code="report.text.monthly" /></a></li>
					</ul>
				</div>
			</div>
		</div>

	</div>
</header>