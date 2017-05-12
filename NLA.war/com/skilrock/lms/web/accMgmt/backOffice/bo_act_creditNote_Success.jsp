	<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.skilrock.lms.common.utility.FormatNumber"%>
	<%@ taglib prefix="s" uri="/struts-tags"%>
	
	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
	
	<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	
	<head>
	
	
	
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	
	<link rel="stylesheet" href="<%=request.getContextPath() %>/LMSImages/css/styles.css" type="text/css"/>
	
	<title><%=application.getAttribute("JSP_PAGE_TITLE")%></title>
	
	</head>
<body>

<%@include file="/com/skilrock/lms/web/loginMgmt/menu.jsp" %>

	<div id="wrap">

  <div id="top_form">
     <br/>
     <br/>
     <table style="text-align:  center" align="center">
      
      <tr>
		<td>
		<s:set name="amount" value="%{#session.amount}"></s:set>
			<s:text name="label.party.acc.credit.by"/> :
			<%=FormatNumber.formatNumberForJSP(pageContext.getAttribute("amount")) %>
								
		</td>
		</tr>
		<tr><td>
		      <a theme="simple" target="_blank"
											href="<%=request.getContextPath() %>/com/skilrock/lms/web/reportsMgmt/rep_common_openPDF.action">
											<div align="center">
												<s:text name="label.show.credit.note"/>
											</div>
				</a>
		</td></tr>
		<tr><td>
		      <a href="<%=request.getContextPath() %>/com/skilrock/lms/web/accMgmt/bo_act_creditNote_Menu.action?request_locale=<%=session.getAttribute("WW_TRANS_I18N_LOCALE") %>">
					<s:text name="label.bak.to.pay.crd.note"/>						
				</a>
		</td></tr>
		</table>
		</div></div>
		
</body>
</html>
<code id="headId" style="visibility: hidden">
$RCSfile: bo_act_creditNote_Success.jsp,v $
$Revision: 1.1.8.3.10.2 $
</code>