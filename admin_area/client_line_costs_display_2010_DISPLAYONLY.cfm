<cfparam name="url.add_counties" default="0">
<cfparam name="url.add_cities" default="0">
<cfparam name="find_cities.recordcount" default="0">
<cfparam name="find_counties.recordcount" default="0">
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

		<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_values">
			SELECT *
			FROM company_billing_values_HUD2010
			WHERE billing_id = #billing_id#
		</CFQUERY>
		

		<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_states">
		
			SELECT distinct a_states
			FROM company_billing_states_HUD2010
			WHERE billing_id = #billing_id#
			
		
		</CFQUERY>
		
		<CFSET a_st_list_4 = ArrayNew(1)>
	
		<CFSET a_count = "1">
		
		<CFOUTPUT QUERY="read_this_sets_billing_states">
				
				<CFSET a_st_list_4[a_count] = #a_states#>
				
				<CFSET a_count = #a_count# + "1">			
		</CFOUTPUT>
				

		<CFQUERY datasource="#request.dsn#" NAME="find_itemized">		
			SELECT *
			FROM ITEMIZED_1101_CHARGES
			WHERE company_ID = #company_id# and billing_ID = #billing_id#
			order by ID desc
		</CFQUERY>
<cfif find_itemized.recordcount eq 0>
		<CFQUERY datasource="#request.dsn#" NAME="add_itemized">		
			insert into ITEMIZED_1101_CHARGES (company_id, billing_id)
			values(#company_id#, #billing_id#)
		</CFQUERY>
</cfif>

		<CFQUERY datasource="#request.dsn#" NAME="get_fees">		
			SELECT *
			FROM company_billing_values_HUD2010 c, ITEMIZED_1101_CHARGES i
			WHERE c.company_ID = #company_id# and c.billing_ID = #billing_id#
			and i.billing_id = c.billing_id	
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="get_fees_b">		
			SELECT *
			FROM company_billing_values_b_HUD2010
			WHERE company_ID = #company_id# and billing_ID = #billing_id#		
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_company_billing_states">
		
			SELECT *
			FROM company_billing_states_HUD2010
			WHERE company_ID = #company_id#
			order by state_id desc
		
		</CFQUERY>
				<CFSET a_st_list_x = "">
				
					<CFOUTPUT QUERY="read_company_billing_states">
						<CFSET a_st_list_x = #a_st_list_x# & #a_states# & ",">
					</CFOUTPUT>
					
				<CFSET a_st_list_7 = #ListToArray(a_st_list_x, ",")#>


		<CFQUERY datasource="#request.dsn#" NAME="read_all_first_title_states">
		
			SELECT *
			FROM first_title_states
			ORDER BY st_abbrev ASC
		
		</CFQUERY>		


<CFQUERY datasource="#request.dsn#" NAME="read_current_agency_assoc">
		
			SELECT *
			FROM company_agency_assoc_HUD2010
			WHERE billing_id = #read_this_sets_billing_values.billing_id#
		
		</CFQUERY>



<CFQUERY datasource="#request.dsn#" NAME="read_agencies">
		
			SELECT *
			FROM Title_FT_agencies 
			ORDER BY Company ASC, State ASC
		</CFQUERY>	
		
		<CFSET a_agency_id = ArrayNew(1)>
		<CFSET a_agency_state = ArrayNew(1)>
		<CFSET a_agency_name = ArrayNew(1)>
		<CFSET a_count = "1">
		
		<CFOUTPUT QUERY="read_agencies">
				<CFSET a_agency_id[a_count] = #title_FT_Agency_ID#>
				<CFSET a_agency_state[a_count] = #state#>
				<CFSET a_agency_name[a_count] = #company#>
				<CFSET a_count = #a_count# + "1">			
		</CFOUTPUT>
		
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
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_11_PURCHASE.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_11_PURCHASE.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_11_PURCHASE.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_12_PURCHASE.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_12_PURCHASE.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_12_PURCHASE.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_13_PURCHASE.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_13_PURCHASE.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_13_PURCHASE.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_14_PURCHASE.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_14_PURCHASE.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_14_PURCHASE.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_15_PURCHASE.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_15_PURCHASE.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_15_PURCHASE.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_16_PURCHASE.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_16_PURCHASE.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_16_PURCHASE.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_17_PURCHASE.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_17_PURCHASE.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_17_PURCHASE.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_18_PURCHASE.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_18_PURCHASE.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_18_PURCHASE.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_19_PURCHASE.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_19_PURCHASE.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_19_PURCHASE.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_20_PURCHASE.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_20_PURCHASE.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_20_PURCHASE.value);
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
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_11_2ND_NO_TI.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_11_2ND_NO_TI.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_11_2ND_NO_TI.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_12_2ND_NO_TI.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_12_2ND_NO_TI.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_12_2ND_NO_TI.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_13_2ND_NO_TI.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_13_2ND_NO_TI.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_13_2ND_NO_TI.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_14_2ND_NO_TI.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_14_2ND_NO_TI.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_14_2ND_NO_TI.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_15_2ND_NO_TI.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_15_2ND_NO_TI.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_15_2ND_NO_TI.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_16_2ND_NO_TI.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_16_2ND_NO_TI.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_16_2ND_NO_TI.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_17_2ND_NO_TI.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_17_2ND_NO_TI.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_17_2ND_NO_TI.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_18_2ND_NO_TI.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_18_2ND_NO_TI.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_18_2ND_NO_TI.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_19_2ND_NO_TI.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_19_2ND_NO_TI.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_19_2ND_NO_TI.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_20_2ND_NO_TI.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_20_2ND_NO_TI.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_20_2ND_NO_TI.value);
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
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_11_2ND_WITH_TI.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_11_2ND_WITH_TI.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_11_2ND_WITH_TI.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_12_2ND_WITH_TI.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_12_2ND_WITH_TI.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_12_2ND_WITH_TI.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_13_2ND_WITH_TI.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_13_2ND_WITH_TI.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_13_2ND_WITH_TI.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_14_2ND_WITH_TI.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_14_2ND_WITH_TI.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_14_2ND_WITH_TI.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_15_2ND_WITH_TI.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_15_2ND_WITH_TI.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_15_2ND_WITH_TI.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_16_2ND_WITH_TI.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_16_2ND_WITH_TI.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_16_2ND_WITH_TI.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_17_2ND_WITH_TI.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_17_2ND_WITH_TI.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_17_2ND_WITH_TI.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_18_2ND_WITH_TI.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_18_2ND_WITH_TI.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_18_2ND_WITH_TI.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_19_2ND_WITH_TI.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_19_2ND_WITH_TI.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_19_2ND_WITH_TI.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_20_2ND_WITH_TI.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_20_2ND_WITH_TI.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_20_2ND_WITH_TI.value);
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
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_11_PURCHASE_SELLER.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_11_PURCHASE_SELLER.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_11_PURCHASE_SELLER.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_12_PURCHASE_SELLER.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_12_PURCHASE_SELLER.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_12_PURCHASE_SELLER.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_13_PURCHASE_SELLER.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_13_PURCHASE_SELLER.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_13_PURCHASE_SELLER.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_14_PURCHASE_SELLER.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_14_PURCHASE_SELLER.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_14_PURCHASE_SELLER.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_15_PURCHASE_SELLER.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_15_PURCHASE_SELLER.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_15_PURCHASE_SELLER.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_16_PURCHASE_SELLER.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_16_PURCHASE_SELLER.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_16_PURCHASE_SELLER.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_17_PURCHASE_SELLER.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_17_PURCHASE_SELLER.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_17_PURCHASE_SELLER.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_18_PURCHASE_SELLER.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_18_PURCHASE_SELLER.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_18_PURCHASE_SELLER.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_19_PURCHASE_SELLER.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_19_PURCHASE_SELLER.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_19_PURCHASE_SELLER.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_20_PURCHASE_SELLER.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_20_PURCHASE_SELLER.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_20_PURCHASE_SELLER.value);
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
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_11_REFINANCE.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_11_REFINANCE.value != '' 
	&& document.frm.A_1101_ITEM_AMOUNT_11_REFINANCE.value != 'Charge Amount') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_11_REFINANCE.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_12_REFINANCE.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_12_REFINANCE.value != '' 
	&& document.frm.A_1101_ITEM_AMOUNT_12_REFINANCE.value != 'Charge Amount') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_12_REFINANCE.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_13_REFINANCE.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_13_REFINANCE.value != '' 
	&& document.frm.A_1101_ITEM_AMOUNT_13_REFINANCE.value != 'Charge Amount') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_13_REFINANCE.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_14_REFINANCE.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_14_REFINANCE.value != '' 
	&& document.frm.A_1101_ITEM_AMOUNT_14_REFINANCE.value != 'Charge Amount') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_14_REFINANCE.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_15_REFINANCE.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_15_REFINANCE.value != '' 
	&& document.frm.A_1101_ITEM_AMOUNT_15_REFINANCE.value != 'Charge Amount') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_15_REFINANCE.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_16_REFINANCE.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_16_REFINANCE.value != '' 
	&& document.frm.A_1101_ITEM_AMOUNT_16_REFINANCE.value != 'Charge Amount') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_16_REFINANCE.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_17_REFINANCE.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_17_REFINANCE.value != '' 
	&& document.frm.A_1101_ITEM_AMOUNT_17_REFINANCE.value != 'Charge Amount') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_17_REFINANCE.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_18_REFINANCE.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_18_REFINANCE.value != '' 
	&& document.frm.A_1101_ITEM_AMOUNT_18_REFINANCE.value != 'Charge Amount') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_18_REFINANCE.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_19_REFINANCE.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_19_REFINANCE.value != '' 
	&& document.frm.A_1101_ITEM_AMOUNT_19_REFINANCE.value != 'Charge Amount') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_19_REFINANCE.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_20_REFINANCE.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_20_REFINANCE.value != '' 
	&& document.frm.A_1101_ITEM_AMOUNT_20_REFINANCE.value != 'Charge Amount') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_20_REFINANCE.value);
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

function a_1101_11_amount(form) {
if (document.frm.A_1101_ITEM_AMOUNT_11_REFINANCE.value != '' && document.frm.A_1101_ITEM_AMOUNT_11_REFINANCE.value != 'Description of Charge') {
document.frm.A_1101_ITEM_AMOUNT_11_PURCHASE.value = document.frm.A_1101_ITEM_AMOUNT_11_REFINANCE.value;
document.frm.A_1101_ITEM_AMOUNT_11_2ND_NO_TI.value = document.frm.A_1101_ITEM_AMOUNT_11_REFINANCE.value;
document.frm.A_1101_ITEM_AMOUNT_11_2ND_WITH_TI.value = document.frm.A_1101_ITEM_AMOUNT_11_REFINANCE.value;
} else { 
document.frm.A_1101_ITEM_AMOUNT_11_PURCHASE.value = '';
document.frm.A_1101_ITEM_AMOUNT_11_2ND_NO_TI.value = '';
document.frm.A_1101_ITEM_AMOUNT_11_2ND_WITH_TI.value = '';
}
}

function a_1101_12_amount(form) {
if (document.frm.A_1101_ITEM_AMOUNT_12_REFINANCE.value != '' && document.frm.A_1101_ITEM_AMOUNT_12_REFINANCE.value != 'Description of Charge') {
document.frm.A_1101_ITEM_AMOUNT_12_PURCHASE.value = document.frm.A_1101_ITEM_AMOUNT_12_REFINANCE.value;
document.frm.A_1101_ITEM_AMOUNT_12_2ND_NO_TI.value = document.frm.A_1101_ITEM_AMOUNT_12_REFINANCE.value;
document.frm.A_1101_ITEM_AMOUNT_12_2ND_WITH_TI.value = document.frm.A_1101_ITEM_AMOUNT_12_REFINANCE.value;
} else { 
document.frm.A_1101_ITEM_AMOUNT_12_PURCHASE.value = '';
document.frm.A_1101_ITEM_AMOUNT_12_2ND_NO_TI.value = '';
document.frm.A_1101_ITEM_AMOUNT_12_2ND_WITH_TI.value = '';
}
}

