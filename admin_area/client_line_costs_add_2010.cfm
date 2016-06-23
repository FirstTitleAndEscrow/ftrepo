<CFQUERY datasource="#request.dsn#" NAME="read_company">
	SELECT *
	FROM companies
	WHERE ID = #company_id#
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_user">
		SELECT *
		FROM First_Admin
		WHERE ID = '#URL.UID#'
</CFQUERY>
		
		
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE>First Title Services Admin</TITLE>

<style type="text/css">
<!--
body { margin:0px;padding:0px;font-family:arial,sans-serif;font-size:10px;}
table { font-size:10px;}
textarea { font-family:arial,sans-serif; font-size:10px; color:#004000; background:#cdfed0; border:1px dotted #004000; }
input.text, input.date, input.two_digit, input.four_digit { font-size:10px; font-style:italic; width:180px; color:#999999; background:#cdfed0; border:1px dotted #004000; }
input.textnormal, input.date, input.two_digit, input.four_digit { font-size:10px; font-style:normal; width:180px; color:#000000; background:#cdfed0; border:1px dotted #004000; }
input.small { font-size:10px; font-style:italic; width:100px; color:#999999;background:#cdfed0; border:1px dotted #004000; text-align:right; }
input.smallnormal { font-size:10px; width:100px; font-style:normal; color:#000000;background:#cdfed0; border:1px dotted #004000; text-align:right; }
input.check { font-size:10px; width:30px; color:#004000; border:1px dotted #004000; }
input.userout { font-size:10px; width:160px; color:#400000; background:#ffdfdf; border:1px dotted #400000; }
input.userin { font-size:10px; width:180px; color:#400000; background:#ffdfdf; border:1px dotted #400000; }
p.pagebreak { page-break-before:always }
.page_container { width:1330px; }																			 
.page_title { font-size:14px; }
.table_header { font-weight:bold; background-color:black; color:white; }
.bsilver { border-right:1px solid black; border-left:1px solid black; border-bottom:1px solid black;  background-color:#dddddd; }
.bdarksilver { border:1px solid black; background-color:#bbbbbb; }
.bdarksilver_head { border:1px solid black; font-weight:bold; background-color:#bbbbbb; }
.black { font-weight:bold; background-color:black; color:white; }
.bordered { border-bottom:1px solid black; border-right:1px solid black; text-align:right; vertical-align:bottom;  }
.bordered_wleft { border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; text-align:right; vertical-align:bottom;  }
-->
</style>

<script language="javascript">
function focus_this(name_of_field, class_name) {
name_of_field.className=class_name;
if (name_of_field.value == 'Payee Name' || name_of_field.value == 'Description of Charge' || name_of_field.value == 'Charge Amount') {
name_of_field.value='';
} else {
name_of_field.select();
}
}


function unfocus_this(name_of_field, default_text, class_name) {
if (name_of_field.value == '') {
name_of_field.value='' +default_text+ '';
name_of_field.className=class_name;
}
}

function IsNumeric(str)
// returns true if str is numeric
// that is it contains only the digits 0-9
// returns false otherwise
// returns false if empty
{
  var len= str.length;


  if (len==0)
    return false;
  //else
  var p=0;
  var ok= true;
  var ch= "";
  while (ok && p<len)
  {
    ch= str.charAt(p);
    if ('0'<=ch && ch<='9' || ch=='.' || ch=='-')
      p++;
    else
      ok= false;
  }
  return ok;
}


function roundit(n) { 

  ans = n * 1000 
  ans = Math.round(ans /10) + "" 
  while (ans.length < 3) {ans = "0" + ans} 
  len = ans.length 
  ans = ans.substring(0,len-2) + "." + ans.substring(len-2,len)
  return ans 
} 

function roll_up_1101_purchase() {
var temp = 0;
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_01_PURCHASE.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_01_PURCHASE.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_01_PURCHASE.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_02_PURCHASE.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_02_PURCHASE.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_02_PURCHASE.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_03_PURCHASE.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_03_PURCHASE.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_03_PURCHASE.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_04_PURCHASE.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_04_PURCHASE.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_04_PURCHASE.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_05_PURCHASE.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_05_PURCHASE.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_05_PURCHASE.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_06_PURCHASE.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_06_PURCHASE.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_06_PURCHASE.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_07_PURCHASE.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_07_PURCHASE.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_07_PURCHASE.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_08_PURCHASE.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_08_PURCHASE.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_08_PURCHASE.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_09_PURCHASE.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_09_PURCHASE.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_09_PURCHASE.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_10_PURCHASE.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_10_PURCHASE.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_10_PURCHASE.value);
    }
	
if (parseFloat(temp) != 0 && temp != '') {
document.frm.A_1101_AMOUNT_PURCHASE.value = parseFloat(temp);
} else {
document.frm.A_1101_AMOUNT_PURCHASE.value = '';
}


}


function roll_up_1101_2nd_no_ti() {
var temp = 0;
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_01_2ND_NO_TI.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_01_2ND_NO_TI.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_01_2ND_NO_TI.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_02_2ND_NO_TI.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_02_2ND_NO_TI.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_02_2ND_NO_TI.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_03_2ND_NO_TI.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_03_2ND_NO_TI.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_03_2ND_NO_TI.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_04_2ND_NO_TI.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_04_2ND_NO_TI.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_04_2ND_NO_TI.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_05_2ND_NO_TI.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_05_2ND_NO_TI.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_05_2ND_NO_TI.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_06_2ND_NO_TI.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_06_2ND_NO_TI.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_06_2ND_NO_TI.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_07_2ND_NO_TI.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_07_2ND_NO_TI.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_07_2ND_NO_TI.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_08_2ND_NO_TI.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_08_2ND_NO_TI.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_08_2ND_NO_TI.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_09_2ND_NO_TI.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_09_2ND_NO_TI.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_09_2ND_NO_TI.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_10_2ND_NO_TI.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_10_2ND_NO_TI.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_10_2ND_NO_TI.value);
    }
	
if (parseFloat(temp) != 0 && temp != '') {
document.frm.A_1101_AMOUNT_2ND_NO_TI.value = parseFloat(temp);
} else {
document.frm.A_1101_AMOUNT_2ND_NO_TI.value = '';
}


}


function roll_up_1101_2nd_with_ti() {
var temp = 0;
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_01_2ND_WITH_TI.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_01_2ND_WITH_TI.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_01_2ND_WITH_TI.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_02_2ND_WITH_TI.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_02_2ND_WITH_TI.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_02_2ND_WITH_TI.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_03_2ND_WITH_TI.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_03_2ND_WITH_TI.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_03_2ND_WITH_TI.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_04_2ND_WITH_TI.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_04_2ND_WITH_TI.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_04_2ND_WITH_TI.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_05_2ND_WITH_TI.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_05_2ND_WITH_TI.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_05_2ND_WITH_TI.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_06_2ND_WITH_TI.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_06_2ND_WITH_TI.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_06_2ND_WITH_TI.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_07_2ND_WITH_TI.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_07_2ND_WITH_TI.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_07_2ND_WITH_TI.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_08_2ND_WITH_TI.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_08_2ND_WITH_TI.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_08_2ND_WITH_TI.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_09_2ND_WITH_TI.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_09_2ND_WITH_TI.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_09_2ND_WITH_TI.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_10_2ND_WITH_TI.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_10_2ND_WITH_TI.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_10_2ND_WITH_TI.value);
    }
	
if (parseFloat(temp) != 0 && temp != '') {
document.frm.A_1101_AMOUNT_2ND_WITH_TI.value = parseFloat(temp);
} else {
document.frm.A_1101_AMOUNT_2ND_WITH_TI.value = '';
}


}


function roll_up_1101_purchase_seller() {
var temp = 0;
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_01_PURCHASE_SELLER.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_01_PURCHASE_SELLER.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_01_PURCHASE_SELLER.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_02_PURCHASE_SELLER.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_02_PURCHASE_SELLER.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_02_PURCHASE_SELLER.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_03_PURCHASE_SELLER.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_03_PURCHASE_SELLER.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_03_PURCHASE_SELLER.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_04_PURCHASE_SELLER.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_04_PURCHASE_SELLER.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_04_PURCHASE_SELLER.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_05_PURCHASE_SELLER.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_05_PURCHASE_SELLER.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_05_PURCHASE_SELLER.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_06_PURCHASE_SELLER.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_06_PURCHASE_SELLER.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_06_PURCHASE_SELLER.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_07_PURCHASE_SELLER.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_07_PURCHASE_SELLER.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_07_PURCHASE_SELLER.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_08_PURCHASE_SELLER.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_08_PURCHASE_SELLER.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_08_PURCHASE_SELLER.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_09_PURCHASE_SELLER.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_09_PURCHASE_SELLER.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_09_PURCHASE_SELLER.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_10_PURCHASE_SELLER.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_10_PURCHASE_SELLER.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_10_PURCHASE_SELLER.value);
    }
	
if (parseFloat(temp) != 0 && temp != '') {
document.frm.A_1101_AMOUNT_PURCHASE_SELLER.value = parseFloat(temp);
} else {
document.frm.A_1101_AMOUNT_PURCHASE_SELLER.value = '';
}


}

function roll_up_1101_refinance() {
var temp = 0;
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_01_REFINANCE.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_01_REFINANCE.value != '' 
	&& document.frm.A_1101_ITEM_AMOUNT_01_REFINANCE.value != 'Charge Amount') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_01_REFINANCE.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_02_REFINANCE.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_02_REFINANCE.value != '' 
	&& document.frm.A_1101_ITEM_AMOUNT_02_REFINANCE.value != 'Charge Amount') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_02_REFINANCE.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_03_REFINANCE.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_03_REFINANCE.value != '' 
	&& document.frm.A_1101_ITEM_AMOUNT_03_REFINANCE.value != 'Charge Amount') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_03_REFINANCE.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_04_REFINANCE.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_04_REFINANCE.value != '' 
	&& document.frm.A_1101_ITEM_AMOUNT_04_REFINANCE.value != 'Charge Amount') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_04_REFINANCE.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_05_REFINANCE.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_05_REFINANCE.value != '' 
	&& document.frm.A_1101_ITEM_AMOUNT_05_REFINANCE.value != 'Charge Amount') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_05_REFINANCE.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_06_REFINANCE.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_06_REFINANCE.value != '' 
	&& document.frm.A_1101_ITEM_AMOUNT_06_REFINANCE.value != 'Charge Amount') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_06_REFINANCE.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_07_REFINANCE.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_07_REFINANCE.value != '' 
	&& document.frm.A_1101_ITEM_AMOUNT_07_REFINANCE.value != 'Charge Amount') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_07_REFINANCE.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_08_REFINANCE.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_08_REFINANCE.value != '' 
	&& document.frm.A_1101_ITEM_AMOUNT_08_REFINANCE.value != 'Charge Amount') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_08_REFINANCE.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_09_REFINANCE.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_09_REFINANCE.value != '' 
	&& document.frm.A_1101_ITEM_AMOUNT_09_REFINANCE.value != 'Charge Amount') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_09_REFINANCE.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_10_REFINANCE.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_10_REFINANCE.value != '' 
	&& document.frm.A_1101_ITEM_AMOUNT_10_REFINANCE.value != 'Charge Amount') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_10_REFINANCE.value);
    }
	
if (parseFloat(temp) != 0 && temp != '') {
document.frm.A_1101_AMOUNT_REFINANCE.value = parseFloat(temp);
document.frm.A_1101_AMOUNT_REFINANCE.className='smallnormal';
} else {
document.frm.A_1101_AMOUNT_REFINANCE.value = 'Charge Amount';
document.frm.A_1101_AMOUNT_REFINANCE.className='small';
}
roll_up_1101_purchase();
roll_up_1101_2nd_no_ti();
roll_up_1101_2nd_with_ti();
roll_up_1101_purchase_seller();

}



function a_801_amount(form) {
if (document.frm.A_0801_AMOUNT_REFINANCE.value != '' && document.frm.A_0801_AMOUNT_REFINANCE.value != 'Charge Amount') {
document.frm.A_0801_AMOUNT_PURCHASE.value = document.frm.A_0801_AMOUNT_REFINANCE.value;
document.frm.A_0801_AMOUNT_2ND_NO_TI.value = document.frm.A_0801_AMOUNT_REFINANCE.value;
document.frm.A_0801_AMOUNT_2ND_WITH_TI.value = document.frm.A_0801_AMOUNT_REFINANCE.value;
} else { 
document.frm.A_0801_AMOUNT_PURCHASE.value = '';
document.frm.A_0801_AMOUNT_2ND_NO_TI.value = '';
document.frm.A_0801_AMOUNT_2ND_WITH_TI.value = '';
}
}
function a_802_amount(form) {
if (document.frm.A_0802_AMOUNT_REFINANCE.value != '' && document.frm.A_0802_AMOUNT_REFINANCE.value != 'Charge Amount') {
document.frm.A_0802_AMOUNT_PURCHASE.value = document.frm.A_0802_AMOUNT_REFINANCE.value;
document.frm.A_0802_AMOUNT_2ND_NO_TI.value = document.frm.A_0802_AMOUNT_REFINANCE.value;
document.frm.A_0802_AMOUNT_2ND_WITH_TI.value = document.frm.A_0802_AMOUNT_REFINANCE.value;
} else { 
document.frm.A_0802_AMOUNT_PURCHASE.value = '';
document.frm.A_0802_AMOUNT_2ND_NO_TI.value = '';
document.frm.A_0802_AMOUNT_2ND_WITH_TI.value = '';
}
}
function a_804_amount(form) {
if (document.frm.A_0804_AMOUNT_REFINANCE.value != '' && document.frm.A_0804_AMOUNT_REFINANCE.value != 'Charge Amount') {
document.frm.A_0804_AMOUNT_PURCHASE.value = document.frm.A_0804_AMOUNT_REFINANCE.value;
document.frm.A_0804_AMOUNT_2ND_NO_TI.value = document.frm.A_0804_AMOUNT_REFINANCE.value;
document.frm.A_0804_AMOUNT_2ND_WITH_TI.value = document.frm.A_0804_AMOUNT_REFINANCE.value;
} else { 
document.frm.A_0804_AMOUNT_PURCHASE.value = '';
document.frm.A_0804_AMOUNT_2ND_NO_TI.value = '';
document.frm.A_0804_AMOUNT_2ND_WITH_TI.value = '';
}
}
function a_805_amount(form) {
if (document.frm.A_0805_AMOUNT_REFINANCE.value != '' && document.frm.A_0805_AMOUNT_REFINANCE.value != 'Charge Amount') {
document.frm.A_0805_AMOUNT_PURCHASE.value = document.frm.A_0805_AMOUNT_REFINANCE.value;
document.frm.A_0805_AMOUNT_2ND_NO_TI.value = document.frm.A_0805_AMOUNT_REFINANCE.value;
document.frm.A_0805_AMOUNT_2ND_WITH_TI.value = document.frm.A_0805_AMOUNT_REFINANCE.value;
} else { 
document.frm.A_0805_AMOUNT_PURCHASE.value = '';
document.frm.A_0805_AMOUNT_2ND_NO_TI.value = '';
document.frm.A_0805_AMOUNT_2ND_WITH_TI.value = '';
}
}
function a_806_amount(form) {
if (document.frm.A_0806_AMOUNT_REFINANCE.value != '' && document.frm.A_0806_AMOUNT_REFINANCE.value != 'Charge Amount') {
document.frm.A_0806_AMOUNT_PURCHASE.value = document.frm.A_0806_AMOUNT_REFINANCE.value;
document.frm.A_0806_AMOUNT_2ND_NO_TI.value = document.frm.A_0806_AMOUNT_REFINANCE.value;
document.frm.A_0806_AMOUNT_2ND_WITH_TI.value = document.frm.A_0806_AMOUNT_REFINANCE.value;
} else { 
document.frm.A_0806_AMOUNT_PURCHASE.value = '';
document.frm.A_0806_AMOUNT_2ND_NO_TI.value = '';
document.frm.A_0806_AMOUNT_2ND_WITH_TI.value = '';
}
}
function a_807_amount(form) {
if (document.frm.A_0807_AMOUNT_REFINANCE.value != '' && document.frm.A_0807_AMOUNT_REFINANCE.value != 'Charge Amount') {
document.frm.A_0807_AMOUNT_PURCHASE.value = document.frm.A_0807_AMOUNT_REFINANCE.value;
document.frm.A_0807_AMOUNT_2ND_NO_TI.value = document.frm.A_0807_AMOUNT_REFINANCE.value;
document.frm.A_0807_AMOUNT_2ND_WITH_TI.value = document.frm.A_0807_AMOUNT_REFINANCE.value;
} else { 
document.frm.A_0807_AMOUNT_PURCHASE.value = '';
document.frm.A_0807_AMOUNT_2ND_NO_TI.value = '';
document.frm.A_0807_AMOUNT_2ND_WITH_TI.value = '';
}
}
function a_808_amount(form) {
if (document.frm.A_0808_AMOUNT_REFINANCE.value != '' && document.frm.A_0808_AMOUNT_REFINANCE.value != 'Charge Amount') {
document.frm.A_0808_AMOUNT_PURCHASE.value = document.frm.A_0808_AMOUNT_REFINANCE.value;
document.frm.A_0808_AMOUNT_2ND_NO_TI.value = document.frm.A_0808_AMOUNT_REFINANCE.value;
document.frm.A_0808_AMOUNT_2ND_WITH_TI.value = document.frm.A_0808_AMOUNT_REFINANCE.value;
} else { 
document.frm.A_0808_AMOUNT_PURCHASE.value = '';
document.frm.A_0808_AMOUNT_2ND_NO_TI.value = '';
document.frm.A_0808_AMOUNT_2ND_WITH_TI.value = '';
}
}
function a_809_amount(form) {
if (document.frm.A_0809_AMOUNT_REFINANCE.value != '' && document.frm.A_0809_AMOUNT_REFINANCE.value != 'Charge Amount') {
document.frm.A_0809_AMOUNT_PURCHASE.value = document.frm.A_0809_AMOUNT_REFINANCE.value;
document.frm.A_0809_AMOUNT_2ND_NO_TI.value = document.frm.A_0809_AMOUNT_REFINANCE.value;
document.frm.A_0809_AMOUNT_2ND_WITH_TI.value = document.frm.A_0809_AMOUNT_REFINANCE.value;
} else { 
document.frm.A_0809_AMOUNT_PURCHASE.value = '';
document.frm.A_0809_AMOUNT_2ND_NO_TI.value = '';
document.frm.A_0809_AMOUNT_2ND_WITH_TI.value = '';
}
}
function a_810_amount(form) {
if (document.frm.A_0810_AMOUNT_REFINANCE.value != '' && document.frm.A_0810_AMOUNT_REFINANCE.value != 'Charge Amount') {
document.frm.A_0810_AMOUNT_PURCHASE.value = document.frm.A_0810_AMOUNT_REFINANCE.value;
document.frm.A_0810_AMOUNT_2ND_NO_TI.value = document.frm.A_0810_AMOUNT_REFINANCE.value;
document.frm.A_0810_AMOUNT_2ND_WITH_TI.value = document.frm.A_0810_AMOUNT_REFINANCE.value;
} else { 
document.frm.A_0810_AMOUNT_PURCHASE.value = '';
document.frm.A_0810_AMOUNT_2ND_NO_TI.value = '';
document.frm.A_0810_AMOUNT_2ND_WITH_TI.value = '';
}
}
function a_811_amount(form) {
if (document.frm.A_0811_AMOUNT_REFINANCE.value != '' && document.frm.A_0811_AMOUNT_REFINANCE.value != 'Charge Amount') {
document.frm.A_0811_AMOUNT_PURCHASE.value = document.frm.A_0811_AMOUNT_REFINANCE.value;
document.frm.A_0811_AMOUNT_2ND_NO_TI.value = document.frm.A_0811_AMOUNT_REFINANCE.value;
document.frm.A_0811_AMOUNT_2ND_WITH_TI.value = document.frm.A_0811_AMOUNT_REFINANCE.value;
} else { 
document.frm.A_0811_AMOUNT_PURCHASE.value = '';
document.frm.A_0811_AMOUNT_2ND_NO_TI.value = '';
document.frm.A_0811_AMOUNT_2ND_WITH_TI.value = '';
}
}
function a_812_amount(form) {
if (document.frm.A_0812_AMOUNT_REFINANCE.value != '' && document.frm.A_0812_AMOUNT_REFINANCE.value != 'Charge Amount') {
document.frm.A_0812_AMOUNT_PURCHASE.value = document.frm.A_0812_AMOUNT_REFINANCE.value;
document.frm.A_0812_AMOUNT_2ND_NO_TI.value = document.frm.A_0812_AMOUNT_REFINANCE.value;
document.frm.A_0812_AMOUNT_2ND_WITH_TI.value = document.frm.A_0812_AMOUNT_REFINANCE.value;
} else { 
document.frm.A_0812_AMOUNT_PURCHASE.value = '';
document.frm.A_0812_AMOUNT_2ND_NO_TI.value = '';
document.frm.A_0812_AMOUNT_2ND_WITH_TI.value = '';
}
}


