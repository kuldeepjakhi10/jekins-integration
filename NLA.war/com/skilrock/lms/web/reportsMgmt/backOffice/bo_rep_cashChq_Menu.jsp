<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

	<head>
		<s:head theme="ajax" debug="false" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/LMSImages/css/styles.css"
			type="text/css" />
		<title><%=application.getAttribute("JSP_PAGE_TITLE")%></title>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/com/skilrock/lms/web/common/globalJs/jquery-1.10.1.min.js" charset="UTF-8"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/com/skilrock/lms/web/reportsMgmt/backOffice/js/report.js"></script>
		<link type="text/css" rel="stylesheet"
			href="<%=request.getContextPath()%>/LMSImages/css/lmsCalendar.css"
			media="screen" />
		<script>var projectName="<%=request.getContextPath()%>";</script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/com/skilrock/lms/web/common/globalJs/calender.js"></script>
		<script>
			function clearDiv() {
				_id.i("down", "");
				_id.i("result", "");
			}
			function checkDetails(){
				if(_id.o("reportsTypeUserwise").checked){return true;}
				else{alert('<s:text name="alert.select.cashiserwise.radio.btn"/>'); return false;}
			}
		</script>

	</head>

	<body>
		<%@include file="/com/skilrock/lms/web/loginMgmt/menu.jsp"%>
		<div id="wrap">
			<div id="top_form">
				<h3>
					<s:text name="label.cash.colln.rep" />
				</h3>

				<s:form name="searchgame" action="bo_rep_cashChq_Search"
					onsubmit="return validateDates();">
					<table border="0" cellpadding="2" cellspacing="0" width="400px">
						<tr>
							<td>
								<s:hidden name="userData" id="userData" value="%{userData}"></s:hidden>
							</td>
						</tr>
						<tr>
							<td>
								<div style="color: red; text-align: center;" id="userName_e"></div>
							</td>
						</tr>
						<!--<tr>
							<td>
								<s:select list="{}" headerKey="-1"
									headerValue="-- All --" label="Select User Name"
									name="userName" id="userName" cssClass="option"></s:select>
							</td>
						</tr>-->
						<tr>
							<td>
								<s:text name="%{getText('Report')}" />
								<s:text name="label.type" />
							</td>
							<td>
								<s:radio name="reportType" id="reportType" value="'Agentwise'"
									list="#{'Agentwise':getText('AGENT') +' '+ getText('label.wise'),'Daywise':getText('label.day') +' '+ getText('label.wise'),'Userwise':getText('label.cashier') +' '+ getText('label.wise')}"
									onclick="clearDiv()" id="reportsType" />
							</td>
						</tr>

						<tr>
							<td>
								<s:text name="%{getText('Report')}" />
								<s:text name="label.duration" />
							</td>
							<td>
								<s:select name="totaltime" list="#{'Current Day':getText('label.cur.day'),'Date Wise':getText('label.datewise')}"
									cssClass="option"
									onchange="setInputField(this.value),clearDiv()" />
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<div id="dates"></div>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<div id="date" style="display: none;">
									<s:div theme="ajax" href="rep_common_fetchDate.action"></s:div>
								</div>
							</td>

						</tr>

						<tr>
							<td>
								<s:submit name="search" key="btn.srch" align="right"
									targets="down" theme="ajax" cssClass="button"
									onclick="clearDiv()" />
							</td>
						</tr>

					</table>
				</s:form>
				<div id="down" style="text-align: center"></div>
				<s:div id="result"></s:div>

			</div>
		</div>


	</body>
</html>

<code id="headId" style="visibility: hidden">
	$RCSfile: bo_rep_cashChq_Menu.jsp,v $ $Revision: 1.1.8.14.4.1.2.2 $
</code>