function a_1101_13_amount(form) {
if (document.frm.A_1101_ITEM_AMOUNT_13_REFINANCE.value != '' && document.frm.A_1101_ITEM_AMOUNT_13_REFINANCE.value != 'Description of Charge') {
document.frm.A_1101_ITEM_AMOUNT_13_PURCHASE.value = document.frm.A_1101_ITEM_AMOUNT_13_REFINANCE.value;
document.frm.A_1101_ITEM_AMOUNT_13_2ND_NO_TI.value = document.frm.A_1101_ITEM_AMOUNT_13_REFINANCE.value;
document.frm.A_1101_ITEM_AMOUNT_13_2ND_WITH_TI.value = document.frm.A_1101_ITEM_AMOUNT_13_REFINANCE.value;
} else { 
document.frm.A_1101_ITEM_AMOUNT_13_PURCHASE.value = '';
document.frm.A_1101_ITEM_AMOUNT_13_2ND_NO_TI.value = '';
document.frm.A_1101_ITEM_AMOUNT_13_2ND_WITH_TI.value = '';
}
}

function a_1101_14_amount(form) {
if (document.frm.A_1101_ITEM_AMOUNT_14_REFINANCE.value != '' && document.frm.A_1101_ITEM_AMOUNT_14_REFINANCE.value != 'Description of Charge') {
document.frm.A_1101_ITEM_AMOUNT_14_PURCHASE.value = document.frm.A_1101_ITEM_AMOUNT_14_REFINANCE.value;
document.frm.A_1101_ITEM_AMOUNT_14_2ND_NO_TI.value = document.frm.A_1101_ITEM_AMOUNT_14_REFINANCE.value;
document.frm.A_1101_ITEM_AMOUNT_14_2ND_WITH_TI.value = document.frm.A_1101_ITEM_AMOUNT_14_REFINANCE.value;
} else { 
document.frm.A_1101_ITEM_AMOUNT_14_PURCHASE.value = '';
document.frm.A_1101_ITEM_AMOUNT_14_2ND_NO_TI.value = '';
document.frm.A_1101_ITEM_AMOUNT_14_2ND_WITH_TI.value = '';
}
}