function a_1101_amount(form) {
if (document.frm.A_1101_AMOUNT_REFINANCE.value != '' && document.frm.A_1101_AMOUNT_REFINANCE.value != 'Charge Amount') {
document.frm.A_1101_AMOUNT_PURCHASE.value = document.frm.A_1101_AMOUNT_REFINANCE.value;
document.frm.A_1101_AMOUNT_2ND_NO_TI.value = document.frm.A_1101_AMOUNT_REFINANCE.value;
document.frm.A_1101_AMOUNT_2ND_WITH_TI.value = document.frm.A_1101_AMOUNT_REFINANCE.value;
} else { 
document.frm.A_1101_AMOUNT_PURCHASE.value = '';
document.frm.A_1101_AMOUNT_2ND_NO_TI.value = '';
document.frm.A_1101_AMOUNT_2ND_WITH_TI.value = '';
}
}
function a_1101_01_amount(form) {
if (document.frm.A_1101_ITEM_AMOUNT_01_REFINANCE.value != '' && document.frm.A_1101_ITEM_AMOUNT_01_REFINANCE.value != 'Description of Charge') {
document.frm.A_1101_ITEM_AMOUNT_01_PURCHASE.value = document.frm.A_1101_ITEM_AMOUNT_01_REFINANCE.value;
document.frm.A_1101_ITEM_AMOUNT_01_2ND_NO_TI.value = document.frm.A_1101_ITEM_AMOUNT_01_REFINANCE.value;
document.frm.A_1101_ITEM_AMOUNT_01_2ND_WITH_TI.value = document.frm.A_1101_ITEM_AMOUNT_01_REFINANCE.value;
} else { 
document.frm.A_1101_ITEM_AMOUNT_01_PURCHASE.value = '';
document.frm.A_1101_ITEM_AMOUNT_01_2ND_NO_TI.value = '';
document.frm.A_1101_ITEM_AMOUNT_01_2ND_WITH_TI.value = '';
}
}
function a_1101_02_amount(form) {
if (document.frm.A_1101_ITEM_AMOUNT_02_REFINANCE.value != '' && document.frm.A_1101_ITEM_AMOUNT_02_REFINANCE.value != 'Description of Charge') {
document.frm.A_1101_ITEM_AMOUNT_02_PURCHASE.value = document.frm.A_1101_ITEM_AMOUNT_02_REFINANCE.value;
document.frm.A_1101_ITEM_AMOUNT_02_2ND_NO_TI.value = document.frm.A_1101_ITEM_AMOUNT_02_REFINANCE.value;
document.frm.A_1101_ITEM_AMOUNT_02_2ND_WITH_TI.value = document.frm.A_1101_ITEM_AMOUNT_02_REFINANCE.value;
} else { 
document.frm.A_1101_ITEM_AMOUNT_02_PURCHASE.value = '';
document.frm.A_1101_ITEM_AMOUNT_02_2ND_NO_TI.value = '';
document.frm.A_1101_ITEM_AMOUNT_02_2ND_WITH_TI.value = '';
}
}
function a_1101_03_amount(form) {
if (document.frm.A_1101_ITEM_AMOUNT_03_REFINANCE.value != '' && document.frm.A_1101_ITEM_AMOUNT_03_REFINANCE.value != 'Description of Charge') {
document.frm.A_1101_ITEM_AMOUNT_03_PURCHASE.value = document.frm.A_1101_ITEM_AMOUNT_03_REFINANCE.value;
document.frm.A_1101_ITEM_AMOUNT_03_2ND_NO_TI.value = document.frm.A_1101_ITEM_AMOUNT_03_REFINANCE.value;
document.frm.A_1101_ITEM_AMOUNT_03_2ND_WITH_TI.value = document.frm.A_1101_ITEM_AMOUNT_03_REFINANCE.value;
} else { 
document.frm.A_1101_ITEM_AMOUNT_03_PURCHASE.value = '';
document.frm.A_1101_ITEM_AMOUNT_03_2ND_NO_TI.value = '';
document.frm.A_1101_ITEM_AMOUNT_03_2ND_WITH_TI.value = '';
}
}
function a_1101_04_amount(form) {
if (document.frm.A_1101_ITEM_AMOUNT_04_REFINANCE.value != '' && document.frm.A_1101_ITEM_AMOUNT_04_REFINANCE.value != 'Description of Charge') {
document.frm.A_1101_ITEM_AMOUNT_04_PURCHASE.value = document.frm.A_1101_ITEM_AMOUNT_04_REFINANCE.value;
document.frm.A_1101_ITEM_AMOUNT_04_2ND_NO_TI.value = document.frm.A_1101_ITEM_AMOUNT_04_REFINANCE.value;
document.frm.A_1101_ITEM_AMOUNT_04_2ND_WITH_TI.value = document.frm.A_1101_ITEM_AMOUNT_04_REFINANCE.value;
} else { 
document.frm.A_1101_ITEM_AMOUNT_04_PURCHASE.value = '';
document.frm.A_1101_ITEM_AMOUNT_04_2ND_NO_TI.value = '';
document.frm.A_1101_ITEM_AMOUNT_04_2ND_WITH_TI.value = '';
}
}
function a_1101_05_amount(form) {
if (document.frm.A_1101_ITEM_AMOUNT_05_REFINANCE.value != '' && document.frm.A_1101_ITEM_AMOUNT_05_REFINANCE.value != 'Description of Charge') {
document.frm.A_1101_ITEM_AMOUNT_05_PURCHASE.value = document.frm.A_1101_ITEM_AMOUNT_05_REFINANCE.value;
document.frm.A_1101_ITEM_AMOUNT_05_2ND_NO_TI.value = document.frm.A_1101_ITEM_AMOUNT_05_REFINANCE.value;
document.frm.A_1101_ITEM_AMOUNT_05_2ND_WITH_TI.value = document.frm.A_1101_ITEM_AMOUNT_05_REFINANCE.value;
} else { 
document.frm.A_1101_ITEM_AMOUNT_05_PURCHASE.value = '';
document.frm.A_1101_ITEM_AMOUNT_05_2ND_NO_TI.value = '';
document.frm.A_1101_ITEM_AMOUNT_05_2ND_WITH_TI.value = '';
}
}
function a_1101_06_amount(form) {
if (document.frm.A_1101_ITEM_AMOUNT_06_REFINANCE.value != '' && document.frm.A_1101_ITEM_AMOUNT_06_REFINANCE.value != 'Description of Charge') {
document.frm.A_1101_ITEM_AMOUNT_06_PURCHASE.value = document.frm.A_1101_ITEM_AMOUNT_06_REFINANCE.value;
document.frm.A_1101_ITEM_AMOUNT_06_2ND_NO_TI.value = document.frm.A_1101_ITEM_AMOUNT_06_REFINANCE.value;
document.frm.A_1101_ITEM_AMOUNT_06_2ND_WITH_TI.value = document.frm.A_1101_ITEM_AMOUNT_06_REFINANCE.value;
} else { 
document.frm.A_1101_ITEM_AMOUNT_06_PURCHASE.value = '';
document.frm.A_1101_ITEM_AMOUNT_06_2ND_NO_TI.value = '';
document.frm.A_1101_ITEM_AMOUNT_06_2ND_WITH_TI.value = '';
}
}
function a_1101_07_amount(form) {
if (document.frm.A_1101_ITEM_AMOUNT_07_REFINANCE.value != '' && document.frm.A_1101_ITEM_AMOUNT_07_REFINANCE.value != 'Description of Charge') {
document.frm.A_1101_ITEM_AMOUNT_07_PURCHASE.value = document.frm.A_1101_ITEM_AMOUNT_07_REFINANCE.value;
document.frm.A_1101_ITEM_AMOUNT_07_2ND_NO_TI.value = document.frm.A_1101_ITEM_AMOUNT_07_REFINANCE.value;
document.frm.A_1101_ITEM_AMOUNT_07_2ND_WITH_TI.value = document.frm.A_1101_ITEM_AMOUNT_07_REFINANCE.value;
} else { 
document.frm.A_1101_ITEM_AMOUNT_07_PURCHASE.value = '';
document.frm.A_1101_ITEM_AMOUNT_07_2ND_NO_TI.value = '';
document.frm.A_1101_ITEM_AMOUNT_07_2ND_WITH_TI.value = '';
}
}
function a_1101_08_amount(form) {
if (document.frm.A_1101_ITEM_AMOUNT_08_REFINANCE.value != '' && document.frm.A_1101_ITEM_AMOUNT_08_REFINANCE.value != 'Description of Charge') {
document.frm.A_1101_ITEM_AMOUNT_08_PURCHASE.value = document.frm.A_1101_ITEM_AMOUNT_08_REFINANCE.value;
document.frm.A_1101_ITEM_AMOUNT_08_2ND_NO_TI.value = document.frm.A_1101_ITEM_AMOUNT_08_REFINANCE.value;
document.frm.A_1101_ITEM_AMOUNT_08_2ND_WITH_TI.value = document.frm.A_1101_ITEM_AMOUNT_08_REFINANCE.value;
} else { 
document.frm.A_1101_ITEM_AMOUNT_08_PURCHASE.value = '';
document.frm.A_1101_ITEM_AMOUNT_08_2ND_NO_TI.value = '';
document.frm.A_1101_ITEM_AMOUNT_08_2ND_WITH_TI.value = '';
}
}
function a_1101_09_amount(form) {
if (document.frm.A_1101_ITEM_AMOUNT_09_REFINANCE.value != '' && document.frm.A_1101_ITEM_AMOUNT_09_REFINANCE.value != 'Description of Charge') {
document.frm.A_1101_ITEM_AMOUNT_09_PURCHASE.value = document.frm.A_1101_ITEM_AMOUNT_09_REFINANCE.value;
document.frm.A_1101_ITEM_AMOUNT_09_2ND_NO_TI.value = document.frm.A_1101_ITEM_AMOUNT_09_REFINANCE.value;
document.frm.A_1101_ITEM_AMOUNT_09_2ND_WITH_TI.value = document.frm.A_1101_ITEM_AMOUNT_09_REFINANCE.value;
} else { 
document.frm.A_1101_ITEM_AMOUNT_09_PURCHASE.value = '';
document.frm.A_1101_ITEM_AMOUNT_09_2ND_NO_TI.value = '';
document.frm.A_1101_ITEM_AMOUNT_09_2ND_WITH_TI.value = '';
}
}
function a_1101_10_amount(form) {
if (document.frm.A_1101_ITEM_AMOUNT_10_REFINANCE.value != '' && document.frm.A_1101_ITEM_AMOUNT_10_REFINANCE.value != 'Description of Charge') {
document.frm.A_1101_ITEM_AMOUNT_10_PURCHASE.value = document.frm.A_1101_ITEM_AMOUNT_10_REFINANCE.value;
document.frm.A_1101_ITEM_AMOUNT_10_2ND_NO_TI.value = document.frm.A_1101_ITEM_AMOUNT_10_REFINANCE.value;
document.frm.A_1101_ITEM_AMOUNT_10_2ND_WITH_TI.value = document.frm.A_1101_ITEM_AMOUNT_10_REFINANCE.value;
} else { 
document.frm.A_1101_ITEM_AMOUNT_10_PURCHASE.value = '';
document.frm.A_1101_ITEM_AMOUNT_10_2ND_NO_TI.value = '';
document.frm.A_1101_ITEM_AMOUNT_10_2ND_WITH_TI.value = '';
}
}
function a_1102_amount(form) {
if (document.frm.A_1102_AMOUNT_REFINANCE.value != '' && document.frm.A_1102_AMOUNT_REFINANCE.value != 'Charge Amount') {
document.frm.A_1102_AMOUNT_PURCHASE.value = document.frm.A_1102_AMOUNT_REFINANCE.value;
document.frm.A_1102_AMOUNT_2ND_NO_TI.value = document.frm.A_1102_AMOUNT_REFINANCE.value;
document.frm.A_1102_AMOUNT_2ND_WITH_TI.value = document.frm.A_1102_AMOUNT_REFINANCE.value;
} else { 
document.frm.A_1102_AMOUNT_PURCHASE.value = '';
document.frm.A_1102_AMOUNT_2ND_NO_TI.value = '';
document.frm.A_1102_AMOUNT_2ND_WITH_TI.value = '';
}
}
function a_1102A_amount(form) {
if (document.frm.A_1102A_AMOUNT_REFINANCE.value != '' && document.frm.A_1102A_AMOUNT_REFINANCE.value != 'Charge Amount') {
document.frm.A_1102A_AMOUNT_PURCHASE.value = document.frm.A_1102A_AMOUNT_REFINANCE.value;
document.frm.A_1102A_AMOUNT_2ND_NO_TI.value = document.frm.A_1102A_AMOUNT_REFINANCE.value;
document.frm.A_1102A_AMOUNT_2ND_WITH_TI.value = document.frm.A_1102A_AMOUNT_REFINANCE.value;
} else {
document.frm.A_1102A_AMOUNT_PURCHASE.value = '';
document.frm.A_1102A_AMOUNT_2ND_NO_TI.value = '';
document.frm.A_1102A_AMOUNT_2ND_WITH_TI.value = '';
}
}
function a_1102B_amount(form) {
if (document.frm.A_1102B_AMOUNT_REFINANCE.value != '' && document.frm.A_1102B_AMOUNT_REFINANCE.value != 'Charge Amount') {
document.frm.A_1102B_AMOUNT_PURCHASE.value = document.frm.A_1102B_AMOUNT_REFINANCE.value;
document.frm.A_1102B_AMOUNT_2ND_NO_TI.value = document.frm.A_1102B_AMOUNT_REFINANCE.value;
document.frm.A_1102B_AMOUNT_2ND_WITH_TI.value = document.frm.A_1102B_AMOUNT_REFINANCE.value;
} else {
document.frm.A_1102B_AMOUNT_PURCHASE.value = '';
document.frm.A_1102B_AMOUNT_2ND_NO_TI.value = '';
document.frm.A_1102B_AMOUNT_2ND_WITH_TI.value = '';
}
}
function a_1102C_amount(form) {
if (document.frm.A_1102C_AMOUNT_REFINANCE.value != '' && document.frm.A_1102C_AMOUNT_REFINANCE.value != 'Charge Amount') {
document.frm.A_1102C_AMOUNT_PURCHASE.value = document.frm.A_1102C_AMOUNT_REFINANCE.value;
document.frm.A_1102C_AMOUNT_2ND_NO_TI.value = document.frm.A_1102C_AMOUNT_REFINANCE.value;
document.frm.A_1102C_AMOUNT_2ND_WITH_TI.value = document.frm.A_1102C_AMOUNT_REFINANCE.value;
} else {
document.frm.A_1102C_AMOUNT_PURCHASE.value = '';
document.frm.A_1102C_AMOUNT_2ND_NO_TI.value = '';
document.frm.A_1102C_AMOUNT_2ND_WITH_TI.value = '';
}
}
function a_1102D_amount(form) {
if (document.frm.A_1102D_AMOUNT_REFINANCE.value != '' && document.frm.A_1102D_AMOUNT_REFINANCE.value != 'Charge Amount') {
document.frm.A_1102D_AMOUNT_PURCHASE.value = document.frm.A_1102D_AMOUNT_REFINANCE.value;
document.frm.A_1102D_AMOUNT_2ND_NO_TI.value = document.frm.A_1102D_AMOUNT_REFINANCE.value;
document.frm.A_1102D_AMOUNT_2ND_WITH_TI.value = document.frm.A_1102D_AMOUNT_REFINANCE.value;
} else {
document.frm.A_1102D_AMOUNT_PURCHASE.value = '';
document.frm.A_1102D_AMOUNT_2ND_NO_TI.value = '';
document.frm.A_1102D_AMOUNT_2ND_WITH_TI.value = '';
}
}
function a_1102E_amount(form) {
if (document.frm.A_1102E_AMOUNT_REFINANCE.value != '' && document.frm.A_1102E_AMOUNT_REFINANCE.value != 'Charge Amount') {
document.frm.A_1102E_AMOUNT_PURCHASE.value = document.frm.A_1102E_AMOUNT_REFINANCE.value;
document.frm.A_1102E_AMOUNT_2ND_NO_TI.value = document.frm.A_1102E_AMOUNT_REFINANCE.value;
document.frm.A_1102E_AMOUNT_2ND_WITH_TI.value = document.frm.A_1102E_AMOUNT_REFINANCE.value;
} else {
document.frm.A_1102E_AMOUNT_PURCHASE.value = '';
document.frm.A_1102E_AMOUNT_2ND_NO_TI.value = '';
document.frm.A_1102E_AMOUNT_2ND_WITH_TI.value = '';
}
}
function a_1102F_amount(form) {
if (document.frm.A_1102F_AMOUNT_REFINANCE.value != '' && document.frm.A_1102F_AMOUNT_REFINANCE.value != 'Charge Amount') {
document.frm.A_1102F_AMOUNT_PURCHASE.value = document.frm.A_1102F_AMOUNT_REFINANCE.value;
document.frm.A_1102F_AMOUNT_2ND_NO_TI.value = document.frm.A_1102F_AMOUNT_REFINANCE.value;
document.frm.A_1102F_AMOUNT_2ND_WITH_TI.value = document.frm.A_1102F_AMOUNT_REFINANCE.value;
} else {
document.frm.A_1102F_AMOUNT_PURCHASE.value = '';
document.frm.A_1102F_AMOUNT_2ND_NO_TI.value = '';
document.frm.A_1102F_AMOUNT_2ND_WITH_TI.value = '';
}
}
function a_1102G_amount(form) {
if (document.frm.A_1102G_AMOUNT_REFINANCE.value != '' && document.frm.A_1102G_AMOUNT_REFINANCE.value != 'Charge Amount') {
document.frm.A_1102G_AMOUNT_PURCHASE.value = document.frm.A_1102G_AMOUNT_REFINANCE.value;
document.frm.A_1102G_AMOUNT_2ND_NO_TI.value = document.frm.A_1102G_AMOUNT_REFINANCE.value;
document.frm.A_1102G_AMOUNT_2ND_WITH_TI.value = document.frm.A_1102G_AMOUNT_REFINANCE.value;
} else {
document.frm.A_1102G_AMOUNT_PURCHASE.value = '';
document.frm.A_1102G_AMOUNT_2ND_NO_TI.value = '';
document.frm.A_1102G_AMOUNT_2ND_WITH_TI.value = '';
}
}
function a_1102H_amount(form) {
if (document.frm.A_1102H_AMOUNT_REFINANCE.value != '' && document.frm.A_1102H_AMOUNT_REFINANCE.value != 'Charge Amount') {
document.frm.A_1102H_AMOUNT_PURCHASE.value = document.frm.A_1102H_AMOUNT_REFINANCE.value;
document.frm.A_1102H_AMOUNT_2ND_NO_TI.value = document.frm.A_1102H_AMOUNT_REFINANCE.value;
document.frm.A_1102H_AMOUNT_2ND_WITH_TI.value = document.frm.A_1102H_AMOUNT_REFINANCE.value;
} else {
document.frm.A_1102H_AMOUNT_PURCHASE.value = '';
document.frm.A_1102H_AMOUNT_2ND_NO_TI.value = '';
document.frm.A_1102H_AMOUNT_2ND_WITH_TI.value = '';
}
}
function a_1102I_amount(form) {
if (document.frm.A_1102I_AMOUNT_REFINANCE.value != '' && document.frm.A_1102I_AMOUNT_REFINANCE.value != 'Charge Amount') {
document.frm.A_1102I_AMOUNT_PURCHASE.value = document.frm.A_1102I_AMOUNT_REFINANCE.value;
document.frm.A_1102I_AMOUNT_2ND_NO_TI.value = document.frm.A_1102I_AMOUNT_REFINANCE.value;
document.frm.A_1102I_AMOUNT_2ND_WITH_TI.value = document.frm.A_1102I_AMOUNT_REFINANCE.value;
} else {
document.frm.A_1102I_AMOUNT_PURCHASE.value = '';
document.frm.A_1102I_AMOUNT_2ND_NO_TI.value = '';
document.frm.A_1102I_AMOUNT_2ND_WITH_TI.value = '';
}
}
function a_1109_amount(form) {
if (document.frm.A_1109_AMOUNT_REFINANCE.value != '' && document.frm.A_1109_AMOUNT_REFINANCE.value != 'Charge Amount') {
document.frm.A_1109_AMOUNT_PURCHASE.value = document.frm.A_1109_AMOUNT_REFINANCE.value;
document.frm.A_1109_AMOUNT_2ND_NO_TI.value = document.frm.A_1109_AMOUNT_REFINANCE.value;
document.frm.A_1109_AMOUNT_2ND_WITH_TI.value = document.frm.A_1109_AMOUNT_REFINANCE.value;
} else { 
document.frm.A_1109_AMOUNT_PURCHASE.value = '';
document.frm.A_1109_AMOUNT_2ND_NO_TI.value = '';
document.frm.A_1109_AMOUNT_2ND_WITH_TI.value = '';
}
}
function a_1110_amount(form) {
if (document.frm.A_1110_AMOUNT_REFINANCE.value != '' && document.frm.A_1110_AMOUNT_REFINANCE.value != 'Charge Amount') {
document.frm.A_1110_AMOUNT_PURCHASE.value = document.frm.A_1110_AMOUNT_REFINANCE.value;
document.frm.A_1110_AMOUNT_2ND_NO_TI.value = document.frm.A_1110_AMOUNT_REFINANCE.value;
document.frm.A_1110_AMOUNT_2ND_WITH_TI.value = document.frm.A_1110_AMOUNT_REFINANCE.value;
} else { 
document.frm.A_1110_AMOUNT_PURCHASE.value = '';
document.frm.A_1110_AMOUNT_2ND_NO_TI.value = '';
document.frm.A_1110_AMOUNT_2ND_WITH_TI.value = '';
}
}
function a_1111_amount(form) {
if (document.frm.A_1111_AMOUNT_REFINANCE.value != '' && document.frm.A_1111_AMOUNT_REFINANCE.value != 'Charge Amount') {
document.frm.A_1111_AMOUNT_PURCHASE.value = document.frm.A_1111_AMOUNT_REFINANCE.value;
document.frm.A_1111_AMOUNT_2ND_NO_TI.value = document.frm.A_1111_AMOUNT_REFINANCE.value;
document.frm.A_1111_AMOUNT_2ND_WITH_TI.value = document.frm.A_1111_AMOUNT_REFINANCE.value;
} else { 
document.frm.A_1111_AMOUNT_PURCHASE.value = '';
document.frm.A_1111_AMOUNT_2ND_NO_TI.value = '';
document.frm.A_1111_AMOUNT_2ND_WITH_TI.value = '';
}
}
function a_1112_amount(form) {
if (document.frm.A_1112_AMOUNT_REFINANCE.value != '' && document.frm.A_1112_AMOUNT_REFINANCE.value != 'Charge Amount') {
document.frm.A_1112_AMOUNT_PURCHASE.value = document.frm.A_1112_AMOUNT_REFINANCE.value;
document.frm.A_1112_AMOUNT_2ND_NO_TI.value = document.frm.A_1112_AMOUNT_REFINANCE.value;
document.frm.A_1112_AMOUNT_2ND_WITH_TI.value = document.frm.A_1112_AMOUNT_REFINANCE.value;
} else { 
document.frm.A_1112_AMOUNT_PURCHASE.value = '';
document.frm.A_1112_AMOUNT_2ND_NO_TI.value = '';
document.frm.A_1112_AMOUNT_2ND_WITH_TI.value = '';
}
}
function a_1113_amount(form) {
if (document.frm.A_1113_AMOUNT_REFINANCE.value != '' && document.frm.A_1113_AMOUNT_REFINANCE.value != 'Charge Amount') {
document.frm.A_1113_AMOUNT_PURCHASE.value = document.frm.A_1113_AMOUNT_REFINANCE.value;
document.frm.A_1113_AMOUNT_2ND_NO_TI.value = document.frm.A_1113_AMOUNT_REFINANCE.value;
document.frm.A_1113_AMOUNT_2ND_WITH_TI.value = document.frm.A_1113_AMOUNT_REFINANCE.value;
} else { 
document.frm.A_1113_AMOUNT_PURCHASE.value = '';
document.frm.A_1113_AMOUNT_2ND_NO_TI.value = '';
document.frm.A_1113_AMOUNT_2ND_WITH_TI.value = '';
}
}

