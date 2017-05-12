<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.skilrock.lms.common.utility.FormatNumber"%>

<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

	<head>

		<meta http-equiv="Content-Type"
			content="text/html; charset=iso-8859-1" />

		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/LMSImages/css/styles.css"
			type="text/css" />

		<title><%=application.getAttribute("JSP_PAGE_TITLE")%></title>
		<s:head theme="ajax" debug="false" />
		<script>var path = "<%=request.getContextPath()%>";
			</script>
		<script
			src="<%=request.getContextPath()%>/com/skilrock/lms/web/accMgmt/backOffice/js/updatePostSaleCommData.js" />
		<script></script>

	</head>
	<body>
		<%@include file="/com/skilrock/lms/web/loginMgmt/menu.jsp"%>

		<div id="wrap">

			<div id="top_form">
				<h3>
					Deposit Expense
				</h3>

<div id="mainDiv">
				<table width="100%" border="1" cellpadding="2" cellspacing="0"
	bordercolor="#CCCCCC" align="center" valign="top">
	<tr>
		<th width="5%"> 
			S.No
		</th>
		<th width="25%">
			Agent Name
		</th>
		<th width="10%">
			Default Deposit Comm 
		</th>
		<th width="15%">
			Variance
		</th>
		<th width="10%">
			Total Deposit Comm
		</th>
		<th width="15%">
			<input type="checkbox" onclick="selAll(this.checked)" />
			Update All
		</th>
	<!-- 	<th>
			Update
		</th>  -->
		<th width="30%">
			Message
		</th>
	</tr>
	<s:iterator id="task" value="%{depositOrgCommMap}" status="taskIndex">
		<s:set name="bean" value="%{value}" />
		<tr id="row<s:property value="#taskIndex.index+1" />">
			<td>
				<s:property value="#taskIndex.index+1" />
				<s:hidden name="agtId" value="%{value.orgId}" />
			</td>
			<td>
				<s:property value="value.orgName" />
			</td>
			<td align="right">
				<s:hidden id="defDepositPer" value="%{value.defaultCommVar}"></s:hidden>
				<s:property value="value.defaultCommVar" />
			</td>
			<td>
				<input type="text" name="depositVar"
					id="depositVar<s:property value="#taskIndex.index+1" />"
					value="<s:property value="value.commVar" />"
					maxLength="10" size="5" onkeypress="return onlyDecimalSigned(event,this)"
					onchange="updRowColor('<s:property value="#taskIndex.index+1" />')" />
			</td>
			<td align="right">
			<s:set name="valueToDisplay" value="%{value.totalCommVar}" />
			  <%=FormatNumber.formatNumberForJSP(pageContext.getAttribute("valueToDisplay")) %>				
			</td>
			<td>
				<input type="checkbox" name="tempStatus"
					id="chkBox<s:property value="#taskIndex.index+1" />" />
			</td>
		<!--  	<td>
				<input type="button"
					onclick="updateData('<s:property value="#taskIndex.index" />')"
					value="Update" class="button" />
			</td> -->
			<td>
				<s:property value="value.errorMsg" />
				<div  id="msg<s:property value="#taskIndex.index+1" />"></div>
			</td>
		</tr>
	</s:iterator>
	<tr>
		<td colspan="5" align="center">
			<table>
				<input type="button" onclick="updateRetailerSelected()"
					value="Update Selected" class="button" />
			</table>
		</td>
	</tr>
</table>
</div>
			</div>
		</div>
<div id="resultDiv" style="display: none">
					</div>
	</body>
</html>

<code id="headId" style="visibility: hidden">
$RCSfile: agt_act_updateRetailerPostSale_CommVar.jsp,v $
$Revision: 1.1.2.1 $
</code>