<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="form-group">
			<ul class="nav nav-tabs" role="navigation">

				<li ><a href="${pageContext.request.contextPath}/informations" ><span
						class="glyphicon glyphicon-user"></span> Informations</a></li>
				<li><a  href="${pageContext.request.contextPath}/applications"><span
						class="glyphicon glyphicon-home"></span> Application</a></li>
				<li><a  href="${pageContext.request.contextPath}/address"><span
						class="glyphicon glyphicon-home"></span> Address</a></li>
				<li><a  href="${pageContext.request.contextPath}/educations"><span
						class="glyphicon glyphicon-education"></span> Educations</a></li>
				<li><a  href="${pageContext.request.contextPath}/experiences"><span
						class="glyphicon glyphicon-file"></span> Experiences</a></li>
			</ul>
		</div>