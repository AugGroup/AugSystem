<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="applicationMenu.jsp" />
<jsp:include page="infoSpringMessage.jsp" />

<!-- tab informations -->
<div class="container" id="info">
<c:choose>
		<c:when test="${applicant.id ne null}">
			<c:set var="actionName">infoEdit/${applicant.id}</c:set>
		</c:when>
		<c:otherwise>
			<c:set var="actionName">saveInformations</c:set>
		</c:otherwise>
	</c:choose>

<f:form id="informationApplicant" name="informationApplicant" action="${pageContext.request.contextPath}/${actionName}"
		modelAttribute="applicant" method="post" enctype="multipart/form-data" class="form-inline">
		<f:hidden path="id" />
		<f:hidden path="code" />
		<f:hidden path="score" />
		<f:hidden path="techScore" />
		<f:hidden path="attitudeHome" />
		<f:hidden path="attitudeOffice" />
		<f:hidden path="trackingStatus" />

		<h3 id="infomation"> INFORMATION</h3>
		
			<div class="form-group">
				<div class="col-sm-12 col-xs-3 col-md-3 col-lg-3">
						<c:choose>
							<c:when test="${empty applicant.image}">
											<div class="img-thumbnail" id="imagePreview"  style="background-image:url('${pageContext.request.contextPath}/static/decorators/noPhotoAvailable-resize.jpg')"></div>
					 		</c:when>
					 		<c:when test="${not empty applicant.image}">
					 						<div class="img-thumbnail" id="imagePreview"  style="background-image:url('${pageContext.request.contextPath}/DisplayImageServlet?namespace=APPLICANT&fileName=${applicant.image}');"></div>
						</c:when>
						</c:choose>
						    <span class="btn btn-warning btn-file" class="glyphicon glyphicon-picture"> <span class="glyphicon glyphicon-picture"></span> Add Photo <input id="imageMultipartFile" name="imageMultipartFile" type="file" accept="image/*" class="file"/>
						    </span>
					<f:hidden path="image" />
				</div>
				<div class="col-sm-12 col-xs-3 col-md-3 col-lg-3">
					<label for="firstNameTh"><spring:message code="info.firstname.th"/></label>
					<spring:message code="info.text.first.th" var="firstname"/><br>
					<f:input path="firstNameTH" id="firstNameTH" name="firstNameTH" placeholder="${firstname}" class="form-control" type="text"></f:input>
				
				</div>
				<div class="col-sm-12 col-xs-3 col-md-3 col-lg-3">
					<label for="lastnameTh"><spring:message code="info.lastname.th"/></label>
					<spring:message code="info.text.last.th" var="lastname"/><br>
					<f:input path="lastNameTH" id="lastNameTH" name="lastNameTH" placeholder="${lastname}" class="form-control" type="text"></f:input>
				</div>
				<div class="col-sm-12 col-xs-3 col-md-3 col-lg-3">
					<label for="nickNameTh"><spring:message code="info.nickname.th"/></label>
					<spring:message code="info.text.nick.th" var="nickname"/><br>
					<f:input path="nickNameTH" id="nickNameTH" name="nickNameTH" placeholder="${nickname}" class="form-control" type="text"></f:input>
				</div>
				<div class="col-sm-12 col-xs-3 col-md-3 col-lg-3">
					<label for="firstNameEng"><spring:message code="info.firstname.en"/></label>
					<spring:message code="info.text.first.en" var="firstnameEn"/><br>
					 <f:input path="firstNameEN" id="firstNameEN" name="firstNameEN" placeholder="${firstnameEn}" class="form-control" type="text"></f:input>
				</div>
				<div class="col-sm-12 col-xs-3 col-md-3 col-lg-3">
					<label for="lastnameEng"><spring:message code="info.lastname.en"/> </label>
					<spring:message code="info.text.last.en" var="lastnameEn"/><br>
					<f:input path="lastNameEN" id="lastNameEN" name="lastNameEN" placeholder="${lastnameEn}" class="form-control" type="text"></f:input>
				</div>
				<div class="col-sm-12 col-xs-3 col-md-3 col-lg-3">
					<label for="nickNameEng"><spring:message code="info.nickname.en"/></label>
					<spring:message code="info.text.nick.en" var="nicknameEn"/><br>
					<f:input path="nickNameEN" id="nickNameEN" name="nickNameEN" class="form-control" placeholder="${nicknameEn}" type="text"></f:input>
				</div>
			</div>	
	<h3 id="general" >GENERAL</h3>
		
