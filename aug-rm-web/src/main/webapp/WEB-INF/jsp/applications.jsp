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

			var insertData = {

				applyDate : $('#applyDateId').val(),
				nowEmployed : $('#knowEmployedId').val(),
				employedName : $('#nameRelationId').val(),
				employedPosition : $('#positionRelationId').val(),
				employedRelation : $('#employedRelationId').val(),
				noticeNewspaper : $('#newspaperId').val(),
				noticeMagazine : $('#magazineId').val(),
				noticeFriend : $('#friendId').val(),
				noticeWebSite : $('#websiteId').val(),
				noticeOther : $('#otherId').val(),
				expectedSalary : $('#salaryId').val(),
				position1 : $('#positionFirstId').val(),
				position2 : $('#positionSecondId').val(),
				position3 : $('#positionThirdId').val(),

			}
			$.ajax({
				contentType : "application/json",
				type : "POST",
				url : '${pageContext.request.contextPath}/save',
				data : JSON.stringify(insertData),
				success : function(data) {
					alert(JSON.stringify(data));
				}
			});

		})

	});
</script>
<jsp:include page = "applicationMenu.jsp"/>
<label for="applyDate"><span
	class="glyphicon glyphicon-calendar"></span>Apply date</label>
<div class="input-group date">
	<input type="text" id="applyDateId" name="applyDateName"
		class="form-control"><span class="input-group-addon"><i
		class="glyphicon glyphicon-th"></i></span>
</div>


<div class="form-group">
	<label for="department">Department </label> <select id="departmentId"
		class="form-control">
		<c:forEach var="departmentList" items="${departments}">
			<option value="${departmentList.id}">${departmentList.departmentName}</option>
		</c:forEach>
	</select>
</div>
<div class="form-group">
	<label for="positionFirst">Position 1 </label> <select
		id="positionFirstId" name="positionFirstName" class="form-control">
		<c:forEach var="positionList" items="${positions}">
			<option value="${positionList.id}">${positionList.positionName}</option>
		</c:forEach>
	</select>
</div>
<div class="form-group">
	<label for="positionSecond">Position 2 </label> <select
		id="positionSecondId" name="positionSecondName" class="form-control">
		<c:forEach var="positionList" items="${positions}">
			<option value="${positionList.id}">${positionList.positionName}</option>
		</c:forEach>
	</select>
</div>
<div class="form-group">
	<label for="positionThird">Position 3 </label> <select
		id="positionThirdId" name="positionThirdName" class="form-control">
		<c:forEach var="positionList" items="${positions}">
			<option value="${positionList.id}">${positionList.positionName}</option>
		</c:forEach>
	</select>
</div>

<div class="form-group">
	<label for="salary">Salary expected </label> <input type="text"
		class="form-control" id="salaryId" name="salaryName"
		placeholder="Enter salary">
</div>
<div class="form-group">
	<label for="knowAugmentis">How do you know Augmentis?</label> <br>
	<label class="checkbox"> <input type="checkbox"
		id="newspaperId" name="newspaperName" value="newspaper">Newspaper
	</label> <label class="checkbox"><input type="text"
		class="form-control" name="newspaper" placeholder="newspaper">
		<input type="checkbox" id="magazineId" name="magazineName"
		value="magazine">Magazine</label> <input type="text"
		class="form-control" name="magazine" placeholder="magazine"> <label
		class="checkbox"><input type="checkbox" id="websiteId"
		name="websiteName" value="website">Website</label> <input type="text"
		class="form-control" name="website" placeholder="website"> <label
		class="checkbox"><input type="checkbox" id="friendId"
		name="friendName" value="friend">Friend </label> <input type="text"
		class="form-control" name="friend" placeholder="friend"> <label
		class="checkbox"><input type="checkbox" id="otherId"
		name="otherName" value="other">Other (please specify) </label> <input
		type="text" class="form-control" id="otherTextId" name="otherTextName"
		placeholder="Enter other (please specify)">
</div>

<div class="form-group">
	<label for="knowEmployed">Do you know anyone now being employed
		by this company? </label>
	<div class="radio">
		<label><input type="radio" name="knowEmployedName"
			id="knowEmployedId" value="Yes">Yes</label>
	</div>
	<div class="radio">
		<label><input type="radio" name="knowEmployedName"
			id="knowEmployedId" value="No">No</label>
	</div>
	<div class="form-group">
		<label for="nameRelation">If yes, please write name, position
			and relation </label><br>
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
<button type="button" class="btn btn-success" id="buttonSave">
	<span class="glyphicon glyphicon-off"></span> Save
</button>

