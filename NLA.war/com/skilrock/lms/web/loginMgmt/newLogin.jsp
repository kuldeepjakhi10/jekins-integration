<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.skilrock.lms.common.utility.CommonMethods"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="java.util.Locale"%>
<!--<//%@page import="com.skilrock.lms.web.loginMgmt.I18Util"%>-->
<%@taglib prefix="s" uri="/struts-tags"%>
<%@page import="java.util.Map"%>
<%@page import="org.apache.struts2.ServletActionContext"%>
<%
	//response.setCharacterEncoding("UTF-8");
	ServletContext sc = ServletActionContext.getServletContext();
	Map errorSessionMap = (Map) sc.getAttribute("ERROR_SESSION_MAP");
	if (errorSessionMap != null && errorSessionMap.isEmpty()) {
		response.setDateHeader("Expires", System.currentTimeMillis()
				+ 10 * 24 * 60 * 60 * 1000);
	} else {
		response.setDateHeader("Expires", 1000);
	}
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title><%=application.getAttribute("JSP_PAGE_TITLE")%></title>

		<style type="text/css">
body {
	font-family: Verdana, Arial, Helvetica,
		sans-serif color :                
		                                                      
		                       #333333;
	font-size: 1px;
	background: #FFF;
	margin: 0;
	/* it's good practice to zero the margin and padding of the body element to account for differing browser defaults */
	padding: 0;
	text-align: center;
	/* this centers the container in IE 5* browsers. The text is then set to the left aligned default in the #container selector */
}

#container {
	background: #FFF;
	width: 560px;
	height: auto;
	position: relative;
	margin: auto;
	padding: 100px;
}

a:link {
	color: #5a77a6;
	font-family: "Segoe UI", Tahoma, Verdana, "Times New Roman", Helvetica,
		"Helvetica Condensed";
	text-decoration: none;
	font-size: 13px;
}

a:active {
	color: #5a77a6;
	font-family: "Segoe UI", Tahoma, Verdana, "Times New Roman", Helvetica,
		"Helvetica Condensed";
	text-decoration: none
}

a:visited {
	color: #5a77a6;
	font-family: "Segoe UI", Tahoma, Verdana, "Times New Roman", Helvetica,
		"Helvetica Condensed";
	text-decoration: none
}

a:hover {
	text-decoration: underline;
	font-family: "Segoe UI", Tahoma, Verdana, "Times New Roman", Helvetica,
		"Helvetica Condensed";
	color: #990000
}

td {
	margin-left: 2px
}

.loginbold {
	font-weight: 900
}

.shadowbackground {
	background: #F7F7F7;
	border-bottom: #CCCCCC 1px solid;
	border-left: #CCCCCC 1px solid;
	border-right: #CCCCCC 1px solid;
	width: 544px;
}

.border_image {
	border: #CCCCCC 1px solid;
	text-align: center
}

input.text {
	border: #CCCCCC 1px solid;
}

.submit {
	margin: 0;
	font: bold Arial, Sans-serif;
	border: 1px solid #CCC;
	background: #FFF;
	padding: 2px 3px;
	color: #4284B0;
	cursor: hand;
	font-size: 15px;
}

.smallFont {
	font-size: 9px;
	text-transform: uppercase
}

.rightPad {
	padding-right: 12px;
	text-align: right
}

.errorMessage {
	color: #FF0000;
	font-size: 12px;
	padding-right: 8px;
	font-weight: bold;
}

.shadow_tab {
	filter: progid :          
		                                                        
		                           DXImageTransform .  
		                           
		     
		                 
		                                        Microsoft .          
		                              
		     
		  
		 
		  
		
		    
		
		 
		
		
		   
		
		
		  
		 
		
		
		               Shadow(color =              
		                                                          
		                     #CACACA, direction =                             
		 
		     
		                  
		                                      130, strength =            
		                              
		                                                   5);
	-ms-filter: progid :            
		                                                    
		                             DXImageTransform .    
		                           
		    
		               
		                                         Microsoft .           
		                              
		    
		  
		 
		  
		
		    
		
		 
		
		
		   
		
		
		  
		 
		
		
		               Shadow(color =              
		                                                          
		                     #CACACA, direction =                             
		 
		     
		                  
		                                      130, strength =            
		                              
		                                                   5);
}
</style>
		<script>