<!-- <div class="form-group"> -->
	<div class="row">
			<div class="col-sm-12 col-xs-3 col-md-3 col-lg-3">
				<label for="tel"><spring:message code="info.tel"/></label>
				<spring:message code="info.text.tel" var="tel"/><br>
				<f:input path="tel" id="tel" name="tel" placeholder="${tel}" class="form-control" type="text"></f:input>
			</div>
			<div class="col-sm-12 col-xs-3 col-md-3 col-lg-3">
				<label for="eMail"><spring:message code="info.email"/></label>
				<spring:message code="info.text.email" var="email"/><br>
				<f:input path="email" id="email" name="email" type="email" placeholder="${email}" class="form-control"></f:input>
			</div>
			<div class="col-sm-12 col-xs-3 col-md-3 col-lg-3">
				<label for="birthday"><span class="glyphicon glyphicon-calendar"></span> <spring:message code="info.birthday"/></label><br>
				<div class="input-group date" id="birthDay">
					<f:input path="birthDate" id="birthDate" name="birthDate" class="form-control"></f:input><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
				</div>
				<br><label for="birthDate" class="error"></label>
			</div>
			<div class="col-sm-12 col-xs-3 col-md-3 col-lg-3">
				<label for="pBirth"><spring:message code="info.place.birth"/></label>
				<spring:message code="info.text.birth" var="pBirth"/><br>
				<f:input path="placeBirth" id="placeBirth" name="placeBirth" class="form-control" placeholder="${pBirth}" type="text"></f:input>
			</div>
		</div>

<!-- <div class="form-group"> -->
		<div class="row">
			<div class="col-sm-12 col-xs-3 col-md-3 col-lg-3">
				<label for="age"><spring:message code="info.age"/></label>
				<spring:message code="info.text.age" var="age"/><br>
				<f:input path="age" id="age" name="age" class="form-control" placeholder="${age}" type="text"></f:input>
			</div>
			<div class="col-sm-12 col-xs-3 col-md-3 col-lg-3">
				<label for="religion"><spring:message code="info.religion"/></label>
				<spring:message code="info.text.religion" var="religion"/><br>
				<f:input path="religion" id="religion" name="religion" class="form-control" placeholder="${religion}" type="text"></f:input>
			</div>
			<div class="col-sm-12 col-xs-3 col-md-3 col-lg-3">
				<label for="nationality"><spring:message code="info.nationality"/></label>
				<spring:message code="info.text.nationality" var="nationality"/><br>
				<f:input path="nationality" id="nationality" name="nationality" class="form-control" placeholder="${nationality}" type="text"></f:input>
			</div>
			<div class="col-sm-12 col-xs-3 col-md-3 col-lg-3">
				<label for="cardId"><spring:message code="info.id.card"/></label>
				<spring:message code="info.text.card" var="card"/><br>
				<f:input path="cardId" id="cardId" name="cardId" class="form-control" placeholder="${card}" type="text"></f:input>
			</div>
		</div>
