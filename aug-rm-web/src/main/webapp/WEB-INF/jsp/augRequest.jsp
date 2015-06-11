<%-- 
    Document   : augRequest
    Created on : May 29, 2015, 3:51:22 PM
    Author     : Supannika Pattanodom
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<title>Request for Application</title>

<style type="text/css">
    .bs-example{
        margin: 20px;
    }
    /* Fix alignment issue of label on extra small devices in Bootstrap 3.2 */
    .form-horizontal .control-label{
        padding-top: 7px;
    }
</style>

<script type="text/javascript">
    $(document).ready(function () {
    	//Date picker format
    	$('.input-group.date').datepicker({
			format: "dd/mm/yyyy",
			startView: 2
			});
    	
        var dtRequest;

        var dtRequest = $('#requestTable').DataTable({           
            ajax: {
                type: "GET",
                url: '${pageContext.request.contextPath}/findAllRequest'
            },
            columns: [
                {"data": "id"},
                {"data": "requestDate"},
                {"data": "requesterName"},
                {"data": "positionStr"},
                {"data": "numberApplicant"},
                {"data": "status"},
                {data: function () {
                        return '<button id="btn_preview" class="btn btn-primary">Preview <span class="glyphicon glyphicon-search"></span></button>';
                    }},
                {data: function (data) {
                        return '<button id="btn_edit" class="btn btn-warning" data-id="' + data.id + '" data-toggle="modal" data-target="#addRequestModal">Edit <span class="glyphicon glyphicon-edit"></span></button>';
                    }},
                {data: function (data) {
                        return '<button id="btn_delete" class="btn btn-danger" data-id="' + data.id + '" data-toggle="modal" data-target="#deleteModal">Delete <span class="glyphicon glyphicon-remove-sign"></span></button>';
                    }}
            ]

        });

        //delete Modal
        $('#deleteModal').off("click").on('shown.bs.modal', function (e) {
            var button = e.relatedTarget;
            var id = $(button).data("id");
            if (id !== null) {

                $('#btn_delete_submit').on('click', function () {
                    deleted(button);
                });
            }
        });
        //delete function 
        function deleted(button) {
            var dtRequest = $('#requestTable').DataTable();
            var id = $(button).data("id");
            var index = dtRequest.row(button.closest("tr")).index();
            $.ajax({
                url: "${pageContext.request.contextPath}/deleteRequest/" + id,
                type: "POST",
                success: function () {
                    dtRequest.row(index).remove().draw();
                }
            });
        }

        //addRequestModal
        $('#addRequestModal').off("click").on('shown.bs.modal', function (e) {
       
            var button = e.relatedTarget;
            if (button != null) {
                var id = $(button).data("id");
                if (id != null) {
                    editSearch(id);
                    $('#btn_save_req').off('click').on('click', function () {
                        edit(button);
                    });
                } else {
                    $('#form')[0].reset();
                    $('#btn_save_req').off('click').on('click', function () {
                        save();
                    });
                }
            }
        });

        //Button Save
        function save() {
            var request = {
                requesterName: $('#inputRequesterName').val(),
                requestDate: $('#inputRequestDate').val(),
                approvalName: $('#inputApprovalName').val(),
                ApprovalDate: $('#inputApproveDate').val(),
                numberApplicant : $('#inputNumberApplicant').val(),
                specificSkill: $('#inputSpecificSkill').val(),
                yearExperience : $('#inputYearExperience').val(),
                position : $('#inputPosition').val(),
                status: $('#inputStatus').val()
            };

            $.ajax({
                contentType: "application/json",
                type: "POST",
                url: '${pageContext.request.contextPath}/saveRequest',
                data: JSON.stringify(request),
                success: function (request) {
                    $('#addRequestModal').modal('hide');
                    alert(request);
                   // dtRequest.ajax.reload();
                }
            });

        }
        // Edit 
        function editShowData(data) {
            $('#inputRequesterName').val(data.requesterName);
            $('#inputRequestDate').val(data.requestDate);
            $('#inputApprovalName').val(data.approvalName);
            $('#inputApproveDate').val(data.approveDate);
            $('#inputNumberApplicant').val(data.numberApplicant);
            $('#inputSpecificSkill').val(data.specificSkill);
            $('#inputYearExperience').val(data.yearExperience);
            $('#inputPosition').val(data.positionRequest);
            $('#inputStatus').val(data.status);
        }

        function editSearch(id) {

            $.ajax({
                url: "${pageContext.request.contextPath}/searchRequest/" + id,
                type: "POST",
                success: function (data) {
                    editShowData(data);
                }
            });

        }

        function edit(button) {
            var id = $(button).data("id");

            var requesterName = $('#inputRequesterName').val();
            var requestDate = $('#inputRequestDate').val();
            var approvalName = $('#inputApprovalName').val();
            var approveDate = $('#inputApproveDate').val();
            var numberApplicant = $('#inputNumberApplicant').val();
            var specificSkill = $('#inputSpecificSkill').val();
            var yearExperience = $('#inputYearExperience').val();
            var positionRequest = $('#inputPosition').val();
            var status = $('#inputStatus').val();
            var index = dtRequest.row(button.closest("tr")).index();
            console.log(requestDate);
            var request = {
                'id': id,
                'requesterName': requesterName,
                'requestDate' : requestDate,
                'approvalName' : approvalName,
                'approveDate' : approveDate,
                'numberApplicant': numberApplicant,
                'specificSkill': specificSkill,
                'yearExperience': yearExperience, 
                'positionRequest':positionRequest,
                'status': status
            };

            $.ajax({
                contentType: "application/json",
                type: "POST",
                url: "${pageContext.request.contextPath}/editRequest/" + id,
                data: JSON.stringify(request),
                success: function (data) {
                    var dt = dtRequest.data();
                    dt.requesterName = data.requesterName;
                    dt.requestDate = data.requestDate;
                    dt.approvalName = data.approvalName;
                    dt.approveDate = data.approveDate;
                    dt.numberApplicant = data.numberApplicant;
                    dt.specificSkill = data.specificSkill;
                    dt.yearExperience = data.yearExperience;
                    dt.status = data.status;
                    dt.positionRequest = data.positionRequest;
                    dtRequest.row(index).data(dt).draw();
                    $("#addRequestModal").modal('hide');
                }
            });
        }

        //Preview 
//        function previewShowData(data) {
//            $('#requesterName').val(data.requesterName);
//            $('#numberApplicant').val(data.numberApplicant);
//            $('#specificSkill').val(data.specificSkill);
//            $('#yearExperience').val(data.yearExperience);
//            $('#status').val(data.status);
//        }
//
//        function preview(id) {
//
//            $.ajax({
//                url: "${pageContext.request.contextPath}/searchRequest/" + id,
//                type: "POST",
//                success: function (data) {
//                    previewShowData(data);
//                }
//            });
//
//        }

    });

