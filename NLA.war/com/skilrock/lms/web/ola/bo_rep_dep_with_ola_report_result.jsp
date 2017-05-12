<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%response.setDateHeader("Expires",
   System.currentTimeMillis() + 10*24*60*60*1000);%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
	<s:head theme="ajax" debug="false"/>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<link rel="stylesheet" href="<%=request.getContextPath() %>/LMSImages/css/styles.css"  type="text/css"/>
	<title><%=application.getAttribute("JSP_PAGE_TITLE")%></title>		
</head>

<body>
	
	<div id="wrap"><div id="top_form">
    
 
 		<table width="1000px" border="1" cellpadding="3" cellspacing="0" bordercolor="#CCCCCC" align="center">
		<tr>				
			<th colspan="7" align="center">OLA BO Deposit/Withdraw Report</th>										
		</tr>
		<tr>
			<th colspan="1"></th>
			<th colspan="2" align="center">Deposit Details</th>
			<th colspan="2" align="center">Withdrawal Details</th>
			<th colspan="2" align="center">Net Gaming</th>
		</tr>
		<tr >				
			<th>Agent Organization</th>
			<th>Deposit Amount</th>
			<th>Commission Amount</th>
			<th>Withdrawal Amount</th>
			<th>Commission Amount</th>
			<th>Player Net Gaming</th>
			<th>Commission Calculated</th>
		</tr>
		
		<s:if test="#session.OLA_DEP_WITH_DATA_LIST.size>0">
			<s:iterator id="beanCart" value="#session.OLA_DEP_WITH_DATA_LIST">
				<s:if test="%{(playerName != 'Total')}">
			<tr class="startSortable">				
				<td align="left"><s:property value="agentName"/></td>
				<td align="left"><s:property value="depositAmt"/></td>
				<td align="left"><s:property value="agentDepositCommission"/></td>
				<td align="left"><s:property value="withdrawlAmt"/></td>
				<td align="left"><s:property value="agentWithdrawlCommission"/></td>
				<td align="left"><s:property value="agentNetGaming"/></td>
				<td align="left"><s:property value="agentCommissionCalculated"/></td>							
			</tr>	
			</s:if>
			<s:else>
				<tr>				
				<td align="left"><s:property value="playerName"/></td>
				<td align="left"><s:property value="totalDepositAmount"/></td>
				<td align="left"><s:property value="totalDepositCommission"/></td>
				<td align="left"><s:property value="totalWithdrawlAmount"/></td>
				<td align="left"><s:property value="totalWithdrawlCommission"/></td>
				<td align="left"><s:property value="totalPlayerNetGaming"/></td>
				<td align="left"><s:property value="commissionCalculated"/></td>							
			</tr>	
			</s:else>
			</s:iterator> 
		</s:if>
		<s:else>
			<tr>
				<td colspan="6" align="center"> No Records to Process</td>
			</tr>
		</s:else>
		
	
	 </table>
	 
	
  	

	</div></div>
	
 	
 	 
</body>
</html>
<code id="headId" style="visibility: hidden">
$RCSfile: bo_rep_dep_with_ola_report_result.jsp,v $
$Revision: 1.1.2.1 $
</code>