<!-- </div> -->
<!-- 		<div class="form-group"> -->
		<div class="row">
			<div class="col-sm-12 col-xs-3 col-md-3 col-lg-3">
				<label for="cardIssuedOffice"><spring:message code="info.issue.office"/></label>
				<spring:message code="info.text.issued" var="issued"/><br>
				<f:input path="cardIssuedOffice" name="cardIssuedOffice" id="cardIssuedOffice" class="form-control" placeholder="${issued}" type="text"></f:input>
			</div>
			<div class="col-sm-12 col-xs-3 col-md-3 col-lg-3">
				<label for="cardExpiryDate"><span class="glyphicon glyphicon-calendar"></span><spring:message code="info.expiration.date"/></label><br>
				<div class="input-group date" id="cardExpiryDay">
					<f:input path="cardExpiryDate" id="cardExpiryDate" name="cardExpiryDate" class="form-control"></f:input><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
				</div>
				<br><label for="cardExpiryDate" class="error"></label>
				
			</div>
			<div class="col-sm-12 col-xs-3 col-md-3 col-lg-3">
				<label for="height"><spring:message code="info.height"/></label>
				<spring:message code="info.text.height" var="height"/><br>
				<f:input path="height" class="form-control" id="height" name="height" placeholder="${height}" type="text"></f:input>
			</div>
			<div class="col-sm-12 col-xs-3 col-md-3 col-lg-3">
				<label for="weight"><spring:message code="info.weight"/></label>
				<spring:message code="info.text.weight" var="weight"/><br>
				<f:input path="weight" class="form-control" id="weight" name="weight" placeholder="${weight}" type="text"></f:input>
			</div>
		</div>	
<!-- 	</div> -->
	
<!-- 		<div class="form-group"> -->
		<div class="row">
			<div class="col-sm-12 col-xs-3 col-md-3 col-lg-3">
					<label for="sex"> <spring:message code="info.sex"/></label>
					<div id="sexRadioButton">
						<f:radiobutton path="sex" value="Female" name="sex" id="sexFamle" ></f:radiobutton><label> <spring:message code="info.female"/></label>
						<f:radiobutton path="sex" value="Male" name="sex" id="sexMale" ></f:radiobutton><label> <spring:message code="info.male"/></label>
 					<br><label for="sex" class="error"></label>
 					</div>
			</div>
		
			<div id="applicantStatusStyle" class="col-sm-12 col-xs-3 col-md-3 col-lg-3">
					<label for="applicantStatus"><spring:message code="info.marriage.status"/></label>
					<div id="applicantStatusRadioButton">
						<f:radiobutton path="applicantStatus" id="applicantStatusSingle" name="applicantStatus" value="Single"></f:radiobutton><label> <spring:message code="info.single"/></label>
						<f:radiobutton path="applicantStatus" id="applicantStatusMarried" name="applicantStatus" value="Married"></f:radiobutton><label> <spring:message code="info.married"/></label>
						<f:radiobutton path="applicantStatus" id="applicantStatusDivorced" name="applicantStatus" value="Divorced"></f:radiobutton><label> <spring:message code="info.divorced"/></label>
					 	<br><label for="applicantStatus" class="error"></label>
					</div>
			</div>
			
		</div>
<div id="married">
	<div class="row">
			<div class="col-sm-12 col-xs-3 col-md-3 col-lg-3">
				<label for="children"><spring:message code="info.number.child"/> 
				<spring:message code="info.text.children" var="children"/><br>
				</label><br><f:input path="numberOfChildren" class="form-control" id="numberOfChildren" name="numberOfChildren" placeholder="${children}" type="text"></f:input>
			</div>
			<div class="col-sm-12 col-xs-3 col-md-3 col-lg-3">
				<label for="spouseName"><spring:message code="info.spouseName"/></label>
				<spring:message code="info.text.spouse" var="spouse"/><br>
				<f:input path="spouseName" class="form-control" id="spouseName" name="spouseName" placeholder="${spouse}" type="text"></f:input>
			</div>
			<div class="col-sm-12 col-xs-3 col-md-3 col-lg-3">
				<label for="marriageCertificateNo"><spring:message code="info.marriage.certifate"/></label>
				<spring:message code="info.text.marriage" var="marryNo"/><br>
				<f:input path="marriageCertificateNo" class="form-control" id="marriageCertificateNo" name="marriageCertificateNo" placeholder="${marryNo}" type="text"></f:input>
			</div>
			<div class="col-sm-12 col-xs-3 col-md-3 col-lg-3">
				<label for="issueOficeMarriage"><spring:message code="info.issue.title"/></label>
				<spring:message code="info.text.marriage.issued" var="issuedMarry"/><br>
				<f:input path="issueOficeMarriage" class="form-control" id="issueOficeMarriage" name="issueOficeMarriage" placeholder="${issued}" type="text"></f:input>
			</div>
			
		</div>
	<div class="row">
		<div class="col-sm-12 col-xs-3 col-md-3 col-lg-3">
				<label for="occupationMarriage"><spring:message code="info.occupation.title"/></label>
				<spring:message code="info.text.occupation" var="occupation"/><br>
				<f:input path="occupationMarriage" class="form-control" id="occupationMarriage" name="occupationMarriage" placeholder="${occupation}" type="text"></f:input>
		</div>
			<div class="col-sm-12 col-xs-9 col-md-9 col-lg-9">
				<label for="marriageAddress"><spring:message code="info.address.title"/></label>
				<spring:message code="info.text.address" var="address"/><br>
				<f:input path="marriageAddress" class="form-control" id="marriageAddress" name="marriageAddress" placeholder="${address}" type="text"></f:input>
			</div>
	</div>
