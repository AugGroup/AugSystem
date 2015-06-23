<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	$(document).ready(function() {
		$('#familyForm').validate({
			rules : {
				nameFamilyName : {
					required : true
				},
				relationFamilyName : {
					required : true
				},
				occupationFamilyName : {
					required : true
				},
				addressFamilyName : {
					required : true
				},
				occupationName : {
					required : true
				},
				positionFamilyName : {
					required : true
				}
			},
			messages : {
				nameFamilyName : {
					required : "Spouse: Name is required!"
				},
				relationFamilyName : {
					required : "Marriage certificate No. is required!"
				},
				occupationFamilyName : {
					required : "Issued office is required!"
				},
				addressFamilyName : {
					required : "Address is required!"
				},
				occupationName : {
					required : "Occupation is required!"
				},
				positionFamilyName : {
					required : "Military service is required!"
				}
			}
			
			
		});
		
		$('#familyTable').DataTable({
			ajax : {
				url : '${pageContext.request.contextPath}/family',
				type : 'GET'
			},
			columns : [ {
				data : "name"
			}, {
				data : "relation"
			}, {
				data : "occupation"
			}, {
				data : "address"
			}, {
				data : "positionFamily"
			},{ data : function(data) {
				 return '<button id="buttonEdit" data-id="'+data.id+'" data-toggle="modal" data-target="#myModal" class="btn btn-warning btn-mini">' + 'Edit' + '</button>';
			}
			},{ data : function(data) {
				 return '<button id="buttonDelete" data-id="'+data.id+'" data-toggle="modal" data-target="#modalDelete" class="btn btn-danger btn-mini">' + 'Delete' + '</button>';
			}
		} ],
			searching : false

		});

			$('#familySave').on("click", function() {
// 				if($('#familyForm').valid()){
				var table = $('#familyTable').DataTable();
				
				table.row.add({
				name : $('#nameFamily').val(),
				relation : $('#relationFamily').val(),
				occupation : $('#occupationFamily').val(),
				address : $('#addressFamily').val(),
				positionFamily : $('#positionFamily').val()}).draw();
			
				$('#familyModal').modal('hide');
// 				};
			})
			$('#familySave').on("click", function() {
			var insertData = "{";
			
			insertData+="families : [ ";
			
			var familyTable = $("#familyTable").DataTable();
			familyTable.rows().iterator( 'row', function ( context, index ) {
			  
				insertData+="{";
				insertData+="applicant : {id :'"+$('#applicant').val()+"'},";
				insertData+="name : '"+familyTable.cell( index,0 ).data()+"',";
				insertData+="relation : '"+familyTable.cell( index,1 ).data()+"',";
				insertData+="occupation : '"+familyTable.cell( index,2 ).data()+"',";
				insertData+="address : '"+familyTable.cell( index,3 ).data()+"',";
				insertData+="positionFamily : '"+familyTable.cell( index,4 ).data()+"'},";
			});
			
			insertData=insertData.substring(0,insertData.length-1);
			insertData+="]}";
			
			$.ajax({
				contentType : "application/json",
				type : "POST",
				url : '${pageContext.request.contextPath}/saveFamily',
				data : JSON.stringify(eval("(" + insertData + ")")),
				success : function(data) {
					alert(JSON.stringify(data));

					new PNotify({
				        title: 'Success',
				        text: 'Successful Add Family!!!',
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
<jsp:include page="applicationMenu.jsp" />
 <div class="form-group">
					<label for="informationFamily">Information regarding family
						(Including Parents Brothers and Sisters) </label>
				</div>
					<div class="row">
						<div class="col-md-6">
							<h1>Family</h1>
							<button class="btn btn-primary" id="familyAdd"
								data-toggle="modal" data-target="#familyModal">
								<span class="glyphicon glyphicon-plus"></span> Family
							</button>
						</div>
					</div>
				<div class="modal fade" id="familyModal" role="dialog">
					<div class="modal-dialog">

						<div class="modal-content">
							<div class="modal-header" style="padding: 35px 50px;">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4>
									<span class="glyphicon glyphicon-lock"></span> Family
								</h4>
							</div>
							<div class="modal-body" style="padding: 40px 50px;">
								<form role="form" id="familyForm">
								<div class="form-group">
									<input type="hidden" id="applicant" name="applicant" value="${id}">
								</div>
									<div class="form-group">
										<label for="nameFamily">Name </label> <input type="text"
											class="form-control" id="nameFamily" name="nameFamily"
											placeholder="Enter name">
									</div>

									<div class="form-group">
										<label for="relationFamily">Relation </label> <input
											type="text" class="form-control" id="relationFamily"
											name="relationFamily" placeholder="Enter relation">
									</div>
									<div class="form-group">
										<label for="occupationFamily">Occupation </label> <input
											type="text" class="form-control" id="occupationFamily"
											name="occupationFamily" placeholder="Enter occupation ">
									</div>

									<div class="form-group">
										<label for="addressFamily">Address </label> 
										<textarea class="form-control" rows="5" id="addressFamily"
										name="addressFamily" placeholder="Enter address"></textarea>
									</div>

									<div class="form-group">
										<label for="positionFamily">Position </label> <input
											type="text" class="form-control" id="positionFamily"
											name="positionFamily" placeholder="Enter position">
									</div>
									<br> <br>
									<button type="button" class="btn btn-success"
										id="familySave">
										<span class="glyphicon glyphicon-off"></span> Save
									</button>
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
								</form>
							</div>
							<div class="modal-footer">
								<p>Please fill your information</p>
							</div>
						</div>

					</div>
				</div>
				<br> <br>
				<div>
					<table id="familyTable" class="display" cellspacing="0"
						width="100%">
						<thead>
							<tr>
								<th>NAME</th>
								<th>RELATION</th>
								<th>OCCUPATION</th>
								<th>ADDRESS</th>
								<th>POSITION_FAMILY</th>
								<th>Edit</th>
                				<th>Delete</th>

							</tr>
						</thead>


						<tbody></tbody>
					</table>

				</div>

