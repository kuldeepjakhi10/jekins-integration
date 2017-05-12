<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" href="<%=request.getContextPath() %>/LMSImages/css/styles.css" type="text/css"/>
	<title><%=application.getAttribute("JSP_PAGE_TITLE")%></title>
</head>

<body>
	<%@include file="/com/skilrock/lms/web/loginMgmt/menu.jsp" %>

	<div id="wrap">
  	<div id="top_form">
  		<h3><s:text name="msg.inv.return.success"/> !!</h3>
  		<s:form method="get">
			
			
			 
			<table>
			<tr>
			  <td><s:a theme="simple" href="bo_im_consNonConsReturnInv_menu.action"><s:text name="label.dispatch.another.order"/></s:a></td>
			</tr>  
			<!--  
			<tr>  
			  <td>
			  <s:url  id="openpdf" action="rep_common_openPDF" namespace="/com/skilrock/lms/reports" />
			  <s:a theme="simple" href="%{openpdf}">Show Invoice</s:a></td>
			</tr>
			
			<tr>
			   <td>
			      <a  href="<%=request.getContextPath() %>/com/skilrock/lms/web/reportsMgmt/rep_common_openPDF.action" target="_blank">Show Invoice</a>
			  </td>
			</tr>
			-->
			<tr>
			   <td>
			      <a  href="<%=request.getContextPath() %>/com/skilrock/lms/web/inventoryMgmt/bo_rep_showDeliveryNote.action?id=<%=session.getAttribute("DEL_NOTE_ID") %>&type=DLCHALLAN" target="_blank"><s:text name="label.deliver.note"/></a>
			  </td>
			</tr>
			
			
			</table>		
		</s:form>
   	</div></div>

</body>

</html>
<code id="headId" style="visibility: hidden">
$RCSfile: bo_im_consNonConsReturnInv_success.jsp,v $
$Revision: 1.1.8.3.6.1 $
</code>