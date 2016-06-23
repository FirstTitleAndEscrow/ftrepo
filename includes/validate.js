/////////////////////////////////////////////////////////////////////////////////////////////////
//GENERAL FUNCTIONS

function Trim(nStr){
	return nStr.replace(/(^\s*)|(\s*$)/g,"");
}
function checkEmail(obj){
	var exp = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
	if (!exp.test(obj.value)){
		alert("Please enter a valid Email.");
		//obj.focus();
		return true;
	}
	else
		return false;
}
function isNull(obj,msg){
	obj1= Trim(obj.value);
	if (obj1=="" || obj1=="<br>"){
		if(obj.type!="select-one" && obj.type!="file")
			alert("Please enter the " +msg+".");
		else
			alert("Please select the " +msg+".");
		obj.focus();
		return true;
	}
	else {
		if(msg=="Email")
			return checkEmail(obj);
		else
			return false;
	}
}
function isLen(obj,siz,msg){
	if(msg!="Password")
		obj1=Trim(obj.value);
	else
		obj1=obj.value;
	if(obj1!=""){
		var strLen=obj.value;
		if(strLen.length < siz){
			alert(msg+" should be atleast " + siz + " Characters.");
			obj.focus();
			return true;  
		} 
	}
	else
		return false;
}
function checkAll(obj,arg){
	if(obj) {
		if(obj.length){
			for(i=0;i<obj.length;i++){
				obj[i].checked=arg;
			}
		}
		else obj.checked=arg;
	}
}
function notChecked(obj,msg){
	checked = false;
	if(obj) {
		if(obj.length){
			for(i=0;i<obj.length;i++){
				if(obj[i].checked){
					checked = true;
					break;
				}
			}
		}
		else if(obj.checked)
			checked = true;
		if(!(checked)){
			alert("Please select the "+msg+".");
			if(obj.length)
				obj[0].focus();
			else
				obj.focus();
			if(document.getElementById('Action'))
				document.getElementById('Action').value="";
			return true;
		}
	}
}
function fnChkNum(obj){
	exp = /^[\d]/;
	if (!exp.test(obj.value)){
		alert("Please enter only numeric values.");
		obj.focus();
		return true;
	}
	else
		return false;
}
function fnChkAlpha(obj){
	exp = (/(^([a-z]|[A-Z]|["."]|[\s])*$)/);
	if (!exp.test(obj.value))
	{
		alert("Please enter only alphabets.");
		obj.focus();
		return true;
	}
	else
		return false;
}	
function fnChkAlphaNumeric(obj){
	exp = (/(^([a-z]|[A-Z]|[0-9])*$)/);
	if (!exp.test(obj.value)){
		alert("Please enter only alphabets and numbers.");
		obj.focus();
		return true;
	}
	else
		return false;
}
function AllowNumeric(e) {
	var iKeyCode = 0;
	if (window.event)
		iKeyCode = window.event.keyCode
	else if (e)
		iKeyCode = e.which;
	
	if (iKeyCode > 47 && iKeyCode < 58 || iKeyCode == 0 || iKeyCode == 8)
		return true
	else
		return false;
	
}

function fnNewsletter()
{
	if(document.getElementById('newsletter_email').value=="" || document.getElementById('newsletter_email').value=="youremail@domain.com"){ alert("Please enter your Email."); document.getElementById('newsletter_email').focus(); return false; }
	if(isNull(getElementById('newsletter_email'),"Email")){ return false; }
}

