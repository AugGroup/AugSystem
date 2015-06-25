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
				houseNo : {
					required : true
				},
				road : {
					required : true
				},
				district : {
					required : true
				},
				subDistrict : {
					required : true
				},
				zipcode : {
					required : true
				},
				province : {
					required : true
				}
			},
			messages : {
				inputAddress : {
					required : "Address is required!"
				},
				houseNo : {
					required : "House No. is required!"
				},
				road : {
					required : "Road is required!"
				},
				district : {
					required : "District is required!"
				},
				subDistrict : {
					required : "Sub District is required!"
				},
				province : {
					required : "Province is required!"
				}
			}
		});
		$('#emergencyForm').validate({
			rules : {
				
			},
			messages : {
				
			}
		});

		var dtApplicant	

		$('.input-group.date').datepicker({
			startView : 2,
			todayBtn : "linked",
			format : "dd/mm/yyyy"

		});
		
		if(dtApplicant) {
			dtOrder.ajax.reload();
		}
		else {
		
		var id = '${id}';
		$('#addressTable').DataTable({
			ajax : {
				url : '${pageContext.request.contextPath}/findByIdAddress/'+id,
				type : 'POST'
			},
			columns : [ {data : "addressType"},
						{data : "houseNo"},
						{data : "road"},
						{data : "district"},
						{data : "subDistrict"},
						{data : "zipcode"},
						{data : "province"},
						{data : function(data) {
					 		return '<button id="buttonEdit" data-id="'+data.id+'" data-toggle="modal" data-target="#addressModal" class="btn btn-warning btn-mini">' + 'Edit' + '</button>';
						}},
						{ data : function(data) {
					 		return '<button id="buttonDelete" data-id="'+data.id+'" data-toggle="modal" data-target="#deleteModal" class="btn btn-danger btn-mini">' + 'Delete' + '</button>';
						}}],
			searching : false

		});
		}
// 		$('#addressSave').on("click", function() {
// 			if ($('#addressForm').valid()) {
// 			var table = $('#addressTable').DataTable();

// 			table.row.add({
// 				addressType : $('#inputAddress').val(),
// 				houseNo : $('#houseNo').val(),
// 				road : $('#road').val(),
// 				district : $('#district').val(),
// 				subDistrict : $('#subDistrict').val(),
// 				zipcode : $('#zipcode').val(),
// 				province : $('#province').val()
				
				
// 			}).draw();
// 			$('#addressModal').modal('hide');
// 			};
// 		})

// 		if(dtApplicant){
// 			dtApplicant.ajax.reload();
// 		}else{
// 			var id = '${id}';
// 			dtApplicant = $('#addressTable').DataTable({
// 				ajax : {
// 					url : "${pageContext.request.contextPath}/findByIdAddress/" + id,
// 					type : "POST"
// 				},
// 				columns : [ {data : "addressType"},
// 					{data : "houseNo"},
// 					{data : "road"},
// 					{data : "district"}, 
// 					{data : "subDistrict"},
// 					{data : "zipcode"},
// 					{data : "province"},
// 			        {data : function(data){
// 			        	 return '<a href="#addressModal" id="btn_edit"  data-id="'+data.id+'" data-toggle="modal" class="btn btn-sm btn-warning"><span class="glyphicon glyphicon-pencil"></span> <spring:message code="main.edit.info"/></b>'
// 			        }}],
// 				searching : false

// 			});
// 		}
		
// 		function saveAddress(){
// 			$('#addressSave').on("click", function() {
// 				var table = $('#addressTable').DataTable();

// 				table.row.add({
// 					addressType : $('#inputAddress').val(),
// 					houseNo : $('#houseNoId').val(),
// 					road : $('#roadId').val(),
// 					district : $('#districtId').val(),
// 					subDistrict : $('#subDistrictId').val(),
// 					zipcode : $('#zipcodeId').val(),
// 					province : $('#provinceId').val()
// 				}).draw();
// 				$('#addressModal').modal('hide');
// 			})
// 		}

// <<<<<<< HEAD

// 		$('#addressSave').on("click", function() {
	
// =======
// 		$('#buttonSave').on("click", function() {
// 			if ($('#emergencyForm').valid()) {
// 				var inputData = {
				
// 				address : [ {
// 					applicant : {
// 						id : $('#applicantId').val()
// 					},
// 					addressType : $('#inputAddress').val(),
// 					houseNo : $('#permanentHouseNoId').val(),
// 					road : $('#permanentRoadId').val(),
// 					district : $('#permanentDistrictId').val(),
// 					subDistrict : $('#permanentSubDistrictId').val(),
// 					zipcode : $('#permanentZipcodeId').val(),
// 					province : $('#permanentProvinceId').val()

// 				} ],
// 				emergencyName : $('#emergencyNameId').val(),
// 				emergencyTel : $('#emergencyTelId').val(),
// 				emergencyAddress : $('#emergencyAddressId').val()
// 			}

// >>>>>>> Create AddressDTO
// 			var insertData = "{";
			
// 			insertData+="address : [ ";
// 			var addressTable = $("#addressTable").DataTable();
			
