<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.skilrock.lms.common.utility.FormatNumber"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

	<head>



		<meta http-equiv="Content-Type"
			content="text/html; charset=iso-8859-1" />

		<link rel="stylesheet" href="<%=request.getContextPath() %>/LMSImages/css/styles.css"
			type="text/css" />
		<script type="text/javascript" src="<%=request.getContextPath() %>/com/skilrock/lms/web/accMgmt/backOffice/js/ACT_ST5_Validation.js" />
		<title><%=application.getAttribute("JSP_PAGE_TITLE")%></title>
		<s:head debug="false" />
	</head>

	<body>
		<%@include
				file="/com/skilrock/lms/web/loginMgmt/menu.jsp"%>
		<div id="wrap">
			<div id="top_form">
				<h3>
					<s:property value="#application.TIER_MAP.AGENT" /> Payment
				</h3>
				<s:iterator value="#session.Receipt_Id">
					<table width="250" border="1" align="center" cellpadding="5"
						cellspacing="0" bordercolor="#CCCCCC">


						<tr>
							
							<td>
								<div align="center">
									<s:text name="Receipt Id">Receipt Id : </s:text>
									<s:property value="%{#session.Receipt_Id}" />
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<a theme="simple" target="_blank"
									href="<%=request.getContextPath() %>/com/skilrock/lms/web/reportsMgmt/rep_common_openPDF.action">
									<div align="center">
										Show Receipt
									</div>
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<s:set name="amount" value="%{#session.totalPay}"></s:set>
								<table>
									<% if((Double)pageContext.getAttribute("amount")>0) {
											out.print("Party Account is Credited By  : "+FormatNumber.formatNumberForJSP(pageContext.getAttribute("amount")));
										}
									   else
									   		out.print("Party Account is Debited By : " +FormatNumber.formatNumberForJSP((Double)pageContext.getAttribute("amount")*-1.0) ); 
									%>
								
								</table>
							</td>
						</tr>
					
					</table>
					</s:iterator>
			</div>
		</div>
	</body>
</html>
<code id="headId" style="visibility: hidden">
$RCSfile: bo_act_chqBounce_Success.jsp,v $
$Revision: 1.1.8.3 $
</code>