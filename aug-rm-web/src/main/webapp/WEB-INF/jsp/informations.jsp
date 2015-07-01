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
				<f:input path="firstNameTH" id="firstNameTH" name="firstNameTH" placeholder="Enter Firstname(TH)" class="form-control" ></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="lastnameTh"><spring:message code="info.lastname.th"/> </label>
				<f:input path="lastNameTH" id="lastNameTH" name="lastNameTH" placeholder="Enter lastname(TH)" class="form-control" ></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="nickNameTh"><spring:message code="info.nickname.th"/> </label>
				<f:input path="nickNameTH" id="nickNameTH" name="nickNameTH" placeholder="Enter nickname(TH)" class="form-control" ></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="firstNameEng"><spring:message code="info.firstname.en"/> </label>
				 <f:input path="firstNameEN" id="firstNameEN" name="firstNameEN" placeholder="Enter Firstname(ENG)" class="form-control" ></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="lastnameEng"><spring:message code="info.lastname.en"/> </label> 
				<f:input path="lastNameEN" id="lastNameEN" name="lastNameEN" placeholder="Enter lastname(ENG)" class="form-control"></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="nickNameEng"><spring:message code="info.nickname.en"/> </label> 
				<f:input path="nickNameEN" id="nickNameEN" name="nickNameEN" class="form-control" placeholder="Enter nickname(Eng)"></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="tel"><spring:message code="info.tel"/> </label> <f:input path="tel" id="tel" name="tel" placeholder="Enter tel" class="form-control" ></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="eMail"><spring:message code="info.email"/> </label> <f:input path="email" id="email" name="email" type="email" placeholder="Enter E-Mail" class="form-control" ></f:input>
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
				<label for="pBirth"><spring:message code="info.place.birth"/> </label> <f:input path="placeBirth" id="placeBirth" name="placeBirth"
					class="form-control" placeholder="Enter place of birth"></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="age"><spring:message code="info.age"/> </label> <f:input path="age" id="age" name="age" class="form-control"
					placeholder="Enter age"></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="religion"><spring:message code="info.religion"/> </label> <f:input path="religion" id="religion" name="religion"
					class="form-control" placeholder="Enter religion"></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="nationality"><spring:message code="info.nationality"/> </label> <f:input path="nationality" id="nationality" name="nationality"
					class="form-control" placeholder="Enter nationality"></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="cardId"><spring:message code="info.id.card"/> </label> <f:input path="cardId" id="cardId" name="cardId" class="form-control" 
					placeholder="Enter ID. Card no."></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="cardIssuedOffice"><spring:message code="info.issue.office"/> </label> <f:input path="cardIssuedOffice" name="cardIssuedOffice" id="cardIssuedOffice" class="form-control" 
					placeholder="Enter issued office"></f:input>
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
				<label for="height"><spring:message code="info.height"/> </label> <f:input path="height" class="form-control" id="height" name="height" 
					placeholder="Enter height (cms)"></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="weight"><spring:message code="info.weight"/> </label> <f:input path="weight" class="form-control" id="weight" name="weight" placeholder="Enter weight (kgs)"></f:input>
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
				<label for="children"><spring:message code="info.number.child"/> </label> <f:input path="numberOfChildren" class="form-control" id="numberOfChildren" name="numberOfChildren" placeholder="Enter number of children"></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="spouseName"><spring:message code="info.spouseName"/> </label> <f:input path="spouseName" class="form-control" id="spouseName" name="spouseName" placeholder="Enter spouse: name"></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="marriageCertificateNo"><spring:message code="info.marriage.certifate"/> </label> <f:input path="marriageCertificateNo" class="form-control" id="marriageCertificateNo"
					name="marriageCertificateNo" placeholder="Enter marriage certificate No."></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="issueOficeMarriage"><spring:message code="info.issue.title"/> </label> <f:input path="issueOficeMarriage" class="form-control" id="issueOficeMarriage"
					name="issueOficeMarriage" placeholder="Enter Issued office"></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="marriageAddress"><spring:message code="info.address.title"/> </label> <f:textarea path="marriageAddress" class="form-control" rows="5" id="marriageAddress" name="marriageAddress"
					placeholder="Enter address"></f:textarea>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="occupationMarriage"><spring:message code="info.occupation.title"/> </label> <f:input path="occupationMarriage" class="form-control" id="occupationMarriage" name="occupationMarriage"
					placeholder="Enter occupation"></f:input>
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
					<f:input path="militaryFromYear" class="form-control" id="militaryFromYear"
						name="militaryFromYear" placeholder="Enter from year"></f:input>
				</div>
			<br>
			<br>
				<div class="form-group">
					<label for="militarytoYear"><spring:message code="info.military.toYear"/> </label> <f:input path="militarytoYear" class="form-control" id="militarytoYear" name="militarytoYear"
						placeholder="Enter to year"></f:input>
				</div>
			<br>
			<br>
				<div class="form-group">
					<label for="branchService"><spring:message code="info.branch.service"/> </label> <f:input path="branchService" class="form-control" id="branchService" name="branchService"
						placeholder="Enter branch of service"></f:input>
				</div>
			<br>
			<br>
				<div class="form-group">
					<label for="militaryPlace"><spring:message code="info.military.place"/> </label> <f:input path="militaryPlace" class="form-control" id="militaryPlace" name="militaryPlace"
						placeholder="Enter military place"></f:input>
				</div>
			<br>
			<br>
				<div class="form-group">
					<label for="serviceNo"><spring:message code="info.service.no"/> </label> <f:input path="militaryServiceNo" class="form-control" id="militaryServiceNo" name="militaryServiceNo"
						placeholder="Enter Service no"></f:input>
				</div>
			<br>
			<br>
				<div class="form-group">
					<label for="reasons"><spring:message code="info.military.reason"/> </label> <f:input path="militaryReason" class="form-control" id="militaryReason" name="militaryReason"
						placeholder="Enter If not, please state the reasons"></f:input>
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
				<%-- <label for="department">Department </label> 
				<select id="department" class="form-control" name="department">
					<option value="-1" label="please select data"/>
					<c:forEach var="departmentList" items="${departments}" >
						<option value="${departmentList.id}">${departmentList.departmentName}</option>
					</c:forEach>
				</select> --%>
				
			</div>
			<br>
			<br>
			<div class="form-group">

				<label for="position1"><spring:message code="main.position1"/> </label>
				    <f:select path="position1" id="position1" name="position1" class="form-control">
					<f:option value="-1" label="please select data"/>
					<c:forEach var="positionList" items="${positions}">
						<f:option value="${positionList.id}">${positionList.positionName}</f:option>
					</c:forEach> 
				</f:select> 
				 <%--  <f:select path="position1">
  					 <f:option value="${positionList.positionName}" label="--- Select ---"></f:option>
  					 <f:options items="${positions}" />
				</f:select>  --%>
				
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="position2"><spring:message code="main.position2"/> </label> 
				<f:select path="position2" id="position2" name="position2" class="form-control">
					<f:option value="-1" label="please select data"/>
					<c:forEach var="positionList" items="${positions}">
						<f:option value="${positionList.id}">${positionList.positionName}</f:option>
					</c:forEach> 
				</f:select>
				<%-- <f:select path="position2">
  					 <f:option value="${positionList.positionName}" label="--- Select ---"></f:option>
  					 <f:options items="${positions}" />
				</f:select> --%>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="position3"><spring:message code="main.position3"/> </label>
				<f:select path="position3" id="position3" name="position3" class="form-control">
					<f:option value="-1" label="please select data"/>
					<c:forEach var="positionList" items="${positions}">
						<f:option value="${positionList.id}">${positionList.positionName}</f:option>
					</c:forEach> 
				</f:select>
				
				<%-- <f:select path="position3">
  					 <f:option value="${positionList.positionName}" label="--- Select ---"></f:option>
  					 <f:options items="${positions}" />
				</f:select> --%>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="salary"><spring:message code="info.salary"/> </label> <f:input path="expectedSalary"
					class="form-control" id="expectedSalary" name="expectedSalary"
					placeholder="Enter salary"></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="knowAugmentis"><spring:message code="info.know.aug"/></label> <br>
				 <div class="checkbox">
			  		<label><f:checkbox path="noticeNewspaper" 
					id="noticeNewspaper" name="noticeNewspaper" value="Newspaper" ></f:checkbox><spring:message code="info.newspaper"/></label>

					<f:input path="noticeNewspaper" class="form-control" id="noticeNewspaper"
						name="notice" placeholder="Enter newspaper"></f:input>
				</div>
				<br>
				<br>
				<div class="checkbox">
			 		 <label><f:checkbox path="noticeMagazine" id="noticeMagazine" name="noticeMagazine" value="Magazine"></f:checkbox><spring:message code="info.magazine"/></label>

					<f:input path="noticeMagazine" class="form-control" id="noticeMagazine"
						name="notice" placeholder="Enter magazine"></f:input>
				</div>
				<br>
				<br>
				<div class="checkbox">
			  		<label><f:checkbox path="noticeWebSite" id="noticeWebSite" name="noticeWebSite" value="Website"></f:checkbox><spring:message code="info.website"/></label>
			  		<f:input path="noticeWebSite" class="form-control" id="noticeWebSite"
						name="notice" placeholder="Enter website"></f:input>
				</div>
				<br>
				<br>
				<div class="checkbox">
			  		<label><f:checkbox path="noticeFriend" id="noticeFriend" name="noticeFriend" value="Friend"></f:checkbox><spring:message code="info.friend"/></label>

			  		<f:input path="noticeFriend" class="form-control" id="noticeFriend"
						name="notice" placeholder="Enter friend"></f:input>
				</div>
				<br>
				<br>
				<div class="checkbox">
			  		<label><f:checkbox path="noticeOther" id="noticeOther" name="noticeOther" value="Other"></f:checkbox><spring:message code="info.other"/> </label>
			  		<f:input path="noticeOther" class="form-control" id="noticeOther" name="noticeOther" placeholder="Enter other"></f:input>
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
					<f:input path="employedName" class="form-control" id="employedName"
						name="employedName" placeholder="Enter name"></f:input>
						<br>
						<br>
					<label for="employedPosition"><spring:message code="info.position"/> </label>
					<f:input path="employedPosition" class="form-control" id="employedPosition" name="employedPosition" placeholder="Enter position"></f:input>
						<br>
						<br>
					<label for="employedRelation"><spring:message code="info.relation"/> </label>
					<f:input path="employedRelation" class="form-control" id="employedRelation" name="employedRelation" placeholder="Enter relation"></f:input>
				</div>
			</div>
				<br>
				<br>
			<label for="emergency"><spring:message code="info.ask.case"/> </label>
				<br>
				<br>
			<div class="form-group">
				<label for="emergencyOfName"><spring:message code="info.emergency.name"/> </label> <f:input path="emergencyName" class="form-control" id="emergencyName"
					name="emergencyName" placeholder="Enter emergency name"></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="emergencyTel"><spring:message code="info.emergency.tel"/> </label> <f:input path="emergencyTel" class="form-control" id="emergencyTel"
					name="emergencyTel" placeholder="Enter emergency tel"></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="emergencyAddress"><spring:message code="info.emergency.address"/> </label>
					<f:textarea path="emergencyAddress" class="form-control" rows="5" id="emergencyAddress"
					name="emergencyAddress" placeholder="Enter emergency address"></f:textarea>
					
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

			<label for="previousEmployersReason">If not, please give the reason </label>
				<f:textarea path="previousEmployersReason" class="form-control" rows="5" id="previousEmployersReason"
					name="previousEmployersReason" placeholder="Enter If not, please give the reason"></f:textarea>
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
 					<a href="">Click and download ${applicant.resume} here</a>
	    	</c:when>
	    </c:choose>
	   		 <br>
			<label for="file"><spring:message code="info.transcript"/></label> 
				<input type="file" id="transcriptMultipartFile" name="transcriptMultipartFile" class="file"/>
				<f:hidden path="transcript" />
			<br>
		<c:choose>
			<c:when test="${not empty applicant.transcript}">
 					<a href="">Click and transcript ${applicant.transcript} here</a>
	    	</c:when>
	      </c:choose>
		</div>
			<br>
			<br>
		<button type="submit"  id="buttonSave" class="btn btn-success"><span class="glyphicon glyphicon-off"></span> <spring:message code="edit.button.save"/></button>
			
 	</div>
 </div>
</f:form>
