
function onTypeChangeValue(tValue) {	
	_id.i('ret_error', "");
	_id.i('d2', "");	
	if(tValue=='AGENT') {	
		_id.o('ret_org_name').selectedIndex = 0;	
		_id.o('ret_org_name').disabled = true;
		_id.iniFocus('game_id');		
	}else {
		_id.o('ret_org_name').selectedIndex = 0;
	 	_id.o('ret_org_name').disabled = false;		
	}
} 
	




function fetchRetailerList(url, div) {		
	_id.o("progImgDiv").innerHTML='<img src="'+path+'/LMSImages/images/loadingAjax.gif"/>';
	_id.non('dtlTbl');	
	var _resp  = _ajaxCall(url);
	if(_resp.result){
	    	var resStr = _resp.data;
	    	//alert(resStr);	    	
			if(resStr=='NO_RET') {
				alert("NO "+tierMap['RETAILER'].toUpperCase()+" Organization Exist.");				
			}			
			else {				
				createRetSelect(resStr);	
				//alert();			
			}
      } else {
        alert("Problem: ");
      }
    	
      _id.i("progImgDiv", "");
	  _id.blk('dtlTbl');
		
}


function createRetSelect(responseData){
	//alert(responseData);	
	var newSelectbox = _id.o("ret_org_name");	
	var retKeyValueList = new Array();
	retKeyValueList = responseData.replace("[","").replace("]","").split(",");
	var retList = new Array();
	 	
	for(var i=0;i<retKeyValueList.length;i++) {
		if(i!=0) {
			retList = retKeyValueList[i].split("=");
			var key=retList[1].replace(" ","");
			var val=retList[0].replace(" ","");
		}else {
			retList = retKeyValueList[i].split("=");
			var key=retList[1];
			var val=retList[0];
		}		
		
		var opt = new Option(key, val);
		newSelectbox.options[i+1] = opt;
	}
}





function getInventoryDetails(url, div) {
	
	var type=_id.v('org_type');	
	var retailer = _id.v('ret_org_name');
	var gameid = _id.v('game_id');
	
	if((type=='RETAILER') && (retailer=='-1')) {
			document.getElementById('ret_error').innerHTML="Please Select an "+tierMap['RETAILER'].toUpperCase()+" Company";		
			return false;	
	}
	else {
		//alert("INSIDE else");	
		_id.o("loadingDiv").innerHTML='<img src="'+path+'/LMSImages/images/loadingAjax.gif"/>';
		url=url+"?type="+type+"&orgId="+retailer+"&gameid="+gameid;
		//alert(url);
   		var _resp  = _ajaxCall(url);
   		
		if(_resp.result){			
   	    	var resStr = _resp.data;
   	    	//alert(resStr); 		
			if(resStr=='NONE') {
				alert("NO Books Exist.");
				_id.i('d2',"NO Books Exist.");
			}			
			else{
				createInventoryDetailsDiv(resStr);
			}			
      } else {
        alert("Problem: ");
      }
     _id.i("loadingDiv",'');
	}
}
var currentStart;
var currentEnd;

function showDetails(pId) {
	//alert("id = "+pId);
	
	if(pId.match("plus")) {
		//alert("plus clicked");
		var newId=pId.replace("plus", "");
		//alert("new id = "+newId);
		var length=packList.length;
		for(i=currentStart; i<currentEnd; i++) {
			document.getElementById("v"+i).style.display="none";
			document.getElementById("minus"+i).style.display="none";
			document.getElementById("plus"+i).style.display="block";
		}
		document.getElementById("v"+newId).style.display="block";
		document.getElementById("minus"+newId).style.display="block";
		document.getElementById("plus"+newId).style.display="none";
	}
	else {
		//alert("minus clicked");
		var newId=pId.replace("minus", "");
		//alert("new id = "+newId);
		document.getElementById("v"+newId).style.display="none";
		document.getElementById("minus"+newId).style.display="none";
		document.getElementById("plus"+newId).style.display="block";
	}
	
}

var paginationSelect;
function createInventoryDetailsDiv(response) {
	
	var totalBooks=inventoryDetails(response); 
	/*var str="";
		for(var z=0; z<totalBooks.length; z++) {
			str=str+list[z];
		}	
		//alert("str ========= "+str);
	*/
	//alert(paginationSelect);
	if(document.getElementById("pagination")!=null){		
		document.getElementById("pagination").selectedIndex=0;
	}
	if(packList.length>11){
	createPackDetail('0','10');
	}else{
	createPackDetail('0',packList.length);
	}
	

}


var packList;
var booksInPack;
var totalBooks;

function inventoryDetails(response) {

	totalBooks=new Array();
	packList=new Array();
	booksInPack=new Array();
	
	var divPacks=response.split("pack");
	
	var divPacksLength=divPacks.length;
	for(var i=0; i<divPacksLength; i++) {		
		var packs=divPacks[i].split("book");		
				
		var bookList=0.0;	
		var books=packs[1].split(",");		
		totalBook=new Array();
		
		var booksLength=books.length;
		for(var j=0; j<booksLength; j++) {
			var book=books[j].split("TO");					
			var bookLists=generateSeriesList(book[0], book[1]);	
			
			var totalBookLength=totalBook.length;
			var bookListsLength=bookLists.length;		
			for(var k=0; k<bookListsLength; k++) {
				totalBook[totalBookLength+k]=bookLists[k];
			}					
			//bookList=bookList+booklists.length;				
		}
		//booksInPack[i]=bookList;
		booksInPack[i]=totalBook.length;
		packList[i]=packs[0];
		totalBooks[i]=totalBook;
		//alert("pack = "+packList[i]+"  books length = "+bookList);
		
		
	}	
	
	paginationSelect='<select id="pagination" onchange="createPackDetail(this.value.split(\'to\')[0],this.value.split(\'to\')[1])">'
		var packLen = packList.length;
	    var i=0;
	    		//alert(packLen);
			   while(i<packLen){
			  	 if(i+10<packLen){
			  paginationSelect=paginationSelect+'<option value="'+parseInt(i)+'to'+parseInt(i+10)+'">'+(i+1)+'  to '+(i+10);
			  	 }else{
			  paginationSelect=paginationSelect+'<option value="'+parseInt(i)+'to'+packLen+'">'+parseInt(i+1)+' to '+packLen;
			   }
			   i=i+10; 
			   }
	paginationSelect=paginationSelect+'</select>';
	
	return totalBooks;
}

