<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%response.setDateHeader("Expires",
   System.currentTimeMillis() + 10*24*60*60*1000);%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<link rel="stylesheet" href="<%=request.getContextPath() %>/LMSImages/css/styles.css"  type="text/css"/>

<title><%=application.getAttribute("JSP_PAGE_TITLE")%></title>
</head>
<body>
<%@include file="/com/skilrock/lms/web/loginMgmt/menu.jsp"%>

<div id="wrap">

  <div id="top_form">
<h3> Approved Successfully</h3>

</div></div>
</body>
</html>
<code id="headId" style="visibility: hidden">
$RCSfile: bo_ola_act_pin_sale_payment_approved.jsp,v $
$Revision: 1.1.2.1 $
</code>
