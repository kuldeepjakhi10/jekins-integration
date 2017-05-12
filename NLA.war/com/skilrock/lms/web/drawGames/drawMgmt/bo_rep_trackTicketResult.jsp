<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.skilrock.lms.dge.beans.TicketTracking"%>
<%@page import="com.skilrock.lms.dge.beans.DrawIdBean"%>
<%@page import="com.skilrock.lms.dge.beans.PanelIdBean"%>
<%@page import="com.skilrock.lms.web.drawGames.common.Util"%>
<%@page import="com.skilrock.lms.common.utility.FormatNumber"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	response.setDateHeader("Expires", System.currentTimeMillis() + 10
			* 24 * 60 * 60 * 1000);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

	<head>
		<s:head theme="ajax" debug="false" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/LMSImages/css/styles.css"
			type="text/css" />
		<title><%=application.getAttribute("JSP_PAGE_TITLE")%></title>
		
		<style>
   			.myLayout{table-layout:fixed;}   			
   			#panelTable td{word-wrap:break-word;}
   		</style>

	</head>

	<body>

		<div id="wrap">
			<div id="top_form">
				<%
				List<TicketTracking> trackingList= new ArrayList<TicketTracking>();
				trackingList=(List<TicketTracking>) session.getAttribute("TKT_WIN_STATUS");
					//<TicketTracking tktTrack = (TicketTracking) session
						//	.getAttribute("TKT_WIN_STATUS");
						TicketTracking tktTrack = null;
					if (trackingList != null && trackingList.size()>0) {
					for(int i=0;i<trackingList.size();i++){
					tktTrack = trackingList.get(i);     
					if(i>0){
					%>
				<br />
				<b><big><s:text name="label.raff.tkt.nbr" /> :</big>
				</b>

				<%
					out.println(tktTrack.getTktNumber() );   
					}
						if (tktTrack.getStatus().equalsIgnoreCase("Invalid Ticket")) {
				%>
				<table width="117%" border="0" cellpadding="3" cellspacing="0"
					bordercolor="#CCCCCC" align="center">
					<tr>
						<td align="center" style="font-size: large; font-family: serif;">
							<s:text name="label.inv.tkt" />
						</td>
					</tr>
				</table>
				<%
					break;
					}
					
				%>

				<table width="125%" border="1" cellpadding="3" cellspacing="0"
					bordercolor="#CCCCCC" align="center">
					<tr>
						<th colspan="6" align="center">
							<s:text name="label.sale.detail" />
						</th>
					</tr>
					<tr>
						<th>
							<s:text name="label.sale.date" />
						</th>
						<th align="center">
							<s:text name="label.game.name" />
						</th>
						<th align="center">
							<s:text name="label.amount" />
						</th>
						<th align="center">
							<s:property value="#application.TIER_MAP.RETAILER" />
							<s:text name="label.name" />
						</th>
						<th align="center">
							<s:text name="label.no.of.draw" />
						</th>
						<th align="center">
							<s:text name="label.sale.mode" />
						</th>
					</tr>
					<s:if test="%{#session.TKT_WIN_STATUS!=null}">
						<tr class="data">
							<td align="left">
								<%=tktTrack.getSaleDate() %>
								<!--  	<s:property value="#session.TKT_WIN_STATUS.saleDate" /> -->
							</td>
							<td align="center">
								<%=tktTrack.getGameName() %>
								<!-- 	<s:property value="#session.TKT_WIN_STATUS.gameName" /> -->
							</td>
							<td align="center">
								<%=tktTrack.getSaleAmt() %>
								<!-- 	<s:property value="#session.TKT_WIN_STATUS.saleAmt" /> -->
							</td>
							<td align="center">
								<%=tktTrack.getRetailerName() %>
								<!-- 	<s:property value="#session.TKT_WIN_STATUS.retailerName" /> -->
							</td>
							<td align="center">
								<%=tktTrack.getNoOfDraws() %>
								<!-- 	<s:property value="#session.TKT_WIN_STATUS.noOfDraws" /> -->
							</td>
							<td align="center">
								<%=tktTrack.getSaleMode() %>
								<!-- 	<s:property value="#session.TKT_WIN_STATUS.saleMode" /> -->
							</td>
						</tr>
					</s:if>
					<s:else>
						<tr>
							<td colspan="4" align="center">
								<s:text name="msg.no.record.process" />
							</td>
						</tr>
					</s:else>

				</table>



				<s:if test="%{#session.TKT_WIN_STATUS!=null}">

					<%
						//tktTrack = (TicketTracking) session.getAttribute("TKT_WIN_STATUS");
							if (tktTrack.getStatusCheck().equalsIgnoreCase(
									"Cancelled Ticket")) {
					%>
					<table width="125%" border="1" cellpadding="3" cellspacing="0"
						bordercolor="#CCCCCC" align="center">
						<tr>
							<td align="center" style="font-size: large; font-family: serif">
								<s:text name="label.cancelled.tkt" />
							</td>
						</tr>
					</table>
					<%
						//return;
							} else if (tktTrack.getStatusCheck().contains(
									"Reprinted Ticket")) {
					%>


					<table width="117%" border="1" cellpadding="3" cellspacing="0"
						bordercolor="#CCCCCC" align="center">
						<tr>
							<td align="center" style="font-size: large; font-family: serif">
								<s:text name="label.tkt.has.printed" /><%=tktTrack.getStatusCheck().replace("Reprinted Ticket", "")%><s:text name="label.time" />(s).
							</td>
						</tr>
					</table>
					<%
						//return;
							}
					%>



					<%
						
					 if (tktTrack.getIsRaffle()==true)
					 {
					%>


					<table width="117%" border="1" cellpadding="3" cellspacing="0"
						bordercolor="#CCCCCC" align="center">
						<tr>
							<th colspan="7" align="center">
								<s:text name="label.tkt.win.stat" />
							</th>
						</tr>
						<tr>
							<th align="center">
								<s:text name="label.draw.date" />
							</th>
							<th align="center">
								<s:text name="label.res" />
							</th>
							<th align="center">
								<s:text name="label.claim.time" />
							</th>
							<th align="center">
								<s:text name="label.win.detail" />
							</th>
						</tr>


						<%
							int gameNo = tktTrack.getGameNo();

								List<DrawIdBean> drawWinList = tktTrack.getDrawWinList();
								HashMap<Integer, String> partyIdMap = tktTrack.getPartyId();
								List<PanelIdBean> panelWinList = null;
								String drawStatus = null;
								HashMap<Integer, String> pwtTimeMap = tktTrack.getPwtTimeMap();
								int panelSize = 1;
								for (DrawIdBean drawBean : drawWinList) {
									panelWinList = drawBean.getPanelWinList();
									panelSize = panelWinList.size();
									drawStatus = drawBean.getStatus();
								
						%>
						<tr class="data">
							<td align="center" nowrap="nowrap"><%=drawBean.getDrawDateTime()%></td>
							<%
								if (drawStatus.equals("CLAIM ALLOW")) {
							%>
							<td align="center" style="text-align: left"><%=drawBean.getWinResult()%></td>
							<%
								} else if ("CANCEL".equalsIgnoreCase(drawStatus)) {
							%>
							<td align="center">
								<s:text name="label.draw.cancel" />
							</td>
							<%
								} else {
							%>
							<td align="center">
								<s:text name="label.res.await" />
							</td>
							<%
								}
							%>


							<td align="center"><%=pwtTimeMap.get(drawBean.getDrawId()) == null ? "N.A."
									: pwtTimeMap.get(drawBean.getDrawId())%></td>
							<td colspan="4">




								<table width="125%" border="1" cellpadding="3" cellspacing="0"
									bordercolor="#CCCCCC" align="center">
									<tr>


										<%
											if (!tktTrack.getStatusCheck().equalsIgnoreCase(
															"Cancelled Ticket")) {
										%>
										<th>
											<s:text name="label.claim.at" />
										</th>
										<th>
											<s:text name="label.claim.stat" />
										</th>
										<th>
											<s:text name="label.win.amt" />
										</th>
										<%
											}
										%>
									</tr>
									<!-- 	<tr class="data">
									<td>45</td>
									<td>allow</td>
									<td>100.0</td> 
									
									</tr> -->


									<tr class="data">

										<%PanelIdBean panelBean = new PanelIdBean();										
										for (int j = 0; j < panelWinList.size(); j++) {
													panelBean = panelWinList.get(j);
										 %>
										<%
											if (!tktTrack.getStatusCheck().equalsIgnoreCase(
																"Cancelled Ticket")) {
										%>
										<td align="left"><%=partyIdMap.get(panelBean
											.getPartyId()) == null ? "&nbsp;"
											: partyIdMap.get(panelBean
													.getPartyId())%></td>
										<td align="left"><%=drawStatus
											.equalsIgnoreCase("CLAIM HOLD") ? "N.A."
											: panelBean.getStatus()%></td>
										<td align="left">
											<%
												Object finalAmt;
																Object amt = drawStatus.equals("CLAIM ALLOW") ? panelBean
																		.getWinningAmt()
																		: "N.A.";
																if (amt instanceof Double) {
																	finalAmt = FormatNumber.formatNumberForJSP(amt);
																} else {
																	finalAmt = amt;
																}
											%>
											<%=finalAmt%>
										</td>
										<%
											}
										%>
									</tr>
									<%
							}
						%>

								</table>
							</td>
						</tr>
						<%
							}
						%>
					</table>




					<%
						
							} else  {
					%>






					<table width="125%" border="1" cellpadding="3" cellspacing="0"
						bordercolor="#CCCCCC" align="center">

						<tr>
							<th colspan="8" align="center">
								<s:text name="label.tkt.win.stat" />
							</th>
						</tr>
						<%
							int gameId = tktTrack.getGameId();

								List<DrawIdBean> drawWinList = tktTrack.getDrawWinList();
								HashMap<Integer, String> partyIdMap = tktTrack.getPartyId();
								List<PanelIdBean> panelWinList = null;
								String drawStatus = null;
								HashMap<Integer, String> pwtTimeMap = tktTrack.getPwtTimeMap();
								int panelSize = 1;
								int count = 0;
								for (DrawIdBean drawBean : drawWinList) {
									panelWinList = drawBean.getPanelWinList();
									panelSize = panelWinList.size();
									drawStatus = drawBean.getStatus();
									System.out.print(drawStatus);
						%>
						<% 
						System.out.print(drawBean.getTktStatusForDraw());
						if(!"UNBLOCKED".equals(drawBean.getTktStatusForDraw())){
						%>
						<tr>
							<th align="center" nowrap="nowrap" colspan="8">
								<s:text name="msg.tkt.has.block.by.bo.for" />
								<% if("NA".equals(drawBean.getDrawname())){%><s:text name="msg.this.draw" /><%}else{ %><%=drawBean.getDrawname()%>
								<%} %>
							</th>
						</tr>
						<% 
						}
						%>

						<% if(count == 0) {%>

						<tr>
							<th align="center">
								<s:text name="label.draw.name" />
							</th>
							<th align="center">
								<s:text name="label.draw.date" />
							</th>
							<th align="center">
								<s:text name="label.res" />
							</th>
							<th align="center">
								<s:text name="label.claim.time" />
							</th>
							<th align="center">
								<s:text name="label.draw.status" />
							</th>
							<th align="center">
								<s:text name="label.win.detail" />
							</th>
						</tr>

						<% } 
						count++;
						%>


						<tr class="data">
							<td align="center" nowrap="nowrap"><%=drawBean.getDrawname()%></td>
							<td align="center" nowrap="nowrap"><%=drawBean.getDrawDateTime()%></td>
							<%
								if (!drawStatus.equals("CANCEL")) {
							%>
							<td align="center"><%=drawBean.getWinResult()==null?"RESULT AWAITED":drawBean.getWinResult()%></td>
							<%
								} else if ("CANCEL".equalsIgnoreCase(drawStatus)) {
							%>
							<td align="center">
								<s:text name="label.draw.cancel" />
							</td>
							<%
								} else {
							%>
							<td align="center">
								<s:text name="label.res.await" />
							</td>
							<%
								}
							%>
							<td align="center"><%=pwtTimeMap.get(drawBean.getDrawId()) == null ? "N.A."
									: pwtTimeMap.get(drawBean.getDrawId())%></td>

							<td align="center"><%=drawBean.getDrawStatusForticket()%></td>


							<td colspan="4">
								<table width="100%" border="1" cellpadding="3" cellspacing="0"
									bordercolor="#CCCCCC" align="center" class="myLayout" id="panelTable">
									<tr>
										<th>
											<s:text name="label.panel.no" />
										</th>
										<th>
											<s:text name="label.panel.data" />
										</th>
										<%
											if ("Keno".equalsIgnoreCase(Util.getGameType(gameId))
															|| "Zimlottotwo".equalsIgnoreCase(Util
																	.getGameName(gameId))
																	|| "bonusballtwo".equalsIgnoreCase(Util
																	.getGameName(gameId))
															|| "SuperTwo".equalsIgnoreCase(Util
																	.getGameName(gameId))
															||"ZimLottoBonusTwo".equalsIgnoreCase(Util
																		.getGameName(gameId))
															||"ZimLottoBonusTwoFree".equalsIgnoreCase(Util
																		.getGameName(gameId))) {
										%>
										<th>
											<s:text name="label.play.type" />
										</th>
										<th>
											<s:text name="label.no.of.lines" />
										</th>
										<%
											}
										%>
										<%
											if (!tktTrack.getStatusCheck().equalsIgnoreCase(
															"Cancelled Ticket")) {
										%>
										<th>
											<s:text name="label.claim.at" />
										</th>
										<th>
											<s:text name="label.claim.stat" />
										</th>
										<th>
											<s:text name="label.win.amt" />
										</th>
										<%
											}
										%>
									</tr>
									<%
										PanelIdBean panelBean = null;
												for (int k = 0; k < panelWinList.size(); k++) {
													panelBean = panelWinList.get(k);
													String pickData = panelBean.getPickedData();
									%>

									<tr class="data">
										<td align="left"><%=panelBean.getPanelId()%></td>
										<td align="left"><%=panelBean.getPickedData().replace("-1",
										"XX")%></td>
										<%
											if ("Keno".equalsIgnoreCase(Util.getGameType(gameId))
																|| "Zimlottotwo".equalsIgnoreCase(Util
																		.getGameName(gameId))
																		|| "bonusballtwo".equalsIgnoreCase(Util
																		.getGameName(gameId))
																|| "SuperTwo".equalsIgnoreCase(Util
																		.getGameName(gameId))
																||"ZimLottoBonusTwo".equalsIgnoreCase(Util
																		.getGameName(gameId))
																||"ZimLottoBonusTwoFree".equalsIgnoreCase(Util
																		.getGameName(gameId))) {
										%>
										<td><%=panelBean.getPlayType()%></td>
										<td><%=panelBean.getLineId()%></td>
										<%
											}
										%>
										<%
											if (!tktTrack.getStatusCheck().equalsIgnoreCase(
																"Cancelled Ticket")) {
										%>
										<td align="left"><%=partyIdMap.get(panelBean
											.getPartyId()) == null ? "&nbsp;"
											: partyIdMap.get(panelBean
													.getPartyId())%></td>
										<td align="left"><%=drawStatus
											.equalsIgnoreCase("CLAIM HOLD") ? "N.A."
											: panelBean.getStatus()%></td>
										<td align="left">
											<%
												Object finalAmt;
																Object amt = drawStatus.equals("VERIFICATION_PENDING") || drawStatus.equals("CLAIM HOLD") ? "N.A."
																		:panelBean.getWinningAmt();
																if (amt instanceof Double) {
																	finalAmt = FormatNumber.formatNumberForJSP(amt);
																} else {
																	finalAmt = amt;
																}
											%><%=finalAmt%></td>
										<%
											}
										%>
									</tr>
									<%
										}
									%>

								</table>
							</td>
						</tr>
						<%
							}
						%>
					</table>




					<%
						
							} 
					%>














				</s:if>


				<%
				} 
				%>
				<%
				}
				 %>




			</div>
		</div>



	</body>
</html>

<code id="headId" style="visibility: hidden">
	$RCSfile: bo_rep_trackTicketResult.jsp,v $ $Revision: 1.6.2.1.4.7.2.14
	$
</code>