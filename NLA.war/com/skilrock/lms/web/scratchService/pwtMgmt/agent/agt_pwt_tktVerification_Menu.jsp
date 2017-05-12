<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>



<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<link rel="stylesheet" href="<%=request.getContextPath() %>/LMSImages/css/styles.css" type="text/css"/>

<title><%=application.getAttribute("JSP_PAGE_TITLE")%></title>
<script>
	var path = "<%=request.getContextPath() %>";
	</script>	
<script  src="<%=request.getContextPath() %>/com/skilrock/lms/web/scratchService/pwtMgmt/agent/js/agt_pwtMgmt_pwtCommonFnAgt.js"></script>

					
<s:head theme="ajax" debug="false"/>
	</head>
<script >
function verifyRetailer(retName)
{
  return verifyOrg('retOrgName',retName,'You have selected '+tierMap['RETAILER']);
}

function validateData(){
		var isInValid = false;
		var checkDup = checkDuplicate('Tkt');
		if(frmValidtr()&&!checkDup.dup&&!checkDup.fill){
	 	 return true;
	  	}
	  	if(checkDup.fill){
		_id.i('retOrgDiv',_id.o('retOrgDiv').innerHTML+'<br/> Please Fill one Entry','e');
		}
		alert("Please check error messages on page");
		return false;
}
function frmValidtr(){
	var frmVal  = new parent.frames[0].Validator("pwtAgentTkt");
    frmVal.aV("retOrgName","dontselect=0","Please select a valid "+tierMap['RETAILER'],"retOrgDiv");
	return document.error_disp_handler.isValid&_un();
}
function _subTrans(){
	return ( validateData() && _subValid('subTrans'));
}
</script>	
	<body onload="fetchDet(),appendGameTab('Tkt')">

<%@include file="/com/skilrock/lms/web/loginMgmt/menu.jsp"%>

<div id="wrap">

  <div id="top_form">
			<h3>Ticket Validation Before Winning Receipts</h3>
	<s:actionerror/>
		<s:form action="agt_pwt_tktVerification_Save" name="pwtAgentTkt" onsubmit="return _subTrans()">
		<table border="0" cellpadding="3" cellspacing="0"  width="100%">
			<tr>
			<td>
					<div id="retOrgDiv" style="text-align: left;"></div>
							<table><s:select label="%{#application.TIER_MAP.RETAILER} Name" name="retOrgName" id="retOrgName" headerKey="-1"
								headerValue="--Please Select--"
								list="{}" cssClass="option" onchange="return verifyRetailer(this.options[this.selectedIndex].text);"/>
					 		 </table>
				 </td>
				 <td align="left">
					 <input type="button"  name="addGame" value="Add More Game" class="button" onclick="addGameToTable('Tkt');"/>
					 <table style="display:none">
					 <s:select  name="gameNbr_NameHid" id="gameNbr_NameHid"  headerKey="-1" headerValue="--Please Select--"
											  list="{}" /><tr><td><input type="hidden" id="nog" name="nog" value="<%=application.getAttribute("NO_OF_GAME_PER_PAGE")%>"/></td></tr>
					</table>
											 
				 </td>
			</tr>
			<tr>
				<td colspan="3">
					<table border="0" cellpadding="0" cellspacing="0" width="100%" id="gameTab">
						
					</table>
				</td>
			</tr>
			<tr>
						 <td align="right" colspan="2">
							 <div id="subCheck" style="position:absolute;"></div>
							 <s:submit align="right" theme="simple" value="Verify and Save" cssClass="button" id="subTrans" onclick="fillCount('Tkt')"/> 
						 </td>
			</tr>
		</table>
		</s:form>
</div></div>
	</body>
</html>
<code id="headId" style="visibility: hidden">
$RCSfile: agt_pwt_tktVerification_Menu.jsp,v $
$Revision: 1.2.8.4 $
</code>