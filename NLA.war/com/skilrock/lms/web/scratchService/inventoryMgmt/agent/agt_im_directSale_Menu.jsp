<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/LMSImages/css/styles.css"  type="text/css"/>
<style>
.tabNo{
	text-align:left;
	vertical-align: top;
	}
</style>
<title><%=application.getAttribute("JSP_PAGE_TITLE")%></title>
<s:head theme="ajax" debug="false"/>
<script  src="<%=request.getContextPath() %>/com/skilrock/lms/web/scratchService/inventoryMgmt/agent/js/directSale.js"></script>
</head>
<body onload="fetchDet(),appendGameTab()">

<%@include file="/com/skilrock/lms/web/loginMgmt/menu.jsp"%>
<div id="wrap">
<div id="top_form">
	<h3>Direct Sale Process</h3>
	
		<s:form name="directSale" action="agt_im_directSale_Save" onsubmit="return onSub()">
		<table border="0" cellpadding="3" cellspacing="0" width="100%">
			<tr>
				<td width="70%">
					<div id="retOrgDiv" style="text-align: left;"></div>
							<table><tr><td align="right"><i><s:property value="#application.TIER_MAP.RETAILER" /> Name : </i></td><td><select class="option"  name="retOrgName" id="retOrgName" onchange="return verifyRetailer();">
							<option value="-1">--Please Select--</option>
							</select></td></tr><tr><td align="right"><div id="retBalLbl" style="visibility:hidden;"><i>Balance : </i></div>
							</td><td class="data"><div id="retBal"></div></td></tr>
					 		 </table>
					 		 
				 </td>
				 <td align="left" width="30%">
					 <input type="button"  name="addGame" value="Add More Game" class="button" onclick="addAnotherGame()"/>
					 <table style="display:none">
					 <s:select  name="gameNbr_NameHid" id="gameNbr_NameHid"  headerKey="-1" headerValue="--Please Select--"
											  list="{}" /><tr><td><input type="hidden" id="nog" name="nog" value="<%=application.getAttribute("NO_OF_GAME_PER_PAGE")%>"/></td></tr>
					
					</table>
											 
				 </td>
			</tr>
			<tr>
				<td colspan="3"><div id="mainDiv">
					<table border="0" cellpadding="0" cellspacing="0" width="100%" id="gameTab">
						
					</table></div>
					
				</td>
			</tr>
			<tr>
			 <td align="right" colspan="2">
					<table border="0">		
					     <tr align="right">	
									<td>
										 <div id="subCheck" style="position:absolute;"></div>
										 <s:submit theme="simple" value="Submit" cssClass="button" cssStyle="visibility:hidden" id="subTrans" /> 
									</td>
									<td>
										
										<input type="button" value="Verify All" class="button" id="verBk" onclick="verifyBks()"/>
									</td>
					     </tr>
					</table>
			</td>
			</tr>
		</table>
	</s:form>
</div>
</div>
	</body>
</html>
<code id="headId" style="visibility: hidden">
$RCSfile: agt_im_directSale_Menu.jsp,v $
$Revision: 1.1.2.1.6.3.8.1 $
</code>