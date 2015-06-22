<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	$(document).ready(function() {

		$('#applicationsForm').validate({
			rules : {
				applyDateName : {
					required : true
				},
				departmentName : {
					required : true
				},
				positionFirstName : {
					required : true
				},
				positionSecondName : {
					required : true
				},
				positionThirdName : {
					required : true
				},
				salaryName : {
					required : true
				},
				knowEmployedName : {
					required : true
				},
				nameRelationName : {
					required : true
				},
				positionRelationName : {
					required : true
				},
				employedRelationName : {
					required : true
				}
			},
			messages : {
				applyDateName : {
					required : "Apply date is required!"
				},
				departmentName : {
					required : "Department is required!"
				},
				positionFirstName : {
					required : "Position 1 is required!"
				},
				positionSecondName : {
					required : "Position 2 is required!"
				},
				positionThirdName : {
					required : "Position 3 is required!"
				},
				salaryName : {
					required : "Salary expected is required!"
				},
				knowEmployedName : {
					required : "Do you know anyone now being employed by this company? is required!"
				},
				nameRelationName : {
					required : "Name is required!"
				},
				positionRelationName : {
					required : "Position is required!"
				},
				employedRelationName : {
					required : "Relation is required!"
				}
			}
		});
		
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
		};
	})

	});
</script>
<jsp:include page = "applicationMenu.jsp"/>
<div class="container">
<form role="form" id="applicationsForm" class="form-inline">
<label for="applyDate"><span
	class="glyphicon glyphicon-calendar"></span>Apply date</label>
<div class="input-group date">
	<input type="text" id="applyDateId" name="applyDateName"
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
	<label for="positionFirst">Position 1 </label> <select
		id="positionFirstId" name="positionFirstName" class="form-control">
		<option value="-1" label="please select data"/>
		
		<c:forEach var="positionList" items="${positions}">
			<option value="${positionList.id}">${positionList.positionName}</option>
		</c:forEach>
	</select>
</div>
<br>
<br>
<div class="form-group">
	<label for="positionSecond">Position 2 </label> <select
		id="positionSecondId" name="positionSecondName" class="form-control">
		<option value="-1" label="please select data"/>
		<c:forEach var="positionList" items="${positions}">
			<option value="${positionList.id}">${positionList.positionName}</option>
		</c:forEach>
	</select>
</div>
<br>
<br>
<div class="form-group">
	<label for="positionThird">Position 3 </label> <select
		id="positionThirdId" name="positionThirdName" class="form-control">
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
		class="form-control" id="salaryId" name="salaryName"
		placeholder="Enter salary">
</div>
<br>
<br>
<div class="form-group">
	<label for="knowAugmentis">How do you know Augmentis?</label> <br>
	 <div class="checkbox">
  		<label><input type="checkbox" 
		id="newspaperId" name="newspaperName" value="newspaper">Newspaper</label>
		<input type="text" class="form-control" id="newspaperlistId"
			name="newspaperlistName" placeholder="Enter newspaper">
	</div>
	<br>
	<br>
	<div class="checkbox">
 		 <label><input type="checkbox" id="magazineId" name="magazineName"
		value="magazine">Magazine</label>
		<input type="text" class="form-control" id="magazinelistId"
			name="magazinelistName" placeholder="Enter magazine">
	</div>
	<br>
	<br>
	<div class="checkbox">
  		<label><input type="checkbox" id="websiteId" name="websiteName" value="website">Website</label>
  		<input type="text" class="form-control" id="websitelistId"
			name="websitelistName" placeholder="Enter website">
	</div>
	<br>
	<br>
	<div class="checkbox">
  		<label><input type="checkbox" id="friendId" name="friendName" value="friend">Friend</label>
  		<input type="text" class="form-control" id="friendlistId"
			name="friendlistName" placeholder="Enter friend">
	</div>
	<br>
	<br>
	<div class="checkbox">
  		<label><input type="checkbox" id="otherId" name="otherName" value="other">Other (please specify) </label>
  		<input type="text" class="form-control" id="otherlistId"
			name="otherlistName" placeholder="Enter other">
	</div> 
</div>
<br>
<br>
<div class="form-group">
	<label for="knowEmployed">Do you know anyone now being employed
		by this company? </label><br><br>
	<div class="radio">
		<label><input type="radio" name="knowEmployedName"
			id="knowEmployedId" value="Yes">Yes</label>
	</div>
	<div class="radio">
		<label><input type="radio" name="knowEmployedName"
			id="knowEmployedId" value="No">No</label>
	</div>
	<br>
	<br>
	<div class="form-group">
		<label for="nameRelation">If yes, please write name, position
			and relation </label><br><br>
		<lable for="nameRelation">Name </lable>
		<input type="text" class="form-control" id="nameRelationId"
			name="nameRelationName" placeholder="Enter name">
		<lable for="positionRelation">Position </lable>
		<input type="text" class="form-control" id="positionRelationId"
			name="positionRelationName" placeholder="Enter position">
		<lable for="employedRelation">Relation </lable>
		<input type="text" class="form-control" id="employedRelationId"
			name="employedRelationName" placeholder="Enter relation">
	</div>
</div>
</form>

<button type="button" class="btn btn-success" id="buttonSave">
	<span class="glyphicon glyphicon-off"></span> Save
</button>
</div>