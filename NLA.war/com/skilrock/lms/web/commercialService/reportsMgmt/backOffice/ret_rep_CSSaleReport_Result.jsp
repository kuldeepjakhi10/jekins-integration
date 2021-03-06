
<%@page import="com.skilrock.lms.common.utility.FormatNumber"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<s:set  name="startDate" value="%{start_date}" />
<s:set name="endDate"  value="%{end_Date}" />

<div align="center">
			<h3>
				<u><s:text name="label.comm.serv.sale"/> <s:text name="Report"/> <s:text name="label.product.wise"/>&nbsp; <s:text name="label.from"/> : <s:property value="startDate" />
					&nbsp;&nbsp;<s:text name="label.to"/>&nbsp;:&nbsp; <s:property value="endDate"/></u>
			</h3>
		</div>

<s:if test="#session.reportList.size>0">
				<!--<s:div id="excel"
					cssStyle="text-align:center;width: 100%;font-size: 9pt">
					<s:a href="bo_rep_CSSaleReport_exportExcel.action?reportType=Game Wise&start_date=%{#startDate}&end_Date=%{#endDate}">Export As Excel</s:a>
				</s:div>-->
</s:if>

<table width="100%" border="1" cellpadding="3" cellspacing="0"
	bordercolor="#CCCCCC" align="center">
	<s:if test="%{#session.reportList!=null && #session.reportList.size()>0}">
	<tr>
		<td align="center" colspan="4" ><s:property value="#session.orgName" /></td>
		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:text name="label.amt.in"/> <s:property value="#application.CURRENCY_SYMBOL" /></td>
	</tr>
	<tr>
		<td align="center" colspan="6"><s:property value="#session.orgAdd" /></td>
	</tr>
		<tr align="center">
			<th>
				<s:text name="label.s.no"/>
			</th>
			<th>
				<s:text name="label.product"/>
			</th>
			<th>
				<s:text name="label.provider"/>
			</th>
			<th>
				<s:text name="label.denomination"/>
			</th>
			<th>
				<s:text name="label.sale.amt.mrp"/>
			</th>
			
		</tr>
		<s:set name="totMrpSale" value="0.0"></s:set>
		
		<s:iterator id="result" value="#session.reportList" status="index">
			<tr class="startSortable">
				<td nowrap="nowrap">
					<s:property value="%{#index.index+1}" />
				</td>
				<td nowrap="nowrap">
					<s:property value="productCode" />
				</td>
				<td nowrap="nowrap">
					<s:property value="provider" />
				</td>
				<td nowrap="nowrap">
					<s:property value="denomination" />
				</td>
				<td align="right">
						<s:set name="MrpAmt" value="%{MrpAmt}" />
						<%=FormatNumber.formatNumberForJSP(pageContext.getAttribute("MrpAmt"))%>
				</td>		
			</tr>
			<s:set name="totMrpSale" value="#totMrpSale+#MrpAmt"></s:set>
		
		</s:iterator>
		<tr>
			<th colspan="4">Total</th>
			<th align="right"><%=FormatNumber.formatNumberForJSP(pageContext.getAttribute("totMrpSale"))%></th>
		</tr>
	</s:if>
	<s:else>
		<tr>
			<th align="center">
				<s:text name="msg.no.record"/>
			</th>
		</tr>
	</s:else>
</table>

<code id="headId" style="visibility: hidden">
$RCSfile: ret_rep_CSSaleReport_Result.jsp,v $
$Revision: 1.1.2.1.6.1 $
</code>