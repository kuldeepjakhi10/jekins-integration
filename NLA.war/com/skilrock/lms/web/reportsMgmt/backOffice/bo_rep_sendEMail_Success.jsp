<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%response.setDateHeader("Expires",  0);%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
	<s:head theme="ajax" debug="false"/>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<link rel="stylesheet" href="<%=request.getContextPath() %>/LMSImages/css/styles.css"  type="text/css"/>
	<title><%=application.getAttribute("JSP_PAGE_TITLE")%></title>		
</head>

<body>
	<div id="wrap">
     <div id="top_form">
			
			<h3>Sending Mail of <s:text name="Report"/> Successfully Completed.</h3>
		
	 </div></div>
	
</body>
</html>
<code id="headId" style="visibility: hidden">
$RCSfile: bo_rep_sendEMail_Success.jsp,v $
$Revision: 1.1.8.3 $
</code>