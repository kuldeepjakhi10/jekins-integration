
var _kenoWinArr = new Array();
var _kenoDrawIdArr = new Array();
var isQP = false;
var curDrwTimekeno = "";
var curSel = "kenoRow";
var totalPicked = "1;";
var maxPickedNum = "2";
var qpType = "noOfQp";
var _kenoPrice = 0;
var _kenodrawSelect;
function setDefaultkeno() {
	isQP = false;
	curDrwTimekeno = "";
	curSel = "kenoRow";
	maxPickedNum = "2";
	totalPicked = "2";
	qpType = "noOfQp";
	_kenoPrice = unitBetTypePirceArr["Direct2"].unitBetTypePirce;
}
function _kenoWinAppend() {
	if (!_kenoWin.match("Result Awaited")) {
		_kenoWin = "Result Awaited=\"\" Nxt" + _kenoWin;
	}
}
function _kenoLatestDrawTime() {
	return _kenoStatus.split("=")[1];
}
function _kenoFillWinTbl() {
	var _kenoWinHt = "<table width=\"100%\" border=\"0\" bordercolor=\"red\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\" bgcolor=\"#9cceff\"><tr><td colspan=\"2\" align=\"left\"><div valign=\"middle\" style=\"height:22px;background-color:#00639c;padding-top:3px;font-size:16px;font-family:Arial;font-weight:bold;color:#FFFFFF\">&nbsp;Win Result&nbsp;</div></td></tr>      <tr><td valign=\"top\" align=\"center\" height=\"100\">";
	var winArr = _kenoWin.split("Nxt");
	var _kenoWinHTML = "<table width=\"100%\" border=\"0\" bordercolor=\"red\" style=\"margin-top:3px\"><tr><td><div style=\"" + scrollColor("#9CCEFF", "#00639c", "184") + "\">";
	for (var i = 0; i <= winArr.length - 2; i++) {
		if (!winArr[i].match("Result")) {
			var time = new Date(parseInt(winArr[i].split("=")[0].replace(" ", "")));
			var newTime = week[time.getDay()] + " " + time.getDate() + " " + month[time.getMonth()] + "<br/>" + (time.getHours() < 10 ? "0" + time.getHours() : time.getHours()) + ":" + (time.getMinutes() < 10 ? "0" + time.getMinutes() : time.getMinutes()) + ":" + (time.getSeconds() < 10 ? "0" + time.getSeconds() : time.getSeconds());
			//alert(newTime);
			var htm = "<table width=\"90%\" border=\"0\" bordercolor=\"green\" id=\"result" + i + "\" cellspacing=\"2\" cellpadding=\"10\" class=\"keno_winningResult_table\" ><tr><td class=\"kenowinningResultTime\" colspan=\"8\" height=\"53\">" + newTime + "</td></tr><tr>";
			var num = (winArr[i].split("=")[1]).split(",");
			for (var j = 0; j < num.length; j++) {
				var temp = (num[j] < 10 ? "0" + num[j] : num[j]);
				htm = htm + "<td width=\"10%\" class=\"selected_win_keno_numbers\" align=\"center\">" + temp + "</td>";
			}
			htm = htm + "</tr></table>";
			_kenoWinHTML = _kenoWinHTML + htm;
		} else {
			var htm = "<table width=\"90%\" bordercolor=\"blue\" border=\"0\" cellspacing=\"2\" cellpadding=\"10\" id=\"result" + i + "\" class=\"keno_winningResult_table\" ><tr><td class=\"kenowinningResultTime\" colspan=\"8\" height=\"53\" >Result Awaited</td></tr><tr>";
			htm = htm + "<td class=\"selected_win_keno_numbers\"  colspan=\"8\"><div style=\"text-align:center\" id=\"winAwaitedDiv\" style=\"color:#00466E\"></div></td>";
			htm = htm + "</tr></table>";
			_kenoWinHTML = _kenoWinHTML + htm;
		}
	}
	_kenoWinHTML = _kenoWinHTML + "</div></td></tr></table>";
	return _kenoWinHt + _kenoWinHTML + "</td></tr></table>";
}
function _kenoFillNxtDrw() {
	var nxtDrwHTML = "<table width=\"100%\" cellspacing=\"0\"cellpadding=\"0\"  border=\"0\" bordercolor=\"red\"><tr><td colspan=\"2\" align=\"left\" valign=\"top\"><div valign=\"middle\" style=\"height:22px;width:180px;background-color:#00639c;padding-top:3px;font-size:16px;font-family:Arial;font-weight:bold;color:#FFFFFF\">&nbsp;Next Draw&nbsp;</div></td></tr><tr><td align=\"center\"valign=\"top\"><table width=\"100%\" bordercolor=\"red\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#9cceff\"><tr><td width=\"100%\" align=\"left\" valign=\"top\" ><div style=\"" + scrollColor("#9CCEFF", "#00639c", "175") + "\"><table width=\"90%\" align=\"left\" bordercolor=\"green\"  border=\"0\" cellspacing=\"0\" cellpadding=\"0\" class=\"borderbtmkeno\">";
	_kenodrawSelect = '<table width="auto" cellspacing="0"cellpadding="0"  border="1"><tr><td colspan="3" align="center"><b>Select Draws</td></tr>';
	var nxtDrwArr = _kenoDrawTime.split(",");
	for (var i = 0, l = nxtDrwArr.length; i < l; i++) {
		var time = new Date(parseInt(nxtDrwArr[i].replace(" ", "")));
		var newTime = week[time.getDay()] + " " + time.getDate() + " " + month[time.getMonth()] + " " + (time.getHours() < 10 ? "0" + time.getHours() : time.getHours()) + ":" + (time.getMinutes() < 10 ? "0" + time.getMinutes() : time.getMinutes());
		var hiddenTime = "<input type='text' id='timer" + i + "'>";
		var rowcolor;
		var data = "";
		if (i == 0) {
			data = time.getFullYear() + "-" + time.getMonth() + "-" + time.getDate() + "-" + (time.getHours() < 10 ? "0" + time.getHours() : time.getHours()) + "-" + (time.getMinutes() < 10 ? "0" + time.getMinutes() : time.getMinutes()) + "-" + (time.getSeconds() < 10 ? "0" + time.getSeconds() : time.getSeconds());
			var dateFuture1 = new Date(time.getFullYear(), time.getMonth(), time.getDate(), (time.getHours() < 10 ? "0" + time.getHours() : time.getHours()), (time.getMinutes() < 10 ? "0" + time.getMinutes() : time.getMinutes()), (time.getSeconds() < 10 ? "0" + time.getSeconds() : time.getSeconds()));
			_kenoNxtDrawTime = ("" + time).substring(0, ("" + time).lastIndexOf(":") + 3);
		}
		if (i % 2 == 0) {
			rowcolor = "#9CCEFF";
		} else {
			rowcolor = "#639CCE";
		}
		nxtDrwHTML = nxtDrwHTML + "<tr><td width=\"100%\"><input type=\"hidden\" value=\"" + data + "\" id=\"" + i + "timer\"></td></tr><tr bgcolor=\"" + rowcolor + "\" style=\"height: 20px\"><td width=\"100%\" align=\"center\" class=\"borderbtmkeno\" colspan=\"2\"><div id=\"" + i + "blink\" >" + newTime + "</div></td><td width=\"44%\" align=\"center\"><p><div id=\"nxtDrwD" + i + "\" style=\"display:none\"><img src=\"" + fortImgPath + "freezed.gif\"></div></p></td></tr>";
		drawName = _kenoDrawIdObj[parseInt(nxtDrwArr[i].replace(" ", ""))].split(',')[1];
		if(drawName == 'null'){
			drawName = 'DRAW';
		}
		_kenodrawSelect = _kenodrawSelect + '<tr><td align="right"><input type="checkbox" title="'+newTime+'" name="drawIdChkBox" value="'+drawName+'" id="'+ _kenoDrawIdObj[parseInt(nxtDrwArr[i].replace(" ", ""))].split(',')[0] +'_did"/></td><td width="30%" nowarp="nowrap">'+drawName+'</td><td align="center">'+newTime+'</td></tr>'
	
	}
	nxtDrwHTML = nxtDrwHTML + "</table></div></td></tr></table></td></tr></table>";
	_kenodrawSelect = _kenodrawSelect + '<tr><td colspan="3" align="right"><input class="button" id="selNonConsecButton" onclick="drawSelectButton()" type="button" value="Select"/></td></tr></table>'
	return nxtDrwHTML;
}
function _kenoUpData(win, drwTime, drwStatus) {
	_kenoWin = win;
	_kenoDrawTime = drwTime;
	_kenoStatus = drwStatus;
}
function _kenoWinAjx() {
	var url = "fetchWinKeno.action?frmDate=" + _kenoWinArr[_kenoWinArr.length - 1];
	_kenoWin = _kenoWin + (winAjaxReq(url)).data;
	_kenoFillWinTbl();
}
function kenoNmSel(lstNo) {
	var htm = "<div id=\"\"><table width=\"99%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#639cce\" style=\"margin-top:6px;margin-bottom:5px\"><tr>";
	for (var i = 1; i <= lstNo; i++) {
		if (i % 10 == 0) {
			htm = htm + "<td style=\"cursor:pointer;background:url(" + projectName + "/LMSImages/images/shade_white.gif) center no-repeat\" class=\"selected_keno_numbers\" onmouseout=\"kenoonmouseouteffect(this.id)\" onmouseover=\"kenoonmouseovereffect(this.id)\"  onclick=\"fillNumKeno(" + i + ")\"  id=\"" + i + "\" >" + (i < 10 ? "0" + i : i) + "</td></tr>";
		} else {
			htm = htm + "<td class=\"selected_keno_numbers\"  style=\"cursor:pointer;background:url(" + projectName + "/LMSImages/images/shade_white.gif) center no-repeat\" onmouseout=\"kenoonmouseouteffect(this.id)\" onmouseover=\"kenoonmouseovereffect(this.id)\" onclick=\"fillNumKeno(" + i + ")\"  id=\"" + i + "\"  >" + (i < 10 ? "0" + i : i) + "</td>";
		}
	}
	htm = htm + "</tr></table></div>";
	return htm;
}
function kenoonmouseovereffect(id) {
	var isAllPick = false;
	// check filled
	var elms = document.getElementsByName("selNumTxt");
	var countFill = 0;
	for (var l = 0; l < elms.length; l++) {
		if (elms[l].value != "") {
			countFill += 1;
		}
	}
	if (countFill == elms.length) {
		isAllPick = true;
	}
	if (!isQP && !isAllPick) {
		if (_id.o(id).className != "selected_keno_numbersSelect") {
			_id.o(id).style.background = "url(" + projectName + "/LMSImages/images/shade_over.gif) left center no-repeat";
			_id.o(id).style.color = "#FFFFFF";
			_id.o(id).className = "selected_keno_numbersSelectOMO";
		}
	}
}
function kenoonmouseouteffect(id) {
	if (_id.o(id).className == "selected_keno_numbersSelectOMO") {
		_id.o(id).style.background = "url(" + projectName + "/LMSImages/images/shade_white.gif) left center no-repeat";
		_id.o(id).style.color = "#00639c";
		_id.o(id).className = "selected_keno_numbers";
	} else {
		if (_id.o(id).className == "selected_keno_numbersSelect") {
			_id.o(id).style.background = "url(" + projectName + "/LMSImages/images/shade_over.gif) left center no-repeat";
			_id.o(id).style.color = "#FFFFFF";
		} else {
			if (_id.o(id).className == "selected_keno_numbers") {
				_id.o(id).style.background = "url(" + projectName + "/LMSImages/images/shade_white.gif) left center no-repeat";
				_id.o(id).style.color = "#00639c";
			}
		}
	}
}
function fillNumKeno(val) {
	var length = 0;
	if (!isQP) {
		var clrChg = true;
		var obj = _id.o(curSel);
		var elms = document.getElementsByName("selNumTxt");
		if (_id.o(val).className == "selected_keno_numbersSelect") {
			for (var l = 0; l < elms.length; l++) {
				if (elms[l].value == val) {
					elms[l].value = "";
					break;
				}
			}
		} else {
			elms = obj.getElementsByTagName("input");
			for (var l = 0; l < elms.length; l++) {
				if (elms[l].value == "") {
					elms[l].value = (val < 10 ? "0" + val : val);
					break;
				}
			}
			for (var l = 0; l < length; l++) {
				if (elms[l].value == "") {
					break;
				}
			}
		}
		kenoapplyCSS();
		_kenoCalAmt();
	}
}
function kenoRow(playType) {
	var htm = "<table width=\"95%\" border=\"0\" cellspacing=\"4\" cellpadding=\"0\">";
	var className = "selected_keno";
	if (playType.toLowerCase() == "direct") {
		htm = htm + "<tr style='display:none'><td class=\"kenotxtStyle\" align=\"left\"><input type=\"radio\" name=\"kenoRadio\" id=\"kenoRadio\" onclick=\"fillSelKeno('kenoRow')\" checked='true'/>Number Picked:</td><td><input type=\"text\" class=\"kenotextbox\" name=\"noPicked\" id=\"noOfQp\" value=\"0\" maxlength=\"2\" readOnly=\"true\" onkeyup=\"return fillNoOfQp(this, undefined, event)\" onkeydown=\"return fillNoOfQp(this, undefined, event)\" onblur=\"_kenoCalAmt()\"/></td></tr>";
		htm = htm + "<tr><td colspan='2'><table width=\"95%\" id='kenoRow' border=\"0\" cellspacing=\"4\" cellpadding=\"0\"><tr id=\"row" + i + "\">";
		for (var j = 0; j < parseInt(maxPickedNum); j++) {
			htm = htm + "<td><input type=\"text\" name='selNumTxt' class=\"" + className + "\" maxlength=\"2\"  onkeydown=\"return keyPressKeno(this,event)\" onkeyup=\"return keyPressKeno(this,event)\"  onblur=\"blurFnKeno(this)\" onmousedown=\"return disClick(this)\"></td>";
		}
		htm = htm + "</tr></table></tr></td>";
	} else {
		if (playType.toLowerCase() == "perm") {
			htm = htm + "<tr><td class=\"kenotxtStyle\" align=\"left\"><input type=\"radio\" name=\"kenoRadio\" id=\"kenoRadio\" onclick=\"fillSelKeno('kenoRow')\" checked='true'/>Number Picked:</td><td><input type=\"text\" class=\"kenotextbox\" name=\"noPicked\" id=\"noOfQp\" value=\"0\" maxlength=\"2\" readOnly=\"true\" onkeyup=\"return fillNoOfQp(this, undefined, event)\" onkeydown=\"return fillNoOfQp(this, undefined, event)\" onblur=\"_kenoCalAmt()\"/></td></tr>";
			htm = htm + "<tr><td colspan='2'><table width=\"95%\" id='kenoRow' border=\"0\" cellspacing=\"4\" cellpadding=\"0\">";
			for (var i = 1; i < 5; i++) {
				htm = htm + "<tr id=\"row" + i + "\">";
				for (var j = 0; j < 5; j++) {
					htm = htm + "<td><input type=\"text\" name='selNumTxt' class=\"" + className + "\" maxlength=\"2\"   onkeydown=\"return keyPressKeno(this,event)\" onkeyup=\"return keyPressKeno(this,event)\"  onblur=\"blurFnKeno(this)\" onmousedown=\"return disClick(this)\"></td>";
				}
				htm = htm + "</tr>";
			}
			htm = htm + "</table></tr></td>";
		} else {
			if (playType.toLowerCase() == "banker") {
				htm = htm + "<tr onclick=\"fillSelKeno('kenoRowUL')\"><td class=\"kenotxtStyle\"><input type=\"radio\" name=\"kenoRadio\" id=\"kenoRadioUL\" onclick=\"fillSelKeno('kenoRowUL')\" checked='true'/>Upper Line</td><td>QP</td><td><input type=\"text\" class=\"kenotextbox\" name=\"noPicked\" id=\"noOfQpUL\" value=\"0\" maxlength=\"2\" readOnly=\"true\" onkeyup=\"return fillNoOfQp(this,'UL', event)\" onkeydown=\"return fillNoOfQp(this,'UL',event)\" onblur=\"_kenoCalAmt()\"/></td></tr>";
				htm = htm + "<tr onclick=\"fillSelKeno('kenoRowUL')\"><td colspan='3'><table width=\"95%\" id='kenoRowUL' border=\"0\" cellspacing=\"4\" cellpadding=\"0\"><tr id=\"row" + i + "\">";
				for (var j = 0; j < 4; j++) {
					htm = htm + "<td><input type=\"text\" name='selNumTxt' class=\"" + className + "\" maxlength=\"2\"   onkeydown=\"return keyPressKeno(this,event)\" onkeyup=\"return keyPressKeno(this,event)\"  onblur=\"blurFnKeno(this)\" onmousedown=\"return disClick(this)\"></td>";
				}
				htm = htm + "</tr></table></td></tr>";
				htm = htm + "<tr onclick=\"fillSelKeno('kenoRowBL')\"><td class=\"kenotxtStyle\"><input type=\"radio\" name=\"kenoRadio\" id=\"kenoRadioBL\" onclick=\"fillSelKeno('kenoRowBL')\"/>Below Line</td><td>QP</td><td><input type=\"text\" class=\"kenotextbox\" name=\"noPicked\" id=\"noOfQpBL\" value=\"0\" maxlength=\"2\" readOnly=\"true\" onkeyup=\"return fillNoOfQp(this,'BL',event)\" onkeydown=\"return fillNoOfQp(this,'BL',event)\" onblur=\"_kenoCalAmt()\"/></td></tr>";
				htm = htm + "<tr onclick=\"fillSelKeno('kenoRowBL')\"><td colspan='3'><table width=\"95%\" id='kenoRowBL' border=\"0\" cellspacing=\"4\" cellpadding=\"0\">";
				for (var i = 1; i < 5; i++) {
					htm = htm + "<tr id=\"row" + i + "\">";
					for (var j = 0; j < 5; j++) {
						htm = htm + "<td><input type=\"text\" name='selNumTxt' class=\"" + className + "\" maxlength=\"2\"   onkeydown=\"return keyPressKeno(this,event)\" onkeyup=\"return keyPressKeno(this,event)\"  onblur=\"blurFnKeno(this)\" onmousedown=\"return disClick(this)\"></td>";
					}
					htm = htm + "</tr>";
				}
				htm = htm + "</table></td></tr>";
			} else {
				if (playType.toLowerCase() == "banker1againstall") {
					htm = htm + "<tr style='display:none'><td class=\"kenotxtStyle\" align=\"left\"><input type=\"radio\" name=\"kenoRadio\" id=\"kenoRadio\" onclick=\"fillSelKeno('kenoRow')\" checked='true'/>Number Picked:</td><td><input type=\"text\" class=\"kenotextbox\" name=\"noPicked\" id=\"noOfQp\" value=\"0\" maxlength=\"2\" readOnly=\"true\" onkeyup=\"return fillNoOfQp(this, undefined, event)\" onkeydown=\"return fillNoOfQp(this, undefined, event)\" onblur=\"_kenoCalAmt()\"/></td></tr>";
					htm = htm + "<tr><td><table width=\"95%\" id='kenoRow' border=\"0\" cellspacing=\"4\" cellpadding=\"0\">";
					htm = htm + "<tr id=\"row" + i + "\"><td><input type=\"text\" name='selNumTxt' class=\"" + className + "\" maxlength=\"2\"   onkeydown=\"return keyPressKeno(this,event)\" onkeyup=\"return keyPressKeno(this,event)\"  onblur=\"blurFnKeno(this)\" onmousedown=\"return disClick(this)\"></td></tr></table></tr></td>";
				}
			}
		}
	}
	return htm + "</table>";
}
function fillSelKeno(val) {
	curSel = val;
	var temp = val.substring(val.length - 2, val.length);
	if (temp == "UL") {
		_id.o("kenoRadioUL").checked = true;
		qpType = "noOfQp" + temp;
		maxPickedNum = "4";
	} else {
		if (temp == "BL") {
			_id.o("kenoRadioBL").checked = true;
			qpType = "noOfQp" + temp;
			maxPickedNum = "20";
		} else {
			_id.o("kenoRadio").checked = true;
			qpType = "noOfQp";
		}
	}
	if (isQP) {
		_id.o(qpType).focus();
	}
	kenoapplyCSS();
}
function blurFnKeno(obj) {
	if (isNaN(obj.value) || obj.value <= 0 || obj.value > 90) {
		obj.value = "";
	} else {
		if (obj.value.length == 1) {
			obj.value = "0" + obj.value;
		}
	}
	kenoapplyCSS();
	_kenoCalAmt();
}
function kenoclearAllBoxes() {
	_id.o("noOfDraws").value = 1;
	playType = _id.o("playType").value;
	if (playType.substring(0, playType.length - 1) == "Direct" || playType.substring(0, playType.length - 1) == "Perm" || playType == "Banker1AgainstAll") {
		_id.resetInpTypes("kenoRow", "selected_keno", false);
		_id.o("noOfQp").value = 0;
		_id.o("noOfQp").readOnly = true;
	} else {
		if (playType == "Banker") {
			_id.resetInpTypes("kenoRowUL", "selected_keno", false);
			_id.resetInpTypes("kenoRowBL", "selected_keno", false);
			_id.o("noOfQpUL").value = 0;
			_id.o("noOfQpBL").value = 0;
			_id.o("noOfQpUL").readOnly = true;
			_id.o("noOfQpBL").readOnly = true;
		}
	}
	for (var i = 1; i <= 90; i++) {
		_id.o(i).className = "selected_keno_numbers";
		_id.o(i).style.background = "url(" + projectName + "/LMSImages/images/shade_white.gif) left center no-repeat";
		_id.o(i).style.color = "#00639c";
	}
	isQP = false;
	_id.o("betAmount").value = parseInt(_kenoPrice, 10);
	_id.o("qpVal").value = "2";
	_id.o("totAmtLto").value = 0;
	_id.o("noOfLines").value = 0;
	_id.o("noOfDraws").value = 1;
	_id.o("qpChkAll").checked = false;
	
	//for manual selection of draws: Set Default Values again
	document.getElementsByName('conOrNonCon')[0].click();
}
function kenoChkQP(id) {
	var elms = document.getElementsByName("selNumTxt");
	var playType = _id.o("playType").value;
	if (_id.o(id).checked == true) {
		isQP = true;
		_id.o("qpVal").value = "1";
		for (var l = 0; l < elms.length; l++) {
			elms[l].value = "";
			elms[l].disabled = true;
		}
		if (playType.substring(0, playType.length - 1) == "Direct") {
			_id.o(qpType).value = playType.substring(playType.length - 1);
			_id.o("noOfLines").value = "1";
			_kenoCalAmt();
		} else {
			if (playType == "Perm2" || playType == "Perm3") {
				_id.o(qpType).value = "";
				_id.o(qpType).readOnly = false;
				_id.o(qpType).focus();
				_id.o("noOfLines").value = "0";
				_id.o("totAmtLto").value = "0";
			} else {
				if (playType == "Banker") {
					var temp = (curSel.substring(curSel.length - 2) == "BL") ? "UL" : "BL";
					_id.o("noOfQp" + temp).value = "";
					_id.o("noOfQp" + temp).readOnly = false;
					_id.o(qpType).value = "";
					_id.o(qpType).readOnly = false;
					_id.o(qpType).focus();
					_id.o("noOfLines").value = "0";
					_id.o("totAmtLto").value = "0";
				} else {
					if (playType == "Banker1AgainstAll") {
						_id.o(qpType).value = "1";
						_id.o("noOfLines").value = "89";
						_kenoCalAmt();
					}
				}
			}
		}
	} else {
		isQP = false;
		_id.o("qpVal").value = "2";
		for (var l = 0; l < elms.length; l++) {
			elms[l].value = "";
			elms[l].disabled = false;
		}
		if (playType == "Banker") {
			var temp = (curSel.substring(curSel.length - 2) == "BL") ? "UL" : "BL";
			_id.o("noOfQp" + temp).value = 0;
			_id.o("noOfQp" + temp).readOnly = true;
		}
		_id.o(qpType).value = 0;
		_id.o("noOfLines").value = 0;
		_id.o("totAmtLto").value = 0;
		_id.o(qpType).readOnly = true;
	}
	kenoapplyCSS();
}
function _kenoCalAmt() {
	//var noOfDrw = _id.v("noOfDraws");
	var noOfDrw = 0;
	if(_id.n('conOrNonCon')[0]!= undefined && _id.n('conOrNonCon')[0].checked){
		noOfDrw = _id.n("noOfDraws")[0].value;
	}else if(_id.n('conOrNonCon')[1]!= undefined && _id.n('conOrNonCon')[1].checked){
		noOfDrw = _kenoDrawIdArr.length;
	}
	
	fetchLines();
	var amt = _id.v("totAmtLto");
	if (isNaN(amt)) {
		amt = 0;
	}
	_id.o("totAmtLto").value = noOfDrw * amt;
}
function fillNoOfQp(obj, val, e) {
	var keyCode = (window.event) ? event.keyCode : e.which;
	if ((keyCode >= 48 && keyCode < 58) || keyCode == 45 || keyCode == 27 || keyCode == 13 || keyCode == 40 || keyCode == 38 || keyCode == 46 || keyCode == 8 || (keyCode >= 96 && keyCode < 106 || keyCode == 9)) {
		if (keyCode == 46 || keyCode == 8 || keyCode == 9) {
			if (typeof val != "undefined" && keyCode == 9) {
				fillSelKeno("kenoRow" + val);
			}
			_kenoCalAmt();
			return true;
		}
		if (obj.value.length >= 1) {
			if (obj.value == 0 || obj.value > parseInt(maxPickedNum) || isNaN(obj.value)) {
				obj.value = "";
				obj.focus();
			}
		}
	} else {
		return false;
	}
	_kenoCalAmt();
	return true;
}
function keyPressKeno(obj,e) {
	var keyCode = (window.event) ? event.keyCode : e.which;
	if ((keyCode >= 48 && keyCode < 58) || keyCode == 45 || keyCode == 27 || keyCode == 13 || keyCode == 40 || keyCode == 38 || keyCode == 46 || keyCode == 8 || (keyCode >= 96 && keyCode < 106 || keyCode == 9)) {
		if (keyCode == 46 || keyCode == 8 || keyCode == 9) {
			return true;
		}
		if (obj.value.length > 1) {
			if (obj.value == 0 || obj.value > 90 || isNaN(obj.value)) {
				obj.value = "";
				obj.focus();
			} else {
				var objR = _id.o(curSel);
				var clrChg = true;
				var elms = objR.getElementsByTagName("input");
				for (var l = 0; l < elms.length; l++) {
					clrChg = true;
					if ((elms[l].value == obj.value) && (elms[l] != obj)) {
						obj.value = "";
						obj.focus();
						clrChg = false;
						break;
					}
				}
				if (clrChg) {
					for (var l = 0; l < elms.length; l++) {
						if (elms[l].value == "") {
							if (elms[l].disabled == false) {
								elms[l].focus();
							}
							break;
						}
					}
				}
			}
			kenoapplyCSS();
		}
	} else {
		return false;
	}
	return true;
}
function kenoapplyCSS() {
	for (var i = 1; i <= 90; i++) {
		_id.o(i).className = "selected_keno_numbers";
		_id.o(i).style.background = "url(" + projectName + "/LMSImages/images/shade_white.gif) left center no-repeat";
		_id.o(i).style.color = "#00639c";
	}
	var clrChg = true;
	var elms = document.getElementsByName("selNumTxt");
	for (var l = 0; l < elms.length; l++) {
		for (var j = 0; j < elms.length; j++) {
			if ((elms[l].value == elms[j].value) && (elms[l] != elms[j])) {
				elms[j].value = "";
			}
		}
	}
	var count = 0;
	for (var l = 0; l < elms.length; l++) {
		if (elms[l].value != "") {
			_id.o(parseInt(elms[l].value, 10)).className = "selected_keno_numbersSelect";
			_id.o(parseInt(elms[l].value, 10)).style.background = "url(" + projectName + "/LMSImages/images/shade_over.gif) left center no-repeat";
			_id.o(parseInt(elms[l].value, 10)).style.color = "#FFFFFF";
			count += 1;
		}
	}
	if (!isQP) {
		_id.o(qpType).value = count;
	}
	if (_id.o("playType").value == "Banker") {
		elms = _id.o("kenoRowUL").getElementsByTagName("input");
		var countUL = 0;
		for (var l = 0; l < elms.length; l++) {
			if (elms[l].value != "") {
				countUL += 1;
			}
		}
		if (countUL == 4 && curSel == "kenoRowUL") {
			fillSelKeno("kenoRowBL");
		}
		elms = _id.o("kenoRowBL").getElementsByTagName("input");
		var countBL = 0;
		for (var l = 0; l < elms.length; l++) {
			if (elms[l].value != "") {
				countBL += 1;
			}
		}
		if (countBL == 20 && countUL != 4 && curSel == "kenoRowBL") {
			fillSelKeno("kenoRowUL");
		}
		if (!isQP) {
			_id.o("noOfQpUL").value = countUL;
			_id.o("noOfQpBL").value = countBL;
		}
		count = countUL + countBL;
	}
	if ((count == totalPicked) || isQP) {
		for (var l = 1; l <= 90; l++) {
			if (_id.o(l).className != "selected_keno_numbersSelect") {
				_id.o(l).className = "selected_keno_numbersDisabled";
				_id.o(l).style.background = "url(" + projectName + "/LMSImages/images/shade_disable.gif) left center no-repeat";
			}
		}
	}
}
function buyTicketkeno(id) {
	var compData = "";
	var playType = _id.o("playType").value;
	if (_id.o("qpChkAll").checked == false) {
		var inputData = new Array();
		if (playType.substring(0, playType.length - 1) == "Direct" || playType.substring(0, playType.length - 1) == "Perm" || playType == "Banker1AgainstAll") {
			var obj = _id.o("kenoRow");
			var elms = obj.getElementsByTagName("input");
			var count = 0;
			for (var l = 0; l < elms.length; l++) {
				if (elms[l].value != "") {
					inputData[count++] = elms[l].value;
				}
			}
			//alert(inputData+"*******"+inputData.length+ "*******"+ maxPickedNum);
			if (inputData.length < maxPickedNum && playType.substring(0, playType.length - 1) != "Perm") {
				alert("Please Pick " + maxPickedNum + " Numbers");
				return false;
			} else {
				if (playType == "Perm2" && (inputData.length == 0 || inputData.length < 3)) {
					alert("Please Pick Minimum 3 Numbers");
					return false;
				} else {
					if (playType == "Perm3" && (inputData.length == 0 || inputData.length < 4)) {
						alert("Please Pick Minimum 4 Numbers");
						return false;
					}
				}
			}
		} else {
			if (playType == "Banker") {
				var obj = _id.o("kenoRowUL");
				var elms = obj.getElementsByTagName("input");
				var count = 0;
				var checkUL = false, checkBL = false;
				for (var l = 0; l < elms.length; l++) {
					if (elms[l].value != "") {
						inputData[count++] = elms[l].value;
						checkUL = true;
					}
				}
				inputData[count++] = "UL";
				obj = _id.o("kenoRowBL");
				elms = obj.getElementsByTagName("input");
				for (var l = 0; l < elms.length; l++) {
					if (elms[l].value != "") {
						inputData[count++] = elms[l].value;
						checkBL = true;
					}
				}
				inputData[count++] = "BL";
				if (!checkUL) {
					alert("Please fill incomplete entries in Upper Lines");
					return false;
				} else {
					if (!checkBL) {
						alert("Please fill incomplete entries in Below Lines");
						return false;
					}
				}
			}
		}
		compData = compData + inputData.toString();
	} else {
		compData = "QP";
		var qpCheck = false;
		if (playType.substring(0, playType.length - 1) == "Direct" || playType.substring(0, playType.length - 1) == "Perm" || playType == "Banker1AgainstAll") {
			var qpVal = _id.o(qpType).value;
			if (qpVal == 0 || qpVal == "") {
				alert("Please fill incomplete entries");
				qpCheck = true;
			} else {
				if (playType == "Perm2" && qpVal < 3) {
					alert("Please Pick Minimum 3 Numbers");
					qpCheck = true;
				} else {
					if (playType == "Perm3" && qpVal < 4) {
						alert("Please Pick Minimum 4 Numbers");
						qpCheck = true;
					}
				}
				if (qpVal > 20 && (playType == "Perm2" || playType == "Perm3")) {
					alert("Please Pick Maximum 20 Numbers");
					qpCheck = true;
				}
			}
		} else {
			if (playType == "Banker") {
				var qpValUL = _id.o("noOfQpUL").value;
				var qpValBL = _id.o("noOfQpBL").value;
				if (qpValUL == 0 || qpValUL == "") {
					alert("Please fill incomplete entries in Upper Lines");
					qpCheck = true;
				} else {
					if (qpValBL == 0 || qpValBL == "") {
						alert("Please fill incomplete entries in Below Lines");
						qpCheck = true;
					}
				}
				if (qpValUL > 4 || qpValBL > 20) {
					alert("Please Pick Maximum 4 Numbers in Upper Line and 20 numbers in Below Line");
					qpCheck = true;
				}
			}
		}
		//alert(qpCheck);
		if (qpCheck) {
			return false;
		}
	}
	var amount = _id.o("totAmtLto").value;
	var betAmt = _id.o("betAmount").value;
	/*if (playType.substring(0, playType.length - 1) != "Direct") {
		betAmt = betAmt / 5;
	} else {
		betAmt = betAmt / 10;
	}*/
	
	betAmt=Math.round(betAmt/unitBetTypePirceArr[playType].unitBetTypePirce);
	//alert('betAmt'+betAmt);
	//alert(compData + "  bhbhb   " + _id.o("noOfLines").value);
	_id.o(id).disabled = true;
	if (playType.substring(0, playType.length - 1) == "Direct" || playType.substring(0, playType.length - 1) == "Perm" || playType == "Banker1AgainstAll") {
		if(_id.n('conOrNonCon')[1]!= undefined && _id.n('conOrNonCon')[1].checked){
			var html = '';
			for(i=0; i<_kenoDrawIdArr.length;i++){
				html += '&drawIdArr='+_kenoDrawIdArr[i];
			}
			html+='&isAdvancedPlay=1';
			gameBuyAjaxReq("kenoBuy.action?pickedNumbers=" + compData + "&noOfDraws=" + _id.n("noOfDraws")[0].value + "&totalPurchaseAmt=" + amount + "&noPicked=" + _id.o("noOfQp").value + "&playType=" + playType + "&QP=" + _id.o("qpVal").value + "&betAmt=" + betAmt + "&noOfLines=" + _id.o("noOfLines").value + html);
		}else{
			gameBuyAjaxReq("kenoBuy.action?pickedNumbers=" + compData + "&noOfDraws=" + _id.n("noOfDraws")[0].value + "&totalPurchaseAmt=" + amount + "&noPicked=" + _id.o("noOfQp").value + "&playType=" + playType + "&QP=" + _id.o("qpVal").value + "&betAmt=" + betAmt + "&noOfLines=" + _id.o("noOfLines").value);
						
		}
		} else {
		if (playType == "Banker") {
			if(_id.n('conOrNonCon')[1]!= undefined && _id.n('conOrNonCon')[1].checked){
				var html = '';
				for(i=0; i<_kenoDrawIdArr.length;i++){
					html += '&drawIdArr='+_kenoDrawIdArr[i];
				}
				html+='&isAdvancedPlay=1';
				gameBuyAjaxReq("kenoBuy.action?pickedNumbers=" + compData + "&noOfDraws=" + _id.o("noOfDraws").value + "&totalPurchaseAmt=" + amount + "&noPicked=" + _id.o("noOfQpUL").value + "&noPicked=" + _id.o("noOfQpBL").value + "&playType=" + playType + "&QP=" + _id.o("qpVal").value + "&betAmt=" + betAmt + "&noOfLines=" + _id.o("noOfLines").value + html);
			}else{				
				gameBuyAjaxReq("kenoBuy.action?pickedNumbers=" + compData + "&noOfDraws=" + _id.o("noOfDraws").value + "&totalPurchaseAmt=" + amount + "&noPicked=" + _id.o("noOfQpUL").value + "&noPicked=" + _id.o("noOfQpBL").value + "&playType=" + playType + "&QP=" + _id.o("qpVal").value + "&betAmt=" + betAmt + "&noOfLines=" + _id.o("noOfLines").value);
										
			}			
			
		}
	}
	kenoclearAllBoxes();
	return true;
}
var lines = 0;
function fetchLines() {
	var playType = _id.o("playType").value;
	lines = 0;
	if (playType.substring(0, playType.length - 1) == "Direct") {
		lines = 1;
	} else {
		if (playType == "Perm2") {
			var num = _id.o("noOfQp").value;//alert("******"+isNaN(num)+"******");
			if (isNaN(num) || num == "") {
				_id.o(qpType).value = "";
			} else {
				if (num != 0 && num != 1 && num != 2) {
					lines = num * (num - 1) / 2;
				} else {
					lines = 1;
				}
			}
		} else {
			if (playType == "Perm3") {
				var num = _id.o("noOfQp").value;
				if (isNaN(num) || num == "") {
					_id.o(qpType).value = "";
				} else {
					if (num != 0 && num != 1 && num != 2 && num != 3) {
						lines = num * (num - 1) * (num - 2) / 6;
					} else {
						lines = 1;
					}
				}
			} else {
				if (playType == "Banker") {
					var numUL = isNaN(_id.o("noOfQpUL").value) ? 0 : _id.o("noOfQpUL").value;
					var numBL = isNaN(_id.o("noOfQpBL").value) ? 0 : _id.o("noOfQpBL").value;
					lines = parseInt(numUL, 10) * parseInt(numBL, 10);
				} else {
					if (playType == "Banker1AgainstAll") {
						lines = 89;
					}
				}
			}
		}
	}
	//alert("******"+lines+"*********");
	if (isNaN(lines)) {
		lines = 0;
	}
	_id.o("noOfLines").value = lines;
	_id.o("totAmtLto").value = lines * _id.o("betAmount").value;
}
function chkPickType(id) {
	var playType = _id.o(id).value;
	_id.o("playType").value = playType;
	_kenoPrice = unitBetTypePirceArr[playType].unitBetTypePirce;
	_id.o("kenoPrice").innerHTML =currSymbol + " "+ _kenoPrice + "/-";
	
	_id.o("betAmount").value = parseInt(_kenoPrice, 10);
	if (playType.substring(0, playType.length - 1) == "Direct") {
		maxPickedNum = playType.substring(playType.length - 1);
		totalPicked = maxPickedNum;
		_id.o("kenoRowDiv").innerHTML = kenoRow(playType.substring(0, playType.length - 1));
		curSel = "kenoRow";
		qpType = "noOfQp";
	} else {
		if (playType == "Perm2" || playType == "Perm3") {
			maxPickedNum = "20";
			totalPicked = maxPickedNum;
			curSel = "kenoRow";
			_id.o("kenoRowDiv").innerHTML = kenoRow(playType.substring(0, playType.length - 1));
			qpType = "noOfQp";
		} else {
			if (playType == "Banker") {
				maxPickedNum = "4";
				totalPicked = "24";
				curSel = "kenoRowUL";
				_id.o("kenoRowDiv").innerHTML = kenoRow(playType);
				qpType = "noOfQpUL";
				_id.o("noOfQpBL").value = 0;
			} else {
				if (playType == "Banker1AgainstAll") {
					maxPickedNum = "1";
					totalPicked = maxPickedNum;
					curSel = "kenoRow";
					_id.o("kenoRowDiv").innerHTML = kenoRow(playType);
					qpType = "noOfQp";
				}
			}
		}
	}
	kenoclearAllBoxes();
	_id.o("totAmtLto").value = 0;
	_id.o(qpType).value = 0;
	_id.o("noOfLines").value = 0;
}
function betAmountMultiple(ele, func) {
	var num = _id.v(ele);
	var playType = _id.o("playType").value;
	if (func == "plus") {
		_id.o(ele).value = Math.round((num < 1000) ?(parseInt(num == _kenoPrice ? _kenoPrice : num, 10) + parseInt(_kenoPrice)):num);
		
	} else {
		_id.o(ele).value = Math.round((num > parseInt(_kenoPrice)) ?(parseInt(num == _kenoPrice ? _kenoPrice : num, 10) - parseInt(_kenoPrice)) : num);
	}
	_kenoCalAmt();
}
//alert(gameDispName["keno"]._kenoPrice);
var unitBetPrice = gameDispName["keno"].unitPrice.split(",");
var unitBetTypePirceArr = new Object();
function betTypePrice(value) {
	this.unitBetTypePirce = value;
}
function getPlayTypeUnitPrice() {
	for (var i = 0; i < unitBetPrice.length; i++) {
		var pickTypeOptVal = unitBetPrice[i].replace(" ", "").split("=");
		unitBetTypePirceArr[pickTypeOptVal[0]] = new betTypePrice(pickTypeOptVal[1]);
	//alert("*******"+unitBetTypePirceArr[pickTypeOptVal[0]].unitBetTypePirce+"****"+pickTypeOptVal[0]+"***");
	}
}
getPlayTypeUnitPrice();
_kenoPrice = unitBetTypePirceArr["Direct2"].unitBetTypePirce;