</div>
<div class="row" >
		<div class="col-sm-12 col-xs-3 col-md-3 col-lg-3">
			<label for="military"><spring:message code="info.military.ask"/></label>
			<div id="militaryStatusRadioButton">
					<f:radiobutton path="militaryStatus" id="militaryStatusYes" name="militaryStatus" value="Yes"></f:radiobutton><label><spring:message code="info.yes"/></label>
					<f:radiobutton path="militaryStatus" id="militaryStatusNo" name="militaryStatus" value="No"></f:radiobutton><label><spring:message code="info.no"/></label>
					<br><label for="militaryStatus" class="error"></label>
			</div>
		</div>
</div>
<div id="militaryYes">
	<div class="row">
		<div class="col-sm-12 col-xs-3 col-md-3 col-lg-3">
					<label for="militaryComplete"><spring:message code="info.military.yes"/></label>
		</div>	
	</div>
	<div class="row">
		<div class="col-sm-12 col-xs-3 col-md-3 col-lg-3">
					<label for="militaryFromYear"><spring:message code="info.military.fromYear"/></label>
					<spring:message code="info.text.from" var="from"/><br>
					<f:input path="militaryFromYear" class="form-control" id="militaryFromYear" name="militaryFromYear" placeholder="${from}" type="text"></f:input><br>
		</div>
		<div class="col-sm-12 col-xs-3 col-md-3 col-lg-3">
					<label for="militarytoYear"><spring:message code="info.military.toYear"/></label>
					<spring:message code="info.text.to" var="to"/><br>
					<f:input path="militarytoYear" class="form-control" id="militarytoYear" name="militarytoYear" placeholder="${to}" type="text"></f:input><br>
		</div>
		<div class="col-sm-12 col-xs-3 col-md-3 col-lg-3">
					<label for="branchService"><spring:message code="info.branch.service"/></label>
					<spring:message code="info.text.branch" var="branch"/><br>
					<f:input path="branchService" class="form-control" id="branchService" name="branchService" placeholder="${branch}" type="text"></f:input><br>
		</div>
		<div class="col-sm-12 col-xs-3 col-md-3 col-lg-3">
					<label for="militaryPlace"><spring:message code="info.military.place"/></label>
					<spring:message code="info.text.military.place" var="militaryP"/><br>
					<f:input path="militaryPlace" class="form-control" id="militaryPlace" name="militaryPlace" placeholder="${militaryP}" type="text"></f:input><br>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12 col-xs-3 col-md-3 col-lg-3">
					<label for="serviceNo"><spring:message code="info.service.no"/></label>
					<spring:message code="info.text.military.service" var="militaryS"/><br>
					<f:input path="militaryServiceNo" class="form-control" id="militaryServiceNo" name="militaryServiceNo" placeholder="${militaryS}" type="text"></f:input><br>
				</div>
			</div>
		
</div>
<div id="militaryNo">
	<div class="row">
		<div class="col-sm-12 col-md-3 col-lg-3">
			<label for="reasons"><spring:message code="info.military.reason"/></label>
					<spring:message code="info.text.military.not" var="militaryN"/>
					<f:input path="militaryReason" class="form-control" id="militaryReason" name="militaryReason" placeholder="${militaryN}" type="text"></f:input>
		</div>
	</div>	
