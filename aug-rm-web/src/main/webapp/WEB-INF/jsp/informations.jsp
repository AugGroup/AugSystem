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
			/* $('#infoForm').validate({
				rules : {photographName : { required : true },
					firstNameThName : { required : true },
					lastnameThName : { required : true },
					nickNameThName : {
						required : true
					},
					firstNameEngName : {
						required : true
					},
					lastnameEngName : {
						required : true
					},
					nickNameEngName : {
						required : true
					},
					telName : {
						required : true
					},
					eMailName : {
						required : true
					},
					birthdayName : {
						required : true
					},
					pBirthName : {
						required : true
					},
					ageName : {
						required : true
					},
					religionName : {
						required : true
					},
					nationalityName : {
						required : true
					},
					idCardName : {
						required : true
					},
					issuedCardName : {
						required : true
					},
					expiryName : {
						required : true
					},
					heightName : {
						required : true
					},
					weightName : {
						required : true
					},
					sexName : {
						required : true
					},
					maritalName : {
						required : true
					},
					childrenName : {
						required : true
					}
				},
				messages : {
					photographName : {
						required : "Photograph is required!"
					},
					firstNameThName : {
						required : "Firstname Thai is required!"
					},
					lastnameThName : {
						required : "Lastname Thai is required"
					},
					nickNameThName : {
						required : "Nickname Thai is required!"
					},
					firstNameEngName : {
						required : "Firstname English is required!"
					},
					lastnameEngName : {
						required : "Lastname English is required!"
					},
					nickNameEngName : {
						required : "Nickname English is required!"
					},
					telName : {
						required : "Tel. is required!"
					},
					eMailName : {
						required : "E-Mail is required!"
					},
					birthdayName : {
						required : "Birthday is required!"
					},
					pBirthName : {
						required : "Place of birth is required!"
					},
					ageName : {
						required : "Age is required!"
					},
					religionName : {
						required : "Religion is required!"
					},
					nationalityName : {
						required : "Nationality is required!"
					},
					idCardName : {
						required : "ID. Card no. is required!"
					},
					issuedCardName : {
						required : "Issued office is required!"
					},
					expiryName : {
						required : "Expiry date is required!"
					},
					heightName : {
						required : "Height is required!"
					},
					weightName : {
						required : "Weight is required!"
					},
					sexName : {
						required : "Sex is required!"
					},
					maritalName : {
						required : "Marital status is required!"
					},
					childrenName : {
						required : "Number of children is required!"
					}
					
				}
			});
			$('#informationForm').validate({
				rules : {
					spouseName : {
						required : true
					},
					marriageCerName : {
						required : true
					},
					issuedMarriageName : {
						required : true
					},
					addressName : {
						required : true
					},
					occupationName : {
						required : true
					},
					militaryName : {
						required : true
					},
					fromYearName : {
						required : true
					},
					toYearName : {
						required : true
					},
					branchName : {
						required : true
					},
					placeName : {
						required : true
					},
					serviceNoName : {
						required : true
					},
					reasonsName : {
						required : true
					},
					draftedName : {
						required : true
					}
				},
				messages : {
					spouseName : {
						required : "Spouse: Name is required!"
					},
					marriageCerName : {
						required : "Marriage certificate No. is required!"
					},
					issuedMarriageName : {
						required : "Issued office is required!"
					},
					addressName : {
						required : "Address is required!"
					},
					occupationName : {
						required : "Occupation is required!"
					},
					militaryName : {
						required : "Military service is required!"
					},
					fromYearName : {
						required : "From year is required!"
					},
					toYearName : {
						required : "To year is required!"
					},
					branchName : {
						required : "Branch of service is required!"
					},
					placeName : {
						required : "Military place is required!"
					},
					serviceNoName : {
						required : "Service No. is required!"
					},
					reasonsName : {
						required : "Reasons is required!"
					},
					draftedName : {
						required : "Date to be drafted is required!"
					}
					
				}
			});
			 */
			
			
			$('#previousEmployers').validate({
				rules : {
					previousEmployersName : {
						required : true
					},
					giveReasonName : {
						required : true,
					}
				},
				messages : {
					previousEmployersName : {
						required : "Please choose is required!"
					},
					giveReasonName : {
						required : "Please give the reason is required!"
					}
				}
			});
			
			
			
			 $("#buttonUpload").on("click",function() {
				 uplodFile();
		 	 });
			 
			function uplodFile(){		
				var file = $('#photograph')[0].files[0];
				var formData = new FormData();

			formData.append('file', file);
			$.ajax({
			     	dataType:"text", 
					contentType: false,
				    processData: false,
					enctype: 'multipart/form-data',
					type : "POST",
					url : '${pageContext.request.contextPath}/upload',
					data : formData,
					success : function(data) {
						alert(JSON.stringify(data));

						
					}
				});
			}
					
						$('#buttonSave').on("click",function() {
							if ($('#infoForm').valid()||$('#informationForm').valid()) {
											 var insertData = "{";
											insertData += "firstNameTH : '"+ $('#firstNameThId').val()+ "',";
											insertData += "firstNameEN : '"+ $('#firstNameEngId').val() + "',";
											insertData += "lastNameTH : '"+ $('#lastnameThId').val()+ "',";
											insertData += "lastNameEN : '"+ $('#lastnameEngId').val()+ "',";
											insertData += "nickNameTH : '"+ $('#nickNameThId').val()+ "',";
											insertData += "nickNameEN : '"+ $('#nickNameEngId').val()+ "',";
											insertData += "birthDate : '"+ $('#birthdayId').val()+ "',";
											insertData += "placeBirth : '"+ $('#pBirthId').val()+ "',";
											insertData += "age : "+ $('#ageId').val() + ",";
											insertData += "height : "+ $('#heightId').val()+ ",";
											insertData += "weight : "+ $('#weightId').val()+ ",";
											insertData += "sex : '"+ $('input[name=sexName]:checked').val() + "',";
											insertData += "religion : '"+ $('#religionId').val()+ "',";
											insertData += "nationality : '"+ $('#nationalityId').val()+ "',";
											insertData += "tel : '"+ $('#telId').val() + "',";
											insertData += "eMail : '"+ $('#eMailId').val()+ "',";
											insertData += "applicantStatus : '"+ $('input[name=maritalName]:checked').val() + "',";
											insertData += "emergencyName : '"+ $('#emergencyNameId').val() + "',";
											insertData += "emergencyTel : '"+ $('#emergencyTelId').val() + "',";
											insertData += "emergencyAddress : '"+ $('#emergencyAddressId').val() + "',";
											insertData += "certificate : '"+ $('#certificateId').val()+ "',";
											insertData += "cardId : '"+ $('#idCardId').val()+ "',";
											insertData += "cardIssuedOffice : '"+ $('#issuedCardId').val()+ "',";
											insertData += "cardExpiryDate : '"+ $('#expiryId').val()+ "',";
											insertData += "militaryFromYear : '"+ $('#fromYearId').val()+ "',";
											insertData += "militarytoYear : '"+ $('#toYearId').val()+ "',";
											insertData += "militaryPlace : '"+ $('#placeId').val()+ "',";
											insertData += "militaryServiceNo : '"+ $('#serviceNoId').val()+ "',";
											insertData += "militaryReason : '"+ $('#reasonsId').val()+ "',";
											insertData += "militaryStatus : '"+ $('input[name=militaryName]:checked').val() + "',";
											insertData += "numberOfChildren : '"+ $('#childrenId').val()+ "',";
											insertData += "spouseName : '"+ $('#spouseId').val()+ "',";
											insertData += "marriageCertificateNo : '"+ $('#maritalId').val()+ "',";
											insertData += "issueOficeMarriage : '"+ $('#issuedMarriageId').val() + "',";
											insertData += "dateToBeDrafted : '"+ $('#draftedId').val() + "',";
											insertData += "marriageAddress : '"+ $('#addressId').val()+ "',";
											insertData += "issueOficeMarriage : '"+ $('#issuedMarriageId').val() + "',";
											insertData += "occupationMarriage : '"+ $('#occupationId').val()+ "',";
											insertData += "branchService : '"+ $('#branchId').val()+ "',";
											insertData+="previousEmployers : '"+$('input[name=previousEmployersName]:checked').val()+"',";
											insertData+="previousEmployersReason : '"+$('#giveReasonId').val()+"',";
											
											insertData += "attachFiles : [{attachName:'pic',type:'.png',path:'C:',attachTypeFile:'picture'}]";
			
											insertData+="}";
											$.ajax({
														contentType : "application/json",
														type : "POST",
														url : '${pageContext.request.contextPath}/saveInformations',
														data : JSON.stringify(eval("(" + insertData + ")")),
														success : function(data) {
															alert(JSON.stringify(data));
														/* 	uplodFile(); */
															new PNotify({
														        title: 'Success',
														        text: 'Successful Add Information!!!',
														        type: 'success',
														        nonblock: {
														            nonblock: true,
														            nonblock_opacity: .2
														        }
														    });
														}
											});
										}
									})

});
</script>
<jsp:include page="applicationMenu.jsp" />
<!-- tab informations -->
<f:form id="informationApplicant" name="informationApplicant" action="${pageContext.request.contextPath}/saveInformations"
		modelAttribute="applicant" method="post" enctype="multipart/form-data" class="form-inline" >
	<div class="row">
			<div class="col-md-6">
	<div class="form-group">
				<input type="hidden" id="applicant" name="applicant"
					value="${id}">
	</div>
		<div class="form-group">
				PHOTOGRAPH 
				<!-- <div id="imagePreview "></div> -->
				<input type="file" name="photograph" id="photograph"><br><br>
				<input type="button" id="buttonUpload" name="buttonUpload" value="Upload"/>
		</div>
		<br>
		<br>
			<div class="form-group">
				<label for="firstNameTh">Firstname (TH) </label> <input type="text"
					class="form-control" id="firstNameTH" name="firstNameTH"
					placeholder="Enter Firstname(TH)">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="lastnameTh">Lastname (TH) </label> <input type="text"
					class="form-control" id="lastNameTH" name="lastNameTH"
					placeholder="Enter lastname(TH)">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="nickNameTh">Nickname (TH) </label> <input type="text"
					class="form-control" id="nickNameTH" name="nickNameTH"
					placeholder="Enter nickname(TH)">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="firstNameEng">Firstname (ENG) </label> <input
					type="text" class="form-control" id="firstNameEN"
					name="firstNameEN" placeholder="Enter Firstname(ENG)">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="lastnameEng">Lastname (ENG) </label> <input type="text"
					class="form-control" id="lastNameEN" name="lastNameEN"
					placeholder="Enter lastname(ENG)">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="nickNameEng">Nickname (Eng) </label> <input type="text"
					class="form-control" id="nickNameEN" name="nickNameEN"
					placeholder="Enter nickname(Eng)">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="tel">TELEPHONE NO. </label> <input type="text"
					class="form-control" id="tel" name="tel"
					placeholder="Enter tel">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="eMail">E-Mail </label> <input type="e"
					class="form-control" id="email" name="email"
					placeholder="Enter E-Mail">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="birthday"><span
					class="glyphicon glyphicon-calendar"></span> Birthday</label>
				<div class="input-group date">
					<input type="text" id="birthDate" name="birthDate"
						class="form-control"><span class="input-group-addon"><i
						class="glyphicon glyphicon-th"></i></span>
				</div>

			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="pBirth">Place of birth </label> <input type="text"
					class="form-control" id="placeBirth" name="placeBirth"
					placeholder="Enter place of birth">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="age">Age </label> <input type="text"
					class="form-control" id="age" name="age"
					placeholder="Enter age">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="religion">Religion </label> <input type="text"
					class="form-control" id="religion" name="religion"
					placeholder="Enter religion">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="nationality">Nationality </label> <input type="text"
					class="form-control" id="nationality" name="nationality"
					placeholder="Enter nationality">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="cardId">ID. Card no. </label> <input type="text"
					class="form-control" id="cardId" name="cardId"
					placeholder="Enter ID. Card no.">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="cardIssuedOffice">Issued office </label> <input type="text"
					class="form-control" id="cardIssuedOffice" name="cardIssuedOffice"
					placeholder="Enter issued office">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="cardExpiryDate"><span
					class="glyphicon glyphicon-calendar"></span>Expiry date </label>
				<div class="input-group date">
					<input type="text" id="cardExpiryDate" name="cardExpiryDate"
						class="form-control"><span class="input-group-addon"><i
						class="glyphicon glyphicon-th"></i></span>
				</div>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="height">Height (cms) </label> <input type="text"
					class="form-control" id="height" name="height"
					placeholder="Enter height (cms)">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="weight">Weight (kgs) </label> <input type="text"
					class="form-control" id="weight" name="weight"
					placeholder="Enter weight (kgs)">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="sex">Sex </label>
				<div class="radio">
					<label><input type="radio" name="sex" value="Female"
						id="sex">Female</label>
				</div>
				<div class="radio">
					<label><input type="radio" name="sex" value="Male"
						id="sex">Male</label>
				</div>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="applicantStatus">Marital status </label>
				<div class="radio">
					<label><input type="radio" name="applicantStatus"
						id="applicantStatus" value="Single">Single</label>
				</div>
				<div class="radio">
					<label><input type="radio" name="applicantStatus"
						id="applicantStatus" value="Married">Married</label>
				</div>
				<div class="radio">
					<label><input type="radio" name="applicantStatus"
						id="applicantStatus">Divorced</label>
				</div>

			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="children">Number of children </label> <input type="text"
					class="form-control" id="numberOfChildren" name="numberOfChildren"
					placeholder="Enter number of children">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="spouseName">Spouse: Name </label> <input type="text"
					class="form-control" id="spouseName" name="spouseName"
					placeholder="Enter spouse: name">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="marriageCertificateNo">Marriage certificate No </label> <input
					type="text" class="form-control" id="marriageCertificateNo"
					name="marriageCertificateNo" placeholder="Enter marriage certificate No.">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="issueOficeMarriage">Issued office </label> <input
					type="text" class="form-control" id="issueOficeMarriage"
					name="issueOficeMarriage" placeholder="Enter Issued office">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="marriageAddress">Address </label> <input type="text"
					class="form-control" rows="5" id="marriageAddress" name="marriageAddress"
					placeholder="Enter address">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="occupationMarriage">Occupation </label> <input type="text"
					class="form-control" id="occupationMarriage" name="occupationMarriage"
					placeholder="Enter occupation">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="military">Have you ever served in the military
					service? </label>
				<div class="radio">
					<label><input type="radio" name="militaryStatus"
						id="militaryStatus">Yes</label>
				</div>
				<div class="radio">
					<label><input type="radio" name="militaryStatus"
						id="militaryStatus">No</label>
				</div>
			<br>
			<br>
				<div class="form-group">
					<label for="militaryComplete">If yes, please complete the
						blanks below </label> <label for="militaryFromYear">From year </label> <input
						type="text" class="form-control" id="militaryFromYear"
						name="militaryFromYear" placeholder="Enter from year">
				</div>
			<br>
			<br>
				<div class="form-group">
					<label for="militarytoYear">To year </label> <input type="text"
						class="form-control" id="militarytoYear" name="militarytoYear"
						placeholder="Enter to year">
				</div>
			<br>
			<br>
				<div class="form-group">
					<label for="branchService">Branch of service </label> <input type="text"
						class="form-control" id="branchService" name="branchService"
						placeholder="Enter branch of service">
				</div>
			<br>
			<br>
				<div class="form-group">
					<label for="militaryPlace">Military place </label> <input type="text"
						class="form-control" id="militaryPlace" name="militaryPlace"
						placeholder="Enter military place">
				</div>
			<br>
			<br>
				<div class="form-group">
					<label for="serviceNo">Service no </label> <input type="text"
						class="form-control" id="militaryServiceNo" name="militaryServiceNo"
						placeholder="Enter Service no">
				</div>
			<br>
			<br>
				<div class="form-group">
					<label for="reasons">If not, please state the reasons </label> <input
						type="text" class="form-control" id="militaryReason" name="militaryReason"
						placeholder="Enter If not, please state the reasons">
				</div>
			<br>
			<br>
				<div class="form-group">
					<label for="dateToBeDrafted"><span
						class="glyphicon glyphicon-calendar"></span>Date to be drafted</label>
					<div class="input-group date">
						<input type="text" id="dateToBeDrafted" name="dateToBeDrafted"
							class="form-control"><span class="input-group-addon"><i
							class="glyphicon glyphicon-th"></i></span>
					</div>
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
				<input type="text" id="applyDate" name="applyDate"
					class="form-control"><span class="input-group-addon"><i
					class="glyphicon glyphicon-th"></i></span>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="department">Department </label> 
				<select id="departmentId" class="form-control" name="departmentName">
					<option value="-1" label="please select data"/>
					<c:forEach var="departmentList" items="${departments}" >
						<option value="${departmentList.id}">${departmentList.departmentName}</option>
					</c:forEach>
				</select>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="position1">Position 1 </label> <select
					id="position1" name="position1" class="form-control">
					<option value="-1" label="please select data"/>
					
					<c:forEach var="positionList" items="${positions}">
						<option value="${positionList.id}">${positionList.positionName}</option>
					</c:forEach>
				</select>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="position2">Position 2 </label> <select
					id="position2" name="position2" class="form-control">
					<option value="-1" label="please select data"/>
					<c:forEach var="positionList" items="${positions}">
						<option value="${positionList.id}">${positionList.positionName}</option>
					</c:forEach>
				</select>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="position3">Position 3 </label> <select
					id="position3" name="position3" class="form-control">
					<option value="-1" label="please select data"/>
					<c:forEach var="positionList" items="${positions}">
						<option value="${positionList.id}">${positionList.positionName}</option>
					</c:forEach>
				</select>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="salary">Salary expected </label> <input type="text"
					class="form-control" id="expectedSalary" name="expectedSalary"
					placeholder="Enter salary">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="knowAugmentis">How do you know Augmentis?</label> <br>
				 <div class="checkbox">
			  		<label><input type="checkbox" 
					id="newspaperId" name="newspaperName" value="newspaper">Newspaper</label>
					<input type="text" class="form-control" id="noticeNewspaper"
						name="noticeNewspaper" placeholder="Enter newspaper">
				</div>
				<br>
				<br>
				<div class="checkbox">
			 		 <label><input type="checkbox" id="magazineId" name="magazineName"
					value="magazine">Magazine</label>
					<input type="text" class="form-control" id="noticeMagazine"
						name="noticeMagazine" placeholder="Enter magazine">
				</div>
				<br>
				<br>
				<div class="checkbox">
			  		<label><input type="checkbox" id="websiteId" name="websiteName" value="website">Website</label>
			  		<input type="text" class="form-control" id="noticeWebSite"
						name="noticeWebSite" placeholder="Enter website">
				</div>
				<br>
				<br>
				<div class="checkbox">
			  		<label><input type="checkbox" id="friendId" name="friendName" value="friend">Friend</label>
			  		<input type="text" class="form-control" id="noticeFriend"
						name="noticeFriend" placeholder="Enter friend">
				</div>
				<br>
				<br>
				<div class="checkbox">
			  		<label><input type="checkbox" id="otherId" name="otherName" value="other">Other (please specify) </label>
			  		<input type="text" class="form-control" id="noticeOther"
						name="noticeOther" placeholder="Enter other">
				</div> 
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="nowEmployed">Do you know anyone now being employed
					by this company? </label><br><br>
				<div class="radio">
					<label><input type="radio" name="nowEmployed"
						id="nowEmployed" value="Yes">Yes</label>
				</div>
				<div class="radio">
					<label><input type="radio" name="knowEmployedName"
						id="nowEmployed" value="No">No</label>
				</div>
				<br>
				<br>
				<div class="form-group">
					<label for="nameRelation">If yes, please write name, position
						and relation </label><br><br>
					<lable for="employedName">Name </lable>
					<input type="text" class="form-control" id="employedName"
						name="employedName" placeholder="Enter name">
					<lable for="employedPosition">Position </lable>
					<input type="text" class="form-control" id="employedPosition"
						name="employedPosition" placeholder="Enter position">
					<lable for="employedRelation">Relation </lable>
					<input type="text" class="form-control" id="employedRelation"
						name="employedRelation" placeholder="Enter relation">
				</div>
			</div>
				<br>
				<br>
			<label for="emergency">In case of emergency , notify , ( Name , Address and Telephone ) </label>
				<br>
				<br>
			<div class="form-group">
				<label for="emergencyOfName">Emergency Name </label> <input
					type="text" class="form-control" id="emergencyName"
					name="emergencyName" placeholder="Enter emergency name">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="emergencyTel">Emergency Telephone </label> <input
					type="text" class="form-control" id="emergencyTel"
					name="emergencyTel" placeholder="Enter emergency tel">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="emergencyAddress">Emergency Address </label>
					<textarea class="form-control" rows="5" id="emergencyAddress"
					name="emergencyAddress" placeholder="Enter emergency address"></textarea>
					
			</div>
		<br>
		<br>			
		<div class="form-group">
		<label for="previousEmployers">May inquiry be made of your
			previous employers regarding your character, qualification record of
			employment? </label>
			<br>
			<br>
		<div class="form-group">
			<input type="hidden" id="applicantId" name="applicantName"
				value="${id}">
		</div>
		<div class="radio">
			<label><input type="radio" name="previousEmployers"
				id="previousEmployers" value="Yes">Yes</label>
		</div>
		<div class="radio">
			<label><input type="radio" name="previousEmployers"
				id="previousEmployers" value="No">No</label>
		</div>
		<br>
		<br>
		<div class="form-group">
			<label for="previousEmployersReason">If not, please give the reason </label> <input
				type="text" class="form-control" id="previousEmployersReason"
				name="previousEmployersReason"
				placeholder="Enter If not, please give the reason">
		</div>
	</div>
		<br>
		<br>
		<div class="form-group">
			<label for="file">File</label> <input type="file" id="file" name="file">
				<p class="help-block">Block-level help text here.</p>
			<label for="file">File</label> <input type="file" id="file" name="file">
				<p class="help-block">Block-level help text here.</p>
		</div>
		<br>
		<input type="button" id="buttonUpload" name="buttonUpload" value="Upload"/>
			<br>
			<br>
			<button type="button" class="btn btn-success" id="buttonSave">
				<span class="glyphicon glyphicon-off"></span> Save
			</button>
 	</div>
 </div>