function a_1302_amount(form) {
if (document.frm.A_1302_AMOUNT_REFINANCE.value != '' && document.frm.A_1302_AMOUNT_REFINANCE.value != 'Charge Amount') {
document.frm.A_1302_AMOUNT_PURCHASE.value = document.frm.A_1302_AMOUNT_REFINANCE.value;
document.frm.A_1302_AMOUNT_2ND_NO_TI.value = document.frm.A_1302_AMOUNT_REFINANCE.value;
document.frm.A_1302_AMOUNT_2ND_WITH_TI.value = document.frm.A_1302_AMOUNT_REFINANCE.value;
} else { 
document.frm.A_1302_AMOUNT_PURCHASE.value = '';
document.frm.A_1302_AMOUNT_2ND_NO_TI.value = '';
document.frm.A_1302_AMOUNT_2ND_WITH_TI.value = '';
}
}
function a_1303_amount(form) {
if (document.frm.A_1303_AMOUNT_REFINANCE.value != '' && document.frm.A_1303_AMOUNT_REFINANCE.value != 'Charge Amount') {
document.frm.A_1303_AMOUNT_PURCHASE.value = document.frm.A_1303_AMOUNT_REFINANCE.value;
document.frm.A_1303_AMOUNT_2ND_NO_TI.value = document.frm.A_1303_AMOUNT_REFINANCE.value;
document.frm.A_1303_AMOUNT_2ND_WITH_TI.value = document.frm.A_1303_AMOUNT_REFINANCE.value;
} else { 
document.frm.A_1303_AMOUNT_PURCHASE.value = '';
document.frm.A_1303_AMOUNT_2ND_NO_TI.value = '';
document.frm.A_1303_AMOUNT_2ND_WITH_TI.value = '';
}
}
function a_1304_amount(form) {
if (document.frm.A_1304_AMOUNT_REFINANCE.value != '' && document.frm.A_1304_AMOUNT_REFINANCE.value != 'Charge Amount') {
document.frm.A_1304_AMOUNT_PURCHASE.value = document.frm.A_1304_AMOUNT_REFINANCE.value;
document.frm.A_1304_AMOUNT_2ND_NO_TI.value = document.frm.A_1304_AMOUNT_REFINANCE.value;
document.frm.A_1304_AMOUNT_2ND_WITH_TI.value = document.frm.A_1304_AMOUNT_REFINANCE.value;
} else { 
document.frm.A_1304_AMOUNT_PURCHASE.value = '';
document.frm.A_1304_AMOUNT_2ND_NO_TI.value = '';
document.frm.A_1304_AMOUNT_2ND_WITH_TI.value = '';
}
}
function a_1305_amount(form) {
if (document.frm.A_1305_AMOUNT_REFINANCE.value != '' && document.frm.A_1305_AMOUNT_REFINANCE.value != 'Charge Amount') {
document.frm.A_1305_AMOUNT_PURCHASE.value = document.frm.A_1305_AMOUNT_REFINANCE.value;
document.frm.A_1305_AMOUNT_2ND_NO_TI.value = document.frm.A_1305_AMOUNT_REFINANCE.value;
document.frm.A_1305_AMOUNT_2ND_WITH_TI.value = document.frm.A_1305_AMOUNT_REFINANCE.value;
} else { 
document.frm.A_1305_AMOUNT_PURCHASE.value = '';
document.frm.A_1305_AMOUNT_2ND_NO_TI.value = '';
document.frm.A_1305_AMOUNT_2ND_WITH_TI.value = '';
}
}
function a_1306_amount(form) {
if (document.frm.A_1306_AMOUNT_REFINANCE.value != '' && document.frm.A_1306_AMOUNT_REFINANCE.value != 'Charge Amount') {
document.frm.A_1306_AMOUNT_PURCHASE.value = document.frm.A_1306_AMOUNT_REFINANCE.value;
document.frm.A_1306_AMOUNT_2ND_NO_TI.value = document.frm.A_1306_AMOUNT_REFINANCE.value;
document.frm.A_1306_AMOUNT_2ND_WITH_TI.value = document.frm.A_1306_AMOUNT_REFINANCE.value;
} else { 
document.frm.A_1306_AMOUNT_PURCHASE.value = '';
document.frm.A_1306_AMOUNT_2ND_NO_TI.value = '';
document.frm.A_1306_AMOUNT_2ND_WITH_TI.value = '';
}
}
function a_1307_amount(form) {
if (document.frm.A_1307_AMOUNT_REFINANCE.value != '' && document.frm.A_1307_AMOUNT_REFINANCE.value != 'Charge Amount') {
document.frm.A_1307_AMOUNT_PURCHASE.value = document.frm.A_1307_AMOUNT_REFINANCE.value;
document.frm.A_1307_AMOUNT_2ND_NO_TI.value = document.frm.A_1307_AMOUNT_REFINANCE.value;
document.frm.A_1307_AMOUNT_2ND_WITH_TI.value = document.frm.A_1307_AMOUNT_REFINANCE.value;
} else { 
document.frm.A_1307_AMOUNT_PURCHASE.value = '';
document.frm.A_1307_AMOUNT_2ND_NO_TI.value = '';
document.frm.A_1307_AMOUNT_2ND_WITH_TI.value = '';
}
}
function a_1308_amount(form) {
if (document.frm.A_1308_AMOUNT_REFINANCE.value != '' && document.frm.A_1308_AMOUNT_REFINANCE.value != 'Charge Amount') {
document.frm.A_1308_AMOUNT_PURCHASE.value = document.frm.A_1308_AMOUNT_REFINANCE.value;
document.frm.A_1308_AMOUNT_2ND_NO_TI.value = document.frm.A_1308_AMOUNT_REFINANCE.value;
document.frm.A_1308_AMOUNT_2ND_WITH_TI.value = document.frm.A_1308_AMOUNT_REFINANCE.value;
} else { 
document.frm.A_1308_AMOUNT_PURCHASE.value = '';
document.frm.A_1308_AMOUNT_2ND_NO_TI.value = '';
document.frm.A_1308_AMOUNT_2ND_WITH_TI.value = '';
}
}






function a_804_payto(form) {
if (document.frm.A_0804_PAYTO_REFINANCE.value != '' && document.frm.A_0804_PAYTO_REFINANCE.value != 'Payee Name') {
document.frm.A_0804_PAYTO_PURCHASE.value = document.frm.A_0804_PAYTO_REFINANCE.value;
document.frm.A_0804_PAYTO_2ND_NO_TI.value = document.frm.A_0804_PAYTO_REFINANCE.value;
document.frm.A_0804_PAYTO_2ND_WITH_TI.value = document.frm.A_0804_PAYTO_REFINANCE.value;
} else { 
document.frm.A_0804_PAYTO_PURCHASE.value = '';
document.frm.A_0804_PAYTO_2ND_NO_TI.value = '';
document.frm.A_0804_PAYTO_2ND_WITH_TI.value = '';
}
}

function a_805_payto(form) {
if (document.frm.A_0805_PAYTO_REFINANCE.value != '' && document.frm.A_0805_PAYTO_REFINANCE.value != 'Payee Name') {
document.frm.A_0805_PAYTO_PURCHASE.value = document.frm.A_0805_PAYTO_REFINANCE.value;
document.frm.A_0805_PAYTO_2ND_NO_TI.value = document.frm.A_0805_PAYTO_REFINANCE.value;
document.frm.A_0805_PAYTO_2ND_WITH_TI.value = document.frm.A_0805_PAYTO_REFINANCE.value;
} else { 
document.frm.A_0805_PAYTO_PURCHASE.value = '';
document.frm.A_0805_PAYTO_2ND_NO_TI.value = '';
document.frm.A_0805_PAYTO_2ND_WITH_TI.value = '';
}
}
function a_806_payto(form) {
if (document.frm.A_0806_PAYTO_REFINANCE.value != '' && document.frm.A_0806_PAYTO_REFINANCE.value != 'Payee Name') {
document.frm.A_0806_PAYTO_PURCHASE.value = document.frm.A_0806_PAYTO_REFINANCE.value;
document.frm.A_0806_PAYTO_2ND_NO_TI.value = document.frm.A_0806_PAYTO_REFINANCE.value;
document.frm.A_0806_PAYTO_2ND_WITH_TI.value = document.frm.A_0806_PAYTO_REFINANCE.value;
} else { 
document.frm.A_0806_PAYTO_PURCHASE.value = '';
document.frm.A_0806_PAYTO_2ND_NO_TI.value = '';
document.frm.A_0806_PAYTO_2ND_WITH_TI.value = '';
}
}
function a_807_payto(form) {
if (document.frm.A_0807_PAYTO_REFINANCE.value != '' && document.frm.A_0807_PAYTO_REFINANCE.value != 'Payee Name') {
document.frm.A_0807_PAYTO_PURCHASE.value = document.frm.A_0807_PAYTO_REFINANCE.value;
document.frm.A_0807_PAYTO_2ND_NO_TI.value = document.frm.A_0807_PAYTO_REFINANCE.value;
document.frm.A_0807_PAYTO_2ND_WITH_TI.value = document.frm.A_0807_PAYTO_REFINANCE.value;
} else { 
document.frm.A_0807_PAYTO_PURCHASE.value = '';
document.frm.A_0807_PAYTO_2ND_NO_TI.value = '';
document.frm.A_0807_PAYTO_2ND_WITH_TI.value = '';
}
}
function a_808_payto(form) {
if (document.frm.A_0808_PAYTO_REFINANCE.value != '' && document.frm.A_0808_PAYTO_REFINANCE.value != 'Payee Name') {
document.frm.A_0808_PAYTO_PURCHASE.value = document.frm.A_0808_PAYTO_REFINANCE.value;
document.frm.A_0808_PAYTO_2ND_NO_TI.value = document.frm.A_0808_PAYTO_REFINANCE.value;
document.frm.A_0808_PAYTO_2ND_WITH_TI.value = document.frm.A_0808_PAYTO_REFINANCE.value;
} else { 
document.frm.A_0808_PAYTO_PURCHASE.value = '';
document.frm.A_0808_PAYTO_2ND_NO_TI.value = '';
document.frm.A_0808_PAYTO_2ND_WITH_TI.value = '';
}
}
function a_809_payto(form) {
if (document.frm.A_0809_PAYTO_REFINANCE.value != '' && document.frm.A_0809_PAYTO_REFINANCE.value != 'Payee Name') {
document.frm.A_0809_PAYTO_PURCHASE.value = document.frm.A_0809_PAYTO_REFINANCE.value;
document.frm.A_0809_PAYTO_2ND_NO_TI.value = document.frm.A_0809_PAYTO_REFINANCE.value;
document.frm.A_0809_PAYTO_2ND_WITH_TI.value = document.frm.A_0809_PAYTO_REFINANCE.value;
} else { 
document.frm.A_0809_PAYTO_PURCHASE.value = '';
document.frm.A_0809_PAYTO_2ND_NO_TI.value = '';
document.frm.A_0809_PAYTO_2ND_WITH_TI.value = '';
}
}
function a_810_payto(form) {
if (document.frm.A_0810_PAYTO_REFINANCE.value != '' && document.frm.A_0810_PAYTO_REFINANCE.value != 'Payee Name') {
document.frm.A_0810_PAYTO_PURCHASE.value = document.frm.A_0810_PAYTO_REFINANCE.value;
document.frm.A_0810_PAYTO_2ND_NO_TI.value = document.frm.A_0810_PAYTO_REFINANCE.value;
document.frm.A_0810_PAYTO_2ND_WITH_TI.value = document.frm.A_0810_PAYTO_REFINANCE.value;
} else { 
document.frm.A_0810_PAYTO_PURCHASE.value = '';
document.frm.A_0810_PAYTO_2ND_NO_TI.value = '';
document.frm.A_0810_PAYTO_2ND_WITH_TI.value = '';
}
}
function a_811_payto(form) {
if (document.frm.A_0811_PAYTO_REFINANCE.value != '' && document.frm.A_0811_PAYTO_REFINANCE.value != 'Payee Name') {
document.frm.A_0811_PAYTO_PURCHASE.value = document.frm.A_0811_PAYTO_REFINANCE.value;
document.frm.A_0811_PAYTO_2ND_NO_TI.value = document.frm.A_0811_PAYTO_REFINANCE.value;
document.frm.A_0811_PAYTO_2ND_WITH_TI.value = document.frm.A_0811_PAYTO_REFINANCE.value;
} else { 
document.frm.A_0811_PAYTO_PURCHASE.value = '';
document.frm.A_0811_PAYTO_2ND_NO_TI.value = '';
document.frm.A_0811_PAYTO_2ND_WITH_TI.value = '';
}
}
function a_812_payto(form) {
if (document.frm.A_0812_PAYTO_REFINANCE.value != '' && document.frm.A_0812_PAYTO_REFINANCE.value != 'Payee Name') {
document.frm.A_0812_PAYTO_PURCHASE.value = document.frm.A_0812_PAYTO_REFINANCE.value;
document.frm.A_0812_PAYTO_2ND_NO_TI.value = document.frm.A_0812_PAYTO_REFINANCE.value;
document.frm.A_0812_PAYTO_2ND_WITH_TI.value = document.frm.A_0812_PAYTO_REFINANCE.value;
} else { 
document.frm.A_0812_PAYTO_PURCHASE.value = '';
document.frm.A_0812_PAYTO_2ND_NO_TI.value = '';
document.frm.A_0812_PAYTO_2ND_WITH_TI.value = '';
}
}


