<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
$(document).ready(function () {
	$('#myTabs a').click(function (e) {
		  e.preventDefault()
		  $(this).tab('show')
	})
		
	$('#myTabs a[href="#profile"]').tab('show') // Select tab by name
	$('#myTabs a:first').tab('show') // Select first tab
	$('#myTabs a:last').tab('show') // Select last tab
	$('#myTabs li:eq(2) a').tab('show') // Select third tab (0-indexed)

});
</script>
<div class="container">
		<div class="form-group">
			<ul class="nav nav-pills" role="navigation">
  				<li class='${ (tag eq "information") ? "active" : ""}'><a href="${pageContext.request.contextPath}/info/${id}"><span
 						class="glyphicon glyphicon-user"></span> <spring:message code="tab.info"/></a></li>
  				<li class='${ (tag eq "address") ? "active" : ""}'><a href="${pageContext.request.contextPath}/address/${id}"><span
						class="glyphicon glyphicon-home"></span> <spring:message code="tab.address"/></a></li>
				<li class='${ (tag eq "family") ? "active" : ""}'><a  href="${pageContext.request.contextPath}/family/${id}"><span
						class="glyphicon glyphicon-file"></span> <spring:message code="tab.family"/></a></li>
				<li class='${ (tag eq "education") ? "active" : ""}'><a  href="${pageContext.request.contextPath}/educations/${id}"><span
						class="glyphicon glyphicon-education"></span> <spring:message code="tab.education"/></a></li>
				<li class='${ (tag eq "certificate") ? "active" : ""}'><a  href="${pageContext.request.contextPath}/certificates/${id}"><span
						class="glyphicon glyphicon-file"></span> <spring:message code="tab.certificate"/></a></li>
				<li class='${ (tag eq "skill") ? "active" : ""}'><a  href="${pageContext.request.contextPath}/skills/${id}"><span
						class="glyphicon glyphicon-education"></span> <spring:message code="tab.skill"/></a></li>
				<li class='${ (tag eq "languages") ? "active" : ""}'><a  href="${pageContext.request.contextPath}/languages/${id}"><span
						class="glyphicon glyphicon-education"></span> <spring:message code="tab.languages"/></a></li>
				<li class='${ (tag eq "reference") ? "active" : ""}'><a  href="${pageContext.request.contextPath}/references/${id}"><span
						class="glyphicon glyphicon-file"></span> <spring:message code="tab.reference"/></a></li>
				<li class='${ (tag eq "experience") ? "active" : ""}'><a  href="${pageContext.request.contextPath}/experiences/${id}"><span 
						class="glyphicon glyphicon-file"></span> <spring:message code="tab.experience"/></a></li>      
			</ul>
		</div>
</div>
