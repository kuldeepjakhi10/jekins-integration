function checkAll(boxVal){
var checkBoxes=document.getElementsByName("check");
for(var i=0;i<checkBoxes.length;i=i+1){
	if(!checkBoxes[i].disabled){
			checkBoxes[i].checked=boxVal;
	}

} 
}
function validatePayment(){
var downDiv=document.getElementById("down");
var actionDiv=document.getElementById("actionDiv");
var distributorType= document.getElementById("distributorType").value;
var distributorTypeDiv=document.getElementById("distributorTypeMsg");
clearDiv();
if(isSelected(distributorType)){
distributorTypeDiv.innerHTML="<font color=red>Please Select Distributor</font>";
return false;
}
function clearDiv(){
distributorTypeDiv.innerHTML="";
_id.i("down","");
actionDiv.innerHTML="";
}
function isSelected(val){
if(val=="-1"){
return true;
}
return false;

}
return true;
}




function verifyCheckBox(){
var errorMsgDiv=document.getElementById("errorMsg");
var checkBoxes =document.getElementsByName("check");
var check =false;
clearDiv();
for(var i=0;i<checkBoxes.length;i=i+1){
	if(checkBoxes[i].checked == true){
		check=true;
		var s = confirm("Process Checked Record");
		if(s==true){
			document.getElementById('submit').style.display = "none";
			_id.o("imageLoad").innerHTML = "Processing.....<img src=\"" + projectName + "/LMSImages/images/loadingAjax.gif\"/>";
			return true;
		}
		else{
		return false;
		}
	
	}

}
if (!check) {
errorMsgDiv.innerHTML="<font color=red>Please choose at least one record</font>";
		return false;
	}
function clearDiv(){
errorMsgDiv.innerHTML="";

}	
	
}
parent.frames[0].Version['$Source: /rep/LMS_Mgmt/WebRoot/com/skilrock/lms/web/ola/js/Attic/pinSalePayment.js,v $'] = '$Id: pinSalePayment.js,v 1.1.2.2.4.1 2013/09/19 05:16:31 yogesh Exp $';