<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<link rel="stylesheet" href="<%=request.getContextPath() %>/LMSImages/css/styles.css" type="text/css"/>
	<title><%=application.getAttribute("JSP_PAGE_TITLE")%></title>
</head>

<body>
	<%@include file="/com/skilrock/lms/web/loginMgmt/menu.jsp" %>

	<div id="wrap">
  	<div id="top_form">
  		<s:if test="%{#session.INV_UPLOADED_LIST!=''}">
    		<h3><font color="red"> <s:property value="#session.INV_UPLOADED_LIST" /> </font> Added </h3>
    	 </s:if>
    	<s:if test="%{#session.NOT_INV_UPLOADED_LIST!=''}">
    		<h3><font color="red"> <s:property value="#session.NOT_INV_UPLOADED_LIST" /> </font> NOT Added Into Database due to duplication</h3>
    	 </s:if>
    	
   	</div></div>

</body>

</html>
<code id="headId" style="visibility: hidden">
$RCSfile: admin_im_nonconsInvUpload_success.jsp,v $
$Revision: 1.1.2.1 $
</code>