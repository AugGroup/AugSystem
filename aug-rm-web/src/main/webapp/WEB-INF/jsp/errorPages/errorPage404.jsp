<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src='<c:url value ="/static/resources/js/jquery-1.11.3.min.js" />'></script>
<script src='<c:url value ="/static/resources/js/bootstrap.min.js"/>'></script>

<link rel="stylesheet" type="text/css" media="all"
	href="<c:url value ='/static/resources/css/bootstrap.min.css'/>"></link>
<link rel="stylesheet" type="text/css" media="all"
	href="<c:url value ="/static/resources/css/bootstrap-theme.min.css"/>" />

<script
	src='<c:url value ="/static/resources/js/jquery.bootstrap.wizard.js"/>'></script>
<script
	src='<c:url value ="/static/resources/js/jquery.bootstrap.wizard.min.js"/>'></script>


<script src='<c:url value ="/static/resources/js/jquery.validate.min.js"/>'></script>
<script src='<c:url value ="/static/resources/js/additional-methods.min.js"/>'></script>
<title>Error 404 page</title>
<style >
.error {
	color: #ff0000;
}
#imagePreview{
    width: 150px;
    height: 188px;
    background-position: center;
    background-size: cover;
    -webkit-box-shadow: 0 0 1px 1px rgba(0, 0, 0, .3);
    display: inline-block;
}

#headId{
	margin-left: 40px;
}

.user{
	width: 183px;
	height: 25px;
	background:white;
	font-size: 16px;
	font-family: "SemiBold";
  	margin-right: 95px;
  	padding-left: 25px;
 	float: right;
}

.user2{
	width: 183px;
	height: 25px;
	margin-top: 5px;
	font-size: 16px;
	font-family: "Regular";
	font-weight: bold;
}

.headed{
	background: #707070;
	height: 65px;
}

/* a{color:white;} */
#footer{background:#FFCC00;}

.body{
	background:#E0DFDD;
	margin-top: 95px;
}

.container{
	padding-right: 0px;
	padding-left: 0px;
}

#flag{
	width: 85px;
	height: 25px;
	margin: 0px;

}

</style>

</head>
<body>

<div class="headed">
	<div class="headLogo" id="headId" >
		<img src="${pageContext.request.contextPath}/static/decorators/augmentis.jpg" alt="logo" style="width: 170px; height: 75px;"/>
		<a href="${pageContext.request.contextPath}/applicant" style="color:#ffffff;"><span class="glyphicon glyphicon-home"></span></a>
		<a href="${pageContext.request.contextPath}/request" style="color:#ffffff;"><spring:message code="request.button"/></a>		
		<a href="${pageContext.request.contextPath}/approve" style="color:#ffffff;"><spring:message code="request.approve"/></a>

		<div class="user">
			<a href="<c:url value="/logout"/>" style="color:black;"><span class="glyphicon glyphicon-log-out"></span> <spring:message code="sitemesh.logout"/></a>
			<a href=""  style="color:black;"><span class="glyphicon glyphicon-user" ></span></a>
			<div class="user2">
				<a href="${request.getRequestURL}?locale=en">
				<img src="${pageContext.request.contextPath}/static/decorators/eng_flag.png" alt="logo" class="img-flag" style="width: 40px; height: 25px;"/></a>
				<a href="${request.getRequestURL}?locale=th">		
				<img src="${pageContext.request.contextPath}/static/decorators/thai_flag.jpg" alt="logo" class="img-flag" style="width: 40px; height: 25px;" /></a>
				<div class="btn-group">
  					<button type="button" class="btn btn-sm btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="width: 75px; height: 25px;">
    					Report <span class="caret"></span>
  					</button>
  				<ul class="dropdown-menu">
    				<li><a href="${pageContext.request.contextPath}/report"><spring:message code="report.text"/></a></li>
    				<li><a href="${pageContext.request.contextPath}/monthlyReport"><spring:message code="report.text.monthly"/></a></li>
 				 </ul>
				</div>
			</div>
		</div>
	</div>
</div>


<br/>

  <div class="row-fluid"  style=" margin-top: 150px;margin-bottom: 150px;">	 <!-- style=" margin-top: 100px;margin-bottom: 100px;" -->
	
   <div class="row" style=" margin-right:10px;">
	<div class="col-lg-5 col-md-5">
	          <div id="randerleft" align="center">
	            <img src="${pageContext.request.contextPath}/resources/images/errorimage.png"  style="height:90%;width:75%;margin: auto;">
	         </div>  	         
	</div>
	
	<div class="col-lg-6 col-md-6">
	          <h1>Error! 404</h1>	    
			  <p>The page you are looking for might have been remove,
			  has its name and changed or is
			  temporarily unavailable.</p>
			  
			  <p>Return to the homepage.</p>
			  <div class="gotohome">
				  	<a id="linkgotohome" href="<%=request.getContextPath()%>/listemployee" class="btn btn-danger" role="button">
				  	<span class="glyphicon glyphicon-home" staria-hidden="true" style="margin-left: 2px;">
				  	</span>
				  	Home
				  	</a>    
			  </div>
	</div>
  </div>
	
  </div> 


<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>


