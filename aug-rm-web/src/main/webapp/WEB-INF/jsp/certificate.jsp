<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
#certificate {
	background: #E0DFDD;
}

#certificateTable {
	color: #414141;
	background-color: #ababab;
	margin-right: 5px;
}

#certificateAdd {
	margin-left: 5px;
}

#table {
	padding: 15px 5px 65px 5px;
	margin-bottom: 100px;
	background: #E0DFDD;;
}

#certificateAdd{
	margin-top: 15px;
	margin-right: 5px;
	float:right
}

#buttonBack{
	margin-top: 15px;
	margin-right:15px;
	margin-bottom:15px;
	width: 90px;
	height: 30px;
	background-color: f4f4f4;
	font-family: "Regular";
	font-size: 14px;
	color: #414141;
}

h3{
	height: 30px;
	font-family: "SemiBold";
    font-size: 18px;
	color: #ffffff;
    border: 1px #F7C11F; 
    background: #ffc000;
	padding-left: 5px;
	margin-left: 5px;
	margin-right: 5px;
}
</style>
<script>
$(document).ready(function() {
	
	$('#certificateForm').validate({
		rules : {
			certificate : {
				required : true
			}
		},
		messages : {
			certificate : {
				required : "<spring:message code="valid.cer.cer"/>"
			}
		}
	});
	
	var dtApplicant;
	
	if(dtApplicant) {
		dtApplicant.ajax.reload();
	}
	else {
		var id = '${id}';
		dtApplicant = $('#certificateTable').DataTable({
			paging: true,
			hover:false,
			sort:false,
			ajax : {
				url : '${pageContext.request.contextPath}/findByIdCertificate/'+id,
				type : 'POST'
			},
			columns : [ {data : "certificateName"},
			            { data : function(data) {
				 			return '<button id="buttonEdit" data-id="'+data.id+'" data-toggle="modal" data-target="#certificateModal" class="btn btn-warning btn-mini"><span class="glyphicon glyphicon-pencil"></span> <spring:message code="main.edit.info"/></button>';
						}},
						{ data : function(data) {
							 return '<button id="buttonDelete" data-id="'+data.id+'" data-toggle="modal" data-target="#deleteModal" class="btn btn-danger btn-mini"><span class="glyphicon glyphicon-remove-sign"></span> <spring:message code="main.delete"/></button>';
						}}],
			searching : false

		});
	
	}

	function saveCertificate(){
		if ($('#certificateForm').valid()) {
		var id = '${id}'
		var certificateName = $("#certificate").val();
		var json = {
				"applicant" : {"id" : id},
				"certificateName" : certificateName,
				};
		
		$.ajax({
			url : "${pageContext.request.contextPath}/certificates/"+id,
			type : "POST",
			contentType :"application/json; charset=utf-8",
			data : JSON.stringify(json),
			success : function(data){
				$('#certificateModal').modal('hide');
				dtApplicant.ajax.reload();
				
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
		};
	}

	
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
		if ($('#certificateForm').valid()) {
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
        var dtApplicant = $('#certificateTable').DataTable();
        var id = $(button).data("id");
        var index = dtApplicant.row(button.closest("tr")).index();
        $.ajax({
            url: "${pageContext.request.contextPath}/deleteCertificate/" + id,
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
			}else{
				$('#certificateForm')[0].reset();
				$('#btn_save').off('click').on('click', function(id){
					saveCertificate();
				});
			}

		}
   });


});


</script>
<jsp:include page="applicationMenu.jsp" />
<div class="container" id="certificate">
	<div class="row">
		<div class="col-sm-12 col-xs-12 col-md-12 col-lg-12">
			<h3><spring:message code="cer.name"/></h3>
			<button class="btn btn-warning" id="certificateAdd"
				data-id="data.id" data-toggle="modal" data-target="#certificateModal">
				<span class="glyphicon glyphicon-plus"></span> <spring:message code="cer.name.add"/>
			</button>
			
		</div>
	</div>

	<div class="modal fade" id="certificateModal" role="dialog">
		<div class="modal-dialog">

			<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4>
						<span class="glyphicon glyphicon-lock"></span>
						<spring:message code="cer.name" />
					</h4>
				</div>
				<div class="modal-body" style="padding: 40px 50px;">
					<form role="form" id="certificateForm">
						<div class="form-group">
							<input type="hidden" id="applicant" name="applicant"
								value="${id}">
						</div>
						<div class="form-group">
							<label for="certificate"><spring:message code="cer.name" />
							</label> <input type="text" class="form-control" id="certificate"
								name="certificate"
								placeholder="<spring:message code="cer.text.name"/>">
						</div>
						<br> <br>
						<button type="button" class="btn btn-success" id="btn_save">
							<span class="glyphicon glyphicon-off"></span>
							<spring:message code="edit.button.save" />
						</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">
							<spring:message code="button.cancel" />
						</button>
					</form>
				</div>
				<div class="modal-footer">
					<p>
						<spring:message code="cer.ask" />
					</p>
				</div>
			</div>

		</div>
	</div>

	<!-- Delete Model -->
	<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
		aria-labelledby="ModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="ModalLabel">
						<spring:message code="delete.title" />
					</h4>
				</div>
				<div class="modal-body">
					<h4 class="modal-title" id="ModalLabel">
						<spring:message code="delete.confirm.title" />
					</h4>
					<br>
					<div align="right">
						<button id="btn_delete_submit" type="button"
							class="btn btn-danger" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove-sign"></span>
							<spring:message code="main.delete" />
						</button>
						<button id="btn_close" type="button" class="btn btn-default"
							data-dismiss="modal">
							<spring:message code="button.cancel" />
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br> <br>
	<div id="table">
		<table id="certificateTable" class="display" cellspacing="0"
			width="100%">
			<thead>
				<tr>
					<th><spring:message code="cer.data" /></th>
					<th><spring:message code="main.edit.info" /></th>
					<th><spring:message code="main.delete" /></th>

				</tr>
			</thead>


			<tbody></tbody>
		</table>
		<div align="right">
			<button type="button" id="buttonBack" name="buttonBack" onclick="window.location='${pageContext.request.contextPath}/applicant'"><span class="glyphicon glyphicon-step-backward"></span> Back </button>
		</div>
	</div>
</div>
