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
			 
			 $('#informationApplicant').validate({
				rules : {imageMultipartFile : {
					required : true
					},
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
						required : true
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
 					},
 					resumeMultipartFile : {
 						required : true
 					},
 					transcriptMultipartFile : {
 						required : true
 					}
				},
				messages : {
					imageMultipartFile : {
						required : "Photograph is required!"
					},
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
						required : "E-Mail is required!"
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
 					},
 					resumeMultipartFile : {
 						required : "Resume is required!"
 					},
 					transcriptMultipartFile : {
 						required :  "Transcript is required!"
 					}
					
				}
			});

		
			
});

</script>
<jsp:include page="applicationMenu.jsp" />
<!-- tab informations -->
<f:form id="informationApplicant" name="informationApplicant" action="${pageContext.request.contextPath}/saveInformations"
		modelAttribute="applicant" method="post" enctype="multipart/form-data" class="form-inline" >
	<div class="row">
			<div class="col-md-6">
		  <div class="form-group">
				PHOTOGRAPH 
				<div id="imagePreview "></div>
				<f:input path="imageMultipartFile" id="imageMultipartFile" name="imageMultipartFile" type="file" class="file"></f:input>
				<br><br>
		</div> 
		<br>
		<br>
			<div class="form-group">
				<label for="firstNameTh">Firstname (TH) </label>
				<f:input path="firstNameTH" id="firstNameTH" name="firstNameTH" placeholder="Enter Firstname(TH)" class="form-control" ></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="lastnameTh">Lastname (TH) </label>
				<f:input path="lastNameTH" id="lastNameTH" name="lastNameTH" placeholder="Enter lastname(TH)" class="form-control" ></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="nickNameTh">Nickname (TH) </label>
				<f:input path="nickNameTH" id="nickNameTH" name="nickNameTH" placeholder="Enter nickname(TH)" class="form-control" ></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="firstNameEng">Firstname (ENG) </label>
				 <f:input path="firstNameEN" id="firstNameEN" name="firstNameEN" placeholder="Enter Firstname(ENG)" class="form-control" ></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="lastnameEng">Lastname (ENG) </label> 
				<f:input path="lastNameEN" id="lastNameEN" name="lastNameEN" placeholder="Enter lastname(ENG)" class="form-control"></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="nickNameEng">Nickname (Eng) </label> 
				<f:input path="nickNameEN" id="nickNameEN" name="nickNameEN" class="form-control" placeholder="Enter nickname(Eng)"></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="tel">TELEPHONE NO. </label> <f:input path="tel" id="tel" name="tel" placeholder="Enter tel" class="form-control" ></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="eMail">E-Mail </label> <f:input path="email" id="email" name="email" type="email" placeholder="Enter E-Mail" class="form-control" ></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="birthday"><span
					class="glyphicon glyphicon-calendar"></span> Birthday</label>
				<div class="input-group date">
					<f:input path="birthDate" id="birthDate" name="birthDate" class="form-control"></f:input><span class="input-group-addon"><i
						class="glyphicon glyphicon-th"></i></span>
				</div>

			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="pBirth">Place of birth </label> <f:input path="placeBirth" id="placeBirth" name="placeBirth"
					class="form-control" placeholder="Enter place of birth"></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="age">Age </label> <f:input path="age" id="age" name="age" class="form-control"
					placeholder="Enter age"></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="religion">Religion </label> <f:input path="religion" id="religion" name="religion"
					class="form-control" placeholder="Enter religion"></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="nationality">Nationality </label> <f:input path="nationality" id="nationality" name="nationality"
					class="form-control" placeholder="Enter nationality"></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="cardId">ID. Card no. </label> <f:input path="cardId" id="cardId" name="cardId" class="form-control" 
					placeholder="Enter ID. Card no."></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="cardIssuedOffice">Issued office </label> <f:input path="cardIssuedOffice" name="cardIssuedOffice" id="cardIssuedOffice" class="form-control" 
					placeholder="Enter issued office"></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="cardExpiryDate"><span
					class="glyphicon glyphicon-calendar"></span>Expiry date </label>
				<div class="input-group date">
					<f:input path="cardExpiryDate" id="cardExpiryDate" name="cardExpiryDate" class="form-control"></f:input><span class="input-group-addon"><i
						class="glyphicon glyphicon-th"></i></span>
				</div>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="height">Height (cms) </label> <f:input path="height" class="form-control" id="height" name="height" 
					placeholder="Enter height (cms)"></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="weight">Weight (kgs) </label> <f:input path="weight" class="form-control" id="weight" name="weight" placeholder="Enter weight (kgs)"></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label> Sex</label>
				<f:radiobutton path="sex" value="Female" name="sex" id="sex"></f:radiobutton><label> Female</label>
				<f:radiobutton path="sex" value="Male" name="sex" id="sex"></f:radiobutton><label> Male</label>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="applicantStatus">Marriage status </label>
				<f:radiobutton path="applicantStatus" id="applicantStatus" name="applicantStatus" value="Single"></f:radiobutton><label> Single</label>
				<f:radiobutton path="applicantStatus" id="applicantStatus" name="applicantStatus" value="Married"></f:radiobutton><label> Married</label>
				<f:radiobutton path="applicantStatus" id="applicantStatus" name="applicantStatus" value="Divorced"></f:radiobutton><label> Divorced</label>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="children">Number of children </label> <f:input path="numberOfChildren" class="form-control" id="numberOfChildren" name="numberOfChildren" placeholder="Enter number of children"></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="spouseName">Spouse: Name </label> <f:input path="spouseName" class="form-control" id="spouseName" name="spouseName" placeholder="Enter spouse: name"></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="marriageCertificateNo">Marriage certificate No </label> <f:input path="marriageCertificateNo" class="form-control" id="marriageCertificateNo"
					name="marriageCertificateNo" placeholder="Enter marriage certificate No."></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="issueOficeMarriage">Issued office </label> <f:input path="issueOficeMarriage" class="form-control" id="issueOficeMarriage"
					name="issueOficeMarriage" placeholder="Enter Issued office"></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="marriageAddress">Address </label> <f:textarea path="marriageAddress" class="form-control" rows="5" id="marriageAddress" name="marriageAddress"
					placeholder="Enter address"></f:textarea>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="occupationMarriage">Occupation </label> <f:input path="occupationMarriage" class="form-control" id="occupationMarriage" name="occupationMarriage"
					placeholder="Enter occupation"></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="military">Have you ever served in the military
					service? </label>
				<f:radiobutton path="militaryStatus" id="militaryStatus" name="militaryStatus" value="Yes"></f:radiobutton><label> Yes</label>
				<f:radiobutton path="militaryStatus" id="militaryStatus" name="militaryStatus" value="No"></f:radiobutton><label> No</label>
				</div>
			<br>
			<br>
				<div class="form-group">
					<label for="militaryComplete">If yes, please complete the
						blanks below </label> <label for="militaryFromYear">From year </label> <f:input path="militaryFromYear" class="form-control" id="militaryFromYear"
						name="militaryFromYear" placeholder="Enter from year"></f:input>
				</div>
			<br>
			<br>
				<div class="form-group">
					<label for="militarytoYear">To year </label> <f:input path="militarytoYear" class="form-control" id="militarytoYear" name="militarytoYear"
						placeholder="Enter to year"></f:input>
				</div>
			<br>
			<br>
				<div class="form-group">
					<label for="branchService">Branch of service </label> <f:input path="branchService" class="form-control" id="branchService" name="branchService"
						placeholder="Enter branch of service"></f:input>
				</div>
			<br>
			<br>
				<div class="form-group">
					<label for="militaryPlace">Military place </label> <f:input path="militaryPlace" class="form-control" id="militaryPlace" name="militaryPlace"
						placeholder="Enter military place"></f:input>
				</div>
			<br>
			<br>
				<div class="form-group">
					<label for="serviceNo">Service no </label> <f:input path="militaryServiceNo" class="form-control" id="militaryServiceNo" name="militaryServiceNo"
						placeholder="Enter Service no"></f:input>
				</div>
			<br>
			<br>
				<div class="form-group">
					<label for="reasons">If not, please state the reasons </label> <f:input path="militaryReason" class="form-control" id="militaryReason" name="militaryReason"
						placeholder="Enter If not, please state the reasons"></f:input>
				</div>
			<br>
			<br>
				<div class="form-group">
					<label for="dateToBeDrafted"><span
						class="glyphicon glyphicon-calendar"></span>Date to be drafted</label>
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
			<label for="applyDate"><span class="glyphicon glyphicon-calendar"></span>Apply date</label>
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
				</select> 
				<f:select  path="department.id"  class="form-control">
    						
	    						<f:option  value="-1" label="--Select Division--" />
	  							<f:options items="${ departments }"  itemValue="id" itemLabel="departmentName" />
	    						
								
							</f:select> 
			</div>--%>
			<br>
			<br>
			<div class="form-group">
				<label for="position1">Position 1 </label>
				    <f:select path="position1" id="position1" name="position1" class="form-control">
					<f:option value="-1" label="please select data"/>
					<c:forEach var="positionList" items="${positions}">
						<f:option value="${positionList.id}">${positionList.positionName}</f:option>
					</c:forEach> 
				</f:select>
				<%-- <f:select path="position1">
  					 <f:option value="${positionList.positionName}" label="--- Select ---"></f:option>
  					 <f:options items="${positions}" />
				</f:select> --%>
				
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="position2">Position 2 </label> 
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
				<label for="position3">Position 3 </label>
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
				<label for="salary">Salary expected </label> <f:input path="expectedSalary"
					class="form-control" id="expectedSalary" name="expectedSalary"
					placeholder="Enter salary"></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="knowAugmentis">How do you know Augmentis?</label> <br>
				 <div class="checkbox">
			  		<label><f:checkbox path="noticeNewspaper" 
					id="noticeNewspaper" name="noticeNewspaper" value="Newspaper" ></f:checkbox>Newspaper</label>
					<f:input path="noticeNewspaper" class="form-control" id="noticeNewspaper"
						name="noticeNewspaper" placeholder="Enter newspaper"></f:input>
				</div>
				<br>
				<br>
				<div class="checkbox">
			 		 <label><f:checkbox path="noticeMagazine" id="noticeMagazine" name="noticeMagazine" value="Magazine"></f:checkbox>Magazine</label>
					<f:input path="noticeMagazine" class="form-control" id="noticeMagazine"
						name="noticeMagazine" placeholder="Enter magazine"></f:input>
				</div>
				<br>
				<br>
				<div class="checkbox">
			  		<label><f:checkbox path="noticeWebSite" id="noticeWebSite" name="noticeWebSite" value="Website"></f:checkbox>Website</label>
			  		<f:input path="noticeWebSite" class="form-control" id="noticeWebSite"
						name="noticeWebSite" placeholder="Enter website"></f:input>
				</div>
				<br>
				<br>
				<div class="checkbox">
			  		<label><f:checkbox path="noticeFriend" id="noticeFriend" name="noticeFriend" value="Friend"></f:checkbox>Friend</label>
			  		<f:input path="noticeFriend" class="form-control" id="noticeFriend"
						name="noticeFriend" placeholder="Enter friend"></f:input>
				</div>
				<br>
				<br>
				<div class="checkbox">
			  		<label><f:checkbox path="noticeOther" id="noticeOther" name="noticeOther" value="Other"></f:checkbox>Other (please specify) </label>
			  		<f:input path="noticeOther" class="form-control" id="noticeOther" name="noticeOther" placeholder="Enter other"></f:input>
				</div> 
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="nowEmployed">Do you know anyone now being employed
					by this company? </label><br><br>
				<f:radiobutton path="nowEmployed" id="nowEmployed" name="nowEmployed" value="Yes"></f:radiobutton><label> Yes</label>
				<f:radiobutton path="nowEmployed" id="nowEmployed" name="nowEmployed" value="No"></f:radiobutton><label> No</label>
				<br> 
				<br>
				<div class="form-group">
					<label for="nameRelation">If yes, please write name, position
						and relation </label><br><br>
					<label for="employedName">Name </label>
					<f:input path="employedName" class="form-control" id="employedName"
						name="employedName" placeholder="Enter name"></f:input>
						<br>
						<br>
					<label for="employedPosition">Position </label>
					<f:input path="employedPosition" class="form-control" id="employedPosition" name="employedPosition" placeholder="Enter position"></f:input>
						<br>
						<br>
					<label for="employedRelation">Relation </label>
					<f:input path="employedRelation" class="form-control" id="employedRelation" name="employedRelation" placeholder="Enter relation"></f:input>
				</div>
			</div>
				<br>
				<br>
			<label for="emergency">In case of emergency , notify , ( Name , Address and Telephone ) </label>
				<br>
				<br>
			<div class="form-group">
				<label for="emergencyOfName">Emergency Name </label> <f:input path="emergencyName" class="form-control" id="emergencyName"
					name="emergencyName" placeholder="Enter emergency name"></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="emergencyTel">Emergency Telephone </label> <f:input path="emergencyTel" class="form-control" id="emergencyTel"
					name="emergencyTel" placeholder="Enter emergency tel"></f:input>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="emergencyAddress">Emergency Address </label>
					<f:textarea path="emergencyTel" class="form-control" rows="5" id="emergencyAddress"
					name="emergencyAddress" placeholder="Enter emergency address"></f:textarea>
					
			</div>
		<br>
		<br>			
		<div class="form-group">
		<label for="previousEmployers">May inquiry be made of your
			previous employers regarding your character, qualification record of
			employment? </label>
			<br>
			<br>
		<f:radiobutton path="previousEmployers" id="previousEmployers" name="previousEmployers" value="Yes"></f:radiobutton><label> Yes</label>
		<f:radiobutton path="previousEmployers" id="previousEmployers" name="previousEmployers" value="No"></f:radiobutton><label> No</label>
		
		<br>
		<br>
		<div class="form-group">
			<label for="previousEmployersReason">If not, please give the reason </label> <f:input path="previousEmployersReason" class="form-control" id="previousEmployersReason"
				name="previousEmployersReason" placeholder="Enter If not, please give the reason"></f:input>
		</div>
	</div>
		<br>
		<br>
		  <div class="form-group">
			<label for="file">Resume</label> <f:input path="resumeMultipartFile" type="file" id="resumeMultipartFile" name="resumeMultipartFile" class="file"></f:input>
				<p class="help-block">Block-level help text here.</p>
			<label for="file">Transcript</label> <f:input path="transcriptMultipartFile" type="file" id="transcriptMultipartFile" name="transcriptMultipartFile" class="file"></f:input>
				<p class="help-block">Block-level help text here.</p>
		</div>
			<br>
			<br>
		<button type="submit"  id="buttonSave" class="btn btn-success"><span class="glyphicon glyphicon-off"></span> Save</button>
			
 	</div>
 </div>
</f:form>
