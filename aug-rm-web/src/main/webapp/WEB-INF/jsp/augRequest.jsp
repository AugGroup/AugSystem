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
                          {"data" : "positionName"},
                          {"data" : "numberApplicant"},
                          {"data" : "status"},
                          {data: function (data) {
                            return '<button id="sendBtn" class="btn btn-danger btn-small" "><i class="icon-white icon-remove-circle"></i> Send</button>';
                           }}
                      ]  
            
                });
                
            });
            
          
            
          </script>  

        <h1>Request Candidate!</h1>
         <table id="requestTable" class="cell-border" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th>Request Doc. ID</th>
                    <th>Date Request</th>
                    <th>Positon</th>
                    <th>Number of Applicant</th>
                    <th>Status</th>
                    <th>Send</th>

                </tr>
            </thead>
        </table>


