<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<title>Request for Application</title>

<style type="text/css">
	.bs-example{
		margin: 20px;
     }
    .form-horizontal .control-label{
    	padding-top: 7px;
    }
</style>

<script type="text/javascript">
	$(document).ready(function () {
		$.ajaxSetup({
    		error: function(jqXHR, textStatus, errorThrown) 
	        {
	            var exceptionVO = jQuery.parseJSON(jqXHR.responseText);
	            console.log(jqXHR.status);
	            $('#exceptionModal')
	            .find('.modal-header h3').html(jqXHR.status+' error').end()
	            .find('.modal-body p>strong').html(exceptionVO.clazz).end()
	            .find('.modal-body p>em').html(exceptionVO.method).end()
	            .find('.modal-body p>span').html(exceptionVO.message).end()
	            .modal('show');
	            
	        } 
    	});
		/* ------------------- DataTable------------------- */
		var dtRequest;
		var dtRequest =$('#requestTable').DataTable({
			ajax: {
				type: "GET",
				url: '${pageContext.request.contextPath}/request/search',
				data: function (d) {
					$("#id").val(d.id);
					$("#requestDate").val(d.requestDate);
					$("#positionName").val(d.positionName);
					$("#numberApplicant").val(d.numberApplicant);
					$("#status").val(d.status);
					}
				},
				columns : [
				           {"data": "id"},
				           {"data": "requestDate"},
				           {"data": "requesterName"},
				           {"data": "positionStr"},
				           {"data": "numberApplicant"},
				           {"data": "status"},
				           {data: function (data) {
				        	   if(data.status!="Approve"){
				        	   		return '<button id="btn_approve" class="btn btn-primary" data-id="' + data.id + '" data-toggle="modal" data-target="#approveModal"> <spring:message code="edit.approve"/> </button>';				        
				        	   }else {
				        		   return '<button id="btn_approve" class="btn btn-primary" data-id="' + data.id + '" data-toggle="modal" data-target="#approveModal" disabled> <spring:message code="edit.approve"/> </button>';				        
					        	};
				        	}}
				           ]
				});
		
		/*------------------- Approve Modal Function------------------- */
		$('#approveModal').on('shown.bs.modal', function (e) {
			var button = e.relatedTarget;
			var id = $(button).data("id");
			if (id !== null) {
				editSearch(id);
				$('#btn_approve_submit').off('click').on('click', function () {
					approve(button);
					});
				}
			});
		/*------------------- Edit Function (Search id and fill)------------------- */
		function editSearch(id) {
        	$.ajax({
        		url: "${pageContext.request.contextPath}/request/search/" + id,
        		type: "POST",
        		success: function (data) {
        			 $('#inputStatus').val(data.status);
        			 console.log(data.status);
        		}
        	});
        }
/*------------------- Approve Function------------------- */
		function approve(button) {
			var id = $(button).data("id");
			var status = $('#inputStatus').val();
			var index = dtRequest.row(button.closest("tr")).index();
			var request = {
					'id': id,
					'status': status
					};
			
			$.ajax({
				contentType: "application/json",
				type: "POST",
				url: "${pageContext.request.contextPath}/approve/update/" + id,
				data: JSON.stringify(request),
				success: function (data) {
					//console.log(data.status);
					var dt = dtRequest.data();
					dt.id = data.id;
					dt.requesterName = data.requesterName;
					dt.requestDate = data.requestDate;
					dt.positionStr = data.positionStr;
					dt.numberApplicant = data.numberApplicant;
					dt.status = data.status;
					dtRequest.row(index).data(dt).draw();
					$("#approveModal").modal('hide');
					}
				});
			}
		
	});
</script>

<div class="container">
 	<div class="row">
		<h1 align="center"><spring:message code="request.title.approve"/></h1>
<!------------------- Request DataTable-------------------> 
    	<table id="requestTable" class="cell-border" style="width: 100%">
            <thead>
                <tr>
                    <th><spring:message code="request.id"/></th>
                    <th><spring:message code="request.date"/></th>
                    <th><spring:message code="request.human"/></th>
                    <th><spring:message code="info.position"/></th>
                    <th><spring:message code="request.number"/></th>
                    <th><spring:message code="main.status"/></th>
                    <th><spring:message code="request.approve"/></th>
                </tr>
            </thead>
         </table>
     </div>
         
         
<!------------------- Approve Modal ------------------->
<div class="modal fade" id="approveModal" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="ModalLabel"><spring:message code="request.ar"/></h4>
            </div>
            <div class="modal-body">
 				<div class="form-group">
 					<label for="inputStatus"><spring:message code="request.as"/></label>
                        <select name="inputStatus" id='inputStatus' class="form-control" >
                            <option value ='New Request' selected ='selected'><spring:message code="request.nr"/></option>
                            <option value ='Approve'><spring:message code="edit.approve"/></option>
                            <option value ='Not Approve'><spring:message code="edit.notApprove"/></option>
                        </select>
                    </div>  
                <button  id="btn_approve_submit" type="button" class="btn btn-primary" data-dismiss="modal"><spring:message code="edit.button.save"/></button>
                <button  id="btn_close" type="button" class="btn btn-default" data-dismiss="modal">><spring:message code="button.cancel"/></button>
                
            </div>
        </div>
    </div>  
</div>

<!-------------------- Exception Model -------------------->
<div class="modal fade" id="exceptionModal" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="ModalLabel">Exception Handler</h3>
            </div>
            <div class="modal-body">
            	<div class="container">
            		<div class="row">
            			<div class="col-sm-5">
               	 			<p><b></b><em></em><span></span></p>
               	 		</div>
            		</div>
            		<div class="row">
               	 		<h4>Please contact support.</h4>
            		</div>
                	<div class="row">
                		<div class="col-sm-4"></div>
                		<div class="col-sm-2">
							<button  id="btn_close" type="button" class="btn btn-default" data-dismiss="modal">><spring:message code="button.cancel"/></button>
            			</div>
            		</div>
            	</div>
        	</div>
    	</div>  
	</div>
</div>




</div>
