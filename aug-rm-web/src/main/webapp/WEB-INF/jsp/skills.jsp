<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
#skill{
	background: #E0DFDD;
}

#skillTable{
	color:#414141;
	background-color: #ababab;
	margin-right: 5px;
}

#skillTable_info{
	margin-left: 5px;
}

#skillAdd{
	margin-left: 5px;
}

#table{
	padding: 15px 5px 65px 5px;
	margin-bottom : 100px;
	background: #E0DFDD;;

}


label{
	padding-left: 5px;
}

h1{
	padding-left: 5px;
}

</style>
<script>
$(document).ready(function() {
	
	$('#skillForm').validate({
		rules : {
			skill : {
				required : true
			}
		},
		messages : {
			skill : {
				required : "<spring:message code="valid.skill.skill"/>"
			}
		}
	});
	
	if(dtApplicant) {
		dtApplicant.ajax.reload();
	}
	else {
		var id = '${id}';
		dtApplicant = $('#skillTable').DataTable({
			paging: true,
			hover:false,
			sort:false,
			ajax : {
				url : '${pageContext.request.contextPath}/findByIdSkill/'+id,
				type : 'POST'
			},
			columns : [ {
				data : "skillDetail"
			},{ data : function(data) {
				 return '<button id="buttonEdit" data-id="'+data.id+'" data-toggle="modal" data-target="#skillModal" class="btn btn-warning btn-mini"><span class="glyphicon glyphicon-pencil"></span> <spring:message code="main.edit.info"/></button>';
			}
			},{ data : function(data) {
				 return '<button id="buttonDelete" data-id="'+data.id+'" data-toggle="modal" data-target="#deleteModal" class="btn btn-danger btn-mini"><span class="glyphicon glyphicon-remove-sign"></span> <spring:message code="main.delete"/></button>';
			}
		}],
			searching : false

		});
	}
	
	var dtApplicant;
	
	function saveSkill(){
		if ($('#skillForm').valid()) {
		var id = '${id}'
		var skillDetail = $("#skill").val();
		var json = {
				"applicant" : {"id" : id},
				"skillDetail" : skillDetail,
				};
		
		$.ajax({
			url : "${pageContext.request.contextPath}/skills/"+id,
			type : "POST",
			contentType :"application/json; charset=utf-8",
			data : JSON.stringify(json),
			success : function(data){
				$('#skillModal').modal('hide');
				dtApplicant.ajax.reload();
				
				new PNotify({
				    title: 'Edit Skill Success!!',
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
			url : "${pageContext.request.contextPath}/findSkillId/" + id,
			type : "POST",
			success : function(data){
				console.log(id);
				showFillData(data);
			}
		});
	}
	
	//Show data on inputField
	function showFillData(data){
		$("#skill").val(data.skillDetail);
 	}
	
	//Update function
	function updated(button){
		if ($('#skillForm').valid()) {
			var id = $(button).data("id");
			var skillDetail = $("#skill").val();
			var json = {
					"id" : id,
					"skillDetail" : skillDetail,
					};
			
			$.ajax({
				url : "${pageContext.request.contextPath}/updateSkills/"+id,
				type : "POST",
				contentType :"application/json; charset=utf-8",
				data : JSON.stringify(json),
				success : function(data){
					$('#skillModal').modal('hide');
					
					var table = $('#skillTable').DataTable();	
				 	var rowData = table.row(button.closest('tr')).index(); 
				 	var d = table.row(rowData).data();
				 	
			 		d.skillDetail = data.skillDetail;
			 		
			 		table.row(rowData).data(d).draw();
			 		
					new PNotify({
					    title: 'Edit Skill Success!!',
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
        var dtApplicant = $('#skillTable').DataTable();
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
	
    $('#skillModal').on('shown.bs.modal', function (e) {
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
				$('#skillForm')[0].reset();
				$('#btn_save').off('click').on('click', function(id){
					saveSkill();
				});
			}

		}
   });
    
    
	
	
	
});

</script>
<jsp:include page="applicationMenu.jsp" />
		<div class="container" id="skill">
			<div class="row">
				<div class="col-md-6">
					<h1><spring:message code="skill.name"/></h1>
					<button class="btn btn-primary" id="skillAdd" data-toggle="modal"
						data-target="#skillModal">
						<span class="glyphicon glyphicon-plus"></span> <spring:message code="skill.name.add"/>
					</button>
				</div>
			</div>
		
			<div class="modal fade" id="skillModal" role="dialog">
				<div class="modal-dialog">
		
					<div class="modal-content">
						<div class="modal-header" style="padding: 35px 50px;">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4>
								<span class="glyphicon glyphicon-lock"></span> <spring:message code="skill.name"/>
							</h4>
						</div>
						<div class="modal-body" style="padding: 40px 50px;">
							<form role="form" id="skillForm">
								<div class="form-group">
									<input type="hidden" id="applicant" name="applicant"
										value="${id}">
								</div>
								<div class="form-group">
									<label for="skill"><spring:message code="skill.detail"/> </label> <input type="text"
										class="form-control" id="skill" name="skill"
										placeholder="<spring:message code="skill.text.detail"/>">
								</div>
								<br> <br>
								<button type="button" class="btn btn-success" id="btn_save">
									<span class="glyphicon glyphicon-off"></span> <spring:message code="edit.button.save"/>
								</button>
								<button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="button.cancel"/></button>
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
			<div id="table">
				<table id="skillTable" class="display" cellspacing="0" width="100%">
					<thead>
						<tr>
							<th><spring:message code="skill.data"/></th>
							<th><spring:message code="main.edit.info"/></th>
                			<th><spring:message code="main.delete"/></th>
		
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</div>