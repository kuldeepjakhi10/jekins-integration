<%@page import="com.skilrock.lms.beans.DateBeans"%>
<%@page import="com.skilrock.lms.common.utility.GetDate"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList"%>
<%@page import="com.skilrock.lms.common.utility.FormatNumber"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<%
		response.setHeader("Cache-Control", "no-store"); //HTTP 1.1
		response.setHeader("Pragma", "no-cache"); //HTTP 1.0
		response.setDateHeader("Expires", 0); //prevents caching at the proxy server
	%>
	<s:head theme="ajax" />
	<body onload="disable()">

		<br />
		<div align="center">
			<h3>
				<u><s:text name="label.draw.game.sale.and"/> <s:text name="PWT"/> <s:text name="Report"/> &nbsp; <%
 	if ("".equals(((DateBeans) session.getAttribute("datebean"))
 			.getReportType())) {
 %> From : <%=GetDate.getConvertedDate(((DateBeans) session
								.getAttribute("datebean")).getStartDate())%>
					&nbsp;&nbsp;To&nbsp;:&nbsp; <%=GetDate.getConvertedDate(((DateBeans) session
								.getAttribute("datebean")).getEndDate())%> <%
 	} else {
 		out.println("Of : "
 				+ ((DateBeans) session.getAttribute("datebean"))
 						.getReportType());
 	}
 %> </u>
			</h3>
		</div>

<div id="excel"  text-align: left;width: 750px;font-size: 9pt"><s:a href="bo_rep_DGFullReport_ExpExcel.action?orgType=BO"><s:text name="btn.exportasexcel"/></s:a></div>
		<table width="100%" border="1" cellpadding="3" cellspacing="0"
			bordercolor="#CCCCCC" align="center">
			<%int gameCnt = ((Map<Integer, String>)session.getAttribute("ActiveGameNumMap")).size();
				double[] total = new double[gameCnt*3];
				int c = 0;
				while(c< gameCnt*3){
					total[c] = 0.0;
					c++;
				}
	   		%>
			<tr>
				<th align="center" colspan="<%=(total.length +1) %>" ><s:property value="#session.orgName" /></th>
				<th align="center"><s:text name="label.amt.in"/> <s:property value="#application.CURRENCY_SYMBOL" /></th>
			</tr>
			<tr>
				<td align="center" colspan="<%=(total.length +2) %>"><s:property value="#session.orgAdd" /></td>
			</tr>
			<tr>
				<th rowspan="2" width="11%" nowrap="nowrap">
					 <s:property value="#application.TIER_MAP.AGENT" /> <s:text name="label.name"/>
				</th>
				<th rowspan="2" width="11%" nowrap="nowrap">
					<s:text name="label.location"/>
				</th>
				<th colspan="<s:property value="#session.ActiveGameNumMap.size()"/>">
					<s:text name="label.sales"/>
				</th>
				<th colspan="<s:property value="#session.ActiveGameNumMap.size()"/>">
					<s:text name="label.prize.payout"/>
				</th>
				<th colspan="<s:property value="#session.ActiveGameNumMap.size()"/>">
					<s:text name="label.net.portion"/>
				</th>
			</tr>
			<tr >
					<s:iterator id="beanCart" value="#session.ActiveGameNumMap">
						<th width="10%">
							<s:property value="value" />
						</th>
					</s:iterator>
					<s:iterator id="beanCart" value="#session.ActiveGameNumMap">
						<th width="10%">
							<s:property value="value" />
						</th>
					</s:iterator>
					<s:iterator id="beanCart" value="#session.ActiveGameNumMap">
						<th width="10%">
							<s:property value="value" />
						</th>
					</s:iterator>
		
			
			
			<s:if test="#session.searchResultRet.size>0">
				<s:iterator id="beanCart" value="#session.searchResultRet">
					<s:set name="data" value="value"></s:set>
					<%
						ArrayList l = (ArrayList) pageContext.getAttribute("data");
								//System.out.println("*******list******" + l);
					%>
					<tr class="startSortable">
						<td width="12%" align="left" nowrap="nowrap">
							<s:property value="key" />
						</td>
						<td width="10%">
							<%=l.get(3)   %>
						</td>

						<%
							HashMap m = (HashMap) l.get(0);
							int i = 0;			
						%>
						<s:iterator id="beanCart" value="#session.ActiveGameNumMap">
							<td width="10%" align="right">
								<s:set name="gameNbr" value="key"/>
								<%int gNbr = (Integer)pageContext.getAttribute("gameNbr"); %>
								<%=FormatNumber.formatNumber(null==m.get(gNbr)?"0":m.get(gNbr))%>
								<%total[i++] += Double.parseDouble(null==m.get(gNbr)?"0":m.get(gNbr).toString()); %>
							</td>
						</s:iterator>
						<%
							m = (HashMap) l.get(1);
							HashMap dp = (HashMap) l.get(2);
										
						%>
						<s:iterator id="beanCart" value="#session.ActiveGameNumMap">
							<td width="10%" align="right">
								<s:set name="gameNbr" value="key"/>
								<%int gNbr = (Integer)pageContext.getAttribute("gameNbr"); %>
								<%=FormatNumber.formatNumber(Double.parseDouble((m.get(gNbr)==null?0:m.get(gNbr)).toString())+Double.parseDouble((dp.get(gNbr)==null?0:dp.get(gNbr)).toString()))%>
								<%total[i++] += Double.parseDouble((m.get(gNbr)==null?0:m.get(gNbr)).toString())+Double.parseDouble((dp.get(gNbr)==null?0:dp.get(gNbr)).toString()); %>
							</td>
						</s:iterator>
						<%
						HashMap m1 = (HashMap) l.get(0);
						HashMap m2 = (HashMap) l.get(1);
						HashMap m3 = (HashMap) l.get(2);
						%>
						<s:iterator id="beanCart" value="#session.ActiveGameNumMap">
							<td width="10%" align="right">
								<s:set name="gameNbr" value="key"/>
								<%int gNbr = (Integer)pageContext.getAttribute("gameNbr"); %>
								<%=FormatNumber.formatNumber(Double.parseDouble((m1.get(gNbr)==null?0:m1.get(gNbr)).toString())-Double.parseDouble((m2.get(gNbr)==null?0:m2.get(gNbr)).toString())-Double.parseDouble((m3.get(gNbr)==null?0:m3.get(gNbr)).toString()))%>
								<%total[i++] += Double.parseDouble((m1.get(gNbr)==null?0:m1.get(gNbr)).toString())-Double.parseDouble((m2.get(gNbr)==null?0:m2.get(gNbr)).toString())-Double.parseDouble((m3.get(gNbr)==null?0:m3.get(gNbr)).toString()); %>
							</td>
						</s:iterator>
					</tr>
				</s:iterator>
				<td>&nbsp;</td>
				<th width=""><s:text name="label.total" /></th>
				<% for(int i=0; i<total.length ;i++){
				%>
					<th width="10%" align="right">
						<%=FormatNumber.formatNumber(total[i]) %>
					</th>
				<%
					}
				 %>
			</s:if>
			<s:else>
				<tr>
					<td colspan="9" align="center">
						<s:text name="msg.no.record.process" />
					</td>
				</tr>
			</s:else>

		</table>
	</body>
</html>

<code id="headId" style="visibility: hidden">
$RCSfile: bo_dg_rep_gameAgentWise_Result.jsp,v $
$Revision: 1.1.2.13.6.1 $
</code>