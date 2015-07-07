<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
 	$(document).ready(function() {
			$('.input-group.date').datepicker({startView : 2,
 							todayBtn : "linked",
 							format : "dd/mm/yyyy"

 						});
			 $("#tel").mask("(999) 999-9999");
			 $("#emergencyTel").mask("(999) 999-9999");
			 $("#cardId").mask("9999-9999-9999-9");
			 $("#imageMultipartFile").on("change", function()
					    {
					        var files = !!this.files ? this.files : [];
					        if (!files.length || !window.FileReader) return; // no file selected, or no FileReader support
					        if (/^image/.test( files[0].type)){ // only image file
					            var reader = new FileReader(); // instance of the FileReader
					            reader.readAsDataURL(files[0]); // read the local file
					            reader.onloadend = function(){ // set image data as background of div
					            	
					                $("#imagePreview").css("background-image", "url("+this.result+")");
			   	              }
					        }
					        
					    });
			/*  $("#imageMultipartFile").fileinput({showUpload: false, maxFileCount: 10, mainClass: "input-group-sm"});
			 $("#resumeMultipartFile").fileinput({showUpload: false, maxFileCount: 10, mainClass: "input-group-sm"});
			 $("#transcriptMultipartFile").fileinput({showUpload: false, maxFileCount: 10, mainClass: "input-group-sm"}); */
			 $('#informationApplicant').validate({
				rules : {
					firstNameTH : {
						required : true
						},
					lastNameTH : {
						required : true
						},
					nickNameTH : {
						required : true
						},
					firstNameEN : {
						required : true
						},
					lastNameEN : {
						required : true
						},
					nickNameEN : {
						required : true
						},
					tel : {
						required : true
						},
					email : {
						required : true,
						email : true
						},
					birthDate : {
						required : true
					},
					placeBirth : {
						required : true
					},
					age : {
						required : true
					},
					religion : {
						required : true
					},
					nationality : {
						required : true
					},
					cardId : {
						required : true
					},
					cardIssuedOffice : {
						required : true
					},
					cardExpiryDate : {
						required : true
					},
					height : {
						required : true
					},
					weight : {
						required : true
					},
					sex : {
						required : true
					},
					applicantStatus : {
						required : true
					},
					numberOfChildren : {
						required : true
					},
					spouseName : {
						required : true
					},
					marriageCertificateNo : {
						required : true
					},
					issueOficeMarriage : {
						required : true
					},
					marriageAddress : {
						required : true
					},
					occupationMarriage : {
						required : true
					},
					militaryStatus : {
						required : true
					},
					militaryFromYear : {
						required : true
					},
					militarytoYear : {
						required : true
					},
					branchService : {
						required : true
					},
					militaryPlace : {
						required : true
					},
					militaryServiceNo : {
						required : true
					},
					militaryReason : {
						required : true
					},
					dateToBeDrafted : {
						required : true
					},
					previousEmployers : {
 						required : true
 					},
 					previousEmployersReason : {
 						required : true
 					},emergencyName : {
 						required : true
 					},
 					emergencyTel : {
 						required : true
 					},
 					emergencyAddress : {
 						required : true
 					},
 					applyDate : {
 						required : true
 					}, 
 					department : {
 						required : true
 					},
 					positionFirstName : {
 						required : true
 					},
 					position2 : {
 						required : true
 					},
 					position3 : {
 						required : true
 					}, 
 					expectedSalary : {
 						required : true
 					},
 					nowEmployed : {
 						required : true
 					},
 					employedName : {
 						required : true
 					},
 					employedPosition : {
 						required : true
 					},
 					employedRelation : {
 						required : true
 					}
				},
				messages : {
					firstNameTH : {
						required : "Firstname Thai is required!"
					},
					lastNameTH : {
						required : "Lastname Thai is required"
					},
					nickNameTH : {
						required : "Nickname Thai is required!"
					},
					firstNameEN : {
						required : "Firstname English is required!"
					},
					lastNameEN : {
						required : "Lastname English is required!"
					},
					nickNameEN : {
						required : "Nickname English is required!"
					},
					tel : {
						required : "Tel. is required!"
					},
					email : {
						required : "E-Mail is required!",      
					},
					birthDate : {
						required : "Birthday is required!"
					},
					placeBirth : {
						required : "Place of birth is required!"
					},
					age : {
						required : "Age is required!"
					},
					religion : {
						required : "Religion is required!"
					},
					nationality : {
						required : "Nationality is required!"
					},
					cardId : {
						required : "ID. Card no. is required!"
					},
					cardIssuedOffice : {
						required : "Issued office is required!"
					},
					cardExpiryDate : {
						required : "Expiry date is required!"
					},
					height : {
						required : "Height is required!"
					},
					weight : {
						required : "Weight is required!"
					},
					sex : {
						required : "Sex is required!"
					},
					applicantStatus : {
						required : "Marital status is required!"
					},
					numberOfChildren : {
						required : "Number of children is required!"
					},spouseName : {
						required : "Spouse: Name is required!"
					},
					marriageCertificateNo : {
						required : "Marriage certificate No. is required!"
					},
					issueOficeMarriage : {
						required : "Issued office is required!"
					},
					marriageAddress : {
						required : "Address is required!"
					},
					occupationMarriage : {
						required : "Occupation is required!"
					},
					militaryStatus : {
						required : "Military service is required!"
					},
					militaryFromYear : {
						required : "From year is required!"
					},
					militarytoYear : {
						required : "To year is required!"
					},
					branchService : {
						required : "Branch of service is required!"
					},
					militaryPlace : {
						required : "Military place is required!"
					},
					militaryServiceNo : {
						required : "Service No. is required!"
					},
					militaryReason : {
						required : "Reasons is required!"
					},
					dateToBeDrafted : {
						required : "Date to be drafted is required!"
					},emergencyName : {
						required : "Emergency Name is required!"
					},
					emergencyTel : {
						required : "Emergency Telephone is required!"
					},
					emergencyAddress : {
						required : "Emergency Address is required!"
					},applyDate : {
						required : "Apply date is required!"
					} ,
					department : {
						required : "Department is required!"
					},
					position1 : {
						required : "Position 1 is required!"
					},
					position2 : {
						required : "Position 2 is required!"
					},
					position3 : {
						required : "Position 3 is required!"
					} ,
					expectedSalary : {
						required : "Salary expected is required!"
					},
					nowEmployed : {
						required : "Do you know anyone now being employed by this company? is required!"
					},
					employedName : {
						required : "Name is required!"
					},
					employedPosition : {
						required : "Position is required!"
					},
					employedRelation : {
						required : "Relation is required!"
					},
					previousEmployers : {
 						required :  "previous employers is required!"
 					},
 					previousEmployersReason : {
 						required :  "Reason is required!"
 					}
					
				}
			});

			
			
});

