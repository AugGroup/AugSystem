<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
	$(document).ready(function() {
		$(".submit").click(function() {
			$("form[name='reportForm']").submit();
			$("#reportModal").modal("hide");
		});
	});
</script>


<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	<h4 class="modal-title">Monthly Report</h4>
</div>
<f:form method="post" name="reportForm" target="_blank" commandName="applicant" action="${pageContext.request.contextPath}/searchMonthlyReport" cssClass="form-horizontal">
	 <div class="modal-body">
	 	Monthly Report
         <%-- <div class="form-group form-group-sm">
        	<div class="col-sm-3">
        	Search
        		${ searchfor }${ entity }
        	</div>
        	<div class="col-sm-6">
        		<f:input path="name" cssClass="form-control" placeholder="${ searchfor }${ entity }"/>
        	</div>
        </div>
        <div class="form-group form-group-sm">
        	<div class="col-sm-3">
        	Order By
        	</div>
        	<div class="col-sm-6">
        		<f:select path="sortingBy" cssClass="form-control">
        			<f:option value="applicantCode">Applicant Code</f:option>
        		</f:select>
        	</div>
        </div>
         <div class="form-group form-group-sm">
        	<div class="col-sm-3">
        	Document Type
	        </div>
	        <div class="col-sm-6">
        		<label class="radio-inline"><f:radiobutton  path="reportType" value="pdf"/>Pdf</label>
				<label class="radio-inline"><f:radiobutton path="reportType" value="xls"/>Xls</label>
        	</div> 
        </div>  --%>     	
      </div>

	<div class="modal-footer">
		<button type="button" class="btn btn-default submit" value="preview">Preview</button>
		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	</div>
</f:form>