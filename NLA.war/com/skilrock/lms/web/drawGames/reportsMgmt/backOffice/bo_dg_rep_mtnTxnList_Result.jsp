<%@page import="com.skilrock.lms.beans.DateBeans"%>
<%@page import="com.skilrock.lms.common.utility.GetDate"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.skilrock.lms.common.utility.FormatNumber"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<%
	response.setHeader("Cache-Control", "no-store"); //HTTP 1.1
	response.setHeader("Pragma", "no-cache"); //HTTP 1.0
	response.setDateHeader("Expires", 0); //prevents caching at the proxy server
%>
<head>
		<s:head theme="ajax" />
	</head>
<body onload="disable()">
	<br />
	<s:if test="merchantTransactioDataBeans.size>0">
	
					<s:form action="mtn_txn_report_export" method="post" enctype="multipart/form-data">
						<s:hidden id="tableValue" name="reportData" />
						<s:hidden name="reportName" value="MTN Transaction Report" />
						<s:submit key="btn.exportasexcel" cssStyle="margin-right:-400px;font-size:11px; text-align:center" onclick="createTableData();"/>
					</s:form>
				
				</s:if>
	<div align="center">
		<h3>
			<u>MTN Player Transaction Report From <s:property
					value="startDate" /> To <s:property value="endDate" /> </u>
		</h3>
	</div>
	<div id="tableDataDiv">
	<table  id="dataTable" width="100%" border="1" cellpadding="3" cellspacing="0"
		bordercolor="#CCCCCC" align="center">
		<s:if test="merchantTransactioDataBeans.size>0">
			<tr>
				<th>S.No</th>
				<th>Transaction Type</th>
				<th>Ticket Number</th>
				<th>Amount</th>
				<th>Wallet Name</th>
				<th>Transaction Date</th>
				<th>Winlot Transaction Id</th>
				<th>Winlot Transaction Status</th>
				<th>MTN Transaction Id</th>
			</tr>
			<tr>
				<s:iterator id="beanCart" value="merchantTransactioDataBeans"
					status="indx">
					<s:set name="data" value="%{value}"></s:set>
					<tr class="startSortable">
						<td><s:property value="#indx.index+1" />
						</td>
						<td><s:property value="txnType" />
						</td>
						<td><s:property value="ticketNumber" />
						</td>
						<td><s:property value="amount" />
						</td>
						<td><s:property value="walletName" /></td>
						<td><s:property value="txnDate" /></td>
						<td><s:property value="engineTxnId" /></td>
						<td><s:property value="engineTxnStatus" /></td>
						<td><s:property value="merchantTxnId" /></td>
					</tr>
				</s:iterator>

			</tr>
		</s:if>
		<s:else>
			<tr>
				<td colspan="9" align="center">No Records to Process</td>
			</tr>
		</s:else>
	</table>
	</div>
</body>
</html>

<code id="headId" style="visibility: hidden"> $RCSfile:
	bo_dg_rep_agtWinningList_Result.jsp,v $ $Revision: 1.1.6.2 $ </code>