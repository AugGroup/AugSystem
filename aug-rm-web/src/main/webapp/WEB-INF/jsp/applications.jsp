<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	$(document).ready(function() {
		
		$('.input-group.date').datepicker({
			startView : 2,
			todayBtn : "linked",
			format : "dd/mm/yyyy"

		});

		$('#buttonSave').on("click", function() {
			if ($('#applicationsForm').valid()) {
				var insertData = "{";
				insertData+="applyDate : '"+$('#applyDateId').val()+"',";
				insertData+="nowEmployed : '"+ $('input[name=knowEmployedName]:checked').val()+"',";
				insertData+="employedName : '"+$('#nameRelationId').val()+"',";
				insertData+="employedPosition : '"+$('#positionRelationId').val()+"',";
				insertData+="employedRelation : '"+$('#employedRelationId').val()+"',";
				insertData+="noticeNewspaper : '"+$('#newspaperId:checked').val()+"',";
				insertData+="noticeMagazine : '"+$('#magazineId:checked').val()+"',";
				insertData+="noticeFriend : '"+$('#friendId:checked').val()+"',";
				insertData+="noticeWebSite : '"+$('#websiteId:checked').val()+"',";
				insertData+="noticeOther : '"+$('#otherId:checked').val()+"',";
				insertData+="expectedSalary : '"+$('#salaryId').val()+"',";
				insertData+="position1 :{ id :'"+$('#positionFirstId').val()+"'},";
				insertData+="position2 :{ id :'"+$('#positionSecondId').val()+"'},";
				insertData+="position3 :{ id :'"+$('#positionThirdId').val()+"'}";
				insertData+= "}";
			$.ajax({
				contentType : "application/json",
				type : "POST",
				url : '${pageContext.request.contextPath}/saveApplications',
				data : JSON.stringify(eval("(" + insertData + ")")),
				success : function(data) {
					alert(JSON.stringify(data));

					new PNotify({
				        title: 'Success',
				        text: 'Successful Add Applications!!!',
				        type: 'success',
				        nonblock: {
				            nonblock: true,
				            nonblock_opacity: .2
				        }
				    });
				}
			});
			}
		});

		
		//Find by Id
		function findById(id){
			$.ajax({
				url : "${pageContext.request.contextPath}/findByIdApplication/" + id,
				type : "POST",
				success : function(data){
					showFillData(data);
				}
			});
		}
		
		//Show data on inputField
		function showFillData(data){
			$("#applyDateId").val(data.applyDate);
			$("#positionFirstId").val(data.position1);
			$("#positionSecondId").val(data.position2);
			$("#positionThirdId").val(data.position3);
			$("#salaryId").val(data.expectedSalary);
			
			$("#newspaperId").val(data.noticeNewspaper);
			$("#magazineId").val(data.noticeMagazine);
			$("#websiteId").val(data.noticeWebSite);
			$("#friendId").val(data.noticeFriend);
			$("#otherId").val(data.noticeOther);
			
// 			$("#knowEmployedId").val(data.firstNameTH);
// 			$("#nameRelationId").val(data.firstNameEN);
// 			$("#positionRelationId").val(data.lastNameTH);
// 			$("#employedRelationId").val(data.lastNameEN);
		}
		
		//Update function
		function updateUser(){
			var id = '${id}';
			var applyDate = $("#applyDateId").val();
			var positionF = {id : $('#positionFirstId').val()};
			var positionS = {id : $("#positionSecondId").val()};
			var positionT = {id : $("#positionThirdId").val()};
			var salary = $("#salaryId").val();
			
			var newspaper = $("#newspaperId").val();
			var magazine = $("#magazineId").val();
			var website = $("#websiteId").val();
			var friend = $("#friendId").val();
			var other = $("#otherId").val();

			var json = {
					"id" : id,
					"applyDate" : applyDate,
					"position1Str" : positionF,
					"position2Str" : positionS,
					"position3Str" : positionT,
					"expectedSalary" : salary,
					
					"noticeNewspaper" : newspaper,
					"noticeMagazine" : magazine,
					"noticeWebSite" : website,
					"noticeFriend" : friend,
					"noticeOther" : other,
					};
			
			$.ajax({
				url : "${pageContext.request.contextPath}/applications/"+id,
				type : "POST",
				contentType :"application/json; charset=utf-8",
				data : JSON.stringify(json),
				success : function(data){
						new PNotify({
						    title: 'Edit Success',
						    text: 'You can edit data',
						    type: 'success',
						    nonblock: {
						        nonblock: true,
						        nonblock_opacity: .2
						    }
						});
				 }
			});
		}
		
// 		var applicantId = '${id}';
// 		if(applicantId != null){
			findById('${id}');
// 			$('#buttonSave').off('click').on('click', function(id){
// 				updateUser();
// 			});
			
// 		}else{
// 			$('#informationForm')[0].reset();
// 			$('#buttonSave').off('click').on('click', function(){
// 				saveUser();
// 			});
// 		}

});
</script>
<jsp:include page = "applicationMenu.jsp"/>

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
	<label for="salary">Salary expected </label> 
	<input type="text" class="form-control" id="expectedSalary" name="expectedSalary" placeholder="Enter salary">
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
		<label><input type="radio" name="nowEmployed" id="nowEmployed" value="Yes">Yes</label>
	</div>
	<div class="radio">
		<label><input type="radio" name="knowEmployedName" id="nowEmployed" value="No">No</label>
	</div>
	<br>
	<br>
	<div class="form-group">
		<label for="nameRelation">If yes, please write name, position and relation </label><br><br>
		<label for="employedName">Name </label>
		<input type="text" class="form-control" id="employedName" name="employedName" placeholder="Enter name">
		<label for="employedPosition">Position </label>
		<input type="text" class="form-control" id="employedPosition" name="employedPosition" placeholder="Enter position">
		<label for="employedRelation">Relation </label>
		<input type="text" class="form-control" id="employedRelation" name="employedRelation" placeholder="Enter relation">
	</div>
</div>

<button type="button" class="btn btn-success" id="buttonSave"><span class="glyphicon glyphicon-off"></span> Save</button>
