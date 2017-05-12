<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>	
	<link rel="stylesheet" href="<%=request.getContextPath() %>/LMSImages/css/styles.css"  type="text/css"/>
	<title><%=application.getAttribute("JSP_PAGE_TITLE")%></title>
	<script>var projectName="<%=request.getContextPath() %>"</script>
	<script  src="<%=request.getContextPath() %>/com/skilrock/lms/web/scratchService/pwtMgmt/backOffice/js/pwtBO.js" />	
	<s:head theme="ajax" debug="false"/>	
	
	<script>
	
	  function showdetails(reqId,reqStatus,partyName,pwt_amt,requester_name,task_id,requested_by_id,ticket_nbr,game_id,game_nbr,requester_type)
	  {
	   _id.blk('serchResultsDetails');
	   _id.non('denyfields');
	   _id.i('req_id',reqId);
	   _id.i('req_status',reqStatus);
	    _id.i('party_name',partyName);
	   // _id.i('last_name',lastName);
	    _id.i('pwt_amt',pwt_amt);
	     _id.i('ticket_nbr',ticket_nbr);
	     // _id.i('virn_nbr',virn_nbr);
	      _id.i('requester_type',requester_type);
	    _id.i('requester_name',requester_name);
	    _id.o('pwtAmount').value=pwt_amt;
	     _id.o('taskId').value=task_id;
	      _id.o('requestedById').value=requested_by_id;
	      _id.o('requesterTypeValue').value=requester_type;
	      _id.o('ticketNbr').value=ticket_nbr;
	     // _id.o('virnNbr').value=virn_nbr;
	      _id.o('gameId').value=game_id;
	      _id.o('gameNbr').value=game_nbr;
	      
	  }
	  
	  function approveRequest()
	  {
	   if(confirm('Are You Sure To Approve!!')){
	     _id.o('subTrans').style.visibility="hidden";
	     _id.o('subTransDeny').style.visibility="hidden";
	     var url;
	     var taskId=_id.o('taskId').value;
	      var pwtAmount=_id.o('pwtAmount').value;
	     var requestedbyid=_id.o('requestedById').value;
	     var requesterType=_id.o('requesterTypeValue').value;
	     var ticketnbr=_id.o('ticketNbr').value;
	     var virnnbr=_id.o('virnNbr').value;
	     var gameId=_id.o('gameId').value;
	     var gamenbr=_id.o('gameNbr').value;
	     url='approvePendingPwtByBO.action?taskId='+taskId+'&ticketNbr='+ticketnbr+'&pwtAmount='+pwtAmount+'&requestedById='+requestedbyid+'&requesterType='+requesterType+'&gameId='+gameId+'&gameNbr='+gamenbr;
	    // alert(url);
	     _resp= _ajaxCall(url);
	     
	if(_resp.result){                        
                   //alert(_resp.data); 
                   if(_resp.data !="null" || _resp.data == ""){
                     _id.i('serchResults','Request has been Approved Successfully so '+_resp.data);
                     _id.non('serchResultsDetails');
                    }
                    else{
                      _id.i('serchResults','Some Error Has Occured Please Try Later');
                      _id.non('serchResultsDetails');
                    }
                                    
      } else {
        alert("Problem: ");
        }
        _id.o('subTrans').style.visibility="visible";
	     _id.o('subTransDeny').style.visibility="visible";
	}  
}
	  
	   function denyRequest()
	  {
	     var fields = document.getElementsByName('denyPwtStatus');
		if(!(fields[0].checked || fields[1].checked))
			{
				alert("Please Select Atleast One Option for Deny");
				return false;
			}
		var denyType;
		for(var i=0; i<fields.length;i++){
		  if(fields[i].checked)	{	
		     denyType=fields[i].value;
		     break;
		     }
		}
		//alert(denyType);
		if(confirm('Are You Sure To Deny!!')){
	     _id.o('subTrans').style.visibility="hidden";
	     _id.o('subTransDeny').style.visibility="hidden";
	     var url;
	     var taskId=_id.o('taskId').value;
	      var pwtAmount=_id.o('pwtAmount').value;
	     var requestedbyid=_id.o('requestedById').value;
	     var ticketnbr=_id.o('ticketNbr').value;
	     var virnnbr=_id.o('virnNbr').value;
	     var gameId=_id.o('gameId').value;
	     var gamenbr=_id.o('gameNbr').value;
	     //alert(fields[0].value + fields[1].value);
	     url='denyPendingPwtsBOAjax.action?taskId='+taskId+'&ticketNbr='+ticketnbr+'&virnNbr='+encodeURIComponent(virnnbr)+'&denyPwtStatus='+denyType+'&gameId='+gameId+'&gameNbr='+gamenbr;
	     //alert(url);
	     _resp= _ajaxCall(url);
	     
	if(_resp.result){                        
                 // alert("Cancelled");  
                  if(_resp.data=="true"){
                   _id.i('serchResults','Request Cancelled');
                    _id.non('serchResultsDetails');
                    }                                   
      } else {
        alert("Problem: ");
        }
       
	     _id.o('subTrans').style.visibility="visible";
	     _id.o('subTransDeny').style.visibility="visible";
	  }
	  
	}
	</script>
	
