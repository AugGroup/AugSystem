<%-- 
    Document   : requestApprove
    Created on : Jun 4, 2015, 2:55:58 PM
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
                          {"data" : null,
                           "defaultContent" : "<select id='valueItems' >"
                            + "<option value ='0' selected ='selected'>Submit</option>"
                            + "<option value ='1'>Approve</option>"
                            + "<option value ='2'>Cancle</option></select>"
                          },
                          {data: function (data) {
                            return '<button id="sendBtn" class="btn btn-primary btn-success">Send <span class="glyphicon glyphicon-send"></span></button>';
                           }}
                      ]  
            
                });
                
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
            
                </tr>
            </thead>
         </table>

