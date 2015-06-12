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
		$('#addressTable').DataTable({
			ajax : {
				url : '${pageContext.request.contextPath}/address',
				type : 'GET'
			},
			columns : [ {
				data : "houseNo"
			}, {
				data : "road"
			}, {
				data : "district"
			}, {
				data : "subDistrict"
			}, {
				data : "zipcode"
			}, {
				data : "province"
			}, {
				data : "addressType"
			}, {
				data : "emergencyName"
			}, {
				data : "emergencyTel"
			}, {
				data : "emergencyAddress"
			} ],
			searching : false

		});
		$('#buttonSave').on("click", function() {

			var insertData = {
				emergencyName : $('#emergencyNameId').val(),
				emergencyTel : $('#emergencyTelId').val(),
				emergencyAddress : $('#emergencyAddressId').val(),
				addressPermanent : [ {
					applicant : {
						id : $('#applicantId').val()
					},
					houseNo : $('#permanentHouseNoId').val(),
					road : $('#permanentRoadId').val(),
					district : $('#permanentDistrictId').val(),
					subDistrict : $('#permanentSubDistrictId').val(),
					zipcode : $('#permanentZipcodeId').val(),
					province : $('#permanentProvinceId').val()

				} ],
				addressPresent : [ {
					applicant : {
						id : $('#applicantId').val()
					},
					houseNo : $('#presentHouseNoId').val(),
					road : $('#presentRoadId').val(),
					district : $('#presentDistrictId').val(),
					subDistrict : $('#presentSubDistrictId').val(),
					zipcode : $('#presentZipcodeId').val(),
					province : $('#presentProvinceId').val()

				} ]

			}
			$.ajax({
				contentType : "application/json",
				type : "POST",
				url : '${pageContext.request.contextPath}/saveAddress',
				data : JSON.stringify(insertData),
				success : function(data) {
					alert(JSON.stringify(data));
				}
			});

		})

	});
</script>
<jsp:include page = "applicationMenu.jsp"/>
<div id="address">

	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h1>Address</h1>
				<button class="btn btn-primary" id="addressAdd" data-toggle="modal"
					data-target="#AddressModal">
					<span class="glyphicon glyphicon-plus"></span> Address
				</button>
			</div>
		</div>


		<div class="modal fade" id="AddressModal" role="dialog">
			<div class="modal-dialog">

				<div class="modal-content">
					<div class="modal-header" style="padding: 35px 50px;">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4>
							<span class="glyphicon glyphicon-lock"></span> Address
						</h4>
					</div>
					<div class="modal-body" style="padding: 40px 50px;">
						<form role="form" id="addressForm">
							<div class="form-group">
								<input type="hidden" id="applicantId" name="applicantName"
									value="${id}">
							</div>
							<label for="address">Address </label> <select>
								<option value="presentAddress">Present</option>
								<option value="permanentAddress">Permanent</option>
							</select>
							<div class="form-group">
								<label for="presentHouseNo">House No </label> <input type="text"
									class="form-control" id="presentHouseNoId"
									name="presentHouseNoName" placeholder="Enter House No">
							</div>
							<div class="form-group">
								<label for="presentRoad">Road </label> <input type="text"
									class="form-control" id="presentRoadId" name="presentRoadName"
									placeholder="Enter road">
							</div>
							<div class="form-group">
								<label for="presentDistrict">District </label> <input
									type="text" class="form-control" id="presentDistrictId"
									name="presentDistrictName" placeholder="Enter district">
							</div>
							<div class="form-group">
								<label for="presentSubDistrict">Sub District </label> <input
									type="text" class="form-control" id="presentSubDistrictId"
									name="presentSubDistrictName" placeholder="Enter sub district">
							</div>
							<div class="form-group">
								<label for="presentZipcode">Zipcode </label> <input type="text"
									class="form-control" id="presentZipcodeId"
									name="presentZipcodeName" placeholder="Enter zipcode">
							</div>
							<div class="form-group">
								<label for="presentProvince">Province </label> <input
									type="text" class="form-control" id="presentProvinceId"
									name="presentProvinceName" placeholder="Enter province">
							</div>

							<br> <br>
							<button type="button" class="btn btn-success" id="addressSave">
								<span class="glyphicon glyphicon-off"></span> Save
							</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<p>Please fill your information</p>
				</div>
			</div>

		</div>
	</div>
	<br> <br>
	<div>
		<table id="addressTable" class="display" cellspacing="0" width="100%">
			<thead>
				<tr>
					<th>HOUSE_NO</th>
					<th>ROAD</th>
					<th>DISTRICT</th>
					<th>SUB_DISTRICT</th>
					<th>ZIPCODE</th>
					<th>PROVINCE</th>
					<th>ADDRESS_TYPE</th>
				</tr>
			</thead>


			<tbody></tbody>
		</table>

	</div>
	<br> <label for="emergency">In case of emergency , notify
		, ( Name , Address and Telephone ) </label>
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
	<br>
	<button type="button" class="btn btn-success" id="buttonSave">
		<span class="glyphicon glyphicon-off"></span> Save
	</button>
</div>