function generateSeriesList(first, last) {	
	//alert(" first "+first+"  last = "+last);	
		var list=new Array();
		var afirst=first.split("-");
		var length=afirst[1].length;
		var blast=last.split("-");	
		//alert(" afirst "+afirst[1]+"  blast = "+blast[1]);
		var firstNumber=parseFloat(afirst[1]);	
		var lastNumber=parseFloat(blast[1]);	
		//alert(" first No. "+firstNumber+"  lastNumber = "+lastNumber);
		var i=0;
		while(firstNumber<=lastNumber) {
			var book=afirst[0]+"-"+completeBookNbr(firstNumber, length);		
			list[i]=book;
			firstNumber+=1;	
			i++;			
		}	
		
			
		return list;
	}
	
	
function completeBookNbr(number, length) {
		var num=number+"";
		var zeroLength=length-num.length;
		var totalZeros="";
		while(zeroLength>0) {
			totalZeros=totalZeros+"0";
			zeroLength-=1;
		}
		return (totalZeros+num);
	}

function createPackDetail(start,end){

currentStart =parseInt(start,10);
currentEnd = parseInt(end,10);
var selectedInd=0;

if(document.getElementById("pagination")!=null){
	selectedInd=document.getElementById("pagination").selectedIndex;
}
var table="<table border='1' cellpadding='0' cellspacing='0' bordercolor='CCCCCC' style='border-color: green;' width='100%'>"+
				"<tr><th align='center'>Pack Number</th><th align='center'>Number Of Books</th><th align='right'>"+paginationSelect+"</th></tr>";
	//alert(start+" === "+end);
	//alert(parseInt(start,10)<parseInt(end,10));
	for(var i=parseInt(start,10); i<parseInt(end,10); i++) {
		var newRow="<tr>"+
						"<td align='left'>Pack - "+packList[i]+"</td>"+
						"<td align='left'>Number Of Books = "+booksInPack[i]+"</td>"+
						"<td align='right'>"+
						"<div id='plus"+i+"' style='color: blue;font-size: medium;cursor: hand;'><label id='labelplus"+i+"' onclick='showDetails(\"plus"+i+"\")' /><img src='"+path+"/LMSImages/images/Plus.gif'/></label></div>"+
						"<div id='minus"+i+"' style='color: blue;font-size: medium;display: none;cursor: hand;'><label id='labelminus"+i+"' onclick='showDetails(\"minus"+i+"\")' /><img src='"+path+"/LMSImages/images/minus.gif'/></label></div>"+
						"</td>"+
					"</tr>"+
					"<tr><td colspan='3'>"+
							"<div id='v"+i+"' style='color: blue;display: none;'><table width='100%' border='1' cellpadding='3' cellspacing='0' bordercolor='CCCCCC'>";
		var bookDetailDiv="";
		
		var books=totalBooks[i];
		var totalBooksLength=books.length;
		//alert("totalBooksLength = "+totalBooksLength);
		var n=-1,m=-10; 
		for(var k=0; k<totalBooksLength; k++) {			
					
					n+=1; m+=1;
					if(n%10==0) {
						bookDetailDiv=bookDetailDiv+"<tr>";
					}
						bookDetailDiv=bookDetailDiv+"<td align='left'>&nbsp;"+books[k]+"</td>";	
					if(m%10==0)
						bookDetailDiv=bookDetailDiv+"</tr>";		
						
		}
		bookDetailDiv=bookDetailDiv+"</table></div></td></tr>"
		newRow=newRow+bookDetailDiv;
		table=table+newRow;
		//alert("pack = "+packList[i]+"      book length = "+booksInPack[i]+"    totalBooks = "+totalBooks[i].length);
	
	}
	table=table+"</table>";
	//alert(table);
	document.getElementById('d2').innerHTML=table;
	document.getElementById("pagination").selectedIndex=selectedInd;

	
}

function fetchRetOrgList() {
	var text = _ajaxCall(projectName+"/com/skilrock/lms/web/userMgmt/getOrgList.action?orgType=RETAILER");
	var firstArr = text.data.split(":");
	var retObj = _id.o("ret_org_name");

	for ( var i = 0; i < firstArr.length - 1; i=i+1) {
		var retNameArray = firstArr[i].split("|");
		var opt = new Option(retNameArray[0].toUpperCase(), retNameArray[1]);
		retObj.options[i + 1] = opt;
	}
	
}

parent.frames[0].Version['$Source: /rep/LMS_Mgmt/WebRoot/com/skilrock/lms/web/scratchService/inventoryMgmt/agent/js/agt_invMgmt_bookWiseDtls.js,v $'] = '$Id: agt_invMgmt_bookWiseDtls.js,v 1.1.8.1.8.1 2013/07/26 09:50:26 yogesh Exp $';