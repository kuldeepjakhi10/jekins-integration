<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/LMSImages/css/styles.css"
	type="text/css" />
<style>
.tabNo {
	text-align: left;
	vertical-align: top;
}
</style>
<title><%=application.getAttribute("JSP_PAGE_TITLE")%></title>
<s:head theme="ajax" debug="false" />

<script
	src="<%=request.getContextPath() %>/com/skilrock/lms/web/scratchService/inventoryMgmt/backOffice/js/directSale.js"></script>

<script type="text/javascript">
		function getRetailerUserList(agentOrgId) {
			if(agentOrgId != -1){
				var text = _ajaxCall("<%=request.getContextPath()%>/com/skilrock/lms/web/drawGames/drawMgmt/getRetailerUserNameList.action?orgId="
					+ agentOrgId);
			var firstArr = text.data.split(":");
			//alert(firstArr);
			var retObj = _id.o("retOrgName");
			document.getElementById("retOrgName").options.length = 1;
			for ( var i = 0; i < firstArr.length - 1; i++) {
				var retNameArray = firstArr[i].split("|");
				var opt = new Option(retNameArray[0].toUpperCase(),
						retNameArray[1]);
				retObj.options[i + 1] = opt;
			}
		}
	}
</script>
</head>
<body onload="fetchDet(),appendGameTab()">

	<%@include file="/com/skilrock/lms/web/loginMgmt/menu.jsp"%>
	<div id="wrap">
		<div id="top_form">
			<h3><s:text name="label.direct.ret.sale.proc"/></h3>

			<s:form name="directSale" action="bo_scratch_boToRetailerDirectSale_save"
				onsubmit="return onSub()">
				<table border="0" cellpadding="3" cellspacing="0" width="100%">
					<tr>
						<td width="70%">
							<div id="retOrgDiv" style="text-align: left;"></div>
							<table>
								<tr>
									<td align="right"><i><s:property
												value="#application.TIER_MAP.AGENT" /> <s:text name="label.name"/> : </i>
									</td>
									<td><select class="option" name="agtOrgName"
										id="agtOrgName"
										onchange="return getRetailerUserList(this.value);">
											<option value="-1"><s:text name="label.please.select"/></option>
									</select>
									</td>
								</tr>
								<tr>
									<td align="right"><i><s:property
												value="#application.TIER_MAP.RETAILER" /> <s:text name="label.name"/> : </i>
									</td>
									<td><select class="option" name="retOrgName"
										id="retOrgName">
											<option value="-1"><s:text name="label.please.select"/></option>
									</select>
									</td>
								</tr>
								<tr>
									<td align="right"><div id="retBalLbl"
											style="visibility:hidden;">
											<i><s:text name="label.blnce"/> : </i>
										</div></td>
									<td class="data"><div id="retBal"></div>
									</td>
								</tr>
							</table></td>
						<td align="left" width="30%"><input type="button"
							name="addGame" value="Add More Game" class="button"
							onclick="addAnotherGame()" />
							<table style="display:none">
								<s:select name="gameNbr_NameHid" id="gameNbr_NameHid"
									headerKey="-1" headerValue="%{getText('label.please.select')}" list="{}" />
								<tr>
									<td><input type="hidden" id="nog" name="nog"
										value="<%=application.getAttribute("NO_OF_GAME_PER_PAGE")%>" />
									</td>
								</tr>

							</table></td>
					</tr>
					<tr>
						<td colspan="3"><div id="mainDiv">
								<table border="0" cellpadding="0" cellspacing="0" width="100%"
									id="gameTab">

								</table>
							</div></td>
					</tr>
					<tr>
						<td align="right" colspan="2">
							<table border="0" align="center">
								<tr align="right">
									<td>
										<div id="subCheck" style="position:absolute;"></div> <s:submit
											theme="simple" key="btn.submit" cssClass="button"
											cssStyle="visibility:hidden" id="subTrans"></s:submit>
									</td>
									<td><input type="button" value="<s:text name="btn.verify.all"/>" class="button"
										id="verBk" onclick="verifyScratchBoToRetailerBooks()" />
									</td>
								</tr>
							</table></td>
					</tr>
				</table>
			</s:form>
		</div>
	</div>
</body>
</html>
<code id="headId" style="visibility: hidden"> $RCSfile:
	bo_im_directSale_Menu.jsp,v $ $Revision: 1.1.2.2 $ </code>