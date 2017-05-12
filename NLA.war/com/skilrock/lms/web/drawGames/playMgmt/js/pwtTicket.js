	var path = projectName;
		
		// it contain the details of all desplayed games
		var gameDetMap = new Object();  
		
		function gameDetails() {
				var url = path+"/com/skilrock/lms/web/pwtMgmt/gm_pwt_fetchPwtGameDetails.action";
				var _resp = winAjaxReq(url);
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
		
		
		function verifyNSave(){
			var isValid = true; 
			var gameName = _id.v("game_name");	
			var tktNo = _id.v("tktNo");
			var virnCode = _id.v("virnNbr");
					
			if(gameName==-1){
				_id.i("gName_e", "Please Select The Game Name", "e");
				isValid = false;
				return false;
			}else{
				_id.i("gName_e", "");				
			}
			
			if(tktNo==""){
				_id.i("tktNo_e", "Please Insert Ticket Number", "e");
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
						_id.i("tktNo_e", "Ticket Number Is Not Of The Selected Game", "e");
						isValid = false;
					}else{
						_id.i("tktNo_e", "");
					}	
				 }else {
				 	_id.i("tktNo_e", "Ticket Number Format is Not Valid.", "e");
					isValid = false;
				 }
				
				 
			}
			
			if(virnCode==""){
				_id.i("virnNbr_e", "Please Insert Virn Code", "e");
				isValid = false;
			}
			else if((gameName!=-1 && virnCode.length !=(gameDetMap[gameName])['game_virn_digits'])){
				_id.i("virnNbr_e", "Virn Code Is Not in Valid Format", "e");
				isValid = false;
			}else{
				_id.i("virnNbr_e", "");
			}
			
			return isValid;
		}
		function _subTrans(){
			return ( verifyNSave() && _subValid('subTrans'));
		}
		
		parent.frames[0].Version['$Source: /rep/LMS_Mgmt/WebRoot/com/skilrock/lms/web/drawGames/playMgmt/js/pwtTicket.js,v $'] = '$Id: pwtTicket.js,v 1.1.18.1 2013/09/19 05:17:48 yogesh Exp $';