var presentProjectName = "<%=request.getContextPath()%>";
var host = "<%=application.getAttribute("HOST")%>";
var port = "<%=application.getAttribute("PORT")%>";
var projectName = "<%=request.getContextPath()%>";
var country = '<%=application.getAttribute("COUNTRY_DEPLOYED")%>';
var cookie = document.cookie;
var lang = '<%=Locale.getDefault().getLanguage()%>';
if(cookie!=null){
	var cookieArray = cookie.split('; ');
	for(var loop=0; loop < cookieArray.length; loop++)
	{
		var nameValue = cookieArray[loop].split('=');
		if( nameValue[0].toString() == 'LMSLocale' ){
			lang = nameValue[1].toString();
		}
	}
}
var fileName="Messages_"+country;
</script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/jquery-1.10.2.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/jquery.i18n.properties-min-1.0.9.js"></script>

		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/i18nLoader.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/com/skilrock/lms/web/loginMgmt/js/login.js"></script>
		<script type="text/javascript">
window.history.forward();
function chngcolor(id){

document.getElementById(id).bgcolor="red";
}
</script>


	</head>
	<body onload="initialFocus(); detectBrowser()">
			<s:url id="indexEN" namespace="/com/skilrock/lms/web/loginMgmt" action="locale">
      			<s:param name="request_locale" >en</s:param>
  	 		</s:url>
   			<s:url id="indexFR" namespace="/com/skilrock/lms/web/loginMgmt" action="locale">
      			<s:param name="request_locale" >fr</s:param>
   			</s:url>

		<div id="container">
			<%
				StringBuffer codebaseBuffer = new StringBuffer();
				codebaseBuffer.append(!request.isSecure() ? "http://" : "https://");
				codebaseBuffer.append(request.getServerName());
				if (request.getServerPort() != (!request.isSecure() ? 80 : 443)) {
					codebaseBuffer.append(':');
					codebaseBuffer.append(request.getServerPort());
				}
				codebaseBuffer.append(request.getContextPath());

				codebaseBuffer.append('/');
				System.out.println(codebaseBuffer.toString());
			%>

			<form onsubmit="return isST3Filled()" name="login"
				action="<%=request.getContextPath()%>/LoginServlet" method="post">
				<input type="hidden" name="oldHttpSess"
					value="<%=request.getParameter("oldHttp")%>" />

				<input type="hidden" name="macId" id="macId" value="" />
				<input type="text" name="browser" id="browser" value=""
					style="display: none" />


				<table width="545" border="0" cellspacing="0" cellpadding="8"
					align="center" class="shadow_tab">
					<tr>
						<td valign="top" align="center">

							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>

									<td class="border_image">
									
									<s:if test="%{#application.COUNTRY_DEPLOYED=='ZIMBABWE'}"> 
									 <img
											src="${pageContext.request.contextPath}/LMSImages/images/AfricaLottoLMS.gif"
											width="536" height="110" />
									</s:if>
									<s:elseif test="%{#application.COUNTRY_DEPLOYED=='GHANA'}">
						     		 <img
											src="${pageContext.request.contextPath}/LMSImages/images/LoginLMS_Ghana.gif"
											width="536" height="110" />
									</s:elseif>
									<s:elseif test="%{#application.COUNTRY_DEPLOYED=='NIGERIA'}">
									<img
											src="${pageContext.request.contextPath}/LMSImages/images/LagosLogoLogin.gif"
											width="536" height="110" />
									</s:elseif>
									<s:elseif test="%{#application.COUNTRY_DEPLOYED=='BENIN'}">
						     		 <img
											src="${pageContext.request.contextPath}/LMSImages/images/BeninLogoLogin.jpg"
											width="536" height="110" />
									</s:elseif>
									</td>

								</tr>
								<tr>
									<td align="center" colspan="3" class="shadowbackground">
										<img
											src="<%=request.getContextPath()%>/LMSImages/images/srtip.gif"
											width="537" height="3" />
									</td>
								</tr>
								
								<tr>
									<td colspan="3" align="left" valign="top"
										class="shadowbackground" height="200">

										<table width="100%" border="0" cellspacing="0" cellpadding="4">

											<tr>
												<td colspan="3">
													&nbsp;
												</td>
											</tr>
											<tr>
												<!-- <td width="42%" align="right" style="font-size: 12px">
													&nbsp;User Name
												</td> -->
												<!-- <td width="42%" align="right" style="font-size: 12px">
													&nbsp;<//%=I18Util.rb2.getObject("label.username") + "<br/>"
					+ I18Util.rb3.getObject("label.username")%>
												</td> -->

												<td width="42%" align="right" style="font-size: 12px">
													&nbsp;
													<s:text name="user_name" />
												</td>
												<td width="24%">
													<input type="text" name="username" id="username"
														onfocus="chngcolor(this.id)" size="20" class="text" />
												</td>
												<td width="34%" class="errorMessage" align="center"
													nowrap="nowrap">
													<div id="user"></div>
												</td>
											</tr>
											<tr>
												<!-- <td align="right" style="font-size: 12px">
													&nbsp;<//%=I18Util.rb2.getObject("label.password") + "<br/>"
					+ I18Util.rb3.getObject("label.password")%>
												</td> -->
												<td align="right" style="font-size: 12px">
													&nbsp;
													<s:text name="password" />
												</td>
												<td>
													<input type="password" name="password" id="password"
														onfocus="chngcolor(this.id)" size="20" class="text"
														onkeypress="capLock(event)" />
												</td>
												<td class="errorMessage" align="center">
													<div id="pass"></div>
												</td>
											</tr>
											<tr>
												<td class="errorMessage" align="center" colspan="2">
													<div id="caps"></div>
												</td>
											</tr>
											<s:if test="%{#application.COUNTRY_DEPLOYED=='BENIN'}"> 
												<tr>
												<td align="left" style="font-size: 13px"colspan="3" >
													
													<b style="margin-left: 11em"><s:text name="Language:"/></b>
												
															&nbsp;&nbsp;&nbsp;&nbsp;
															<s:a href="%{indexEN}">English</s:a>&nbsp;&nbsp;&nbsp;&nbsp;
															<s:a href="%{indexFR}">français</s:a>
															
													</td>
												</tr>
											</s:if>
											<!--<tr>
											<td align="center" style="font-size: 12px"colspan="1">
													
													<s:text name="Language:" />
												</td>
											<td>
											<ul class="dropdown-menu">
               											 <li>
               											 <s:a href="%{indexEN}">English</s:a>&nbsp;&nbsp;<li><s:a href="%{indexFR}">French</s:a></li>
               											 </li>										
          									      </ul>
																		</td>
																		</tr>
											--><tr>
												<td align="left" colspan="3" height="2">
													<%
														//	System.out.println(errorSessionMap+"------------"+request.getParameter("oldHttp"));
														if (errorSessionMap != null
																&& errorSessionMap.containsKey(request
																		.getParameter("oldHttp"))) {
															if (request.getParameter("oldHttp") != null) {

																String errorMessage = (String) errorSessionMap.get(request
																		.getParameter("oldHttp"));
																errorSessionMap.remove(request.getParameter("oldHttp"));
																sc.setAttribute("ERROR_SESSION_MAP", errorSessionMap);
													%>
													<ul style="list-style-type: none; text-align: center;">
														<li class="errors">
															<span class="errorMessage"><%=errorMessage%></span>
														</li>
													</ul>
													<%
														}
														}
													%>

													<s:actionerror theme="simple"
														cssStyle="font-family:Verdana; color:#0000FF; font-size:11px"
														cssClass="welcomeNote" />
													<s:fielderror cssClass="welcomeNote" />

												</td>
											</tr>

											<tr>
												<td align="left" colspan="3" height="2"></td>
											</tr>
											<tr>
												<td>
													&nbsp;
												</td>
												<td align="right">
													<input type="submit" id="submitLogin"
														onclick="this.disabled=disabled" class="submit"
														value=<s:text name="btn.login"/> />
												</td>
												<td>
													&nbsp;
												</td>
											</tr>
											<tr>
												<td align="right">
													<!-- <a
														href="com/skilrock/lms/web/loginMgmt/forgotPassword.action">Forgot
														Password</a> -->
												</td>
												<td colspan="2">
													&nbsp;
												</td>
											</tr>
											<tr>
												<td colspan="2" align="right">
													<div id="browserErr" class="errorMessage"
														style="display: none;">
														<s:text name="label.pls.login.using.ie"/> 6.0, 7.0
													</div>
												</td>
											</tr>
											<tr>
												<td valign="bottom" class="smallFont">
													&nbsp; &copy;2008 - sugal & Damani
												</td>
												<td class="rightPad" colspan="2" valign="bottom"
													align="right">
													<table width="200" border="0" cellspacing="0"
														cellpadding="0" align="right">
														<tr>
															<td width="107" align="right" valign="bottom"
																class="smallFont">
																<s:text name="label.power.by"/>
															</td>
															<td width="93">
																<a href="http://www.sugaldamani.com"> <img
																		src="<%=request.getContextPath()%>/LMSImages/images/PoweredBySugalnDamani.gif"
																		width="96" height="66" align="right" border="0"
																		alt="Sugal&Damani" /> </a>

															</td>
														</tr>
													</table>
												</td>
											</tr>
										</table>
									</td>
								</tr>

							</table>

						</td>
					</tr>
				</table>
				<table width="545" border="0" cellspacing="0" cellpadding="8"
					align="center">
					<tr style="font-size: 12px">
						<%
							if (CommonMethods.getArchDate() == null) {
						%>
						<td align="right"><%=(String) application.getAttribute("VERSION_DETAILS")%></td>
						<%
							} else {
						%>
						<td align="right"><%=(String) application.getAttribute("VERSION_DETAILS")%>
							<br />
							Archive Date
							<%=CommonMethods.getArchDate()%></td>
						<%
							}
						%>
					</tr>
				</table>
			</form>
			<applet code="TicketApplet" codebase="<%=codebaseBuffer.toString()%>"
				jnlp_href="applets/App.jnlp" width="1" height="1" name="TicketApp"
				mayscript>
				<param name="data" value="108172000002746000" />
				<param name="login" value="yes" />
				<div style="font-size: 12px; height: 300px; line-height: center;">
					<table>
						<tr>
							<td height="300px;" align="center">
								<s:text name="msg.no.java.rt.found"/>
								<br />
								<a style="color: red"
									href="<%=request.getContextPath()%>/com/skilrock/lms/web/drawGames/common/jre-1_5_0_12-windows-i586-p.exe"><s:text name="msg.click.to.install"/></a>
							</td>
						</tr>
					</table>
				</div>
			</applet>
		</div>
	</body>
	<script>

BrowserDetect.init();
function detectBrowser(){
	document.getElementById('browser').value = BrowserDetect.browser;
	return true;
}

if(BrowserDetect.browser!="Explorer"){
//disableSub();
}else if((BrowserDetect.browser=="Explorer")&&!((BrowserDetect.version=="6")||(BrowserDetect.version=="7")||(BrowserDetect.version=="8"))){
		//disableSub();
}

function disableSub(){
document.getElementById("submitLogin").disabled=true;
alert("Please login using IE 6.0 , 7.0");
document.getElementById("browserErr").style.display="block";
}
</script>
</html>
<code id="headId" style="visibility: hidden">
	$RCSfile: newLogin.jsp,v $ $Revision: 1.1.2.1.4.3.2.12.4.1.2.6 $
</code>