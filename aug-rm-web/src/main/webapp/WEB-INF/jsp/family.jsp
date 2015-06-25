<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	$(document).ready(function() {
		
		var dtApplicant;
		
		$('#familyForm').validate({
			rules : {
				nameFamily : {
					required : true
				},
				relationFamily : {
					required : true
				},
				occupationFamily : {
					required : true
				},
				addressFamily : {
					required : true
				},
				occupation : {
					required : true
				},
				positionFamily : {
					required : true
				}
			},
			messages : {
				nameFamily : {
					required : "Spouse: Name is required!"
				},
				relationFamily : {
					required : "Marriage certificate No. is required!"
				},
				occupationFamily : {
					required : "Issued office is required!"
				},
				addressFamily : {
					required : "Address is required!"
				},
				occupation : {
					required : "Occupation is required!"
				},
				positionFamily : {
					required : "Position service is required!"
				}
			}
			
			
		});
		
		if(dtApplicant) {
			dtOrder.ajax.reload();
		}
		else {
			var id = '${id}';
			$('#familyTable').DataTable({
				ajax : {
					url : '${pageContext.request.contextPath}/findByIdFamily/'+id,
					type : 'POST'
				},
				columns : [ {data : "name"},
							{data : "relation"},
							{data : "occupation"},
							{data : "address"},
							{data : "positionFamily"},
							{data : function(data) {
					 			return '<button id="buttonEdit" data-id="'+data.id+'" data-toggle="modal" data-target="#familyModal" class="btn btn-warning btn-mini">' + 'Edit' + '</button>';
							}},
							{data : function(data) {
					 			return '<button id="buttonDelete" data-id="'+data.id+'" data-toggle="modal" data-target="#deleteModal" class="btn btn-danger btn-mini">' + 'Delete' + '</button>';
							}}],
				searching : false

			});
		}

			$('#familySave').on("click", function() {
 				if($('#familyForm').valid()){
				var table = $('#familyTable').DataTable();
				
				table.row.add({
				name : $('#nameFamily').val(),
				relation : $('#relationFamily').val(),
				occupation : $('#occupationFamily').val(),
				address : $('#addressFamily').val(),
				positionFamily : $('#positionFamily').val()}).draw();
			
				$('#familyModal').modal('hide');
				};
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
		
		//Update 
		function findById(id){
			$.ajax({
				url : "${pageContext.request.contextPath}/findFamilyId/" + id,
				type : "POST",
				success : function(data){
					showFillData(data);
				}
			});
		}
		
		//Show data on inputField
		function showFillData(data){
			$("#nameFamily").val(data.name);
			$("#relationFamily").val(data.relation);
			$("#occupationFamily").val(data.occupation);
			$("#addressFamily").val(data.address);
			$("#positionFamily").val(data.positionFamily);
	 	}
		
		//Update function
		function updated(button){
			var id = $(button).data("id");
			var name = $("#nameFamily").val();
			var relation = $("#relationFamily").val();
			var occupation = $("#occupationFamily").val();
			var address = $("#addressFamily").val();
			var positionFamily = $("#positionFamily").val();
			
			var json = {
					"id" : id,
					"name" : name,
					"relation" : relation,
					"occupation" : occupation,
					"address" : address,
					"positionFamily" : positionFamily,
					};
			
			$.ajax({
				url : "${pageContext.request.contextPath}/updateFamily/"+id,
				type : "POST",
				contentType :"application/json; charset=utf-8",
				data : JSON.stringify(json),
				success : function(data){
					$('#familyModal').modal('hide');
					
					var table = $('#familyTable').DataTable();	
				 	var rowData = table.row(button.closest('tr')).index(); 
				 	var d = table.row(rowData).data();
				 	
					d.name = data.name,
					d.relation = data.relation,
					d.occupation = data.occupation,
					d.address = data.address,
					d.positionFamily = data.positionFamily,
				 		
				 		table.row(rowData).data(d).draw();
				 		
						new PNotify({
						    title: 'Edit Family Success!!',
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
		  
	    function deleted(button) {
	        var dtApplicant = $('#familyTable').DataTable();
	        var id = $(button).data("id");
	        var index = dtApplicant.row(button.closest("tr")).index();
	        $.ajax({
	            url: "${pageContext.request.contextPath}/deleteFamily/" + id,
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
		
	    $('#familyModal').on('shown.bs.modal', function (e) {
	    	var button = e.relatedTarget;
			if(button != null){
				var id = $(button).data("id");
				if(id != null){
					console.log(id);
					findById(id);
					$('#btn_save').off('click').on('click', function(id){
						updated(button);
					});
				}

			}
	   });

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
							<button class="btn btn-primary" id="familyAdd" data-toggle="modal" data-target="#familyModal">
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
										<label for="nameFamily">Name </label> 
										<input type="text" class="form-control" id="nameFamily" name="nameFamily" placeholder="Enter name">
									</div>

									<div class="form-group">
										<label for="relationFamily">Relation </label> 
										<input type="text" class="form-control" id="relationFamily" name="relationFamily" placeholder="Enter relation">
									</div>
									<div class="form-group">
										<label for="occupationFamily">Occupation </label> 
										<input type="text" class="form-control" id="occupationFamily" name="occupationFamily" placeholder="Enter occupation ">
									</div>

									<div class="form-group">
										<label for="addressFamily">Address </label> 
										<textarea class="form-control" rows="5" id="addressFamily" name="addressFamily" placeholder="Enter address"></textarea>
									</div>

									<div class="form-group">
										<label for="positionFamily">Position </label> 
										<input type="text" class="form-control" id="positionFamily" name="positionFamily" placeholder="Enter position">
									</div>
									<br> <br>
									<button type="button" class="btn btn-success" id="btn_save">
										<span class="glyphicon glyphicon-off"></span> Save
									</button>
									<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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