</div>
<div class="row">
				<div class="col-sm-12 col-xs-3 col-md-3 col-lg-3" id="drafted">
					<label for="dateToBeDrafted"><span class="glyphicon glyphicon-calendar"></span><spring:message code="info.military.date"/></label><br>
					<div class="input-group date" id="dateToBeDraft">
						<f:input path="dateToBeDrafted" id="dateToBeDrafted" name="dateToBeDrafted" class="form-control"></f:input><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
					</div>
					<br><label for="dateToBeDrafted" class="error"></label>
				</div>
		</div>
	<div class="row">
		<div class="col-sm-12 col-md-3 col-lg-3">
					<label for="knowAugmentis"><spring:message code="info.know.aug"/></label>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12 col-md-3 col-lg-3">
				
			<div class="checkbox">
				 <c:choose>
 					 <c:when test="${empty applicant.noticeNewspaper}">
						 <label><f:checkbox path="noticeNewspaper" id="noticeNewspaper" name="noticeNewspaper" value="Newspaper"></f:checkbox><br><spring:message code="info.newspaper"/></label>
						<div id="newspaper" style="display:none">
							<f:input path="noticeNewspaper" class="form-control" id="noticeNewspaper" name="noticeNewspaper" placeholder="Enter newspaper" type="text"></f:input>
						 </div>
 					 </c:when>
 					 <c:when test="${not empty applicant.noticeNewspaper}">
				  		<label><f:checkbox path="noticeNewspaper" id="noticeNewspaper" name="noticeNewspaper" value="Newspaper" checked="checked"></f:checkbox><br><spring:message code="info.newspaper"/></label> 
 						<div id="newspaper"> 
 							<f:input path="noticeNewspaper" class="form-control" id="noticeNewspaper" name="noticeNewspaper" placeholder="Enter newspaper" type="text"></f:input>
 						</div> 
					</c:when> 
					
 				</c:choose> 
			</div>
		</div>
			<div class="col-sm-12 col-md-3 col-lg-3">
				<div class="checkbox">
				 <c:choose>
					 <c:when test="${empty applicant.noticeMagazine}">
				 		 <label><f:checkbox path="noticeMagazine" id="noticeMagazine" name="noticeMagazine" value="Magazine"></f:checkbox><br><spring:message code="info.magazine"/></label>
						<div id="magazine" style="display:none">
							 <f:input path="noticeMagazine" class="form-control" id="noticeMagazine" name="noticeMagazine" placeholder="Enter magazine" type="text"></f:input>
						</div>
					</c:when>
					 <c:when test="${not empty applicant.noticeMagazine}">
					 <label><f:checkbox path="noticeMagazine" id="noticeMagazine" name="noticeMagazine" value="Magazine" checked="checked"></f:checkbox><br><spring:message code="info.magazine"/></label>
						<div id="magazine">
							 <f:input path="noticeMagazine" class="form-control" id="noticeMagazine" name="noticeMagazine" placeholder="Enter magazine" type="text"></f:input>
						</div>
					</c:when>
				</c:choose>
				</div>
			</div>
			<div class="col-sm-12 col-md-3 col-lg-3">
				<div class="checkbox">
				 <c:choose>
					 <c:when test="${empty applicant.noticeWebSite}">
			  		<label><f:checkbox path="noticeWebSite" id="noticeWebSite" name="noticeWebSite" value="Website"></f:checkbox><br><spring:message code="info.website"/></label>
			  		<div id="webSite" style="display:none">
			  			<f:input path="noticeWebSite" class="form-control" id="noticeWebSite" name="noticeWebSite" placeholder="Enter website" type="text"></f:input>
					</div>
				</c:when>
				 <c:when test="${not empty applicant.noticeWebSite}">
				 <label><f:checkbox path="noticeWebSite" id="noticeWebSite" name="noticeWebSite" value="Website" checked="checked"></f:checkbox><br><spring:message code="info.website"/></label>
			  		<div id="webSite">
			  			<f:input path="noticeWebSite" class="form-control" id="noticeWebSite" name="noticeWebSite" placeholder="Enter website" type="text"></f:input>
					</div>
				</c:when>
				</c:choose>
				</div>
			</div>
			<div class="col-sm-12 col-md-3 col-lg-3">
				<div class="checkbox">
				<c:choose>
					 <c:when test="${empty applicant.noticeFriend}">
			  		<label><f:checkbox path="noticeFriend" id="noticeFriend" name="noticeFriend" value="Friend"></f:checkbox><br><spring:message code="info.friend"/></label>
			  		<div id="friend" style="display:none">
			  			<f:input path="noticeFriend" class="form-control" id="noticeFriend" name="noticeFriend" placeholder="Enter friend" type="text"></f:input>
					</div>
				</c:when>
				 <c:when test="${not empty applicant.noticeFriend}">
				 	<label><f:checkbox path="noticeFriend" id="noticeFriend" name="noticeFriend" value="Friend" checked="checked"></f:checkbox><br><spring:message code="info.friend"/></label>
			  			<div id="friend">
			  			<f:input path="noticeFriend" class="form-control" id="noticeFriend" name="noticeFriend" placeholder="Enter friend" type="text"></f:input>
						</div>
					</c:when>
				</c:choose>
				</div>
			</div>
	</div>

