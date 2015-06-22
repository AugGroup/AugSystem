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
						class="glyphicon glyphicon-user"></span> Informations</a></li>
				<li><a  href="${pageContext.request.contextPath}/address/${id}"><span
						class="glyphicon glyphicon-home"></span> Address</a></li>
<<<<<<< HEAD
				<li><a  href="${pageContext.request.contextPath}/family/"${id}><span
						class="glyphicon glyphicon-file"></span> Family</a></li>
				<li><a  href="${pageContext.request.contextPath}/educations/"${id}><span
						class="glyphicon glyphicon-education"></span> Educations</a></li>
				<li><a  href="${pageContext.request.contextPath}/certificates/"${id}><span
						class="glyphicon glyphicon-file"></span> Certificates</a></li>
				<li><a  href="${pageContext.request.contextPath}/skills/"${id}><span
						class="glyphicon glyphicon-education"></span> Skills</a></li>
				<li><a  href="${pageContext.request.contextPath}/languages/"${id}><span
						class="glyphicon glyphicon-education"></span> Languages</a></li>
				<li><a  href="${pageContext.request.contextPath}/references/"${id}><span
						class="glyphicon glyphicon-file"></span> References</a></li>
				<li><a  href="${pageContext.request.contextPath}/experiences/"${id}><span 
						class="glyphicon glyphicon-file"></span> Experiences</a></li>
<!-- ======= -->
<%-- 				<li><a  href="${pageContext.request.contextPath}/educations/${id}"><span --%>
<!-- 						class="glyphicon glyphicon-education"></span> Educations</a></li> -->
<%-- 				<li><a  href="${pageContext.request.contextPath}/experiences/${id}"><span --%>
<!-- >>>>>>> Edit AddressRepository.java, AddressRepositoryImpl.java, ExperienceRepository.java, /ExperienceRepositoryImpl.java, ReferenceRepository.java, ReferenceRepositoryImpl.java, ReferenceService.java, ReferenceServiceImpl.java, ApplicationController.java, address.jsp, applicationMenu.jsp, applications.jsp, experiences.jsp -->
			</ul>
		</div>
</div>
