<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.skilrock.lms.common.utility.CommonMethods"%>
<%@page import="com.skilrock.lms.web.drawGames.common.Util"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%
	response.setHeader("Cache-Control", "no-store"); //HTTP 1.1
	response.setHeader("Pragma", "no-cache"); //HTTP 1.0
	response.setDateHeader("Expires", 0); //prevents caching at the proxy server
%>

<html>

	<head>
		<s:head theme="ajax" debug="false" />
		<meta http-equiv="Content-Type"
			content="text/html; charset=iso-8859-1" />
		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/LMSImages/css/styles.css"
			type="text/css" />
		<title><%=application.getAttribute("JSP_PAGE_TITLE")%></title>
		<link type="text/css" rel="stylesheet"
			href="<%=request.getContextPath()%>/LMSImages/css/lmsCalendar.css"
			media="screen" />

		<script>
		var projectName="<%=request.getContextPath()%>"
	    
		function validateDataAndDate() {
		
				var isInValid = false;
				var startDate=_id.o("start_date").value;
				var endDate=_id.o("end_date").value;
						
				if (startDate == "" || endDate == "") {
					isInValid = true;
					_id.o("dates").innerHTML = "<font color = 'red'><s:text name='error.dates.empty'/></font>";			           
				} if (endDate < startDate) {
						isInValid = true;
						_id.o("dates").innerHTML = "<font color = 'red'><s:text name='error.enddate.gt.strtdate'/></font>";          
			            _id.o("down").innerHTML=" ";
				}				
				if (isInValid) {	
					return false;
				}
				_id.o("dates").innerHTML = "";
				return true;			
			}
			function getAgentRetList(value){
				if(value=='LMC'){
					getAgentList();
					$("#agtDiv").show();
				}else if(value=='RETAILER'){
					getAgentList();
					$("#agtDiv").show();	
					$("#selType").show();
				}else{
					$("#agtDiv").hide();
					$("#selType").hide();
				
				}
			
			
			}
			function getAgentList() {
			$("#agentOrgId").empty();
			$("#agentOrgId").append($('<option></option>').val(-1).html("--Please Select--"));
			var state = $('#stateCode').val();
			var city = $('#cityCode').val();
			var text = _ajaxCall("<%=request.getContextPath()%>/com/skilrock/lms/web/userMgmt/getAgentNameListStateAndCityWise.action?orgType=AGENT&state=ALL&city=ALL");
			var firstArr = text.data.split(":");
			var retObj = _id.o("agentOrgId");
			for (var i = 0; i < firstArr.length - 1; i++) {
				var retNameArray = firstArr[i].split("|");
				var opt = new Option(retNameArray[0].toUpperCase(), retNameArray[1]);
				retObj.options[i + 1] = opt;
			}
		}
		function getRetailerUserList(agentOrgId) {
				if(agentOrgId != -1){
				
					var text = _ajaxCall("<%=request.getContextPath()%>/com/skilrock/lms/web/drawGames/drawMgmt/getRetailerUserNameList.action?orgId=" + agentOrgId);
					var firstArr = text.data.split(":");
					//alert(firstArr);
					var retObj = _id.o("retOrgId");
					document.getElementById("retOrgId").options.length = 1;
					for (var i = 0; i < firstArr.length - 1; i++) {
						var retNameArray = firstArr[i].split("|");
						var opt = new Option(retNameArray[0].toUpperCase(), retNameArray[1]);
						retObj.options[i + 1] = opt;
					}
				} 
			}
		</script>

		<script type="text/javascript"
			src="<%=request.getContextPath()%>/com/skilrock/lms/web/common/globalJs/calender.js"></script>

	</head>

	<body>
		<%@include file="/com/skilrock/lms/web/loginMgmt/menu.jsp"%>

		<div id="wrap">
			<div class="agt_rep_top">
				<h3>
					Detailed Winning Payment Report
				</h3>
				<div id="main-heading" style="display: none">
					Detailed Winning Payment Report
				</div>
				<s:form action="bo_rep_detailedWinningReport_Search"
					onsubmit="return validateDataAndDate();" theme="simple">
					<table width="650" border="0" cellpadding="2" cellspacing="0">
						<tr>
							<td>
								<div id="dates"></div>
							</td>
						</tr>
						<tr>
							<td>
								<s:text name="label.game.name" />
								:
							</td>
							<td>
								<s:select name="gameNo" id="gameNo" theme="simple"
									headerKey="-1" headerValue="%{getText('label.please.select')}"
									list="#session.DRAWGAME_LIST" cssClass="option" />
							</td>
						</tr>

						<tr>
							<td>
								Report Type:&nbsp;
							</td>
							<td>
								<input type="radio" name="reportType" id="type1"
									checked="checked" value="ALL" />
								All
								<input type="radio" name="reportType" id="type2"
									value="TRANSACTIONAL" />
								Transactional
							</td>
						</tr>
						<tr>
							<td>
								Detail Type:&nbsp;
							</td>
							<td>
								<input type="radio" name="detailType" id="type3"
									checked="checked" onchange="getAgentRetList('DETAILED');"
									value="DETAILED">
									Detailed <input type="radio" name="detailType" id="type4"
										onchange="getAgentRetList('LMC');" value="LMC">
										LMC Wise <input type="radio" name="detailType" id="type5"
											onchange="getAgentRetList('RETAILER');" value="RETAILER">
											Retailer Wise 
							</td>
						</tr>
						<tr id="agtDiv" style="display: none">
							<td>
								LMC Organization:
							</td>
							<td>
								<s:select cssClass="option" name="agentOrgId" id="agentOrgId"
									list="{}" onchange="getRetailerUserList(this.value);"
									headerValue="%{getText('label.please.select')}" headerKey="-1"
									required="true"></s:select>
							</td>
						</tr>
						<tr id="selType" style="display: none">
							<td>
								Retailer Name:
							</td>
							<td>
								<s:select cssClass="option" name="retOrgId" id="retOrgId"
									headerKey="-1" headerValue="%{getText('label.please.select')}"
									list="{}" />
							</td>
						</tr>
						<tr>
							<%
								Calendar prevCal = Calendar.getInstance();
									String startDate = CommonMethods
											.convertDateInGlobalFormat(new java.sql.Date(prevCal
													.getTimeInMillis()).toString(), "yyyy-mm-dd",
													"yyyy-mm-dd");
									String calStartDate = CommonMethods.convertDateInGlobalFormat(
											(String) application.getAttribute("DEPLOYMENT_DATE"),
											"dd-mm-yyyy", "yyyy-mm-dd");
									String date = Util.getCurrentTimeString();
							%>
							<s:hidden id="cur_date" value="<%=date.split(" ")[0]%>" />
							<s:hidden id="cur_time" value="<%=date.split(" ")[1]%>" />

							<td>
								<s:text name="label.start.date" />
								<span>*</span>:&nbsp;
							</td>
							<td>
								<input type="text" name="startDate" id="start_date"
									value="<%=startDate%>" readonly size="12" />
								<input type="button"
									style=" width:19px; height: 19px; background: url('<%=request.getContextPath()%>/LMSImages/imagesCal/dateIcon.gif'); top left; border:0 ; "
									onclick="displayCalendar(document.getElementById('start_date'),'yyyy-mm-dd', this, '<%=startDate%>', '<%=calStartDate%>', '<%=startDate%>')" />
							</td>
						</tr>
						<tr>
							<td>
								<s:text name="label.end.date" />
								<span>*</span>:&nbsp;
							</td>
							<td>
								<input type="text" name="endDate" id="end_date"
									value="<%=startDate%>" readonly size="12" />
								<input type="button"
									style=" width:19px; height: 19px; background: url('<%=request.getContextPath()%>/LMSImages/imagesCal/dateIcon.gif'); top left; border:0 ; "
									onclick="displayCalendar(document.getElementById('end_date'),'yyyy-mm-dd', this, '<%=startDate%>','<%=calStartDate%>', '<%=startDate%>')" />
							</td>
						</tr>
						<tr>
							<td>
								<s:submit name="search" key="btn.submit" align="right"
									targets="down" theme="ajax" cssClass="button" />
							</td>
						</tr>
					</table>
				</s:form>
				<div id="down"></div>
				<div id="result" style="overflow-x: auto; overflow-y: hidden;"></div>
			</div>
		</div>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/Export_Excel.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/Export_PDF.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/jquery.dataTables.js"></script>
	</body>
</html>
<code id="headId" style="visibility: hidden">
	$RCSfile: bo_rep_detailedPaymentReport_Menu.jsp,v $ $Revision: 1.1.2.1 $
</code>
