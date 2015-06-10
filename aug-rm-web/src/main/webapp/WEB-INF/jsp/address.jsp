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
					emergencyName : $('#emergencyNameId').val(),
					emergencyTel : $('#emergencyTelId').val(),
					emergencyAddress : $('#emergencyAddressId').val(),
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
	<div id="address">

		<label for="presentAddress">Present address </label>
		<div class="form-group">
			<label for="presentHouseNo">House No </label> <input type="text"
				class="form-control" id="presentHouseNoId" name="presentHouseNoName"
				placeholder="Enter House No">
		</div>
		<div class="form-group">
			<label for="presentRoad">Road </label> <input type="text"
				class="form-control" id="presentRoadId" name="presentRoadName"
				placeholder="Enter road">
		</div>
		<div class="form-group">
			<label for="presentDistrict">District </label> <input type="text"
				class="form-control" id="presentDistrictId"
				name="presentDistrictName" placeholder="Enter district">
		</div>
		<div class="form-group">
			<label for="presentSubDistrict">Sub District </label> <input
				type="text" class="form-control" id="presentSubDistrictId"
				name="presentSubDistrictName" placeholder="Enter sub district">
		</div>
		<div class="form-group">
			<label for="presentZipcode">Zipcode </label> <input type="text"
				class="form-control" id="presentZipcodeId" name="presentZipcodeName"
				placeholder="Enter zipcode">
		</div>
		<div class="form-group">
			<label for="presentProvince">Province </label> <input type="text"
				class="form-control" id="presentProvinceId"
				name="presentProvinceName" placeholder="Enter province">
		</div>
		<label for="permanentAddress">Permanent address </label>
		<div class="form-group">
			<label for="permanentHouseNo">House No </label> <input type="text"
				class="form-control" id="permanentHouseNoId"
				name="permanentHouseNoName" placeholder="Enter House No">
		</div>
		<div class="form-group">
			<label for="permanentRoad">Road </label> <input type="text"
				class="form-control" id="permanentRoadId" name="permanentRoadName"
				placeholder="Enter road">
		</div>
		<div class="form-group">
			<label for="permanentDistrict">District </label> <input type="text"
				class="form-control" id="permanentDistrictId"
				name="permanentDistrictName" placeholder="Enter district">
		</div>
		<div class="form-group">
			<label for="permanentSubDistrict">Sub District </label> <input
				type="text" class="form-control" id="permanentSubDistrictId"
				name="permanentSubDistrictName" placeholder="Enter sub district">
		</div>
		<div class="form-group">
			<label for="permanentZipcode">Zipcode </label> <input type="text"
				class="form-control" id="permanentZipcodeId"
				name="permanentZipcodeName" placeholder="Enter zipcode">
		</div>
		<div class="form-group">
			<label for="permanentProvince">Province </label> <input type="text"
				class="form-control" id="permanentProvinceId"
				name="permanentProvinceName" placeholder="Enter province">
		</div>

		<label for="emergency">In case of emergency , notify , ( Name
			, Address and Telephone ) </label>
		<div class="form-group">
			<label for="emergencyOfName">Emergency Name </label> <input
				type="text" class="form-control" id="emergencyNameId"
				name="emergencyName" placeholder="Enter emergency name">
		</div>
		<div class="form-group">
			<label for="emergencyAddress">Emergency Address </label> <input
				type="textarea" class="form-control" id="emergencyAddressId"
				name="emergencyAddressName" placeholder="Enter emergency address">
		</div>

		<div class="form-group">
			<label for="emergencyTel">Emergency Telephone </label> <input
				type="text" class="form-control" id="emergencyTelId"
				name="emergencyTelName" placeholder="Enter emergency tel">
		</div>

		<button type="button" class="btn btn-success" id="buttonSave">
			<span class="glyphicon glyphicon-off"></span> Save
		</button>
	</div>