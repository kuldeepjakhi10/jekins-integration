
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<%
		response.setHeader("Cache-Control", "no-store"); //HTTP 1.1
		response.setHeader("Pragma", "no-cache"); //HTTP 1.0
		response.setDateHeader("Expires", 0); //prevents caching at the proxy server
	%>
	<head>

		<meta http-equiv="Content-Type"
			content="text/html; charset=iso-8859-1" />

		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/LMSImages/css/styles.css"
			type="text/css" />

		<title><%=application.getAttribute("JSP_PAGE_TITLE")%></title>
	</head>
	<body>
		<%@include file="/com/skilrock/lms/web/loginMgmt/menu.jsp"%>

		<div id="wrap">
			<div id="top_form">
				<h3>
					Terminal version download orders submitted successfully.
				</h3>

			</div>
		</div>
	</body>
</html>

<code id="headId" style="visibility: hidden">
$RCSfile: admin_terminalMgmt_Success.jsp,v $
$Revision: 1.1.2.1 $
</code>