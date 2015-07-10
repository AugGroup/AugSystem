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
				        	   return '<button id="btn_approve" class="btn btn-primary" data-id="' + data.id + '" data-toggle="modal" data-target="#approveModal"> Approve </button>';				        
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
		<h1 align="center">Request Candidate</h1>
<!------------------- Request DataTable-------------------> 
    	<table id="requestTable" class="cell-border" style="width: 100%">
            <thead>
                <tr>
                    <th>Request Doc. ID</th>
                    <th>Request Date</th>
                    <th>Requester</th>
                    <th>Position</th>
                    <th>Number of Applicant</th>
                    <th>Status</th>
                    <th>Approve</th>
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
                <h4 class="modal-title" id="ModalLabel">Approve Request</h4>
            </div>
            <div class="modal-body">
 				<div class="form-group">
 					<label for="inputStatus">Approve Status</label>
                        <select name="inputStatus" id='inputStatus' class="form-control" >
                            <option value ='New Request' selected ='selected'>New Request</option>
                            <option value ='Approve'>Approve</option>
                            <option value ='Not Approve'>Not Approve</option>
                        </select>
                    </div>  
                <button  id="btn_approve_submit" type="button" class="btn btn-primary" data-dismiss="modal">Submit</button>
                <button  id="btn_close" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                
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
							<button  id="btn_close" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            			</div>
            		</div>
            	</div>
        	</div>
    	</div>  
	</div>
</div>




</div>
