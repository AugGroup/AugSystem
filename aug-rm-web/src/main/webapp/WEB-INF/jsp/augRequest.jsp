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
                {"data": "positionName"},
                {"data": "numberApplicant"},
                {"data": "status"},
                {data: function () {
                        return '<button id="previewBtn" class="btn btn-primary">Preview <span class="glyphicon glyphicon-search"></span></button>';
                    }},
                {data: function (data) {
                        return '<button id="editBtn" class="btn btn-warning" data-id="' + data.id + '" data-toggle="modal" data-target="#addModal">Edit <span class="glyphicon glyphicon-edit"></span></button>';
                    }},
                {data: function (data) {
                        return '<button id="deleteBtn" class="btn btn-danger" data-id="' + data.id + '" data-toggle="modal" data-target="#deleteModal">Delete <span class="glyphicon glyphicon-remove-sign"></span></button>';
                    }}
            ]

        });

        //delete Modal
        $('#deleteModal').off("click").on('shown.bs.modal', function (e) {
            var button = e.relatedTarget;
            var id = $(button).data("id");
            //var row = $(button). 
            if (id !== null) {

                $('#buttonDelete').on('click', function () {
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

        //addModal
        $('#addModal').off("click").on('shown.bs.modal', function (e) {
       
            var button = e.relatedTarget;
            if (button != null) {
                var id = $(button).data("id");
                if (id != null) {
                    editSearch(id);
                    $('#buttonSaveReq').off('click').on('click', function () {
                        edit(button);
                    });
                } else {
                    $('#form')[0].reset();
                    $('#buttonSaveReq').off('click').on('click', function () {
                        save();
                    });
                }
            }
        });

        //Button Save
        function save() {
            var request = {
                requesterName: $('#requesterName').val(),
                numberApplicant: $('#numberApplicant').val(),
                specificSkill: $('#specificSkill').val(),
                yearExperience: $('#yearExperience').val(),
                status: $('#status').val()
            };

            $.ajax({
                contentType: "application/json",
                type: "POST",
                url: '${pageContext.request.contextPath}/saveRequest',
                data: JSON.stringify(request),
                success: function (request) {
                    $('#addModal').modal('hide');
                    alert(request);
                   // dtRequest.ajax.reload();
                }
            });

        }
        // Edit 
        function editShowData(data) {
            $('#requesterName').val(data.requesterName);
            $('#numberApplicant').val(data.numberApplicant);
            $('#specificSkill').val(data.specificSkill);
            $('#yearExperience').val(data.yearExperience);
            $('#status').val(data.status);
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

            var requesterName = $('#requesterName').val();
            var numberApplicant = $('#numberApplicant').val();
            var specificSkill = $('#specificSkill').val();
            var yearExperience = $('#yearExperience').val();
            var status = $('status').val();
            var index = dtRequest.row(button.closest("tr")).index();

            var request = {
                'id': id,
                'requesterName': requesterName,
                'numberApplicant': numberApplicant,
                'specificSkill': specificSkill,
                'yearExperience': yearExperience, 
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
                    dt.numberApplicant = data.numberApplicant;
                    dt.specificSkill = data.specificSkill;
                    dt.yearExperience = data.yearExperience;
                    dt.status = data.status;
                    dtRequest.row(index).data(dt).draw();
                    $("#addModal").modal('hide');
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
<center><button id="addReqBtn"class="btn btn-primary btn-info" data-toggle="modal" data-target="#addModal"> Request <span class="glyphicon glyphicon-plus-sign"></span></button></center>
<!--add Modal--> 
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Request Applicant</h4>
            </div>
            <div class="modal-body">
                <form id="form" name="form" >   
                    <div class="form-group">
                        <label for="requesterName">Requester</label>
                        <input type="text" class="form-control" name="requesterName" id="requesterName" />
                    </div>
                    <div class="form-group">
                        <label for="position">Position</label> 
                        <select name="position" id="position" class="form-control">
                            <c:forEach items="${position}" var="position">
                                <option value="${position.id}">${position.positionName }</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="numberApplicant">Number of Applicant</label>
                        <input type="text" class="form-control" name="numberApplicant" id="numberApplicant" placeholder="Enter Number of Applicant" />
                    </div>
                    <div class="form-group">
                        <label for="specificSkill">Specific Skill </label>
                        <textarea type="text" class="form-control" name="specificSkill" id="specificSkill" placeholder="Enter Specific Skill"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="specificSkill">Year Experience</label>  
                        <input type="text" class="form-control" name="yearExperience" id="yearExperience" placeholder="Enter Year Experience"/>
                    </div>
                    <div class="form-group">
                        <label for="status">Status</label>
                        <select name="status" id='status' >
                            <option value ='New' selected ='selected'>New</option>
                            <option value ='Submit'>Submit</option></select>
                    </div>                   
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button id="buttonSaveReq" class="btn btn-primary btn-success">Save  <span class="glyphicon glyphicon-floppy-save"></span></button>
                    </div>
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
                <button  id="buttonClose" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button  id="buttonDelete" type="button" class="btn btn-primary" data-dismiss="modal">Delete</button>

            </div>
        </div>
    </div>  
</div>



