<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
 	$(document).ready(function() {
			$('.input-group.date').datepicker({startView : 2,
 							todayBtn : "linked",
 							format : "dd/mm/yyyy",
 							autoclose: true 

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
			 
			 $("#previousEmployersReason").hide();
			  
			    $("input:radio[name='previousEmployers']").change(function(){  

			            if(this.value == 'No' && this.checked){
			              $("#previousEmployersReason").show();
			            }else{
			              $("#previousEmployersReason").hide();
			            }

			    });
			   
			    $('#newspaper').hide();

			    //show it when the checkbox is clicked
			    $('input[name="noticeNewspaper"]').change(function () {
			    	if ($('input[name="noticeNewspaper"]').is(':checked')) {
			            $('#newspaper').show();
			        } else {
			            $('#newspaper').hide();
			        }
			    });
			    $('#magazine').hide();

			    //show it when the checkbox is clicked
			    $('input[name="noticeMagazine"]').change(function () {
			    	if ($('input[name="noticeMagazine"]').is(':checked')) {
			            $('#magazine').show();
			        } else {
			            $('#magazine').hide();
			        }
			    });
			    $('#webSite').hide();

			    //show it when the checkbox is clicked
			    $('input[name="noticeWebSite"]').change(function () {
			    	if ($('input[name="noticeWebSite"]').is(':checked')) {
			            $('#webSite').show();
			        } else {
			            $('#webSite').hide();
			        }
			    });
			    $('#friend').hide();

			    //show it when the checkbox is clicked
			    $('input[name="noticeFriend"]').change(function () {
			    	if ($('input[name="noticeFriend"]').is(':checked')) {
			            $('#friend').show();
			        } else {
			            $('#friend').hide();
			        }
			    });
			    $('#other').hide();

			    //show it when the checkbox is clicked
			    $('input[name="noticeOther"]').change(function () {
			    	if ($('input[name="noticeOther"]').is(':checked')) {
			            $('#other').show();
			        } else {
			            $('#other').hide();
			        }
			    });
			    
			    $("#nowEmployedKnow").hide();
				  
			    $("input:radio[name='nowEmployed']").change(function(){  

			            if(this.value == 'Yes' && this.checked){
			              $("#nowEmployedKnow").show();
			            }else{
			              $("#nowEmployedKnow").hide();
			            }

			    });

			    $("#militaryStatusYes").hide();
				  
			    $("input:radio[name='militaryStatus']").change(function(){  

			            if(this.value == 'Yes' && this.checked){
			              $("#militaryStatusYes").show();
			            }else{
			              $("#militaryStatusYes").hide();
			            }

			    });
			    
			    $("#militaryReason").hide();
				  
			    $("input:radio[name='militaryStatus']").change(function(){  

			            if(this.value == 'No' && this.checked){
			              $("#militaryReason").show();
			            }else{
			              $("#militaryReason").hide();
			            }

			    });
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
						required : true,
						minlength: 10, 
				        digits: true
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
						required : "<spring:message code="valid.info.first.th"/>"
					},
					lastNameTH : {
						required : "<spring:message code="valid.info.last.th"/>"
					},
					nickNameTH : {
						required : "<spring:message code="valid.info.nick.th"/>"
					},
					firstNameEN : {
						required : "<spring:message code="valid.info.first.en"/>"
					},
					lastNameEN : {
						required : "<spring:message code="valid.info.last.en"/>"
					},
					nickNameEN : {
						required : "<spring:message code="valid.info.nick.en"/>"
					},
					tel : {
						required : "<spring:message code="valid.ref.tel"/>",
						minlength: "<spring:message code="valid.info.tel.min"/>",
						digits: "<spring:message code="valid.info.tel.number"/>"
					},
					email :{
					      required: "<spring:message code="valid.info.email"/>",
					      email: "<spring:message code="valid.info.email.format"/>"
					    },
					birthDate : {
						required : "<spring:message code="valid.info.birthday"/>"
					},
					placeBirth : {
						required : "<spring:message code="valid.info.place.birth"/>"
					},
					age : {
						required : "<spring:message code="valid.info.age"/>"
					},
					religion : {
						required : "<spring:message code="valid.info.religion"/>"
					},
					nationality : {
						required : "<spring:message code="valid.info.nationality"/>"
					},
					cardId : {
						required : "<spring:message code="valid.info.id.card"/>"
					},
					cardIssuedOffice : {
						required : "<spring:message code="valid.fam.issued"/>"
					},
					cardExpiryDate : {
						required : "<spring:message code="valid.info.expiry"/>"
					},
					height : {
						required : "<spring:message code="valid.info.height"/>"
					},
					weight : {
						required : "<spring:message code="valid.info.weight"/>"
					},
					sex : {
						required : "<spring:message code="valid.info.sex"/>"
					},
					applicantStatus : {
						required : "<spring:message code="valid.info.status"/>"
					},
					numberOfChildren : {
						required : "<spring:message code="valid.info.child"/>"
					},spouseName : {
						required : "<spring:message code="valid.fam.spouse"/>"
					},
					marriageCertificateNo : {
						required : "<spring:message code="valid.fam.marrige"/>"
					},
					issueOficeMarriage : {
						required : "<spring:message code="valid.fam.issued"/>"
					},
					marriageAddress : {
						required : "<spring:message code="valid.addr.addr"/>"
					},
					occupationMarriage : {
						required : "<spring:message code="valid.fam.occ"/>"
					},
					militaryStatus : {
						required : "<spring:message code="valid.info.military"/>"
					},
					militaryFromYear : {
						required : "<spring:message code="valid.info.from"/>"
					},
					militarytoYear : {
						required : "<spring:message code="valid.info.to"/>"
					},
					branchService : {
						required : "<spring:message code="valid.info.branch"/>"
					},
					militaryPlace : {
						required : "<spring:message code="valid.info.militery.place"/>"
					},
					militaryServiceNo : {
						required : "<spring:message code="valid.info.military.ser"/>"
					},
					militaryReason : {
						required : "<spring:message code="valid.info.reason"/>"
					},
					dateToBeDrafted : {
						required : "<spring:message code="valid.info.drafted"/>"
					},emergencyName : {
						required : "<spring:message code="valid.info.emer.name"/>"
					},
					emergencyTel : {
						required : "<spring:message code="valid.info.emer.tel"/>"
					},
					emergencyAddress : {
						required : "<spring:message code="valid.info.emer.addr"/>"
					},applyDate : {
						required : "<spring:message code="valid.info.apply.date"/>"
					} ,
					department : {
						required : "<spring:message code="valid.info.dep"/>"
					},
					position1 : {
						required : "<spring:message code="valid.info.pos1"/>"
					},
					position2 : {
						required : "<spring:message code="valid.info.ask"/>"
					},
					position3 : {
						required : "<spring:message code="valid.info.pos2"/>"
					} ,
					expectedSalary : {
						required : "<spring:message code="valid.info.salary"/>"
					},
					nowEmployed : {
						required : "<spring:message code="valid.info.ask"/>"
					},
					employedName : {
						required : "<spring:message code="valid.ref.name"/>"
					},
					employedPosition : {
						required : "<spring:message code="valid.ex.position"/>"
					},
					employedRelation : {
						required : "<spring:message code="valid.info.relation"/>"
					},
					previousEmployers : {
 						required :  "<spring:message code="valid.info.pre.emp"/>"
 					},
 					previousEmployersReason : {
 						required :  "<spring:message code="valid.ex.reason"/>"
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
 		
		<br>
		<br>
			<div class="form-group">
				<label for="firstNameTh"><spring:message code="info.firstname.th"/> </label>
				<spring:message code="info.text.first.th" var="firstname"/>
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
			<div class="form-group" id="militaryStatusYes">
					<label for="militaryComplete"><spring:message code="info.military.yes"/> </label> 
					<label for="militaryFromYear"><spring:message code="info.military.fromYear"/> </label> 
			<br>
			<br>
					<spring:message code="info.text.from" var="from"/>
					<f:input path="militaryFromYear" class="form-control" id="militaryFromYear" name="militaryFromYear" placeholder="${from}"></f:input>
			<br>
			<br>
					<label for="militarytoYear"><spring:message code="info.military.toYear"/> </label> 
					<spring:message code="info.text.to" var="to"/>
					<f:input path="militarytoYear" class="form-control" id="militarytoYear" name="militarytoYear" placeholder="${to}"></f:input>
			<br>
			<br>
					<label for="branchService"><spring:message code="info.branch.service"/> </label> 
					<spring:message code="info.text.branch" var="branch"/>
					<f:input path="branchService" class="form-control" id="branchService" name="branchService" placeholder="${branch}"></f:input>
			<br>
			<br>
					<label for="militaryPlace"><spring:message code="info.military.place"/> </label> 
					<spring:message code="info.text.military.place" var="militaryP"/>
					<f:input path="militaryPlace" class="form-control" id="militaryPlace" name="militaryPlace" placeholder="${militaryP}"></f:input>
			<br>
			<br>
					<label for="serviceNo"><spring:message code="info.service.no"/> </label> 
					<spring:message code="info.text.military.service" var="militaryS"/>
					<f:input path="militaryServiceNo" class="form-control" id="militaryServiceNo" name="militaryServiceNo"
						placeholder="${militaryS}"></f:input>
			</div>
			<br>
			<br>
				<div class="form-group" id="militaryReason">
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
				 <f:select path="position1.id" id="position1" name="position1" class="form-control">
					<f:option value="-1" label="please select data"/>
					<c:forEach var="positionList" items="${positions}">
						<f:option value="${positionList.id}">${positionList.positionName}</f:option>
					</c:forEach> 
				</f:select>  
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="position2"><spring:message code="main.position2"/> </label> 
				 <f:select path="position2.id" id="position2" name="position2" class="form-control">
					<f:option value="-1" label="please select data"/>
					<c:forEach var="positionList" items="${positions}">
						<f:option value="${positionList.id}">${positionList.positionName}</f:option>
					</c:forEach> 
				</f:select> 
				
			</div>
			<br>
			<br>
			 <div class="form-group">
				<label for="position3"><spring:message code="main.position3"/> </label>
				<f:select path="position3.id" id="position3" name="position3" class="form-control">
					<f:option value="-1" label="please select data"/>
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
				 <c:choose>
					 <c:when test="${empty applicant.noticeNewspaper}">
						 <label><f:checkbox path="noticeNewspaper" id="noticeNewspaper" name="noticeNewspaper" value="Newspaper" ></f:checkbox><spring:message code="info.newspaper"/></label>
						<div id="newspaper">
							<f:input path="noticeNewspaper" class="form-control" id="noticeNewspaper" name="noticeNewspaper" placeholder="Enter newspaper"></f:input>
						 </div>
					 </c:when>
					 <c:when test="${not empty applicant.noticeNewspaper}">
				  		<label><f:checkbox path="noticeNewspaper" id="noticeNewspaper" name="noticeNewspaper" value="Newspaper" checked="checked" ></f:checkbox><spring:message code="info.newspaper"/></label>
						<div id="newspaper">
							<f:input path="noticeNewspaper" class="form-control" id="noticeNewspaper" name="noticeNewspaper" placeholder="Enter newspaper"></f:input>
						</div>
					</c:when>
					
				</c:choose>
				</div>
				<br>
				<br>
				<div class="checkbox">
				 <c:choose>
					 <c:when test="${empty applicant.noticeMagazine}">
				 		 <label><f:checkbox path="noticeMagazine" id="noticeMagazine" name="noticeMagazine" value="Magazine"></f:checkbox><spring:message code="info.magazine"/></label>
						<div id="magazine">
							 <f:input path="noticeMagazine" class="form-control" id="noticeMagazine" name="noticeMagazine" placeholder="Enter magazine"></f:input>
						</div>
					</c:when>
					 <c:when test="${not empty applicant.noticeMagazine}">
					 <label><f:checkbox path="noticeMagazine" id="noticeMagazine" name="noticeMagazine" value="Magazine" checked="checked"></f:checkbox><spring:message code="info.magazine"/></label>
						<div id="magazine">
							 <f:input path="noticeMagazine" class="form-control" id="noticeMagazine" name="noticeMagazine" placeholder="Enter magazine"></f:input>
						</div>
					</c:when>
				</c:choose>
				</div>
				<br>
				<br>
				<div class="checkbox">
				 <c:choose>
					 <c:when test="${empty applicant.noticeWebSite}">
			  		<label><f:checkbox path="noticeWebSite" id="noticeWebSite" name="noticeWebSite" value="Website"></f:checkbox><spring:message code="info.website"/></label>
			  		<div id="webSite">
			  			<f:input path="noticeWebSite" class="form-control" id="noticeWebSite" name="noticeWebSite" placeholder="Enter website"></f:input>
					</div>
				</c:when>
				 <c:when test="${not empty applicant.noticeWebSite}">
				 <label><f:checkbox path="noticeWebSite" id="noticeWebSite" name="noticeWebSite" value="Website" checked="checked"></f:checkbox><spring:message code="info.website"/></label>
			  		<div id="webSite">
			  			<f:input path="noticeWebSite" class="form-control" id="noticeWebSite" name="noticeWebSite" placeholder="Enter website"></f:input>
					</div>
				</c:when>
				</c:choose>
				</div>
				<br>
				<br>
				<div class="checkbox">
				<c:choose>
					 <c:when test="${empty applicant.noticeFriend}">
			  		<label><f:checkbox path="noticeFriend" id="noticeFriend" name="noticeFriend" value="Friend"></f:checkbox><spring:message code="info.friend"/></label>
			  		<div id="friend">
			  			<f:input path="noticeFriend" class="form-control" id="noticeFriend" name="noticeFriend" placeholder="Enter friend"></f:input>
					</div>
				</c:when>
				 <c:when test="${not empty applicant.noticeFriend}">
				 	<label><f:checkbox path="noticeFriend" id="noticeFriend" name="noticeFriend" value="Friend" checked="checked"></f:checkbox><spring:message code="info.friend"/></label>
			  			<div id="friend">
			  			<f:input path="noticeFriend" class="form-control" id="noticeFriend" name="noticeFriend" placeholder="Enter friend"></f:input>
						</div>
					</c:when>
				</c:choose>
				</div>
				<br>
				<br>
				<div class="checkbox">
				<c:choose>
					 <c:when test="${empty applicant.noticeOther}">
				  		<label><f:checkbox path="noticeOther" id="noticeOther" name="noticeOther" value="Other"></f:checkbox><spring:message code="info.other"/> </label>
				  		<div id="other">
				  			<f:input path="noticeOther" class="form-control" id="noticeOther" name="noticeOther" placeholder="Enter other"></f:input>
						</div>
					</c:when>
					<c:when test="${not empty applicant.noticeOther}">
						<label><f:checkbox path="noticeOther" id="noticeOther" name="noticeOther" value="Other" checked="checked"></f:checkbox><spring:message code="info.other"/> </label>
				  		<div id="other">
				  			<f:input path="noticeOther" class="form-control" id="noticeOther" name="noticeOther" placeholder="Enter other"></f:input>
						</div>
					</c:when>
				</c:choose>
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
				<div class="form-group" id="nowEmployedKnow">
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
		<div class="form-group" id="previousEmployers">
		<label for="previousEmployers"><spring:message code="info.ask.inquiry"/> </label>
			<br>
			<br>
				<f:radiobutton path="previousEmployers" id="previousEmployers" name="previousEmployers" value="Yes"></f:radiobutton><label> <spring:message code="info.yes"/></label>
				<f:radiobutton path="previousEmployers" id="previousEmployers" name="previousEmployers" value="No"></f:radiobutton><label> <spring:message code="info.no"/></label>
		<br>
		<br>
		<div class="form-group" id="previousEmployersReason">
					<label for="previousEmployersReason">If not, please give the reason </label>
					<f:textarea path="previousEmployersReason" class="form-control" rows="5" id="previousEmployersReason" name="previousEmployersReason" placeholder="Enter If not, please give the reason"></f:textarea>
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
