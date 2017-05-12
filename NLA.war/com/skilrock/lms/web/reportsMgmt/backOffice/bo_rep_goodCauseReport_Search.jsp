<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@page import="com.skilrock.lms.common.utility.FormatNumber"%>
<%@page import="com.skilrock.lms.common.utility.GetDate"%>
<%
	response.setHeader("Cache-Control", "no-store"); //HTTP 1.1
	response.setHeader("Pragma", "no-cache"); //HTTP 1.0
	response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/LMSImages/css/styles.css" type="text/css" />
		<title><%=application.getAttribute("JSP_PAGE_TITLE")%></title>
		<s:head theme="ajax" debug="false" />
	</head>
	<body>
		<div id="wrap">
			<div id="top_form">
				<div>
					<s:if test="%{reportList neq null and reportList.size>0}">
						<s:set name="saleAmt" value="0.0" />
						<s:set name="winAmt" value="0.0" />
						<table width="100%" border="1" cellpadding="2" cellspacing="0" bordercolor="#CCCCCC" align="center" valign="top" id="searchTable">
							<tr>
								<th>Service</th>
								<th>Game</th>
								<th>Tax Calculated on Sale</th>
								<th>Tax Calculated on Winning</th>
								<th align="center"><center>Total</center></th>
							</tr>
							<s:iterator value="reportList" status="taskIndex">
								<tr>
									<s:set name="rightTot" value="%{saleUnapprovedAmount + saleApprovedAmount + saleDoneAmount + winningUnapprovedAmount + winningApprovedAmount + winningDoneAmount}" />
									<td><s:property value="serviceCode"/></td>
									<td><s:property value="gameName"/></td>
									<s:set name="sale" value="%{saleUnapprovedAmount + saleApprovedAmount + saleDoneAmount}" />
									<td><%=FormatNumber.formatNumberForJSP(pageContext.getAttribute("sale"))%></td>
									<s:set name="win" value="%{winningUnapprovedAmount + winningApprovedAmount + winningDoneAmount}" />
									<td><%=FormatNumber.formatNumberForJSP(pageContext.getAttribute("win"))%></td>
									<td><%=FormatNumber.formatNumberForJSP(pageContext.getAttribute("rightTot"))%></td>

									<s:set name="saleAmt" value="%{#saleAmt + saleUnapprovedAmount + saleApprovedAmount + saleDoneAmount}" />
									<s:set name="winAmt" value="%{#winAmt + winningUnapprovedAmount + winningApprovedAmount + winningDoneAmount}" />
								</tr>
							</s:iterator>
							<tr>
								<td colspan="2">Total</td>
								<td><%=FormatNumber.formatNumberForJSP(pageContext.getAttribute("saleAmt"))%></td>
								<td><%=FormatNumber.formatNumberForJSP(pageContext.getAttribute("winAmt"))%></td>
								<td>&nbsp;</td>
							</tr>
						</table>
					</s:if>
					<s:else>
						<center><h1>NO RECORDS TO PROCESS</h1></center>
					</s:else>
				</div>
			</div>
		</div>
	</body>
</html>
<code id="headId" style="visibility: hidden">
	$RCSfile: bo_rep_goodCauseReport_Search.jsp,v $ $Revision: 1.1.2.4 $
</code>