function a_1102_payto(form) {
if (document.frm.A_1102_PAYTO_REFINANCE.value != '' && document.frm.A_1102_PAYTO_REFINANCE.value != 'Payee Name') {
document.frm.A_1102_PAYTO_PURCHASE.value = document.frm.A_1102_PAYTO_REFINANCE.value;
document.frm.A_1102_PAYTO_2ND_NO_TI.value = document.frm.A_1102_PAYTO_REFINANCE.value;
document.frm.A_1102_PAYTO_2ND_WITH_TI.value = document.frm.A_1102_PAYTO_REFINANCE.value;
} else { 
document.frm.A_1102_PAYTO_PURCHASE.value = '';
document.frm.A_1102_PAYTO_2ND_NO_TI.value = '';
document.frm.A_1102_PAYTO_2ND_WITH_TI.value = '';
}
}
function a_1102A_payto(form) {
if (document.frm.A_1102A_PAYTO_REFINANCE.value != '' && document.frm.A_1102A_PAYTO_REFINANCE.value != 'Payee Name') {
document.frm.A_1102A_PAYTO_PURCHASE.value = document.frm.A_1102A_PAYTO_REFINANCE.value;
document.frm.A_1102A_PAYTO_2ND_NO_TI.value = document.frm.A_1102A_PAYTO_REFINANCE.value;
document.frm.A_1102A_PAYTO_2ND_WITH_TI.value = document.frm.A_1102A_PAYTO_REFINANCE.value;
} else {
document.frm.A_1102A_PAYTO_PURCHASE.value = '';
document.frm.A_1102A_PAYTO_2ND_NO_TI.value = '';
document.frm.A_1102A_PAYTO_2ND_WITH_TI.value = '';
}
}
function a_1102B_payto(form) {
if (document.frm.A_1102B_PAYTO_REFINANCE.value != '' && document.frm.A_1102B_PAYTO_REFINANCE.value != 'Payee Name') {
document.frm.A_1102B_PAYTO_PURCHASE.value = document.frm.A_1102B_PAYTO_REFINANCE.value;
document.frm.A_1102B_PAYTO_2ND_NO_TI.value = document.frm.A_1102B_PAYTO_REFINANCE.value;
document.frm.A_1102B_PAYTO_2ND_WITH_TI.value = document.frm.A_1102B_PAYTO_REFINANCE.value;
} else {
document.frm.A_1102B_PAYTO_PURCHASE.value = '';
document.frm.A_1102B_PAYTO_2ND_NO_TI.value = '';
document.frm.A_1102B_PAYTO_2ND_WITH_TI.value = '';
}
}
function a_1102C_payto(form) {
if (document.frm.A_1102C_PAYTO_REFINANCE.value != '' && document.frm.A_1102C_PAYTO_REFINANCE.value != 'Payee Name') {
document.frm.A_1102C_PAYTO_PURCHASE.value = document.frm.A_1102C_PAYTO_REFINANCE.value;
document.frm.A_1102C_PAYTO_2ND_NO_TI.value = document.frm.A_1102C_PAYTO_REFINANCE.value;
document.frm.A_1102C_PAYTO_2ND_WITH_TI.value = document.frm.A_1102C_PAYTO_REFINANCE.value;
} else {
document.frm.A_1102C_PAYTO_PURCHASE.value = '';
document.frm.A_1102C_PAYTO_2ND_NO_TI.value = '';
document.frm.A_1102C_PAYTO_2ND_WITH_TI.value = '';
}
}
function a_1102D_payto(form) {
if (document.frm.A_1102D_PAYTO_REFINANCE.value != '' && document.frm.A_1102D_PAYTO_REFINANCE.value != 'Payee Name') {
document.frm.A_1102D_PAYTO_PURCHASE.value = document.frm.A_1102D_PAYTO_REFINANCE.value;
document.frm.A_1102D_PAYTO_2ND_NO_TI.value = document.frm.A_1102D_PAYTO_REFINANCE.value;
document.frm.A_1102D_PAYTO_2ND_WITH_TI.value = document.frm.A_1102D_PAYTO_REFINANCE.value;
} else {
document.frm.A_1102D_PAYTO_PURCHASE.value = '';
document.frm.A_1102D_PAYTO_2ND_NO_TI.value = '';
document.frm.A_1102D_PAYTO_2ND_WITH_TI.value = '';
}
}
function a_1102E_payto(form) {
if (document.frm.A_1102E_PAYTO_REFINANCE.value != '' && document.frm.A_1102E_PAYTO_REFINANCE.value != 'Payee Name') {
document.frm.A_1102E_PAYTO_PURCHASE.value = document.frm.A_1102E_PAYTO_REFINANCE.value;
document.frm.A_1102E_PAYTO_2ND_NO_TI.value = document.frm.A_1102E_PAYTO_REFINANCE.value;
document.frm.A_1102E_PAYTO_2ND_WITH_TI.value = document.frm.A_1102E_PAYTO_REFINANCE.value;
} else {
document.frm.A_1102E_PAYTO_PURCHASE.value = '';
document.frm.A_1102E_PAYTO_2ND_NO_TI.value = '';
document.frm.A_1102E_PAYTO_2ND_WITH_TI.value = '';
}
}
function a_1102F_payto(form) {
if (document.frm.A_1102F_PAYTO_REFINANCE.value != '' && document.frm.A_1102F_PAYTO_REFINANCE.value != 'Payee Name') {
document.frm.A_1102F_PAYTO_PURCHASE.value = document.frm.A_1102F_PAYTO_REFINANCE.value;
document.frm.A_1102F_PAYTO_2ND_NO_TI.value = document.frm.A_1102F_PAYTO_REFINANCE.value;
document.frm.A_1102F_PAYTO_2ND_WITH_TI.value = document.frm.A_1102F_PAYTO_REFINANCE.value;
} else {
document.frm.A_1102F_PAYTO_PURCHASE.value = '';
document.frm.A_1102F_PAYTO_2ND_NO_TI.value = '';
document.frm.A_1102F_PAYTO_2ND_WITH_TI.value = '';
}
}
function a_1102G_payto(form) {
if (document.frm.A_1102G_PAYTO_REFINANCE.value != '' && document.frm.A_1102G_PAYTO_REFINANCE.value != 'Payee Name') {
document.frm.A_1102G_PAYTO_PURCHASE.value = document.frm.A_1102G_PAYTO_REFINANCE.value;
document.frm.A_1102G_PAYTO_2ND_NO_TI.value = document.frm.A_1102G_PAYTO_REFINANCE.value;
document.frm.A_1102G_PAYTO_2ND_WITH_TI.value = document.frm.A_1102G_PAYTO_REFINANCE.value;
} else {
document.frm.A_1102G_PAYTO_PURCHASE.value = '';
document.frm.A_1102G_PAYTO_2ND_NO_TI.value = '';
document.frm.A_1102G_PAYTO_2ND_WITH_TI.value = '';
}
}
function a_1102H_payto(form) {
if (document.frm.A_1102H_PAYTO_REFINANCE.value != '' && document.frm.A_1102H_PAYTO_REFINANCE.value != 'Payee Name') {
document.frm.A_1102H_PAYTO_PURCHASE.value = document.frm.A_1102H_PAYTO_REFINANCE.value;
document.frm.A_1102H_PAYTO_2ND_NO_TI.value = document.frm.A_1102H_PAYTO_REFINANCE.value;
document.frm.A_1102H_PAYTO_2ND_WITH_TI.value = document.frm.A_1102H_PAYTO_REFINANCE.value;
} else {
document.frm.A_1102H_PAYTO_PURCHASE.value = '';
document.frm.A_1102H_PAYTO_2ND_NO_TI.value = '';
document.frm.A_1102H_PAYTO_2ND_WITH_TI.value = '';
}
}
function a_1102I_payto(form) {
if (document.frm.A_1102I_PAYTO_REFINANCE.value != '' && document.frm.A_1102I_PAYTO_REFINANCE.value != 'Payee Name') {
document.frm.A_1102I_PAYTO_PURCHASE.value = document.frm.A_1102I_PAYTO_REFINANCE.value;
document.frm.A_1102I_PAYTO_2ND_NO_TI.value = document.frm.A_1102I_PAYTO_REFINANCE.value;
document.frm.A_1102I_PAYTO_2ND_WITH_TI.value = document.frm.A_1102I_PAYTO_REFINANCE.value;
} else {
document.frm.A_1102I_PAYTO_PURCHASE.value = '';
document.frm.A_1102I_PAYTO_2ND_NO_TI.value = '';
document.frm.A_1102I_PAYTO_2ND_WITH_TI.value = '';
}
}
function a_1109_payto(form) {
if (document.frm.A_1109_PAYTO_REFINANCE.value != '' && document.frm.A_1109_PAYTO_REFINANCE.value != 'Payee Name') {
document.frm.A_1109_PAYTO_PURCHASE.value = document.frm.A_1109_PAYTO_REFINANCE.value;
document.frm.A_1109_PAYTO_2ND_NO_TI.value = document.frm.A_1109_PAYTO_REFINANCE.value;
document.frm.A_1109_PAYTO_2ND_WITH_TI.value = document.frm.A_1109_PAYTO_REFINANCE.value;
} else { 
document.frm.A_1109_PAYTO_PURCHASE.value = '';
document.frm.A_1109_PAYTO_2ND_NO_TI.value = '';
document.frm.A_1109_PAYTO_2ND_WITH_TI.value = '';
}
}
function a_1110_payto(form) {
if (document.frm.A_1110_PAYTO_REFINANCE.value != '' && document.frm.A_1110_PAYTO_REFINANCE.value != 'Payee Name') {
document.frm.A_1110_PAYTO_PURCHASE.value = document.frm.A_1110_PAYTO_REFINANCE.value;
document.frm.A_1110_PAYTO_2ND_NO_TI.value = document.frm.A_1110_PAYTO_REFINANCE.value;
document.frm.A_1110_PAYTO_2ND_WITH_TI.value = document.frm.A_1110_PAYTO_REFINANCE.value;
} else { 
document.frm.A_1110_PAYTO_PURCHASE.value = '';
document.frm.A_1110_PAYTO_2ND_NO_TI.value = '';
document.frm.A_1110_PAYTO_2ND_WITH_TI.value = '';
}
}
function a_1111_payto(form) {
if (document.frm.A_1111_PAYTO_REFINANCE.value != '' && document.frm.A_1111_PAYTO_REFINANCE.value != 'Payee Name') {
document.frm.A_1111_PAYTO_PURCHASE.value = document.frm.A_1111_PAYTO_REFINANCE.value;
document.frm.A_1111_PAYTO_2ND_NO_TI.value = document.frm.A_1111_PAYTO_REFINANCE.value;
document.frm.A_1111_PAYTO_2ND_WITH_TI.value = document.frm.A_1111_PAYTO_REFINANCE.value;
} else { 
document.frm.A_1111_PAYTO_PURCHASE.value = '';
document.frm.A_1111_PAYTO_2ND_NO_TI.value = '';
document.frm.A_1111_PAYTO_2ND_WITH_TI.value = '';
}
}
function a_1112_payto(form) {
if (document.frm.A_1112_PAYTO_REFINANCE.value != '' && document.frm.A_1112_PAYTO_REFINANCE.value != 'Payee Name') {
document.frm.A_1112_PAYTO_PURCHASE.value = document.frm.A_1112_PAYTO_REFINANCE.value;
document.frm.A_1112_PAYTO_2ND_NO_TI.value = document.frm.A_1112_PAYTO_REFINANCE.value;
document.frm.A_1112_PAYTO_2ND_WITH_TI.value = document.frm.A_1112_PAYTO_REFINANCE.value;
} else { 
document.frm.A_1112_PAYTO_PURCHASE.value = '';
document.frm.A_1112_PAYTO_2ND_NO_TI.value = '';
document.frm.A_1112_PAYTO_2ND_WITH_TI.value = '';
}
}
function a_1113_payto(form) {
if (document.frm.A_1113_PAYTO_REFINANCE.value != '' && document.frm.A_1113_PAYTO_REFINANCE.value != 'Payee Name') {
document.frm.A_1113_PAYTO_PURCHASE.value = document.frm.A_1113_PAYTO_REFINANCE.value;
document.frm.A_1113_PAYTO_2ND_NO_TI.value = document.frm.A_1113_PAYTO_REFINANCE.value;
document.frm.A_1113_PAYTO_2ND_WITH_TI.value = document.frm.A_1113_PAYTO_REFINANCE.value;
} else { 
document.frm.A_1113_PAYTO_PURCHASE.value = '';
document.frm.A_1113_PAYTO_2ND_NO_TI.value = '';
document.frm.A_1113_PAYTO_2ND_WITH_TI.value = '';
}
}
function a_1302_payto(form) {
if (document.frm.A_1302_PAYTO_REFINANCE.value != '' && document.frm.A_1302_PAYTO_REFINANCE.value != 'Payee Name') {
document.frm.A_1302_PAYTO_PURCHASE.value = document.frm.A_1302_PAYTO_REFINANCE.value;
document.frm.A_1302_PAYTO_2ND_NO_TI.value = document.frm.A_1302_PAYTO_REFINANCE.value;
document.frm.A_1302_PAYTO_2ND_WITH_TI.value = document.frm.A_1302_PAYTO_REFINANCE.value;
} else { 
document.frm.A_1302_PAYTO_PURCHASE.value = '';
document.frm.A_1302_PAYTO_2ND_NO_TI.value = '';
document.frm.A_1302_PAYTO_2ND_WITH_TI.value = '';
}
}
function a_1303_payto(form) {
if (document.frm.A_1303_PAYTO_REFINANCE.value != '' && document.frm.A_1303_PAYTO_REFINANCE.value != 'Payee Name') {
document.frm.A_1303_PAYTO_PURCHASE.value = document.frm.A_1303_PAYTO_REFINANCE.value;
document.frm.A_1303_PAYTO_2ND_NO_TI.value = document.frm.A_1303_PAYTO_REFINANCE.value;
document.frm.A_1303_PAYTO_2ND_WITH_TI.value = document.frm.A_1303_PAYTO_REFINANCE.value;
} else { 
document.frm.A_1303_PAYTO_PURCHASE.value = '';
document.frm.A_1303_PAYTO_2ND_NO_TI.value = '';
document.frm.A_1303_PAYTO_2ND_WITH_TI.value = '';
}
}
function a_1304_payto(form) {
if (document.frm.A_1304_PAYTO_REFINANCE.value != '' && document.frm.A_1304_PAYTO_REFINANCE.value != 'Payee Name') {
document.frm.A_1304_PAYTO_PURCHASE.value = document.frm.A_1304_PAYTO_REFINANCE.value;
document.frm.A_1304_PAYTO_2ND_NO_TI.value = document.frm.A_1304_PAYTO_REFINANCE.value;
document.frm.A_1304_PAYTO_2ND_WITH_TI.value = document.frm.A_1304_PAYTO_REFINANCE.value;
} else { 
document.frm.A_1304_PAYTO_PURCHASE.value = '';
document.frm.A_1304_PAYTO_2ND_NO_TI.value = '';
document.frm.A_1304_PAYTO_2ND_WITH_TI.value = '';
}
}
function a_1305_payto(form) {
if (document.frm.A_1305_PAYTO_REFINANCE.value != '' && document.frm.A_1305_PAYTO_REFINANCE.value != 'Payee Name') {
document.frm.A_1305_PAYTO_PURCHASE.value = document.frm.A_1305_PAYTO_REFINANCE.value;
document.frm.A_1305_PAYTO_2ND_NO_TI.value = document.frm.A_1305_PAYTO_REFINANCE.value;
document.frm.A_1305_PAYTO_2ND_WITH_TI.value = document.frm.A_1305_PAYTO_REFINANCE.value;
} else { 
document.frm.A_1305_PAYTO_PURCHASE.value = '';
document.frm.A_1305_PAYTO_2ND_NO_TI.value = '';
document.frm.A_1305_PAYTO_2ND_WITH_TI.value = '';
}
}
function a_1306_payto(form) {
if (document.frm.A_1306_PAYTO_REFINANCE.value != '' && document.frm.A_1306_PAYTO_REFINANCE.value != 'Payee Name') {
document.frm.A_1306_PAYTO_PURCHASE.value = document.frm.A_1306_PAYTO_REFINANCE.value;
document.frm.A_1306_PAYTO_2ND_NO_TI.value = document.frm.A_1306_PAYTO_REFINANCE.value;
document.frm.A_1306_PAYTO_2ND_WITH_TI.value = document.frm.A_1306_PAYTO_REFINANCE.value;
} else { 
document.frm.A_1306_PAYTO_PURCHASE.value = '';
document.frm.A_1306_PAYTO_2ND_NO_TI.value = '';
document.frm.A_1306_PAYTO_2ND_WITH_TI.value = '';
}
}
function a_1307_payto(form) {
if (document.frm.A_1307_PAYTO_REFINANCE.value != '' && document.frm.A_1307_PAYTO_REFINANCE.value != 'Payee Name') {
document.frm.A_1307_PAYTO_PURCHASE.value = document.frm.A_1307_PAYTO_REFINANCE.value;
document.frm.A_1307_PAYTO_2ND_NO_TI.value = document.frm.A_1307_PAYTO_REFINANCE.value;
document.frm.A_1307_PAYTO_2ND_WITH_TI.value = document.frm.A_1307_PAYTO_REFINANCE.value;
} else { 
document.frm.A_1307_PAYTO_PURCHASE.value = '';
document.frm.A_1307_PAYTO_2ND_NO_TI.value = '';
document.frm.A_1307_PAYTO_2ND_WITH_TI.value = '';
}
}
function a_1308_payto(form) {
if (document.frm.A_1308_PAYTO_REFINANCE.value != '' && document.frm.A_1308_PAYTO_REFINANCE.value != 'Payee Name') {
document.frm.A_1308_PAYTO_PURCHASE.value = document.frm.A_1308_PAYTO_REFINANCE.value;
document.frm.A_1308_PAYTO_2ND_NO_TI.value = document.frm.A_1308_PAYTO_REFINANCE.value;
document.frm.A_1308_PAYTO_2ND_WITH_TI.value = document.frm.A_1308_PAYTO_REFINANCE.value;
} else { 
document.frm.A_1308_PAYTO_PURCHASE.value = '';
document.frm.A_1308_PAYTO_2ND_NO_TI.value = '';
document.frm.A_1308_PAYTO_2ND_WITH_TI.value = '';
}
}


