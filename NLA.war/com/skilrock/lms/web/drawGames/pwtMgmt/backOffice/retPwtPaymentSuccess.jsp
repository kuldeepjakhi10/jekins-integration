<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
	    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<link rel="stylesheet" href="<%=request.getContextPath() %>/LMSImages/css/styles.css"  type="text/css"/>
	    <title><%application.getAttribute("JSP_PAGE_TITLE"); %></title>   
	</head>
	
		  <body>
		       <%@include file="/com/skilrock/lms/web/loginMgmt/menu.jsp" %>
		      <h3>Winning Payment has bean Done Successfully</h3>
		       <table border="1" cellpadding="2" cellspacing="0" width="300px">
		           <tr>
		             <td>
		                Receipt Number : 
				 		 <a  href="<%=request.getContextPath() %>/com/skilrock/lms/web/reportsMgmt/rep_common_openPDF.action" target="_blank">
				 			<s:property value="%{#session.generatedReceiptNumber}"/>
				 		</a>		                
		             </td>
		            </tr>
		            <tr>
		              <td>
		                Show Receipt
		              </td>
		            </tr>
		       
		       </table>
		  
		  </body>

</html>
<code id="headId" style="visibility: hidden">
$RCSfile: retPwtPaymentSuccess.jsp,v $
$Revision: 1.1.8.3 $
</code>