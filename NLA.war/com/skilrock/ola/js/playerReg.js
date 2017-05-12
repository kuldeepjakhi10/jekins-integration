var mn = "";
var un = "";

function isValidated(){

	clearDivs();
	var flag = true;
	var walletDiv = document.getElementById("walletMsg");	
	var walletDevName =document.getElementById('walletName').value;
	var sub = document.getElementById("submit");
	
		if (walletDevName =="PLAYTECH_CASINO") {
		var password1Val = document.getElementById('password1').value;
		var password2Val = document.getElementById('password2').value;
		var p1Div = document.getElementById("p1Msg");
		var p2Div = document.getElementById("p2Msg");
		if(isEmpty(password1Val)){
		p1Div.innerHTML = "<font color=red>Please enter a password</font>";
		flag = false;
						}
		if(isEmpty(password2Val)){
		p2Div.innerHTML = "<font color=red>Please re-confirm your password</font>";
		flag = false;
		
		if(password1Val!=password2Val){
			p1Div.innerHTML = "<font color=red>Please enter same password</font>";
			p2Div.innerHTML = "<font color=red>Please enter same password</font>";
			flag = false;
				}
			}
		
		}
		if (walletDevName !="KhelPlayRummy") {	
			
			var countryVal = $('#country').val();
			if(isNotSelected(countryVal)){
				$('#countryMsg').html("<font color=red>Please Select the name of the country you live in</font>");
				flag = false;
				return flag;
			}
			
			var stateVal = $('#state').val();
			if(isNotSelected(stateVal)){
				$('#stateMsg').html("<font color=red>Please Select the name of the state you live in</font>");
				flag = false;
				return flag;
			}
			
			var cityVal = $('#city').val();
			if(isNotSelected(cityVal)){
				$('#cityMsg').html("<font color=red>Please Select the name of the city you live in</font>");
				flag = false;
				return flag;
			}
			
			var genderVal = $("input[name='playerBean.gender']:checked").val();
			if(genderVal == undefined || genderVal == null){
				$('#genderMsg').html("<font color=red>Please enter Gender</font>");
				flag = false;
				return flag;
			}
			
			var addressVal = $.trim($('#address').val());
			if(addressVal.length == 0){
				$('#addressMsg').html("<font color=red>Please enter your address</font>");
				flag = false;
				return flag;
			}
		}
		
		var firstnameVal = $.trim($('#firstName').val());
		var lastnameVal = $.trim($('#lastName').val());
		var usernameVal = $.trim($('#username').val());	
		var emailVal =$.trim($('#email').val());
		var email1Val = $.trim($('#email2').val());
		var phoneVal = $.trim($('#phone').val());
		var depositVal = $.trim($('#deposit').val());

		if(isEmpty(depositVal)){
			$('#depositMsg').html("<font color=red>Please fill Deposit Amount </font>");
			flag = false;
		}
		if (isNaN(depositVal)) {
			$('#depositMsg').html("<font color=red>Please enter valid amount </font>");
			flag = false;
		}
		var amountArr = depositVal.split('.');
		if (amountArr.length > 1) {
			if (amountArr[1].length > 2) {
				$('#depositMsg').html("<font color=red>Please enter valid amount </font>");
				flag = false;
			}
		}
		var regex = /^[0-9\.]{1,20}$/;
		if(!depositVal.match(regex))
		{
			$('#depositMsg').html("<font color=red>Please enter valid amount </font>");
			flag = false;
		}
		if(isEmpty(firstnameVal)){
			$('#fnameMsg').html("<font color=red>Please enter a first name</font>");
			flag = false;
		}
		if(checkLength(firstnameVal)){
			$('#fnameMsg').html("<font color=red>First Name should not have only one alphabate</font>");
			flag = false;
		}
		if(isEmpty(lastnameVal)){
			$('#lnameMsg').html("<font color=red>Please enter a last name</font>");
			flag = false;
		}
		if(checkLength(lastnameVal)){
			$('#lnameMsg').html("<font color=red>Last Name should not have only one alphabate</font>");
			flag = false;
		}
		if(isEmpty(usernameVal)){
			$('#unameMsg').html("<font color=red>Please enter a username</font>");
			flag = false;
		}
		if(isEmpty(emailVal)){
			$('#emailMsg').html("<font color=red>Please enter your email address</font>");
			flag = false;
		}
		if(isEmpty(email1Val)){
			$('#email2Msg').html("<font color=red>Please re-confirm your email address</font>");
			flag = false;
		}
		if(isEmpty(phoneVal)){
			$('#phoneMsg').html("<font color=red>Please enter your phone number</font>");
			flag = false;
		}
	
		if(emailVal!=email1Val){
			$('#emailMsg').html("<font color=red>Please enter same e-mail address</font>");
			$('#email2Msg').html("<font color=red>Please enter same e-mail address</font>");
			flag = false;
		}
		if(!isValidPhone(phoneVal)){
			$('#phoneMsg').html("<font color=red>Please enter correct phone number</font>");
			flag = false;
		}
		if(!isValidEmail(emailVal)){
			$('#emailMsg').html("<font color=red>Please enter a valid email address</font>");
			flag = false;
		}
		if(!isValidName(firstnameVal)){
			$('#fnameMsg').html("<font color=red>Please enter a valid first name</font>");
			flag = false;
		}
		if(!isValidName(lastnameVal)){
			$('#lnameMsg').html("<font color=red>Please enter a valid last name</font>");
			flag = false;
		}
			
		if(flag== true){
			if(mn == 'valid' && un == 'valid'){
				sub.disabled = false;
			}else{
				$('#username').html('');
				$('#phone').html('');
				if(mn == ""){
					$('#phoneMsg').html("<font color=red>User with this mobile number is already exists !!</font>");
				}
				if(un == ""){
					$('#unameMsg').html("<font color=red>User Already Exists !!</font>");
				}			
				flag = false;
				sub.disabled = true;
			}
		}
	return flag;
}

