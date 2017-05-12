		<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>



<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<link rel="stylesheet" href="<%=request.getContextPath() %>/LMSImages/css/styles.css" type="text/css"/>

<title><%=application.getAttribute("JSP_PAGE_TITLE")%></title>
	


			<script>
			function validateAllowBook()
		{
		
		var flag=true;
		var availablecredit=document.getElementById('availableCredit');
	alert("balance is " + availablecredit.value);
		//alert("credit limit is" + availablecredit.value);
		var totalBookPrice=0;
		var ListSize1=document.getElementById('ListSize');
		//vat listSize=Integer.parseInt(ListSize1.value);
		
		var quoteAllow= new Array(ListSize1);
		var quoteRemain= new Array(ListSize1);
		var bookPrice= new Array(ListSize1);
		//var Game= new Array(ListSize1);
		Game =document.getElementsByName('gameName');  
		 quoteAllow =document.getElementsByName('allowedBooks');
		 quoteRemain=document.getElementsByName('differenceBtBOndApprBooks');
		 bookPrice=document.getElementsByName('oneBookPrice');
		var numericExpression = /^[0-9]+$/;
		var totalAllotedBooks=0;
		for(var i=0 ;i<quoteAllow.length ;i++){
		
		//alert(Game[i].value);
		var allowBook=quoteAllow[i].value;
		var remainBook=quoteRemain[i].value;
		var gamebookPrice=bookPrice[i].value;
		totalBookPrice=totalBookPrice + (gamebookPrice*allowBook);
		//alert( "book price for game" + totalBookPrice);
		totalAllotedBooks=parseInt(totalAllotedBooks,10)+parseInt(allowBook,10);
		
		
		//alert(allowBook);
		//alert(remainBook);
		 if(!isNumeric(quoteAllow[i],"Please Enter Corect Value for Allowd Book for Game "+Game[i].value)){
		flag=false;
		 return flag;
		 }
		 var allow=parseInt(allowBook,10);
		  var remain=parseInt(remainBook,10);
		 // alert("dd"+allow);
		 
		if(allow>remain){
		//alert("dd"+remain);
		
		document.getElementById('allowedBooks1').innerHTML = "<font color = 'red'>Alloted Books can not be greater than Remaining Books for Game "+Game[i].value+"</font>";
		flag=false;
		 return flag;
		}
		
		document.getElementById('allowedBooks1').innerHTML ="";
		flag=true;
		
		}		
		if(totalAllotedBooks=="0"){
		alert("Total Alloted Books can not be zero");
		return false;
		}	
		//alert(totalBookPrice);
		if(availablecredit.value < totalBookPrice)
		{
		//alert(totalBookPrice);
		 alert(tierMap['AGENT']+"'s credit limit is not enough to approve these all books ");
		 return false;
		}
		return flag;
		}
		function isNumeric(elem, helperMsg){
				//alert(helperMsg);
			var numericExpression = /^[0-9]+$/;
			if(elem.value.match(numericExpression)){
				doReset(elem);
				return true;
			}else{
				//alert(helperMsg);
				var elem1=elem.name+"1";
			
				document.getElementById(elem1).innerHTML = "<font color = 'red'>"+helperMsg+"</font>";
			//alert(helperMsg);
				elem.focus();
				return false;
			}
		}
		
		
		function verSpChar(){
			//var flag=true;
			var ListSize1=document.getElementById('ListSize');
			Game =document.getElementsByName('gameName');  
			quoteAllow =document.getElementsByName('allowedBooks');
			var numericExpression = /^[0-9]+$/;
			
			for(var i=0 ;i<quoteAllow.length ;i++){
				var allowBook=quoteAllow[i].value;
				
				//helperMsg="Please Enter Corect Value for Allowd Book for Game "+Game[i].value;
				if(quoteAllow[i].value.match(numericExpression)){
					
				}else{
					quoteAllow[i].value=0;
					//document.getElementById(quoteAllow[i].name+'1').innerHTML = "<font color = 'red'>"+helperMsg+"</font>";
					//flag=false;
					//break;
				}
				
			}
			
			
			return true;
			
		}
		
		function doReset(elem){
			var elem1=elem.name+"1";
			
				document.getElementById(elem1).innerHTML = "";
				
		}
			</script>
		<s:head theme="ajax" debug="false"/>
	</head>
	<body>
		<%@include
				file="/com/skilrock/lms/web/loginMgmt/menu.jsp"%>
		<div id="wrap">

			<div id="top_form">
				
				<div id="allowedBooks1"></div>
				<br/><br/>
				<div id="right" >				
					
					
					<table width="450" border="1" cellpadding="3" cellspacing="0" bordercolor="#CCCCCC" align="center">
						 <tr><th align="center" colspan="3" >Search Result </th></tr>
							<s:if test="#session.RequestList.size()!=0">
										<tr>
							<th>
									Order No
								</th>

								<th>
									<s:property value="#application.TIER_MAP.AGENT" /> Name
								</th>

								<th>
									Date
								</th>

							</tr>
							<s:iterator id="SearchOrderResults" value="#session.RequestList">
								<tr>
									<s:url id="es"
										action="bo_om_processOrdReq_Detail.action"
										encode="true">
										<s:param name="name" value="%{name}" />
										<s:param name="orderId" value="%{orderId}" />
									</s:url>

									<td>
										<s:a id="link2" theme="ajax" href="%{es}" targets="right">
											<s:property value="orderId" />
										</s:a>
									</td>

									<td>
										<s:property value="name" />
									</td>

									<td>
										<s:property value="date" />
									</td>

								</tr>
							</s:iterator>
					</s:if>
					<s:else>
						<tr><td colspan="3" align="center">No Order to Process</td></tr>
					</s:else>
						</table>
						
						
					<s:div id="naviga" >
	                     <s:if test=" #session.RequestList1.size >5 ">
                            <table align="center">
		                       <s:if test="#session.startValueRequestSearch!=0"><s:a  href="bo_om_processOrdReq_Navigate.action?end=first">First</s:a><s:a href="bo_om_processOrdReq_Navigate.action?end=Previous" > Previous</s:a></s:if><s:else>First Previous</s:else>    
                               <s:if test="#session.startValueRequestSearch==((#session.RequestList1.size/5)*5)">Next Last</s:if><s:else><s:a  href="bo_om_processOrdReq_Navigate.action?end=Next" >Next</s:a><s:a  href="bo_om_processOrdReq_Navigate.action?end=last">Last</s:a></s:else>     
                            </table>
                         </s:if>
	                 </s:div> 
						
						
					</div>
			</div>
					
				
		</div>

	</body>
</html>
<code id="headId" style="visibility: hidden">
$RCSfile: bo_om_processOrdReq_Menu.jsp,v $
$Revision: 1.2.2.2.6.3 $
</code>