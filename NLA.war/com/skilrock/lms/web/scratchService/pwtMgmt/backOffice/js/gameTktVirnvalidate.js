		
		// it contain the details of all desplayed games
		var gameDetMap = new Object();  
		var i18nOb = top.frames[0].i18Obj;
		function gameDetails(isRet) {
			//var isRet = _id.v("userType");
			//alert(isRet);
			if(isRet == "RETAILER") {
				var url = path+"/com/skilrock/lms/web/scratchService/pwtMgmt/gm_pwt_fetchPwtGameDetails.action";
				//alert(url);
				var _resp = _ajaxCall(url);
				//alert(_resp.data)
				if(_resp.result && _resp.data!=""){
		 			var _respData = _resp.data;
		 			var option = _id.o("game_name");
		 			
					var gameArr = _respData.split("Nx*");
					//alert("gameArr = "+gameArr.length+" data = "+gameArr);
					var gameWiseMap;
					for(var i=0; i<gameArr.length; i++) {
						// creating map of all details of game
						gameWiseMap = new Object();
						
						var gameDetailsArr = gameArr[i].split(":");
						gameWiseMap['gameId'] = gameDetailsArr[0];
						gameWiseMap['gameNbr'] = gameDetailsArr[1];
						gameWiseMap['pack_nbr_digits'] = gameDetailsArr[3];
						gameWiseMap['book_nbr_digits'] = gameDetailsArr[4];
						gameWiseMap['ticket_nbr_digits'] = gameDetailsArr[5];
						gameWiseMap['game_nbr_digits'] = gameDetailsArr[6];
						gameWiseMap['game_virn_digits'] = gameDetailsArr[7];						
						
						var gkey = gameDetailsArr[0]+"-"+gameDetailsArr[1]+"-"+gameDetailsArr[2];						
						gameDetMap[gkey] = gameWiseMap;						
						//alert(gkey+" gkey   === "+(gameDetMap[gkey])['gameId']);
						// create game option
						var dvalue = gameDetailsArr[1]+"-"+gameDetailsArr[2];
						var opt = new Option(dvalue, gkey);
						option.options[i+1] = opt;						
					}
					//alert(gameDetMap);
				}
			}
		}
		
		
		function verifyNSave(){
			
			var isValid = true; 
			var gameName = _id.v("game_name");	
			var tktNo = _id.v("ticketNbr");
			var virnCode = _id.v("virnNbr");
					
			if(gameName==-1){
				_id.i("gName_e", i18nOb.prop('error.entr.game.name'), "e");
				isValid = false;
				return false;
			}else{
				_id.i("gName_e", "");				
			}
			
			
			if(tktNo==""){
				_id.i("tktNo_e", i18nOb.prop('errror.ticket.no.empty'), "e");
				isValid = false;
			}else {
				 var isDesh = tktNo.indexOf("-")!=-1;
				 var deshCountArr =  tktNo.split("-");
				 var newtTktNo ="";
				 var tktLength = parseInt((gameDetMap[gameName])['game_nbr_digits'],10) + 
				 	parseInt((gameDetMap[gameName])['pack_nbr_digits'], 10) + 
				 	parseInt((gameDetMap[gameName])['book_nbr_digits'], 10) + 
				 	parseInt((gameDetMap[gameName])['ticket_nbr_digits'],10);				
				 if((isDesh && tktNo.length==tktLength+2 && deshCountArr.length == 3) || (!isDesh && tktNo.length==tktLength)){
				 	var tktGameNbr = tktNo.substring(0, parseInt((gameDetMap[gameName])['game_nbr_digits'],10));
				 	
				 	if(tktGameNbr != gameName.split("-")[1]){
						_id.i("tktNo_e", i18nOb.prop('error.tkt.nbr.not.of.slcted.game'), "e");
						isValid = false;
					}else{
						_id.i("tktNo_e", "");
					}	
				 }else {
				 	_id.i("tktNo_e", i18nOb.prop('error.tkt.nbr.format.not.valid'), "e");
					isValid = false;
				 }
				
				 
			}
			
			if(virnCode==""){
				_id.i("virnNbr_e", i18nOb.prop('errror.virin.code.empty'), "e");
				isValid = false;
			}
			else if((gameName!=-1 && virnCode.length !=(gameDetMap[gameName])['game_virn_digits'])){
				_id.i("virnNbr_e", i18nOb.prop('error.virn.code.not.valid.format'), "e");
				isValid = false;
			}else{
				_id.i("virnNbr_e", "");
			}
			
			return isValid;
		}
		
		parent.frames[0].Version['$Source: /rep/LMS_Mgmt/WebRoot/com/skilrock/lms/web/scratchService/pwtMgmt/backOffice/js/gameTktVirnvalidate.js,v $'] = '$Id: gameTktVirnvalidate.js,v 1.1.20.1 2014/12/10 10:37:39 yogesh Exp $';