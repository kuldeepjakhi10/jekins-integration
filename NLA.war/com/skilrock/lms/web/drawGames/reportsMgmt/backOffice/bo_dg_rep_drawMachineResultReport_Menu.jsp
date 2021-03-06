<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.skilrock.lms.common.utility.CommonMethods"%>
<%@page import="java.util.Calendar"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	java.util.Calendar calendar = java.util.Calendar.getInstance();
	calendar.setTimeInMillis(System.currentTimeMillis());
	calendar.set(calendar.HOUR_OF_DAY, 23);
	calendar.set(calendar.MINUTE, 59);
	calendar.set(calendar.SECOND, 59);
%>
<%
	response.setHeader("Cache-Control", "no-store"); //HTTP 1.1
	response.setHeader("Pragma", "no-cache"); //HTTP 1.0
	response.setDateHeader("Expires", 0); //prevents caching at the proxy server
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

	<head>
		<s:head theme="ajax" debug="false" />
		<meta http-equiv="Content-Type"
			content="text/html; charset=iso-8859-1" />
		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/LMSImages/css/styles.css"
			type="text/css" />
		<title><%=application.getAttribute("JSP_PAGE_TITLE")%></title>
		<script type="text/javascript"	src="<%=request.getContextPath()%>/com/skilrock/lms/web/drawGames/drawMgmt/js/bo_rep_drawWise.js"></script>
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/LMSImages/css/lmsCalendar.css" media="screen"/>
		<script>var projectName="<%=request.getContextPath() %>"</script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/com/skilrock/lms/web/common/globalJs/calender.js"></script>
	</head>

	<body>
		<%@include file="/com/skilrock/lms/web/loginMgmt/menu.jsp"%>
		<div id="wrap">

			<div id="top_form">
				<h3>
					Draw Machine Result <s:text name="Report"></s:text>
				</h3>
				<s:form name="searchgame" action="bo_dg_rep_DrawResultReport_MachineResult" onsubmit="return validateDates()">

					<table border="0" cellpadding="2" cellspacing="0"  width="400">
					<tr>
							<td align="left" colspan="2">
								<div id="error"></div>
							</td>
						</tr>
					<s:select name="gameNo" id="gameNo" label="Game Name " list="#session.DRAWGAME_LIST" headerKey="-1" headerValue="--Please Select--" cssClass="option" onchange="fetchDrawNames();"></s:select>
					<s:hidden name="drawNameCol" id="drawNameCol" value="" />
					<tr><td colspan="2"><div id="dates"></div></td></tr>
			<tr> 			
			<td colspan="2">
			<table width="400px" cellpadding="3"
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
											<label class="label" style="margin-left: 75px;">
												Start Date
												<span>*</span>:&nbsp;
											</label>
											<input type="text" name="start_date" id="start_date" 
											value="<%=startDate%>" readonly size="12" onchange="fetchDrawNames()">
											<input type="button"
												style="width: 19px; height: 19px; background: url('<%=request.getContextPath()%>/LMSImages/imagesCal/dateIcon.gif'); top left; border: 0;"
												onclick="displayCalendar(document.getElementById('start_date'),'yyyy-mm-dd', this, '<%=startDate%>', '<s:property value="%{depDate}"/>', '<%=startDate%>')" />
										</td>
									</tr>
									<tr>
										<td>
											<label class="label" style="margin-left: 74px;">
												End Date
												<span>*</span>:&nbsp;
											</label>
											<input type="text" name="end_Date" id="end_date"
												value="<%=startDate%>" readonly size="12" style="margin-left: 7px;" onchange="fetchDrawNames()">
											<input type="button"
												style="width: 19px; height: 19px; background: url('<%=request.getContextPath()%>/LMSImages/imagesCal/dateIcon.gif'); top left; border: 0;"
												onclick="displayCalendar(document.getElementById('end_date'),'yyyy-mm-dd', this, '<%=startDate%>', '<s:property value="%{depDate}"/>', '<%=startDate%>')" />
										</td>
									</tr>
									<tr>
							<td colspan="2">
								<div id="drawNameDiv" style="display: none;margin-left: 74px;">
									Draw Name:
									<s:select name="drawName" theme="simple" id="drawName"
										headerKey="ALL" headerValue="ALL" list="{}" cssClass="option"
										onchange="_id.i('down','');" />
								</div>
							</td>
						</tr>
				</table>
			</td>			
		</tr>
	<tr>
		<td colspan="2"><s:submit name="search" value="Search" align="right"  targets="down" theme="ajax" cssClass="button"/></td>
	</tr>
					</table>

						
				</s:form>

				<div id="down" style="text-align: center"></div>
			</div>
		</div>
	</body>
</html>

<code id="headId" style="visibility: hidden">
$RCSfile: bo_dg_rep_drawMachineResultReport_Menu.jsp,v $
$Revision: 1.1.2.4.2.3 $
</code>