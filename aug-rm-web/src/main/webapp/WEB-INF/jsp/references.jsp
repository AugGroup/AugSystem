<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	$(document).ready(function() {
		
		$('#referenceForm').validate({
			rules : {
				fullName : {
					required : true
				},
				completeAddress : {
					required : true,
				},
				telNo : {
					required : true,
				},
				occupationRef : {
					required : true,
				}
			},
			messages : {
				fullName : {
					required : "<spring:message code="valid.ref.name"/>"
				},
				completeAddress : {
					required : "<spring:message code="valid.addr.addr"/>"
				},
				telNo : {
					required : "<spring:message code="valid.ref.tel"/>"
				},
				occupationRef : {
					required : "<spring:message code="valid.fam.occ"/>"
				}
			}
		});
		
		var dtApplicant;
		
		if(dtApplicant) {
			dtApplicant.ajax.reload();
		}
		else {
			var id = '${id}';
			dtApplicant = $('#referenceTable').DataTable({
				ajax : {
					url : '${pageContext.request.contextPath}/findByIdReference/'+id,
					type : 'POST'
				},
				columns : [ {
					data : "fullName"}, 
					{data : "tel"}, 
					{data : "occupation"},
					{data : "completeAddress"},
					{data : function(data) {
						return '<button id="buttonEdit" data-type="edit" data-id="'+data.id+'" data-toggle="modal" data-target="#referenceModal" class="btn btn-warning btn-mini"><span class="glyphicon glyphicon-pencil"></span> <spring:message code="main.edit.info"/></button>';
					}},
					{data : function(data) {
						return '<button id="buttonDelete" data-id="'+data.id+'" data-toggle="modal" data-target="#deleteModal" class="btn btn-danger btn-mini"><span class="glyphicon glyphicon-remove-sign"></span> <spring:message code="main.delete"/></button>';
					}}],
				searching : false

			});
		}

		function saveReference(){
			if ($('#referenceForm').valid()) {
			var id = '${id}';
			var fullName = $("#fullName").val();
			var completeAddress = $("#completeAddress").val();
			var tel= $("#telNo").val();
			var occupation = $("#occupationRef").val();
			
			var json = {
					"applicant" : {"id" : id},
					"fullName" : fullName,
					"completeAddress" : completeAddress,
					"tel" : tel,
					"occupation" : occupation,
					};
	
	 		$.ajax({
				contentType : "application/json",
				type : "POST",
				url : '${pageContext.request.contextPath}/references/'+id,
				data : JSON.stringify(json),
				success : function(data) {
					$('#referenceModal').modal('hide');
					dtApplicant.ajax.reload();
					
					new PNotify({
				        title: 'Success',
				        text: 'Successful Add References!!!',
				        type: 'success',
				        nonblock: {
				            nonblock: true,
				            nonblock_opacity: .2
				        }
				    });
					
				
				}
			}); 
			};
		}
		
		//Update 
		function findById(id){
			$.ajax({
				url : "${pageContext.request.contextPath}/findReferenceId/" + id,
				type : "POST",
				success : function(data){
					showFillData(data);
				}
			});
		}
		
		//Show data on inputField
		function showFillData(data){
			$("#fullName").val(data.fullName);
			$("#completeAddress").val(data.completeAddress);
			$("#telNo").val(data.tel);
			$("#occupationRef").val(data.occupation);
	 	}
		
		//Update function
		function updated(button){
			if ($('#referenceForm').valid()) {
			var id = $(button).data("id");
			var fullName = $("#fullName").val();
			var completeAddress = $("#completeAddress").val();
			var tel= $("#telNo").val();
			var occupation = $("#occupationRef").val();
			
			var json = {
					"id" : id,
					"fullName" : fullName,
					"completeAddress" : completeAddress,
					"tel" : tel,
					"occupation" : occupation,
					};
			
			$.ajax({
				url : "${pageContext.request.contextPath}/updateReferences/"+id,
				type : "POST",
				contentType :"application/json; charset=utf-8",
				data : JSON.stringify(json),
				success : function(data){
					$('#referenceModal').modal('hide');
					
					var table = $('#referenceTable').DataTable();	
				 	var rowData = table.row(button.closest('tr')).index(); 
				 	var d = table.row(rowData).data();
			 		d.fullName = data.fullName;
			 		d.completeAddress = data.completeAddress;
			 		d.tel = data.tel;
			 		d.occupation = data.occupation;
			 		
			 		table.row(rowData).data(d).draw();
			 		
					new PNotify({
					    title: 'Edit Reference Success!!',
					    text: 'You can edit data',
					    type: 'success',
					    nonblock: {
					        nonblock: true,
					        nonblock_opacity: .2
					    }
					});
				 }
			});
			};
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
	        var dtApplicant = $('#referenceTable').DataTable();
	        var id = $(button).data("id");
	        var index = dtApplicant.row(button.closest("tr")).index();
	        $.ajax({
	            url: "${pageContext.request.contextPath}/deleteReference/" + id,
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
		
	    $('#referenceModal').on('shown.bs.modal', function (e) {
	    	var button = e.relatedTarget;
			if(button != null){
				var id = $(button).data("id");
				if(id != null){
					console.log(id);
					findById(id);
					$('#btn_save').off('click').on('click', function(id){
						updated(button);
					});
				}else{
					$('#referenceForm')[0].reset();
					$('#btn_save').off('click').on('click', function(id){
						saveReference();
					});
				}
			}
	   });
	});
</script>
<jsp:include page="applicationMenu.jsp" />
	<div class="form-group">
		<label for="reference"><spring:message code="ref.text"/> </label>
	</div>
	<br>
		<div class="row">
			<div class="col-md-6">
				<h1><spring:message code="ref.name"/></h1>
				<button class="btn btn-primary" id="referenceAdd"
					data-toggle="modal" data-target="#referenceModal">
					<span class="glyphicon glyphicon-plus"></span> <spring:message code="ref.name.add"/>
				</button>
			</div>
		</div>
		<div class="modal fade" id="referenceModal" role="dialog">
			<div class="modal-dialog">

				<div class="modal-content">
					<div class="modal-header" style="padding: 35px 50px;">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4>
							<span class="glyphicon glyphicon-lock"></span> <spring:message code="ref.name"/>
						</h4>
					</div>
					<div class="modal-body" style="padding: 40px 50px;">
						<form role="form" id="referenceForm">
							<div class="form-group">
								<input type="hidden" id="applicant" name="applicant"
									value="${id}">
							</div>
							<div class="form-group">
								<label for="fullNameRef"><spring:message code="ref.fullName"/> </label> <input type="text"
									class="form-control" id="fullName" name="fullName"
									placeholder="<spring:message code="ref.text.fullname"/>">
							</div>
							<div class="form-group">
								<label for="completeAddress"><spring:message code="ref.address"/> </label> <input
									type="text" class="form-control" id="completeAddress"
									name="completeAddress"
									placeholder="<spring:message code="ref.text.address"/>">
							</div>
							<div class="form-group">
								<label for="telNo"><spring:message code="ref.tel"/> </label> <input type="text"
									class="form-control" id="telNo" name="telNo"
									placeholder="<spring:message code="ref.text.tel"/>">
							</div>
							<div class="form-group">
								<label for="occupationRef"><spring:message code="family.occupation"/> </label> <input
									type="text" class="form-control" id="occupationRef"
									name="occupationRef" placeholder="<spring:message code="info.text.occupation"/>">
							</div>
							<br> <br>
							<button type="button" class="btn btn-success" id="btn_save">
								<span class="glyphicon glyphicon-off"></span> <spring:message code="edit.button.save"/>
							</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal"><spring:message code="button.cancel"/></button>
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
		<table id="referenceTable" class="display" cellspacing="0" width="100%">
			<thead>
				<tr>
					<th><spring:message code="ref.data"/></th>
					<th><spring:message code="ref.data.tel"/></th>
					<th><spring:message code="family.data.occupation"/></th>
					<th><spring:message code="ref.data.address"/></th>
					<th><spring:message code="main.edit.info"/></th>
                	<th><spring:message code="main.delete"/></th>
				</tr>
			</thead>


			<tbody></tbody>
		</table>
		</div>