<div class="row">
			<div class="col-sm-12 col-md-3 col-lg-3">
				<div class="checkbox">
				<c:choose>
					 <c:when test="${empty applicant.noticeOther}">
				  		<label><f:checkbox path="noticeOther" id="noticeOther" name="noticeOther" value="Other"></f:checkbox><br><spring:message code="info.other"/></label>
				  		<div id="other" style="display:none">
				  			<f:input path="noticeOther" class="form-control" id="noticeOther" name="noticeOther" placeholder="Enter other" type="text"></f:input>
						</div>
					</c:when>
					<c:when test="${not empty applicant.noticeOther}">
						<label><f:checkbox path="noticeOther" id="noticeOther" name="noticeOther" value="Other" checked="checked"></f:checkbox><br><spring:message code="info.other"/></label>
				  		<div id="other">
				  			<f:input path="noticeOther" class="form-control" id="noticeOther" name="noticeOther" placeholder="Enter other" type="text"></f:input>
						</div>
					</c:when>
				</c:choose>
				</div> 
			</div>
</div>
<div class="row" >
		<div class="col-sm-12 col-xs-3 col-md-3 col-lg-3">
					<label for="nowEmployed"><spring:message code="info.ask.company"/></label><br>
		</div>
</div>
<div class="row">
				<div class="col-sm-12 col-xs-3 col-md-3 col-lg-3">
					<div id="nowEmployedRadioButton">
								<f:radiobutton path="nowEmployed" id="nowEmployedYes" name="nowEmployed" value="Yes"></f:radiobutton><label><spring:message code="info.yes"/></label>
								<f:radiobutton path="nowEmployed" id="nowEmployedNo" name="nowEmployed" value="No"></f:radiobutton><label><spring:message code="info.no"/></label>
								<br><label for="nowEmployed" class="error"></label>
					</div>
				</div>
</div>
<div id="nowEmployedKnow">
<div class="row" >
		
			<div class="col-sm-12 col-xs-3 col-md-3 col-lg-3" >
						<label for="nameRelation"><spring:message code="info.write.yes"/></label>
				</div>
		
</div>
	<div class="row">
					<div class="col-sm-12 col-xs-3 col-md-3 col-lg-3" >
						<label for="employedName"><spring:message code="main.name"/></label>
						<spring:message code="info.text.name" var="name"/><br>
						<f:input path="employedName" class="form-control" id="employedName" name="employedName" placeholder="${name}" type="text"></f:input>
					</div>
					<div class="col-sm-12 col-xs-3 col-md-3 col-lg-3">
						<label for="employedPosition"><spring:message code="info.position"/></label>
						<spring:message code="exp.text.position" var="position"/><br>
						<f:input path="employedPosition" class="form-control" id="employedPosition" name="employedPosition" placeholder="${position}" type="text"></f:input>
					</div>
					<div class="col-sm-12 col-xs-3 col-md-3 col-lg-3">
						<label for="employedRelation"><spring:message code="info.relation"/> </label>
						<spring:message code="family.text.relation" var="relation"/><br>
						<f:input path="employedRelation" class="form-control" id="employedRelation" name="employedRelation" placeholder="${relation}" type="text"></f:input>
					</div>
		
				
			</div>
