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

		
// 		//Update function
// 		function updateUser(button){
// 			var id = $(button).data("id");
// 			var applyDate = $("#applyDateId").val();
// 			var department = $('#departmentId').val();
// 			var position1 = $("#positionFirstId").val();
// 			var position2 = $("#positionSecondId").val();
// 			var position3 = $("#positionThirdId").val();
// 			var trackingStatus = $("#salaryId").val();
// 			var techScore = $('input[name="newspaperName"]:checked').val();
// 			var techScore = $('input[name="magazineName"]:checked').val();
// 			var techScore = $('input[name="websiteName"]:checked').val();
// 			var techScore = $('input[name="friendName"]:checked').val();
// 			var techScore = $('input[name="otherName"]:checked').val();
// 			var trackingStatus = $("#otherTextId").val();
// 			var trackingStatus = $("#otherId").val();
// 			var techScore = $('input[name="inputTechScore"]:checked').val();
			
// 			console.log(techScore)
// 			var json = {
// 					"id" : id,
// 					"score" : score,
// 					"techScore" : techScore,
// 					"attitudeHome" : attitudeHome,
// 					"attitudeOffice" : attitudeOffice,
// 					"trackingStatus" : trackingStatus
// 					};
// 			$.ajax({
// 				url : "${pageContext.request.contextPath}/score/update/"+id,
// 				type : "POST",
// 				contentType :"application/json; charset=utf-8", 
// 				data : JSON.stringify(json),
// 				success : function(data){
// 					console.log(data.id);
// 					$('#myModal1').modal('hide');
					
// 					var table = $('#dataTable').DataTable();	
// 				 	var rowData = table.row(button.closest('tr')).index(); 
// 				 	var d = table.row(rowData).data();
// 				 		d.score = data.score;
// 						d.techScore = data.techScore;
// 				 		d.attitudeHome = data.attitudeHome;
// 				 		d.attitudeOffice = data.attitudeOffice;
// 				 		d.trackingStatus = data.trackingStatus;
				 		
// 				 		table.row(rowData).data(d).draw();
				 		
// 						new PNotify({
// 						    title: 'Edit Success',
// 						    text: 'You can edit data',
// 						    type: 'success',
// 						    nonblock: {
// 						        nonblock: true,
// 						        nonblock_opacity: .2
// 						    }
// 						});
// 				 }
// 			});
			
// 		}

	});
</script>
<jsp:include page = "applicationMenu.jsp"/>

<label for="applyDate"><span class="glyphicon glyphicon-calendar"></span>Apply date</label>
<div class="input-group date">
<<<<<<< HEAD
	<input type="text" id="applyDate" name="applyDate"
		class="form-control"><span class="input-group-addon"><i
		class="glyphicon glyphicon-th"></i></span>
=======
	<input type="text" id="applyDateId" name="applyDateName" class="form-control">
	<span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
>>>>>>> Edit ApplicantController,ApplicationController,applications.jsp,educations.jsp,main_applicant.jsp
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