</script>
<jsp:include page="applicationMenu.jsp" />
<!-- tab informations -->
<c:choose>
		<c:when test="${applicant.id ne null}">
			<c:set var="actionName">infoEdit/${applicant.id}</c:set>
		</c:when>
		<c:otherwise>
			<c:set var="actionName">saveInformations</c:set>
		</c:otherwise>
	</c:choose>

<f:form id="informationApplicant" name="informationApplicant" action="${pageContext.request.contextPath}/${actionName}"
		modelAttribute="applicant" method="post" enctype="multipart/form-data" class="form-inline" >
		<f:hidden path="id" />
	<div class="row">
		<div class="col-md-6">
			 <div class="form-group">
			 	<spring:message code="info.photograph"/><br><br>
	<c:choose>
		<c:when test="${empty applicant.image}">
						<div  id="imagePreview" class="img-rounded img-responsive" style="background-image:url('${pageContext.request.contextPath}/static/decorators/noPhotoAvailable-resize.jpg')"></div>
 		</c:when>
 		<c:when test="${not empty applicant.image}">
 						<div id="imagePreview" class="img-rounded img-responsive" style="background-image:url('${pageContext.request.contextPath}/DisplayImageServlet?namespace=APPLICANT&fileName=${applicant.image}');"></div>
	</c:when>
	</c:choose>
			 	<br><br>
				<input id="imageMultipartFile" name="imageMultipartFile"  type="file" accept="image/*" />
				<f:hidden path="image" />
			</div>
	<f:hidden path="trackingStatus" />
 		<%--  <div class="form-group">
				<spring:message code="info.photograph"/> 
				<input id="imageMultipartFile" name="imageMultipartFile" type="file" class="file" accept="image/gif,image/jpeg,image/png"></input>
				<br><br>
		</div>  --%>
		<br>
		<br>
			<div class="form-group">
				<label for="firstNameTh"><spring:message code="info.firstname.th"/> </label>
				<spring:message code="info.text.first.th" var="firstname"/>