</div>
<div class="row">
	<div class="col-sm-12 col-xs-4 col-md-4 col-lg-4">
					<label for="emergency"><spring:message code="info.ask.case"/></label>
	</div>
</div>
	<div class="row">
			<div class="col-sm-12 col-xs-3 col-md-3 col-lg-3">
				<label for="emergencyOfName"><spring:message code="info.emergency.name"/></label>
				<spring:message code="info.text.emergency.name" var="emerName"/><br>
				<f:input path="emergencyName" class="form-control" id="emergencyName" name="emergencyName" placeholder="${emerName}" type="text"></f:input>
			</div>
			<div class="col-sm-12 col-xs-3 col-md-3 col-lg-3">
				<label for="emergencyTel"><spring:message code="info.emergency.tel"/></label>
				<spring:message code="info.text.emergency.tel" var="emerTel"/><br>
				<f:input path="emergencyTel" class="form-control" id="emergencyTel" name="emergencyTel" placeholder="${emerTel}" type="text"></f:input>
			</div>
		<div class="col-sm-12 col-xs-12 col-md-12 col-lg-12" >
				<label for="emergencyAddress"><spring:message code="info.emergency.address"/></label>
				<spring:message code="info.text.emergency.address" var="emerAddress"/><br>
					<f:input path="emergencyAddress" class="form-control" id="emergencyAddress" name="emergencyAddress" placeholder="${emerAddress}" type="text"></f:input>
		</div>			
	</div>
	
	<div class="row">
		<div class="col-sm-12 col-xs-9 col-md-9 col-lg-9" >
			<label for="previousEmployers"><spring:message code="info.ask.inquiry"/> </label>
		</div>
	</div>
<div class="row">
	<div class="col-sm-12 col-xs-3 col-md-3 col-lg-3" >
<!-- 			<div id="previousEmployers"> -->
				<div id="previousEmployersRadioButton">
						<f:radiobutton path="previousEmployers" id="previousEmployersYes" name="previousEmployers" value="Yes"></f:radiobutton><label><spring:message code="info.know"/></label>
						<f:radiobutton path="previousEmployers" id="previousEmployersNo" name="previousEmployers" value="No"></f:radiobutton><label><spring:message code="info.notKnow"/></label>
					<br><label for="previousEmployers" class="error"></label>
				</div>
<!-- 			</div> -->
	</div>
</div>
<div id="previousNo">
	<div class="row">
		<div class="col-sm-12 col-xs-4 col-md-4 col-lg-4" >
				<label for="Reason"><spring:message code="info.reason.no"/></label>
				<spring:message code="info.text.ask.not" var="askNot"/><br>
				<f:input path="previousEmployersReason" class="form-control" id="previousEmployersReason" name="previousEmployersReason" placeholder="${askNot}" type="text"></f:input>
		
		</div>
	</div>
</div>
<div class="row">

		  <div class="col-sm-12 col-xs-6 col-md-6 col-lg-6">
<%-- 			<label for="file"><spring:message code="info.resume"/></label><br> --%>
<!-- 			<span class="btn btn-warning btn-file"><span class="glyphicon glyphicon-plus"></span> Resume <input id="resumeMultipartFile" name="resumeMultipartFile" type="file" accept="image/*" class="file"/></span> -->

			<label class="resume">
    			<input type="file" id="resumeMultipartFile" name="resumeMultipartFile" type="file" accept="image/*" class="file" required/>
    			<span>Resume</span>
			</label>
			<f:hidden path="resume"/>
		<c:choose>
 			<c:when test="${not empty applicant.resume}">
 					<a href="${pageContext.request.contextPath}/dowloadResume/${applicant.id}" id="resume">Click and download ${applicant.resume} here</a>
	    	</c:when>
	    </c:choose>
	    </div>
	      <div class="col-sm-12 col-xs-6 col-md-6 col-lg-6">