function a_808_desc(form) {
document.frm.A_0808_DESCRIPTION_PURCHASE.value = document.frm.A_0808_DESCRIPTION_REFINANCE.value;
document.frm.A_0808_DESCRIPTION_2ND_NO_TI.value = document.frm.A_0808_DESCRIPTION_REFINANCE.value;
document.frm.A_0808_DESCRIPTION_2ND_WITH_TI.value = document.frm.A_0808_DESCRIPTION_REFINANCE.value;
}
function a_809_desc(form) {
document.frm.A_0809_DESCRIPTION_PURCHASE.value = document.frm.A_0809_DESCRIPTION_REFINANCE.value;
document.frm.A_0809_DESCRIPTION_2ND_NO_TI.value = document.frm.A_0809_DESCRIPTION_REFINANCE.value;
document.frm.A_0809_DESCRIPTION_2ND_WITH_TI.value = document.frm.A_0809_DESCRIPTION_REFINANCE.value;
}
function a_810_desc(form) {
document.frm.A_0810_DESCRIPTION_PURCHASE.value = document.frm.A_0810_DESCRIPTION_REFINANCE.value;
document.frm.A_0810_DESCRIPTION_2ND_NO_TI.value = document.frm.A_0810_DESCRIPTION_REFINANCE.value;
document.frm.A_0810_DESCRIPTION_2ND_WITH_TI.value = document.frm.A_0810_DESCRIPTION_REFINANCE.value;
}
function a_811_desc(form) {
document.frm.A_0811_DESCRIPTION_PURCHASE.value = document.frm.A_0811_DESCRIPTION_REFINANCE.value;
document.frm.A_0811_DESCRIPTION_2ND_NO_TI.value = document.frm.A_0811_DESCRIPTION_REFINANCE.value;
document.frm.A_0811_DESCRIPTION_2ND_WITH_TI.value = document.frm.A_0811_DESCRIPTION_REFINANCE.value;
}
function a_812_desc(form) {
document.frm.A_0812_DESCRIPTION_PURCHASE.value = document.frm.A_0812_DESCRIPTION_REFINANCE.value;
document.frm.A_0812_DESCRIPTION_2ND_NO_TI.value = document.frm.A_0812_DESCRIPTION_REFINANCE.value;
document.frm.A_0812_DESCRIPTION_2ND_WITH_TI.value = document.frm.A_0812_DESCRIPTION_REFINANCE.value;
}
function a_1101_01_desc(form) {
document.frm.A_1101_ITEM_DESCRIPTION_01_PURCHASE.value = document.frm.A_1101_ITEM_DESCRIPTION_01_REFINANCE.value;
document.frm.A_1101_ITEM_DESCRIPTION_01_2ND_NO_TI.value = document.frm.A_1101_ITEM_DESCRIPTION_01_REFINANCE.value;
document.frm.A_1101_ITEM_DESCRIPTION_01_2ND_WITH_TI.value = document.frm.A_1101_ITEM_DESCRIPTION_01_REFINANCE.value;
}

function a_1101_02_desc(form) {
document.frm.A_1101_ITEM_DESCRIPTION_02_PURCHASE.value = document.frm.A_1101_ITEM_DESCRIPTION_02_REFINANCE.value;
document.frm.A_1101_ITEM_DESCRIPTION_02_2ND_NO_TI.value = document.frm.A_1101_ITEM_DESCRIPTION_02_REFINANCE.value;
document.frm.A_1101_ITEM_DESCRIPTION_02_2ND_WITH_TI.value = document.frm.A_1101_ITEM_DESCRIPTION_02_REFINANCE.value;
}

function a_1101_03_desc(form) {
document.frm.A_1101_ITEM_DESCRIPTION_03_PURCHASE.value = document.frm.A_1101_ITEM_DESCRIPTION_03_REFINANCE.value;
document.frm.A_1101_ITEM_DESCRIPTION_03_2ND_NO_TI.value = document.frm.A_1101_ITEM_DESCRIPTION_03_REFINANCE.value;
document.frm.A_1101_ITEM_DESCRIPTION_03_2ND_WITH_TI.value = document.frm.A_1101_ITEM_DESCRIPTION_03_REFINANCE.value;
}

function a_1101_04_desc(form) {
document.frm.A_1101_ITEM_DESCRIPTION_04_PURCHASE.value = document.frm.A_1101_ITEM_DESCRIPTION_04_REFINANCE.value;
document.frm.A_1101_ITEM_DESCRIPTION_04_2ND_NO_TI.value = document.frm.A_1101_ITEM_DESCRIPTION_04_REFINANCE.value;
document.frm.A_1101_ITEM_DESCRIPTION_04_2ND_WITH_TI.value = document.frm.A_1101_ITEM_DESCRIPTION_04_REFINANCE.value;
}

function a_1101_05_desc(form) {
document.frm.A_1101_ITEM_DESCRIPTION_05_PURCHASE.value = document.frm.A_1101_ITEM_DESCRIPTION_05_REFINANCE.value;
document.frm.A_1101_ITEM_DESCRIPTION_05_2ND_NO_TI.value = document.frm.A_1101_ITEM_DESCRIPTION_05_REFINANCE.value;
document.frm.A_1101_ITEM_DESCRIPTION_05_2ND_WITH_TI.value = document.frm.A_1101_ITEM_DESCRIPTION_05_REFINANCE.value;
}

function a_1101_06_desc(form) {
document.frm.A_1101_ITEM_DESCRIPTION_06_PURCHASE.value = document.frm.A_1101_ITEM_DESCRIPTION_06_REFINANCE.value;
document.frm.A_1101_ITEM_DESCRIPTION_06_2ND_NO_TI.value = document.frm.A_1101_ITEM_DESCRIPTION_06_REFINANCE.value;
document.frm.A_1101_ITEM_DESCRIPTION_06_2ND_WITH_TI.value = document.frm.A_1101_ITEM_DESCRIPTION_06_REFINANCE.value;
}

function a_1101_07_desc(form) {
document.frm.A_1101_ITEM_DESCRIPTION_07_PURCHASE.value = document.frm.A_1101_ITEM_DESCRIPTION_07_REFINANCE.value;
document.frm.A_1101_ITEM_DESCRIPTION_07_2ND_NO_TI.value = document.frm.A_1101_ITEM_DESCRIPTION_07_REFINANCE.value;
document.frm.A_1101_ITEM_DESCRIPTION_07_2ND_WITH_TI.value = document.frm.A_1101_ITEM_DESCRIPTION_07_REFINANCE.value;
}

function a_1101_08_desc(form) {
document.frm.A_1101_ITEM_DESCRIPTION_08_PURCHASE.value = document.frm.A_1101_ITEM_DESCRIPTION_08_REFINANCE.value;
document.frm.A_1101_ITEM_DESCRIPTION_08_2ND_NO_TI.value = document.frm.A_1101_ITEM_DESCRIPTION_08_REFINANCE.value;
document.frm.A_1101_ITEM_DESCRIPTION_08_2ND_WITH_TI.value = document.frm.A_1101_ITEM_DESCRIPTION_08_REFINANCE.value;
}

function a_1101_09_desc(form) {
document.frm.A_1101_ITEM_DESCRIPTION_09_PURCHASE.value = document.frm.A_1101_ITEM_DESCRIPTION_09_REFINANCE.value;
document.frm.A_1101_ITEM_DESCRIPTION_09_2ND_NO_TI.value = document.frm.A_1101_ITEM_DESCRIPTION_09_REFINANCE.value;
document.frm.A_1101_ITEM_DESCRIPTION_09_2ND_WITH_TI.value = document.frm.A_1101_ITEM_DESCRIPTION_09_REFINANCE.value;
}

function a_1101_10_desc(form) {
document.frm.A_1101_ITEM_DESCRIPTION_10_PURCHASE.value = document.frm.A_1101_ITEM_DESCRIPTION_10_REFINANCE.value;
document.frm.A_1101_ITEM_DESCRIPTION_10_2ND_NO_TI.value = document.frm.A_1101_ITEM_DESCRIPTION_10_REFINANCE.value;
document.frm.A_1101_ITEM_DESCRIPTION_10_2ND_WITH_TI.value = document.frm.A_1101_ITEM_DESCRIPTION_10_REFINANCE.value;
}

function a_1109_desc(form) {
document.frm.A_1109_DESCRIPTION_PURCHASE.value = document.frm.A_1109_DESCRIPTION_REFINANCE.value;
document.frm.A_1109_DESCRIPTION_2ND_NO_TI.value = document.frm.A_1109_DESCRIPTION_REFINANCE.value;
document.frm.A_1109_DESCRIPTION_2ND_WITH_TI.value = document.frm.A_1109_DESCRIPTION_REFINANCE.value;
}
function a_1110_desc(form) {
document.frm.A_1110_DESCRIPTION_PURCHASE.value = document.frm.A_1110_DESCRIPTION_REFINANCE.value;
document.frm.A_1110_DESCRIPTION_2ND_NO_TI.value = document.frm.A_1110_DESCRIPTION_REFINANCE.value;
document.frm.A_1110_DESCRIPTION_2ND_WITH_TI.value = document.frm.A_1110_DESCRIPTION_REFINANCE.value;
}
function a_1111_desc(form) {
document.frm.A_1111_DESCRIPTION_PURCHASE.value = document.frm.A_1111_DESCRIPTION_REFINANCE.value;
document.frm.A_1111_DESCRIPTION_2ND_NO_TI.value = document.frm.A_1111_DESCRIPTION_REFINANCE.value;
document.frm.A_1111_DESCRIPTION_2ND_WITH_TI.value = document.frm.A_1111_DESCRIPTION_REFINANCE.value;
}
function a_1112_desc(form) {
document.frm.A_1112_DESCRIPTION_PURCHASE.value = document.frm.A_1112_DESCRIPTION_REFINANCE.value;
document.frm.A_1112_DESCRIPTION_2ND_NO_TI.value = document.frm.A_1112_DESCRIPTION_REFINANCE.value;
document.frm.A_1112_DESCRIPTION_2ND_WITH_TI.value = document.frm.A_1112_DESCRIPTION_REFINANCE.value;
}
function a_1113_desc(form) {
document.frm.A_1113_DESCRIPTION_PURCHASE.value = document.frm.A_1113_DESCRIPTION_REFINANCE.value;
document.frm.A_1113_DESCRIPTION_2ND_NO_TI.value = document.frm.A_1113_DESCRIPTION_REFINANCE.value;
document.frm.A_1113_DESCRIPTION_2ND_WITH_TI.value = document.frm.A_1113_DESCRIPTION_REFINANCE.value;
}
function a_1302_desc(form) {
document.frm.A_1302_DESCRIPTION_PURCHASE.value = document.frm.A_1302_DESCRIPTION_REFINANCE.value;
document.frm.A_1302_DESCRIPTION_2ND_NO_TI.value = document.frm.A_1302_DESCRIPTION_REFINANCE.value;
document.frm.A_1302_DESCRIPTION_2ND_WITH_TI.value = document.frm.A_1302_DESCRIPTION_REFINANCE.value;
}
function a_1303_desc(form) {
document.frm.A_1303_DESCRIPTION_PURCHASE.value = document.frm.A_1303_DESCRIPTION_REFINANCE.value;
document.frm.A_1303_DESCRIPTION_2ND_NO_TI.value = document.frm.A_1303_DESCRIPTION_REFINANCE.value;
document.frm.A_1303_DESCRIPTION_2ND_WITH_TI.value = document.frm.A_1303_DESCRIPTION_REFINANCE.value;
}
function a_1304_desc(form) {
document.frm.A_1304_DESCRIPTION_PURCHASE.value = document.frm.A_1304_DESCRIPTION_REFINANCE.value;
document.frm.A_1304_DESCRIPTION_2ND_NO_TI.value = document.frm.A_1304_DESCRIPTION_REFINANCE.value;
document.frm.A_1304_DESCRIPTION_2ND_WITH_TI.value = document.frm.A_1304_DESCRIPTION_REFINANCE.value;
}
function a_1305_desc(form) {
document.frm.A_1305_DESCRIPTION_PURCHASE.value = document.frm.A_1305_DESCRIPTION_REFINANCE.value;
document.frm.A_1305_DESCRIPTION_2ND_NO_TI.value = document.frm.A_1305_DESCRIPTION_REFINANCE.value;
document.frm.A_1305_DESCRIPTION_2ND_WITH_TI.value = document.frm.A_1305_DESCRIPTION_REFINANCE.value;
}
function a_1306_desc(form) {
document.frm.A_1306_DESCRIPTION_PURCHASE.value = document.frm.A_1306_DESCRIPTION_REFINANCE.value;
document.frm.A_1306_DESCRIPTION_2ND_NO_TI.value = document.frm.A_1306_DESCRIPTION_REFINANCE.value;
document.frm.A_1306_DESCRIPTION_2ND_WITH_TI.value = document.frm.A_1306_DESCRIPTION_REFINANCE.value;
}
function a_1307_desc(form) {
document.frm.A_1307_DESCRIPTION_PURCHASE.value = document.frm.A_1307_DESCRIPTION_REFINANCE.value;
document.frm.A_1307_DESCRIPTION_2ND_NO_TI.value = document.frm.A_1307_DESCRIPTION_REFINANCE.value;
document.frm.A_1307_DESCRIPTION_2ND_WITH_TI.value = document.frm.A_1307_DESCRIPTION_REFINANCE.value;
}
function a_1308_desc(form) {
document.frm.A_1308_DESCRIPTION_PURCHASE.value = document.frm.A_1308_DESCRIPTION_REFINANCE.value;
document.frm.A_1308_DESCRIPTION_2ND_NO_TI.value = document.frm.A_1308_DESCRIPTION_REFINANCE.value;
document.frm.A_1308_DESCRIPTION_2ND_WITH_TI.value = document.frm.A_1308_DESCRIPTION_REFINANCE.value;
}





