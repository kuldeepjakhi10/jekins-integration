
	
	$(document).ready(function() {

	
		$('[name="repType"]').change(function() {
			clearDiv();
			

		});
		

		
		
		
	});	
	
	
	
	function clearDiv() {
		$('#down').html('');
		$('#result').html('');
		$('#errorDiv').html('');

		}
	
	

	function validateDateRange() {
		clearDiv();
		var month = $('#month').val();
		var year =$('#year').val();
		var date = new Date();
		if(year>date.getFullYear()){
			$('#errorDiv').html('Commission not Calculated  Yet ..Please Select Previous Year');
		}else if((date.getMonth()<=(month-1)) && (year==date.getFullYear())){
			$('#errorDiv').html('Commission not Calculated  Yet ..Please Select Previous Month');
			return false;
		}
		
		return true;
	}
parent.frames[0].Version['$Source: /rep/LMS_Mgmt/WebRoot/com/skilrock/lms/web/reportsMgmt/backOffice/js/Attic/postSaleDepositRep.js,v $'] = '$Id: postSaleDepositRep.js,v 1.1.2.2 2013/09/19 05:17:18 yogesh Exp $';
	
	