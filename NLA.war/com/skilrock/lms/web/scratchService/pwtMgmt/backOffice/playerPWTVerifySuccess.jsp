<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>



<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<link rel="stylesheet" href="<%=request.getContextPath() %>/LMSImages/css/styles.css"  type="text/css"/>

<title><%=application.getAttribute("JSP_PAGE_TITLE")%></title>
		

	</head>
	<body>
			<%@include file="/com/skilrock/lms/web/loginMgmt/menu.jsp" %>
	<div id="wrap">
     <div id="top_form">
			 <h3><s:text name="Direct_Player"/> <s:text name="PWT"/> Tickets Verification Done</h3>
			<table align="left" cellpadding="2" cellspacing="0">

	  <s:iterator id="SearchGameResults" value="#session.Receipt_Id">
			    <tr>
			   <td>Receipt Id:<s:property value="%{intValue()}"/></td>
			     
			     </tr>
			     <tr>  
			  <td><a theme="simple" target="_blank" href="<%=request.getContextPath() %>/com/skilrock/lms/web/reportsMgmt/rep_common_openPDF.action">Show Receipt</a></td>
			</tr>
			  </s:iterator> 
			  </table>        
	</div></div>
	</body>
</html>
<code id="headId" style="visibility: hidden">
$RCSfile: playerPWTVerifySuccess.jsp,v $
$Revision: 1.1.8.3 $
</code>