function newMultiKenoBuy(){
gameBuyAjaxReq("kenoBuy.action?noOfPanel=10&pickedNumbers=04Nxt05&noOfDraws=2&totalPurchaseAmt=10&noPicked=1Nxt1&playType=Direct1NxtDirect1&QP=2Nxt2&betAmt=1Nxt1&noOfLines=1"
);
}

//var line = "<tr><td bgcolor=\"#00639c\"><table border=\"0\" bordercolor=\"blue\" width=\"97%\"> <tr ><td align=\"left\" width=\"25%\"> <input type=\"hidden\" value=\"0\" id=\"counterId\"> <input type=\"hidden\" id=\"dateFuture\"> <input type=\"hidden\" id=\"freezeTimeId\" value=\"" + _kenofreezeTime + "\"> <span class=\"style1\">Next Draw :</span><div id=\"latestDrawTime\" style=\"display:none\"></div></td><td width=\"20%\" align=\"left\"><div id=\"nxtDrawTime\" class=\"kenostyle2\"></div></td><td align=\"right\" width=\"25%\"><div id=\"timeLeft\"> <span class=\"style1\"> Time Left :</div></span></td> <td align=\"left\" width=\"15%\"><div id=\"curDrwTime\" class=\"kenostyle2\"></div> </td><td rowspan=\"2\" width=\"10%\"><img src=\"" + fortImgPath + "que.gif\" style=\"cursor:hand\" onClick=\"gameInfo()\" alt=\"Game Info\" /> </td></tr> <tr bgcolor=\"#00639c\"> <td align=\"left\"> <span class=\"style1\">No. of Draws :</span> </td> <td >         <table><tr><td> <input type=\"radio\"/ name=\"conOrNonCon\" value=\"consec\" checked='true' onclick=\"drawSelectButton(this)\"'/></td>  <td > <select\tname=\"noOfDraws\" id=\"noOfDraws\"\tclass=\"fortune_option\" align=\"left\"\twidth=\"20%\"\tonchange=\"_kenoCalAmt()\">" + getActiveDrawOptionList("keno") + "</select> </td></tr></table>        </td><td>     <table><tr><td><input type=\"radio\"/ name=\"conOrNonCon\" value=\"nonconsec\" onclick=\"specificDrawPopUp()\" /></td><td class=\"style1\">Advance Draw</td></tr></table>     </td><td colspan=\"1\" align=\"left\" valign=\"top\"> &nbsp; </td><td align=\"left\"> <span class=\"kenonum\" id='kenoPrice'>"+currSymbol+" " + parseInt(_kenoPrice, 10) + "/-</span></td></tr><tr><td><table><tr><td align=\"right\" height=\"0px\" width=\"0px\" id=\"drawSelectorDiv\" style=\"visibility:hidden;position:absolute;background-color:#FFFFFF\"></td></tr></table></td></tr>  </table></td></tr>";