function a_1109_outside(form) {
  if (document.frm.A_1109_OUTSIDE_REFINANCE.checked==true) {
document.frm.A_1109_OUTSIDE_PURCHASE.checked = true;
document.frm.A_1109_OUTSIDE_2ND_NO_TI.checked = true;
document.frm.A_1109_OUTSIDE_2ND_WITH_TI.checked = true;
  } else  {
document.frm.A_1109_OUTSIDE_PURCHASE.checked = false;
document.frm.A_1109_OUTSIDE_2ND_NO_TI.checked = false;
document.frm.A_1109_OUTSIDE_2ND_WITH_TI.checked = false;
  } 
}  
function a_1110_outside(form) {
  if (document.frm.A_1110_OUTSIDE_REFINANCE.checked==true) {
document.frm.A_1110_OUTSIDE_PURCHASE.checked = true;
document.frm.A_1110_OUTSIDE_2ND_NO_TI.checked = true;
document.frm.A_1110_OUTSIDE_2ND_WITH_TI.checked = true;
  } else  {
document.frm.A_1110_OUTSIDE_PURCHASE.checked = false;
document.frm.A_1110_OUTSIDE_2ND_NO_TI.checked = false;
document.frm.A_1110_OUTSIDE_2ND_WITH_TI.checked = false;
  } 
}  
function a_1111_outside(form) {
  if (document.frm.A_1111_OUTSIDE_REFINANCE.checked==true) {
document.frm.A_1111_OUTSIDE_PURCHASE.checked = true;
document.frm.A_1111_OUTSIDE_2ND_NO_TI.checked = true;
document.frm.A_1111_OUTSIDE_2ND_WITH_TI.checked = true;
  } else  {
document.frm.A_1111_OUTSIDE_PURCHASE.checked = false;
document.frm.A_1111_OUTSIDE_2ND_NO_TI.checked = false;
document.frm.A_1111_OUTSIDE_2ND_WITH_TI.checked = false;
  } 
}  
function a_1112_outside(form) {
  if (document.frm.A_1112_OUTSIDE_REFINANCE.checked==true) {
document.frm.A_1112_OUTSIDE_PURCHASE.checked = true;
document.frm.A_1112_OUTSIDE_2ND_NO_TI.checked = true;
document.frm.A_1112_OUTSIDE_2ND_WITH_TI.checked = true;
  } else  {
document.frm.A_1112_OUTSIDE_PURCHASE.checked = false;
document.frm.A_1112_OUTSIDE_2ND_NO_TI.checked = false;
document.frm.A_1112_OUTSIDE_2ND_WITH_TI.checked = false;
  } 
}  
function a_1113_outside(form) {
  if (document.frm.A_1113_OUTSIDE_REFINANCE.checked==true) {
document.frm.A_1113_OUTSIDE_PURCHASE.checked = true;
document.frm.A_1113_OUTSIDE_2ND_NO_TI.checked = true;
document.frm.A_1113_OUTSIDE_2ND_WITH_TI.checked = true;
  } else  {
document.frm.A_1113_OUTSIDE_PURCHASE.checked = false;
document.frm.A_1113_OUTSIDE_2ND_NO_TI.checked = false;
document.frm.A_1113_OUTSIDE_2ND_WITH_TI.checked = false;
  } 
}  
function a_1302_outside(form) {
  if (document.frm.A_1302_OUTSIDE_REFINANCE.checked==true) {
document.frm.A_1302_OUTSIDE_PURCHASE.checked = true;
document.frm.A_1302_OUTSIDE_2ND_NO_TI.checked = true;
document.frm.A_1302_OUTSIDE_2ND_WITH_TI.checked = true;
  } else  {
document.frm.A_1302_OUTSIDE_PURCHASE.checked = false;
document.frm.A_1302_OUTSIDE_2ND_NO_TI.checked = false;
document.frm.A_1302_OUTSIDE_2ND_WITH_TI.checked = false;
  } 
}  
function a_1303_outside(form) {
  if (document.frm.A_1303_OUTSIDE_REFINANCE.checked==true) {
document.frm.A_1303_OUTSIDE_PURCHASE.checked = true;
document.frm.A_1303_OUTSIDE_2ND_NO_TI.checked = true;
document.frm.A_1303_OUTSIDE_2ND_WITH_TI.checked = true;
  } else  {
document.frm.A_1303_OUTSIDE_PURCHASE.checked = false;
document.frm.A_1303_OUTSIDE_2ND_NO_TI.checked = false;
document.frm.A_1303_OUTSIDE_2ND_WITH_TI.checked = false;
  } 
}  
function a_1304_outside(form) {
  if (document.frm.A_1304_OUTSIDE_REFINANCE.checked==true) {
document.frm.A_1304_OUTSIDE_PURCHASE.checked = true;
document.frm.A_1304_OUTSIDE_2ND_NO_TI.checked = true;
document.frm.A_1304_OUTSIDE_2ND_WITH_TI.checked = true;
  } else  {
document.frm.A_1304_OUTSIDE_PURCHASE.checked = false;
document.frm.A_1304_OUTSIDE_2ND_NO_TI.checked = false;
document.frm.A_1304_OUTSIDE_2ND_WITH_TI.checked = false;
  } 
}  
function a_1305_outside(form) {
  if (document.frm.A_1305_OUTSIDE_REFINANCE.checked==true) {
document.frm.A_1305_OUTSIDE_PURCHASE.checked = true;
document.frm.A_1305_OUTSIDE_2ND_NO_TI.checked = true;
document.frm.A_1305_OUTSIDE_2ND_WITH_TI.checked = true;
  } else  {
document.frm.A_1305_OUTSIDE_PURCHASE.checked = false;
document.frm.A_1305_OUTSIDE_2ND_NO_TI.checked = false;
document.frm.A_1305_OUTSIDE_2ND_WITH_TI.checked = false;
  } 
}  
function a_1306_outside(form) {
  if (document.frm.A_1306_OUTSIDE_REFINANCE.checked==true) {
document.frm.A_1306_OUTSIDE_PURCHASE.checked = true;
document.frm.A_1306_OUTSIDE_2ND_NO_TI.checked = true;
document.frm.A_1306_OUTSIDE_2ND_WITH_TI.checked = true;
  } else  {
document.frm.A_1306_OUTSIDE_PURCHASE.checked = false;
document.frm.A_1306_OUTSIDE_2ND_NO_TI.checked = false;
document.frm.A_1306_OUTSIDE_2ND_WITH_TI.checked = false;
  } 
}  
function a_1307_outside(form) {
  if (document.frm.A_1307_OUTSIDE_REFINANCE.checked==true) {
document.frm.A_1307_OUTSIDE_PURCHASE.checked = true;
document.frm.A_1307_OUTSIDE_2ND_NO_TI.checked = true;
document.frm.A_1307_OUTSIDE_2ND_WITH_TI.checked = true;
  } else  {
document.frm.A_1307_OUTSIDE_PURCHASE.checked = false;
document.frm.A_1307_OUTSIDE_2ND_NO_TI.checked = false;
document.frm.A_1307_OUTSIDE_2ND_WITH_TI.checked = false;
  } 
}  
function a_1308_outside(form) {
  if (document.frm.A_1308_OUTSIDE_REFINANCE.checked==true) {
document.frm.A_1308_OUTSIDE_PURCHASE.checked = true;
document.frm.A_1308_OUTSIDE_2ND_NO_TI.checked = true;
document.frm.A_1308_OUTSIDE_2ND_WITH_TI.checked = true;
  } else  {
document.frm.A_1308_OUTSIDE_PURCHASE.checked = false;
document.frm.A_1308_OUTSIDE_2ND_NO_TI.checked = false;
document.frm.A_1308_OUTSIDE_2ND_WITH_TI.checked = false;
  } 
}  

-->
</script>
	</head>


<BODY BGCOLOR=e1e1e1 TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>


<CENTER>

<CENTER>

<table width=500 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=500 align=center valign=top>
		
<table width=499 cellpadding=1 cellspacing=1 border=0 bgcolor=white>

	<tr>
		<td width=499 align=center valign=top bgcolor=e2e2e2>
			<FONT SIZE=2 color=black face=arial>

<table width=600 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

	<tr>
		<td width=600 align=center valign=top bgcolor=white>
			<font size=2 color=blue face=arial><B>ADD Line Costs to Mortgage Client</B>
			<p>
		</td>
	</tr>
<CFOUTPUT>
	<tr>
		<td width=600 align=center valign=top bgcolor=e3e3e3>
			<font size=3 color=blue face=arial>
			Client - <B>#read_company.company#</B>
		</td>
	</tr>
	<tr>
		<td width=600 align=center valign=top bgcolor=e3e3e3>
			<font size=1 color=blue face=verdana>
			In the fields below, enter the cost value associated with
			each of the line items.  If you need help with what text is 
			associated with each line item, mouse over the image next to 
			it and the text will appear.<br>
			<font size=1 color=red face=verdana>
			Do not enter <B>$</B> in any of the fields below.
			<p>
		</td>
	</tr>

	<tr>
		<td width=600 align=center valign=top bgcolor=e3e3e3>


	<!--- ======================================================== --->

<form action="./client_line_costs_add_submit_2010.cfm?uid=#URL.uid#&al=#URL.al#&company_id=#company_id#&ft_agencies=#ft_agencies#&a_st_list_2=#a_st_list_2#" method="post" name="frm">
</CFOUTPUT>
<span class="page_title">REFINANCE</span><BR>
<!-- 800 -->
<table width="600" summary="Type of Loan" border="1" cellspacing="0">
<tr><td height="4" colspan="6"></td></tr>
<tr>
<td class="bdarksilver_head">800. Items Payable in Connection with Loan</td>
<td class="bdarksilver_head" align="right">Amount</td>
</tr>
<tr>
<td class="bsilver">801. <input type="text" value="Our origination charge" class="textnormal" name="A_0801_DESCRIPTION_REFINANCE" onFocus="alert('This field may not be changed'); this.blur();" style="width:381;" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_0801_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_801_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
</tr>
<tr>
<tr>
<td class="bsilver">802. <input type="text" value="Your credit or charge (points) for the specific interest rate chosen " class="textnormal" name="A_0802_DESCRIPTION_REFINANCE" onFocus="alert('This field may not be changed'); this.blur();"  style="width:381;"  /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_0802_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_802_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
</tr>
<tr>
<td class="bsilver">804. <input type="text" value="Appraisal Fee" class="textnormal" name="A_0804_DESCRIPTION_REFINANCE" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_0804_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_804_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_0804_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_804_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
</tr>
<tr>
<td class="bsilver">805. <input type="text" value="Credit Report" class="textnormal" name="A_0805_DESCRIPTION_REFINANCE" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_0805_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_805_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_0805_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_805_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
</tr>
<tr>
<td class="bsilver">806. <input type="text" value="Tax Service" class="textnormal" name="A_0806_DESCRIPTION_REFINANCE" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_0806_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_806_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_0806_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_806_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
</tr>

