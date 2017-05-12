<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.skilrock.lms.common.utility.FormatNumber"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
	<s:head theme="ajax" />
	<body>
		<div id="wrap">
			<div id="top_form">
				<table width="100%" border="1" cellpadding="3" cellspacing="0"
					bordercolor="#CCCCCC" align="center">
					<tr style="background: #eee">
						<th>Request Id</th>
						<th>Requested By</th>
						<th>Status</th>
						<th>Name</th>
						<th>Remarks</th>
					</tr>
					<s:if test="%{masterApprovalList.size > 0}">
						<s:iterator value="masterApprovalList">
							<tr>
								<td>
									<s:url id="boMasApprovalInit" action="bo_act_pwtPayment_Detail.action" namespace="/com/skilrock/lms/web/accMgmt/" >
										<s:param name="taskId" value="%{taskId}" />
										<s:param name="playerId" value="%{playerId}" />
										<s:param name="firstName" value="%{firstName}" />
										<s:param name="lastName" value="%{lastName}" />
										<s:param name="city" value="%{city}" />
										<s:param name="gameId" value="%{gameId}" />
										<s:param name="gameTypeId" value="%{gameTypeId}" />
										<s:param name="drawId" value="%{drawId}" />
										<s:param name="ticketNumber" value="%{ticketNumber}" />
										<s:param name="winningAmount" value="%{winningAmount}" />
										<s:param name="taxAmount" value="%{taxAmount}" />
										<s:param name="netAmount" value="%{netAmount}" />
									</s:url>
									<s:a href="%{boMasApprovalInit}"><s:property value="requestId" /></s:a>
								</td>
								<td><s:property value="requestedBy" /></td>
								<td><s:property value="requestStatus" /></td>
								<td><s:property value="firstName" /> <s:property value="lastName" /></td>
								<td><s:property value="remarks" /></td>
							</tr>
						</s:iterator>
					</s:if>
					<s:else>
						<tr>
							<td colspan="5" align="center">No Record Found</td>
						</tr>
					</s:else>
				</table>
			</div>
		</div>
	</body>
</html>
<code id="headId" style="visibility: hidden">
	$RCSfile: bo_act_pwtPayment_Search.jsp,v $ $Revision: 1.1.2.1.22.2 $
</code>