</f:form>
<%-- <div id="informations">
<div class="container">
	<div class="row">
		<div class="col-md-6">
			<div class="form-group">
				<input type="hidden" id="applicantId" name="applicantName"
					value="${id}">
			</div>
			<form enctype="multipart/form-data">
			<div class="form-group">
				PHOTOGRAPH 
				<!-- <div id="imagePreview "></div> -->
				<input type="file" name="photograph" id="photograph"><br><br>
				<input type="button" id="buttonUpload" name="buttonUpload" value="Upload"/>
			</div>
			</form>
			
			<form class="form-inline" role="form" id="infoForm">
			<div class="form-group">
				<label for="firstNameTh">Firstname (TH) </label> <input type="text"
					class="form-control" id="firstNameThId" name="firstNameThName"
					placeholder="Enter Firstname(TH)">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="lastnameTh">Lastname (TH) </label> <input type="text"
					class="form-control" id="lastnameThId" name="lastnameThName"
					placeholder="Enter lastname(TH)">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="nickNameTh">Nickname (TH) </label> <input type="text"
					class="form-control" id="nickNameThId" name="nickNameThName"
					placeholder="Enter nickname(TH)">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="firstNameEng">Firstname (ENG) </label> <input
					type="text" class="form-control" id="firstNameEngId"
					name="firstNameEngName" placeholder="Enter Firstname(ENG)">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="lastnameEng">Lastname (ENG) </label> <input type="text"
					class="form-control" id="lastnameEngId" name="lastnameEngName"
					placeholder="Enter lastname(ENG)">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="nickNameEng">Nickname (Eng) </label> <input type="text"
					class="form-control" id="nickNameEngId" name="nickNameEngName"
					placeholder="Enter nickname(Eng)">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="tel">TELEPHONE NO. </label> <input type="text"
					class="form-control" id="telId" name="telName"
					placeholder="Enter tel">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="eMail">E-Mail </label> <input type="e"
					class="form-control" id="eMailId" name="eMailName"
					placeholder="Enter E-Mail">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="birthday"><span
					class="glyphicon glyphicon-calendar"></span> Birthday</label>
				<div class="input-group date">
					<input type="text" id="birthdayId" name="birthdayName"
						class="form-control"><span class="input-group-addon"><i
						class="glyphicon glyphicon-th"></i></span>
				</div>

			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="pBirth">Place of birth </label> <input type="text"
					class="form-control" id="pBirthId" name="pBirthName"
					placeholder="Enter place of birth">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="age">Age </label> <input type="text"
					class="form-control" id="ageId" name="ageName"
					placeholder="Enter age">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="religion">Religion </label> <input type="text"
					class="form-control" id="religionId" name="religionName"
					placeholder="Enter religion">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="nationality">Nationality </label> <input type="text"
					class="form-control" id="nationalityId" name="nationalityName"
					placeholder="Enter nationality">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="idCard">ID. Card no. </label> <input type="text"
					class="form-control" id="idCardId" name="idCardName"
					placeholder="Enter ID. Card no.">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="issuedCard">Issued office </label> <input type="text"
					class="form-control" id="issuedCardId" name="issuedCardName"
					placeholder="Enter issued office">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="expiry"><span
					class="glyphicon glyphicon-calendar"></span>Expiry date </label>
				<div class="input-group date">
					<input type="text" id="expiryId" name="expiryName"
						class="form-control"><span class="input-group-addon"><i
						class="glyphicon glyphicon-th"></i></span>
				</div>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="height">Height (cms) </label> <input type="text"
					class="form-control" id="heightId" name="heightName"
					placeholder="Enter height (cms)">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="weight">Weight (kgs) </label> <input type="text"
					class="form-control" id="weightId" name="weightName"
					placeholder="Enter weight (kgs)">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="sex">Sex </label>
				<div class="radio">
					<label><input type="radio" name="sexName" value="Female"
						id="sexId">Female</label>
				</div>
				<div class="radio">
					<label><input type="radio" name="sexName" value="Male"
						id="sexId">Male</label>
				</div>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="marital">Marital status </label>
				<div class="radio">
					<label><input type="radio" name="maritalName"
						id="maritalId" value="Single">Single</label>
				</div>
				<div class="radio">
					<label><input type="radio" name="maritalName"
						id="maritalId" value="Married">Married</label>
				</div>
				<div class="radio">
					<label><input type="radio" name="maritalName"
						id="maritalId">Divorced</label>
				</div>

			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="children">Number of children </label> <input type="text"
					class="form-control" id="childrenId" name="childrenName"
					placeholder="Enter number of children">
			</div>
		</form>
	</div>
	<div class="col-md-6">
		<form role="form" id="informationForm" class="form-inline">
			<div class="form-group">
				<label for="spouse">Spouse: Name </label> <input type="text"
					class="form-control" id="spouseId" name="spouseName"
					placeholder="Enter spouse: name">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="marriageCer">Marriage certificate No </label> <input
					type="text" class="form-control" id="marriageCerId"
					name="marriageCerName" placeholder="Enter marriage certificate No.">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="issuedMarriage">Issued office </label> <input
					type="text" class="form-control" id="issuedMarriageId"
					name="issuedMarriageName" placeholder="Enter Issued office">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="address">Address </label> <input type="text"
					class="form-control" rows="5" id="addressId" name="addressName"
					placeholder="Enter address">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="occupation">Occupation </label> <input type="text"
					class="form-control" id="occupationId" name="occupationName"
					placeholder="Enter occupation">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="military">Have you ever served in the military
					service? </label>
				<div class="radio">
					<label><input type="radio" name="militaryName"
						id="militaryId">Yes</label>
				</div>
				<div class="radio">
					<label><input type="radio" name="militaryName"
						id="militaryId">No</label>
				</div>
			<br>
			<br>
				<div class="form-group">
					<label for="militaryComplete">If yes, please complete the
						blanks below </label> <label for="fromYear">From year </label> <input
						type="text" class="form-control" id="fromYearId"
						name="fromYearName" placeholder="Enter from year">
				</div>
			<br>
			<br>
				<div class="form-group">
					<label for="toYear">To year </label> <input type="text"
						class="form-control" id="toYearId" name="toYearName"
						placeholder="Enter to year">
				</div>
			<br>
			<br>
				<div class="form-group">
					<label for="branch">Branch of service </label> <input type="text"
						class="form-control" id="branchId" name="branchName"
						placeholder="Enter branch of service">
				</div>
				<br>
				<br>
				<div class="form-group">
					<label for="place">Military place </label> <input type="text"
						class="form-control" id="placeId" name="placeName"
						placeholder="Enter military place">
				</div>
				<br>
				<br>
				<div class="form-group">
					<label for="serviceNo">Service no </label> <input type="text"
						class="form-control" id="serviceNoId" name="serviceNoName"
						placeholder="Enter Service no">
				</div>
			<br>
			<br>
				<div class="form-group">
					<label for="reasons">If not, please state the reasons </label> <input
						type="text" class="form-control" id="reasonsId" name="reasonsName"
						placeholder="Enter If not, please state the reasons">
				</div>
			<br>
			<br>
				<div class="form-group">
					<label for="drafted"><span
						class="glyphicon glyphicon-calendar"></span>Date to be drafted</label>
					<div class="input-group date">
						<input type="text" id="draftedId" name="draftedName"
							class="form-control"><span class="input-group-addon"><i
							class="glyphicon glyphicon-th"></i></span>
					</div>
					</div>
				</div>
			</form>
				
		

			
			<button type="button" class="btn btn-success" id="buttonSave">
				<span class="glyphicon glyphicon-off"></span> Save
			</button>
			
		</div>
	</div> --%>