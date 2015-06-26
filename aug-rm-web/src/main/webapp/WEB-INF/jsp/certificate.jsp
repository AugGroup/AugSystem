<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
$(document).ready(function() {
	
	var dtApplicant;
	
	$('#certificateForm').validate({
		rules : {
			certificate : {
				required : true
			}
		},
		messages : {
			certificate : {
				required : "Certificate is required!"
			}
		}
	});
	
	if(dtApplicant) {
		dtOrder.ajax.reload();
	}
	else {
	
	var id = '${id}';
	$('#certificateTable').DataTable({
		ajax : {
			url : '${pageContext.request.contextPath}/findByIdCertificate/'+id,
			type : 'POST'
		},
		columns : [ {
			data : "certificateName"
		} ,{ data : function(data) {
			 return '<button id="buttonEdit" data-id="'+data.id+'" data-toggle="modal" data-target="#certificateModal" class="btn btn-warning btn-mini">' + 'Edit' + '</button>';
		}
		},{ data : function(data) {
			 return '<button id="buttonDelete" data-id="'+data.id+'" data-toggle="modal" data-target="#deleteModal" class="btn btn-danger btn-mini">' + 'Delete' + '</button>';
		}
	}],
		searching : false

	});
	}

	$('#btn_save').on("click", function() {
		if ($('#certificateForm').valid()) {
		var table = $('#certificateTable').DataTable();

		table.row.add({
			certificate : $('#certificate').val()
		}).draw();
		$('#certificateModal').modal('hide');
		};
	})
	
	//Update 
	function findById(id){
		$.ajax({
			url : "${pageContext.request.contextPath}/findCertificateId/" + id,
			type : "POST",
			success : function(data){
				showFillData(data);
			}
		});
	}
	
	//Show data on inputField
	function showFillData(data){
		$("#certificate").val(data.certificateName);
 	}
	
	//Update function
	function updated(button){
		var id = $(button).data("id");
		var certificateName = $("#certificate").val();
		
		var json = {
				"id" : id,
				"certificateName" : certificateName,
				};
		
		$.ajax({
			url : "${pageContext.request.contextPath}/updateCertificates/"+id,
			type : "POST",
			contentType :"application/json; charset=utf-8",
			data : JSON.stringify(json),
			success : function(data){
				$('#certificateModal').modal('hide');
				
				var table = $('#certificateTable').DataTable();	
			 	var rowData = table.row(button.closest('tr')).index(); 
			 	var d = table.row(rowData).data();
			 	
				d.certificateName = data.certificateName;
			 		
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
        var dtApplicant = $('#certificateTable').DataTable();
        var id = $(button).data("id");
        var index = dtApplicant.row(button.closest("tr")).index();
        $.ajax({
            url: "${pageContext.request.contextPath}/deleteSkill/" + id,
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
	
    $('#certificateModal').on('shown.bs.modal', function (e) {
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
	<div class="row">
		<div class="col-md-6">
			<h1>Certificate</h1>
			<button class="btn btn-primary" id="certificateAdd"
				data-id="data.id" data-toggle="modal" data-target="#certificateModal">
				<span class="glyphicon glyphicon-plus"></span> Certificate
			</button>
		</div>
	</div>

	<div class="modal fade" id="certificateModal" role="dialog">
		<div class="modal-dialog">

			<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4>
						<span class="glyphicon glyphicon-lock"></span> Certificate
					</h4>
				</div>
				<div class="modal-body" style="padding: 40px 50px;">
					<form role="form" id="certificateForm">
						<div class="form-group">
							<input type="hidden" id="applicant" name="applicant"
								value="${id}">
						</div>
						<div class="form-group">
							<label for="certificate">Certificate </label> <input type="text"
								class="form-control" id="certificate" name="certificate"
								placeholder="Enter certificate">
						</div>
						<br> <br>
						<button type="button" class="btn btn-success" id="btn_save">
							<span class="glyphicon glyphicon-off"></span> Save
						</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</form>
				</div>
				<div class="modal-footer">
					<p>Please fill your information</p>
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
		<table id="certificateTable" class="display" cellspacing="0"
			width="100%">
			<thead>
				<tr>
					<th>CERTIFICATE</th>
					<th>Edit</th>
                	<th>Delete</th>

				</tr>
			</thead>


			<tbody></tbody>
		</table>

	</div>
