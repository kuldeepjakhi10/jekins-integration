var i18nOb = top.frames[0].i18Obj;
	var mainDiv;
	function retrieveURL(url,div) {
	  	//alert(projectName);
		mainDiv=div;
		url = projectName+"/"+url;
		//alert(url);
		var _resp  = _ajaxCall(url);
		//alert( _resp.data);
		if(_resp.result){
		   _id.i(mainDiv, _resp.data);
		} else {
		     alert(i18nOb.prop('error.problem'));
		}
	}
	
	function fetchCityList() {
			var country = _id.o('plrCountry').value;
			var state = _id.o('plrState').value;
	 		_ajaxCall(projectName+"/com/skilrock/lms/web/userMgmt/getCity.action?country=" + country + "&state=" + state,'charactersCity');
	}

	
	function verPlrDetails(url, div){
		
//		alert("fffff");
		 // validate the retailer organization  Entries
		  var frmVal  = new parent.frames[0].Validator("playerPWT");
		  
		  frmVal.aV("firstName","req",i18nOb.prop('error.fname.empty'),"fn_err");
		  frmVal.aV("firstName","alpha",i18nOb.prop('error.pls.enter.valid.name'),"fn_err");
		  
		  frmVal.aV("lastName","req",i18nOb.prop('error.lname.empty'),"ln_err");
		  frmVal.aV("lastName","alpha",i18nOb.prop('error.pls.enter.valid.name'),"ln_err");
		
		  frmVal.aV("idType","dontselect=0",i18nOb.prop('error.select.id.type'),"it_err");
		  
		
		  frmVal.aV("idNumber","req",i18nOb.prop('error.pls.entr.id.nbr'),"in_err");
		  frmVal.aV("idNumber","regexp=[^A-Za-z0-9\\s/,-]",i18nOb.prop('error.id.empty'),"in_err");
		 
		  var valid = document.error_disp_handler.isValid; 
		  //alert(document.error_disp_handler.isValid+"   "+valid);	  
		  
		  if(valid) {
		  	url = url+"?firstName="+_id.v('firstName')+"&lastName="+_id.v('lastName')+"&idType="+
		  		_id.v('idType')+"&idNumber="+_id.v('idNumber');
		  
		  	var _resp =  _ajaxCall(url);
		  	if(_resp.result){
				var _respData=_resp.data;
				//alert(_respData)
				//alert(_id.o(div).disabled);
				
				_id.o(div).innerHTML = _respData;
				_id.blk(div);
				_id.vis(div);
				//alert(_id.o(div).innerHTML);
			  	_id.blk('subAny');
			}
			else {
			  alert(i18nOb.prop('error.prob.fetch.plyr.details'));
			}
		  }
		   
	
		    
		  
	}
	
	

	function validatePlrDetails(){
		
		var isRegistered=document.getElementById('isPlrRegistered').value;
		if(isRegistered=='YES')
		   return true;
		   
		 var frmVal  = new parent.frames[0].Validator("playerPWT");
		 
		 
		 // validate the retailer organization  Entries
		 // alert("1");
		  frmVal.aV("firstName","req",i18nOb.prop('error.fname.empty'),"fn_err");
		  frmVal.aV("firstName","alpha",i18nOb.prop('error.pls.enter.valid.name'),"fn_err");
		 // alert("2");
		  frmVal.aV("lastName","req",i18nOb.prop('error.lname.empty'),"ln_err");
		  frmVal.aV("lastName","alpha",i18nOb.prop('error.pls.enter.valid.name'),"ln_err");
		 // alert("3");
		  frmVal.aV("idType","dontselect=0",i18nOb.prop('error.select.id.type'),"it_err");
		  //alert("4");
		  frmVal.aV("idNumber","req",i18nOb.prop('error.pls.entr.id.nbr'),"in_err");
		  frmVal.aV("idNumber","regexp=[^A-Za-z0-9\\s/,-]",i18nOb.prop('error.id.empty'),"in_err");
		 // alert("5");
		 
		  // when plr details are not found in database
		 // var eObj = document.getElementById('emailId');
		 // var pObj = document.getElementById('phone');
		
		  //if((eObj!=null && pObj!=null)){
		 // alert("if");  
		      frmVal.aV("emailId","req",i18nOb.prop('error.pls.enter.email'),"ei_err");
			  frmVal.aV("emailId","email",i18nOb.prop('error.email.incorrectemail'),"ei_err");
			  		
		  	  frmVal.aV("phone","req",i18nOb.prop('error.pls.enter.phone.nbr'),"ph_err");
			  frmVal.aV("phone","numeric",i18nOb.prop('error.phno.incorrectvalue'),"ph_err");
			  
		  	  frmVal.aV("plrAddr1","req",i18nOb.prop('error.addline1.empty'),"pa1_err");
		  	  frmVal.aV("plrAddr1","regexp=[^A-Za-z0-9\\s/,-]",i18nOb.prop('msg.inv.addr'),"pa1_err");
		  
		  	  frmVal.aV("plrAddr2","regexp=[^A-Za-z0-9\\s/,-]",i18nOb.prop('msg.inv.addr'),"pa2_err");		  	  
		  	
		      frmVal.aV("plrCountry","dontselect=0",i18nOb.prop('msg.blank.country'),"pc_err");
			  frmVal.aV("state","dontselect=0",i18nOb.prop('msg.blank.state'),"ps_err");
			  
			  frmVal.aV("plrPin","req",i18nOb.prop('error.pls.enter.pin'),"pp_err");
			  frmVal.aV("plrPin","numeric",i18nOb.prop('error.pls.enter.crrct.value.pin'),"pp_err");
			
			
			  
			  // validate the player Bank Details  Entries
			  var bnkNo = document.getElementById('bankAccNbr').value;
			  var bankName = document.getElementById('bankName').value;
			  var bankBranch = document.getElementById('bankBranch').value;
			  var locationCity = document.getElementById('locationCity').value;
			  bnkNo = bnkNo.replace(" ", "")+bankName+bankBranch+locationCity;
			  
			// alert(bnkNo);
			  if(bnkNo!=""){
			  	  			  
			  	  frmVal.aV("bankAccNbr","req",i18nOb.prop('error.enter.bank.acc.nbr'),"ban_err");
				  frmVal.aV("bankAccNbr","numeric",i18nOb.prop('error.enter.num.bank.acc.nbr'),"ban_err");
				  
				  frmVal.aV("bankName","req",i18nOb.prop('error.pls.enter.bank.name'),"bkn_err");
				  frmVal.aV("bankName","regexp=[^A-Za-z\\s]",i18nOb.prop('error.pls.enter.bank.name'),"bkn_err");				  
				 			  
				  frmVal.aV("bankBranch","req",i18nOb.prop('error.lname.empty'),"bnb_err");
				  frmVal.aV("bankBranch","regexp=[^A-Za-z\\s]",i18nOb.prop('error.name.empty'),"bnb_err");
								
				  frmVal.aV("locationCity","req",i18nOb.prop('error.enter.bank.city'),"bnlc_err");
				  frmVal.aV("locationCity","regexp=[^A-Za-z\\s]",i18nOb.prop('error.pls.enter.valid.bank.city.name'),"bnlc_err");		  
			   }
			   
		//}
		//alert(document.error_disp_handler.isValid);
		return document.error_disp_handler.isValid;
	}
	
	function validatePlrDtl(){
			return ( validatePlrDetails() && _subValid('subAny'));
		}


parent.frames[0].Version['$Source: /rep/LMS_Mgmt/WebRoot/com/skilrock/lms/web/scratchService/pwtMgmt/backOffice/js/pwtDirPlayerBO.js,v $'] = '$Id: pwtDirPlayerBO.js,v 1.1.8.2.10.1 2014/12/10 10:37:38 yogesh Exp $';