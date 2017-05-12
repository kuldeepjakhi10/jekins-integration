
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String deployMentDate = (String) application
			.getAttribute("DEPLOYMENT_DATE");
	deployMentDate = deployMentDate.replaceAll("-", "/");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title><%=application.getAttribute("JSP_PAGE_TITLE")%></title>

		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/LMSImages/css/styles.css"
			type="text/css" />
		<link type="text/css" rel="stylesheet"
			href="<%=request.getContextPath()%>/LMSImages/css/lmsCalendar.css"
			media="screen" />
		<script>var projectName="<%=request.getContextPath()%>"</script>

		<script type="text/javascript"
			src="<%=request.getContextPath()%>/com/skilrock/lms/web/common/globalJs/calender.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/com/skilrock/lms/web/drawGames/drawMgmt/js/drawGameMgmt.js"></script>
		<s:head theme="ajax" debug="false" />
	</head>
	<body onload="fillOptions()" style="overflow: none">
		<%@include file="/com/skilrock/lms/web/loginMgmt/menu.jsp"%>
	<s:hidden id="mylocale" value="%{#session.WW_TRANS_I18N_LOCALE}"/>
		<div id="wrap">
			<div id="top_form">
				<div id="data">
					<h3>
						<s:text name="btn.srch.draw"/>
					</h3>
					<div style="color: red; text-align: left;">
						<s:actionmessage />
					</div>
					<s:form name="searchForm" id="searchFormId"
						onsubmit="return _validate()">

						<table cellspacing="0" cellpadding="3" border="0"
							bordercolor="#CCCCCC">
							<tr>
								<td>
									<s:select list="#session.DRAWGAME_LIST" name="gameId"
										key="label.game.name" id="game_no" cssClass="option" />
								</td>
							</tr>

							<tr>
								<td>
									<s:textfield name="drawId" key="label.draw.id" id="drawId" value=""
										cssClass="option" onkeypress="return notZero(this.id)" />
									<div id="draw_err">
										&nbsp;
									</div>
								</td>
							</tr>
							<!--<s:select list="{'WEDNESDAY','SATURDAY','WEDNESDAY AND SATURDAY'}" 
							name="draw_day" label="Draw day" id="draw_day" cssClass="option" />	-->
							<tr>
								<s:if test="%{#session.INVOKER=='ManualEntry'}">
									<td style="display: none;">
										<label class="label">
											<s:text name="btn.srch.draw"/><s:text name="label.perform.stat"/>
										</label>
									</td>
									<td style="display: none;">
										<select name="performStatus" id="performStatus" class="option">
											<option value="ALL">
												<s:text name="btn.srch.draw"/><s:text name="label.ALL"/>
											</option>
											<option value="PMEP">
												<s:text name="label.preplan.perform"/>
											</option>
										</select>
									</td>
								</s:if>
								<s:elseif test="%{#session.INVOKER!='ManualDeclare'}">
									<td>
										<s:select headerKey="-1" headerValue="%{getText('label.please.select')}"
											list="#{'INACTIVE':getText('INACTIVE'),'ACTIVE':getText('ACTIVE'),'FREEZE':getText('FREEZE'),'CLAIM HOLD':getText('label.calim.hold'),'CLAIM ALLOW':getText('label.calim.allow')}"
											name="status" key="label.draw.status" id="status"
											cssClass="option" />
									</td>
								</s:elseif>
							</tr>
							<s:set name="stDate" value="#session.CURR_TIME"></s:set>
							<s:hidden id="hidStDate" name="hidStDate" value="%{stDate}"></s:hidden>
							<tr>
								<td align="right">
									<s:text name="label.from"/>:&nbsp;
								</td>
								<td align="right" nowrap="nowrap">
									<table>
										<tr>
											<td>
												<s:if test="%{#session.INVOKER=='ManualEntry'}">
													<input type="text" name="fromDate" id="from_date"
														value="<s:property value="%{stDate}"/>"
														readonly="readonly" size="12" />
												</s:if>
												<s:elseif test="%{#session.INVOKER!='ManualDeclare'}">
													<input type="text" name="fromDate" id="from_date"
														value="<%=deployMentDate%>" readonly="readonly" size="12" />
												</s:elseif>

												<input type="button"
													style="width: 19px; height: 19px; background: url('<%=request.getContextPath()%>/LMSImages/imagesCal/dateIcon.gif'); top left; border: 0;"
													onclick="displayCalendar(document.getElementById('from_date'),'dd/mm/yyyy', this, '<s:property value="%{stDate}"/>', '01/01/1900', '01/01/3000')" />
											</td>
											<td>
												<table>
													<s:select name="fromHour" cssClass="option" id="from_hour"
														list="{''}" />
												</table>
											</td>
											<td>
												<table>
													<s:select name="fromMin" cssClass="option" id="from_min"
														list="{''}" />
												</table>
											</td>
											<td>
												<table>
													<s:select name="fromSec" cssClass="option" id="from_sec"
														list="{''}" />
												</table>
											</td>
										</tr>
									</table>

								</td>
							</tr>
							<tr>
								<td align="right">
									<s:text name="label.to"/>:&nbsp;
								</td>

								<td align="right" nowrap="nowrap">
									<table id="dateTbl">
										<tr>

											<td>
												<input type="text" name="toDate" id="to_date"
													value="<s:property value="%{stDate}"/>" readonly="readonly"
													size="12" />
												<input type="button"
													style="width: 19px; height: 19px; background: url('<%=request.getContextPath()%>/LMSImages/imagesCal/dateIcon.gif'); top left; border: 0;"
													onclick="displayCalendar(document.getElementById('to_date'),'dd/mm/yyyy', this, '<s:property value="%{stDate}"/>', document.getElementById('from_date').value, '01/12/3000')" />
											</td>

											<td>
												<table>
													<s:select name="toHour" cssClass="option" id="to_hour"
														list="{''}" />
												</table>
											</td>
											<td>
												<table>
													<s:select name="toMin" cssClass="option" id="to_min"
														list="{''}" />
												</table>
											</td>
											<td>
												<table>
													<s:select name="toSec" cssClass="option" id="to_sec"
														list="{''}" />
												</table>
											</td>
										</tr>
									</table>

								</td>
							</tr>

							<tr>
								<td colspan="2" align="right">
									<table>
										<s:if test="%{#session.INVOKER=='ManualEntry'}">
											<s:submit theme="ajax" key="btn.srch" cssClass="button"
												targets="draw_res_div" action="getManualEntrySchedule"
												formId="searchFormId" />
										</s:if>
										<s:elseif test="%{#session.INVOKER=='ManualDeclare'}">
											<s:submit theme="ajax" key="btn.srch" cssClass="button"
												targets="draw_res_div" formId="searchFormId"
												action="getManualDeclareSchedule" />
										</s:elseif>
										<s:else>
										<s:hidden name="priv" value="DRAW_MGMT" />
											<s:submit theme="ajax" key="btn.srch" cssClass="button"
												targets="draw_res_div" action="getDrawSchdule"
												formId="searchFormId" />
										</s:else>

									</table>
								</td>
							</tr>
						</table>

					</s:form>

					<div id="draw_res_div">

					</div>

				</div>
			</div>
		</div>
	</body>
</html>

<code id="headId" style="visibility: hidden">
	$RCSfile: searchDraw.jsp,v $ $Revision: 1.3.2.1.4.1.2.6.4.3.2.4.10.1 $
</code>