function getAgentList() {
	var text = _ajaxCall(path + "/com/skilrock/lms/web/userMgmt/getAgentNameList.action?orgType=AGENT");
	var firstArr = text.data.split(":");
	var retObj = _id.o("agtOrgName");
	for (var i = 0; i < firstArr.length - 1; i++) {
		var retNameArray = firstArr[i].split("|");
		var opt = new Option(retNameArray[0].toUpperCase(), retNameArray[1]);
		retObj.options[i + 1] = opt;
	}
}

function getActiveRGLimitList(){
	var _resp = _ajaxCall("bo_rep_fetchActiveRGLimits.action?filter="+ _id.v("filter"));
	_id.i("limits", _resp.data);
}

function showDates(){
	getActiveRGLimitList();
	document.getElementById('reportDiv').innerHTML = '';
	document.getElementById('dates').innerHTML = '';
	if(document.getElementsByName('filter')[0].value == 'All'){
		document.getElementById('date').style.display = 'block';
	}
	else{
		document.getElementById('date').style.display = 'none';
	}
	getActiveRGLimitList();
}

function toggleLimitDisplay(){
	var checkboxObj = document.getElementById('limits').getElementsByTagName('input');
	for(i=0; i<checkboxObj.length ;i++){
		if(checkboxObj[i].checked){
			var obj = document.getElementById('reportDiv');
			var obj2 = obj.getElementsByTagName('th');
			var obj3 = obj.getElementsByTagName('td');
			for(j=0; j<obj2.length; j++){
				if(obj2[j].name != undefined){
					if(obj2[j].name == checkboxObj[i].value){
						obj2[j].style.display = 'block';
					}
				}
			}
			for(j=0; j<obj3.length; j++){
				if(obj3[j].name != undefined){
					if(obj3[j].name == checkboxObj[i].value){
						obj3[j].style.display = 'block';
					}
				}
			}
		}
		else{
			var obj = document.getElementById('reportDiv');
			var obj2 = obj.getElementsByTagName('th');
			var obj3 = obj.getElementsByTagName('td');
			for(j=0; j<obj2.length; j++){
				if(obj2[j].name != undefined){
					if(obj2[j].name == checkboxObj[i].value){
						obj2[j].style.display = 'none';
					}
				}
			}
			for(j=0; j<obj3.length; j++){
				if(obj3[j].name != undefined){
					if(obj3[j].name == checkboxObj[i].value){
						obj3[j].style.display = 'none';
					}
				}
			}
			
		}
	}
	return true;
}

function validateDates() {

	var isInValid = false;
     
	//alert();
	var startDate = document.getElementById("start_date").value;
	var endDate =  document.getElementById("end_date").value;	
    // alert(startDate+"  "+endDate);
    
	if (startDate == "" || endDate == "") {
		isInValid = true;
		document.getElementById("dates").innerHTML = "<font color = 'red'>Please Enter all the dates</font>";
       //alert("please enter dates");      
	} else {
		var stArr = startDate.split('-');
		var endArr = endDate.split('-');
		var tempStDate = stArr[1] + '-' + stArr[0] + '-' + stArr[2]; 
		var tempEndDate = endArr[1] + '-' + endArr[0] + '-' + endArr[2]; 
		if ((Date.parse(tempEndDate) - Date.parse(tempStDate))<0) {
			isInValid = true;
			document.getElementById("dates").innerHTML = "<font color = 'red'>end date should be greater then or equals to start date</font>";          
          //alert("end date should be lesser then start date");	
		}
	}
	//alert(isInValid);
	return !isInValid;
}
parent.frames[0].Version["$Source: /rep/LMS_Mgmt/WebRoot/com/skilrock/lms/web/reportsMgmt/backOffice/js/Attic/rgRep.js,v $"] = "$Id: rgRep.js,v 1.1.2.5 2011/04/15 11:22:29 umesh Exp $";