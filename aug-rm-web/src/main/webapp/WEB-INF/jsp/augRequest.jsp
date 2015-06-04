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
                $('#requestTable').dataTable( {
                    
                    ajax: {
                            type: "GET",
                            url: '${pageContext.request.contextPath}/findAllRequest',
                            data: function (d) {
                                $("#id").val(d.id);
                                $("#requestDate").val(d.requestDate);
                                $("#positionName").val(d.positionName);
                                $("#numberApplicant").val(d.numberApplicant);
                                $("#status").val(d.status);
                             }
                                
                           },
                    columns : [
                          {"data" : "id"},
                          {"data" : "requestDate"},
                          {"data" : "requesterName"},
                          {"data" : "positionName"},
                          {"data" : "numberApplicant"},
                          {"data" : "status"},
                          {data: function (data) {
                            return '<button id="sendBtn" class="btn btn-primary btn-success">Send <span class="glyphicon glyphicon-send"></span></button>';
                           }},
                          {data: function (data){ 
                           return '<button id="previewBtn" class="btn btn-primary btn-primary">Preview <span class="glyphicon glyphicon-search"></span></button>';   
                           }}
                      ]  
            
                });
                
            });
            
          
            
          </script>  

          <center><h1>Request Candidate</h1></center>>
         <table id="requestTable" class="cell-border" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th>Request Doc. ID</th>
                    <th>Date Request</th>
                    <th>Requester</th>
                    <th>Positon</th>
                    <th>Number of Applicant</th>
                    <th>Status</th>
                    <th>Send</th>
                    <th>Preview</th>
            
                </tr>
            </thead>
        </table>
        <button type="button" class="btn btn-primary btn-small" data-toggle="modal" data-target="#addModal">
            Request
        </button>
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
                            Position :  <input name="position" id="position"/><br>
                            Number of Applicant :   <input name="numberApplicant" id="numberApplicant" placeholder="Number of Applicant" /><br>
                            Specific Skill : <input name="specificSkill" id="specificSkill" /><br>
                            Year Experience : <input name="yearExperience" id="yearExperience" /><br>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <input id="buttonSaveReq" type="button" value="Save" class="btn btn-primary"/>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div> 


