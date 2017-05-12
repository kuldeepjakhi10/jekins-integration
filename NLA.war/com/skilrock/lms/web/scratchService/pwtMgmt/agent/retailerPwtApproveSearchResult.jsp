<%@ page contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<HTML xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<link rel="stylesheet" href="<%=request.getContextPath() %>/LMSImages/css/styles.css"  type="text/css"/>
	<title><%=application.getAttribute("JSP_PAGE_TITLE")%></title>	
	<s:head theme="ajax" debug="false"/>	
</head>
  
<body>
      
      <table border="1" cellpadding="2" cellspacing="0" width="100%" bordercolor="#cccccc" align="center">
        <tr style="background: #eee">
          <th>Request Id</th>
          <th>Requested By</th>
          <th>Status</th>
          <th>Party Name</th>
          <th>Remarks</th>
        </tr>
	    <s:if test="%{pwtReqDetailsList.size()>0}">
	    <s:iterator value="%{pwtReqDetailsList}">
	       <tr>
	          <td><a href="#"  onclick="showdetails('<s:property value="%{request_id}"/>','<s:property value="%{req_status}"/>','<s:property value="%{partyName}"/>','<s:property value="%{pwt_amt}"/>','<s:property value="%{retailer_name}"/>','<s:property value="%{task_id}"/>','<s:property value="%{requested_by_org_id}"/>','<s:property value="%{ticket_nbr}"/>','<s:property value="%{virn_nbr}"/>','<s:property value="%{game_id}"/>','<s:property value="%{game_nbr}"/>')"><s:property value="%{request_id}"/></a></td>
	          <td><s:property value="%{retailer_name}"/></td>
	          <td><s:property value="%{req_status}"/></td>
	          <td><s:property value="%{partyName}"/></td>
	          <td><s:property value="%{remarks}"/></td>
	       </tr>
	    </s:iterator>
	    </s:if>
	    <s:else>
	     <tr><td colspan="5" align="center">No Records Found</td></tr>
	    </s:else>
     </table>
    
</body>



</HTML>
<code id="headId" style="visibility: hidden">
$RCSfile: retailerPwtApproveSearchResult.jsp,v $
$Revision: 1.1.8.2 $
</code>