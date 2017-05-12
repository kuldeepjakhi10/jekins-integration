var i18nOb = top.frames[0].i18Obj;

$(document).ready(function() {
	$("#reportType").change(function() {
		clearDiv();
		if ($(this).val() == "AGENT" || $(this).val() == -1) {
			$(".agt").css('display', 'none');
			$("#agentOrgId").val("-1");
			$("#main-heading").text("ETAT RECAPITULATIF DE VENTE JOURNALIERE");
		} else {
		    $(".agt").css('display', 'block');
		    $("#main-heading").text("ETAT DETAILLE DE VENTE JOURNALIERE");
		    getAgentList();
	    }
	});
	$("#agentOrgId").change(function() {
		clearDiv();
	});
});

function clearDiv() {
	$("#errorDiv").html("");
	$("#down").html("");
}

function validateForm() {
	clearDiv();
	var startDate = $("#start_date").val();
	var endDate =  $("#end_date").val();
	
	if (startDate == "" || endDate == "") {
		$("#errorDiv").html(i18nOb.prop('error.dates.empty')); 
		return false;
	}
	if (endDate < startDate) {
		$("#errorDiv").html(i18nOb.prop('error.enddate.gt.strtdate'));          
		return false;
	}
	var repType =  $("#reportType").val();
	if (repType == -1) {
		$("#errorDiv").html(i18nOb.prop('error.select.rep.type'));          
		return false;
	}
	
	return true;
}

function getAgentList() {
	var text = _ajaxCall(projectName
			+ "/com/skilrock/lms/web/userMgmt/getAgentNameList.action?orgType=AGENT");
	var firstArr = text.data.split(":");
	var retObj = _id.o("agentOrgId");
	for ( var i = 0; i < firstArr.length - 1; i++) {
		var retNameArray = firstArr[i].split("|");
		var opt = new Option(retNameArray[0].toUpperCase(), retNameArray[1]);
		retObj.options[i + 1] = opt;
	}
}
parent.frames[0].Version['$Source: /rep/LMS_Mgmt/WebRoot/com/skilrock/lms/web/reportsMgmt/backOffice/js/Attic/netSaleWinRep.js,v $'] = '$Id: netSaleWinRep.js,v 1.1.4.3 2015/06/16 13:31:17 gauravk Exp $';
