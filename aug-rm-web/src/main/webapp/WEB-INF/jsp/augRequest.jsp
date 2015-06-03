<%-- 
    Document   : augRequest
    Created on : May 29, 2015, 3:51:22 PM
    Author     : Supannika Pattanodom
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script> 
        <!--Data Table-->
        <link rel="stylesheet" type="text/css" href="<c:url value="/static/resources/css/jquery.dataTables.min.css"/>">
        <script type='text/javascript' src="<c:url value="/static/resources/js/jquery.dataTables.min.js"/>"></script>
        
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
    </head>
    <body>
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
        
        
    </body>
</html>