function a_1101_15_amount(form) {
if (document.frm.A_1101_ITEM_AMOUNT_15_REFINANCE.value != '' && document.frm.A_1101_ITEM_AMOUNT_15_REFINANCE.value != 'Description of Charge') {
document.frm.A_1101_ITEM_AMOUNT_15_PURCHASE.value = document.frm.A_1101_ITEM_AMOUNT_15_REFINANCE.value;
document.frm.A_1101_ITEM_AMOUNT_15_2ND_NO_TI.value = document.frm.A_1101_ITEM_AMOUNT_15_REFINANCE.value;
document.frm.A_1101_ITEM_AMOUNT_15_2ND_WITH_TI.value = document.frm.A_1101_ITEM_AMOUNT_15_REFINANCE.value;
} else { 
document.frm.A_1101_ITEM_AMOUNT_15_PURCHASE.value = '';
document.frm.A_1101_ITEM_AMOUNT_15_2ND_NO_TI.value = '';
document.frm.A_1101_ITEM_AMOUNT_15_2ND_WITH_TI.value = '';
}
}
function a_1101_16_amount(form) {
if (document.frm.A_1101_ITEM_AMOUNT_16_REFINANCE.value != '' && document.frm.A_1101_ITEM_AMOUNT_16_REFINANCE.value != 'Description of Charge') {
document.frm.A_1101_ITEM_AMOUNT_16_PURCHASE.value = document.frm.A_1101_ITEM_AMOUNT_16_REFINANCE.value;
document.frm.A_1101_ITEM_AMOUNT_16_2ND_NO_TI.value = document.frm.A_1101_ITEM_AMOUNT_16_REFINANCE.value;
document.frm.A_1101_ITEM_AMOUNT_16_2ND_WITH_TI.value = document.frm.A_1101_ITEM_AMOUNT_16_REFINANCE.value;
} else { 
document.frm.A_1101_ITEM_AMOUNT_16_PURCHASE.value = '';
document.frm.A_1101_ITEM_AMOUNT_16_2ND_NO_TI.value = '';
document.frm.A_1101_ITEM_AMOUNT_16_2ND_WITH_TI.value = '';
}
}
function a_1101_17_amount(form) {
if (document.frm.A_1101_ITEM_AMOUNT_17_REFINANCE.value != '' && document.frm.A_1101_ITEM_AMOUNT_17_REFINANCE.value != 'Description of Charge') {
document.frm.A_1101_ITEM_AMOUNT_17_PURCHASE.value = document.frm.A_1101_ITEM_AMOUNT_17_REFINANCE.value;
document.frm.A_1101_ITEM_AMOUNT_17_2ND_NO_TI.value = document.frm.A_1101_ITEM_AMOUNT_17_REFINANCE.value;
document.frm.A_1101_ITEM_AMOUNT_17_2ND_WITH_TI.value = document.frm.A_1101_ITEM_AMOUNT_17_REFINANCE.value;
} else { 
document.frm.A_1101_ITEM_AMOUNT_17_PURCHASE.value = '';
document.frm.A_1101_ITEM_AMOUNT_17_2ND_NO_TI.value = '';
document.frm.A_1101_ITEM_AMOUNT_17_2ND_WITH_TI.value = '';
}
}
function a_1101_18_amount(form) {
if (document.frm.A_1101_ITEM_AMOUNT_18_REFINANCE.value != '' && document.frm.A_1101_ITEM_AMOUNT_18_REFINANCE.value != 'Description of Charge') {
document.frm.A_1101_ITEM_AMOUNT_18_PURCHASE.value = document.frm.A_1101_ITEM_AMOUNT_18_REFINANCE.value;
document.frm.A_1101_ITEM_AMOUNT_18_2ND_NO_TI.value = document.frm.A_1101_ITEM_AMOUNT_18_REFINANCE.value;
document.frm.A_1101_ITEM_AMOUNT_18_2ND_WITH_TI.value = document.frm.A_1101_ITEM_AMOUNT_18_REFINANCE.value;
} else { 
document.frm.A_1101_ITEM_AMOUNT_18_PURCHASE.value = '';
document.frm.A_1101_ITEM_AMOUNT_18_2ND_NO_TI.value = '';
document.frm.A_1101_ITEM_AMOUNT_18_2ND_WITH_TI.value = '';
}
}
function a_1101_19_amount(form) {
if (document.frm.A_1101_ITEM_AMOUNT_19_REFINANCE.value != '' && document.frm.A_1101_ITEM_AMOUNT_19_REFINANCE.value != 'Description of Charge') {
document.frm.A_1101_ITEM_AMOUNT_19_PURCHASE.value = document.frm.A_1101_ITEM_AMOUNT_19_REFINANCE.value;
document.frm.A_1101_ITEM_AMOUNT_19_2ND_NO_TI.value = document.frm.A_1101_ITEM_AMOUNT_19_REFINANCE.value;
document.frm.A_1101_ITEM_AMOUNT_19_2ND_WITH_TI.value = document.frm.A_1101_ITEM_AMOUNT_19_REFINANCE.value;
} else { 
document.frm.A_1101_ITEM_AMOUNT_19_PURCHASE.value = '';
document.frm.A_1101_ITEM_AMOUNT_19_2ND_NO_TI.value = '';
document.frm.A_1101_ITEM_AMOUNT_19_2ND_WITH_TI.value = '';
}
}
function a_1101_20_amount(form) {
if (document.frm.A_1101_ITEM_AMOUNT_20_REFINANCE.value != '' && document.frm.A_1101_ITEM_AMOUNT_20_REFINANCE.value != 'Description of Charge') {
document.frm.A_1101_ITEM_AMOUNT_20_PURCHASE.value = document.frm.A_1101_ITEM_AMOUNT_20_REFINANCE.value;
document.frm.A_1101_ITEM_AMOUNT_20_2ND_NO_TI.value = document.frm.A_1101_ITEM_AMOUNT_20_REFINANCE.value;
document.frm.A_1101_ITEM_AMOUNT_20_2ND_WITH_TI.value = document.frm.A_1101_ITEM_AMOUNT_20_REFINANCE.value;
} else { 
document.frm.A_1101_ITEM_AMOUNT_20_PURCHASE.value = '';
document.frm.A_1101_ITEM_AMOUNT_20_2ND_NO_TI.value = '';
document.frm.A_1101_ITEM_AMOUNT_20_2ND_WITH_TI.value = '';
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
if (document.frm.A_1102A_PAYTO_REFINANCE.value != '' && document.frm.A_1102A_PAYTO_REFINANCE.value != 'Charge Amount') {
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
if (document.frm.A_1102B_PAYTO_REFINANCE.value != '' && document.frm.A_1102B_PAYTO_REFINANCE.value != 'Charge Amount') {
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
if (document.frm.A_1102C_PAYTO_REFINANCE.value != '' && document.frm.A_1102C_PAYTO_REFINANCE.value != 'Charge Amount') {
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
if (document.frm.A_1102D_PAYTO_REFINANCE.value != '' && document.frm.A_1102D_PAYTO_REFINANCE.value != 'Charge Amount') {
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
if (document.frm.A_1102E_PAYTO_REFINANCE.value != '' && document.frm.A_1102E_PAYTO_REFINANCE.value != 'Charge Amount') {
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
if (document.frm.A_1102F_PAYTO_REFINANCE.value != '' && document.frm.A_1102F_PAYTO_REFINANCE.value != 'Charge Amount') {
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
if (document.frm.A_1102G_PAYTO_REFINANCE.value != '' && document.frm.A_1102G_PAYTO_REFINANCE.value != 'Charge Amount') {
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
if (document.frm.A_1102H_PAYTO_REFINANCE.value != '' && document.frm.A_1102H_PAYTO_REFINANCE.value != 'Charge Amount') {
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
if (document.frm.A_1102I_PAYTO_REFINANCE.value != '' && document.frm.A_1102I_PAYTO_REFINANCE.value != 'Charge Amount') {
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

function a_804_desc(form) {
document.frm.A_0804_DESCRIPTION_PURCHASE.value = document.frm.A_0804_DESCRIPTION_REFINANCE.value;
document.frm.A_0804_DESCRIPTION_2ND_NO_TI.value = document.frm.A_0804_DESCRIPTION_REFINANCE.value;
document.frm.A_0804_DESCRIPTION_2ND_WITH_TI.value = document.frm.A_0804_DESCRIPTION_REFINANCE.value;
}
function a_805_desc(form) {
document.frm.A_0805_DESCRIPTION_PURCHASE.value = document.frm.A_0805_DESCRIPTION_REFINANCE.value;
document.frm.A_0805_DESCRIPTION_2ND_NO_TI.value = document.frm.A_0805_DESCRIPTION_REFINANCE.value;
document.frm.A_0805_DESCRIPTION_2ND_WITH_TI.value = document.frm.A_0805_DESCRIPTION_REFINANCE.value;
}
function a_806_desc(form) {
document.frm.A_0806_DESCRIPTION_PURCHASE.value = document.frm.A_0806_DESCRIPTION_REFINANCE.value;
document.frm.A_0806_DESCRIPTION_2ND_NO_TI.value = document.frm.A_0806_DESCRIPTION_REFINANCE.value;
document.frm.A_0806_DESCRIPTION_2ND_WITH_TI.value = document.frm.A_0806_DESCRIPTION_REFINANCE.value;
}
function a_807_desc(form) {
document.frm.A_0807_DESCRIPTION_PURCHASE.value = document.frm.A_0807_DESCRIPTION_REFINANCE.value;
document.frm.A_0807_DESCRIPTION_2ND_NO_TI.value = document.frm.A_0807_DESCRIPTION_REFINANCE.value;
document.frm.A_0807_DESCRIPTION_2ND_WITH_TI.value = document.frm.A_0807_DESCRIPTION_REFINANCE.value;
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
function a_1101_11_desc(form) {
document.frm.A_1101_ITEM_DESCRIPTION_11_PURCHASE.value = document.frm.A_1101_ITEM_DESCRIPTION_11_REFINANCE.value;
document.frm.A_1101_ITEM_DESCRIPTION_11_2ND_NO_TI.value = document.frm.A_1101_ITEM_DESCRIPTION_11_REFINANCE.value;
document.frm.A_1101_ITEM_DESCRIPTION_11_2ND_WITH_TI.value = document.frm.A_1101_ITEM_DESCRIPTION_11_REFINANCE.value;
}
function a_1101_12_desc(form) {
document.frm.A_1101_ITEM_DESCRIPTION_12_PURCHASE.value = document.frm.A_1101_ITEM_DESCRIPTION_12_REFINANCE.value;
document.frm.A_1101_ITEM_DESCRIPTION_12_2ND_NO_TI.value = document.frm.A_1101_ITEM_DESCRIPTION_12_REFINANCE.value;
document.frm.A_1101_ITEM_DESCRIPTION_12_2ND_WITH_TI.value = document.frm.A_1101_ITEM_DESCRIPTION_12_REFINANCE.value;
}
function a_1101_13_desc(form) {
document.frm.A_1101_ITEM_DESCRIPTION_13_PURCHASE.value = document.frm.A_1101_ITEM_DESCRIPTION_13_REFINANCE.value;
document.frm.A_1101_ITEM_DESCRIPTION_13_2ND_NO_TI.value = document.frm.A_1101_ITEM_DESCRIPTION_13_REFINANCE.value;
document.frm.A_1101_ITEM_DESCRIPTION_13_2ND_WITH_TI.value = document.frm.A_1101_ITEM_DESCRIPTION_13_REFINANCE.value;
}
function a_1101_14_desc(form) {
document.frm.A_1101_ITEM_DESCRIPTION_14_PURCHASE.value = document.frm.A_1101_ITEM_DESCRIPTION_14_REFINANCE.value;
document.frm.A_1101_ITEM_DESCRIPTION_14_2ND_NO_TI.value = document.frm.A_1101_ITEM_DESCRIPTION_14_REFINANCE.value;
document.frm.A_1101_ITEM_DESCRIPTION_14_2ND_WITH_TI.value = document.frm.A_1101_ITEM_DESCRIPTION_14_REFINANCE.value;
}
function a_1101_15_desc(form) {
document.frm.A_1101_ITEM_DESCRIPTION_15_PURCHASE.value = document.frm.A_1101_ITEM_DESCRIPTION_15_REFINANCE.value;
document.frm.A_1101_ITEM_DESCRIPTION_15_2ND_NO_TI.value = document.frm.A_1101_ITEM_DESCRIPTION_15_REFINANCE.value;
document.frm.A_1101_ITEM_DESCRIPTION_15_2ND_WITH_TI.value = document.frm.A_1101_ITEM_DESCRIPTION_15_REFINANCE.value;
}
function a_1101_16_desc(form) {
document.frm.A_1101_ITEM_DESCRIPTION_16_PURCHASE.value = document.frm.A_1101_ITEM_DESCRIPTION_16_REFINANCE.value;
document.frm.A_1101_ITEM_DESCRIPTION_16_2ND_NO_TI.value = document.frm.A_1101_ITEM_DESCRIPTION_16_REFINANCE.value;
document.frm.A_1101_ITEM_DESCRIPTION_16_2ND_WITH_TI.value = document.frm.A_1101_ITEM_DESCRIPTION_16_REFINANCE.value;
}
function a_1101_17_desc(form) {
document.frm.A_1101_ITEM_DESCRIPTION_17_PURCHASE.value = document.frm.A_1101_ITEM_DESCRIPTION_17_REFINANCE.value;
document.frm.A_1101_ITEM_DESCRIPTION_17_2ND_NO_TI.value = document.frm.A_1101_ITEM_DESCRIPTION_17_REFINANCE.value;
document.frm.A_1101_ITEM_DESCRIPTION_17_2ND_WITH_TI.value = document.frm.A_1101_ITEM_DESCRIPTION_17_REFINANCE.value;
}
function a_1101_18_desc(form) {
document.frm.A_1101_ITEM_DESCRIPTION_18_PURCHASE.value = document.frm.A_1101_ITEM_DESCRIPTION_18_REFINANCE.value;
document.frm.A_1101_ITEM_DESCRIPTION_18_2ND_NO_TI.value = document.frm.A_1101_ITEM_DESCRIPTION_18_REFINANCE.value;
document.frm.A_1101_ITEM_DESCRIPTION_18_2ND_WITH_TI.value = document.frm.A_1101_ITEM_DESCRIPTION_18_REFINANCE.value;
}
function a_1101_19_desc(form) {
document.frm.A_1101_ITEM_DESCRIPTION_19_PURCHASE.value = document.frm.A_1101_ITEM_DESCRIPTION_19_REFINANCE.value;
document.frm.A_1101_ITEM_DESCRIPTION_19_2ND_NO_TI.value = document.frm.A_1101_ITEM_DESCRIPTION_19_REFINANCE.value;
document.frm.A_1101_ITEM_DESCRIPTION_19_2ND_WITH_TI.value = document.frm.A_1101_ITEM_DESCRIPTION_19_REFINANCE.value;
}
function a_1101_20_desc(form) {
document.frm.A_1101_ITEM_DESCRIPTION_20_PURCHASE.value = document.frm.A_1101_ITEM_DESCRIPTION_20_REFINANCE.value;
document.frm.A_1101_ITEM_DESCRIPTION_20_2ND_NO_TI.value = document.frm.A_1101_ITEM_DESCRIPTION_20_REFINANCE.value;
document.frm.A_1101_ITEM_DESCRIPTION_20_2ND_WITH_TI.value = document.frm.A_1101_ITEM_DESCRIPTION_20_REFINANCE.value;
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


function a_1101_01_selectable(form) {
  if (document.frm.A_1101_ITEM_SELECTABLE_01_REFINANCE.checked==true) {
document.frm.A_1101_ITEM_SELECTABLE_01_PURCHASE.checked = true;
document.frm.A_1101_ITEM_SELECTABLE_01_2ND_NO_TI.checked = true;
document.frm.A_1101_ITEM_SELECTABLE_01_2ND_WITH_TI.checked = true;
  } else  {
document.frm.A_1101_ITEM_SELECTABLE_01_PURCHASE.checked = false;
document.frm.A_1101_ITEM_SELECTABLE_01_2ND_NO_TI.checked = false;
document.frm.A_1101_ITEM_SELECTABLE_01_2ND_WITH_TI.checked = false;
  } 
}  

function a_1101_02_selectable(form) {
  if (document.frm.A_1101_ITEM_SELECTABLE_02_REFINANCE.checked==true) {
document.frm.A_1101_ITEM_SELECTABLE_02_PURCHASE.checked = true;
document.frm.A_1101_ITEM_SELECTABLE_02_2ND_NO_TI.checked = true;
document.frm.A_1101_ITEM_SELECTABLE_02_2ND_WITH_TI.checked = true;
  } else  {
document.frm.A_1101_ITEM_SELECTABLE_02_PURCHASE.checked = false;
document.frm.A_1101_ITEM_SELECTABLE_02_2ND_NO_TI.checked = false;
document.frm.A_1101_ITEM_SELECTABLE_02_2ND_WITH_TI.checked = false;
  } 
}  

function a_1101_03_selectable(form) {
  if (document.frm.A_1101_ITEM_SELECTABLE_03_REFINANCE.checked==true) {
document.frm.A_1101_ITEM_SELECTABLE_03_PURCHASE.checked = true;
document.frm.A_1101_ITEM_SELECTABLE_03_2ND_NO_TI.checked = true;
document.frm.A_1101_ITEM_SELECTABLE_03_2ND_WITH_TI.checked = true;
  } else  {
document.frm.A_1101_ITEM_SELECTABLE_03_PURCHASE.checked = false;
document.frm.A_1101_ITEM_SELECTABLE_03_2ND_NO_TI.checked = false;
document.frm.A_1101_ITEM_SELECTABLE_03_2ND_WITH_TI.checked = false;
  } 
}  

function a_1101_04_selectable(form) {
  if (document.frm.A_1101_ITEM_SELECTABLE_04_REFINANCE.checked==true) {
document.frm.A_1101_ITEM_SELECTABLE_04_PURCHASE.checked = true;
document.frm.A_1101_ITEM_SELECTABLE_04_2ND_NO_TI.checked = true;
document.frm.A_1101_ITEM_SELECTABLE_04_2ND_WITH_TI.checked = true;
  } else  {
document.frm.A_1101_ITEM_SELECTABLE_04_PURCHASE.checked = false;
document.frm.A_1101_ITEM_SELECTABLE_04_2ND_NO_TI.checked = false;
document.frm.A_1101_ITEM_SELECTABLE_04_2ND_WITH_TI.checked = false;
  } 
}  

function a_1101_05_selectable(form) {
  if (document.frm.A_1101_ITEM_SELECTABLE_05_REFINANCE.checked==true) {
document.frm.A_1101_ITEM_SELECTABLE_05_PURCHASE.checked = true;
document.frm.A_1101_ITEM_SELECTABLE_05_2ND_NO_TI.checked = true;
document.frm.A_1101_ITEM_SELECTABLE_05_2ND_WITH_TI.checked = true;
  } else  {
document.frm.A_1101_ITEM_SELECTABLE_05_PURCHASE.checked = false;
document.frm.A_1101_ITEM_SELECTABLE_05_2ND_NO_TI.checked = false;
document.frm.A_1101_ITEM_SELECTABLE_05_2ND_WITH_TI.checked = false;
  } 
}  

function a_1101_06_selectable(form) {
  if (document.frm.A_1101_ITEM_SELECTABLE_06_REFINANCE.checked==true) {
document.frm.A_1101_ITEM_SELECTABLE_06_PURCHASE.checked = true;
document.frm.A_1101_ITEM_SELECTABLE_06_2ND_NO_TI.checked = true;
document.frm.A_1101_ITEM_SELECTABLE_06_2ND_WITH_TI.checked = true;
  } else  {
document.frm.A_1101_ITEM_SELECTABLE_06_PURCHASE.checked = false;
document.frm.A_1101_ITEM_SELECTABLE_06_2ND_NO_TI.checked = false;
document.frm.A_1101_ITEM_SELECTABLE_06_2ND_WITH_TI.checked = false;
  } 
}  

function a_1101_07_selectable(form) {
  if (document.frm.A_1101_ITEM_SELECTABLE_07_REFINANCE.checked==true) {
document.frm.A_1101_ITEM_SELECTABLE_07_PURCHASE.checked = true;
document.frm.A_1101_ITEM_SELECTABLE_07_2ND_NO_TI.checked = true;
document.frm.A_1101_ITEM_SELECTABLE_07_2ND_WITH_TI.checked = true;
  } else  {
document.frm.A_1101_ITEM_SELECTABLE_07_PURCHASE.checked = false;
document.frm.A_1101_ITEM_SELECTABLE_07_2ND_NO_TI.checked = false;
document.frm.A_1101_ITEM_SELECTABLE_07_2ND_WITH_TI.checked = false;
  } 
}  

function a_1101_08_selectable(form) {
  if (document.frm.A_1101_ITEM_SELECTABLE_08_REFINANCE.checked==true) {

document.frm.A_1101_ITEM_SELECTABLE_08_PURCHASE.checked = true;
document.frm.A_1101_ITEM_SELECTABLE_08_2ND_NO_TI.checked = true;
document.frm.A_1101_ITEM_SELECTABLE_08_2ND_WITH_TI.checked = true;
  } else  {
document.frm.A_1101_ITEM_SELECTABLE_08_PURCHASE.checked = false;
document.frm.A_1101_ITEM_SELECTABLE_08_2ND_NO_TI.checked = false;
document.frm.A_1101_ITEM_SELECTABLE_08_2ND_WITH_TI.checked = false;
  } 
}  

function a_1101_09_selectable(form) {
  if (document.frm.A_1101_ITEM_SELECTABLE_09_REFINANCE.checked==true) {
document.frm.A_1101_ITEM_SELECTABLE_09_PURCHASE.checked = true;
document.frm.A_1101_ITEM_SELECTABLE_09_2ND_NO_TI.checked = true;
document.frm.A_1101_ITEM_SELECTABLE_09_2ND_WITH_TI.checked = true;
  } else  {

document.frm.A_1101_ITEM_SELECTABLE_09_PURCHASE.checked = false;
document.frm.A_1101_ITEM_SELECTABLE_09_2ND_NO_TI.checked = false;
document.frm.A_1101_ITEM_SELECTABLE_09_2ND_WITH_TI.checked = false;
  } 
}  

function a_1101_10_selectable(form) {
  if (document.frm.A_1101_ITEM_SELECTABLE_10_REFINANCE.checked==true) {
document.frm.A_1101_ITEM_SELECTABLE_10_PURCHASE.checked = true;
document.frm.A_1101_ITEM_SELECTABLE_10_2ND_NO_TI.checked = true;
document.frm.A_1101_ITEM_SELECTABLE_10_2ND_WITH_TI.checked = true;
  } else  {
document.frm.A_1101_ITEM_SELECTABLE_10_PURCHASE.checked = false;
document.frm.A_1101_ITEM_SELECTABLE_10_2ND_NO_TI.checked = false;
document.frm.A_1101_ITEM_SELECTABLE_10_2ND_WITH_TI.checked = false;
  } 
}  

function a_1101_11_selectable(form) {
  if (document.frm.A_1101_ITEM_SELECTABLE_11_REFINANCE.checked==true) {
document.frm.A_1101_ITEM_SELECTABLE_11_PURCHASE.checked = true;
document.frm.A_1101_ITEM_SELECTABLE_11_2ND_NO_TI.checked = true;
document.frm.A_1101_ITEM_SELECTABLE_11_2ND_WITH_TI.checked = true;
  } else  {
document.frm.A_1101_ITEM_SELECTABLE_11_PURCHASE.checked = false;
document.frm.A_1101_ITEM_SELECTABLE_11_2ND_NO_TI.checked = false;
document.frm.A_1101_ITEM_SELECTABLE_11_2ND_WITH_TI.checked = false;
  } 
}  

function a_1101_12_selectable(form) {
  if (document.frm.A_1101_ITEM_SELECTABLE_12_REFINANCE.checked==true) {
document.frm.A_1101_ITEM_SELECTABLE_12_PURCHASE.checked = true;
document.frm.A_1101_ITEM_SELECTABLE_12_2ND_NO_TI.checked = true;
document.frm.A_1101_ITEM_SELECTABLE_12_2ND_WITH_TI.checked = true;
  } else  {
document.frm.A_1101_ITEM_SELECTABLE_12_PURCHASE.checked = false;
document.frm.A_1101_ITEM_SELECTABLE_12_2ND_NO_TI.checked = false;
document.frm.A_1101_ITEM_SELECTABLE_12_2ND_WITH_TI.checked = false;
  } 
}  

function a_1101_13_selectable(form) {
  if (document.frm.A_1101_ITEM_SELECTABLE_13_REFINANCE.checked==true) {
document.frm.A_1101_ITEM_SELECTABLE_13_PURCHASE.checked = true;
document.frm.A_1101_ITEM_SELECTABLE_13_2ND_NO_TI.checked = true;
document.frm.A_1101_ITEM_SELECTABLE_13_2ND_WITH_TI.checked = true;
  } else  {
document.frm.A_1101_ITEM_SELECTABLE_13_PURCHASE.checked = false;
document.frm.A_1101_ITEM_SELECTABLE_13_2ND_NO_TI.checked = false;
document.frm.A_1101_ITEM_SELECTABLE_13_2ND_WITH_TI.checked = false;
  } 
}  

function a_1101_14_selectable(form) {
  if (document.frm.A_1101_ITEM_SELECTABLE_14_REFINANCE.checked==true) {
document.frm.A_1101_ITEM_SELECTABLE_14_PURCHASE.checked = true;
document.frm.A_1101_ITEM_SELECTABLE_14_2ND_NO_TI.checked = true;
document.frm.A_1101_ITEM_SELECTABLE_14_2ND_WITH_TI.checked = true;
  } else  {
document.frm.A_1101_ITEM_SELECTABLE_14_PURCHASE.checked = false;
document.frm.A_1101_ITEM_SELECTABLE_14_2ND_NO_TI.checked = false;
document.frm.A_1101_ITEM_SELECTABLE_14_2ND_WITH_TI.checked = false;
  } 
}  

function a_1101_15_selectable(form) {
  if (document.frm.A_1101_ITEM_SELECTABLE_15_REFINANCE.checked==true) {
document.frm.A_1101_ITEM_SELECTABLE_15_PURCHASE.checked = true;
document.frm.A_1101_ITEM_SELECTABLE_15_2ND_NO_TI.checked = true;
document.frm.A_1101_ITEM_SELECTABLE_15_2ND_WITH_TI.checked = true;
  } else  {
document.frm.A_1101_ITEM_SELECTABLE_15_PURCHASE.checked = false;
document.frm.A_1101_ITEM_SELECTABLE_15_2ND_NO_TI.checked = false;
document.frm.A_1101_ITEM_SELECTABLE_15_2ND_WITH_TI.checked = false;
  } 
}  

function a_1101_16_selectable(form) {
  if (document.frm.A_1101_ITEM_SELECTABLE_16_REFINANCE.checked==true) {
document.frm.A_1101_ITEM_SELECTABLE_16_PURCHASE.checked = true;
document.frm.A_1101_ITEM_SELECTABLE_16_2ND_NO_TI.checked = true;
document.frm.A_1101_ITEM_SELECTABLE_16_2ND_WITH_TI.checked = true;
  } else  {
document.frm.A_1101_ITEM_SELECTABLE_16_PURCHASE.checked = false;
document.frm.A_1101_ITEM_SELECTABLE_16_2ND_NO_TI.checked = false;
document.frm.A_1101_ITEM_SELECTABLE_16_2ND_WITH_TI.checked = false;
  } 
}  

function a_1101_17_selectable(form) {
  if (document.frm.A_1101_ITEM_SELECTABLE_17_REFINANCE.checked==true) {
document.frm.A_1101_ITEM_SELECTABLE_17_PURCHASE.checked = true;
document.frm.A_1101_ITEM_SELECTABLE_17_2ND_NO_TI.checked = true;
document.frm.A_1101_ITEM_SELECTABLE_17_2ND_WITH_TI.checked = true;
  } else  {
document.frm.A_1101_ITEM_SELECTABLE_17_PURCHASE.checked = false;
document.frm.A_1101_ITEM_SELECTABLE_17_2ND_NO_TI.checked = false;
document.frm.A_1101_ITEM_SELECTABLE_17_2ND_WITH_TI.checked = false;
  } 
}  

function a_1101_18_selectable(form) {
  if (document.frm.A_1101_ITEM_SELECTABLE_18_REFINANCE.checked==true) {
document.frm.A_1101_ITEM_SELECTABLE_18_PURCHASE.checked = true;
document.frm.A_1101_ITEM_SELECTABLE_18_2ND_NO_TI.checked = true;
document.frm.A_1101_ITEM_SELECTABLE_18_2ND_WITH_TI.checked = true;
  } else  {
document.frm.A_1101_ITEM_SELECTABLE_18_PURCHASE.checked = false;
document.frm.A_1101_ITEM_SELECTABLE_18_2ND_NO_TI.checked = false;
document.frm.A_1101_ITEM_SELECTABLE_18_2ND_WITH_TI.checked = false;
  } 
}  

function a_1101_19_selectable(form) {
  if (document.frm.A_1101_ITEM_SELECTABLE_19_REFINANCE.checked==true) {
document.frm.A_1101_ITEM_SELECTABLE_19_PURCHASE.checked = true;
document.frm.A_1101_ITEM_SELECTABLE_19_2ND_NO_TI.checked = true;
document.frm.A_1101_ITEM_SELECTABLE_19_2ND_WITH_TI.checked = true;
  } else  {
document.frm.A_1101_ITEM_SELECTABLE_19_PURCHASE.checked = false;
document.frm.A_1101_ITEM_SELECTABLE_19_2ND_NO_TI.checked = false;
document.frm.A_1101_ITEM_SELECTABLE_19_2ND_WITH_TI.checked = false;
  } 
}  

function a_1101_20_selectable(form) {
  if (document.frm.A_1101_ITEM_SELECTABLE_20_REFINANCE.checked==true) {
document.frm.A_1101_ITEM_SELECTABLE_20_PURCHASE.checked = true;
document.frm.A_1101_ITEM_SELECTABLE_20_2ND_NO_TI.checked = true;
document.frm.A_1101_ITEM_SELECTABLE_20_2ND_WITH_TI.checked = true;
  } else  {
document.frm.A_1101_ITEM_SELECTABLE_20_PURCHASE.checked = false;
document.frm.A_1101_ITEM_SELECTABLE_20_2ND_NO_TI.checked = false;
document.frm.A_1101_ITEM_SELECTABLE_20_2ND_WITH_TI.checked = false;
  } 
}  

</script>
</HEAD>

<BODY BGCOLOR=e1e1e1 TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>



<table width=800 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=799 align=left valign=top>
		
<table width=799 cellpadding=1 cellspacing=1 border=0 bgcolor=white>

	<tr>
		<td width=799 align=left valign=top bgcolor=e2e2e2>
			<FONT SIZE=2 color=black face=arial>

<table width=798 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

	<tr>
		<td width=798 align=left valign=top bgcolor=white>
			<font size=2 color=blue face=arial><B>MODIFY Line Costs for Mortgage Client</B>
		</td>
	</tr>
<CFOUTPUT>
	<tr>
		<td width=798 align=left valign=top bgcolor=e3e3e3>
			<font size=3 color=blue face=arial>
			Client - <B>#read_company.company#</B>
		</td>
	</tr>

	<tr>
		<td width=798 align=left valign=top bgcolor=e3e3e3>

			<table width=797 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>		

				<tr>
					<td width=790 colspan=4 align=left valign=top bgcolor=e1e1e1>
					</td>
				</tr>
</CFOUTPUT>

<cfif url.add_counties eq 1 or url.add_cities eq 1>
<cfset billing_id = 'X'>
</cfif>

<cfparam name="url.A_ST_LIST_2" default="">
<cfset county_names = ''>
<cfset city_names = ''>
<cfif billing_id neq 'X'>
<CFQUERY datasource="#request.dsn#" NAME="find_counties">
			SELECT *
			FROM company_billing_states_HUD2010
			WHERE billing_id = '#billing_id#' and county <> '' and county IS NOT NULL
			order by state_id desc
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="find_cities">
			SELECT *
			FROM company_billing_states_HUD2010
			WHERE billing_id = '#billing_id#' and city <> '' and city IS NOT NULL
			order by state_id desc
</CFQUERY>
<cfset county_names = ValueList(find_counties.county, ",")>
<cfset city_names = ValueList(find_cities.city, ",")>
<cfif find_counties.recordcount neq 0>
<cfset url.A_ST_LIST_2 = #find_counties.a_states#>
</cfif>
<cfif find_cities.recordcount neq 0>
<cfset url.A_ST_LIST_2 = #find_cities.a_states#>
</cfif>
</cfif>


<cfparam name="A_ST_LIST_2" default="">
	<CFFORM name="frm" ACTION="./client_line_costs_modify_submit_2010.cfm?uid=#URL.uid#&al=#URL.al#&company_id=#company_id#&a_flag=1&ft_agencies=#read_current_agency_assoc.title_FT_agency_id#&billing_id=#billing_id#&state=#url.A_ST_LIST_2#" ENCTYPE="multipart/form-data" METHOD=POST>

	<tr>		
		<td width=380 colspan=4 align=left valign=top bgcolor=e6e6e6>
STATE: <cfoutput>#url.state#</cfoutput><br>

<cfif Len(url.county)><br>County: <cfoutput>#url.county#</cfoutput><br></cfif>
		</td>
		
		
		<td width=380 colspan=4 align=left valign=top bgcolor=e6e6e6>

		<cfif url.add_cities eq 1 or find_cities.recordcount neq 0>
<CFQUERY datasource="#request.dsn#" NAME="get_cities">
			SELECT distinct city
			FROM zip_info
			WHERE state = '#url.A_ST_LIST_2#'
</CFQUERY>
<cfif get_cities.recordcount GT 10>
<cfset show_count = 10>
<cfelse>
<cfset show_count = get_cities.recordcount>
</cfif><br>
		<cfelse>
		</cfif>
		</td>
		
		
	</tr>
<table width=797 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>	
		<tr>		
		<td width=250 align=left valign=top bgcolor=e6e6e6>	
			
		<table width=600 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>	
		<!--- <tr>		
		<td width=250 align=left valign=top bgcolor=e6e6e6>	 --->
<tr>	
		
		<td width=600 align=left valign=top bgcolor=e6e6e6>	

<cfoutput>
<span class="page_title">REFINANCE</span><BR>
<!-- 800 -->
<table width="650" summary="Type of Loan" border="1" cellspacing="0">
<tr><td height="4" colspan="6"></td></tr>
<tr>
<td class="bdarksilver_head">800. Items Payable in Connection with Loan</td>
<td class="bdarksilver_head" align="right">Amount</td>
</tr>
<tr>
<td class="bsilver">801. #get_fees.A_0801_DESCRIPTION_REFINANCE#</td>
<td class="bordered">#get_fees.A_0801_AMOUNT_REFINANCE#</td>
</tr>
<tr>
<tr>
<td class="bsilver">802. #get_fees.A_0802_DESCRIPTION_REFINANCE#</td>
<td class="bordered">#get_fees.A_0802_AMOUNT_REFINANCE#</td>
</tr>
<tr>
<td class="bsilver">804. #get_fees.A_0804_DESCRIPTION_REFINANCE# &nbsp;to &nbsp;#get_fees.A_0804_PAYTO_REFINANCE#</td>
<td class="bordered">#get_fees.A_0804_AMOUNT_REFINANCE#</td>
</tr>
<tr>
<td class="bsilver">805. #get_fees.A_0805_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#get_fees.A_0805_PAYTO_REFINANCE#</td>
<td class="bordered">#get_fees.A_0805_AMOUNT_REFINANCE#</td>
</tr>
<tr>
<td class="bsilver">806. #get_fees.A_0806_DESCRIPTION_REFINANCE# &nbsp;to &nbsp;#get_fees.A_0806_PAYTO_REFINANCE#</td>
<td class="bordered">#get_fees.A_0806_AMOUNT_REFINANCE#</td>
</tr>

<tr>
<td class="bsilver">807.#get_fees.A_0807_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#get_fees.A_0807_PAYTO_REFINANCE#</td>
<td class="bordered">#get_fees.A_0807_AMOUNT_REFINANCE#</td>
</tr>
<tr>
<td class="bsilver">808. #get_fees.A_0808_DESCRIPTION_REFINANCE# &nbsp;to &nbsp;#get_fees.A_0808_PAYTO_REFINANCE#</td>
<td class="bordered">#get_fees.A_0808_AMOUNT_REFINANCE#</td>
</tr>
<tr>
<td class="bsilver">809. #get_fees.A_0809_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#get_fees.A_0809_PAYTO_REFINANCE#</td>
<td class="bordered">#get_fees.A_0809_AMOUNT_REFINANCE#</td>
</tr>
<tr>
<td class="bsilver">810. #get_fees.A_0810_DESCRIPTION_REFINANCE# &nbsp;to &nbsp;#get_fees.A_0810_PAYTO_REFINANCE#</td>
<td class="bordered">#get_fees.A_0810_AMOUNT_REFINANCE#</td>
</tr>
<tr>
<td class="bsilver">811. #get_fees.A_0811_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#get_fees.A_0811_PAYTO_REFINANCE#</td>
<td class="bordered">#get_fees.A_0811_AMOUNT_REFINANCE#</td>
</tr>
<tr>
<td class="bsilver">812. #get_fees.A_0812_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#get_fees.A_0812_PAYTO_REFINANCE#</td>
<td class="bordered">#get_fees.A_0812_AMOUNT_REFINANCE#</td>
</tr>
</table>
<!-- 1100 -->
<table width="650" summary="Type of Loan" border="1" cellspacing="0">
<tr>
<td class="bdarksilver_head">1100. Title Charges</td>
<td class="bdarksilver_head" align="right">Amount</td>
<td class="bdarksilver_head" align="right">Outside</td>
<td class="bdarksilver_head" align="right">Selectable</td>
</tr>
<tr>
<td class="bsilver">1101. Total charges in connection with Title not explicitly listed below</td>
<td class="bordered">#get_fees.A_1101_AMOUNT_REFINANCE#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Itemized 1101 Charges</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_01_REFINANCE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_01_REFINANCE#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_02_REFINANCE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_02_REFINANCE#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_03_REFINANCE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_03_REFINANCE#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_04_REFINANCE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_04_REFINANCE#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_05_REFINANCE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_05_REFINANCE#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_06_REFINANCE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_06_REFINANCE#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_07_REFINANCE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_07_REFINANCE#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_08_REFINANCE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_08_REFINANCE#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_09_REFINANCE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_09_REFINANCE#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_10_REFINANCE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_10_REFINANCE#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_11_REFINANCE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_11_REFINANCE#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_12_REFINANCE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_12_REFINANCE#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_13_REFINANCE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_13_REFINANCE#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_14_REFINANCE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_14_REFINANCE#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_15_REFINANCE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_15_REFINANCE#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_16_REFINANCE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_16_REFINANCE#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_17_REFINANCE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_17_REFINANCE#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_18_REFINANCE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_18_REFINANCE#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_19_REFINANCE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_19_REFINANCE#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_20_REFINANCE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_20_REFINANCE#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">1102. #get_fees.A_1102_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#get_fees.A_1102_PAYTO_REFINANCE#</td>
<td class="bordered">#get_fees.A_1102_AMOUNT_REFINANCE#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102A. #get_fees_b.A_1102A_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#get_fees_b.A_1102A_PAYTO_REFINANCE#</td>
<td class="bordered">#get_fees_b.A_1102A_AMOUNT_REFINANCE#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102B. #get_fees_b.A_1102B_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#get_fees_b.A_1102B_PAYTO_REFINANCE#</td>
<td class="bordered">#get_fees_b.A_1102B_AMOUNT_REFINANCE#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102C. #get_fees_b.A_1102C_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#get_fees_b.A_1102C_PAYTO_REFINANCE#</td>
<td class="bordered">#get_fees_b.A_1102C_AMOUNT_REFINANCE#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102D. #get_fees_b.A_1102D_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#get_fees_b.A_1102D_PAYTO_REFINANCE#</td>
<td class="bordered">#get_fees_b.A_1102D_AMOUNT_REFINANCE#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102E. #get_fees_b.A_1102E_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#get_fees_b.A_1102E_PAYTO_REFINANCE#</td>
<td class="bordered">#get_fees_b.A_1102E_AMOUNT_REFINANCE#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102F. #get_fees_b.A_1102F_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#get_fees_b.A_1102F_PAYTO_REFINANCE#</td>
<td class="bordered">#get_fees_b.A_1102F_AMOUNT_REFINANCE#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102G. #get_fees_b.A_1102G_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#get_fees_b.A_1102G_PAYTO_REFINANCE#</td>
<td class="bordered">#get_fees_b.A_1102G_AMOUNT_REFINANCE#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102H. #get_fees_b.A_1102H_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#get_fees_b.A_1102H_PAYTO_REFINANCE#</td>
<td class="bordered">#get_fees_b.A_1102H_AMOUNT_REFINANCE#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102I. #get_fees_b.A_1102I_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#get_fees_b.A_1102I_PAYTO_REFINANCE#</td>
<td class="bordered">#get_fees_b.A_1102I_AMOUNT_REFINANCE#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1109. #get_fees.A_1109_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#get_fees.A_1109_PAYTO_REFINANCE#</td>
<td class="bordered">#get_fees.A_1109_AMOUNT_REFINANCE#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1110. #get_fees.A_1110_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#get_fees.A_1110_PAYTO_REFINANCE#</td>
<td class="bordered">#get_fees.A_1110_AMOUNT_REFINANCE#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1111. #get_fees.A_1111_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#get_fees.A_1111_PAYTO_REFINANCE#</td>
<td class="bordered">#get_fees.A_1111_AMOUNT_REFINANCE#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1112. #get_fees.A_1112_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#get_fees.A_1112_PAYTO_REFINANCE#</td>
<td class="bordered">#get_fees.A_1112_AMOUNT_REFINANCE#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1113. #get_fees.A_1113_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#get_fees.A_1113_PAYTO_REFINANCE#</td>
<td class="bordered">#get_fees.A_1113_AMOUNT_REFINANCE#</td>
<td class="bordered" align="left"></td></tr>
</table>
<!-- 1300 -->
<table width="650" summary="Type of Loan" border="1" cellspacing="0">
<tr>
<td class="bdarksilver_head">1300. Additional Settlement Charges (for Non-Title/Settlement Charges)</td>
<td class="bdarksilver_head" align="right">Amount</td>
<td class="bdarksilver_head" align="right">Outside</td>

</tr>
<tr>
<td class="bsilver">1302. #get_fees_b.A_1302_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#get_fees_b.A_1302_PAYTO_REFINANCE#</td>
<td class="bordered">#get_fees_b.A_1302_AMOUNT_REFINANCE#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1303. #get_fees_b.A_1303_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#get_fees_b.A_1303_PAYTO_REFINANCE#</td>
<td class="bordered">#get_fees_b.A_1303_AMOUNT_REFINANCE#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1304. #get_fees_b.A_1304_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#get_fees_b.A_1304_PAYTO_REFINANCE#</td>
<td class="bordered">#get_fees_b.A_1304_AMOUNT_REFINANCE#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1305. #get_fees_b.A_1305_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#get_fees_b.A_1305_PAYTO_REFINANCE#</td>
<td class="bordered">#get_fees_b.A_1305_AMOUNT_REFINANCE#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1306. #get_fees_b.A_1306_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#get_fees_b.A_1306_PAYTO_REFINANCE#</td>
<td class="bordered">#get_fees_b.A_1306_AMOUNT_REFINANCE#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1307. #get_fees_b.A_1307_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#get_fees_b.A_1307_PAYTO_REFINANCE#</td>
<td class="bordered">#get_fees_b.A_1307_AMOUNT_REFINANCE#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1308. #get_fees_b.A_1308_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#get_fees_b.A_1308_PAYTO_REFINANCE#</td>
<td class="bordered">#get_fees_b.A_1308_AMOUNT_REFINANCE#</td>
<td class="bordered" align="left"></td></tr>
</table>

<br>
<br>
<br>
<span class="page_title">PURCHASE</span><BR>
<!-- 800 -->
<table width="650" summary="Type of Loan" border="1" cellspacing="0">
<tr><td height="4" colspan="6"></td></tr>
<tr>
<td class="bdarksilver_head">800. Items Payable in Connection with Loan</td>
<td class="bdarksilver_head" align="right">Amount</td>
</tr>
<tr>
<td class="bsilver">801. #get_fees.A_0801_DESCRIPTION_PURCHASE#</td>
<td class="bordered">#get_fees.A_0801_AMOUNT_PURCHASE#</td>
</tr>
<tr>
<tr>
<td class="bsilver">802. #get_fees.A_0802_DESCRIPTION_PURCHASE#</td>
<td class="bordered">#get_fees.A_0802_AMOUNT_PURCHASE#</td>
</tr>
<tr>
<td class="bsilver">804. #get_fees.A_0804_DESCRIPTION_PURCHASE# &nbsp;to &nbsp;#get_fees.A_0804_PAYTO_PURCHASE#</td>
<td class="bordered">#get_fees.A_0804_AMOUNT_PURCHASE#</td>
</tr>
<tr>
<td class="bsilver">805. #get_fees.A_0805_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#get_fees.A_0805_PAYTO_PURCHASE#</td>
<td class="bordered">#get_fees.A_0805_AMOUNT_PURCHASE#</td>
</tr>
<tr>
<td class="bsilver">806. #get_fees.A_0806_DESCRIPTION_PURCHASE# &nbsp;to &nbsp;#get_fees.A_0806_PAYTO_PURCHASE#</td>
<td class="bordered">#get_fees.A_0806_AMOUNT_PURCHASE#</td>
</tr>

<tr>
<td class="bsilver">807.#get_fees.A_0807_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#get_fees.A_0807_PAYTO_PURCHASE#</td>
<td class="bordered">#get_fees.A_0807_AMOUNT_PURCHASE#</td>
</tr>
<tr>
<td class="bsilver">808. #get_fees.A_0808_DESCRIPTION_PURCHASE# &nbsp;to &nbsp;#get_fees.A_0808_PAYTO_PURCHASE#</td>
<td class="bordered">#get_fees.A_0808_AMOUNT_PURCHASE#</td>
</tr>
<tr>
<td class="bsilver">809. #get_fees.A_0809_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#get_fees.A_0809_PAYTO_PURCHASE#</td>
<td class="bordered">#get_fees.A_0809_AMOUNT_PURCHASE#</td>
</tr>
<tr>
<td class="bsilver">810. #get_fees.A_0810_DESCRIPTION_PURCHASE# &nbsp;to &nbsp;#get_fees.A_0810_PAYTO_PURCHASE#</td>
<td class="bordered">#get_fees.A_0810_AMOUNT_PURCHASE#</td>
</tr>
<tr>
<td class="bsilver">811. #get_fees.A_0811_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#get_fees.A_0811_PAYTO_PURCHASE#</td>
<td class="bordered">#get_fees.A_0811_AMOUNT_PURCHASE#</td>
</tr>
<tr>
<td class="bsilver">812. #get_fees.A_0812_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#get_fees.A_0812_PAYTO_PURCHASE#</td>
<td class="bordered">#get_fees.A_0812_AMOUNT_PURCHASE#</td>
</tr>
</table>
<!-- 1100 -->
<table width="650" summary="Type of Loan" border="1" cellspacing="0">
<tr>
<td class="bdarksilver_head">1100. Title Charges</td>
<td class="bdarksilver_head" align="right">Amount</td>
<td class="bdarksilver_head" align="right">Outside</td>
<td class="bdarksilver_head" align="right">Selectable</td>
</tr>
<tr>
<td class="bsilver">1101. Total charges in connection with Title not explicitly listed below</td>
<td class="bordered">#get_fees.A_1101_AMOUNT_PURCHASE#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Itemized 1101 Charges</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_01_PURCHASE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_01_PURCHASE#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_02_PURCHASE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_02_PURCHASE#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_03_PURCHASE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_03_PURCHASE#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_04_PURCHASE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_04_PURCHASE#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_05_PURCHASE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_05_PURCHASE#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_06_PURCHASE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_06_PURCHASE#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_07_PURCHASE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_07_PURCHASE#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_08_PURCHASE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_08_PURCHASE#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_09_PURCHASE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_09_PURCHASE#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_10_PURCHASE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_10_PURCHASE#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_11_PURCHASE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_11_PURCHASE#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_12_PURCHASE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_12_PURCHASE#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_13_PURCHASE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_13_PURCHASE#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_14_PURCHASE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_14_PURCHASE#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_15_PURCHASE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_15_PURCHASE#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_16_PURCHASE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_16_PURCHASE#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_17_PURCHASE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_17_PURCHASE#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_18_PURCHASE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_18_PURCHASE#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_19_PURCHASE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_19_PURCHASE#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_20_PURCHASE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_20_PURCHASE#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">1102. #get_fees.A_1102_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#get_fees.A_1102_PAYTO_PURCHASE#</td>
<td class="bordered">#get_fees.A_1102_AMOUNT_PURCHASE#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102A. #get_fees_b.A_1102A_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#get_fees_b.A_1102A_PAYTO_PURCHASE#</td>
<td class="bordered">#get_fees_b.A_1102A_AMOUNT_PURCHASE#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102B. #get_fees_b.A_1102B_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#get_fees_b.A_1102B_PAYTO_PURCHASE#</td>
<td class="bordered">#get_fees_b.A_1102B_AMOUNT_PURCHASE#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102C. #get_fees_b.A_1102C_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#get_fees_b.A_1102C_PAYTO_PURCHASE#</td>
<td class="bordered">#get_fees_b.A_1102C_AMOUNT_PURCHASE#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102D. #get_fees_b.A_1102D_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#get_fees_b.A_1102D_PAYTO_PURCHASE#</td>
<td class="bordered">#get_fees_b.A_1102D_AMOUNT_PURCHASE#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102E. #get_fees_b.A_1102E_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#get_fees_b.A_1102E_PAYTO_PURCHASE#</td>
<td class="bordered">#get_fees_b.A_1102E_AMOUNT_PURCHASE#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102F. #get_fees_b.A_1102F_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#get_fees_b.A_1102F_PAYTO_PURCHASE#</td>
<td class="bordered">#get_fees_b.A_1102F_AMOUNT_PURCHASE#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102G. #get_fees_b.A_1102G_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#get_fees_b.A_1102G_PAYTO_PURCHASE#</td>
<td class="bordered">#get_fees_b.A_1102G_AMOUNT_PURCHASE#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102H. #get_fees_b.A_1102H_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#get_fees_b.A_1102H_PAYTO_PURCHASE#</td>
<td class="bordered">#get_fees_b.A_1102H_AMOUNT_PURCHASE#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102I. #get_fees_b.A_1102I_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#get_fees_b.A_1102I_PAYTO_PURCHASE#</td>
<td class="bordered">#get_fees_b.A_1102I_AMOUNT_PURCHASE#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1109. #get_fees.A_1109_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#get_fees.A_1109_PAYTO_PURCHASE#</td>
<td class="bordered">#get_fees.A_1109_AMOUNT_PURCHASE#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1110. #get_fees.A_1110_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#get_fees.A_1110_PAYTO_PURCHASE#</td>
<td class="bordered">#get_fees.A_1110_AMOUNT_PURCHASE#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1111. #get_fees.A_1111_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#get_fees.A_1111_PAYTO_PURCHASE#</td>
<td class="bordered">#get_fees.A_1111_AMOUNT_PURCHASE#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1112. #get_fees.A_1112_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#get_fees.A_1112_PAYTO_PURCHASE#</td>
<td class="bordered">#get_fees.A_1112_AMOUNT_PURCHASE#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1113. #get_fees.A_1113_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#get_fees.A_1113_PAYTO_PURCHASE#</td>
<td class="bordered">#get_fees.A_1113_AMOUNT_PURCHASE#</td>
<td class="bordered" align="left"></td></tr>
</table>
<!-- 1300 -->
<table width="650" summary="Type of Loan" border="1" cellspacing="0">
<tr>
<td class="bdarksilver_head">1300. Additional Settlement Charges (for Non-Title/Settlement Charges)</td>
<td class="bdarksilver_head" align="right">Amount</td>
<td class="bdarksilver_head" align="right">Outside</td>

</tr>
<tr>
<td class="bsilver">1302. #get_fees_b.A_1302_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#get_fees_b.A_1302_PAYTO_PURCHASE#</td>
<td class="bordered">#get_fees_b.A_1302_AMOUNT_PURCHASE#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1303. #get_fees_b.A_1303_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#get_fees_b.A_1303_PAYTO_PURCHASE#</td>
<td class="bordered">#get_fees_b.A_1303_AMOUNT_PURCHASE#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1304. #get_fees_b.A_1304_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#get_fees_b.A_1304_PAYTO_PURCHASE#</td>
<td class="bordered">#get_fees_b.A_1304_AMOUNT_PURCHASE#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1305. #get_fees_b.A_1305_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#get_fees_b.A_1305_PAYTO_PURCHASE#</td>
<td class="bordered">#get_fees_b.A_1305_AMOUNT_PURCHASE#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1306. #get_fees_b.A_1306_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#get_fees_b.A_1306_PAYTO_PURCHASE#</td>
<td class="bordered">#get_fees_b.A_1306_AMOUNT_PURCHASE#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1307. #get_fees_b.A_1307_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#get_fees_b.A_1307_PAYTO_PURCHASE#</td>
<td class="bordered">#get_fees_b.A_1307_AMOUNT_PURCHASE#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1308. #get_fees_b.A_1308_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#get_fees_b.A_1308_PAYTO_PURCHASE#</td>
<td class="bordered">#get_fees_b.A_1308_AMOUNT_PURCHASE#</td>
<td class="bordered" align="left"></td></tr>
</table>
<br>
<br>
<br>
<span class="page_title">2ND MORTGAGE with NO Title Insurance</span><BR>
<table width="650" summary="Type of Loan" border="1" cellspacing="0">
<tr><td height="4" colspan="6"></td></tr>
<tr>
<td class="bdarksilver_head">800. Items Payable in Connection with Loan</td>
<td class="bdarksilver_head" align="right">Amount</td>
</tr>
<tr>
<td class="bsilver">801. #get_fees.A_0801_DESCRIPTION_2ND_NO_TI#</td>
<td class="bordered">#get_fees.A_0801_AMOUNT_2ND_NO_TI#</td>
</tr>
<tr>
<tr>
<td class="bsilver">802. #get_fees.A_0802_DESCRIPTION_2ND_NO_TI#</td>
<td class="bordered">#get_fees.A_0802_AMOUNT_2ND_NO_TI#</td>
</tr>
<tr>
<td class="bsilver">804. #get_fees.A_0804_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#get_fees.A_0804_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#get_fees.A_0804_AMOUNT_2ND_NO_TI#</td>
</tr>
<tr>
<td class="bsilver">805. #get_fees.A_0805_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#get_fees.A_0805_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#get_fees.A_0805_AMOUNT_2ND_NO_TI#</td>
</tr>
<tr>
<td class="bsilver">806. #get_fees.A_0806_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#get_fees.A_0806_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#get_fees.A_0806_AMOUNT_2ND_NO_TI#</td>
</tr>

<tr>
<td class="bsilver">807.#get_fees.A_0807_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#get_fees.A_0807_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#get_fees.A_0807_AMOUNT_2ND_NO_TI#</td>
</tr>
<tr>
<td class="bsilver">808. #get_fees.A_0808_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#get_fees.A_0808_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#get_fees.A_0808_AMOUNT_2ND_NO_TI#</td>
</tr>
<tr>
<td class="bsilver">809. #get_fees.A_0809_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#get_fees.A_0809_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#get_fees.A_0809_AMOUNT_2ND_NO_TI#</td>
</tr>
<tr>
<td class="bsilver">810. #get_fees.A_0810_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#get_fees.A_0810_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#get_fees.A_0810_AMOUNT_2ND_NO_TI#</td>
</tr>
<tr>
<td class="bsilver">811. #get_fees.A_0811_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#get_fees.A_0811_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#get_fees.A_0811_AMOUNT_2ND_NO_TI#</td>
</tr>
<tr>
<td class="bsilver">812. #get_fees.A_0812_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#get_fees.A_0812_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#get_fees.A_0812_AMOUNT_2ND_NO_TI#</td>
</tr>
</table>
<!-- 1100 -->
<table width="650" summary="Type of Loan" border="1" cellspacing="0">
<tr>
<td class="bdarksilver_head">1100. Title Charges</td>
<td class="bdarksilver_head" align="right">Amount</td>
<td class="bdarksilver_head" align="right">Outside</td>
<td class="bdarksilver_head" align="right">Selectable</td>
</tr>
<tr>
<td class="bsilver">1101. Total charges in connection with Title not explicitly listed below</td>
<td class="bordered">#get_fees.A_1101_AMOUNT_2ND_NO_TI#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Itemized 1101 Charges</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_01_2ND_NO_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_01_2ND_NO_TI#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_02_2ND_NO_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_02_2ND_NO_TI#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_03_2ND_NO_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_03_2ND_NO_TI#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>

<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_04_2ND_NO_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_04_2ND_NO_TI#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_05_2ND_NO_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_05_2ND_NO_TI#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_06_2ND_NO_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_06_2ND_NO_TI#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_07_2ND_NO_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_07_2ND_NO_TI#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_08_2ND_NO_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_08_2ND_NO_TI#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_09_2ND_NO_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_09_2ND_NO_TI#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_10_2ND_NO_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_10_2ND_NO_TI#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_11_2ND_NO_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_11_2ND_NO_TI#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_12_2ND_NO_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_12_2ND_NO_TI#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_13_2ND_NO_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_13_2ND_NO_TI#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_14_2ND_NO_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_14_2ND_NO_TI#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_15_2ND_NO_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_15_2ND_NO_TI#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_16_2ND_NO_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_16_2ND_NO_TI#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_17_2ND_NO_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_17_2ND_NO_TI#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_18_2ND_NO_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_18_2ND_NO_TI#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_19_2ND_NO_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_19_2ND_NO_TI#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_20_2ND_NO_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_20_2ND_NO_TI#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">1102. #get_fees.A_1102_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#get_fees.A_1102_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#get_fees.A_1102_AMOUNT_2ND_NO_TI#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102A. #get_fees_b.A_1102A_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#get_fees_b.A_1102A_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#get_fees_b.A_1102A_AMOUNT_2ND_NO_TI#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102B. #get_fees_b.A_1102B_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#get_fees_b.A_1102B_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#get_fees_b.A_1102B_AMOUNT_2ND_NO_TI#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102C. #get_fees_b.A_1102C_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#get_fees_b.A_1102C_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#get_fees_b.A_1102C_AMOUNT_2ND_NO_TI#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102D. #get_fees_b.A_1102D_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#get_fees_b.A_1102D_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#get_fees_b.A_1102D_AMOUNT_2ND_NO_TI#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102E. #get_fees_b.A_1102E_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#get_fees_b.A_1102E_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#get_fees_b.A_1102E_AMOUNT_2ND_NO_TI#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102F. #get_fees_b.A_1102F_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#get_fees_b.A_1102F_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#get_fees_b.A_1102F_AMOUNT_2ND_NO_TI#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102G. #get_fees_b.A_1102G_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#get_fees_b.A_1102G_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#get_fees_b.A_1102G_AMOUNT_2ND_NO_TI#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102H. #get_fees_b.A_1102H_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#get_fees_b.A_1102H_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#get_fees_b.A_1102H_AMOUNT_2ND_NO_TI#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102I. #get_fees_b.A_1102I_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#get_fees_b.A_1102I_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#get_fees_b.A_1102I_AMOUNT_2ND_NO_TI#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1109. #get_fees.A_1109_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#get_fees.A_1109_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#get_fees.A_1109_AMOUNT_2ND_NO_TI#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1110. #get_fees.A_1110_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#get_fees.A_1110_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#get_fees.A_1110_AMOUNT_2ND_NO_TI#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1111. #get_fees.A_1111_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#get_fees.A_1111_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#get_fees.A_1111_AMOUNT_2ND_NO_TI#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1112. #get_fees.A_1112_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#get_fees.A_1112_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#get_fees.A_1112_AMOUNT_2ND_NO_TI#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1113. #get_fees.A_1113_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#get_fees.A_1113_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#get_fees.A_1113_AMOUNT_2ND_NO_TI#</td>
<td class="bordered" align="left"></td></tr>
</table>
<!-- 1300 -->
<table width="650" summary="Type of Loan" border="1" cellspacing="0">
<tr>
<td class="bdarksilver_head">1300. Additional Settlement Charges (for Non-Title/Settlement Charges)</td>
<td class="bdarksilver_head" align="right">Amount</td>
<td class="bdarksilver_head" align="right">Outside</td>

</tr>
<tr>
<td class="bsilver">1302. #get_fees_b.A_1302_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#get_fees_b.A_1302_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#get_fees_b.A_1302_AMOUNT_2ND_NO_TI#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1303. #get_fees_b.A_1303_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#get_fees_b.A_1303_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#get_fees_b.A_1303_AMOUNT_2ND_NO_TI#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1304. #get_fees_b.A_1304_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#get_fees_b.A_1304_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#get_fees_b.A_1304_AMOUNT_2ND_NO_TI#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1305. #get_fees_b.A_1305_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#get_fees_b.A_1305_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#get_fees_b.A_1305_AMOUNT_2ND_NO_TI#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1306. #get_fees_b.A_1306_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#get_fees_b.A_1306_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#get_fees_b.A_1306_AMOUNT_2ND_NO_TI#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1307. #get_fees_b.A_1307_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#get_fees_b.A_1307_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#get_fees_b.A_1307_AMOUNT_2ND_NO_TI#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1308. #get_fees_b.A_1308_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#get_fees_b.A_1308_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#get_fees_b.A_1308_AMOUNT_2ND_NO_TI#</td>
<td class="bordered" align="left"></td></tr>
</table>
<br>
<br>
<br>
<span class="page_title">2ND MORTGAGE WITH Title Insurance</span><BR>
<!-- 800 -->
<table width="650" summary="Type of Loan" border="1" cellspacing="0">
<tr><td height="4" colspan="6"></td></tr>
<tr>
<td class="bdarksilver_head">800. Items Payable in Connection with Loan</td>
<td class="bdarksilver_head" align="right">Amount</td>
</tr>
<tr>
<td class="bsilver">801. #get_fees.A_0801_DESCRIPTION_2ND_WITH_TI#</td>
<td class="bordered">#get_fees.A_0801_AMOUNT_2ND_WITH_TI#</td>
</tr>
<tr>
<tr>
<td class="bsilver">802. #get_fees.A_0802_DESCRIPTION_2ND_WITH_TI#</td>
<td class="bordered">#get_fees.A_0802_AMOUNT_2ND_WITH_TI#</td>
</tr>
<tr>
<td class="bsilver">804. #get_fees.A_0804_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#get_fees.A_0804_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#get_fees.A_0804_AMOUNT_2ND_WITH_TI#</td>
</tr>
<tr>
<td class="bsilver">805. #get_fees.A_0805_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#get_fees.A_0805_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#get_fees.A_0805_AMOUNT_2ND_WITH_TI#</td>
</tr>
<tr>
<td class="bsilver">806. #get_fees.A_0806_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#get_fees.A_0806_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#get_fees.A_0806_AMOUNT_2ND_WITH_TI#</td>
</tr>

<tr>
<td class="bsilver">807.#get_fees.A_0807_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#get_fees.A_0807_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#get_fees.A_0807_AMOUNT_2ND_WITH_TI#</td>
</tr>
<tr>
<td class="bsilver">808. #get_fees.A_0808_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#get_fees.A_0808_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#get_fees.A_0808_AMOUNT_2ND_WITH_TI#</td>
</tr>
<tr>
<td class="bsilver">809. #get_fees.A_0809_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#get_fees.A_0809_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#get_fees.A_0809_AMOUNT_2ND_WITH_TI#</td>
</tr>
<tr>
<td class="bsilver">810. #get_fees.A_0810_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#get_fees.A_0810_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#get_fees.A_0810_AMOUNT_2ND_WITH_TI#</td>
</tr>
<tr>
<td class="bsilver">811. #get_fees.A_0811_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#get_fees.A_0811_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#get_fees.A_0811_AMOUNT_2ND_WITH_TI#</td>
</tr>
<tr>
<td class="bsilver">812. #get_fees.A_0812_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#get_fees.A_0812_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#get_fees.A_0812_AMOUNT_2ND_WITH_TI#</td>
</tr>
</table>
<!-- 1100 -->
<table width="650" summary="Type of Loan" border="1" cellspacing="0">
<tr>
<td class="bdarksilver_head">1100. Title Charges</td>
<td class="bdarksilver_head" align="right">Amount</td>
<td class="bdarksilver_head" align="right">Outside</td>
<td class="bdarksilver_head" align="right">Selectable</td>
</tr>
<tr>
<td class="bsilver">1101. Total charges in connection with Title not explicitly listed below</td>
<td class="bordered">#get_fees.A_1101_AMOUNT_2ND_WITH_TI#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Itemized 1101 Charges</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_01_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_01_2ND_WITH_TI#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_02_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_02_2ND_WITH_TI#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_03_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_03_2ND_WITH_TI#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_04_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_04_2ND_WITH_TI#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_05_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_05_2ND_WITH_TI#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_06_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_06_2ND_WITH_TI#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_07_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_07_2ND_WITH_TI#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_08_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_08_2ND_WITH_TI#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_09_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_09_2ND_WITH_TI#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_10_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_10_2ND_WITH_TI#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_11_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_11_2ND_WITH_TI#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_12_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_12_2ND_WITH_TI#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_13_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_13_2ND_WITH_TI#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_14_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_14_2ND_WITH_TI#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_15_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_15_2ND_WITH_TI#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_16_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_16_2ND_WITH_TI#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_17_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_17_2ND_WITH_TI#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_18_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_18_2ND_WITH_TI#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_19_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_19_2ND_WITH_TI#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_20_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_20_2ND_WITH_TI#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">1102. #get_fees.A_1102_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#get_fees.A_1102_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#get_fees.A_1102_AMOUNT_2ND_WITH_TI#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102A. #get_fees_b.A_1102A_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#get_fees_b.A_1102A_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#get_fees_b.A_1102A_AMOUNT_2ND_WITH_TI#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102B. #get_fees_b.A_1102B_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#get_fees_b.A_1102B_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#get_fees_b.A_1102B_AMOUNT_2ND_WITH_TI#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102C. #get_fees_b.A_1102C_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#get_fees_b.A_1102C_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#get_fees_b.A_1102C_AMOUNT_2ND_WITH_TI#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102D. #get_fees_b.A_1102D_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#get_fees_b.A_1102D_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#get_fees_b.A_1102D_AMOUNT_2ND_WITH_TI#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102E. #get_fees_b.A_1102E_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#get_fees_b.A_1102E_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#get_fees_b.A_1102E_AMOUNT_2ND_WITH_TI#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102F. #get_fees_b.A_1102F_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#get_fees_b.A_1102F_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#get_fees_b.A_1102F_AMOUNT_2ND_WITH_TI#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102G. #get_fees_b.A_1102G_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#get_fees_b.A_1102G_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#get_fees_b.A_1102G_AMOUNT_2ND_WITH_TI#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102H. #get_fees_b.A_1102H_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#get_fees_b.A_1102H_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#get_fees_b.A_1102H_AMOUNT_2ND_WITH_TI#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102I. #get_fees_b.A_1102I_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#get_fees_b.A_1102I_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#get_fees_b.A_1102I_AMOUNT_2ND_WITH_TI#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1109. #get_fees.A_1109_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#get_fees.A_1109_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#get_fees.A_1109_AMOUNT_2ND_WITH_TI#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1110. #get_fees.A_1110_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#get_fees.A_1110_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#get_fees.A_1110_AMOUNT_2ND_WITH_TI#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1111. #get_fees.A_1111_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#get_fees.A_1111_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#get_fees.A_1111_AMOUNT_2ND_WITH_TI#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1112. #get_fees.A_1112_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#get_fees.A_1112_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#get_fees.A_1112_AMOUNT_2ND_WITH_TI#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1113. #get_fees.A_1113_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#get_fees.A_1113_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#get_fees.A_1113_AMOUNT_2ND_WITH_TI#</td>
<td class="bordered" align="left"></td></tr>
</table>
<!-- 1300 -->
<table width="650" summary="Type of Loan" border="1" cellspacing="0">
<tr>
<td class="bdarksilver_head">1300. Additional Settlement Charges (for Non-Title/Settlement Charges)</td>
<td class="bdarksilver_head" align="right">Amount</td>
<td class="bdarksilver_head" align="right">Outside</td>

</tr>
<tr>
<td class="bsilver">1302. #get_fees_b.A_1302_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#get_fees_b.A_1302_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#get_fees_b.A_1302_AMOUNT_2ND_WITH_TI#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1303. #get_fees_b.A_1303_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#get_fees_b.A_1303_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#get_fees_b.A_1303_AMOUNT_2ND_WITH_TI#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1304. #get_fees_b.A_1304_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#get_fees_b.A_1304_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#get_fees_b.A_1304_AMOUNT_2ND_WITH_TI#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1305. #get_fees_b.A_1305_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#get_fees_b.A_1305_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#get_fees_b.A_1305_AMOUNT_2ND_WITH_TI#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1306. #get_fees_b.A_1306_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#get_fees_b.A_1306_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#get_fees_b.A_1306_AMOUNT_2ND_WITH_TI#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1307. #get_fees_b.A_1307_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#get_fees_b.A_1307_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#get_fees_b.A_1307_AMOUNT_2ND_WITH_TI#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1308. #get_fees_b.A_1308_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#get_fees_b.A_1308_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#get_fees_b.A_1308_AMOUNT_2ND_WITH_TI#</td>
<td class="bordered" align="left"></td></tr>
</table>
<br>
<br>
<br>
<span class="page_title">PURCHASE_SELLER</span><BR>
<!-- 800 -->
<table width="650" summary="Type of Loan" border="1" cellspacing="0">
<tr><td height="4" colspan="6"></td></tr>
<tr>
<td class="bdarksilver_head">800. Items Payable in Connection with Loan</td>
<td class="bdarksilver_head" align="right">Amount</td>
</tr>
<tr>
<td class="bsilver">801. #get_fees.A_0801_DESCRIPTION_PURCHASE_SELLER#</td>
<td class="bordered">#get_fees.A_0801_AMOUNT_PURCHASE_SELLER#</td>
</tr>
<tr>
<tr>
<td class="bsilver">802. #get_fees.A_0802_DESCRIPTION_PURCHASE_SELLER#</td>
<td class="bordered">#get_fees.A_0802_AMOUNT_PURCHASE_SELLER#</td>
</tr>
<tr>
<td class="bsilver">804. #get_fees.A_0804_DESCRIPTION_PURCHASE_SELLER# &nbsp;to &nbsp;#get_fees.A_0804_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#get_fees.A_0804_AMOUNT_PURCHASE_SELLER#</td>
</tr>
<tr>
<td class="bsilver">805. #get_fees.A_0805_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#get_fees.A_0805_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#get_fees.A_0805_AMOUNT_PURCHASE_SELLER#</td>
</tr>
<tr>
<td class="bsilver">806. #get_fees.A_0806_DESCRIPTION_PURCHASE_SELLER# &nbsp;to &nbsp;#get_fees.A_0806_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#get_fees.A_0806_AMOUNT_PURCHASE_SELLER#</td>
</tr>

<tr>
<td class="bsilver">807.#get_fees.A_0807_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#get_fees.A_0807_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#get_fees.A_0807_AMOUNT_PURCHASE_SELLER#</td>
</tr>
<tr>
<td class="bsilver">808. #get_fees.A_0808_DESCRIPTION_PURCHASE_SELLER# &nbsp;to &nbsp;#get_fees.A_0808_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#get_fees.A_0808_AMOUNT_PURCHASE_SELLER#</td>
</tr>
<tr>
<td class="bsilver">809. #get_fees.A_0809_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#get_fees.A_0809_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#get_fees.A_0809_AMOUNT_PURCHASE_SELLER#</td>
</tr>
<tr>
<td class="bsilver">810. #get_fees.A_0810_DESCRIPTION_PURCHASE_SELLER# &nbsp;to &nbsp;#get_fees.A_0810_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#get_fees.A_0810_AMOUNT_PURCHASE_SELLER#</td>
</tr>
<tr>
<td class="bsilver">811. #get_fees.A_0811_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#get_fees.A_0811_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#get_fees.A_0811_AMOUNT_PURCHASE_SELLER#</td>
</tr>
<tr>
<td class="bsilver">812. #get_fees.A_0812_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#get_fees.A_0812_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#get_fees.A_0812_AMOUNT_PURCHASE_SELLER#</td>
</tr>
</table>
<!-- 1100 -->
<table width="650" summary="Type of Loan" border="1" cellspacing="0">
<tr>
<td class="bdarksilver_head">1100. Title Charges</td>
<td class="bdarksilver_head" align="right">Amount</td>
<td class="bdarksilver_head" align="right">Outside</td>
<td class="bdarksilver_head" align="right">Selectable</td>
</tr>
<tr>
<td class="bsilver">1101. Total charges in connection with Title not explicitly listed below</td>
<td class="bordered">#get_fees.A_1101_AMOUNT_PURCHASE_SELLER#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Itemized 1101 Charges</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_01_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_01_PURCHASE_SELLER#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_02_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_02_PURCHASE_SELLER#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_03_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_03_PURCHASE_SELLER#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_04_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_04_PURCHASE_SELLER#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_05_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_05_PURCHASE_SELLER#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_06_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_06_PURCHASE_SELLER#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_07_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_07_PURCHASE_SELLER#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_08_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_08_PURCHASE_SELLER#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_09_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_09_PURCHASE_SELLER#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_10_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_10_PURCHASE_SELLER#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_11_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_11_PURCHASE_SELLER#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_12_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_12_PURCHASE_SELLER#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_13_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_13_PURCHASE_SELLER#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_14_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_14_PURCHASE_SELLER#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_15_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_15_PURCHASE_SELLER#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_16_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_16_PURCHASE_SELLER#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_17_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_17_PURCHASE_SELLER#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_18_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_18_PURCHASE_SELLER#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_19_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_19_PURCHASE_SELLER#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_DESCRIPTION_20_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_fees.A_1101_ITEM_AMOUNT_20_PURCHASE_SELLER#</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="left">
</td>
</tr>
<tr>
<td class="bsilver">1102. #get_fees.A_1102_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#get_fees.A_1102_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#get_fees.A_1102_AMOUNT_PURCHASE_SELLER#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102A. #get_fees_b.A_1102A_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#get_fees_b.A_1102A_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#get_fees_b.A_1102A_AMOUNT_PURCHASE_SELLER#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102B. #get_fees_b.A_1102B_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#get_fees_b.A_1102B_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#get_fees_b.A_1102B_AMOUNT_PURCHASE_SELLER#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102C. #get_fees_b.A_1102C_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#get_fees_b.A_1102C_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#get_fees_b.A_1102C_AMOUNT_PURCHASE_SELLER#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102D. #get_fees_b.A_1102D_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#get_fees_b.A_1102D_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#get_fees_b.A_1102D_AMOUNT_PURCHASE_SELLER#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102E. #get_fees_b.A_1102E_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#get_fees_b.A_1102E_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#get_fees_b.A_1102E_AMOUNT_PURCHASE_SELLER#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102F. #get_fees_b.A_1102F_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#get_fees_b.A_1102F_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#get_fees_b.A_1102F_AMOUNT_PURCHASE_SELLER#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102G. #get_fees_b.A_1102G_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#get_fees_b.A_1102G_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#get_fees_b.A_1102G_AMOUNT_PURCHASE_SELLER#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102H. #get_fees_b.A_1102H_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#get_fees_b.A_1102H_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#get_fees_b.A_1102H_AMOUNT_PURCHASE_SELLER#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102I. #get_fees_b.A_1102I_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#get_fees_b.A_1102I_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#get_fees_b.A_1102I_AMOUNT_PURCHASE_SELLER#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1109. #get_fees.A_1109_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#get_fees.A_1109_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#get_fees.A_1109_AMOUNT_PURCHASE_SELLER#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1110. #get_fees.A_1110_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#get_fees.A_1110_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#get_fees.A_1110_AMOUNT_PURCHASE_SELLER#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1111. #get_fees.A_1111_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#get_fees.A_1111_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#get_fees.A_1111_AMOUNT_PURCHASE_SELLER#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1112. #get_fees.A_1112_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#get_fees.A_1112_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#get_fees.A_1112_AMOUNT_PURCHASE_SELLER#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1113. #get_fees.A_1113_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#get_fees.A_1113_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#get_fees.A_1113_AMOUNT_PURCHASE_SELLER#</td>
<td class="bordered" align="left"></td></tr>
</table>
<!-- 1300 -->
<table width="650" summary="Type of Loan" border="1" cellspacing="0">
<tr>
<td class="bdarksilver_head">1300. Additional Settlement Charges (for Non-Title/Settlement Charges)</td>
<td class="bdarksilver_head" align="right">Amount</td>
<td class="bdarksilver_head" align="right">Outside</td>

</tr>
<tr>
<td class="bsilver">1302. #get_fees_b.A_1302_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#get_fees_b.A_1302_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#get_fees_b.A_1302_AMOUNT_PURCHASE_SELLER#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1303. #get_fees_b.A_1303_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#get_fees_b.A_1303_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#get_fees_b.A_1303_AMOUNT_PURCHASE_SELLER#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1304. #get_fees_b.A_1304_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#get_fees_b.A_1304_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#get_fees_b.A_1304_AMOUNT_PURCHASE_SELLER#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1305. #get_fees_b.A_1305_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#get_fees_b.A_1305_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#get_fees_b.A_1305_AMOUNT_PURCHASE_SELLER#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1306. #get_fees_b.A_1306_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#get_fees_b.A_1306_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#get_fees_b.A_1306_AMOUNT_PURCHASE_SELLER#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1307. #get_fees_b.A_1307_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#get_fees_b.A_1307_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#get_fees_b.A_1307_AMOUNT_PURCHASE_SELLER#</td>
<td class="bordered" align="left"></td></tr>
<tr>
<td class="bsilver">1308. #get_fees_b.A_1308_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#get_fees_b.A_1308_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#get_fees_b.A_1308_AMOUNT_PURCHASE_SELLER#</td>
<td class="bordered" align="left"></td></tr>
</table>
</cfoutput>
	</td>
<cfif read_this_sets_billing_states.recordcount eq 1>		
			<td align="left" valign="top"><CFOUTPUT>
	</CFOUTPUT>
</td>
</cfif>
	</tr>
	
	</table>

	<table width=797 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>	
		<tr>		
		<td width=797 colspan=4 align=right valign=top bgcolor=e6e6e6>		
	</td>
	</tr>
	</table><!--- 

	<tr>		
		<td width=797 colspan=4 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			&nbsp; --->
		</td>
</tr></table>
</CFFORM>
	<!--- ======================================================== 
--->

</table>

			


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

