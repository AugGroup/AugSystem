<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">
<div class="form-group">

<!-- <input type="hidden" value="id"> -->
			<ul class="nav nav-tabs" role="navigation">
				<li ><a href="${pageContext.request.contextPath}/informations/${id}" ><span
						class="glyphicon glyphicon-user"></span> <spring:message code="tab.info"/></a></li>
				<li><a  href="${pageContext.request.contextPath}/address/${id}"><span
						class="glyphicon glyphicon-home"></span> <spring:message code="tab.address"/></a></li>
				<li><a  href="${pageContext.request.contextPath}/family/${id}"><span
						class="glyphicon glyphicon-file"></span> <spring:message code="tab.family"/></a></li>
				<li><a  href="${pageContext.request.contextPath}/educations/${id}"><span
						class="glyphicon glyphicon-education"></span> <spring:message code="tab.education"/></a></li>
				<li><a  href="${pageContext.request.contextPath}/certificates/${id}"><span
						class="glyphicon glyphicon-file"></span> <spring:message code="tab.certificate"/></a></li>
				<li><a  href="${pageContext.request.contextPath}/skills/${id}"><span
						class="glyphicon glyphicon-education"></span> <spring:message code="tab.skill"/></a></li>
				<li><a  href="${pageContext.request.contextPath}/languages/${id}"><span
						class="glyphicon glyphicon-education"></span> <spring:message code="tab.languages"/></a></li>
				<li><a  href="${pageContext.request.contextPath}/references/${id}"><span
						class="glyphicon glyphicon-file"></span> <spring:message code="tab.reference"/></a></li>
				<li><a  href="${pageContext.request.contextPath}/experiences/${id}"><span 
						class="glyphicon glyphicon-file"></span> <spring:message code="tab.experience"/></a></li>
			</ul>
		</div>
</div>