var line = "<tr><td bgcolor=\"#00639c\"><table border=\"0\" bordercolor=\"blue\" width=\"97%\"> <tr ><td align=\"left\" width=\"25%\"> <input type=\"hidden\" value=\"0\" id=\"counterId\"> <input type=\"hidden\" id=\"dateFuture\"> <input type=\"hidden\" id=\"freezeTimeId\" value=\"" + _kenofreezeTime + "\"> <span class=\"style1\">Next Draw :</span><div id=\"latestDrawTime\" style=\"display:none\"></div></td><td width=\"20%\" align=\"left\"><div id=\"nxtDrawTime\" class=\"kenostyle2\"></div></td><td align=\"right\" width=\"25%\"><div id=\"timeLeft\"> <span class=\"style1\"> Time Left :</div></span></td> <td align=\"left\" width=\"15%\"><div id=\"curDrwTime\" class=\"kenostyle2\"></div> </td>"+/*<td rowspan=\"2\" width=\"10%\"><img src=\"" + fortImgPath + "que.gif\" style=\"cursor:hand\" onClick=\"gameInfo()\" alt=\"Game Info\" /> </td>*/"</tr> <tr bgcolor=\"#00639c\"> <td align=\"left\"> <span class=\"style1\">No. of Draws :</span> </td> <td >         <table><tr><td> <input type=\"radio\"/ name=\"conOrNonCon\" value=\"consec\" checked='true' onclick=\"drawSelectButton(this)\"'/></td><td> <select\tname=\"noOfDraws\" id=\"noOfDraws\"\tclass=\"fortune_option\" align=\"left\"\twidth=\"20%\"\tonchange=\"_kenoCalAmt()\">" + getActiveDrawOptionList("keno") + "</select> </td></tr></table>        </td><td>     <table><tr><td><input type=\"radio\"/ name=\"conOrNonCon\" value=\"nonconsec\" onclick=\"specificDrawPopUp(_kenodrawSelect)\" /></td><td class=\"style1\">Advance Draw</td></tr></table>     </td><td colspan=\"1\" align=\"left\" valign=\"top\"> &nbsp; </td><td align=\"left\"> <span class=\"kenonum\" id='kenoPrice'>"+currSymbol+" " + parseInt(_kenoPrice, 10) + "/-</span></td></tr><tr><td><table><tr><td align=\"right\" height=\"0px\" width=\"0px\" id=\"drawSelectorDiv\" style=\"visibility:hidden;position:absolute;background-color:#FFFFFF\"></td></tr></table></td></tr>  </table></td></tr>";

