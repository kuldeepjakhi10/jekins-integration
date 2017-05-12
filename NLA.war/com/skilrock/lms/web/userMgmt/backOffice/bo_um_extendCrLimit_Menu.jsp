<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	response.setDateHeader("Expires", System.currentTimeMillis() + 10
			* 24 * 60 * 60 * 1000);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/LMSImages/css/styles.css"
			type="text/css" />
		<title><%=application.getAttribute("JSP_PAGE_TITLE")%></title>
		<s:head theme="ajax" debug="false" />
		<script type="text/javascript">
		function updatedLedgerBalance(url, div) {
				//alert(url);			
				var divArr =  div.split("-");						
				_id.i(div, '<img border="0" src="'+projectName+'/LMSImages/images/loadingAjax.gif"/>');			
				_resp  = _ajaxCall(url);			
				if(_resp.data!='null') {
					//_id.i("load-"+divArr[1], "");
					_id.i(div, _resp.data);
					_id.o(div).style.color = 'green';					
				}
				else {
					//_id.i("load-"+divArr[1], "");
					_id.i(div, '0');					
				}
		}
		function validateData(){
			_id.i('CrLimitDiv','');
			_id.i('extendCrLimitDiv','');
			_id.i('avlblCrLimitDiv','');
			_id.i('securityDepositDiv','');
			
			var crLmt = _id.o('CrLimit').value;
			var xtndCrLmt = _id.o('extendCrLimit').value;
			var avlCrLmt = _id.o('avlblCrLimit').value;
			var secDeposit = _id.o('securityDeposit').value;
			var flag = false;
			
			if(crLmt == '' && xtndCrLmt == '' && avlCrLmt == '' && secDeposit == ''){
				return true;
			}else{
				if(isNaN(crLmt)){
					_id.i('CrLimitDiv','*'+'<s:text name="error.enter.credit.limit.proper"/>',true);
					flag = true;
				}
				if(isNaN(xtndCrLmt)){
					_id.i('extendCrLimitDiv','*'+'<s:text name="error.enter.ext.credit.limit.proper"/>',true);
					flag = true;
				}
				if(isNaN(avlCrLmt)){
					_id.i('avlblCrLimitDiv','*'+'<s:text name="error.enter.bal.proper"/>',true);
					flag = true;
				}
				if(isNaN(secDeposit)){
					_id.i('securityDepositDiv','*'+'<s:text name="error.enter.security.dep.proper"/>',true);
					flag = true;
				}
			}
			if(flag){
				return false;
			}
			return true;
		}
	</script>
	</head>

	<body>
		<%@include file="/com/skilrock/lms/web/loginMgmt/menu.jsp"%>

		<div id="wrap">
			<div id="top_form">
				<h3>
					<s:text name="btn.srch"/> <s:property value="#application.TIER_MAP.AGENT" />/<s:property value="#application.TIER_MAP.RETAILER" />'s <s:text name="label.org.for.xcl"/>
				</h3>
				<s:div theme="ajax" id="x">
					<s:form action="bo_um_extendCrLimit_Search"
						onsubmit="return validateData();">
						<s:hidden name="reportType" value="clXclReport" />
						<table border="0" cellpadding="2" cellspacing="0" width="550">

							<tr>
								<td>
									<s:textfield key="label.org.name" name="orgName"></s:textfield>
								</td>
							</tr>
							<tr>
								<td>
									<s:select headerKey="-1" headerValue="%{getText('label.please.select')}"
										key="label.org.type" name="orgType"
										list="#{'AGENT':#application.TIER_MAP.AGENT.toUpperCase(),'RETAILER':#application.TIER_MAP.RETAILER.toUpperCase()}"
										cssClass="option"></s:select>
								</td>
							</tr>
							<tr>
								<td>
									<s:textfield name="parentCompName" key="label.prnt.cmpny.name"></s:textfield>
								</td>
							</tr>
							<tr>
								<td>
									<s:select headerKey="-1" headerValue="%{getText('label.please.select')}"
										key="label.status" name="orgStatus"
										list="{'ACTIVE','INACTIVE','BLOCK','TERMINATE'}"
										cssClass="option"></s:select>
								</td>
							</tr>
							<tr>
								<td>
									<s:select headerKey="-1" headerValue="%{getText('label.please.select')}"
										label="Pwt Scrap Status" name="pwtScrapStatus"
										list="#{'YES':getText('label.yes'),'NO':getText('label.no')}" cssClass="option"></s:select>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<table border="0" cellpadding="2" cellspacing="0" width="100%">
										<tr>

											<td width="38%" style="text-align: right;">
												<i><s:text name="label.crdtlmt"/>: 
											</td>
											<td>
												<s:select theme="simple" headerKey="1" value="'='"
													name="CrLimitSign" key="label.crdtlmt"
													list="#{'<=':getText('label.lt.equal.to'),'>=':getText('label.gt.equal.to'),'=':getText('label.equal.to')}"
													cssClass="option"></s:select>
											</td>
											<td width="20%">
												<s:textfield theme="simple" name="CrLimit" id="CrLimit">
												</s:textfield>
											</td>
											<td width="42%">
												<div id="CrLimitDiv"></div>

											</td>
										</tr>
										<tr>

											<td style="text-align: right;">
												<i><s:text name="label.extnd.crdtlmt"/>: 
											</td>
											<td>
												<s:select theme="simple" headerKey="1" value="'='"
													name="extendCrLimitSign" key="label.price"
													list="#{'<=':getText('label.lt.equal.to'),'>=':getText('label.gt.equal.to'),'=':getText('label.equal.to')}"
													cssClass="option"></s:select>
											</td>
											<td>
												<s:textfield theme="simple" name="extendCrLimit"
													id="extendCrLimit">
												</s:textfield>
											</td>
											<td>
												<div id="extendCrLimitDiv"></div>

											</td>
										</tr>
										<tr>

											<td style="text-align: right;">
												<i><s:text name="label.blnce"/>: 
											</td>
											<td>
												<s:select theme="simple" headerKey="1" value="'='"
													name="avlblCrLimitSign" key="label.price"
													list="#{'<=':getText('label.lt.equal.to'),'>=':getText('label.gt.equal.to'),'=':getText('label.equal.to')}"
													cssClass="option"></s:select>
											</td>
											<td>
												<s:textfield theme="simple" name="avlblCrLimit"
													id="avlblCrLimit">
												</s:textfield>
											</td>
											<td>
												<div id="avlblCrLimitDiv"></div>

											</td>
										</tr>
										<tr>

											<td style="text-align: right;">
												<i><s:text name="label.secur.dpst"/>: 
											</td>
											<td>
												<s:select theme="simple" headerKey="1" value="'='"
													name="securityDepositSign" key="label.price"
													list="#{'<=':getText('label.lt.equal.to'),'>=':getText('label.gt.equal.to'),'=':getText('label.equal.to')}"
													cssClass="option"></s:select>
											</td>
											<td>
												<s:textfield theme="simple" name="securityDeposit"
													id="securityDeposit">
												</s:textfield>
											</td>
											<td>
												<div id="securityDepositDiv"></div>

											</td>
										</tr>

									</table>
								</td>
							</tr>

							<tr>
								<td></td>
								<td align="left">
									<table>
										<s:submit theme="ajax" align="left" targets="bottom"
											key="btn.srch" cssClass="button" />
									</table>
								</td>
							</tr>



						</table>

					</s:form>

				</s:div>
				<s:div theme="ajax" id="bottom"></s:div>
			</div>
		</div>
	</body>
</html>

<code id="headId" style="visibility: hidden">
	$RCSfile: bo_um_extendCrLimit_Menu.jsp,v $ $Revision: 1.1.2.2.6.7.10.2
	$
</code>