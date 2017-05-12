
	<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@page import="com.skilrock.lms.common.utility.FormatNumber"%>
	<%@ taglib prefix="s" uri="/struts-tags"%>	
	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
	
	<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	
	<head>
	
	
	
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	
	<link rel="stylesheet" href="<%=request.getContextPath() %>/LMSImages/css/styles.css"  type="text/css"/>
	
	<title><%=application.getAttribute("JSP_PAGE_TITLE")%></title>
		
	<script type="text/javascript">
	function Confirm()
	{
	if(document.StatusClose.orderStatus.value=="Close"){
	var confirmValue = confirm("You are going to Close this Order...Are you sure?");
   	 if( confirmValue ){
   	 return true;
   	 }else{
   	 return false;
   	}
	}
	}
	</script>
		</head>
				
	

	<body>
		<%@include
				file="/com/skilrock/lms/web/loginMgmt/menu.jsp"%>

		<div id="wrap">

			<div id="top_form">
				<h3>
					Change Order Status
				</h3>

				<s:actionerror />
				<s:form name="StatusClose" id="b">

					<table border="0" cellpadding="0" cellspacing="0" width="750" bgcolor="#EBF1F1" align="center">
						<tr>
							<td>
								<table cellpadding="2" cellspacing="0" border="0" width="100%">
									<tr>
										<th align="right" width="143">
											Order Number :										</th>
										<td width="69">
											<s:property value="#session.ORDER_ID" />
											<s:hidden name="orderId" value="%{#session.ORDER_ID}" />
									  </td>
										<th width="115" align="right">
											Order Date :										</th>
										<td width="103">
											<s:property value="#session.ORDER_DATE" />
									  </td>
									</tr>
									<tr>
										<th align="right">
											<s:property value="#application.TIER_MAP.AGENT" /> Name :
										</th>
										<td>
											<s:property value="#session.AGT_ORG_NAME" />
										</td >
										<th align="right">
											
										</th>
										<td>
			
										</td>
									</tr>
					<tr>
					<th align="right">Address :</th>
					<td colspan="3" align="left"><s:property value="#session.ORG_ADDR.addrLine1"/>, <s:property value="#session.ORG_ADDR.addrLine2" />  </td>
					</tr>
					<tr>
					<th align="right"></th>
					<td colspan="3" align="left"><s:property value="#session.ORG_ADDR.state"/>  ,  <s:property value="#session.ORG_ADDR.country" /></td>
					</tr>
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td>
					
										</td>
									</tr>
								
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td>
											
										</td>
									</tr>
									
 
									<tr>
										<th align="right">
											Credit Limit :
										</th>
										<td>
											<s:set name="strCreditLimit" value="%{#session.CREDIT_LIMIT}" /><%=FormatNumber.formatNumberForJSP(pageContext.getAttribute("strCreditLimit")) %>
										</td>
										<th align="right">
											Current Credit :
										</th>
										<td>
											<s:set name="strCreditAmt" value="%{#session.CREDIT_AMT}" /><%=FormatNumber.formatNumberForJSP(pageContext.getAttribute("strCreditAmt")) %>
										</td>
									</tr>
									<tr>
										<td>
											<b><s:text name="Change Order Status"  /></b>
										</td>
										<td>
											<s:select theme="simple" cssClass="option" name="orderStatus"
												list="{'Close'}" value="Close"></s:select>
										</td>
									</tr>
									<tr></tr>
									<tr>
										<td colspan="3" align="right">
											<s:submit theme="simple" cssClass="button"
												value="Change Status" action="bo_om_closeOrder_Save"
												formId="b" onclick="return Confirm()" />
										</td>
										<td>
											<s:submit theme="simple" value="Cancel"
												action="bo_om_closeOrder_Menu" formId="b" cssClass="button" />
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
$RCSfile: bo_om_closeOrder_EditDet.jsp,v $
$Revision: 1.1.8.3 $
</code>