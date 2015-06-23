<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	$(document).ready(function() {
		
		$('#addressForm').validate({
			rules : {
				inputAddress : {
					required : true
				},
				houseNoName : {
					required : true
				},
				roadName : {
					required : true
				},
				districtName : {
					required : true
				},
				subDistrictName : {
					required : true
				},
				zipcodeName : {
					required : true
				},
				provinceName : {
					required : true
				}
			},
			messages : {
				inputAddress : {
					required : "Address is required!"
				},
				houseNoName : {
					required : "House No. is required!"
				},
				roadName : {
					required : "Road is required!"
				},
				districtName : {
					required : "District is required!"
				},
				subDistrictName : {
					required : "Sub District is required!"
				},
				provinceName : {
					required : "Province is required!"
				}
			}
		});
		$('#emergencyForm').validate({
			rules : {
				emergencyName : {
					required : true
				},
				emergencyTelName : {
					required : true
				},
				emergencyAddressName : {
					required : true
				}
			},
			messages : {
				emergencyName : {
					required : "Emergency Name is required!"
				},
				emergencyTelName : {
					required : "Emergency Telephone is required!"
				},
				emergencyAddressName : {
					required : "Emergency Address is required!"
				}
			}
		});
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
				data : "addressType"
			},
			{
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
			},{ data : function(data) {
					 return '<button id="buttonEdit" data-id="'+data.id+'" data-toggle="modal" data-target="#myModal" class="btn btn-warning btn-mini">' + 'Edit' + '</button>';
				}
},
{ data : function(data) {
					 return '<button id="buttonDelete" data-id="'+data.id+'" data-toggle="modal" data-target="#modalDelete" class="btn btn-danger btn-mini">' + 'Delete' + '</button>';
				}
}],
			searching : false

		});
		$('#addressSave').on("click", function() {
			if ($('#addressForm').valid()) {
			var table = $('#addressTable').DataTable();

			table.row.add({
				addressType : $('#inputAddress').val(),
				houseNo : $('#houseNo').val(),
				road : $('#road').val(),
				district : $('#district').val(),
				subDistrict : $('#subDistrict').val(),
				zipcode : $('#zipcode').val(),
				province : $('#province').val()
				
				
			}).draw();
			$('#addressModal').modal('hide');
			};
		})

		$('#addressSave').on("click", function() {
			var insertData = "{";
			
			insertData+="address : [ ";
			var addressTable = $("#addressTable").DataTable();
			
			addressTable.rows().iterator( 'row', function ( context, index ) {
			insertData+="{";
			insertData+="applicant : {id :"+$('#applicant').val()+"},";
			insertData+="addressType : '"+addressTable.cell( index,0 ).data()+"',";
			insertData+="houseNo : '"+addressTable.cell( index,1 ).data()+"',";
			insertData+="road : '"+addressTable.cell( index,2 ).data()+"',";
			insertData+="district : '"+addressTable.cell( index,3 ).data()+"',";
			insertData+="subDistrict : '"+addressTable.cell( index,4 ).data()+"',";
			insertData+="zipcode : "+addressTable.cell( index,5 ).data()+",";
			insertData+="province : '"+addressTable.cell( index,6 ).data()+"'},";
			});
				insertData=insertData.substring(0,insertData.length-1);
				insertData+="]";
				insertData+="}";
			
			$.ajax({
				contentType : "application/json",
				type : "POST",
				url : '${pageContext.request.contextPath}/saveAddress',
				data : JSON.stringify(eval("(" + insertData + ")")),
				success : function(data) {
					alert(JSON.stringify(data));

					new PNotify({
				        title: 'Success',
				        text: 'Successful Add Address',
				        type: 'success',
				        nonblock: {
				            nonblock: true,
				            nonblock_opacity: .2
				        }
				    });
				}
			});
		})

	});
</script>
<jsp:include page = "applicationMenu.jsp"/>
<div id="address">
		<div class="row">
			<div class="col-md-6">
				<h1>Address</h1>
				<button class="btn btn-primary" id="addressAdd" data-toggle="modal"
					data-target="#addressModal">
					<span class="glyphicon glyphicon-plus"></span> Address
				</button>
			</div>
		</div>


		<div class="modal fade" id="addressModal" role="dialog">
			<div class="modal-dialog">

				<div class="modal-content">
					<div class="modal-header" style="padding: 35px 50px;">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4>
							<span class="glyphicon glyphicon-lock"></span> Address
						</h4>
					</div>
					<div class="modal-body" style="padding: 40px 50px;">
						<form role="form" id="addressForm" >
							<div class="form-group">
								<input type="hidden" id="applicant" name="applicant"
									value="${id}">
							</div>
							<label for="address">Address </label><select class="form-control" id="inputAddress" name="inputAddress">
								<option value="Present">Present</option>
								<option value="Permanent">Permanent</option>
							</select>
							<div class="form-group">
								<label for="houseNo">House No. </label> <input type="text"
									class="form-control" id="houseNo"
									name="houseNo" placeholder="Enter House No">
							</div>
							<div class="form-group">
								<label for="road">Road </label> <input type="text"
									class="form-control" id="road" name="road"
									placeholder="Enter road">
							</div>
							<div class="form-group">
								<label for="district">District </label> <input
									type="text" class="form-control" id="district"
									name="district" placeholder="Enter district">
							</div>
							<div class="form-group">
								<label for="subDistrict">Sub District </label> <input
									type="text" class="form-control" id="subDistrictId"
									name="subDistrictName" placeholder="Enter sub district">
							</div>
							<div class="form-group">
								<label for="zipcode">Zipcode </label> <input type="text"
									class="form-control" id="zipcode"
									name="zipcode" placeholder="Enter zipcode">
							</div>
							<div class="form-group">
								<label for="province">Province </label> <input
									type="text" class="form-control" id="province"
									name="province" placeholder="Enter province">
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
	
	<br> <br>
	<div>
		<table id="addressTable" class="display" cellspacing="0" width="100%">
			<thead>
				<tr>
					<th>ADDRESS_TYPE</th>
					<th>HOUSE_NO</th>
					<th>ROAD</th>
					<th>DISTRICT</th>
					<th>SUB_DISTRICT</th>
					<th>ZIPCODE</th>
					<th>PROVINCE</th>
					<th>Edit</th>
                	<th>Delete</th>
				</tr>
			</thead>


			<tbody></tbody>
		</table>
	</div>
</div>