</script>  

<center><h1>Request Candidate</h1></center>
<table id="requestTable" class="cell-border" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>Request Doc. ID</th>
            <th>Date Request</th>
            <th>Requester</th>
            <th>Position</th>
            <th>Number of Applicant</th>
            <th>Status</th>
            <th>Preview</th>
            <th>Edit</th>
            <th>Delete</th>

        </tr>
    </thead>
</table>
<center><button id="btn_addReq"class="btn btn-primary btn-info" data-toggle="modal" data-target="#addRequestModal"> Request <span class="glyphicon glyphicon-plus-sign"></span></button></center>
<!--add Modal--> 
<div class="modal fade" id="addRequestModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Request Applicant</h4>
            </div>
            <div class="modal-body">
                <form id="form" name="form" >   
                    <div class="form-group">
                        <label for="inputRequesterName">Requester</label>
                        <input type="text" class="form-control" name="inputRequesterName" id="inputRequesterName" />
                    </div>
                    <div class="form-group">
                    	<label for="inputRequestDate">Requester Date</label>
                    	<div class="input-group date">
                    		<input type="text" class="form-control" name="inputRequestDate" id="inputRequestDate"><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
    					</div>
    				</div>
                    <div class="form-group">
                        <label for="inputPosition">Position</label> 
                        <select name="inputPosition" id="inputPosition" class="form-control">
                            <c:forEach items="${positionRequest}" var="items">
                                <option value="${items.id}">${items.positionName }</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="inputApprovalName">Approval Name</label>
                        <input type="text" class="form-control" name="inputApprovalName" id="inputApprovalName" />
                    </div>
                    <div class="form-group">
                    	<label for="inputApproveDate">Approval Date</label>
                    	<div class="input-group date">
                    		<input type="text" class="form-control" name="inputApproveDate" id="inputApproveDate"><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
    					</div>
    				</div>
                    <div class="form-group">
                        <label for="inputNumberApplicant">Number of Applicant</label>
                        <input type="text" class="form-control" name="inputNumberApplicant" id="inputNumberApplicant" placeholder="Enter Number of Applicant" />
                    </div>
                    <div class="form-group">
                        <label for="inputSpecificSkill">Specific Skill </label>
                        <textarea type="text" class="form-control" name="inputSpecificSkill" id="inputSpecificSkill" placeholder="Enter Specific Skill"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="inputYearExperience">Year Experience</label>  
                        <input type="text" class="form-control" name="inputYearExperience" id="inputYearExperience" placeholder="Enter Year Experience"/>
                    </div>
                    <div class="form-group">
                        <label for="inputStatus">Status</label>
                        <select name="inputStatus" id='inputStatus' >
                            <option value ='NEW' selected ='selected'>NEW</option>
                            <option value ='SUBMIT'>SUBMIT</option></select>
                    </div>  
                   </div>                
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button id="btn_save_req" class="btn btn-primary btn-success">Save <span class="glyphicon glyphicon-floppy-save"></span></button>
                    </div>
            
            </form>
        </div>
    </div>
</div>
<!-- Delete Model -->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="ModalLabel">Delete Request</h4>
            </div>
            <div class="modal-body">
                Do you want to delete request ?
                <br>
                <button  id="btn_close" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button  id="btn_delete_submit" type="button" class="btn btn-primary" data-dismiss="modal">Delete</button>

            </div>
        </div>
    </div>  
</div>