</head>
 
   <body >
      <%@include file="/com/skilrock/lms/web/loginMgmt/menu.jsp"%>
	 <div id="wrap">
         <div id="top_form">
         	<h3>Approve Requested PWT's</h3>
           <s:form id="topForm" action="getPendingPwtForApprovalBO.action">
            <table border="0" cellpadding="2" cellspacing="0" width="400">
             	   
             	   
             	   <tr>
						<td>						
							<s:select cssClass="option" name="requesterType" id="Org_type" label="Requested By Type" list="#{'ALL':'ALL','AGENT':#application.TIER_MAP.AGENT.toUpperCase(),'RETAILER':#application.TIER_MAP.RETAILER.toUpperCase()}" onchange="retURL('getAgent.action','agentlist',this.value)"></s:select>
						</td>
					</tr>
             	   
             	   <tr><td  id="agentDiv" ></td><td><div  id="agentlist"></div></td></tr>
		           <tr><td  id="retDiv" ></td><td><div  id="retlist"></div></td></tr>
             	   <tr>
						<td align="left">						
							<s:select cssClass="option" name="partyType" id="party_Type" label="Requested For Type" list="#{'PLAYER':'PLAYER','AGENT':#application.TIER_MAP.AGENT.toUpperCase(),'RETAILER':#application.TIER_MAP.RETAILER.toUpperCase()}" ></s:select>
						</td>
					</tr>
             	   		
					<tr>
						<td>
							
							<s:textfield label="Request Id" name="requestId"></s:textfield>
						</td>
					</tr>
					
             	   <tr>
						<td>
							
							<s:textfield label="Player First Name" name="firstName"></s:textfield>
						</td>
					</tr>
					
					<tr>
						<td>
							
							<s:textfield label="Player Last Name" name="lastName"></s:textfield>
						</td>
					</tr>
					
					
					
					<tr>
						<td>						
							<s:select value="'Pending PWT'" cssClass="option" name="status" label="Status" list="{'REQUESTED'}"></s:select>
						</td>
					</tr>
					
					<tr>
					<td></td>
					  <td>
					    <table>
					     <s:submit cssClass="button" value="Search"  theme="ajax" targets="serchResults" onclick="_id.non('serchResultsDetails'),_id.non('denyfields');"></s:submit>					    
					    </table>
					  </td>
					</tr>
					
					
            </table>
          </s:form>         
         
         
        
         <s:div id="serchResults" theme="ajax">     
         </s:div>
         
         
          <s:div id="serchResultsDetails" theme="ajax" cssStyle="display: none;">
           
           <h3>Pwt Details</h3>
           
           <s:form cssStyle="background-color: white;border:0px">
            <s:hidden id="taskId" name="taskId"/>
            <s:hidden id="pwtAmount" name="pwtAmount"/>
            <s:hidden id="requestedById" name="ratailerId"/>            
             <s:hidden id="requesterTypeValue" name="requesterTypeValue"/>            
            <s:hidden id="ticketNbr" name="ticketNbr"/>
            <s:hidden id="virnNbr" name="virnNbr"/>
            <s:hidden id="gameId" name="gameId"/>
            <s:hidden id="gameNbr" name="gameNbr"/>
            
           <table border="1" cellpadding="2" cellspacing="0" width="400" align="center" bordercolor="#cccccc">
	              <tr><td  class="label" align="right">Request Id</td> <td width="200" id="req_id" class="data"></td> </tr>              
	               <tr><td class="label" align="right">Request Status</td><td id="req_status" class="data"></td> </tr>              
	               <tr> <td class="label" align="right">Party Name</td><td id="party_name" class="data"></td></tr>              
	               <tr> <td class="label" align="right">Pwt Amount</td> <td id="pwt_amt" class="data"></td> </tr>              
	               <tr><td class="label" align="right">Ticket</td> <td id="ticket_nbr" class="data"></td> </tr>              
	               <tr> <td class="label" align="right">Requester Name</td><td id="requester_name" class="data"></td> </tr>              
	              <tr> <td class="label" align="right">Requester Type</td> <td id="requester_type" class="data"></td> </tr>              
	              
	              <!--  
	              <tr>
	                <td>
	                  <s:a href="#" onclick="approveRequest()">Approve Request</s:a>
	                </td>
	                
	                <td>
	                  <s:a href="#"  onclick=" return showDenyFields();" >Deny Request</s:a>
	                </td>
	               </tr>
	              --> 
	               
	               <tr>
		                <td colspan="2" align="center">
			               	 <input type="button" onclick="approveRequest()" id="subTrans" value="Approve Request" class="button"/>
			               	 <input type="button" onclick=" return showDenyFields();" value="Deny Request" class="button"/>                  
		                </td>
              	 </tr>
	               
           </table><br />
           
           <table id="denyfields"  border="1" cellpadding="2" cellspacing="0" width="400" align="center" bordercolor="#cccccc" style="display : none;">
			   			<tr>
			   				<% //'CANCELLED_PERMANENT':'Permanent Cancellation', 'UNCLM_CANCELLED':'Temporary Cancellation' %>
			   				<td colspan="2"><table><s:radio name="denyPwtStatus" title="On selecting 'Temporary Cancellation' This Ticket No. and VIRN No. Will be Accepted in LMS in Future." id="denyTempPwtStatusId" list="{'Temporary Cancellation'}"   onclick="return confirm('On selecting Temporary Cancellation This Ticket No. and VIRN No. Will be Accepted in LMS in Future.')" /></table></td>
			   			</tr>
			   			<tr>
			   				<% //'CANCELLED_PERMANENT':'Permanent Cancellation', 'UNCLM_CANCELLED':'Temporary Cancellation' %>
			   				<td colspan="2"><table><s:radio name="denyPwtStatus" title="On selecting 'Permanent Cancellation' This Ticket No. and VIRN No. Will Never be Accepted in LMS in Future." id="denyPwtStatusId" list="{'Permanent Cancellation'}"  onclick="return confirm('On selecting Permanent Cancellation This Ticket No. and VIRN No. Will Never be Accepted in LMS in Future.')"/></table></td>
			   			</tr>
			   			<tr><td align="left" colspan="2"><input type="button" onclick="return denyRequest()"  id="subTransDeny" value="Deny Request" class="button"/></td></tr>			   			
			</table>
           
           </s:form>     
         </s:div>
         
      </div>
      </div>
     
     
   </body>



</HTML>
<code id="headId" style="visibility: hidden">
$RCSfile: BOPwtForApproveSearch.jsp,v $
$Revision: 1.1.2.1.6.3 $
</code>