var _kenoNxtDrwTbl = _kenoFillNxtDrw();
var _kenoHtmlTbl = "<table width=\"100%\"height=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" bordercolor=\"red\" bgcolor=\"#9cceff\">" + line + "<tr><td align=\"center\" valign=\"top\"><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td width=\"65%\" valign=\"top\" ><div style=\"padding-top:10px;\"><table border=\"0\" bordercolor=\"red\" width=\"97%\" align=\"center\"cellpadding=\"0\"cellspacing=\"0\"><tr><td class=\"style10\" align=\"left\"><div align=\"center\" valign=\"middle\" style=\"height:18px;background-color:#00639c;width:180px;float:left;padding-top:2px\">&nbsp;Select Number Panel&nbsp;</div></td></tr><tr><td valign=\"middle\" style=\"border:1px #00639c solid;background-color:#639cce\">" + kenoNmSel(90) + "</td></tr><tr><td><div id=\"selectedDrawList\">No Draws Selected. Please Select at least one draw!</div></td></tr></table></div></td><td valign=\"top\" wdith=\"35%\"><div style=\"border:0px solid black; padding-top:10px;\"><table border=\"0\" bordercolor=\"red\" width=\"96%\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\" style=\"margin-right:10px\"><tr><td align=\"right\"class=\"style10\"style=\"cursor:hand;\"onclick=\"kenoclearAllBoxes()\"><div align=\"center\" valign=\"middle\" style=\"height:18px;background-color:#00639c;width:100px;float:right;padding-top:2px\">&nbsp;&nbsp;&nbsp;Clear All&nbsp;&nbsp;&nbsp;</div></td></tr><tr><td valign=\"middle\" style=\"border:1px #00639c solid;background-color:#639cce\"><table width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"><tr><td bgcolor=\"#00639c\"><input type=\"hidden\" value=\"Direct2\" name=\"playType\" id=\"playType\"><select name=\"pickType\" id=\"pickType\" style=\"width:100%;background-color:#00639c;color:#FFFFFF;font-size:12px;font-family:Arial;font-weight:bold\" onchange=\"chkPickType(this.id)\"><option value=\"Direct2\">Direct-2</option><option value=\"Direct3\">Direct-3</option><option value=\"Perm2\">Perm-2</option><option value=\"Perm3\">Perm-3</option></select></td></tr><tr><td><div id='kenoRowDiv' style='height:220px'>" + kenoRow("direct") + "</div></td></tr><tr><td bgcolor=\"#00639c\"><table width=\"95%\" border=\"0\"><tr><td class=\"kenotxtStyle\" align=\"left\">Unit Price</td><td><img src=\"" + fortImgPath + "minus.gif\"  style=\"cursor:pointer\" alt=\"minus\" onclick=\"betAmountMultiple('betAmount','minus')\"/><input type=\"text\" class=\"kenotextbox\" name=\"betAmount\" id=\"betAmount\" value=\"500\" readOnly=\"true\" style=\"width:40px\" /><img src=\"" + fortImgPath + "plus.gif\" alt=\"Plus\" onclick=\"betAmountMultiple('betAmount','plus')\" style=\"cursor:pointer\"/></td></tr><tr><td class=\"kenotxtStyle\" align=\"left\">No Of Lines :</td><td><input type=\"text\" class=\"kenotextbox\" name=\"noLines\" id=\"noOfLines\" value=\"0\" maxlength=\"2\" readOnly=\"true\" /></td></tr><tr><td class=\"kenotxtStyle\" align=\"left\">Total Amount:</td><td><input type=\"text\" id=\"totAmtLto\" name=\"totalPurchaseAmt\" value=\"0\" readonly=\"true\" class=\"kenotextbox\"/></td></tr><tr><td align=\"center\"class=\"style5\"><div style=\"border:1px solid #639cce;width:50px;height:42px; float:left\">QP<br/><input type=\"hidden\" value=\"2\" name=\"QP\" id=\"qpVal\"><input type=\"checkbox\"id=\"qpChkAll\" onclick=\"kenoChkQP(this.id)\"/></div></td><td><a href=\"#\" ><img id='buy' src=\"" + fortImgPath + "buy_lotto.gif\" onclick=\"return buyTicketkeno(this.id)\"alt=\"Buy\" style=\"margin-right:4px;border: 1px #9CCEFF solid;\"/></a></td></tr></table></td></tr></table></td></tr></table></div></td></tr></table></tr><tr><td>&nbsp;</td></tr></table>";
var _kenoHTML = "<div id=\"strip\">" + drwMenu + "</div><form style=\"background-color:#FFFFFF;border: 1px solid #393939;\"><table  border=\"0\" width=\"100%\" height=\"100%\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\" bgcolor=\"#FFFFFF\"  bordercolor=\"red\"><tr><td width=\"10%\"  valign=\"top\" align=\"center\" onmousedown=\"return disClick(this)\"><input type=\"hidden\" id=\"drawType\"><div id=\"winningDispDiv\" style=\"border:1px #00639c solid;background-color:#639cce;margin-left:5px;margin-top:3px\"></div><div id=\"nxtDrawDiv\" style=\"border:1px #00639c solid;background-color:#639cce;margin-left:5px;margin-top:5px\"></div></td><td width=\"90%\" valign=\"top\" align=\"right\"><div id=\"kenomiddle\" style=\"border:1px #00639c solid;background-color:#639cce;width:98%;margin-left:5px;margin-top:3px;margin-bottom:1px\">" + _kenoHtmlTbl + "</div></td></tr></table></td></tr></table></form>";

parent.frames[0].Version['$Source: /rep/LMS_Mgmt/WebRoot/com/skilrock/lms/web/drawGames/playMgmt/games/keno/keno.js,v $'] = '$Id: keno.js,v 1.1.2.4.2.4.2.14.4.1 2013/09/19 05:12:33 yogesh Exp $';
