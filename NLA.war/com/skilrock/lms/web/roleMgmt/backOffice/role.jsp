<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<body><br>
<s:form action="/com/skilrock/lms/rolemgmt/createnrole.action" method="POST">


<h2 align="center" >select roles </h2>
<input type="checkbox" name="arr" value="user_creation">user creation</checkbox>
<input type="checkbox" name="arr" value="edit_ user_info">Edit user info</checkbox>


<s:submit value="ok" align="center"/>

</s:form>
<body>
</html>
<code id="headId" style="visibility: hidden">
$RCSfile: role.jsp,v $
$Revision: 1.1.8.2 $
</code>