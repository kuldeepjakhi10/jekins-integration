	<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib prefix="s" uri="/struts-tags"%>
	<%response.setDateHeader("Expires",
   System.currentTimeMillis() + 10*24*60*60*1000);%>
	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
	
	<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	
	<head>
	
	
	
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	
	<link rel="stylesheet" href="<%=request.getContextPath() %>/LMSImages/css/styles.css" type="text/css"/>
	
	<title><%=application.getAttribute("JSP_PAGE_TITLE")%></title>
		
	
	<s:head theme="ajax" debug="false"/>
		</head>

	<body>
   <%@include file="/com/skilrock/lms/web/loginMgmt/menu.jsp"%>

	<div id="wrap">

  <div id="top_form">
   <h3>Search Order</h3>

		<s:form action="bo_om_closeOrder_Search">
			<table cellpadding="2" cellspacing="0" border="0">

			
				<tr>
					<s:textfield label="Game Name" name="gameName"></s:textfield>
				</tr>
				<tr>
					<s:textfield label="Game Number" name="gameNumber"></s:textfield>
				</tr>
				<tr>
					<s:textfield label="%{#application.TIER_MAP.AGENT} Organization Name" name="agtOrgName"></s:textfield>
				</tr>
				<tr>
					<s:textfield label="Order Id" name="orderNumber" value=""></s:textfield>
				</tr>
				 <tr>
					<s:select cssClass="option" headerKey="1" headerValue="-- Please Select --" label="Order Status" name="orderStatus" list="{'Semi Processed','Approved'}"></s:select>
				</tr>
				<tr>
				<td height="20" valign="bottom" align="right">
				<s:submit cssClass="button" theme="ajax" targets="bottom" value="Search"/>
				</td></tr></table>
			
			</s:form>
			
 <div  id="bottom" >  
	
 </div>
</div></div>
	
	</body>
</html>
<code id="headId" style="visibility: hidden">
$RCSfile: bo_om_closeOrder_Menu.jsp,v $
$Revision: 1.1.8.3 $
</code>