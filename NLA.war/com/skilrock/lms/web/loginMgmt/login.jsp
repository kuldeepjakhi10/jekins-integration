<%@page import="com.skilrock.lms.common.utility.CommonMethods"%>
<%@page import="java.util.Locale"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
response.setDateHeader("Expires",System.currentTimeMillis() + 100);
Cookie[] cookies = request.getCookies();
Cookie userLocale = null;
String requestedLocale = "";
if(cookies != null){ 
	for (Cookie element : cookies) {
		userLocale = element;
		if (userLocale.getName().equals("LMSLocale")) {
				requestedLocale = userLocale.getValue();
				break;
		}
	}
}
if(requestedLocale == ""){
	requestedLocale = Locale.getDefault().getLanguage();
}
%>
<html>
<body>
<form name="login">
<s:text name="label.pls.wait"/>.................
<input type="hidden" name="data" value="<%=session.getId()%>" />
<%response.sendRedirect(application.getAttribute("HOST")+"://"+request.getServerName()+application.getAttribute("PORT")+request.getContextPath()+"/com/skilrock/lms/web/loginMgmt/newLogin.action?request_locale="+requestedLocale+"&oldHttp="+session.getId()); %>
</form>
</body>
</html>
<code id="headId" style="visibility: hidden">
$RCSfile: login.jsp,v $
$Revision: 1.1.8.2.10.2 $
</code>