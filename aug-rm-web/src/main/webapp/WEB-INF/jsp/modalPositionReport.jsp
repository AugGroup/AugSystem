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
	<h4 class="modal-title">Position Report</h4>
</div>
<f:form method="post" name="reportForm" target="_blank" commandName="applicant" action="${pageContext.request.contextPath}/searchPositionReport" cssClass="form-horizontal">
	<div class="modal-body">
	 Position Report
	</div>

	<div class="modal-footer">
		<button type="button" class="btn btn-default submit" value="preview">Preview</button>
		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	</div>
</f:form>