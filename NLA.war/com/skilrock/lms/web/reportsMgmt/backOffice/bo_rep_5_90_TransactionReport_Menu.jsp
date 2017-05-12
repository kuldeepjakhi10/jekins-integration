
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.skilrock.lms.common.utility.CommonMethods"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

	<head>
	<s:head theme="ajax" debug="false" />
		<meta http-equiv="Content-Type"
			content="text/html; charset=iso-8859-1" />
		<link rel="stylesheet" href="<%=request.getContextPath() %>/LMSImages/css/styles.css"
			type="text/css" />
		<title><%=application.getAttribute("JSP_PAGE_TITLE")%></title>
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/LMSImages/css/lmsCalendar.css" media="screen"/>
		<script>var projectName="<%=request.getContextPath() %>"</script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/com/skilrock/lms/web/reportsMgmt/backOffice/js/5by90TrnRep.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/com/skilrock/lms/web/reportsMgmt/backOffice/js/report.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/com/skilrock/lms/web/common/globalJs/calender.js"></script>
	
	</head>

	<body onload="getAgentList();">
	
		<%@include
				file="/com/skilrock/lms/web/loginMgmt/menu.jsp"%>

			 
		<div id="wrap">

			<div id="top_form">
				<h3>
					Retailer 5/90 Transaction Report 
				</h3>

<s:form action="bo_rep_5_90_transaction_report_search" onsubmit="return verifyField();">

					<table border="0" cellpadding="2" cellsapacing="0">
						<tr>
							<td>
								<div id="errorId"></div>
							</td>
						</tr>
					</table>
					<table border="0" cellpadding="2" cellsapacing="0">

						<tr>
							<td colspan="2">
								<s:actionerror />
								<s:fielderror />
							</td>
						</tr>
								<tr>
									<td colspan="2">
										<span id="list1" onclick="changeValue()"></span>


									</td>
								</tr>
						
							<tr id="selType">
								<td width="100">
													</td>
								<td>
									<s:select cssClass="option"  name="agentOrgId" onchange="getRetailerUserList(this.value); "
											id="agentOrgId" list="{}"
											label="Agent Name "
											headerValue="--Please Select--" headerKey="-1" required="true"></s:select>
								</td>
							</tr>
				<tr id="selType">
								<td width="100">
			<% String lastDate = CommonMethods.getLastArchDate(); %>
			<input type="hidden" value="<%= lastDate %>" id="arch_date" />
								</td>
								<td>
									<s:select cssClass="option" label="Retailer Name" name="retOrgId" id="retOrgId"
										headerKey="-1" headerValue="--Please Select--" list="{}"
										
										/>
								</td>
							</tr>

		<tr>
							<td colspan="2">
								<div id="dates"></div>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<table cellpadding="3"
									cellspacing="0" border="0">
									<s:set name="stDate" id="stDate" value="#session.presentDate" />
									<%
										Calendar prevCal = Calendar.getInstance();
											String startDate = CommonMethods
													.convertDateInGlobalFormat(new java.sql.Date(prevCal
															.getTimeInMillis()).toString(), "yyyy-mm-dd",
															"yyyy-mm-dd");
									%>
									<tr>
										<td>
											<label class="label">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Date
												<span>*</span>:&nbsp;
											</label>
											<input type="text" name="start_date" id="start_date"
												value="<%=startDate%>" readonly size="12">
											<input type="button"
												style="width: 19px; height: 19px; background: url('<%=request.getContextPath()%>/LMSImages/imagesCal/dateIcon.gif'); top left; border: 0;"
												onclick="displayCalendar(document.getElementById('start_date'),'yyyy-mm-dd', this, '<%=startDate%>', false, '')" />
										</td>
									</tr><!--
									<tr>
										<td>
											<label class="label">
												End Date
												<span>*</span>:&nbsp;
											</label>
											<input type="text" name="end_Date" id="end_date"
												value="<%=startDate%>" readonly size="12">
											<input type="button"
												style="width: 19px; height: 19px; background: url('<%=request.getContextPath()%>/LMSImages/imagesCal/dateIcon.gif'); top left; border: 0;"
												onclick="displayCalendar(document.getElementById('end_date'),'yyyy-mm-dd', this, '<%=startDate%>',false, '')" />
										</td>
									</tr>
								--></table>
							</td>
						</tr>
						
						
						<tr>
						<td align="right">
						
											
							<s:submit name="search" value="Search" align="right"
									targets="down" theme="ajax" cssClass="button"
									 />
						
					
							</td></tr>					</table>
				</s:form>
						<div id="down"></div>		
				<div id="result" style="overflow-x:auto;overflow-y:hidden;"></div>
			</div>
		</div>

	</body>

</html>
<code id="headId" style="visibility: hidden">
$RCSfile: bo_rep_5_90_TransactionReport_Menu.jsp,v $
$Revision: 1.1.2.3.4.1.2.1.2.2 $
</code>