<%-- 				<f:input path="firstNameTH" id="firstNameTH" name="firstNameTH" placeholder="Enter Firstname(TH)" class="form-control" ></f:input> --%>
				<f:input path="firstNameTH" id="firstNameTH" name="firstNameTH" placeholder="${firstname}" class="form-control" ></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="lastnameTh"><spring:message code="info.lastname.th"/> </label>
				<spring:message code="info.text.last.th" var="lastname"/>
				<f:input path="lastNameTH" id="lastNameTH" name="lastNameTH" placeholder="${lastname}" class="form-control" ></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="nickNameTh"><spring:message code="info.nickname.th"/> </label>
				<spring:message code="info.text.nick.th" var="nickname"/>
				<f:input path="nickNameTH" id="nickNameTH" name="nickNameTH" placeholder="${nickname}" class="form-control" ></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="firstNameEng"><spring:message code="info.firstname.en"/> </label>
				<spring:message code="info.text.first.en" var="firstnameEn"/>
				 <f:input path="firstNameEN" id="firstNameEN" name="firstNameEN" placeholder="${firstnameEn}" class="form-control" ></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="lastnameEng"><spring:message code="info.lastname.en"/> </label>
				<spring:message code="info.text.last.en" var="lastnameEn"/>
				<f:input path="lastNameEN" id="lastNameEN" name="lastNameEN" placeholder="${lastnameEn}" class="form-control"></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="nickNameEng"><spring:message code="info.nickname.en"/> </label> 
				<spring:message code="info.text.nick.en" var="nicknameEn"/>
				<f:input path="nickNameEN" id="nickNameEN" name="nickNameEN" class="form-control" placeholder="${nicknameEn}"></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="tel"><spring:message code="info.tel"/> </label> 
				<spring:message code="info.text.tel" var="tel"/>
				<f:input path="tel" id="tel" name="tel" placeholder="${tel}" class="form-control" ></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="eMail"><spring:message code="info.email"/> </label> 
				<spring:message code="info.text.email" var="email"/>
				<f:input path="email" id="email" name="email" type="email" placeholder="${email}" class="form-control" ></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="birthday"><span
					class="glyphicon glyphicon-calendar"></span> <spring:message code="info.birthday"/></label>
				<div class="input-group date">
					<f:input path="birthDate" id="birthDate" name="birthDate" class="form-control"></f:input><span class="input-group-addon"><i
						class="glyphicon glyphicon-th"></i></span>
				</div>

			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="pBirth"><spring:message code="info.place.birth"/> </label> 
				<spring:message code="info.text.birth" var="pBirth"/>
				<f:input path="placeBirth" id="placeBirth" name="placeBirth" class="form-control" placeholder="${pBirth}"></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="age"><spring:message code="info.age"/> </label> 
				<spring:message code="info.text.age" var="age"/>
				<f:input path="age" id="age" name="age" class="form-control" placeholder="${age}"></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="religion"><spring:message code="info.religion"/> </label>
				<spring:message code="info.text.religion" var="religion"/> 
				<f:input path="religion" id="religion" name="religion" class="form-control" placeholder="${religion}"></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="nationality"><spring:message code="info.nationality"/> </label> 
				<spring:message code="info.text.nationality" var="nationality"/>
				<f:input path="nationality" id="nationality" name="nationality" class="form-control" placeholder="${nationality}"></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="cardId"><spring:message code="info.id.card"/> </label> 
				<spring:message code="info.text.card" var="card"/>
				<f:input path="cardId" id="cardId" name="cardId" class="form-control" placeholder="${card}"></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="cardIssuedOffice"><spring:message code="info.issue.office"/> </label> 
				<spring:message code="info.text.issued" var="issued"/>
				<f:input path="cardIssuedOffice" name="cardIssuedOffice" id="cardIssuedOffice" class="form-control" placeholder="${issued}"></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="cardExpiryDate"><span
					class="glyphicon glyphicon-calendar"></span><spring:message code="info.expiration.date"/> </label>
				<div class="input-group date">
					<f:input path="cardExpiryDate" id="cardExpiryDate" name="cardExpiryDate" class="form-control"></f:input><span class="input-group-addon"><i
						class="glyphicon glyphicon-th"></i></span>
				</div>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="height"><spring:message code="info.height"/> </label> 
				<spring:message code="info.text.height" var="height"/>
				<f:input path="height" class="form-control" id="height" name="height" placeholder="${height}"></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="weight"><spring:message code="info.weight"/> </label> 
				<spring:message code="info.text.weight" var="weight"/>
				<f:input path="weight" class="form-control" id="weight" name="weight" placeholder="${weight}"></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label> <spring:message code="info.sex"/></label>
				<f:radiobutton path="sex" value="Female" name="sex" id="sex"></f:radiobutton><label> <spring:message code="info.female"/></label>
				<f:radiobutton path="sex" value="Male" name="sex" id="sex"></f:radiobutton><label> <spring:message code="info.male"/></label>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="applicantStatus"><spring:message code="info.marriage.status"/> </label>  
				<f:radiobutton path="applicantStatus" id="applicantStatus" name="applicantStatus" value="Single"></f:radiobutton><label> <spring:message code="info.single"/></label>
				<f:radiobutton path="applicantStatus" id="applicantStatus" name="applicantStatus" value="Married"></f:radiobutton><label> <spring:message code="info.married"/></label>
				<f:radiobutton path="applicantStatus" id="applicantStatus" name="applicantStatus" value="Divorced"></f:radiobutton><label> <spring:message code="info.divorced"/></label>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="children"><spring:message code="info.number.child"/> 
				<spring:message code="info.text.children" var="children"/>
				</label> <f:input path="numberOfChildren" class="form-control" id="numberOfChildren" name="numberOfChildren" placeholder="${children}"></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="spouseName"><spring:message code="info.spouseName"/> </label> 
				<spring:message code="info.text.spouse" var="spouse"/>
				<f:input path="spouseName" class="form-control" id="spouseName" name="spouseName" placeholder="${spouse}"></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="marriageCertificateNo"><spring:message code="info.marriage.certifate"/> </label> 
				<spring:message code="info.text.marriage" var="marryNo"/>
				<f:input path="marriageCertificateNo" class="form-control" id="marriageCertificateNo" 
					name="marriageCertificateNo" placeholder="${marryNo}"></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="issueOficeMarriage"><spring:message code="info.issue.title"/> </label> 
				<f:input path="issueOficeMarriage" class="form-control" id="issueOficeMarriage"
					name="issueOficeMarriage" placeholder="${issued}"></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="marriageAddress"><spring:message code="info.address.title"/> </label> 
				<spring:message code="info.text.address" var="address"/>
				<f:textarea path="marriageAddress" class="form-control" rows="5" id="marriageAddress" name="marriageAddress"
					placeholder="${address}"></f:textarea>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="occupationMarriage"><spring:message code="info.occupation.title"/> </label> 
				<spring:message code="info.text.occupation" var="occupation"/>
				<f:input path="occupationMarriage" class="form-control" id="occupationMarriage" name="occupationMarriage"
					placeholder="${occupation}"></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="military"><spring:message code="info.military.ask"/> </label>
				<f:radiobutton path="militaryStatus" id="militaryStatus" name="militaryStatus" value="Yes"></f:radiobutton><label> <spring:message code="info.yes"/></label>
				<f:radiobutton path="militaryStatus" id="militaryStatus" name="militaryStatus" value="No"></f:radiobutton><label> <spring:message code="info.no"/></label>
				</div>
			<br>
			<br>
				<div class="form-group">
					<label for="militaryComplete"><spring:message code="info.military.yes"/> </label> 
					<label for="militaryFromYear"><spring:message code="info.military.fromYear"/> </label> 
					<spring:message code="info.text.from" var="from"/>
					<f:input path="militaryFromYear" class="form-control" id="militaryFromYear"
						name="militaryFromYear" placeholder="${from}"></f:input>
				</div>
			<br>
			<br>
				<div class="form-group">
					<label for="militarytoYear"><spring:message code="info.military.toYear"/> </label> 
					<spring:message code="info.text.to" var="to"/>
					<f:input path="militarytoYear" class="form-control" id="militarytoYear" name="militarytoYear"
						placeholder="${to}"></f:input>
				</div>
			<br>
			<br>
				<div class="form-group">
					<label for="branchService"><spring:message code="info.branch.service"/> </label> 
					<spring:message code="info.text.branch" var="branch"/>
					<f:input path="branchService" class="form-control" id="branchService" name="branchService"
						placeholder="${branch}"></f:input>
				</div>
			<br>
			<br>
				<div class="form-group">
					<label for="militaryPlace"><spring:message code="info.military.place"/> </label> 
					<spring:message code="info.text.military.place" var="militaryP"/>
					<f:input path="militaryPlace" class="form-control" id="militaryPlace" name="militaryPlace"
						placeholder="${militaryP}"></f:input>
				</div>
			<br>
			<br>
				<div class="form-group">
					<label for="serviceNo"><spring:message code="info.service.no"/> </label> 
					<spring:message code="info.text.military.service" var="militaryS"/>
					<f:input path="militaryServiceNo" class="form-control" id="militaryServiceNo" name="militaryServiceNo"
						placeholder="${militaryS}"></f:input>
				</div>
			<br>
			<br>
				<div class="form-group">
					<label for="reasons"><spring:message code="info.military.reason"/> </label> 
					<spring:message code="info.text.military.not" var="militaryN"/>
					<f:input path="militaryReason" class="form-control" id="militaryReason" name="militaryReason"
						placeholder="${militaryN}"></f:input>
				</div>
			<br>
			<br>
				<div class="form-group">
					<label for="dateToBeDrafted"><span
						class="glyphicon glyphicon-calendar"></span><spring:message code="info.military.date"/> </label>
					<div class="input-group date">
						<f:input path="dateToBeDrafted" id="dateToBeDrafted" name="dateToBeDrafted" class="form-control"></f:input><span class="input-group-addon"><i
							class="glyphicon glyphicon-th"></i></span>
					</div>
				</div>
			</div>
		</div>

			<br>
			<br>
	<div class="row">
		<div class="col-md-6">
			<label for="applyDate"><span class="glyphicon glyphicon-calendar"></span><spring:message code="info.apply.date"/></label>
			<div class="input-group date">
				<f:input path="applyDate" id="applyDate" name="applyDate"
					class="form-control"></f:input><span class="input-group-addon"><i
					class="glyphicon glyphicon-th"></i></span>
			</div>
			<br>
			<br>
			<div class="form-group">
			</div>
			<br>
			<br>
			<div class="form-group">

				<label for="position1"><spring:message code="main.position1"/> </label>
				<spring:message code="info.select.data" var="select"/>
				    <f:select path="position1" id="position1" name="position1" class="form-control">
					<f:option value="-1" label="${select}"/>
					<c:forEach var="positionList" items="${positions}">
						<f:option value="${positionList.id}">${positionList.positionName}</f:option>
					</c:forEach> 
				</f:select> 
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="position2"><spring:message code="main.position2"/> </label> 
				<f:select path="position2" id="position2" name="position2" class="form-control">
					<f:option value="-1" label="${select}"/>
					<c:forEach var="positionList" items="${positions}">
						<f:option value="${positionList.id}">${positionList.positionName}</f:option>
					</c:forEach> 
				</f:select>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="position3"><spring:message code="main.position3"/> </label>
				<f:select path="position3" id="position3" name="position3" class="form-control">
					<f:option value="-1" label="${select}"/>
					<c:forEach var="positionList" items="${positions}">
						<f:option value="${positionList.id}">${positionList.positionName}</f:option>
					</c:forEach> 
				</f:select>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="salary"><spring:message code="info.salary"/> </label> 
				<spring:message code="info.text.salary" var="salary"/>
				<f:input path="expectedSalary"
					class="form-control" id="expectedSalary" name="expectedSalary"
					placeholder="${salary}"></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="knowAugmentis"><spring:message code="info.know.aug"/></label> <br>
				 <div class="checkbox">
			  		<label><f:checkbox path="noticeNewspaper" 
					id="noticeNewspaper" name="noticeNewspaper" value="Newspaper" ></f:checkbox><spring:message code="info.newspaper"/></label>
					<spring:message code="info.text.newspaper" var="newspaper"/>
					<f:input path="noticeNewspaper" class="form-control" id="noticeNewspaper"
						name="notice" placeholder="${newspaper}"></f:input>
				</div>
				<br>
				<br>
				<div class="checkbox">
			 		 <label><f:checkbox path="noticeMagazine" id="noticeMagazine" name="noticeMagazine" value="Magazine"></f:checkbox><spring:message code="info.magazine"/></label>
					<spring:message code="info.text.magazine" var="magazine"/>
					<f:input path="noticeMagazine" class="form-control" id="noticeMagazine"
						name="notice" placeholder="${magazine}"></f:input>
				</div>
				<br>
				<br>
				<div class="checkbox">
			  		<label><f:checkbox path="noticeWebSite" id="noticeWebSite" name="noticeWebSite" value="Website"></f:checkbox><spring:message code="info.website"/></label>
			  		<spring:message code="info.text.website" var="website"/>
			  		<f:input path="noticeWebSite" class="form-control" id="noticeWebSite"
						name="notice" placeholder="${website}"></f:input>
				</div>
				<br>
				<br>
				<div class="checkbox">
			  		<label><f:checkbox path="noticeFriend" id="noticeFriend" name="noticeFriend" value="Friend"></f:checkbox><spring:message code="info.friend"/></label>
					<spring:message code="info.text.friend" var="friend"/>
			  		<f:input path="noticeFriend" class="form-control" id="noticeFriend"
						name="notice" placeholder="${friend}"></f:input>
				</div>
				<br>
				<br>
				<div class="checkbox">
			  		<label><f:checkbox path="noticeOther" id="noticeOther" name="noticeOther" value="Other"></f:checkbox><spring:message code="info.other"/> </label>
			  		<spring:message code="info.text.other" var="other"/>
			  		<f:input path="noticeOther" class="form-control" id="noticeOther" name="noticeOther" placeholder="${other}"></f:input>
				</div> 
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="nowEmployed"><spring:message code="info.ask.company"/> </label><br><br>
				<f:radiobutton path="nowEmployed" id="nowEmployed" name="nowEmployed" value="Yes"></f:radiobutton><label> <spring:message code="info.yes"/></label>
				<f:radiobutton path="nowEmployed" id="nowEmployed" name="nowEmployed" value="No"></f:radiobutton><label> <spring:message code="info.no"/></label>
				<br> 
				<br>
				<div class="form-group">
					<label for="nameRelation"><spring:message code="info.write.yes"/> </label><br><br>
					<label for="employedName"><spring:message code="main.name"/> </label>
					<spring:message code="info.text.name" var="name"/>
					<f:input path="employedName" class="form-control" id="employedName"
						name="employedName" placeholder="${name}"></f:input>
						<br>
						<br>
					<label for="employedPosition"><spring:message code="info.position"/> </label>
					<spring:message code="exp.text.position" var="position"/>
					<f:input path="employedPosition" class="form-control" id="employedPosition" name="employedPosition" placeholder="${position}"></f:input>
						<br>
						<br>
					<label for="employedRelation"><spring:message code="info.relation"/> </label>
					<spring:message code="family.text.relation" var="relation"/>
					<f:input path="employedRelation" class="form-control" id="employedRelation" name="employedRelation" placeholder="${relation}"></f:input>
				</div>
			</div>
				<br>
				<br>
			<label for="emergency"><spring:message code="info.ask.case"/> </label>
				<br>
				<br>
			<div class="form-group">
				<label for="emergencyOfName"><spring:message code="info.emergency.name"/> </label> 
				<spring:message code="info.text.emergency.name" var="emerName"/>
				<f:input path="emergencyName" class="form-control" id="emergencyName"
					name="emergencyName" placeholder="${emerName}"></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="emergencyTel"><spring:message code="info.emergency.tel"/> </label> 
				<spring:message code="info.text.emergency.tel" var="emerTel"/>
				<f:input path="emergencyTel" class="form-control" id="emergencyTel"
					name="emergencyTel" placeholder="${emerTel}"></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="emergencyAddress"><spring:message code="info.emergency.address"/> </label>
				<spring:message code="info.text.emergency.address" var="emerAddress"/>
					<f:textarea path="emergencyAddress" class="form-control" rows="5" id="emergencyAddress"
					name="emergencyAddress" placeholder="${emerAddress}"></f:textarea>
					
			</div>
		<br>
		<br>			
		<div class="form-group">
		<label for="previousEmployers"><spring:message code="info.ask.inquiry"/> </label>
			<br>
			<br>
		<f:radiobutton path="previousEmployers" id="previousEmployers" name="previousEmployers" value="Yes"></f:radiobutton><label> <spring:message code="info.yes"/></label>
		<f:radiobutton path="previousEmployers" id="previousEmployers" name="previousEmployers" value="No"></f:radiobutton><label> <spring:message code="info.no"/></label>
		
		<br>
		<br>
		<div class="form-group">

			<label for="previousEmployersReason"><spring:message code="info.reason.no"/> </label>
			<spring:message code="info.text.ask.not" var="askNot"/>
				<f:textarea path="previousEmployersReason" class="form-control" rows="5" id="previousEmployersReason"
					name="previousEmployersReason" placeholder="${askNot}"></f:textarea>
		</div>
	</div>
		<br>
		<br>
		
		  <div class="form-group">
			<label for="file"><spring:message code="info.resume"/></label> 
			<input type="file" id="resumeMultipartFile" name="resumeMultipartFile" class="file"/>
			<f:hidden path="resume" />
			<br>
		<c:choose>
 			<c:when test="${not empty applicant.resume}">
 					<a href="${pageContext.request.contextPath}/dowloadResume/${applicant.id}">Click and download ${applicant.resume} here</a>
	    	</c:when>
	    </c:choose>
	   		 <br>
			<label for="file"><spring:message code="info.transcript"/></label> 
				<input type="file" id="transcriptMultipartFile" name="transcriptMultipartFile" class="file"/>
				<f:hidden path="transcript" />
			<br>
		<c:choose>
			<c:when test="${not empty applicant.transcript}">
 					<a href="${pageContext.request.contextPath}/dowloadTranscript/${applicant.id}">Click and transcript ${applicant.transcript} here</a>
	    	</c:when>
	      </c:choose>
		</div>
			<br>
			<br>
		<button type="submit"  id="buttonSave" class="btn btn-success"><span class="glyphicon glyphicon-off"></span> <spring:message code="edit.button.save"/></button>
			
 	</div>
 </div>
</f:form>