function clearDivs(){
	$("#actionMsg").empty();
	$("#walletMsg").empty();
	$("#fnameMsg").empty();
	$("#lnameMsg").empty();
	$("#genderMsg").empty();
	$("#unameMsg").empty();
	$("#emailMsg").empty();
	$("#email2Msg").empty();
	$("#phoneMsg").empty();
	$("#addressMsg").empty();
	$("#cityMsg").empty();
	$("#stateMsg").empty();
	$("#depositMsg").empty();
	$("#countryMsg").empty();
	
	var walletDevName =$('#walletName').val();
	
	if (walletDevName =="PLAYTECH_CASINO"){
		document.getElementById("p1Msg").innerHTML = "";
		document.getElementById("p2Msg").innerHTML = "";
	}
}

function isNotSelected(field){
	if(field =="-1") return true;
	return false;
}

function checkLength(val){
	if(val.length <= 1){
		return true;
	}
}

function isEmpty(field){
	if(field == "") return true;
	return false;
}

function isValidPhone(val){
	var flag = true;
	var regex = /^\d+$/;
	if(!val.match(regex))
		flag=false;
	return flag;
}

function isValidEmail(val){
	var flag = true;
	var regex = /^([A-Za-z0-9\x27\x2f!#$%&*+=?^_`{|}~-]+(\.[A-Za-z0-9\x27\x2f!#$%&*+=?^_`{|}~-]+)*)@(([a-zA-Z0-9][a-zA-Z0-9-]{0,61}[a-zA-Z0-9]|[a-zA-Z0-9]{1,63})(\.([a-zA-Z0-9][a-zA-Z0-9-]{0,61}[a-zA-Z0-9]|[a-zA-Z0-9]{1,63}))*\.[a-zA-Z0-9]{2,63})$/;
	if(!val.match(regex))
		flag=false;
	return flag;
}

function isValidName(val){
	var flag = true;
	var regex = /^[A-Za-z,\.-]{1,15}$/;
	if(!val.match(regex))
		flag=false;
	return flag;
}


function isValidText(val){
	var flag = true;
	var regex = /^[A-Za-z-]{1,50}$/;
	if(!val.match(regex))
		flag=false;
	return flag;
}

function isValidUName(val){
	var flag = true;
	//var regex = /^[A-Za-z0-9\.@_#\/'&\$\+<>\(\)\*;!\?,-]{1,32}$/;
	 var regex=/^([A-Za-z])([A-Za-z0-9\.]){4,20}$/;
	if(!val.match(regex))
		flag=false;
	return flag;
}

function isValidDeposit(val){
	var flag = true;
	var regex = /^[0-9\.]{1,20}$/;
	if(!val.match(regex))
		flag=false;
	return flag;
}
function checkAvlUser() {
	
	if (_id.v("username") == "") {
		_id.i("unameMsg", "Please Enter User Name", "e");
		return false;
	}
	var walletDevName = document.getElementById("walletName").value;
	var sub = document.getElementById("submit");	
	_id.o("unameMsg").innerHTML = "Validating User Name.....<img src=\"" + projectName + "/LMSImages/images/loadingAjax.gif\"/>";
	url = projectName+"/com/skilrock/ola/commonMethods/action/checkUserNameAvalblity.action?userName="+ _id.v("username")+"&walletName="+walletDevName;
	_resp = _ajaxCallJson(url);
	
	if (_resp.isSuccess) {
		$('#unameMsg').html("<font color='red'>"+_resp.message+"</font>");
		//sub.disabled = true;
	} else{
		un = "valid";
		sub.disabled = false;
		$('#unameMsg').html("<font color='green'>"+_resp.message+"</font>");
	}
}

function checkAvlEmail() {	
	if (_id.v("email") == "") {
		_id.i("emailMsg", "Please Enter Email", "e");
		return false;
	}	
	var flag =isValidEmail(_id.v("email"));
	if(!flag){
		_id.i("emailMsg", "Please Enter Valid Email", "e");
		return false;
	}
	var walletDevName = document.getElementById("walletName").value;
	if (walletDevName == "RUMMY"||walletDevName == "KhelPlayRummy") {
		//code deleted for rummy and kp	
	}
}	
	

function displayPassword(walletValue) {
	clearDivs();
if(document.getElementById('walletName').value!="-1")
{
	var walletDisplayName = walletValue.split(":");
	var walletDevName = walletDisplayName[1];
	var returnType=confirm("You have selected :: " + walletDevName);
//	alert(returnType);
		if(returnType)    
  			{     
						
			if (walletDevName =="PLAYTECH_CASINO") {
			//		alert('3 insode yes');
				document.getElementById("password11").style.display = "block";
				document.getElementById("password22").style.display = "block";
				document.getElementById("checkAvail").style.display = "none";
					} else {
			//alert('4 insode no');
					document.getElementById("password11").style.display = "none";
					document.getElementById("password22").style.display = "none";
					document.getElementById("checkAvail").style.display = "block";
						if(walletDevName =="KhelPlayRummy"){
							document.getElementById("addDiv").style.display = "none";
							document.getElementById("addDiv1").style.display = "none";
							document.getElementById("genDiv1").style.display = "none";
							document.getElementById("genDiv").style.display = "none";
							document.getElementById("stateDiv1").style.display = "none";
							document.getElementById("stateDiv").style.display = "none";
							document.getElementById("cityDiv1").style.display = "none";
							document.getElementById("cityDiv").style.display = "none";
						
							
						}
					
					}
	
  }
 else
 {
     document.getElementById('walletName').selectedIndex=0;
     document.getElementById('walletName').focus();
     //return false;
 }
} else{
	
	
	document.getElementById("addDiv").innerHTML="";
	document.getElementById("genDiv").innerHTML="";
	document.getElementById("stateDiv").innerHTML="";
	document.getElementById("cityDiv").innerHTML="";
	
}



}
function getStates(){
	var walletValue = document.getElementById("walletName").value;
	var walletDisplayName = walletValue.split(":");
	var walletDevName = walletDisplayName[1];
	if (walletDevName != "KhelPlayRummy") {	
		_ajaxCall('getState.action?country=' + this.value,'characters');
	}

}
function onLoadData(){
	
	fetchActiveWallets(projectName);
	onLoadAjax('getListAjax.action?listType=country','country');
	selectState();
	
	



}
function fetchCityList() {
	
	var country = _id.o('country').value;
	var state = _id.o('plrState').value;
		//alert(country+":"+state);
		_ajaxCall("getCity.action?country=" + country + "&state=" + state,'charactersCity');
}
function selectState(){
		//alert(document.getElementById('plrState').selectedIndex);
		 document.getElementById('plrState').selectedIndex=1;
			fetchCityList();
}
function checkAvlMobile() {
	
	if (_id.v("phone") == "") {
		_id.i("phoneMsg", "Please Enter Phone", "e");
		return false;
	}	
	var flag =isValidPhone(_id.v("phone"));
	if(!flag){
		_id.i("phoneMsg", "Please Enter Valid Phone", "e");
		return false;
	}
	var walletDevName = document.getElementById("walletName").value;
	var sub = document.getElementById("submit");	
	_id.o("phoneMsg").innerHTML = "Validating Phone Number.....<img src=\"" + projectName + "/LMSImages/images/loadingAjax.gif\"/>";
	url = projectName+"/com/skilrock/ola/commonMethods/action/checkMobileNumAvalblity.action?phone="+ _id.v("phone")+"&walletName="+walletDevName;
	_resp = _ajaxCallJson(url);
	if (_resp.isSuccess) {
		$('#phoneMsg').html("<font color='red'>"+_resp.message+"</font>");
		//sub.disabled = true;
	} else{
		mn = "valid"		
		sub.disabled = false;
		$('#phoneMsg').html("<font color='green'>"+_resp.message+"</font>");
	}
	
}