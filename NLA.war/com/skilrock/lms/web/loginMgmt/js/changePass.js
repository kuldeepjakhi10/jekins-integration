var i18nOb = top.frames[0].i18Obj;

function initialFocus()
{
 document.changePass.password.focus();
}
function isST3Filled()
{
 
  var isInValid = false;
  if(document.changePass.password.value=="")
  {
       isInValid = true;
        document.getElementById("oldPass").innerHTML = "<font color = 'red'>"+i18nOb.prop('error.enter.old.pass')+"</font>";
             
  }
   else
   {
   
      if(document.changePass.password.value.length<8)
        { 
         document.getElementById("oldPass").innerHTML = "<font color = 'red'>"+i18nOb.prop('error.pass.should.be.eight.digit')+"</font>";
         document.changePass.password.value="";
         document.changePass.newPassword.value="";
         document.changePass.verifynewPassword.value="";
         isInValid = true;
        }
        else
        {
         document.getElementById("oldPass").innerHTML = "";
        }
    }
    
     if(document.changePass.newPassword.value=="")
     {
         document.getElementById("newPass").innerHTML = "<font color = 'red'>"+i18nOb.prop('error.enterNew.pass')+"</font>";
         isInValid = true;      
     }
     else
     {
      if(document.changePass.newPassword.value.length<8)
        { 
         document.getElementById("newPass").innerHTML = "<font color = 'red'>"+i18nOb.prop('error.pass.should.be.eight.digit')+"</font>";
         document.changePass.password.value="";
         document.changePass.newPassword.value="";
         document.changePass.verifynewPassword.value="";
         isInValid = true;
        }
        else
        {          
         document.getElementById("newPass").innerHTML = "";
        } 
     }
    
    
    if(document.changePass.verifynewPassword.value=="")
     {
         document.getElementById("verifyPass").innerHTML = "<font color = 'red'>"+i18nOb.prop('error.verifyNew.pass')+"</font>";
          document.changePass.password.value="";
         document.changePass.newPassword.value="";
         document.changePass.verifynewPassword.value="";
         isInValid = true;      
     }
     else
     {
     
      if(document.changePass.verifynewPassword.value==document.changePass.newPassword.value)
        {
          if(document.changePass.password.value==document.changePass.newPassword.value)
          {
            document.getElementById("currentPass").innerHTML = "<font color='Red'>"+i18nOb.prop('error.newPass.cannot.be.same.old.pass')+"!!";
            document.getElementById("verifyPass").innerHTML ="";
            document.changePass.password.value="";
         document.changePass.newPassword.value="";
         document.changePass.verifynewPassword.value="";
            isInValid = true;
          }
          else
            {
             document.getElementById("verifyPass").innerHTML = "";
            }
        }
    
       else
         {
          document.getElementById("verifyPass").innerHTML = "<font color = 'red'>"+i18nOb.prop('error.verifyNew.pass')+"</font>";
          document.getElementById("currentPass").innerHTML ="";
           document.changePass.password.value="";
         document.changePass.newPassword.value="";
         document.changePass.verifynewPassword.value="";
          isInValid = true;
         }
         
       
      }
    
    
    
    if(isInValid){
		return false;
		}
				
		return true;
}		




parent.frames[0].Version['$Source: /rep/LMS_Mgmt/WebRoot/com/skilrock/lms/web/loginMgmt/js/changePass.js,v $'] = '$Id: changePass.js,v 1.1.2.1.16.1.2.2 2015/03/25 13:31:08 gauravk Exp $';
