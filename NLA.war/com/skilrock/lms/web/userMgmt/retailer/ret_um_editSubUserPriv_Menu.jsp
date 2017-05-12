<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib prefix="s" uri="/struts-tags"%>
	
	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
	
	<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	
	<head>
	
	
	
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	
	<link rel="stylesheet" href="<%=request.getContextPath() %>/LMSImages/css/styles.css"  type="text/css"/>
	
	<title><%=application.getAttribute("JSP_PAGE_TITLE")%></title>
		
	
	<s:head theme="ajax" debug="false"/>
		
		<script type="text/javascript">

var req;
  function getUserPriveledges()
{
  var userName=document.getElementById('userName').value;
  var url='ret_um_editSubUserPriv_FetchPriv.action?userName='+userName;
    // alert("url is" +url);
    document.getElementById('lodingImage').style.display="block";
   _resp  = _ajaxCall(url);
	if(_resp.result){
        document.getElementById('lodingImage').style.display="none";
        _id.i('result',_resp.data);
     
      } else {
        alert("Problem: ");
        }
 
return false;

}
 
function validate()
{

if(document.editUserPriv.userName.value=="-1"){

document.getElementById("userDiv").innerHTML="<font color=\"red\">Please Select User Name</font>";
document.getElementById("userDiv").colSpan="2";
return false;
}
else
{document.getElementById("userDiv").innerHTML="";
}
var checkArray=document.editUserPriv.groupName;

var flag=false;
for(var i=0;i<checkArray.length;i++){


if(checkArray[i].checked!=false){
flag=true;
break;
}
}
if(flag==false){
document.getElementById("userDiv1").innerHTML="<font color=\"red\">Please Assign Atleast One Privilege or Edit User Status</font>";
}
return flag;

}

function selectAll(rowId,checkBoxId)
{
var checkAll;
if(document.getElementById(checkBoxId).checked==true)
  checkAll=true;
  else
  checkAll=false;

var rowCheckbox =document.getElementById(rowId).getElementsByTagName("input");
var length=rowCheckbox.length;
for(var i=0;i<length;i++)
{
  if(rowCheckbox[i].type=='checkbox')
      rowCheckbox[i].checked=checkAll;
}


}
	
	function changeTab(interCol,privRow,noCol)
	{
		//alert("vaibhav");
		var i,interColName,privRowName;
		interColName='';
		privRowName='';
		for(i=0;i<interCol.length-1;i++)
			interColName=interColName+interCol.charAt(i);
		for(i=0;i<privRow.length-1;i++)
			privRowName=privRowName+privRow.charAt(i);
		//alert(privRowName);
		
		var check;
		check=true;
		if(document.getElementById(privRow).style.display=='block')
		{
			check=false;
		}
		for(i=1;i<=noCol;i++)
		{
			document.getElementById(interColName+i).className="unselectedTab";
			document.getElementById(privRowName+i).style.display='none';
		}
		if(check==true)
		{
			document.getElementById(interCol).className="selectedTab";
			document.getElementById(privRow).style.display='block';
		}
	}
	function showHideTab(interRow)
	{
		//alert("vaibhav");
		if(document.getElementById(interRow).style.display=='none')
		{
			document.getElementById(interRow).style.display='block';
		}
		else
		{
			document.getElementById(interRow).style.display='none';
		}
	}
	
	
	// added by pavan/vaibhav
	
	function setRolePriv(tableId,countId){
		/*if(document.getElementById(id).checked==true)
			document.getElementById(countId).value=parseInt(document.getElementById(countId).value)+1;
		else{
		if(document.getElementById(countId).value!=0)
			document.getElementById(countId).value=parseInt(document.getElementById(countId).value)-1;
			
			}*/
	var tag=document.getElementById(tableId).getElementsByTagName("input");
	var count=0;
	for(var i=0;i<tag.length;i++){
		if(tag[i].type=='checkbox'&& tag[i].checked==true&&tag[i].name=='groupName'){
			count++;
		}
	}
	document.getElementById(countId).value=count
	}

</script>

		</head>
	
	<body>
	<%@include
				file="/com/skilrock/lms/web/loginMgmt/menu.jsp"%>

	<div id="wrap">

  <div id="top_form">
   <h3>Edit User Privileges</h3>
		
		
				<s:form name="editUserPriv"	action="ret_um_editSubUserPriv_Save.action"	method="POST" onsubmit="return validate()">

		 <table width="300" cellpadding="2" cellspacing="0" border="0">
		 <tr><td>
	      <div id="userDiv"></div>
					<s:select label="User Name" id="userName" name="userName"
						cssClass="option" list="headsUserList.{userName}"
						onchange="getUserPriveledges()" headerKey="-1" headerValue="-- Please Select --"></s:select>
	     </td></tr>
	     <tr>
	       <td id="lodingImage" style="display: none;color: red;" >Wait...<img   src="<%=request.getContextPath() %>/LMSImages/images/loadingAjax.gif"/></td>
	     </tr>
	     </table><br />
         
	<table width="700" cellpadding="2" cellspacing="0" border="0" align="center">
    <tr><td><div id="userDiv1"></div></td></tr>
	<tr><td><div id="result"></div></td></tr>
    </table>

				

				</s:form>
			</div>
		</div>
	</body>
</html>
<code id="headId" style="visibility: hidden">
$RCSfile: ret_um_editSubUserPriv_Menu.jsp,v $
$Revision: 1.3.8.2 $
</code>