<%-- 			<label for="file"><spring:message code="info.transcript"/></label><br> --%>
<!-- 				<span class="btn btn-warning btn-file"><span class="glyphicon glyphicon-plus"></span> Transcript <input id="transcriptMultipartFile" name="transcriptMultipartFile" type="file" accept="image/*" class="file"/></span> -->
			<label class="transcript">
    			<input id="transcriptMultipartFile" name="transcriptMultipartFile" type="file" accept="image/*" class="file" required/>
    			<span>Transcript</span>
			</label>
			<f:hidden path="transcript"/>
		<c:choose>
			<c:when test="${not empty applicant.transcript}">
 					<a href="${pageContext.request.contextPath}/dowloadTranscript/${applicant.id}" id="transcript">Click and transcript ${applicant.transcript} here</a>
	    	</c:when>
	      </c:choose>
		</div>
	</div>
<h3 id="official">OFFICIAL</h3>
<!-- 			<div class="form-group"> -->
			<div class="row">
				<div class="col-sm-12 col-xs-4 col-md-4 col-lg-4" >
					<label for="applyDate"><span class="glyphicon glyphicon-calendar"></span><spring:message code="info.apply.date"/></label><br>
					<div class="input-group date" id="applyDay">
						<f:input path="applyDate" id="applyDate" name="applyDate" class="form-control"></f:input><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>							
					</div>
						<br><label for="applyDate" class="error"></label>
				</div>
				<div class="col-sm-12 col-xs-4 col-md-4 col-lg-4" >
						<label for="salary"><spring:message code="info.salary"/></label>
						<spring:message code="info.text.salary" var="salary"/><br>
						<f:input path="expectedSalary" class="form-control" id="expectedSalary" name="expectedSalary" placeholder="${salary}" type="text"></f:input>
				</div>
		 </div>
	
<!-- 		 <div class="form-group"> -->
		 <div class="row">
			<div class="col-sm-12 col-xs-4 col-md-4 col-lg-4" >
				<label for="position1"><spring:message code="main.position1"/></label><br>
				 <div id="positionFirst">
					 <f:select path="position1.id" id="position1" name="position1" class="form-control">
						<f:option value="-1" label="please select data"/>
						<c:forEach var="positionList" items="${positions}">
							<f:option value="${positionList.id}">${positionList.positionName}</f:option>
						</c:forEach> 
					</f:select>  
				</div>
			</div>
			<div class="col-sm-12 col-xs-4 col-md-4 col-lg-4" >
				<label for="position2"><spring:message code="main.position2"/> </label><br>
				 <div id="positionSecond">
					 <f:select path="position2.id" id="position2" name="position2" class="form-control">
						<f:option value="-1" label="please select data"/>
						<c:forEach var="positionList" items="${positions}">
							<f:option value="${positionList.id}">${positionList.positionName}</f:option>
						</c:forEach> 
					</f:select> 
				</div>
			</div>
			<div class="col-sm-12 col-xs-4 col-md-4 col-lg-4" >
				<label for="position3"><spring:message code="main.position3"/></label><br>
				<div id="positionThird">
					<f:select path="position3.id" id="position3" name="position3" class="form-control">
						<f:option value="-1" label="please select data"/>
						<c:forEach var="positionList" items="${positions}">
							<f:option value="${positionList.id}">${positionList.positionName}</f:option>
						</c:forEach> 
					</f:select>
				</div>
			</div>
		</div>
			<div align="right">
				<button type="submit" id="buttonSave" name="buttonSave" class="btn btn-warning" ><span class="glyphicon glyphicon-save"></span> <spring:message code="edit.button.save"/></button>
				<button type="button" class="btn btn-default" id="buttonBack" name="buttonBack" onclick="window.location='${pageContext.request.contextPath}/applicant'"><span class="glyphicon glyphicon-step-backward"></span> Back </button>
			</div>
	</f:form>
</div>