// 			addressTable.rows().iterator( 'row', function ( context, index ) {
// 			insertData+="{";
// 			insertData+="applicant : {id :"+$('#applicant').val()+"},";
// 			insertData+="addressType : '"+addressTable.cell( index,0 ).data()+"',";
// 			insertData+="houseNo : '"+addressTable.cell( index,1 ).data()+"',";
// 			insertData+="road : '"+addressTable.cell( index,2 ).data()+"',";
// 			insertData+="district : '"+addressTable.cell( index,3 ).data()+"',";
// 			insertData+="subDistrict : '"+addressTable.cell( index,4 ).data()+"',";
// 			insertData+="zipcode : "+addressTable.cell( index,5 ).data()+",";
// 			insertData+="province : '"+addressTable.cell( index,6 ).data()+"'},";
// 			});
// 				insertData=insertData.substring(0,insertData.length-1);
// 				insertData+="]";
// 				insertData+="}";
			
// 			$.ajax({
// 				contentType : "application/json",
// 				type : "POST",
// 				url : '${pageContext.request.contextPath}/saveAddress',
// 				data : JSON.stringify(eval("(" + insertData + ")")),
// 				success : function(data) {
// 					alert(JSON.stringify(data));

// 					new PNotify({
// 				        title: 'Success',
// 				        text: 'Successful Add Address',
// 				        type: 'success',
// 				        nonblock: {
// 				            nonblock: true,
// 				            nonblock_opacity: .2
// 				        }
// 				    });
// 				}
// 			});
// 		})
		
		//Find by Id
		function findById(id){
			$.ajax({
				url : "${pageContext.request.contextPath}/findAddressId/" + id,
				type : "POST",
				success : function(data){
					showFillData(data);
				}
			});
		}
		
		//Show data on inputField
		function showFillData(data){
			$('#inputAddress').val(data.addressType);
			$("#houseNo").val(data.houseNo);
			$("#road").val(data.road);
			$("#district").val(data.district);
			$("#subDistrict").val(data.subDistrict);
			$("#zipcode").val(data.zipcode);
			console.log(data.houseNo);
			
			$("#province").val(data.province);
		}
		
		//Update function
		function updateAddress(button){
			var id = $(button).data("id");
			var addressType = $('#inputAddress').val();
			var houseNo = $("#houseNo").val();
			var road = $('#road').val();
			var district = $("#district").val();
			var subDistrict = $("#subDistrict").val();
			var zipcode = $("#zipcode").val();
			var province = $("#province").val();
			console.log(id);
			
			var json = {
					"id" : id,
					"addressType" : addressType,
					"houseNo" : houseNo,
					"road" : road,
					"district" : district,
					"subDistrict" : subDistrict,
					"zipcode" : zipcode,
					"province" : province,
					};
			
			$.ajax({
				url : "${pageContext.request.contextPath}/updateAddress/"+id,
				type : "POST",
				contentType :"application/json; charset=utf-8",
				data : JSON.stringify(json),
				success : function(data){
					$('#addressModal').modal('hide');
					
					var table = $('#addressTable').DataTable();	
				 	var rowData = table.row(button.closest('tr')).index(); 
				 	var d = table.row(rowData).data();
				 		console.log(data.houseNo);

				 		d.addressType = data.addressType;
				 		d.houseNo = data.houseNo;
						d.road = data.road;
				 		d.district = data.district;
				 		d.subDistrict = data.subDistrict;
				 		d.zipcode = data.zipcode;
				 		d.province = data.province;
				 		
				 		table.row(rowData).data(d).draw();
				 		
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
		
		  //delete Modal
        $('#deleteModal').on('shown.bs.modal', function (e) {
            var button = e.relatedTarget;
            var id = $(button).data("id");
            if (id !== null) {
                $('#btn_delete_submit').off('click').on('click', function () {
                    deleted(button);
                });
            }
        });
        
        //delete function 
        function deleted(button) {
            var dtApplicant = $('#addressTable').DataTable();
            var id = $(button).data("id");
            var index = dtApplicant.row(button.closest("tr")).index();
            $.ajax({
                url: "${pageContext.request.contextPath}/delete/" + id,
                type: "POST",
                success: function () {
                	dtApplicant.row(index).remove().draw();
					new PNotify({
					    title: 'Delete Success',
					    text: 'You can delete data',
					    type: 'success',
					    nonblock: {
					        nonblock: true,
					        nonblock_opacity: .2
					    }
					});
                }
            });
        }
		
        $('#addressModal').on('shown.bs.modal', function (e) {
        	var button = e.relatedTarget;
			if(button != null){
				var id = $(button).data("id");
				if(id != null){
					console.log(id);
					findById(id);
					$('#btn_save').off('click').on('click', function(id){
						updateAddress(button);
					});
				}

			}
       });
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
									type="text" class="form-control" id="subDistrict"
									name="subDistrict" placeholder="Enter sub district">
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
							<button type="button" class="btn btn-success" id="btn_save">
								<span class="glyphicon glyphicon-off"></span> Save
							</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</form>
					</div>
				</div>
			</div>

		</div>
		
				<!-- Delete Model -->
		<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
    		<div class="modal-dialog">
        		<div class="modal-content">
            		<div class="modal-header">
                		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                		<h4 class="modal-title" id="ModalLabel"><spring:message code="delete.title"/></h4>
            		</div>
            		<div class="modal-body">
                		<h4 class="modal-title" id="ModalLabel"><spring:message code="delete.confirm.title"/></h4>
                		<br>
                		<div align="right">
                			<button  id="btn_delete_submit" type="button" class="btn btn-danger" data-dismiss="modal"><span class="glyphicon glyphicon-remove-sign"></span> <spring:message code="main.delete"/></button>
                			<button  id="btn_close" type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="button.cancel"/></button>
                		</div>
	            	</div>
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