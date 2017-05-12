<%@page import="com.skilrock.lms.beans.DateBeans"%>
<%@page import="com.skilrock.lms.common.utility.GetDate"%>
<%@page import="com.skilrock.lms.common.utility.FormatNumber"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<s:if test="%{message != null}">
	<center>
		<s:property value="message" />
	</center>
</s:if>
<s:else>
<div align="center"><h3><u>MRP SALE <s:text name="Report"/> <s:text name="Retailer"/> Wise &nbsp;
	<%if("".equals(((DateBeans)session.getAttribute("datebean") ).getReportType())) {%>
  		 From : 
  		<%=GetDate.getConvertedDate(( (DateBeans)session.getAttribute("datebean") ).getStartDate())%>
  		&nbsp;&nbsp;To&nbsp;:&nbsp;
  		<%=GetDate.getConvertedDate(((DateBeans)session.getAttribute("datebean") ).getEndDate())%>
  		
	<%} else {out.println("Of : "+((DateBeans)session.getAttribute("datebean") ).getReportType());}%>
	</u></h3></div>	

<table width="100%" border="1" cellpadding="3" cellspacing="0"
	bordercolor="#CCCCCC" align="center" id="expandTable"
	style="font-size: 12px">
	<s:set name="DG" value="%{#session.isDG}"></s:set>
	<s:set name="DGCount" value="0"></s:set>
	<s:set name="colCount" value="2" />
	<s:if test="%{#session.resultExpand!=null}">
		<s:iterator value="%{#session.gameList}">
			<s:if test="%{value=='DG'}">
				<s:set name="DGCount" value="#DGCount+1"></s:set>
			</s:if>
			<s:set name="colCount" value="#colCount+1"></s:set>
		</s:iterator>
				<tr>
			<th align="center" colspan="<s:property value="#colCount"/>" ><s:property value="#session.orgName" /></th>
			<th align="center" rowspan="2" colspan="2">Amount in <s:property value="#application.CURRENCY_SYMBOL" /></th>
		</tr>
		<tr>
			<td align="center" colspan="<s:property value="#colCount"/>"><s:property value="#session.orgAdd" /></td>
		</tr>
		<tr align="center">
			<th rowspan="3">
				S. No.
			</th>
			<th rowspan="3">
				<s:text name="Retailer"/> Name
			</th>
			<s:if test="%{#DG}">
				<th colspan="<s:property value="%{#DGCount+1}" />">
				Draw Game
				</th>
			</s:if>
			<th rowspan="3" nowrap="nowrap">
				Grand Total
			</th>
		</tr>
		<tr align="center">
		<s:if test="%{#DG}">
			<s:iterator value="%{#session.gameList}">
				<s:if test="%{value=='DG'}">
					<s:if test="%{key eq '5/90 Ghana'}">
						<th colspan="2">
							<s:property value="%{key}" />
						</th>
					</s:if>
					<s:else>
						<th>
							<s:property value="%{key}" />
						</th>
					</s:else>
				</s:if>
			</s:iterator>
		</s:if>
		</tr>
		<tr align="center">
		<s:if test="%{#DG}">
		<s:iterator value="%{#session.gameList}">
				<s:if test="%{value=='DG'}">
					<s:if test="%{key eq '5/90 Ghana'}">
						<th nowrap="nowrap">
							Sale Amount
						</th>
						<th>
							Promotional Amount
						</th>
					</s:if>
					<s:else>
						<th>
							Sale Amount
						</th>
					</s:else>
				</s:if>
			</s:iterator>
		</s:if>
		</tr>
		<s:set name="dgSale" value="0.0" />
		<s:set name="totTotal" value="0.0" />
		<s:iterator id="result" value="#session.resultExpand" status="index">
			<s:set name="orgValue" value="%{value}"></s:set>
			<tr class="startSortable" style="white-space: nowrap;">
				<td nowrap="nowrap">
					<s:property value="%{#index.index+1}" />
				</td>
				<td nowrap="nowrap">
					<s:property value="%{#orgValue.agentName}" />
				</td>
				<s:set name="gameBeanMap" value="#orgValue.gameBeanMap" />
				<s:set name="gameTotal" value="0.0" />
				<s:if test="%{#DG}">
				<s:iterator value="%{#session.gameList}">
					<s:if test="%{value=='DG'}">
						<s:set name="gameValue" value="%{#gameBeanMap[key]}" />
						<td align="right">
							<s:set name="sale"
								value="%{#gameValue.drawSale-#gameValue.drawSlotSale}" />
							<%=FormatNumber
									.formatNumberForJSP(pageContext
											.getAttribute("sale"))%>
						</td>
						<s:if test="%{key eq '5/90 Ghana'}">
							<td align="right">
							<s:set name="saleSlot"
								value="%{#gameValue.drawSlotSale}" />
							<%=FormatNumber
									.formatNumberForJSP(pageContext
											.getAttribute("saleSlot"))%>
						</td>
						</s:if>
						<s:set name="gameTotal"
							value="%{#gameTotal+#gameValue.drawSale}" />
					</s:if>
				</s:iterator>
				</s:if>
				<th nowrap="nowrap" align="right">
					<s:set name="total" value="#gameTotal"></s:set>
					<%=FormatNumber.formatNumberForJSP(pageContext
							.getAttribute("total"))%>
				</th>
			</tr>
		</s:iterator>
	</s:if>
	<s:else>
		<tr>
			<th align="center">
				No Records Found
			</th>
		</tr>
	</s:else>
</table>
</s:else>
<code id="headId" style="visibility: hidden">
	$RCSfile: agt_rep_MRPSalesReportLagos_Search.jsp,v $
	$Revision: 1.1.4.3 $
</code>