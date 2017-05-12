<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	response.setDateHeader("Expires", System.currentTimeMillis() + 10
			* 24 * 60 * 60 * 1000);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type"
			content="text/html; charset=iso-8859-1" />
		<title>Reprint Error</title>


	</head>

	<body>
		<table>
			<tr>
				<td>
					<b><s:label name="errMsg"></s:label>
					</b>
					<script>
					   var errMsg="<%=request.getAttribute("errMsg")%>";
					   var isRG="<%=request.getAttribute("isRG")%>";
					   (isRG=="true")?parent.displayErrMsg(errMsg):parent.displayErrMsg();
					</script>
				</td>
			</tr>
		</table>
	</body>
</html>

<code id="headId" style="visibility: hidden">
$RCSfile: reprintError.jsp,v $
$Revision: 1.1.2.2.4.2.10.1 $
</code>