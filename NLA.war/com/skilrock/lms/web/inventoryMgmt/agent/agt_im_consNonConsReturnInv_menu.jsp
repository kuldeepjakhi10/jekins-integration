<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%
	response.setHeader("Cache-Control","no-store"); //HTTP 1.1
	response.setHeader("Pragma","no-cache"); //HTTP 1.0
	response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
	<meta http-equiv="CACHE-CONTROL" content="NO-CACHE" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />	
	<link rel="stylesheet" href="<%=request.getContextPath() %>/LMSImages/css/styles.css"  type="text/css"/>
	<title><%=application.getAttribute("JSP_PAGE_TITLE")%></title>	
	<script src="<%=request.getContextPath() %>/com/skilrock/lms/web/inventoryMgmt/agent/js/assignConsNonConsInv.js" />
	<s:head theme="ajax" debug="false"/>
</head>

<body onload="getRetailerUserList();chageBrandList(document.saveInv.invId.value, 'brand', 'brand_list','<s:property value="%{brandsId}" />');chageBrandList(document.saveInv.brandsId.value, 'model', 'model_list','<s:property value="%{modelId}" />'); ">
	<%@include file="/com/skilrock/lms/web/loginMgmt/menu.jsp"%>
	<div id="wrap">
    <div id="top_form">
  	<h3><s:text name="label.ret.inv.from"/> <s:property value="#application.TIER_MAP.RETAILER" /></h3>	
	
	
  	<s:form name="searchgame" action="agt_im_consNonConsReturnInv_return" onsubmit="return _validateFormItems()">
	<div id="err_div" style="text-align: center; width: 400px"></div>
	 	<div id="err" style="color:red"><s:actionerror/></div>
	 	
	 	<s:select name="Spec" id="brand_list" theme="simple" cssStyle="display:none" list="%{brandMap}" />
	  	<s:select name="Spec" id="model_list" theme="simple" cssStyle="display:none" list="%{modelMap}" />
	  	<s:select name="Spec" id="inv_List" theme="simple" cssStyle="display:none" list="{}" />
	 	<div id="err_div" style="text-align: center; width: 400px"></div>
	 	<div id="err" style="color:red"><s:actionerror/></div>
	 	
	 	 <table  border="0" cellpadding="2" cellspacing="0" width="360px" style="text-align: left">
	 	 <tr><td align="right"><div id="ron"></div></td></tr>
	 	
	 	 <s:select name="retOrgId" id="ret_org_list" label="%{getText('label.select')} %{#application.TIER_MAP.RETAILER} %{getText('label.org')}" list="{}"	cssClass="option" headerKey="-1"	headerValue="%{getText('label.please.select')}" required="true" onchange="getInvList(this.value)" />
		<tr><td colspan="2"><div id="inv_err"></div></td></tr>
		<s:select name="invId" key="label.invntry.name" headerKey="-1" headerValue="%{getText('label.please.select')}" list="%{invMap}" cssClass="option" onchange="chageBrandList(this.value, 'brand', 'brand_list','-1'); _id.o('model').options.length=1;_id.o('invNo').options.length=1; "/>		
		<tr><td colspan="2"><div id="brand_err"></div></td></tr>
		<s:select name="brandsId" id="brand" key="label.brand.name" headerKey="-1" headerValue="%{getText('label.please.select')}" list="{}" cssClass="option" onchange="chageBrandList(this.value, 'model', 'model_list','-1');_id.o('invNo').options.length=1;" />		
		<tr><td colspan="2"><div id="model_err"></div></td></tr>
		<s:select name="modelId" id="model" key="label.model.name" headerKey="-1" headerValue="%{getText('label.please.select')}" list="{}" cssClass="option" onchange="changeModelList(this.value, 'invNo', 'inv_List','-1');"/>
		<tr><td colspan="2"><div id="tern_err"></div></td></tr>
			<tr><td align="right"><div id="trn"></div></td></tr>
		<s:select name="invSrNo" id="invNo" key="label.inv.no"  list="{}" 		headerKey="-1"  headerValue="%{getText('label.please.select')}"  cssClass="option"/>
			<tr><td colspan="2"></td></tr>
			<s:submit key="btn.ret" id="Return"  cssStyle="text-align:center;" cssClass="button"/>
		
		</table>
	 	
	 	
	<%--  	<table  border="0" cellpadding="2" cellspacing="0" width="500px">
			
			<tr><td align="right"><div id="ron"></div></td></tr>
			<tr>
				
				<td>
				<div id="retlistDiv" style="display: none">
								<table>
								<s:select name="retOrgId" id="ret_org_list"
									label="Select %{#application.TIER_MAP.RETAILER} Organization" list="{}"
									cssClass="option" headerKey="-1"
									headerValue="--Please Select--"  onchange="_ajaxCall('getInventory.action?retOrgId=' + this.value,'characters')" 
									required="true" />
								</table>
								
								</div>
				</td>
				 </tr>
			<tr><td align="right"><div id="srn"></div></td></tr>
			<tr>
			<td align="right"><label id="srn_name"  class="label">Sr. No:&nbsp;</label></td>
				<td><span id="characters"><select class="option" name="retInvDet" id="retInvDet">
										<option value="-1">----Please Select----</option></select></span></td>
				
			</tr>
		
		</table>
	 <s:submit value="Return" id="Return" theme="simple" cssStyle="text-align:center;" cssClass="button"/> --%>
	</s:form> 
		
		
	</div></div>
	
 	 
 	 

</body>
</html>
<code id="headId" style="visibility: hidden">
$RCSfile: agt_im_consNonConsReturnInv_menu.jsp,v $
$Revision: 1.1.2.1.2.5.8.1.2.2 $
</code>