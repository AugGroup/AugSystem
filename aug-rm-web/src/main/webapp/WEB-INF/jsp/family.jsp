<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
#family {
	background: #E0DFDD;
}

#familyTable {
	color: #414141;
	background-color: #ababab;
	margin-right: 5px;
}

#familyAdd {
	margin-left: 5px;
}

#table {
	padding: 15px 5px 65px 5px;
	margin-bottom: 100px;
	background: #E0DFDD;;
}

#text {
	padding-left: 5px;
}

#familyAdd{
	margin-top: 15px;
	margin-right: 5px;
	float:right
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
					required : "<spring:message code="valid.ref.name"/>"
				},
				relationFamily : {
					required : "<spring:message code="valid.fam.relation"/>"
				},
				occupationFamily : {
					required : "<spring:message code="valid.fam.occ"/>"
				},
				addressFamily : {
					required : "<spring:message code="valid.addr.addr"/>"
				},
				occupation : {
					required : "<spring:message code="valid.fam.occ"/>"
				},
				positionFamily : {
					required : "<spring:message code="valid.ex.position"/>"
				}
			}
			
			
		});
		
		var dtApplicant;
		if(dtApplicant) {
			dtApplicant.ajax.reload();
		}else {
			var id = '${id}';
			dtApplicant = $('#familyTable').DataTable({
				paging: true,
				hover:false,
				sort:false,
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
					 			return '<button id="buttonEdit" data-id="'+data.id+'" data-toggle="modal" data-target="#familyModal" class="btn btn-warning btn-mini"><span class="glyphicon glyphicon-pencil"></span> <spring:message code="main.edit.info"/></button>';
							}},
							{data : function(data) {
					 			return '<button id="buttonDelete" data-id="'+data.id+'" data-toggle="modal" data-target="#deleteModal" class="btn btn-danger btn-mini"><span class="glyphicon glyphicon-remove-sign"></span> <spring:message code="main.delete"/></button>';
							}}],
				searching : false

			});
		}
			
		function saveFamily(){
			if ($('#familyForm').valid()) {
			var id = '${id}';
			var name = $("#nameFamily").val();
			var relation = $("#relationFamily").val();
			var occupation = $("#occupationFamily").val();
			var address = $("#addressFamily").val();
			var positionFamily = $("#positionFamily").val();
			
			var json = {"applicant" : {"id" : id},
						"name" : name,
						"relation" : relation,
						"occupation" : occupation,
						"address" : address,
						"positionFamily" : positionFamily,
						};
			$.ajax({
				contentType : "application/json; charset=utf-8",
				type : "POST",
				url : '${pageContext.request.contextPath}/family/'+id,
				data : JSON.stringify(json),
				success : function(data) {
					$('#familyModal').modal('hide');
					dtApplicant.ajax.reload();
					
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
			};

		}
		
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
			if ($('#familyForm').valid()) {
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
				}else{
					$('#familyForm')[0].reset();
					$('#btn_save').off('click').on('click', function(){
						saveFamily();
					});
				}

			}
	   });

	});
</script>
<jsp:include page="applicationMenu.jsp" />
<div class="container" id="family">
 <div class="form-group"><label for="informationFamily" id="text"><spring:message code="info.parent.number"/> </label></div>
				<div class="row">
						<div class="col-sm-12 col-xs-12 col-md-12 col-lg-12">
							<h3><spring:message code="family.name"/></h3>
							<button class="btn btn-warning" id="familyAdd" data-toggle="modal" data-target="#familyModal">
								<span class="glyphicon glyphicon-plus"></span> <spring:message code="family.name.add"/>
							</button>
						</div>
					</div>
				<div class="modal fade" id="familyModal" role="dialog">
					<div class="modal-dialog">

			<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4>
						<span class="glyphicon glyphicon-lock"></span>
						<spring:message code="family.name" />
					</h4>
				</div>
				<div class="modal-body" style="padding: 40px 50px;">
					<form role="form" id="familyForm">
						<div class="form-group">
							<input type="hidden" id="applicant" name="applicant"
								value="${id}">
						</div>
						<div class="form-group">
							<label for="nameFamily"><spring:message
									code="family.fname" /> </label> <input type="text" class="form-control"
								id="nameFamily" name="nameFamily"
								placeholder="<spring:message code="family.text.name"/>">
						</div>

						<div class="form-group">
							<label for="relationFamily"><spring:message
									code="family.relation" /> </label> <input type="text"
								class="form-control" id="relationFamily" name="relationFamily"
								placeholder="<spring:message code="family.text.relation"/>">
						</div>
						<div class="form-group">
							<label for="occupationFamily"><spring:message
									code="family.occupation" /> </label> <input type="text"
								class="form-control" id="occupationFamily"
								name="occupationFamily"
								placeholder="<spring:message code="info.text.occupation"/> ">
						</div>

						<div class="form-group">
							<label for="addressFamily"><spring:message
									code="address.name" /> </label>
							<textarea class="form-control" rows="5" id="addressFamily"
								name="addressFamily"
								placeholder="<spring:message code="info.text.address"/>"></textarea>
						</div>

						<div class="form-group">
							<label for="positionFamily"><spring:message
									code="info.position" /> </label> <input type="text"
								class="form-control" id="positionFamily" name="positionFamily"
								placeholder="<spring:message code="exp.text.position"/>">
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
		<table id="familyTable" class="display" cellspacing="0" width="100%">
			<thead>
				<tr>
					<th><spring:message code="family.data" /></th>
					<th><spring:message code="family.data.relation" /></th>
					<th><spring:message code="family.data.occupation" /></th>
					<th><spring:message code="family.data.address" /></th>
					<th><spring:message code="family.data.position" /></th>
					<th><spring:message code="main.edit.info" /></th>
					<th><spring:message code="main.delete" /></th>

				</tr>
			</thead>


			<tbody></tbody>
		</table>

	</div>
</div>

