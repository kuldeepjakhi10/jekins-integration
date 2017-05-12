
function setAppData(buyData) {
	if (typeof parent.retName != "undefined") {
		buyData = buyData.replace(/orgName=/gi, ("sampleStatus="+parent.sampleStatus +"|orgName="));
		parent.setAppData(buyData);
	} else {
		buyData = buyData.replace(/orgName=/gi, ("sampleStatus="+parent.sampleStatus + "|orgName="));
		adjustAppSize(buyData.substring(buyData.indexOf("ctr=") + 4, buyData.length));
		parent.document.applets[0].showStatus(buyData);
	}
}
function adjustAppSize(height) {
	parent.document.applets[0].height = height;
}

function setAppDataForVoucher(buyData) {
	adjustAppSize1(buyData.substring(buyData.indexOf("ctr=") + 4, buyData.length));
	document.applets[0].showStatus(buyData);
}

function adjustAppSize1(height) {
	document.applets[0].height = height;
}

parent.frames[0].Version['$Source: /rep/LMS_Mgmt/WebRoot/com/skilrock/lms/web/drawGames/playMgmt/js/Attic/commonRPOS.js,v $'] = '$Id: commonRPOS.js,v 1.1.2.6.4.2.2.5.8.2 2013/09/19 05:17:48 yogesh Exp $';
