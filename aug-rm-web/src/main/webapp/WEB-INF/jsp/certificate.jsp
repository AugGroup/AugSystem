<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
$(document).ready(function() {
	
	$('#certificateForm').validate({
		rules : {
			certificateName : {
				required : true
			}
		},
		messages : {
			certificateName : {
				required : "Certificate is required!"
			}
		}
	});
	$('#certificateTable').DataTable({
		ajax : {
			url : '${pageContext.request.contextPath}/certificates',
			type : 'GET'
		},
		columns : [ {
			data : "certificate"
		} ,{ data : function(data) {
			 return '<button id="buttonEdit" data-id="'+data.id+'" data-toggle="modal" data-target="#myModal" class="btn btn-warning btn-mini">' + 'Edit' + '</button>';
		}
		},{ data : function(data) {
			 return '<button id="buttonDelete" data-id="'+data.id+'" data-toggle="modal" data-target="#modalDelete" class="btn btn-danger btn-mini">' + 'Delete' + '</button>';
		}
	}],
		searching : false

	});

	$('#certificateSave').on("click", function() {
		if ($('#certificateForm').valid()) {
		var table = $('#certificateTable').DataTable();

		table.row.add({
			certificate : $('#certificate').val()
		}).draw();
		$('#certificateModal').modal('hide');
		};
	})
	
	
	
	$('#certificateSave').on("click", function() {
		
			var insertData = "{";
			insertData+="certificates : [ ";
			var certificatesTable = $("#certificateTable").DataTable();
			
			certificatesTable.rows().iterator( 'row', function ( context, index ) {
			insertData+="{";
			insertData+="applicant : {id :"+$('#applicant').val()+"},";
			insertData+="certificateName : '"+certificatesTable.cell( index,0 ).data()+"'},";
			});
				insertData=insertData.substring(0,insertData.length-1);
				insertData+="]";
			insertData+="}";
	
	 		$.ajax({
				contentType : "application/json",
				type : "POST",
				url : '${pageContext.request.contextPath}/saveCertificates',
				data : JSON.stringify(eval("(" + insertData + ")")),
				success : function(data) {
					alert(JSON.stringify(data));
					new PNotify({
				        title: 'Success',
				        text: 'Successful Add Certificates!!!',
				        type: 'success',
				        nonblock: {
				            nonblock: true,
				            nonblock_opacity: .2
				        }
				    });
					
				
				}
			}); 
	});

});


</script>
<jsp:include page="applicationMenu.jsp" />
	<div class="row">
		<div class="col-md-6">
			<h1>Certificate</h1>
			<button class="btn btn-primary" id="certificateAdd"
				data-toggle="modal" data-target="#certificateModal">
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
						<button type="button" class="btn btn-success" id="certificateSave">
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