<tr>
<td class="bsilver">807. <input type="text" value="Flood Certification" class="textnormal" name="A_0807_DESCRIPTION_REFINANCE" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_0807_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_807_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_0807_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_807_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
</tr>
<tr>
<td class="bsilver">808. <input type="text" value="Description of Charge" class="text" name="A_0808_DESCRIPTION_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_808_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_0808_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_808_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_0808_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_808_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
</tr>
<tr>
<td class="bsilver">809. <input type="text" value="Description of Charge" class="text" name="A_0809_DESCRIPTION_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_809_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_0809_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_809_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_0809_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_809_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
</tr>
<tr>
<td class="bsilver">810. <input type="text" value="Description of Charge" class="text" name="A_0810_DESCRIPTION_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_810_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_0810_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_810_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_0810_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_810_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
</tr>
<tr>
<td class="bsilver">811. <input type="text" value="Description of Charge" class="text" name="A_0811_DESCRIPTION_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_811_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_0811_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_811_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_0811_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_811_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
</tr>
<tr>
<td class="bsilver">812. <input type="text" value="Description of Charge" class="text" name="A_0812_DESCRIPTION_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_812_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_0812_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_812_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_0812_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_812_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
</tr>
</table>
<!-- 1100 -->
<table width="600" summary="Type of Loan" border="1" cellspacing="0">
<tr>
<td class="bdarksilver_head">1100. Title Charges</td>
<td class="bdarksilver_head" align="right">Amount</td>
<td class="bdarksilver_head" align="right">Outside</td>
</tr>
<tr>
<td class="bsilver">1101. Total charges in connection with Title not explicitly listed below</td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1101_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1101_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver" colspan=3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Itemized 1101 Charges</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="Description of Charge" class="text" name="A_1101_ITEM_DESCRIPTION_01_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_01_desc(); unfocus_this(this, 'Description of Charge', 'text');" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="Charge Amount" class="text" name="A_1101_ITEM_AMOUNT_01_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_01_amount(); roll_up_1101_refinance(); unfocus_this(this, 'Charge Amount', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="Description of Charge" class="text" name="A_1101_ITEM_DESCRIPTION_02_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_02_desc(); unfocus_this(this, 'Description of Charge', 'text');" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="Charge Amount" class="text" name="A_1101_ITEM_AMOUNT_02_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_02_amount(); roll_up_1101_refinance();  unfocus_this(this, 'Charge Amount', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="Description of Charge" class="text" name="A_1101_ITEM_DESCRIPTION_03_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_03_desc(); unfocus_this(this, 'Description of Charge', 'text');" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="Charge Amount" class="text" name="A_1101_ITEM_AMOUNT_03_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_03_amount(); roll_up_1101_refinance();  unfocus_this(this, 'Charge Amount', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="Description of Charge" class="text" name="A_1101_ITEM_DESCRIPTION_04_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_04_desc(); unfocus_this(this, 'Description of Charge', 'text');" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="Charge Amount" class="text" name="A_1101_ITEM_AMOUNT_04_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_04_amount(); roll_up_1101_refinance();  unfocus_this(this, 'Charge Amount', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="Description of Charge" class="text" name="A_1101_ITEM_DESCRIPTION_05_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_05_desc(); unfocus_this(this, 'Description of Charge', 'text');" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="Charge Amount" class="text" name="A_1101_ITEM_AMOUNT_05_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_05_amount(); roll_up_1101_refinance();  unfocus_this(this, 'Charge Amount', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="Description of Charge" class="text" name="A_1101_ITEM_DESCRIPTION_06_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_06_desc(); unfocus_this(this, 'Description of Charge', 'text');" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="Charge Amount" class="text" name="A_1101_ITEM_AMOUNT_06_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_06_amount(); roll_up_1101_refinance();  unfocus_this(this, 'Charge Amount', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="Description of Charge" class="text" name="A_1101_ITEM_DESCRIPTION_07_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_07_desc(); unfocus_this(this, 'Description of Charge', 'text');" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="Charge Amount" class="text" name="A_1101_ITEM_AMOUNT_07_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_07_amount(); roll_up_1101_refinance();  unfocus_this(this, 'Charge Amount', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="Description of Charge" class="text" name="A_1101_ITEM_DESCRIPTION_08_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_08_desc(); unfocus_this(this, 'Description of Charge', 'text');" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="Charge Amount" class="text" name="A_1101_ITEM_AMOUNT_08_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_08_amount(); roll_up_1101_refinance();  unfocus_this(this, 'Charge Amount', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="Description of Charge" class="text" name="A_1101_ITEM_DESCRIPTION_09_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_09_desc(); unfocus_this(this, 'Description of Charge', 'text');" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="Charge Amount" class="text" name="A_1101_ITEM_AMOUNT_09_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_09_amount(); roll_up_1101_refinance();  unfocus_this(this, 'Charge Amount', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="Description of Charge" class="text" name="A_1101_ITEM_DESCRIPTION_10_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_10_desc(); unfocus_this(this, 'Description of Charge', 'text');" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="Charge Amount" class="text" name="A_1101_ITEM_AMOUNT_10_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_10_amount(); roll_up_1101_refinance();  unfocus_this(this, 'Charge Amount', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<tr>
<td class="bsilver">1102. <input type="text" value="Settlement or Closing Fee" class="textnormal" name="A_1102_DESCRIPTION_REFINANCE" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1102_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1102_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102A. <input type="text" value="Description of Charge" class="textnormal" name="A_1102A_DESCRIPTION_REFINANCE" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1102A_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102A_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1102A_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102A_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102B. <input type="text" value="Description of Charge" class="textnormal" name="A_1102B_DESCRIPTION_REFINANCE" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1102B_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102B_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1102B_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102B_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102C. <input type="text" value="Description of Charge" class="textnormal" name="A_1102C_DESCRIPTION_REFINANCE" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1102C_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102C_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1102C_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102C_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102D. <input type="text" value="Description of Charge" class="textnormal" name="A_1102D_DESCRIPTION_REFINANCE" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1102D_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102D_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1102D_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102D_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102E. <input type="text" value="Description of Charge" class="textnormal" name="A_1102E_DESCRIPTION_REFINANCE" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1102E_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102E_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1102E_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102E_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102F. <input type="text" value="Description of Charge" class="textnormal" name="A_1102F_DESCRIPTION_REFINANCE" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1102F_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102F_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1102F_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102F_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102G. <input type="text" value="Description of Charge" class="textnormal" name="A_1102G_DESCRIPTION_REFINANCE" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1102G_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102G_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1102G_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102G_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102H. <input type="text" value="Description of Charge" class="textnormal" name="A_1102H_DESCRIPTION_REFINANCE" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1102H_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102H_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1102H_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102H_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102I. <input type="text" value="Description of Charge" class="textnormal" name="A_1102I_DESCRIPTION_REFINANCE" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1102I_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102I_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1102I_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102I_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1109. <input type="text" value="Description of Charge" class="text" name="A_1109_DESCRIPTION_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1109_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1109_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1109_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1109_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1109_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1109_OUTSIDE_REFINANCE" value="1" onClick="a_1109_outside();" /></td></tr>
<tr>
<td class="bsilver">1110. <input type="text" value="Description of Charge" class="text" name="A_1110_DESCRIPTION_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1110_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1110_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1110_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1110_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1110_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1110_OUTSIDE_REFINANCE" value="1" onClick="a_1110_outside();" /></td></tr>
<tr>
<td class="bsilver">1111. <input type="text" value="Description of Charge" class="text" name="A_1111_DESCRIPTION_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1111_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1111_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1111_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1111_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1111_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1111_OUTSIDE_REFINANCE" value="1" onClick="a_1111_outside();" /></td></tr>
<tr>
<td class="bsilver">1112. <input type="text" value="Description of Charge" class="text" name="A_1112_DESCRIPTION_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1112_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1112_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1112_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1112_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1112_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1112_OUTSIDE_REFINANCE" value="1" onClick="a_1112_outside();" /></td></tr>
<tr>
<td class="bsilver">1113. <input type="text" value="Description of Charge" class="text" name="A_1113_DESCRIPTION_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1113_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1113_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1113_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1113_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1113_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1113_OUTSIDE_REFINANCE" value="1" onClick="a_1113_outside();" /></td></tr>
</table>
<!-- 1300 -->
<table width="600" summary="Type of Loan" border="1" cellspacing="0">
<tr>
<td class="bdarksilver_head">1300. Additional Settlement Charges (for Non-Title/Settlement Charges)</td>
<td class="bdarksilver_head" align="right">Amount</td>
<td class="bdarksilver_head" align="right">Outside</td>

</tr>
<!--- <tr>
<td class="bsilver">1301. <input type="text" value="Description of Charge" class="text" name="A_1301_DESCRIPTION_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1301_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1301_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1301_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1301_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1301_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1301_OUTSIDE_REFINANCE" value="1" onClick="a_1301_outside();" /></td></tr>
 ---><tr>
<td class="bsilver">1302. <input type="text" value="Description of Charge" class="text" name="A_1302_DESCRIPTION_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1302_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1302_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1302_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1302_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1302_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1302_OUTSIDE_REFINANCE" value="1" onClick="a_1302_outside();" /></td></tr>
<tr>
<td class="bsilver">1303. <input type="text" value="Description of Charge" class="text" name="A_1303_DESCRIPTION_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1303_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1303_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1303_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1303_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1303_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1303_OUTSIDE_REFINANCE" value="1" onClick="a_1303_outside();" /></td></tr>
<tr>
<td class="bsilver">1304. <input type="text" value="Description of Charge" class="text" name="A_1304_DESCRIPTION_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1304_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1304_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1304_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1304_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1304_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1304_OUTSIDE_REFINANCE" value="1" onClick="a_1304_outside();" /></td></tr>
<tr>
<td class="bsilver">1305. <input type="text" value="Description of Charge" class="text" name="A_1305_DESCRIPTION_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1305_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1305_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1305_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1305_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1305_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1305_OUTSIDE_REFINANCE" value="1" onClick="a_1305_outside();" /></td></tr>
<tr>
<td class="bsilver">1306. <input type="text" value="Description of Charge" class="text" name="A_1306_DESCRIPTION_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1306_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1306_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1306_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1306_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1306_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1306_OUTSIDE_REFINANCE" value="1" onClick="a_1306_outside();" /></td></tr>
<tr>
<td class="bsilver">1307. <input type="text" value="Description of Charge" class="text" name="A_1307_DESCRIPTION_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1307_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1307_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1307_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1307_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1307_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1307_OUTSIDE_REFINANCE" value="1" onClick="a_1307_outside();" /></td></tr>
<tr>
<td class="bsilver">1308. <input type="text" value="Description of Charge" class="text" name="A_1308_DESCRIPTION_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1308_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1308_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1308_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1308_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1308_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1308_OUTSIDE_REFINANCE" value="1" onClick="a_1308_outside();" /></td></tr>
</table>

<br>
<br>
<br>
<span class="page_title">PURCHASE</span><BR>
<!-- 800 -->
<table width="600" summary="Type of Loan" border="1" cellspacing="0">
<tr><td height="4" colspan="6"></td></tr>
<tr>
<td class="bdarksilver_head">800. Items Payable in Connection with Loan</td>
<td class="bdarksilver_head" align="right">Amount</td>
</tr>
<tr>
<td class="bsilver">801. <input type="text" value="Our origination charge" class="textnormal" name="A_0801_DESCRIPTION_PURCHASE" onFocus="alert('This field may not be changed'); this.blur();" style="width:381;" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_0801_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<tr>
<td class="bsilver">802. <input type="text" value="Your credit or charge (points) for the specific interest rate chosen " class="textnormal" name="A_0802_DESCRIPTION_PURCHASE" onFocus="alert('This field may not be changed'); this.blur();"  style="width:381;"  /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_0802_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">804. <input type="text" value="Appraisal Fee" class="textnormal" name="A_0804_DESCRIPTION_PURCHASE" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_0804_PAYTO_PURCHASE" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_0804_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">805. <input type="text" value="Credit Report" class="textnormal" name="A_0805_DESCRIPTION_PURCHASE" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_0805_PAYTO_PURCHASE" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_0805_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">806. <input type="text" value="Tax Service" class="textnormal" name="A_0806_DESCRIPTION_PURCHASE" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_0806_PAYTO_PURCHASE" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_0806_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">807. <input type="text" value="Flood Certification" class="textnormal" name="A_0807_DESCRIPTION_PURCHASE" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_0807_PAYTO_PURCHASE" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_0807_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">808. <input type="text" class="textnormal" name="A_0808_DESCRIPTION_PURCHASE" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_0808_PAYTO_PURCHASE" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_0808_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');"  /></td>
</tr>
<tr>
<td class="bsilver">809. <input type="text" class="textnormal" name="A_0809_DESCRIPTION_PURCHASE" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_0809_PAYTO_PURCHASE" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_0809_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">810. <input type="text" class="textnormal" name="A_0810_DESCRIPTION_PURCHASE" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_0810_PAYTO_PURCHASE" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_0810_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">811. <input type="text" class="textnormal" name="A_0811_DESCRIPTION_PURCHASE" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_0811_PAYTO_PURCHASE" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_0811_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">812. <input type="text" class="textnormal" name="A_0812_DESCRIPTION_PURCHASE" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_0812_PAYTO_PURCHASE" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_0812_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
</table>
<!-- 1100 -->
<table width="600" summary="Type of Loan" border="1" cellspacing="0">
<tr>
<td class="bdarksilver_head">1100. Title Charges</td>
<td class="bdarksilver_head" align="right">Amount</td>
<td class="bdarksilver_head" align="right">Outside</td>
</tr>
<tr>
<td class="bsilver">1101. Total charges in connection with Title not explicitly listed below</td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1101_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver" colspan=3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Itemized 1101 Charges</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_DESCRIPTION_01_PURCHASE" onFocus="focus_this(this, 'textnormal');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_AMOUNT_01_PURCHASE" onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase();" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_DESCRIPTION_02_PURCHASE" onFocus="focus_this(this, 'textnormal');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_AMOUNT_02_PURCHASE" onFocus="focus_this(this, 'textnormal');"  onBlur="roll_up_1101_purchase();" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_DESCRIPTION_03_PURCHASE" onFocus="focus_this(this, 'textnormal');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_AMOUNT_03_PURCHASE" onFocus="focus_this(this, 'textnormal');"  onBlur="roll_up_1101_purchase();" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_DESCRIPTION_04_PURCHASE" onFocus="focus_this(this, 'textnormal');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_AMOUNT_04_PURCHASE" onFocus="focus_this(this, 'textnormal');"  onBlur="roll_up_1101_purchase();" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_DESCRIPTION_05_PURCHASE" onFocus="focus_this(this, 'textnormal');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_AMOUNT_05_PURCHASE" onFocus="focus_this(this, 'textnormal');"  onBlur="roll_up_1101_purchase();" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_DESCRIPTION_06_PURCHASE" onFocus="focus_this(this, 'textnormal');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_AMOUNT_06_PURCHASE" onFocus="focus_this(this, 'textnormal');"  onBlur="roll_up_1101_purchase();" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_DESCRIPTION_07_PURCHASE" onFocus="focus_this(this, 'textnormal');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_AMOUNT_07_PURCHASE" onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase();"  /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_DESCRIPTION_08_PURCHASE" onFocus="focus_this(this, 'textnormal');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_AMOUNT_08_PURCHASE" onFocus="focus_this(this, 'textnormal');"  onBlur="roll_up_1101_purchase();" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_DESCRIPTION_09_PURCHASE" onFocus="focus_this(this, 'textnormal');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_AMOUNT_09_PURCHASE" onFocus="focus_this(this, 'textnormal');"  onBlur="roll_up_1101_purchase();" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_DESCRIPTION_10_PURCHASE" onFocus="focus_this(this, 'textnormal');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_AMOUNT_10_PURCHASE" onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase();"  /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<td class="bsilver">1102. <input type="text" value="Settlement or Closing Fee" class="textnormal" name="A_1102_DESCRIPTION_PURCHASE" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1102_PAYTO_PURCHASE" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1102_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102A. <input type="text" value="Description of Charge" class="textnormal" name="A_1102A_DESCRIPTION_PURCHASE" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1102A_PAYTO_PURCHASE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102A_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1102A_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102A_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102B. <input type="text" value="Description of Charge" class="textnormal" name="A_1102B_DESCRIPTION_PURCHASE" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1102B_PAYTO_PURCHASE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102B_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1102B_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102B_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102C. <input type="text" value="Description of Charge" class="textnormal" name="A_1102C_DESCRIPTION_PURCHASE" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1102C_PAYTO_PURCHASE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102C_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1102C_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102C_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102D. <input type="text" value="Description of Charge" class="textnormal" name="A_1102D_DESCRIPTION_PURCHASE" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1102D_PAYTO_PURCHASE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102D_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1102D_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102D_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102E. <input type="text" value="Description of Charge" class="textnormal" name="A_1102E_DESCRIPTION_PURCHASE" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1102E_PAYTO_PURCHASE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102E_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1102E_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102E_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102F. <input type="text" value="Description of Charge" class="textnormal" name="A_1102F_DESCRIPTION_PURCHASE" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1102F_PAYTO_PURCHASE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102F_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1102F_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102F_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102G. <input type="text" value="Description of Charge" class="textnormal" name="A_1102G_DESCRIPTION_PURCHASE" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1102G_PAYTO_PURCHASE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102G_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1102G_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102G_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102H. <input type="text" value="Description of Charge" class="textnormal" name="A_1102H_DESCRIPTION_PURCHASE" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1102H_PAYTO_PURCHASE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102H_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1102H_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102H_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102I. <input type="text" value="Description of Charge" class="textnormal" name="A_1102I_DESCRIPTION_PURCHASE" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1102I_PAYTO_PURCHASE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102I_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1102I_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102I_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1109. <input type="text" class="textnormal" name="A_1109_DESCRIPTION_PURCHASE" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1109_PAYTO_PURCHASE" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1109_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1109_OUTSIDE_PURCHASE" value="1" /></td></tr>
<tr>
<td class="bsilver">1110. <input type="text" class="textnormal" name="A_1110_DESCRIPTION_PURCHASE" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1110_PAYTO_PURCHASE" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1110_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1110_OUTSIDE_PURCHASE" value="1" /></td></tr>
</tr>
<tr>
<td class="bsilver">1111. <input type="text" class="textnormal" name="A_1111_DESCRIPTION_PURCHASE" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1111_PAYTO_PURCHASE" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1111_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1111_OUTSIDE_PURCHASE" value="1" /></td></tr>
</tr>
<tr>
<td class="bsilver">1112. <input type="text" class="textnormal" name="A_1112_DESCRIPTION_PURCHASE" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1112_PAYTO_PURCHASE" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1112_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1112_OUTSIDE_PURCHASE" value="1" /></td></tr>
</tr>
<tr>
<td class="bsilver">1113. <input type="text" class="textnormal" name="A_1113_DESCRIPTION_PURCHASE" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1113_PAYTO_PURCHASE" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1113_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1113_OUTSIDE_PURCHASE" value="1" /></td></tr>
</tr>
</table>
<!-- 1300 -->
<table width="600" summary="Type of Loan" border="1" cellspacing="0">
<tr>
<td class="bdarksilver_head">1300. Additional Settlement Charges (for Non-Title/Settlement Charges)</td>
<td class="bdarksilver_head" align="right">Amount</td>
<td class="bdarksilver_head" align="right">Outside</td>

</tr>
<!--- <tr>
<td class="bsilver">1301. <input type="text" class="textnormal" name="A_1301_DESCRIPTION_PURCHASE" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1301_PAYTO_PURCHASE" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1301_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1301_OUTSIDE_PURCHASE" value="1" /></td>
</tr>
 ---><tr>
<td class="bsilver">1302. <input type="text" class="textnormal" name="A_1302_DESCRIPTION_PURCHASE" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1302_PAYTO_PURCHASE" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1302_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1302_OUTSIDE_PURCHASE" value="1" /></td>
</tr>
<tr>
<td class="bsilver">1303. <input type="text" class="textnormal" name="A_1303_DESCRIPTION_PURCHASE" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1303_PAYTO_PURCHASE" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1303_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1303_OUTSIDE_PURCHASE" value="1" /></td>
</tr>
<tr>
<td class="bsilver">1304. <input type="text" class="textnormal" name="A_1304_DESCRIPTION_PURCHASE" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1304_PAYTO_PURCHASE" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1304_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1304_OUTSIDE_PURCHASE" value="1" /></td>
</tr>
<tr>
<td class="bsilver">1305. <input type="text" class="textnormal" name="A_1305_DESCRIPTION_PURCHASE" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1305_PAYTO_PURCHASE" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1305_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1305_OUTSIDE_PURCHASE" value="1" /></td>
</tr>
<tr>
<td class="bsilver">1306. <input type="text" class="textnormal" name="A_1306_DESCRIPTION_PURCHASE" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1306_PAYTO_PURCHASE" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1306_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1306_OUTSIDE_PURCHASE" value="1" /></td>
</tr>
<tr>
<td class="bsilver">1307. <input type="text" class="textnormal" name="A_1307_DESCRIPTION_PURCHASE" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1307_PAYTO_PURCHASE" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1307_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1307_OUTSIDE_PURCHASE" value="1" /></td>
</tr>
<tr>
<td class="bsilver">1308. <input type="text" class="textnormal" name="A_1308_DESCRIPTION_PURCHASE" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1308_PAYTO_PURCHASE" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1308_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1308_OUTSIDE_PURCHASE" value="1" /></td>
</tr>
</table>
<br>
<br>
<br>
<span class="page_title">2ND MORTGAGE with NO Title Insurance</span><BR>
<!-- 800 -->
<table width="600" summary="Type of Loan" border="1" cellspacing="0">
<tr><td height="4" colspan="6"></td></tr>
<tr>
<td class="bdarksilver_head">800. Items Payable in Connection with Loan</td>
<td class="bdarksilver_head" align="right">Amount</td>
</tr>
<tr>
<td class="bsilver">801. <input type="text" value="Our origination charge" class="textnormal" name="A_0801_DESCRIPTION_2ND_NO_TI" onFocus="alert('This field may not be changed'); this.blur();" style="width:381;" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_0801_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<tr>
<td class="bsilver">802. <input type="text" value="Your credit or charge (points) for the specific interest rate chosen " class="textnormal" name="A_0802_DESCRIPTION_2ND_NO_TI" onFocus="alert('This field may not be changed'); this.blur();"  style="width:381;"  /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_0802_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">804. <input type="text" value="Appraisal Fee" class="textnormal" name="A_0804_DESCRIPTION_2ND_NO_TI" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_0804_PAYTO_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_0804_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">805. <input type="text" value="Credit Report" class="textnormal" name="A_0805_DESCRIPTION_2ND_NO_TI" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_0805_PAYTO_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_0805_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">806. <input type="text" value="Tax Service" class="textnormal" name="A_0806_DESCRIPTION_2ND_NO_TI" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_0806_PAYTO_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_0806_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">807. <input type="text" value="Flood Certification" class="textnormal" name="A_0807_DESCRIPTION_2ND_NO_TI" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_0807_PAYTO_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_0807_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">808. <input type="text" class="textnormal" name="A_0808_DESCRIPTION_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_0808_PAYTO_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_0808_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');"  /></td>
</tr>
<tr>
<td class="bsilver">809. <input type="text" class="textnormal" name="A_0809_DESCRIPTION_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_0809_PAYTO_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_0809_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">810. <input type="text" class="textnormal" name="A_0810_DESCRIPTION_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_0810_PAYTO_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_0810_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">811. <input type="text" class="textnormal" name="A_0811_DESCRIPTION_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_0811_PAYTO_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_0811_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">812. <input type="text" class="textnormal" name="A_0812_DESCRIPTION_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_0812_PAYTO_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_0812_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
</table>
<!-- 1100 -->
<table width="600" summary="Type of Loan" border="1" cellspacing="0">
<tr>
<td class="bdarksilver_head">1100. Title Charges</td>
<td class="bdarksilver_head" align="right">Amount</td>
<td class="bdarksilver_head" align="right">Outside</td>
</tr>
<tr>
<td class="bsilver">1101. Total charges in connection with Title not explicitly listed below</td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1101_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver" colspan=3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Itemized 1101 Charges</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_DESCRIPTION_01_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_AMOUNT_01_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');"  onBlur="roll_up_1101_2nd_no_ti();" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_DESCRIPTION_02_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_AMOUNT_02_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_no_ti();" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_DESCRIPTION_03_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_AMOUNT_03_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_no_ti();" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_DESCRIPTION_04_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_AMOUNT_04_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_no_ti();" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_DESCRIPTION_05_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_AMOUNT_05_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_no_ti();" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_DESCRIPTION_06_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_AMOUNT_06_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_no_ti();" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_DESCRIPTION_07_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_AMOUNT_07_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_no_ti();" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_DESCRIPTION_08_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_AMOUNT_08_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_no_ti();" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_DESCRIPTION_09_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_AMOUNT_09_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_no_ti();" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_DESCRIPTION_10_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_AMOUNT_10_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_no_ti();" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<td class="bsilver">1102. <input type="text" value="Settlement or Closing Fee" class="textnormal" name="A_1102_DESCRIPTION_2ND_NO_TI" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1102_PAYTO_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1102_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102A. <input type="text" value="Description of Charge" class="textnormal" name="A_1102A_DESCRIPTION_2ND_NO_TI" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1102A_PAYTO_2ND_NO_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102A_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1102A_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102A_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102B. <input type="text" value="Description of Charge" class="textnormal" name="A_1102B_DESCRIPTION_2ND_NO_TI" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1102B_PAYTO_2ND_NO_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102B_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1102B_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102B_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102C. <input type="text" value="Description of Charge" class="textnormal" name="A_1102C_DESCRIPTION_2ND_NO_TI" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1102C_PAYTO_2ND_NO_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102C_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1102C_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102C_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102D. <input type="text" value="Description of Charge" class="textnormal" name="A_1102D_DESCRIPTION_2ND_NO_TI" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1102D_PAYTO_2ND_NO_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102D_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1102D_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102D_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102E. <input type="text" value="Description of Charge" class="textnormal" name="A_1102E_DESCRIPTION_2ND_NO_TI" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1102E_PAYTO_2ND_NO_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102E_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1102E_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102E_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102F. <input type="text" value="Description of Charge" class="textnormal" name="A_1102F_DESCRIPTION_2ND_NO_TI" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1102F_PAYTO_2ND_NO_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102F_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1102F_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102F_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102G. <input type="text" value="Description of Charge" class="textnormal" name="A_1102G_DESCRIPTION_2ND_NO_TI" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1102G_PAYTO_2ND_NO_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102G_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1102G_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102G_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102H. <input type="text" value="Description of Charge" class="textnormal" name="A_1102H_DESCRIPTION_2ND_NO_TI" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1102H_PAYTO_2ND_NO_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102H_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1102H_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102H_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102I. <input type="text" value="Description of Charge" class="textnormal" name="A_1102I_DESCRIPTION_2ND_NO_TI" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1102I_PAYTO_2ND_NO_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102I_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1102I_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102I_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1109. <input type="text" class="textnormal" name="A_1109_DESCRIPTION_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1109_PAYTO_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1109_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1109_OUTSIDE_2ND_NO_TI" value="1" /></td></tr>
<tr>
<td class="bsilver">1110. <input type="text" class="textnormal" name="A_1110_DESCRIPTION_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1110_PAYTO_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1110_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1110_OUTSIDE_2ND_NO_TI" value="1" /></td></tr>
</tr>
<tr>
<td class="bsilver">1111. <input type="text" class="textnormal" name="A_1111_DESCRIPTION_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1111_PAYTO_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1111_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1111_OUTSIDE_2ND_NO_TI" value="1" /></td></tr>
</tr>
<tr>
<td class="bsilver">1112. <input type="text" class="textnormal" name="A_1112_DESCRIPTION_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1112_PAYTO_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1112_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1112_OUTSIDE_2ND_NO_TI" value="1" /></td></tr>
</tr>
<tr>
<td class="bsilver">1113. <input type="text" class="textnormal" name="A_1113_DESCRIPTION_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1113_PAYTO_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1113_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1113_OUTSIDE_2ND_NO_TI" value="1" /></td></tr>
</tr>
</table>
<!-- 1300 -->
<table width="600" summary="Type of Loan" border="1" cellspacing="0">
<tr>
<td class="bdarksilver_head">1300. Additional Settlement Charges (for Non-Title/Settlement Charges)</td>
<td class="bdarksilver_head" align="right">Amount</td>
<td class="bdarksilver_head" align="right">Outside</td>

</tr>
<!--- <tr>
<td class="bsilver">1301. <input type="text" class="textnormal" name="A_1301_DESCRIPTION_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1301_PAYTO_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1301_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1301_OUTSIDE_2ND_NO_TI" value="1" /></td>
</tr>
 ---><tr>
<td class="bsilver">1302. <input type="text" class="textnormal" name="A_1302_DESCRIPTION_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1302_PAYTO_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1302_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1302_OUTSIDE_2ND_NO_TI" value="1" /></td>
</tr>
<tr>
<td class="bsilver">1303. <input type="text" class="textnormal" name="A_1303_DESCRIPTION_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1303_PAYTO_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1303_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1303_OUTSIDE_2ND_NO_TI" value="1" /></td>
</tr>
<tr>
<td class="bsilver">1304. <input type="text" class="textnormal" name="A_1304_DESCRIPTION_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1304_PAYTO_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1304_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1304_OUTSIDE_2ND_NO_TI" value="1" /></td>
</tr>
<tr>
<td class="bsilver">1305. <input type="text" class="textnormal" name="A_1305_DESCRIPTION_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1305_PAYTO_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1305_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1305_OUTSIDE_2ND_NO_TI" value="1" /></td>
</tr>
<tr>
<td class="bsilver">1306. <input type="text" class="textnormal" name="A_1306_DESCRIPTION_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1306_PAYTO_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1306_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1306_OUTSIDE_2ND_NO_TI" value="1" /></td>
</tr>
<tr>
<td class="bsilver">1307. <input type="text" class="textnormal" name="A_1307_DESCRIPTION_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1307_PAYTO_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1307_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1307_OUTSIDE_2ND_NO_TI" value="1" /></td>
</tr>
<tr>
<td class="bsilver">1308. <input type="text" class="textnormal" name="A_1308_DESCRIPTION_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1308_PAYTO_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1308_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1308_OUTSIDE_2ND_NO_TI" value="1" /></td>
</tr>
</table>
<br>
<br>
<br>
<span class="page_title">2ND MORTGAGE with Title Insurance</span><BR>
<!-- 800 -->
<table width="600" summary="Type of Loan" border="1" cellspacing="0">
<tr><td height="4" colspan="6"></td></tr>
<tr>
<td class="bdarksilver_head">800. Items Payable in Connection with Loan</td>
<td class="bdarksilver_head" align="right">Amount</td>
</tr>
<tr>
<td class="bsilver">801. <input type="text" value="Our origination charge" class="textnormal" name="A_0801_DESCRIPTION_2ND_WITH_TI" onFocus="alert('This field may not be changed'); this.blur();" style="width:381;" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_0801_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<tr>
<td class="bsilver">802. <input type="text" value="Your credit or charge (points) for the specific interest rate chosen " class="textnormal" name="A_0802_DESCRIPTION_2ND_WITH_TI" onFocus="alert('This field may not be changed'); this.blur();"  style="width:381;"  /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_0802_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">804. <input type="text" value="Appraisal Fee" class="textnormal" name="A_0804_DESCRIPTION_2ND_WITH_TI" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_0804_PAYTO_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_0804_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">805. <input type="text" value="Credit Report" class="textnormal" name="A_0805_DESCRIPTION_2ND_WITH_TI" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_0805_PAYTO_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_0805_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">806. <input type="text" value="Tax Service" class="textnormal" name="A_0806_DESCRIPTION_2ND_WITH_TI" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_0806_PAYTO_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_0806_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">807. <input type="text" value="Flood Certification" class="textnormal" name="A_0807_DESCRIPTION_2ND_WITH_TI" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_0807_PAYTO_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_0807_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">808. <input type="text" class="textnormal" name="A_0808_DESCRIPTION_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_0808_PAYTO_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_0808_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');"  /></td>
</tr>
<tr>
<td class="bsilver">809. <input type="text" class="textnormal" name="A_0809_DESCRIPTION_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_0809_PAYTO_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_0809_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">810. <input type="text" class="textnormal" name="A_0810_DESCRIPTION_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_0810_PAYTO_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_0810_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">811. <input type="text" class="textnormal" name="A_0811_DESCRIPTION_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_0811_PAYTO_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_0811_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">812. <input type="text" class="textnormal" name="A_0812_DESCRIPTION_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_0812_PAYTO_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_0812_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
</table>
<!-- 1100 -->
<table width="600" summary="Type of Loan" border="1" cellspacing="0">
<tr>
<td class="bdarksilver_head">1100. Title Charges</td>
<td class="bdarksilver_head" align="right">Amount</td>
<td class="bdarksilver_head" align="right">Outside</td>
</tr>
<tr>
<td class="bsilver">1101. Total charges in connection with Title not explicitly listed below</td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1101_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver" colspan=3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Itemized 1101 Charges</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_DESCRIPTION_01_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_AMOUNT_01_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_with_ti();" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_DESCRIPTION_02_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_AMOUNT_02_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_with_ti();" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_DESCRIPTION_03_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_AMOUNT_03_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_with_ti();" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_DESCRIPTION_04_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_AMOUNT_04_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_with_ti();" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_DESCRIPTION_05_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_AMOUNT_05_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_with_ti();" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_DESCRIPTION_06_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_AMOUNT_06_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_with_ti();" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_DESCRIPTION_07_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_AMOUNT_07_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_with_ti();" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_DESCRIPTION_08_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_AMOUNT_08_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_with_ti();" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_DESCRIPTION_09_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_AMOUNT_09_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_with_ti();" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_DESCRIPTION_10_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_AMOUNT_10_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_with_ti();" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<td class="bsilver">1102. <input type="text" value="Settlement or Closing Fee" class="textnormal" name="A_1102_DESCRIPTION_2ND_WITH_TI" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1102_PAYTO_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1102_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102A. <input type="text" value="Description of Charge" class="textnormal" name="A_1102A_DESCRIPTION_2ND_WITH_TI" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1102A_PAYTO_2ND_WITH_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102A_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1102A_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102A_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102B. <input type="text" value="Description of Charge" class="textnormal" name="A_1102B_DESCRIPTION_2ND_WITH_TI" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1102B_PAYTO_2ND_WITH_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102B_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1102B_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102B_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102C. <input type="text" value="Description of Charge" class="textnormal" name="A_1102C_DESCRIPTION_2ND_WITH_TI" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1102C_PAYTO_2ND_WITH_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102C_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1102C_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102C_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102D. <input type="text" value="Description of Charge" class="textnormal" name="A_1102D_DESCRIPTION_2ND_WITH_TI" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1102D_PAYTO_2ND_WITH_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102D_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1102D_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102D_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102E. <input type="text" value="Description of Charge" class="textnormal" name="A_1102E_DESCRIPTION_2ND_WITH_TI" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1102E_PAYTO_2ND_WITH_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102E_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1102E_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102E_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102F. <input type="text" value="Description of Charge" class="textnormal" name="A_1102F_DESCRIPTION_2ND_WITH_TI" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1102F_PAYTO_2ND_WITH_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102F_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1102F_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102F_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102G. <input type="text" value="Description of Charge" class="textnormal" name="A_1102G_DESCRIPTION_2ND_WITH_TI" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1102G_PAYTO_2ND_WITH_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102G_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1102G_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102G_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102H. <input type="text" value="Description of Charge" class="textnormal" name="A_1102H_DESCRIPTION_2ND_WITH_TI" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1102H_PAYTO_2ND_WITH_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102H_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1102H_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102H_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102I. <input type="text" value="Description of Charge" class="textnormal" name="A_1102I_DESCRIPTION_2ND_WITH_TI" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1102I_PAYTO_2ND_WITH_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102I_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1102I_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102I_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1109. <input type="text" class="textnormal" name="A_1109_DESCRIPTION_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1109_PAYTO_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1109_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1109_OUTSIDE_2ND_WITH_TI" value="1" /></td></tr>
<tr>
<td class="bsilver">1110. <input type="text" class="textnormal" name="A_1110_DESCRIPTION_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1110_PAYTO_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1110_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1110_OUTSIDE_2ND_WITH_TI" value="1" /></td></tr>
</tr>
<tr>
<td class="bsilver">1111. <input type="text" class="textnormal" name="A_1111_DESCRIPTION_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1111_PAYTO_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1111_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1111_OUTSIDE_2ND_WITH_TI" value="1" /></td></tr>
</tr>
<tr>
<td class="bsilver">1112. <input type="text" class="textnormal" name="A_1112_DESCRIPTION_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1112_PAYTO_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1112_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1112_OUTSIDE_2ND_WITH_TI" value="1" /></td></tr>
</tr>
<tr>
<td class="bsilver">1113. <input type="text" class="textnormal" name="A_1113_DESCRIPTION_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1113_PAYTO_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1113_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1113_OUTSIDE_2ND_WITH_TI" value="1" /></td></tr>
</tr>
</table>
<!-- 1300 -->
<table width="600" summary="Type of Loan" border="1" cellspacing="0">
<tr>
<td class="bdarksilver_head">1300. Additional Settlement Charges (for Non-Title/Settlement Charges)</td>
<td class="bdarksilver_head" align="right">Amount</td>
<td class="bdarksilver_head" align="right">Outside</td>

</tr>
<!--- <tr>
<td class="bsilver">1301. <input type="text" class="textnormal" name="A_1301_DESCRIPTION_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1301_PAYTO_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1301_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1301_OUTSIDE_2ND_WITH_TI" value="1" /></td>
</tr>
 ---><tr>
<td class="bsilver">1302. <input type="text" class="textnormal" name="A_1302_DESCRIPTION_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1302_PAYTO_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1302_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1302_OUTSIDE_2ND_WITH_TI" value="1" /></td>
</tr>
<tr>
<td class="bsilver">1303. <input type="text" class="textnormal" name="A_1303_DESCRIPTION_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1303_PAYTO_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1303_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1303_OUTSIDE_2ND_WITH_TI" value="1" /></td>
</tr>
<tr>
<td class="bsilver">1304. <input type="text" class="textnormal" name="A_1304_DESCRIPTION_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1304_PAYTO_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1304_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1304_OUTSIDE_2ND_WITH_TI" value="1" /></td>
</tr>
<tr>
<td class="bsilver">1305. <input type="text" class="textnormal" name="A_1305_DESCRIPTION_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1305_PAYTO_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1305_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1305_OUTSIDE_2ND_WITH_TI" value="1" /></td>
</tr>
<tr>
<td class="bsilver">1306. <input type="text" class="textnormal" name="A_1306_DESCRIPTION_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1306_PAYTO_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1306_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1306_OUTSIDE_2ND_WITH_TI" value="1" /></td>
</tr>
<tr>
<td class="bsilver">1307. <input type="text" class="textnormal" name="A_1307_DESCRIPTION_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1307_PAYTO_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1307_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1307_OUTSIDE_2ND_WITH_TI" value="1" /></td>
</tr>
<tr>
<td class="bsilver">1308. <input type="text" class="textnormal" name="A_1308_DESCRIPTION_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1308_PAYTO_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1308_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1308_OUTSIDE_2ND_WITH_TI" value="1" /></td>
</tr>
</table>
<br>
<br>
<br>
<span class="page_title">PURCHASE - SELLER</span><BR>
<!-- 800 -->
<table width="600" summary="Type of Loan" border="1" cellspacing="0">
<tr><td height="4" colspan="6"></td></tr>
<tr>
<td class="bdarksilver_head">800. Items Payable in Connection with Loan</td>
<td class="bdarksilver_head" align="right">Amount</td>
</tr>
<tr>
<td class="bsilver">801. <input type="text" value="Our origination charge" class="textnormal" name="A_0801_DESCRIPTION_PURCHASE_SELLER" onFocus="alert('This field may not be changed'); this.blur();" style="width:381;" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_0801_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<tr>
<td class="bsilver">802. <input type="text" value="Your credit or charge (points) for the specific interest rate chosen " class="textnormal" name="A_0802_DESCRIPTION_PURCHASE_SELLER" onFocus="alert('This field may not be changed'); this.blur();"  style="width:381;"  /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_0802_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">804. <input type="text" value="Appraisal Fee" class="textnormal" name="A_0804_DESCRIPTION_PURCHASE_SELLER" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_0804_PAYTO_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_0804_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">805. <input type="text" value="Credit Report" class="textnormal" name="A_0805_DESCRIPTION_PURCHASE_SELLER" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_0805_PAYTO_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_0805_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">806. <input type="text" value="Tax Service" class="textnormal" name="A_0806_DESCRIPTION_PURCHASE_SELLER" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_0806_PAYTO_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_0806_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">807. <input type="text" value="Flood Certification" class="textnormal" name="A_0807_DESCRIPTION_PURCHASE_SELLER" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_0807_PAYTO_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_0807_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">808. <input type="text" class="textnormal" name="A_0808_DESCRIPTION_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_0808_PAYTO_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_0808_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');"  /></td>
</tr>
<tr>
<td class="bsilver">809. <input type="text" class="textnormal" name="A_0809_DESCRIPTION_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_0809_PAYTO_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_0809_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">810. <input type="text" class="textnormal" name="A_0810_DESCRIPTION_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_0810_PAYTO_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_0810_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">811. <input type="text" class="textnormal" name="A_0811_DESCRIPTION_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_0811_PAYTO_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_0811_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">812. <input type="text" class="textnormal" name="A_0812_DESCRIPTION_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_0812_PAYTO_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_0812_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
</table>
<!-- 1100 -->
<table width="600" summary="Type of Loan" border="1" cellspacing="0">
<tr>
<td class="bdarksilver_head">1100. Title Charges</td>
<td class="bdarksilver_head" align="right">Amount</td>
<td class="bdarksilver_head" align="right">Outside</td>
</tr>
<tr>
<td class="bsilver">1101. Total charges in connection with Title not explicitly listed below</td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1101_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver" colspan=3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Itemized 1101 Charges</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_DESCRIPTION_01_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_AMOUNT_01_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase_seller();" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_DESCRIPTION_02_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_AMOUNT_02_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase_seller();" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_DESCRIPTION_03_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_AMOUNT_03_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase_seller();" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_DESCRIPTION_04_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_AMOUNT_04_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase_seller();" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_DESCRIPTION_05_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_AMOUNT_05_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase_seller();" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_DESCRIPTION_06_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_AMOUNT_06_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase_seller();" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_DESCRIPTION_07_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_AMOUNT_07_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase_seller();" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_DESCRIPTION_08_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_AMOUNT_08_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase_seller();" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_DESCRIPTION_09_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_AMOUNT_09_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase_seller();" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_DESCRIPTION_10_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="textnormal" name="A_1101_ITEM_AMOUNT_10_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase_seller();" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center">&nbsp;</td></tr>
<tr>
<td class="bsilver">1102. <input type="text" value="Settlement or Closing Fee" class="textnormal" name="A_1102_DESCRIPTION_PURCHASE_SELLER" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1102_PAYTO_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1102_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102A. <input type="text" value="Description of Charge" class="textnormal" name="A_1102A_DESCRIPTION_PURCHASE_SELLER" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1102A_PAYTO_PURCHASE_SELLER"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102A_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1102A_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102A_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102B. <input type="text" value="Description of Charge" class="textnormal" name="A_1102B_DESCRIPTION_PURCHASE_SELLER" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1102B_PAYTO_PURCHASE_SELLER"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102B_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1102B_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102B_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102C. <input type="text" value="Description of Charge" class="textnormal" name="A_1102C_DESCRIPTION_PURCHASE_SELLER" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1102C_PAYTO_PURCHASE_SELLER"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102C_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1102C_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102C_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102D. <input type="text" value="Description of Charge" class="textnormal" name="A_1102D_DESCRIPTION_PURCHASE_SELLER" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1102D_PAYTO_PURCHASE_SELLER"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102D_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1102D_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102D_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102E. <input type="text" value="Description of Charge" class="textnormal" name="A_1102E_DESCRIPTION_PURCHASE_SELLER" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1102E_PAYTO_PURCHASE_SELLER"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102E_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1102E_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102E_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102F. <input type="text" value="Description of Charge" class="textnormal" name="A_1102F_DESCRIPTION_PURCHASE_SELLER" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1102F_PAYTO_PURCHASE_SELLER"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102F_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1102F_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102F_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102G. <input type="text" value="Description of Charge" class="textnormal" name="A_1102G_DESCRIPTION_PURCHASE_SELLER" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1102G_PAYTO_PURCHASE_SELLER"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102G_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1102G_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102G_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102H. <input type="text" value="Description of Charge" class="textnormal" name="A_1102H_DESCRIPTION_PURCHASE_SELLER" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1102H_PAYTO_PURCHASE_SELLER"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102H_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1102H_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102H_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102I. <input type="text" value="Description of Charge" class="textnormal" name="A_1102I_DESCRIPTION_PURCHASE_SELLER" onFocus="alert('This field may not be changed'); this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="Payee Name" class="text" name="A_1102I_PAYTO_PURCHASE_SELLER"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102I_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="Charge Amount" class="small" name="A_1102I_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102I_amount(); unfocus_this(this, 'Charge Amount', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1109. <input type="text" class="textnormal" name="A_1109_DESCRIPTION_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1109_PAYTO_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1109_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1109_OUTSIDE_PURCHASE_SELLER" value="1" /></td></tr>
<tr>
<td class="bsilver">1110. <input type="text" class="textnormal" name="A_1110_DESCRIPTION_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1110_PAYTO_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1110_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1110_OUTSIDE_PURCHASE_SELLER" value="1" /></td></tr>
</tr>
<tr>
<td class="bsilver">1111. <input type="text" class="textnormal" name="A_1111_DESCRIPTION_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1111_PAYTO_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1111_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1111_OUTSIDE_PURCHASE_SELLER" value="1" /></td></tr>
</tr>
<tr>
<td class="bsilver">1112. <input type="text" class="textnormal" name="A_1112_DESCRIPTION_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1112_PAYTO_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1112_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1112_OUTSIDE_PURCHASE_SELLER" value="1" /></td></tr>
</tr>
<tr>
<td class="bsilver">1113. <input type="text" class="textnormal" name="A_1113_DESCRIPTION_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1113_PAYTO_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1113_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1113_OUTSIDE_PURCHASE_SELLER" value="1" /></td></tr>
</tr>
</table>
<!-- 1300 -->
<table width="600" summary="Type of Loan" border="1" cellspacing="0">
<tr>
<td class="bdarksilver_head">1300. Additional Settlement Charges (for Non-Title/Settlement Charges)</td>
<td class="bdarksilver_head" align="right">Amount</td>
<td class="bdarksilver_head" align="right">Outside</td>
</tr>
<!--- <tr>
<td class="bsilver">1301. <input type="text" class="textnormal" name="A_1301_DESCRIPTION_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1301_PAYTO_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1301_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1301_OUTSIDE_PURCHASE_SELLER" value="1" /></td>
</tr>
 ---><tr>
<td class="bsilver">1302. <input type="text" class="textnormal" name="A_1302_DESCRIPTION_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1302_PAYTO_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1302_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1302_OUTSIDE_PURCHASE_SELLER" value="1" /></td>
</tr>
<tr>
<td class="bsilver">1303. <input type="text" class="textnormal" name="A_1303_DESCRIPTION_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1303_PAYTO_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1303_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1303_OUTSIDE_PURCHASE_SELLER" value="1" /></td>
</tr>
<tr>
<td class="bsilver">1304. <input type="text" class="textnormal" name="A_1304_DESCRIPTION_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1304_PAYTO_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1304_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1304_OUTSIDE_PURCHASE_SELLER" value="1" /></td>
</tr>
<tr>
<td class="bsilver">1305. <input type="text" class="textnormal" name="A_1305_DESCRIPTION_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1305_PAYTO_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1305_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1305_OUTSIDE_PURCHASE_SELLER" value="1" /></td>
</tr>
<tr>
<td class="bsilver">1306. <input type="text" class="textnormal" name="A_1306_DESCRIPTION_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1306_PAYTO_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1306_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1306_OUTSIDE_PURCHASE_SELLER" value="1" /></td>
</tr>
<tr>
<td class="bsilver">1307. <input type="text" class="textnormal" name="A_1307_DESCRIPTION_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1307_PAYTO_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1307_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1307_OUTSIDE_PURCHASE_SELLER" value="1" /></td>
</tr>
<tr>
<td class="bsilver">1308. <input type="text" class="textnormal" name="A_1308_DESCRIPTION_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" class="textnormal" name="A_1308_PAYTO_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text" class="smallnormal" name="A_1308_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1308_OUTSIDE_PURCHASE_SELLER" value="1" /></td>
</tr>
	<tr>
		<td colspan=3 align=right class="bordered">	
			<INPUT TYPE=image src="./images/button_submit.gif" border=0>
		</td>
	</tr>

</table>
			
	<!--- ======================================================== --->

		</td>
	</tr>

		</td>
	</tr>
</table>
		
		</td>		

		

	</tr>
</table>


	</td>
</tr>
</table>	

	</td>
</tr>
</table>


</BODY>
</HTML>

