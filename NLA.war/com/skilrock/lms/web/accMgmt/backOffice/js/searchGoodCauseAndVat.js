function validateFormEntries() {
	
	var serviceNameObj =_id.o('serviceName');
	var serviceTypeObj =_id.o('commissionType');
	//alert(serviceNameObj.value);
	 if(serviceNameObj.value=='-1'){
			_id.i("error1", "Please Select Service Name .", "e");	
			return false;
	}
	 _id.i("error1", "");
	 if(serviceTypeObj.value=='-1'){
			_id.i("error2", "Please Select Commission Type .", "e");	
			return false;
	}
	if(serviceNameObj.value != 'DG' && serviceNameObj.value != 'SE'){
			_id.i("error1", "Invalid Service .", "e");
				document.getElementById('result').innerHTML="";
	 	  		document.getElementById('result1').innerHTML="";	
				return false;
	}
	 
	 _id.i("error2", "");
		return true;
	
}

function setInputHiddenValue(bValue) {
	//alert("skjhjkhfjkghdfjkghl"+bValue);
	document.getElementById('hiddenInput').value=bValue;
 	 document.getElementById('result').innerHTML="";
 	  document.getElementById('result1').innerHTML="";
 	  
 }
 var rowCount=0;
 function removeRow(id){
 var rows=(_id.o('searchTlb').getElementsByTagName('tr').length)-rowCount;
if(rows>3){
	_id.o(id).style.display='none';
	rowCount++;
}
else{
	_id.o('searchDiv').innerHTML='<table id="searchTlb" width="684" border="1" cellpadding="3" cellspacing="0" bordercolor="#CCCCCC" align="center"><tr><th align="center" colspan="5">Search Result</th></tr><tr><td colspan="5" align="center">No Records to Process for VAT Submission</td></tr></table>';
}
}
parent.frames[0].Version['$Source: /rep/LMS_Mgmt/WebRoot/com/skilrock/lms/web/accMgmt/backOffice/js/Attic/searchGoodCauseAndVat.js,v $'] = '$Id: searchGoodCauseAndVat.js,v 1.1.2.3.4.1 2013/09/19 05:07:22 yogesh Exp $';
