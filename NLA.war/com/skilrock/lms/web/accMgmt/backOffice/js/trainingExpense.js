var taskIdArr = new Array();
var updDate = null;
var trngExpType = null;
function updateData(taskId, rowCount) {
	updDate = _id.v("date");
	trngExpType = _id.v("trngExpType");
	taskIdArr[taskId] = rowCount;
	_ajaxUnsync(
			path
					+ "/com/skilrock/lms/web/actMgmt/bo_act_training_Update.action?trngExpType="
					+ trngExpType + "&taskId=" + taskId, "afterAjax");
}

function fetchActData() {
	trngExpType = _id.o('trngExpType').value;
	if(trngExpType!=-1){
	updDate = _id.v("date");
	_id.o("resultDiv").innerHTML = "";
	_id.o("reportDiv").innerHTML = "";
	_ajaxCall("bo_act_trng_exp_Search.action?date=" + updDate + "&trngExpType="
			+ trngExpType+"&gameNo="+ _id.o('gameId').value, 'reportDiv');

	_id.blk("reportDiv");
	}else{
		_id.non("reportDiv");
	}
	// filterData();
}

function isSelected(){
	trngExpType = _id.o('trngExpType').value;
	if(trngExpType==-1){
		alert('Please select type');
		_id.o("resultDiv").innerHTML = "";
		_id.o("reportDiv").innerHTML = "";
		return false;
	}else{
		_id.o("resultDiv").innerHTML = "";
		_id.o("reportDiv").innerHTML = "";
		return true;
	}
	
}

function selAll(val) {
	var chkBx = _id.n("tempStatus");
	for ( var i = 0; i < chkBx.length; i++) {
		if(!chkBx[i].disabled){
		chkBx[i].checked = val;
		updRowColor(chkBx[i].id);
		}
	}

}
function updateSelected() {
	updDate = _id.v("date");
	trngExpType = _id.v("trngExpType");
	var chkBx = _id.n("tempStatus");
	var updData = "";
	for ( var i = 0; i < chkBx.length; i++) {
		if (chkBx[i].checked == true) {
			taskIdArr[chkBx[i].value] = (chkBx[i].id).replace("chkBox", "");
			updData = updData + "&taskId=" + chkBx[i].value;
		}
	}
	if (updData.length < 1) {
		return;
	}
	/*
	 * var resUpd = _ajaxCall("bo_act_training_Update.action?" +
	 * updData.replace("&", "") + "&trngExpType=" + trngExpType);
	 */
	_ajaxUnsync("bo_act_training_Update.action?", "afterAjax",updData.replace("&", "") + "&trngExpType=" + trngExpType+"&date="+updDate+"&gameNo="+ _id.o('gameId').value);
	// asyncResult = resUpd.data;
	// alert(asyncResult);
	// afterAjax();
}

function updateAllAgent() {
	updDate = _id.v("date");
	trngExpType = _id.v("trngExpType");
	_ajaxCall("bo_act_training_UpdateAll.action?date=" + updDate
			+ "&trngExpType=" + trngExpType+"&gameNo="+ _id.o('gameId').value, 'reportDiv');

}
function updRowColor(chkBoxId) {
	var rowId = chkBoxId.replace("chkBox", "");
	var row = _id.o("row" + rowId);
	if (_id.o(chkBoxId).checked == true) {
		row.style.background = "#F8A858";
	} else {
		row.style.background = "white";
	}
}
function afterAjax() {
	var tempRes = asyncResult.split("Nxt");
	for ( var i = 0; i < tempRes.length; i++) {
		var data = tempRes[i].split(",");
		var rowNum = taskIdArr[data[0]];
		if (data[1] == "DONE") {
			_id.o('chkBox' + rowNum).checked=false;
			_id.o('chkBox' + rowNum).disabled = "disabled";
			_id.i('status' + rowNum, data[1]);
			_id.i('crNote' + rowNum, data[2]);
			_id.i('upDate' + rowNum, data[3]);
			updRowColor('chkBox' + rowNum);
		}
	}
}

function resetType(){
	_id.non("reportDiv");
}
parent.frames[0].Version["$Source: /rep/LMS_Mgmt/WebRoot/com/skilrock/lms/web/accMgmt/backOffice/js/Attic/trainingExpense.js,v $"] = "$Id: trainingExpense.js,v 1.1.2.8 2013/01/15 05:12:34 sumit Exp $";
