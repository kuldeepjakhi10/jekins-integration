<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

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
		<link type="text/css" rel="stylesheet"
			href="<%=request.getContextPath()%>/LMSImages/css/lmsCalendar.css"
			media="screen" />
		<script>var projectName="<%=request.getContextPath()%></script>
		<script>
			function fetchRet(val) {
				//clearDiv();
				var _resp = _ajaxCall(projectName
						+ "/com/skilrock/lms/admin/admin_terminalMgmt_Search.action?search_type="
						+ val);
				_id.i("result", _resp.data);
			}
			function fillChk(val) {
				var parentChk = _id.o("P" + val).checked;
				var tab = _id.o("tab" + val);
				var chkBx = tab.getElementsByTagName("input");
				for ( var i = 0; i < chkBx.length; i++) {
					if (chkBx[i].type == "checkbox") {
						chkBx[i].checked = parentChk;
					}
				}
			}
			function selAllChkBx() {
				var tab = _id.o("searchTable");
				var chkBx = tab.getElementsByTagName("input");
				var selAll = _id.o("selAll").checked;
				var dis = false;
				if (selAll) {
					dis = true;
				}
				for ( var i = 0; i < chkBx.length; i++) {
					if (chkBx[i].type == "checkbox" && chkBx[i].id != "selAll") {
						chkBx[i].checked = false;
						chkBx[i].disabled = dis;
					}
				}
			}
		</script>
	</head>

	<body onload="fetchRet('AgentWise');">
		<%@include file="/com/skilrock/lms/web/loginMgmt/menu.jsp"%>
		<div id="wrap">
			<div id="top_form">
				<h3>
					Terminal Management
				</h3>
				<div id="tktErrMsgDiv"></div>
				<s:form name="terminalMgmt" id="terminalMgmt"
					action="admin_terminalMgmt_Save">
					<tr>
						<td>
							<table>
								<tr>
									<td>
										<div id="result"></div>
									</td>
								</tr>
							</table>
						</td>
					</tr>

				</s:form>

			</div>
		</div>




	</body>
</html>

<code id="headId" style="visibility: hidden">
	$RCSfile: admin_terminalMgmt_Menu.jsp,v $ $Revision: 1.1.2.1 $
</code>