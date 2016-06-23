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


		<CFQUERY datasource="#request.dsn#" NAME="find_itemized_construction">
			SELECT *
			FROM ITEMIZED_1101_CHARGES_CONSTRUCTION
			WHERE company_ID = #company_id# and billing_ID = #billing_id#
			order by ID desc
		</CFQUERY>
<cfif find_itemized_construction.recordcount eq 0>
		<CFQUERY datasource="#request.dsn#" NAME="add_itemized">
			insert into ITEMIZED_1101_CHARGES_CONSTRUCTION (company_id, billing_id)
			values(#company_id#, #billing_id#)
		</CFQUERY>
</cfif>



<CFQUERY datasource="#request.dsn#" NAME="test_for_table">
			SELECT *
			FROM company_billing_values_construction_HUD2010
			WHERE company_ID = #company_id# and billing_ID = #billing_id#
		</CFQUERY>
<cfif test_for_table.recordcount eq 0>
		<CFQUERY datasource="#request.dsn#" NAME="add_itemized">
			insert into company_billing_values_construction_HUD2010 (company_id, billing_id)
			values(#company_id#, #billing_id#)
		</CFQUERY>
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="test_for_table">
			SELECT *
			FROM company_billing_values_construction_B_HUD2010
			WHERE company_ID = #company_id# and billing_ID = #billing_id#
		</CFQUERY>
<cfif test_for_table.recordcount eq 0>
		<CFQUERY datasource="#request.dsn#" NAME="add_itemized">
			insert into company_billing_values_construction_b_HUD2010 (company_id, billing_id)
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



		<CFQUERY datasource="#request.dsn#" NAME="get_fees_construction">
			SELECT *
			FROM company_billing_values_construction_HUD2010 c, ITEMIZED_1101_CHARGES_construction i
			WHERE c.company_ID = #company_id# and c.billing_ID = #billing_id#
			and i.billing_id = c.billing_id
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="get_fees_b_construction">
			SELECT *
			FROM company_billing_values_construction_b_HUD2010
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





function roll_up_1101_CONSTR_1X() {
var temp = 0;
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_01_CONSTR_1X.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_01_CONSTR_1X.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_01_CONSTR_1X.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_02_CONSTR_1X.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_02_CONSTR_1X.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_02_CONSTR_1X.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_03_CONSTR_1X.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_03_CONSTR_1X.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_03_CONSTR_1X.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_04_CONSTR_1X.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_04_CONSTR_1X.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_04_CONSTR_1X.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_05_CONSTR_1X.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_05_CONSTR_1X.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_05_CONSTR_1X.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_06_CONSTR_1X.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_06_CONSTR_1X.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_06_CONSTR_1X.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_07_CONSTR_1X.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_07_CONSTR_1X.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_07_CONSTR_1X.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_08_CONSTR_1X.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_08_CONSTR_1X.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_08_CONSTR_1X.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_09_CONSTR_1X.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_09_CONSTR_1X.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_09_CONSTR_1X.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_10_CONSTR_1X.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_10_CONSTR_1X.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_10_CONSTR_1X.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_11_CONSTR_1X.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_11_CONSTR_1X.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_11_CONSTR_1X.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_12_CONSTR_1X.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_12_CONSTR_1X.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_12_CONSTR_1X.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_13_CONSTR_1X.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_13_CONSTR_1X.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_13_CONSTR_1X.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_14_CONSTR_1X.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_14_CONSTR_1X.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_14_CONSTR_1X.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_15_CONSTR_1X.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_15_CONSTR_1X.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_15_CONSTR_1X.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_16_CONSTR_1X.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_16_CONSTR_1X.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_16_CONSTR_1X.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_17_CONSTR_1X.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_17_CONSTR_1X.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_17_CONSTR_1X.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_18_CONSTR_1X.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_18_CONSTR_1X.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_18_CONSTR_1X.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_19_CONSTR_1X.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_19_CONSTR_1X.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_19_CONSTR_1X.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_20_CONSTR_1X.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_20_CONSTR_1X.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_20_CONSTR_1X.value);
    }

if (parseFloat(temp) != 0 && temp != '') {
document.frm.A_1101_AMOUNT_CONSTR_1X.value = parseFloat(temp);
} else {
document.frm.A_1101_AMOUNT_CONSTR_1X.value = '';
}


}



function roll_up_1101_CONSTR_2X() {
var temp = 0;
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_01_CONSTR_2X.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_01_CONSTR_2X.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_01_CONSTR_2X.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_02_CONSTR_2X.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_02_CONSTR_2X.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_02_CONSTR_2X.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_03_CONSTR_2X.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_03_CONSTR_2X.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_03_CONSTR_2X.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_04_CONSTR_2X.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_04_CONSTR_2X.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_04_CONSTR_2X.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_05_CONSTR_2X.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_05_CONSTR_2X.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_05_CONSTR_2X.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_06_CONSTR_2X.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_06_CONSTR_2X.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_06_CONSTR_2X.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_07_CONSTR_2X.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_07_CONSTR_2X.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_07_CONSTR_2X.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_08_CONSTR_2X.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_08_CONSTR_2X.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_08_CONSTR_2X.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_09_CONSTR_2X.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_09_CONSTR_2X.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_09_CONSTR_2X.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_10_CONSTR_2X.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_10_CONSTR_2X.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_10_CONSTR_2X.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_11_CONSTR_2X.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_11_CONSTR_2X.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_11_CONSTR_2X.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_12_CONSTR_2X.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_12_CONSTR_2X.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_12_CONSTR_2X.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_13_CONSTR_2X.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_13_CONSTR_2X.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_13_CONSTR_2X.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_14_CONSTR_2X.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_14_CONSTR_2X.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_14_CONSTR_2X.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_15_CONSTR_2X.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_15_CONSTR_2X.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_15_CONSTR_2X.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_16_CONSTR_2X.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_16_CONSTR_2X.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_16_CONSTR_2X.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_17_CONSTR_2X.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_17_CONSTR_2X.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_17_CONSTR_2X.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_18_CONSTR_2X.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_18_CONSTR_2X.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_18_CONSTR_2X.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_19_CONSTR_2X.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_19_CONSTR_2X.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_19_CONSTR_2X.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_20_CONSTR_2X.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_20_CONSTR_2X.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_20_CONSTR_2X.value);
    }

if (parseFloat(temp) != 0 && temp != '') {
document.frm.A_1101_AMOUNT_CONSTR_2X.value = parseFloat(temp);
} else {
document.frm.A_1101_AMOUNT_CONSTR_2X.value = '';
}


}




function roll_up_1101_END_LOAN() {
var temp = 0;
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_01_END_LOAN.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_01_END_LOAN.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_01_END_LOAN.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_02_END_LOAN.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_02_END_LOAN.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_02_END_LOAN.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_03_END_LOAN.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_03_END_LOAN.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_03_END_LOAN.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_04_END_LOAN.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_04_END_LOAN.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_04_END_LOAN.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_05_END_LOAN.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_05_END_LOAN.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_05_END_LOAN.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_06_END_LOAN.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_06_END_LOAN.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_06_END_LOAN.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_07_END_LOAN.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_07_END_LOAN.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_07_END_LOAN.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_08_END_LOAN.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_08_END_LOAN.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_08_END_LOAN.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_09_END_LOAN.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_09_END_LOAN.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_09_END_LOAN.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_10_END_LOAN.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_10_END_LOAN.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_10_END_LOAN.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_11_END_LOAN.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_11_END_LOAN.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_11_END_LOAN.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_12_END_LOAN.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_12_END_LOAN.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_12_END_LOAN.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_13_END_LOAN.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_13_END_LOAN.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_13_END_LOAN.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_14_END_LOAN.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_14_END_LOAN.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_14_END_LOAN.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_15_END_LOAN.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_15_END_LOAN.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_15_END_LOAN.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_16_END_LOAN.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_16_END_LOAN.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_16_END_LOAN.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_17_END_LOAN.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_17_END_LOAN.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_17_END_LOAN.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_18_END_LOAN.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_18_END_LOAN.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_18_END_LOAN.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_19_END_LOAN.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_19_END_LOAN.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_19_END_LOAN.value);
    }
if (isNaN(parseFloat(document.frm.A_1101_ITEM_AMOUNT_20_END_LOAN.value)) == false
    && document.frm.A_1101_ITEM_AMOUNT_20_END_LOAN.value != '') {
    temp = temp + parseFloat(document.frm.A_1101_ITEM_AMOUNT_20_END_LOAN.value);
    }

if (parseFloat(temp) != 0 && temp != '') {
document.frm.A_1101_AMOUNT_END_LOAN.value = parseFloat(temp);
} else {
document.frm.A_1101_AMOUNT_END_LOAN.value = '';
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
roll_up_1101_CONSTR_1X();
roll_up_1101_CONSTR_2X();
roll_up_1101_END_LOAN();
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
document.frm.A_1102A_DESCRIPTION_PURCHASE.value = document.frm.A_1102A_DESCRIPTION_REFINANCE.value;
document.frm.A_1102A_DESCRIPTION_2ND_NO_TI.value = document.frm.A_1102A_DESCRIPTION_REFINANCE.value;
document.frm.A_1102A_DESCRIPTION_2ND_WITH_TI.value = document.frm.A_1102A_DESCRIPTION_REFINANCE.value;
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
document.frm.A_1102B_DESCRIPTION_PURCHASE.value = document.frm.A_1102B_DESCRIPTION_REFINANCE.value;
document.frm.A_1102B_DESCRIPTION_2ND_NO_TI.value = document.frm.A_1102B_DESCRIPTION_REFINANCE.value;
document.frm.A_1102B_DESCRIPTION_2ND_WITH_TI.value = document.frm.A_1102B_DESCRIPTION_REFINANCE.value;
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
document.frm.A_1102C_DESCRIPTION_PURCHASE.value = document.frm.A_1102C_DESCRIPTION_REFINANCE.value;
document.frm.A_1102C_DESCRIPTION_2ND_NO_TI.value = document.frm.A_1102C_DESCRIPTION_REFINANCE.value;
document.frm.A_1102C_DESCRIPTION_2ND_WITH_TI.value = document.frm.A_1102C_DESCRIPTION_REFINANCE.value;
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
document.frm.A_1102D_DESCRIPTION_PURCHASE.value = document.frm.A_1102D_DESCRIPTION_REFINANCE.value;
document.frm.A_1102D_DESCRIPTION_2ND_NO_TI.value = document.frm.A_1102D_DESCRIPTION_REFINANCE.value;
document.frm.A_1102D_DESCRIPTION_2ND_WITH_TI.value = document.frm.A_1102D_DESCRIPTION_REFINANCE.value;
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
document.frm.A_1102E_DESCRIPTION_PURCHASE.value = document.frm.A_1102E_DESCRIPTION_REFINANCE.value;
document.frm.A_1102E_DESCRIPTION_2ND_NO_TI.value = document.frm.A_1102E_DESCRIPTION_REFINANCE.value;
document.frm.A_1102E_DESCRIPTION_2ND_WITH_TI.value = document.frm.A_1102E_DESCRIPTION_REFINANCE.value;
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
document.frm.A_1102F_DESCRIPTION_PURCHASE.value = document.frm.A_1102F_DESCRIPTION_REFINANCE.value;
document.frm.A_1102F_DESCRIPTION_2ND_NO_TI.value = document.frm.A_1102F_DESCRIPTION_REFINANCE.value;
document.frm.A_1102F_DESCRIPTION_2ND_WITH_TI.value = document.frm.A_1102F_DESCRIPTION_REFINANCE.value;
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
document.frm.A_1102G_DESCRIPTION_PURCHASE.value = document.frm.A_1102G_DESCRIPTION_REFINANCE.value;
document.frm.A_1102G_DESCRIPTION_2ND_NO_TI.value = document.frm.A_1102G_DESCRIPTION_REFINANCE.value;
document.frm.A_1102G_DESCRIPTION_2ND_WITH_TI.value = document.frm.A_1102G_DESCRIPTION_REFINANCE.value;
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
document.frm.A_1102H_DESCRIPTION_PURCHASE.value = document.frm.A_1102H_DESCRIPTION_REFINANCE.value;
document.frm.A_1102H_DESCRIPTION_2ND_NO_TI.value = document.frm.A_1102H_DESCRIPTION_REFINANCE.value;
document.frm.A_1102H_DESCRIPTION_2ND_WITH_TI.value = document.frm.A_1102H_DESCRIPTION_REFINANCE.value;
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
document.frm.A_1102I_DESCRIPTION_PURCHASE.value = document.frm.A_1102I_DESCRIPTION_REFINANCE.value;
document.frm.A_1102I_DESCRIPTION_2ND_NO_TI.value = document.frm.A_1102I_DESCRIPTION_REFINANCE.value;
document.frm.A_1102I_DESCRIPTION_2ND_WITH_TI.value = document.frm.A_1102I_DESCRIPTION_REFINANCE.value;
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


<CENTER>

<CENTER>

<table width=800 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=799 align=center valign=top>

<table width=799 cellpadding=1 cellspacing=1 border=0 bgcolor=white>

	<tr>
		<td width=799 align=center valign=top bgcolor=e2e2e2>
			<FONT SIZE=2 color=black face=arial>

<table width=798 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

	<tr>
		<td width=798 align=center valign=top bgcolor=white>
			<font size=2 color=blue face=arial><B>MODIFY Line Costs for Mortgage Client</B>
		</td>
	</tr>
<CFOUTPUT>
	<tr>
		<td width=798 align=center valign=top bgcolor=e3e3e3>
			<font size=3 color=blue face=arial>
			Client - <B>#read_company.company#</B>
		</td>
	</tr>

	<tr>
		<td width=798 align=center valign=top bgcolor=e3e3e3>

			<table width=797 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

				<tr>
					<td width=790 colspan=4 align=left valign=top bgcolor=e1e1e1>
						<A href="./client_modify_display.cfm?uid=#URL.uid#&al=#URL.al#&company_id=#company_id#"><img src="./images/button_return.gif" border=0></A>
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

		<cfif url.add_counties eq 1 or find_counties.recordcount neq 0>

		<font size=1 color=blue face=verdana>
			Below are listed the fees for the current State (<cfoutput>#url.A_ST_LIST_2#</cfoutput>). Select the counties this fee-set will apply to (Ctrl+click to select multiple counties) and edit the fees as needed, then click the "MODIFY" button. Click the "RETURN" button to cancel.<br>
<CFQUERY datasource="#request.dsn#" NAME="get_counties">
			SELECT distinct county
			FROM zip_info
			WHERE state = '#url.A_ST_LIST_2#'
</CFQUERY>
<cfif get_counties.recordcount GT 10>
<cfset show_count = 10>
<cfelse>
<cfset show_count = get_counties.recordcount>
</cfif><br>
<strong>COUNTIES this fee-set will apply to:</strong><BR>
(Ctrl+click to select multiple counties)<br>

<select name="counties" multiple size="<cfoutput>#show_count#</cfoutput>" style="width:200px;">
<cfoutput query="get_counties">
<option value="#get_counties.county#" <cfif ListContainsNoCase(county_names, get_counties.county, ",")>selected</cfif>>#get_counties.county#</option>
</cfoutput>
</select>
		<cfelse>
		<font size=1 color=blue face=verdana>
			In the fields below, enter the cost value associated with
			each of the line items.  If you need help with what text is
			associated with each line item, mouse over the image next to
			it and the text will appear.<br>

		</cfif>
			<br>
			<font size=1 color=red face=verdana><br>

			Do not enter <B>$</B> in any of the fields below.
			<p>
		</td>


		<td width=380 colspan=4 align=left valign=top bgcolor=e6e6e6>

		<cfif url.add_cities eq 1 or find_cities.recordcount neq 0>
		<font size=1 color=blue face=verdana>
			Below are listed the fees for the current State (<cfoutput>#url.A_ST_LIST_2#</cfoutput>). Select the cities this fee-set will apply to (Ctrl+click to select multiple cities) and edit the fees as needed, then click the "MODIFY" button. Click the "RETURN" button to cancel.<br>
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
<strong>CITIES this fee-set will apply to:</strong><BR>
(Ctrl+click to select multiple cities)<br>

<select name="cities" multiple size="<cfoutput>#show_count#</cfoutput>" style="width:200px;">
<cfoutput query="get_cities">
<option value="#get_cities.city#" <cfif ListContainsNoCase(city_names, get_cities.city, ",")>selected</cfif>>#get_cities.city#</option>
</cfoutput>
</select>
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

		<td width=600 align=center valign=top bgcolor=e6e6e6>

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
<td class="bsilver">801. <input type="text" value="#get_fees.A_0801_DESCRIPTION_REFINANCE#" class="textnormal" name="A_0801_DESCRIPTION_REFINANCE" onFocus="this.blur();" style="width:381;" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0801_AMOUNT_REFINANCE#" class="smallnormal" name="A_0801_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_801_amount(); unfocus_this(this, '', 'small');" /></td>
</tr>
<tr>
<tr>
<td class="bsilver">802. <input type="text" value="#get_fees.A_0802_DESCRIPTION_REFINANCE#" class="textnormal" name="A_0802_DESCRIPTION_REFINANCE" onFocus="this.blur();"  style="width:381;"  /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0802_AMOUNT_REFINANCE#" class="smallnormal" name="A_0802_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_802_amount(); unfocus_this(this, '', 'small');" /></td>
</tr>
<tr>
<td class="bsilver">804. <input type="text" value="#get_fees.A_0804_DESCRIPTION_REFINANCE#" class="textnormal" name="A_0804_DESCRIPTION_REFINANCE" onFocus="focus_this(this, 'textnormal');"  onBlur="a_804_desc();"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_0804_PAYTO_REFINANCE#" class="textnormal" name="A_0804_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_804_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0804_AMOUNT_REFINANCE#" class="smallnormal" name="A_0804_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_804_amount(); unfocus_this(this, '', 'small');" /></td>
</tr>
<tr>
<td class="bsilver">805. <input type="text" value="#get_fees.A_0805_DESCRIPTION_REFINANCE#" class="textnormal" name="A_0805_DESCRIPTION_REFINANCE" onFocus="focus_this(this, 'textnormal');"  onBlur="a_805_desc();"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_0805_PAYTO_REFINANCE#" class="textnormal" name="A_0805_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_805_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0805_AMOUNT_REFINANCE#" class="smallnormal" name="A_0805_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_805_amount(); unfocus_this(this, '', 'small');" /></td>
</tr>
<tr>
<td class="bsilver">806. <input type="text" value="#get_fees.A_0806_DESCRIPTION_REFINANCE#" class="textnormal" name="A_0806_DESCRIPTION_REFINANCE" onFocus="focus_this(this, 'textnormal');" onBlur="a_806_desc();" /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_0806_PAYTO_REFINANCE#" class="textnormal" name="A_0806_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_806_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0806_AMOUNT_REFINANCE#" class="smallnormal" name="A_0806_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_806_amount(); unfocus_this(this, '', 'small');" /></td>
</tr>

<tr>
<td class="bsilver">807. <input type="text" value="#get_fees.A_0807_DESCRIPTION_REFINANCE#" class="textnormal" name="A_0807_DESCRIPTION_REFINANCE" onFocus="focus_this(this, 'textnormal');"  onBlur="a_807_desc();" /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_0807_PAYTO_REFINANCE#" class="textnormal" name="A_0807_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_807_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0807_AMOUNT_REFINANCE#" class="smallnormal" name="A_0807_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_807_amount(); unfocus_this(this, '', 'small');" /></td>
</tr>
<tr>
<td class="bsilver">808. <input type="text" value="#get_fees.A_0808_DESCRIPTION_REFINANCE#" class="textnormal" name="A_0808_DESCRIPTION_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_808_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_0808_PAYTO_REFINANCE#" class="textnormal" name="A_0808_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_808_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0808_AMOUNT_REFINANCE#" class="smallnormal" name="A_0808_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_808_amount(); unfocus_this(this, '', 'small');" /></td>
</tr>
<tr>
<td class="bsilver">809. <input type="text" value="#get_fees.A_0809_DESCRIPTION_REFINANCE#" class="textnormal" name="A_0809_DESCRIPTION_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_809_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_0809_PAYTO_REFINANCE#" class="textnormal" name="A_0809_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_809_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0809_AMOUNT_REFINANCE#" class="smallnormal" name="A_0809_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_809_amount(); unfocus_this(this, '', 'small');" /></td>
</tr>
<tr>
<td class="bsilver">810. <input type="text" value="#get_fees.A_0810_DESCRIPTION_REFINANCE#" class="textnormal" name="A_0810_DESCRIPTION_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_810_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_0810_PAYTO_REFINANCE#" class="textnormal" name="A_0810_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_810_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0810_AMOUNT_REFINANCE#" class="smallnormal" name="A_0810_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_810_amount(); unfocus_this(this, '', 'small');" /></td>
</tr>
<tr>
<td class="bsilver">811. <input type="text" value="#get_fees.A_0811_DESCRIPTION_REFINANCE#" class="textnormal" name="A_0811_DESCRIPTION_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_811_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_0811_PAYTO_REFINANCE#" class="textnormal" name="A_0811_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_811_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0811_AMOUNT_REFINANCE#" class="smallnormal" name="A_0811_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_811_amount(); unfocus_this(this, '', 'small');" /></td>
</tr>
<tr>
<td class="bsilver">812. <input type="text" value="#get_fees.A_0812_DESCRIPTION_REFINANCE#" class="textnormal" name="A_0812_DESCRIPTION_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_812_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_0812_PAYTO_REFINANCE#" class="textnormal" name="A_0812_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_812_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0812_AMOUNT_REFINANCE#" class="smallnormal" name="A_0812_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_812_amount(); unfocus_this(this, '', 'small');" /></td>
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
<td class="bordered"><input type="text"  value="#get_fees.A_1101_AMOUNT_REFINANCE#" class="smallnormal" name="A_1101_AMOUNT_REFINANCE" onFocus="blur();" onBlur="a_1101_amount(); unfocus_this(this, '', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Itemized 1101 Charges</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_01_REFINANCE#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_01_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_01_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_01_REFINANCE#" class="textnormal" name="A_1101_ITEM_AMOUNT_01_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_01_amount();  roll_up_1101_refinance(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_01_REFINANCE" value="1" onClick="a_1101_01_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_01_REFINANCE eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_02_REFINANCE#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_02_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_02_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_02_REFINANCE#" class="textnormal" name="A_1101_ITEM_AMOUNT_02_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_02_amount(); roll_up_1101_refinance(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_02_REFINANCE" value="1" onClick="a_1101_02_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_02_REFINANCE eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_03_REFINANCE#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_03_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_03_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_03_REFINANCE#" class="textnormal" name="A_1101_ITEM_AMOUNT_03_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_03_amount(); roll_up_1101_refinance(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_03_REFINANCE" value="1" onClick="a_1101_03_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_03_REFINANCE eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_04_REFINANCE#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_04_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_04_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_04_REFINANCE#" class="textnormal" name="A_1101_ITEM_AMOUNT_04_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_04_amount(); roll_up_1101_refinance(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_04_REFINANCE" value="1" onClick="a_1101_04_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_04_REFINANCE eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_05_REFINANCE#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_05_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_05_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_05_REFINANCE#" class="textnormal" name="A_1101_ITEM_AMOUNT_05_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_05_amount(); roll_up_1101_refinance(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_05_REFINANCE" value="1" onClick="a_1101_05_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_05_REFINANCE eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_06_REFINANCE#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_06_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_06_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_06_REFINANCE#" class="textnormal" name="A_1101_ITEM_AMOUNT_06_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_06_amount(); roll_up_1101_refinance(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_06_REFINANCE" value="1" onClick="a_1101_06_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_06_REFINANCE eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_07_REFINANCE#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_07_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_07_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_07_REFINANCE#" class="textnormal" name="A_1101_ITEM_AMOUNT_07_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_07_amount(); roll_up_1101_refinance(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_07_REFINANCE" value="1" onClick="a_1101_07_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_07_REFINANCE eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_08_REFINANCE#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_08_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_08_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_08_REFINANCE#" class="textnormal" name="A_1101_ITEM_AMOUNT_08_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_08_amount(); roll_up_1101_refinance(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_08_REFINANCE" value="1" onClick="a_1101_08_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_08_REFINANCE eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_09_REFINANCE#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_09_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_09_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_09_REFINANCE#" class="textnormal" name="A_1101_ITEM_AMOUNT_09_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_09_amount(); roll_up_1101_refinance(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_09_REFINANCE" value="1" onClick="a_1101_09_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_09_REFINANCE eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_10_REFINANCE#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_10_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_10_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_10_REFINANCE#" class="textnormal" name="A_1101_ITEM_AMOUNT_10_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_10_amount(); roll_up_1101_refinance(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_10_REFINANCE" value="1" onClick="a_1101_10_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_10_REFINANCE eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_11_REFINANCE#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_11_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_11_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_11_REFINANCE#" class="textnormal" name="A_1101_ITEM_AMOUNT_11_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_11_amount(); roll_up_1101_refinance(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_11_REFINANCE" value="1" onClick="a_1101_11_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_11_REFINANCE eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_12_REFINANCE#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_12_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_12_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_12_REFINANCE#" class="textnormal" name="A_1101_ITEM_AMOUNT_12_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_12_amount(); roll_up_1101_refinance(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_12_REFINANCE" value="1" onClick="a_1101_12_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_12_REFINANCE eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_13_REFINANCE#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_13_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_13_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_13_REFINANCE#" class="textnormal" name="A_1101_ITEM_AMOUNT_13_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_13_amount(); roll_up_1101_refinance(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_13_REFINANCE" value="1" onClick="a_1101_13_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_13_REFINANCE eq 1>checked </cfif> />
</td>
</tr>

<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_14_REFINANCE#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_14_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_14_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_14_REFINANCE#" class="textnormal" name="A_1101_ITEM_AMOUNT_14_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_14_amount(); roll_up_1101_refinance(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_14_REFINANCE" value="1" onClick="a_1101_14_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_14_REFINANCE eq 1>checked </cfif> />
</td>
</tr>

<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_15_REFINANCE#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_15_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_15_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_15_REFINANCE#" class="textnormal" name="A_1101_ITEM_AMOUNT_15_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_15_amount(); roll_up_1101_refinance(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_15_REFINANCE" value="1" onClick="a_1101_15_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_15_REFINANCE eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_16_REFINANCE#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_16_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_16_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_16_REFINANCE#" class="textnormal" name="A_1101_ITEM_AMOUNT_16_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_16_amount(); roll_up_1101_refinance(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_16_REFINANCE" value="1" onClick="a_1101_16_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_16_REFINANCE eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_17_REFINANCE#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_17_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_17_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_17_REFINANCE#" class="textnormal" name="A_1101_ITEM_AMOUNT_17_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_17_amount(); roll_up_1101_refinance(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_17_REFINANCE" value="1" onClick="a_1101_17_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_17_REFINANCE eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_18_REFINANCE#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_18_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_18_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_18_REFINANCE#" class="textnormal" name="A_1101_ITEM_AMOUNT_18_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_18_amount(); roll_up_1101_refinance(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_18_REFINANCE" value="1" onClick="a_1101_18_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_18_REFINANCE eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_19_REFINANCE#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_19_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_19_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_19_REFINANCE#" class="textnormal" name="A_1101_ITEM_AMOUNT_19_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_19_amount(); roll_up_1101_refinance(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_19_REFINANCE" value="1" onClick="a_1101_19_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_19_REFINANCE eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_20_REFINANCE#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_20_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_20_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_20_REFINANCE#" class="textnormal" name="A_1101_ITEM_AMOUNT_20_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1101_20_amount(); roll_up_1101_refinance(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_20_REFINANCE" value="1" onClick="a_1101_20_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_20_REFINANCE eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">1102. <input type="text" value="#get_fees.A_1102_DESCRIPTION_REFINANCE#" class="textnormal" name="A_1102_DESCRIPTION_REFINANCE"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_1102_PAYTO_REFINANCE#" class="textnormal" name="A_1102_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_1102_AMOUNT_REFINANCE#" class="smallnormal" name="A_1102_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102_amount(); unfocus_this(this, '', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr><td class="bsilver">1102A. <input type="text" value="#get_fees_b.A_1102A_DESCRIPTION_REFINANCE#" class="textnormal" name="A_1102A_DESCRIPTION_REFINANCE"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1102A_PAYTO_REFINANCE#" class="textnormal" name="A_1102A_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102A_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td><td class="bordered"><input type="text"  value="#get_fees_b.A_1102A_AMOUNT_REFINANCE#" class="smallnormal" name="A_1102A_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102A_amount(); unfocus_this(this, '', 'small');" /></td><td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102B. <input type="text" value="#get_fees_b.A_1102B_DESCRIPTION_REFINANCE#" class="textnormal" name="A_1102B_DESCRIPTION_REFINANCE"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1102B_PAYTO_REFINANCE#" class="textnormal" name="A_1102B_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102B_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td><td class="bordered"><input type="text"  value="#get_fees_b.A_1102B_AMOUNT_REFINANCE#" class="smallnormal" name="A_1102B_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102B_amount(); unfocus_this(this, '', 'small');" /></td><td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102C. <input type="text" value="#get_fees_b.A_1102C_DESCRIPTION_REFINANCE#" class="textnormal" name="A_1102C_DESCRIPTION_REFINANCE"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1102C_PAYTO_REFINANCE#" class="textnormal" name="A_1102C_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102C_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td><td class="bordered"><input type="text"  value="#get_fees_b.A_1102C_AMOUNT_REFINANCE#" class="smallnormal" name="A_1102C_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102C_amount(); unfocus_this(this, '', 'small');" /></td><td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102D. <input type="text" value="#get_fees_b.A_1102D_DESCRIPTION_REFINANCE#" class="textnormal" name="A_1102D_DESCRIPTION_REFINANCE"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1102D_PAYTO_REFINANCE#" class="textnormal" name="A_1102D_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102D_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td><td class="bordered"><input type="text"  value="#get_fees_b.A_1102D_AMOUNT_REFINANCE#" class="smallnormal" name="A_1102D_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102D_amount(); unfocus_this(this, '', 'small');" /></td><td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102E. <input type="text" value="#get_fees_b.A_1102E_DESCRIPTION_REFINANCE#" class="textnormal" name="A_1102E_DESCRIPTION_REFINANCE"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1102E_PAYTO_REFINANCE#" class="textnormal" name="A_1102E_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102E_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td><td class="bordered"><input type="text"  value="#get_fees_b.A_1102E_AMOUNT_REFINANCE#" class="smallnormal" name="A_1102E_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102E_amount(); unfocus_this(this, '', 'small');" /></td><td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102F. <input type="text" value="#get_fees_b.A_1102F_DESCRIPTION_REFINANCE#" class="textnormal" name="A_1102F_DESCRIPTION_REFINANCE"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1102F_PAYTO_REFINANCE#" class="textnormal" name="A_1102F_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102F_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td><td class="bordered"><input type="text"  value="#get_fees_b.A_1102F_AMOUNT_REFINANCE#" class="smallnormal" name="A_1102F_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102F_amount(); unfocus_this(this, '', 'small');" /></td><td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102G. <input type="text" value="#get_fees_b.A_1102G_DESCRIPTION_REFINANCE#" class="textnormal" name="A_1102G_DESCRIPTION_REFINANCE"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1102G_PAYTO_REFINANCE#" class="textnormal" name="A_1102G_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102G_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td><td class="bordered"><input type="text"  value="#get_fees_b.A_1102G_AMOUNT_REFINANCE#" class="smallnormal" name="A_1102G_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102G_amount(); unfocus_this(this, '', 'small');" /></td><td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102H. <input type="text" value="#get_fees_b.A_1102H_DESCRIPTION_REFINANCE#" class="textnormal" name="A_1102H_DESCRIPTION_REFINANCE"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1102H_PAYTO_REFINANCE#" class="textnormal" name="A_1102H_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102H_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td><td class="bordered"><input type="text"  value="#get_fees_b.A_1102H_AMOUNT_REFINANCE#" class="smallnormal" name="A_1102H_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102H_amount(); unfocus_this(this, '', 'small');" /></td><td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102I. <input type="text" value="#get_fees_b.A_1102I_DESCRIPTION_REFINANCE#" class="textnormal" name="A_1102I_DESCRIPTION_REFINANCE"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1102I_PAYTO_REFINANCE#" class="textnormal" name="A_1102I_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102I_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td><td class="bordered"><input type="text"  value="#get_fees_b.A_1102I_AMOUNT_REFINANCE#" class="smallnormal" name="A_1102I_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102I_amount(); unfocus_this(this, '', 'small');" /></td><td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1109. <input type="text" value="#get_fees.A_1109_DESCRIPTION_REFINANCE#" class="textnormal" name="A_1109_DESCRIPTION_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1109_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_1109_PAYTO_REFINANCE#" class="textnormal" name="A_1109_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1109_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_1109_AMOUNT_REFINANCE#" class="smallnormal" name="A_1109_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1109_amount(); unfocus_this(this, '', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1109_OUTSIDE_REFINANCE" value="1" onClick="a_1109_outside();" <cfif get_fees.A_1109_OUTSIDE_REFINANCE eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1110. <input type="text" value="#get_fees.A_1110_DESCRIPTION_REFINANCE#" class="textnormal" name="A_1110_DESCRIPTION_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1110_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_1110_PAYTO_REFINANCE#" class="textnormal" name="A_1110_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1110_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_1110_AMOUNT_REFINANCE#" class="smallnormal" name="A_1110_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1110_amount(); unfocus_this(this, '', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1110_OUTSIDE_REFINANCE" value="1" onClick="a_1110_outside();" <cfif get_fees.A_1110_OUTSIDE_REFINANCE eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1111. <input type="text" value="#get_fees.A_1111_DESCRIPTION_REFINANCE#" class="textnormal" name="A_1111_DESCRIPTION_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1111_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_1111_PAYTO_REFINANCE#" class="textnormal" name="A_1111_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1111_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_1111_AMOUNT_REFINANCE#" class="smallnormal" name="A_1111_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1111_amount(); unfocus_this(this, '', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1111_OUTSIDE_REFINANCE" value="1" onClick="a_1111_outside();" <cfif get_fees.A_1111_OUTSIDE_REFINANCE eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1112. <input type="text" value="#get_fees.A_1112_DESCRIPTION_REFINANCE#" class="textnormal" name="A_1112_DESCRIPTION_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1112_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_1112_PAYTO_REFINANCE#" class="textnormal" name="A_1112_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1112_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_1112_AMOUNT_REFINANCE#" class="smallnormal" name="A_1112_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1112_amount(); unfocus_this(this, '', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1112_OUTSIDE_REFINANCE" value="1" onClick="a_1112_outside();" <cfif get_fees.A_1112_OUTSIDE_REFINANCE eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1113. <input type="text" value="#get_fees.A_1113_DESCRIPTION_REFINANCE#" class="textnormal" name="A_1113_DESCRIPTION_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1113_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_1113_PAYTO_REFINANCE#" class="textnormal" name="A_1113_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1113_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_1113_AMOUNT_REFINANCE#" class="smallnormal" name="A_1113_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1113_amount(); unfocus_this(this, '', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1113_OUTSIDE_REFINANCE" value="1" onClick="a_1113_outside();" <cfif get_fees.A_1113_OUTSIDE_REFINANCE eq 1>checked</cfif> /></td></tr>
</table>
<!-- 1300 -->
<table width="650" summary="Type of Loan" border="1" cellspacing="0">
<tr>
<td class="bdarksilver_head">1300. Additional Settlement Charges (for Non-Title/Settlement Charges)</td>
<td class="bdarksilver_head" align="right">Amount</td>
<td class="bdarksilver_head" align="right">Outside</td>

</tr>
<!--- <tr>
<td class="bsilver">1301. <input type="text" value="#get_fees_b.A_1301_DESCRIPTION_REFINANCE#" class="textnormal" name="A_1301_DESCRIPTION_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1301_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1301_PAYTO_REFINANCE#" class="textnormal" name="A_1301_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1301_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b.A_1301_AMOUNT_REFINANCE#" class="smallnormal" name="A_1301_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1301_amount(); unfocus_this(this, '', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1301_OUTSIDE_REFINANCE" value="1" onClick="a_1301_outside();" <cfif get_fees_b.A_1301_OUTSIDE_REFINANCE eq 1>checked</cfif> /></td></tr>
 ---><tr>
<td class="bsilver">1302. <input type="text" value="#get_fees_b.A_1302_DESCRIPTION_REFINANCE#" class="textnormal" name="A_1302_DESCRIPTION_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1302_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1302_PAYTO_REFINANCE#" class="textnormal" name="A_1302_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1302_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b.A_1302_AMOUNT_REFINANCE#" class="smallnormal" name="A_1302_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1302_amount(); unfocus_this(this, '', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1302_OUTSIDE_REFINANCE" value="1" onClick="a_1302_outside();" <cfif get_fees_b.A_1302_OUTSIDE_REFINANCE eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1303. <input type="text" value="#get_fees_b.A_1303_DESCRIPTION_REFINANCE#" class="textnormal" name="A_1303_DESCRIPTION_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1303_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1303_PAYTO_REFINANCE#" class="textnormal" name="A_1303_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1303_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b.A_1303_AMOUNT_REFINANCE#" class="smallnormal" name="A_1303_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1303_amount(); unfocus_this(this, '', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1303_OUTSIDE_REFINANCE" value="1" onClick="a_1303_outside();" <cfif get_fees_b.A_1303_OUTSIDE_REFINANCE eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1304. <input type="text" value="#get_fees_b.A_1304_DESCRIPTION_REFINANCE#" class="textnormal" name="A_1304_DESCRIPTION_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1304_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1304_PAYTO_REFINANCE#" class="textnormal" name="A_1304_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1304_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b.A_1304_AMOUNT_REFINANCE#" class="smallnormal" name="A_1304_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1304_amount(); unfocus_this(this, '', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1304_OUTSIDE_REFINANCE" value="1" onClick="a_1304_outside();" <cfif get_fees_b.A_1304_OUTSIDE_REFINANCE eq 1>checked</cfif> /></td></tr>

<tr>
<td class="bsilver">1305. <input type="text" value="#get_fees_b.A_1305_DESCRIPTION_REFINANCE#" class="textnormal" name="A_1305_DESCRIPTION_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1305_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1305_PAYTO_REFINANCE#" class="textnormal" name="A_1305_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1305_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b.A_1305_AMOUNT_REFINANCE#" class="smallnormal" name="A_1305_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1305_amount(); unfocus_this(this, '', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1305_OUTSIDE_REFINANCE" value="1" onClick="a_1305_outside();" <cfif get_fees_b.A_1305_OUTSIDE_REFINANCE eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1306. <input type="text" value="#get_fees_b.A_1306_DESCRIPTION_REFINANCE#" class="textnormal" name="A_1306_DESCRIPTION_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1306_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1306_PAYTO_REFINANCE#" class="textnormal" name="A_1306_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1306_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b.A_1306_AMOUNT_REFINANCE#" class="smallnormal" name="A_1306_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1306_amount(); unfocus_this(this, '', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1306_OUTSIDE_REFINANCE" value="1" onClick="a_1306_outside();" <cfif get_fees_b.A_1306_OUTSIDE_REFINANCE eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1307. <input type="text" value="#get_fees_b.A_1307_DESCRIPTION_REFINANCE#" class="textnormal" name="A_1307_DESCRIPTION_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1307_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1307_PAYTO_REFINANCE#" class="textnormal" name="A_1307_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1307_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b.A_1307_AMOUNT_REFINANCE#" class="smallnormal" name="A_1307_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1307_amount(); unfocus_this(this, '', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1307_OUTSIDE_REFINANCE" value="1" onClick="a_1307_outside();" <cfif get_fees_b.A_1307_OUTSIDE_REFINANCE eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1308. <input type="text" value="#get_fees_b.A_1308_DESCRIPTION_REFINANCE#" class="textnormal" name="A_1308_DESCRIPTION_REFINANCE"   onFocus="focus_this(this, 'textnormal');" onBlur="a_1308_desc(); unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1308_PAYTO_REFINANCE#" class="textnormal" name="A_1308_PAYTO_REFINANCE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1308_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b.A_1308_AMOUNT_REFINANCE#" class="smallnormal" name="A_1308_AMOUNT_REFINANCE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1308_amount(); unfocus_this(this, '', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1308_OUTSIDE_REFINANCE" value="1" onClick="a_1308_outside();" <cfif get_fees_b.A_1308_OUTSIDE_REFINANCE eq 1>checked</cfif> /></td></tr>
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
<td class="bsilver">801. <input type="text" value="#get_fees.A_0801_DESCRIPTION_PURCHASE#" class="textnormal" name="A_0801_DESCRIPTION_PURCHASE" onFocus="this.blur();" style="width:381;" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0801_AMOUNT_PURCHASE#" class="smallnormal" name="A_0801_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<tr>
<td class="bsilver">802. <input type="text" value="#get_fees.A_0802_DESCRIPTION_PURCHASE#" class="textnormal" name="A_0802_DESCRIPTION_PURCHASE" onFocus="this.blur();"  style="width:381;"  /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0802_AMOUNT_PURCHASE#" class="smallnormal" name="A_0802_AMOUNT_PURCHASE"  onFocus="focus_this(this, 'smallnormal');"  /></td>
</tr>
<tr>
<td class="bsilver">804. <input type="text" value="#get_fees.A_0804_DESCRIPTION_PURCHASE#" class="textnormal" name="A_0804_DESCRIPTION_PURCHASE" onFocus="this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_0804_PAYTO_PURCHASE#" class="textnormal" name="A_0804_PAYTO_PURCHASE"   onFocus="focus_this(this, 'textnormal');"  /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0804_AMOUNT_PURCHASE#" class="smallnormal" name="A_0804_AMOUNT_PURCHASE"   onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">805. <input type="text" value="#get_fees.A_0805_DESCRIPTION_PURCHASE#" class="textnormal" name="A_0805_DESCRIPTION_PURCHASE" onFocus="this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_0805_PAYTO_PURCHASE#" class="textnormal" name="A_0805_PAYTO_PURCHASE"    onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0805_AMOUNT_PURCHASE#" class="smallnormal" name="A_0805_AMOUNT_PURCHASE"  onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">806. <input type="text" value="#get_fees.A_0806_DESCRIPTION_PURCHASE#" class="textnormal" name="A_0806_DESCRIPTION_PURCHASE" onFocus="this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_0806_PAYTO_PURCHASE#" class="textnormal" name="A_0806_PAYTO_PURCHASE"    onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0806_AMOUNT_PURCHASE#" class="smallnormal" name="A_0806_AMOUNT_PURCHASE"   onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>

<tr>
<td class="bsilver">807. <input type="text" value="#get_fees.A_0807_DESCRIPTION_PURCHASE#" class="textnormal" name="A_0807_DESCRIPTION_PURCHASE" onFocus="this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_0807_PAYTO_PURCHASE#" class="textnormal" name="A_0807_PAYTO_PURCHASE"   onFocus="focus_this(this, 'textnormal');"  /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0807_AMOUNT_PURCHASE#" class="smallnormal" name="A_0807_AMOUNT_PURCHASE"  onFocus="focus_this(this, 'smallnormal');"  /></td>
</tr>
<tr>
<td class="bsilver">808. <input type="text" value="#get_fees.A_0808_DESCRIPTION_PURCHASE#" class="textnormal" name="A_0808_DESCRIPTION_PURCHASE"     onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_0808_PAYTO_PURCHASE#" class="textnormal" name="A_0808_PAYTO_PURCHASE"    onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0808_AMOUNT_PURCHASE#" class="smallnormal" name="A_0808_AMOUNT_PURCHASE"   onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">809. <input type="text" value="#get_fees.A_0809_DESCRIPTION_PURCHASE#" class="textnormal" name="A_0809_DESCRIPTION_PURCHASE"    onFocus="focus_this(this, 'textnormal');"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_0809_PAYTO_PURCHASE#" class="textnormal" name="A_0809_PAYTO_PURCHASE"   onFocus="focus_this(this, 'textnormal');"  /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0809_AMOUNT_PURCHASE#" class="smallnormal" name="A_0809_AMOUNT_PURCHASE"  onFocus="focus_this(this, 'smallnormal');"  /></td>
</tr>
<tr>
<td class="bsilver">810. <input type="text" value="#get_fees.A_0810_DESCRIPTION_PURCHASE#" class="textnormal" name="A_0810_DESCRIPTION_PURCHASE"    onFocus="focus_this(this, 'textnormal');"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_0810_PAYTO_PURCHASE#" class="textnormal" name="A_0810_PAYTO_PURCHASE"    onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0810_AMOUNT_PURCHASE#" class="smallnormal" name="A_0810_AMOUNT_PURCHASE"   onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">811. <input type="text" value="#get_fees.A_0811_DESCRIPTION_PURCHASE#" class="textnormal" name="A_0811_DESCRIPTION_PURCHASE"    onFocus="focus_this(this, 'textnormal');"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_0811_PAYTO_PURCHASE#" class="textnormal" name="A_0811_PAYTO_PURCHASE"   onFocus="focus_this(this, 'textnormal');"  /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0811_AMOUNT_PURCHASE#" class="smallnormal" name="A_0811_AMOUNT_PURCHASE"  onFocus="focus_this(this, 'smallnormal');"  /></td>
</tr>
<tr>
<td class="bsilver">812. <input type="text" value="#get_fees.A_0812_DESCRIPTION_PURCHASE#" class="textnormal" name="A_0812_DESCRIPTION_PURCHASE"    onFocus="focus_this(this, 'textnormal');"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_0812_PAYTO_PURCHASE#" class="textnormal" name="A_0812_PAYTO_PURCHASE" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0812_AMOUNT_PURCHASE#" class="smallnormal" name="A_0812_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" /></td>
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
<td class="bordered"><input type="text"  value="#get_fees.A_1101_AMOUNT_PURCHASE#" class="smallnormal" name="A_1101_AMOUNT_PURCHASE" onFocus="blur();" onBlur="a_1101_amount(); unfocus_this(this, '', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Itemized 1101 Charges</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_01_PURCHASE#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_01_PURCHASE"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_01_PURCHASE#" class="textnormal" name="A_1101_ITEM_AMOUNT_01_PURCHASE"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_01_PURCHASE" value="1"  <cfif find_itemized.A_1101_ITEM_SELECTABLE_01_PURCHASE eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_02_PURCHASE#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_02_PURCHASE"   onFocus="focus_this(this, 'textnormal');" onBlur=" unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_02_PURCHASE#" class="textnormal" name="A_1101_ITEM_AMOUNT_02_PURCHASE"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_02_PURCHASE" value="1"  <cfif find_itemized.A_1101_ITEM_SELECTABLE_02_PURCHASE eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_03_PURCHASE#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_03_PURCHASE"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_03_PURCHASE#" class="textnormal" name="A_1101_ITEM_AMOUNT_03_PURCHASE"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_03_PURCHASE" value="1" <cfif find_itemized.A_1101_ITEM_SELECTABLE_03_PURCHASE eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_04_PURCHASE#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_04_PURCHASE"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_04_PURCHASE#" class="textnormal" name="A_1101_ITEM_AMOUNT_04_PURCHASE"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_04_PURCHASE" value="1"  <cfif find_itemized.A_1101_ITEM_SELECTABLE_04_PURCHASE eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_05_PURCHASE#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_05_PURCHASE"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_05_PURCHASE#" class="textnormal" name="A_1101_ITEM_AMOUNT_05_PURCHASE"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_05_PURCHASE" value="1"  <cfif find_itemized.A_1101_ITEM_SELECTABLE_05_PURCHASE eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_06_PURCHASE#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_06_PURCHASE"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_06_PURCHASE#" class="textnormal" name="A_1101_ITEM_AMOUNT_06_PURCHASE"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_06_PURCHASE" value="1"  <cfif find_itemized.A_1101_ITEM_SELECTABLE_06_PURCHASE eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_07_PURCHASE#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_07_PURCHASE"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_07_PURCHASE#" class="textnormal" name="A_1101_ITEM_AMOUNT_07_PURCHASE"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_07_PURCHASE" value="1"  <cfif find_itemized.A_1101_ITEM_SELECTABLE_07_PURCHASE eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_08_PURCHASE#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_08_PURCHASE"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_08_PURCHASE#" class="textnormal" name="A_1101_ITEM_AMOUNT_08_PURCHASE"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_08_PURCHASE" value="1"  <cfif find_itemized.A_1101_ITEM_SELECTABLE_08_PURCHASE eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_09_PURCHASE#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_09_PURCHASE"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_09_PURCHASE#" class="textnormal" name="A_1101_ITEM_AMOUNT_09_PURCHASE"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_09_PURCHASE" value="1"  <cfif find_itemized.A_1101_ITEM_SELECTABLE_09_PURCHASE eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_10_PURCHASE#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_10_PURCHASE"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_10_PURCHASE#" class="textnormal" name="A_1101_ITEM_AMOUNT_10_PURCHASE"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_10_PURCHASE" value="1"  <cfif find_itemized.A_1101_ITEM_SELECTABLE_10_PURCHASE eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_11_PURCHASE#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_11_PURCHASE"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_11_PURCHASE#" class="textnormal" name="A_1101_ITEM_AMOUNT_11_PURCHASE"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_11_PURCHASE" value="1"  <cfif find_itemized.A_1101_ITEM_SELECTABLE_11_PURCHASE eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_12_PURCHASE#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_12_PURCHASE"   onFocus="focus_this(this, 'textnormal');" onBlur=" unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_12_PURCHASE#" class="textnormal" name="A_1101_ITEM_AMOUNT_12_PURCHASE"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_12_PURCHASE" value="1"  <cfif find_itemized.A_1101_ITEM_SELECTABLE_12_PURCHASE eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_13_PURCHASE#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_13_PURCHASE"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_13_PURCHASE#" class="textnormal" name="A_1101_ITEM_AMOUNT_13_PURCHASE"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_13_PURCHASE" value="1"  <cfif find_itemized.A_1101_ITEM_SELECTABLE_13_PURCHASE eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_14_PURCHASE#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_14_PURCHASE"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_14_PURCHASE#" class="textnormal" name="A_1101_ITEM_AMOUNT_14_PURCHASE"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_14_PURCHASE" value="1"  <cfif find_itemized.A_1101_ITEM_SELECTABLE_14_PURCHASE eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_15_PURCHASE#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_15_PURCHASE"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_15_PURCHASE#" class="textnormal" name="A_1101_ITEM_AMOUNT_15_PURCHASE"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_15_PURCHASE" value="1"  <cfif find_itemized.A_1101_ITEM_SELECTABLE_15_PURCHASE eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_16_PURCHASE#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_16_PURCHASE"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_16_PURCHASE#" class="textnormal" name="A_1101_ITEM_AMOUNT_16_PURCHASE"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_16_PURCHASE" value="1"  <cfif find_itemized.A_1101_ITEM_SELECTABLE_16_PURCHASE eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_17_PURCHASE#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_17_PURCHASE"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_17_PURCHASE#" class="textnormal" name="A_1101_ITEM_AMOUNT_17_PURCHASE"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_17_PURCHASE" value="1"  <cfif find_itemized.A_1101_ITEM_SELECTABLE_17_PURCHASE eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_18_PURCHASE#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_18_PURCHASE"   onFocus="focus_this(this, 'textnormal');" onBlur=" unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_18_PURCHASE#" class="textnormal" name="A_1101_ITEM_AMOUNT_18_PURCHASE"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_18_PURCHASE" value="1"  <cfif find_itemized.A_1101_ITEM_SELECTABLE_18_PURCHASE eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_19_PURCHASE#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_19_PURCHASE"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_19_PURCHASE#" class="textnormal" name="A_1101_ITEM_AMOUNT_19_PURCHASE"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_19_PURCHASE" value="1"  <cfif find_itemized.A_1101_ITEM_SELECTABLE_19_PURCHASE eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_20_PURCHASE#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_20_PURCHASE"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_20_PURCHASE#" class="textnormal" name="A_1101_ITEM_AMOUNT_20_PURCHASE"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_20_PURCHASE" value="1"  <cfif find_itemized.A_1101_ITEM_SELECTABLE_20_PURCHASE eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">1102. <input type="text" value="#get_fees.A_1102_DESCRIPTION_PURCHASE#" class="textnormal" name="A_1102_DESCRIPTION_PURCHASE"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_1102_PAYTO_PURCHASE#" class="textnormal" name="A_1102_PAYTO_PURCHASE"  onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_1102_AMOUNT_PURCHASE#" class="smallnormal" name="A_1102_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" onBlur="unfocus_this(this, '', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102A. <input type="text" value="#get_fees_b.A_1102A_DESCRIPTION_PURCHASE#" class="textnormal" name="A_1102A_DESCRIPTION_PURCHASE"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1102A_PAYTO_PURCHASE#" class="textnormal" name="A_1102A_PAYTO_PURCHASE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102A_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td><td class="bordered"><input type="text"  value="#get_fees_b.A_1102A_AMOUNT_PURCHASE#" class="smallnormal" name="A_1102A_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102A_amount(); unfocus_this(this, '', 'small');" /></td><td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102B. <input type="text" value="#get_fees_b.A_1102B_DESCRIPTION_PURCHASE#" class="textnormal" name="A_1102B_DESCRIPTION_PURCHASE"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1102B_PAYTO_PURCHASE#" class="textnormal" name="A_1102B_PAYTO_PURCHASE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102B_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td><td class="bordered"><input type="text"  value="#get_fees_b.A_1102B_AMOUNT_PURCHASE#" class="smallnormal" name="A_1102B_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102B_amount(); unfocus_this(this, '', 'small');" /></td><td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102C. <input type="text" value="#get_fees_b.A_1102C_DESCRIPTION_PURCHASE#" class="textnormal" name="A_1102C_DESCRIPTION_PURCHASE"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1102C_PAYTO_PURCHASE#" class="textnormal" name="A_1102C_PAYTO_PURCHASE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102C_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td><td class="bordered"><input type="text"  value="#get_fees_b.A_1102C_AMOUNT_PURCHASE#" class="smallnormal" name="A_1102C_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102C_amount(); unfocus_this(this, '', 'small');" /></td><td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102D. <input type="text" value="#get_fees_b.A_1102D_DESCRIPTION_PURCHASE#" class="textnormal" name="A_1102D_DESCRIPTION_PURCHASE"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1102D_PAYTO_PURCHASE#" class="textnormal" name="A_1102D_PAYTO_PURCHASE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102D_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td><td class="bordered"><input type="text"  value="#get_fees_b.A_1102D_AMOUNT_PURCHASE#" class="smallnormal" name="A_1102D_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102D_amount(); unfocus_this(this, '', 'small');" /></td><td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102E. <input type="text" value="#get_fees_b.A_1102E_DESCRIPTION_PURCHASE#" class="textnormal" name="A_1102E_DESCRIPTION_PURCHASE"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1102E_PAYTO_PURCHASE#" class="textnormal" name="A_1102E_PAYTO_PURCHASE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102E_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td><td class="bordered"><input type="text"  value="#get_fees_b.A_1102E_AMOUNT_PURCHASE#" class="smallnormal" name="A_1102E_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102E_amount(); unfocus_this(this, '', 'small');" /></td><td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102F. <input type="text" value="#get_fees_b.A_1102F_DESCRIPTION_PURCHASE#" class="textnormal" name="A_1102F_DESCRIPTION_PURCHASE"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1102F_PAYTO_PURCHASE#" class="textnormal" name="A_1102F_PAYTO_PURCHASE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102F_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td><td class="bordered"><input type="text"  value="#get_fees_b.A_1102F_AMOUNT_PURCHASE#" class="smallnormal" name="A_1102F_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102F_amount(); unfocus_this(this, '', 'small');" /></td><td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102G. <input type="text" value="#get_fees_b.A_1102G_DESCRIPTION_PURCHASE#" class="textnormal" name="A_1102G_DESCRIPTION_PURCHASE"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1102G_PAYTO_PURCHASE#" class="textnormal" name="A_1102G_PAYTO_PURCHASE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102G_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td><td class="bordered"><input type="text"  value="#get_fees_b.A_1102G_AMOUNT_PURCHASE#" class="smallnormal" name="A_1102G_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102G_amount(); unfocus_this(this, '', 'small');" /></td><td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102H. <input type="text" value="#get_fees_b.A_1102H_DESCRIPTION_PURCHASE#" class="textnormal" name="A_1102H_DESCRIPTION_PURCHASE"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1102H_PAYTO_PURCHASE#" class="textnormal" name="A_1102H_PAYTO_PURCHASE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102H_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td><td class="bordered"><input type="text"  value="#get_fees_b.A_1102H_AMOUNT_PURCHASE#" class="smallnormal" name="A_1102H_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102H_amount(); unfocus_this(this, '', 'small');" /></td><td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102I. <input type="text" value="#get_fees_b.A_1102I_DESCRIPTION_PURCHASE#" class="textnormal" name="A_1102I_DESCRIPTION_PURCHASE"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1102I_PAYTO_PURCHASE#" class="textnormal" name="A_1102I_PAYTO_PURCHASE"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102I_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td><td class="bordered"><input type="text"  value="#get_fees_b.A_1102I_AMOUNT_PURCHASE#" class="smallnormal" name="A_1102I_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102I_amount(); unfocus_this(this, '', 'small');" /></td><td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1109. <input type="text" value="#get_fees.A_1109_DESCRIPTION_PURCHASE#" class="textnormal" name="A_1109_DESCRIPTION_PURCHASE"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_1109_PAYTO_PURCHASE#" class="textnormal" name="A_1109_PAYTO_PURCHASE"  onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_1109_AMOUNT_PURCHASE#" class="smallnormal" name="A_1109_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" onBlur="unfocus_this(this, '', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1109_OUTSIDE_PURCHASE" value="1"  <cfif get_fees.A_1109_OUTSIDE_PURCHASE eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1110. <input type="text" value="#get_fees.A_1110_DESCRIPTION_PURCHASE#" class="textnormal" name="A_1110_DESCRIPTION_PURCHASE"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_1110_PAYTO_PURCHASE#" class="textnormal" name="A_1110_PAYTO_PURCHASE"  onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_1110_AMOUNT_PURCHASE#" class="smallnormal" name="A_1110_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" onBlur="unfocus_this(this, '', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1110_OUTSIDE_PURCHASE" value="1" <cfif get_fees.A_1110_OUTSIDE_PURCHASE eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1111. <input type="text" value="#get_fees.A_1111_DESCRIPTION_PURCHASE#" class="textnormal" name="A_1111_DESCRIPTION_PURCHASE"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_1111_PAYTO_PURCHASE#" class="textnormal" name="A_1111_PAYTO_PURCHASE"  onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_1111_AMOUNT_PURCHASE#" class="smallnormal" name="A_1111_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" onBlur="unfocus_this(this, '', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1111_OUTSIDE_PURCHASE" value="1"  <cfif get_fees.A_1111_OUTSIDE_PURCHASE eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1112. <input type="text" value="#get_fees.A_1112_DESCRIPTION_PURCHASE#" class="textnormal" name="A_1112_DESCRIPTION_PURCHASE"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_1112_PAYTO_PURCHASE#" class="textnormal" name="A_1112_PAYTO_PURCHASE"  onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_1112_AMOUNT_PURCHASE#" class="smallnormal" name="A_1112_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" onBlur="unfocus_this(this, '', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1112_OUTSIDE_PURCHASE" value="1" <cfif get_fees.A_1112_OUTSIDE_PURCHASE eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1113. <input type="text" value="#get_fees.A_1113_DESCRIPTION_PURCHASE#" class="textnormal" name="A_1113_DESCRIPTION_PURCHASE"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_1113_PAYTO_PURCHASE#" class="textnormal" name="A_1113_PAYTO_PURCHASE"  onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_1113_AMOUNT_PURCHASE#" class="smallnormal" name="A_1113_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" onBlur="unfocus_this(this, '', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1113_OUTSIDE_PURCHASE" value="1" <cfif get_fees.A_1113_OUTSIDE_PURCHASE eq 1>checked</cfif> /></td></tr>
</table>
<!-- 1300 -->
<table width="650" summary="Type of Loan" border="1" cellspacing="0">
<tr>
<td class="bdarksilver_head">1300. Additional Settlement Charges (for Non-Title/Settlement Charges)</td>
<td class="bdarksilver_head" align="right">Amount</td>
<td class="bdarksilver_head" align="right">Outside</td>

</tr>
<!--- <tr>
<td class="bsilver">1301. <input type="text" value="#get_fees_b.A_1301_DESCRIPTION_PURCHASE#" class="textnormal" name="A_1301_DESCRIPTION_PURCHASE" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1301_PAYTO_PURCHASE#" class="textnormal" name="A_1301_PAYTO_PURCHASE" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b.A_1301_AMOUNT_PURCHASE#" class="smallnormal" name="A_1301_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1301_OUTSIDE_PURCHASE" value="1" <cfif get_fees_b.A_1301_OUTSIDE_PURCHASE eq 1>checked</cfif>  /></td></tr>
 ---><tr>
<td class="bsilver">1302. <input type="text" value="#get_fees_b.A_1302_DESCRIPTION_PURCHASE#" class="textnormal" name="A_1302_DESCRIPTION_PURCHASE" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1302_PAYTO_PURCHASE#" class="textnormal" name="A_1302_PAYTO_PURCHASE" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b.A_1302_AMOUNT_PURCHASE#" class="smallnormal" name="A_1302_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1302_OUTSIDE_PURCHASE" value="1" <cfif get_fees_b.A_1302_OUTSIDE_PURCHASE eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1303. <input type="text" value="#get_fees_b.A_1303_DESCRIPTION_PURCHASE#" class="textnormal" name="A_1303_DESCRIPTION_PURCHASE" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1303_PAYTO_PURCHASE#" class="textnormal" name="A_1303_PAYTO_PURCHASE" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b.A_1303_AMOUNT_PURCHASE#" class="smallnormal" name="A_1303_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1303_OUTSIDE_PURCHASE" value="1" <cfif get_fees_b.A_1303_OUTSIDE_PURCHASE eq 1>checked</cfif>  /></td></tr>
<tr>
<td class="bsilver">1304. <input type="text" value="#get_fees_b.A_1304_DESCRIPTION_PURCHASE#" class="textnormal" name="A_1304_DESCRIPTION_PURCHASE" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1304_PAYTO_PURCHASE#" class="textnormal" name="A_1304_PAYTO_PURCHASE" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b.A_1304_AMOUNT_PURCHASE#" class="smallnormal" name="A_1304_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1304_OUTSIDE_PURCHASE" value="1" <cfif get_fees_b.A_1304_OUTSIDE_PURCHASE eq 1>checked</cfif>  /></td></tr>

<tr>
<td class="bsilver">1305. <input type="text" value="#get_fees_b.A_1305_DESCRIPTION_PURCHASE#" class="textnormal" name="A_1305_DESCRIPTION_PURCHASE" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1305_PAYTO_PURCHASE#" class="textnormal" name="A_1305_PAYTO_PURCHASE" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b.A_1305_AMOUNT_PURCHASE#" class="smallnormal" name="A_1305_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1305_OUTSIDE_PURCHASE" value="1" <cfif get_fees_b.A_1305_OUTSIDE_PURCHASE eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1306. <input type="text" value="#get_fees_b.A_1306_DESCRIPTION_PURCHASE#" class="textnormal" name="A_1306_DESCRIPTION_PURCHASE" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1306_PAYTO_PURCHASE#" class="textnormal" name="A_1306_PAYTO_PURCHASE" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b.A_1306_AMOUNT_PURCHASE#" class="smallnormal" name="A_1306_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1306_OUTSIDE_PURCHASE" value="1"  <cfif get_fees_b.A_1306_OUTSIDE_PURCHASE eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1307. <input type="text" value="#get_fees_b.A_1307_DESCRIPTION_PURCHASE#" class="textnormal" name="A_1307_DESCRIPTION_PURCHASE" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1307_PAYTO_PURCHASE#" class="textnormal" name="A_1307_PAYTO_PURCHASE" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b.A_1307_AMOUNT_PURCHASE#" class="smallnormal" name="A_1307_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1307_OUTSIDE_PURCHASE" value="1" <cfif get_fees_b.A_1307_OUTSIDE_PURCHASE eq 1>checked</cfif>  /></td></tr>
<tr>
<td class="bsilver">1308. <input type="text" value="#get_fees_b.A_1308_DESCRIPTION_PURCHASE#" class="textnormal" name="A_1308_DESCRIPTION_PURCHASE" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1308_PAYTO_PURCHASE#" class="textnormal" name="A_1308_PAYTO_PURCHASE" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b.A_1308_AMOUNT_PURCHASE#" class="smallnormal" name="A_1308_AMOUNT_PURCHASE" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1308_OUTSIDE_PURCHASE" value="1" <cfif get_fees_b.A_1308_OUTSIDE_PURCHASE eq 1>checked</cfif>  /></td></tr>

</table>
<br>
<br>
<br>
<span class="page_title">2ND MORTGAGE with NO Title Insurance</span><BR>
<!-- 800 -->
<table width="650" summary="Type of Loan" border="1" cellspacing="0">
<tr><td height="4" colspan="6"></td></tr>
<tr>
<td class="bdarksilver_head">800. Items Payable in Connection with Loan</td>
<td class="bdarksilver_head" align="right">Amount</td>
</tr>
<tr>
<td class="bsilver">801. <input type="text" value="#get_fees.A_0801_DESCRIPTION_2ND_NO_TI#" class="textnormal" name="A_0801_DESCRIPTION_2ND_NO_TI" onFocus="this.blur();" style="width:381;" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0801_AMOUNT_2ND_NO_TI#" class="smallnormal" name="A_0801_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<tr>
<td class="bsilver">802. <input type="text" value="#get_fees.A_0802_DESCRIPTION_2ND_NO_TI#" class="textnormal" name="A_0802_DESCRIPTION_2ND_NO_TI" onFocus="this.blur();"  style="width:381;"  /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0802_AMOUNT_2ND_NO_TI#" class="smallnormal" name="A_0802_AMOUNT_2ND_NO_TI"  onFocus="focus_this(this, 'smallnormal');"  /></td>
</tr>
<tr>
<td class="bsilver">804. <input type="text" value="#get_fees.A_0804_DESCRIPTION_2ND_NO_TI#" class="textnormal" name="A_0804_DESCRIPTION_2ND_NO_TI" onFocus="this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_0804_PAYTO_2ND_NO_TI#" class="textnormal" name="A_0804_PAYTO_2ND_NO_TI"   onFocus="focus_this(this, 'textnormal');"  /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0804_AMOUNT_2ND_NO_TI#" class="smallnormal" name="A_0804_AMOUNT_2ND_NO_TI"   onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">805. <input type="text" value="#get_fees.A_0805_DESCRIPTION_2ND_NO_TI#" class="textnormal" name="A_0805_DESCRIPTION_2ND_NO_TI" onFocus="this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_0805_PAYTO_2ND_NO_TI#" class="textnormal" name="A_0805_PAYTO_2ND_NO_TI"    onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0805_AMOUNT_2ND_NO_TI#" class="smallnormal" name="A_0805_AMOUNT_2ND_NO_TI"  onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">806. <input type="text" value="#get_fees.A_0806_DESCRIPTION_2ND_NO_TI#" class="textnormal" name="A_0806_DESCRIPTION_2ND_NO_TI" onFocus="this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_0806_PAYTO_2ND_NO_TI#" class="textnormal" name="A_0806_PAYTO_2ND_NO_TI"    onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0806_AMOUNT_2ND_NO_TI#" class="smallnormal" name="A_0806_AMOUNT_2ND_NO_TI"   onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>

<tr>
<td class="bsilver">807. <input type="text" value="#get_fees.A_0807_DESCRIPTION_2ND_NO_TI#" class="textnormal" name="A_0807_DESCRIPTION_2ND_NO_TI" onFocus="this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_0807_PAYTO_2ND_NO_TI#" class="textnormal" name="A_0807_PAYTO_2ND_NO_TI"   onFocus="focus_this(this, 'textnormal');"  /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0807_AMOUNT_2ND_NO_TI#" class="smallnormal" name="A_0807_AMOUNT_2ND_NO_TI"  onFocus="focus_this(this, 'smallnormal');"  /></td>
</tr>
<tr>
<td class="bsilver">808. <input type="text" value="#get_fees.A_0808_DESCRIPTION_2ND_NO_TI#" class="textnormal" name="A_0808_DESCRIPTION_2ND_NO_TI"     onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_0808_PAYTO_2ND_NO_TI#" class="textnormal" name="A_0808_PAYTO_2ND_NO_TI"    onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0808_AMOUNT_2ND_NO_TI#" class="smallnormal" name="A_0808_AMOUNT_2ND_NO_TI"   onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">809. <input type="text" value="#get_fees.A_0809_DESCRIPTION_2ND_NO_TI#" class="textnormal" name="A_0809_DESCRIPTION_2ND_NO_TI"    onFocus="focus_this(this, 'textnormal');"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_0809_PAYTO_2ND_NO_TI#" class="textnormal" name="A_0809_PAYTO_2ND_NO_TI"   onFocus="focus_this(this, 'textnormal');"  /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0809_AMOUNT_2ND_NO_TI#" class="smallnormal" name="A_0809_AMOUNT_2ND_NO_TI"  onFocus="focus_this(this, 'smallnormal');"  /></td>
</tr>
<tr>
<td class="bsilver">810. <input type="text" value="#get_fees.A_0810_DESCRIPTION_2ND_NO_TI#" class="textnormal" name="A_0810_DESCRIPTION_2ND_NO_TI"    onFocus="focus_this(this, 'textnormal');"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_0810_PAYTO_2ND_NO_TI#" class="textnormal" name="A_0810_PAYTO_2ND_NO_TI"    onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0810_AMOUNT_2ND_NO_TI#" class="smallnormal" name="A_0810_AMOUNT_2ND_NO_TI"   onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">811. <input type="text" value="#get_fees.A_0811_DESCRIPTION_2ND_NO_TI#" class="textnormal" name="A_0811_DESCRIPTION_2ND_NO_TI"    onFocus="focus_this(this, 'textnormal');"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_0811_PAYTO_2ND_NO_TI#" class="textnormal" name="A_0811_PAYTO_2ND_NO_TI"   onFocus="focus_this(this, 'textnormal');"  /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0811_AMOUNT_2ND_NO_TI#" class="smallnormal" name="A_0811_AMOUNT_2ND_NO_TI"  onFocus="focus_this(this, 'smallnormal');"  /></td>
</tr>
<tr>
<td class="bsilver">812. <input type="text" value="#get_fees.A_0812_DESCRIPTION_2ND_NO_TI#" class="textnormal" name="A_0812_DESCRIPTION_2ND_NO_TI"    onFocus="focus_this(this, 'textnormal');"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_0812_PAYTO_2ND_NO_TI#" class="textnormal" name="A_0812_PAYTO_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0812_AMOUNT_2ND_NO_TI#" class="smallnormal" name="A_0812_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
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
<td class="bordered"><input type="text"  value="#get_fees.A_1101_AMOUNT_2ND_NO_TI#" class="smallnormal" name="A_1101_AMOUNT_2ND_NO_TI" onFocus="blur();" onBlur="a_1101_amount(); unfocus_this(this, '', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Itemized 1101 Charges</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_01_2ND_NO_TI#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_01_2ND_NO_TI"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_01_2ND_NO_TI#" class="textnormal" name="A_1101_ITEM_AMOUNT_01_2ND_NO_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_no_ti(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_01_2ND_NO_TI" value="1" onClick="a_1101_01_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_01_2ND_NO_TI eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_02_2ND_NO_TI#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_02_2ND_NO_TI"   onFocus="focus_this(this, 'textnormal');" onBlur=" unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_02_2ND_NO_TI#" class="textnormal" name="A_1101_ITEM_AMOUNT_02_2ND_NO_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_no_ti(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_02_2ND_NO_TI" value="1" onClick="a_1101_02_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_02_2ND_NO_TI eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_03_2ND_NO_TI#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_03_2ND_NO_TI"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_03_2ND_NO_TI#" class="textnormal" name="A_1101_ITEM_AMOUNT_03_2ND_NO_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_no_ti(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_03_2ND_NO_TI" value="1" onClick="a_1101_03_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_03_2ND_NO_TI eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_04_2ND_NO_TI#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_04_2ND_NO_TI"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_04_2ND_NO_TI#" class="textnormal" name="A_1101_ITEM_AMOUNT_04_2ND_NO_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_no_ti(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_04_2ND_NO_TI" value="1" onClick="a_1101_04_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_04_2ND_NO_TI eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_05_2ND_NO_TI#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_05_2ND_NO_TI"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_05_2ND_NO_TI#" class="textnormal" name="A_1101_ITEM_AMOUNT_05_2ND_NO_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_no_ti(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_05_2ND_NO_TI" value="1" onClick="a_1101_05_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_05_2ND_NO_TI eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_06_2ND_NO_TI#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_06_2ND_NO_TI"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_06_2ND_NO_TI#" class="textnormal" name="A_1101_ITEM_AMOUNT_06_2ND_NO_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_no_ti(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_06_2ND_NO_TI" value="1" onClick="a_1101_06_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_06_2ND_NO_TI eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_07_2ND_NO_TI#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_07_2ND_NO_TI"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_07_2ND_NO_TI#" class="textnormal" name="A_1101_ITEM_AMOUNT_07_2ND_NO_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_no_ti(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_07_2ND_NO_TI" value="1" onClick="a_1101_07_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_07_2ND_NO_TI eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_08_2ND_NO_TI#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_08_2ND_NO_TI"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_08_2ND_NO_TI#" class="textnormal" name="A_1101_ITEM_AMOUNT_08_2ND_NO_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_no_ti(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_08_2ND_NO_TI" value="1" onClick="a_1101_08_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_08_2ND_NO_TI eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_09_2ND_NO_TI#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_09_2ND_NO_TI"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_09_2ND_NO_TI#" class="textnormal" name="A_1101_ITEM_AMOUNT_09_2ND_NO_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_no_ti(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_09_2ND_NO_TI" value="1" onClick="a_1101_09_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_09_2ND_NO_TI eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_10_2ND_NO_TI#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_10_2ND_NO_TI"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_10_2ND_NO_TI#" class="textnormal" name="A_1101_ITEM_AMOUNT_10_2ND_NO_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_no_ti(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_10_2ND_NO_TI" value="1" onClick="a_1101_10_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_10_2ND_NO_TI eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_11_2ND_NO_TI#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_11_2ND_NO_TI"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_11_2ND_NO_TI#" class="textnormal" name="A_1101_ITEM_AMOUNT_11_2ND_NO_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_no_ti(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_11_2ND_NO_TI" value="1" onClick="a_1101_11_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_11_2ND_NO_TI eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_12_2ND_NO_TI#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_12_2ND_NO_TI"   onFocus="focus_this(this, 'textnormal');" onBlur=" unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_12_2ND_NO_TI#" class="textnormal" name="A_1101_ITEM_AMOUNT_12_2ND_NO_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_no_ti(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_12_2ND_NO_TI" value="1" onClick="a_1101_12_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_12_2ND_NO_TI eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_13_2ND_NO_TI#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_13_2ND_NO_TI"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_13_2ND_NO_TI#" class="textnormal" name="A_1101_ITEM_AMOUNT_13_2ND_NO_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_no_ti(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_13_2ND_NO_TI" value="1" onClick="a_1101_13_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_13_2ND_NO_TI eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_14_2ND_NO_TI#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_14_2ND_NO_TI"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_14_2ND_NO_TI#" class="textnormal" name="A_1101_ITEM_AMOUNT_14_2ND_NO_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_no_ti(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_14_2ND_NO_TI" value="1" onClick="a_1101_14_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_14_2ND_NO_TI eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_15_2ND_NO_TI#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_15_2ND_NO_TI"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_15_2ND_NO_TI#" class="textnormal" name="A_1101_ITEM_AMOUNT_15_2ND_NO_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_no_ti(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_15_2ND_NO_TI" value="1" onClick="a_1101_15_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_15_2ND_NO_TI eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_16_2ND_NO_TI#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_16_2ND_NO_TI"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_16_2ND_NO_TI#" class="textnormal" name="A_1101_ITEM_AMOUNT_16_2ND_NO_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_no_ti(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_16_2ND_NO_TI" value="1" onClick="a_1101_16_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_16_2ND_NO_TI eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_17_2ND_NO_TI#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_17_2ND_NO_TI"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_17_2ND_NO_TI#" class="textnormal" name="A_1101_ITEM_AMOUNT_17_2ND_NO_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_no_ti(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_17_2ND_NO_TI" value="1" onClick="a_1101_17_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_17_2ND_NO_TI eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_18_2ND_NO_TI#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_18_2ND_NO_TI"   onFocus="focus_this(this, 'textnormal');" onBlur=" unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_18_2ND_NO_TI#" class="textnormal" name="A_1101_ITEM_AMOUNT_18_2ND_NO_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_no_ti(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_18_2ND_NO_TI" value="1" onClick="a_1101_18_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_18_2ND_NO_TI eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_19_2ND_NO_TI#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_19_2ND_NO_TI"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_19_2ND_NO_TI#" class="textnormal" name="A_1101_ITEM_AMOUNT_19_2ND_NO_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_no_ti(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_19_2ND_NO_TI" value="1" onClick="a_1101_19_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_19_2ND_NO_TI eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_20_2ND_NO_TI#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_20_2ND_NO_TI"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_20_2ND_NO_TI#" class="textnormal" name="A_1101_ITEM_AMOUNT_20_2ND_NO_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_no_ti(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_20_2ND_NO_TI" value="1" onClick="a_1101_20_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_20_2ND_NO_TI eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">1102. <input type="text" value="#get_fees.A_1102_DESCRIPTION_2ND_NO_TI#" class="textnormal" name="A_1102_DESCRIPTION_2ND_NO_TI"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_1102_PAYTO_2ND_NO_TI#" class="textnormal" name="A_1102_PAYTO_2ND_NO_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_1102_AMOUNT_2ND_NO_TI#" class="smallnormal" name="A_1102_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" onBlur="unfocus_this(this, '', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102A. <input type="text" value="#get_fees_b.A_1102A_DESCRIPTION_2ND_NO_TI#" class="textnormal" name="A_1102A_DESCRIPTION_2ND_NO_TI"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1102A_PAYTO_2ND_NO_TI#" class="textnormal" name="A_1102A_PAYTO_2ND_NO_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102A_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td><td class="bordered"><input type="text"  value="#get_fees_b.A_1102A_AMOUNT_2ND_NO_TI#" class="smallnormal" name="A_1102A_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102A_amount(); unfocus_this(this, '', 'small');" /></td><td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102B. <input type="text" value="#get_fees_b.A_1102B_DESCRIPTION_2ND_NO_TI#" class="textnormal" name="A_1102B_DESCRIPTION_2ND_NO_TI"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1102B_PAYTO_2ND_NO_TI#" class="textnormal" name="A_1102B_PAYTO_2ND_NO_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102B_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td><td class="bordered"><input type="text"  value="#get_fees_b.A_1102B_AMOUNT_2ND_NO_TI#" class="smallnormal" name="A_1102B_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102B_amount(); unfocus_this(this, '', 'small');" /></td><td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102C. <input type="text" value="#get_fees_b.A_1102C_DESCRIPTION_2ND_NO_TI#" class="textnormal" name="A_1102C_DESCRIPTION_2ND_NO_TI"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1102C_PAYTO_2ND_NO_TI#" class="textnormal" name="A_1102C_PAYTO_2ND_NO_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102C_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td><td class="bordered"><input type="text"  value="#get_fees_b.A_1102C_AMOUNT_2ND_NO_TI#" class="smallnormal" name="A_1102C_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102C_amount(); unfocus_this(this, '', 'small');" /></td><td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102D. <input type="text" value="#get_fees_b.A_1102D_DESCRIPTION_2ND_NO_TI#" class="textnormal" name="A_1102D_DESCRIPTION_2ND_NO_TI"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1102D_PAYTO_2ND_NO_TI#" class="textnormal" name="A_1102D_PAYTO_2ND_NO_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102D_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td><td class="bordered"><input type="text"  value="#get_fees_b.A_1102D_AMOUNT_2ND_NO_TI#" class="smallnormal" name="A_1102D_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102D_amount(); unfocus_this(this, '', 'small');" /></td><td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102E. <input type="text" value="#get_fees_b.A_1102E_DESCRIPTION_2ND_NO_TI#" class="textnormal" name="A_1102E_DESCRIPTION_2ND_NO_TI"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1102E_PAYTO_2ND_NO_TI#" class="textnormal" name="A_1102E_PAYTO_2ND_NO_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102E_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td><td class="bordered"><input type="text"  value="#get_fees_b.A_1102E_AMOUNT_2ND_NO_TI#" class="smallnormal" name="A_1102E_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102E_amount(); unfocus_this(this, '', 'small');" /></td><td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102F. <input type="text" value="#get_fees_b.A_1102F_DESCRIPTION_2ND_NO_TI#" class="textnormal" name="A_1102F_DESCRIPTION_2ND_NO_TI"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1102F_PAYTO_2ND_NO_TI#" class="textnormal" name="A_1102F_PAYTO_2ND_NO_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102F_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td><td class="bordered"><input type="text"  value="#get_fees_b.A_1102F_AMOUNT_2ND_NO_TI#" class="smallnormal" name="A_1102F_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102F_amount(); unfocus_this(this, '', 'small');" /></td><td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102G. <input type="text" value="#get_fees_b.A_1102G_DESCRIPTION_2ND_NO_TI#" class="textnormal" name="A_1102G_DESCRIPTION_2ND_NO_TI"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1102G_PAYTO_2ND_NO_TI#" class="textnormal" name="A_1102G_PAYTO_2ND_NO_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102G_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td><td class="bordered"><input type="text"  value="#get_fees_b.A_1102G_AMOUNT_2ND_NO_TI#" class="smallnormal" name="A_1102G_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102G_amount(); unfocus_this(this, '', 'small');" /></td><td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102H. <input type="text" value="#get_fees_b.A_1102H_DESCRIPTION_2ND_NO_TI#" class="textnormal" name="A_1102H_DESCRIPTION_2ND_NO_TI"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1102H_PAYTO_2ND_NO_TI#" class="textnormal" name="A_1102H_PAYTO_2ND_NO_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102H_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td><td class="bordered"><input type="text"  value="#get_fees_b.A_1102H_AMOUNT_2ND_NO_TI#" class="smallnormal" name="A_1102H_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102H_amount(); unfocus_this(this, '', 'small');" /></td><td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102I. <input type="text" value="#get_fees_b.A_1102I_DESCRIPTION_2ND_NO_TI#" class="textnormal" name="A_1102I_DESCRIPTION_2ND_NO_TI"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1102I_PAYTO_2ND_NO_TI#" class="textnormal" name="A_1102I_PAYTO_2ND_NO_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102I_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td><td class="bordered"><input type="text"  value="#get_fees_b.A_1102I_AMOUNT_2ND_NO_TI#" class="smallnormal" name="A_1102I_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102I_amount(); unfocus_this(this, '', 'small');" /></td><td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1109. <input type="text" value="#get_fees.A_1109_DESCRIPTION_2ND_NO_TI#" class="textnormal" name="A_1109_DESCRIPTION_2ND_NO_TI"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_1109_PAYTO_2ND_NO_TI#" class="textnormal" name="A_1109_PAYTO_2ND_NO_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_1109_AMOUNT_2ND_NO_TI#" class="smallnormal" name="A_1109_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" onBlur="unfocus_this(this, '', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1109_OUTSIDE_2ND_NO_TI" value="1"  <cfif get_fees.A_1109_OUTSIDE_2ND_NO_TI eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1110. <input type="text" value="#get_fees.A_1110_DESCRIPTION_2ND_NO_TI#" class="textnormal" name="A_1110_DESCRIPTION_2ND_NO_TI"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_1110_PAYTO_2ND_NO_TI#" class="textnormal" name="A_1110_PAYTO_2ND_NO_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_1110_AMOUNT_2ND_NO_TI#" class="smallnormal" name="A_1110_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" onBlur="unfocus_this(this, '', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1110_OUTSIDE_2ND_NO_TI" value="1" <cfif get_fees.A_1110_OUTSIDE_2ND_NO_TI eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1111. <input type="text" value="#get_fees.A_1111_DESCRIPTION_2ND_NO_TI#" class="textnormal" name="A_1111_DESCRIPTION_2ND_NO_TI"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_1111_PAYTO_2ND_NO_TI#" class="textnormal" name="A_1111_PAYTO_2ND_NO_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_1111_AMOUNT_2ND_NO_TI#" class="smallnormal" name="A_1111_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" onBlur="unfocus_this(this, '', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1111_OUTSIDE_2ND_NO_TI" value="1"  <cfif get_fees.A_1111_OUTSIDE_2ND_NO_TI eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1112. <input type="text" value="#get_fees.A_1112_DESCRIPTION_2ND_NO_TI#" class="textnormal" name="A_1112_DESCRIPTION_2ND_NO_TI"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_1112_PAYTO_2ND_NO_TI#" class="textnormal" name="A_1112_PAYTO_2ND_NO_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_1112_AMOUNT_2ND_NO_TI#" class="smallnormal" name="A_1112_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" onBlur="unfocus_this(this, '', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1112_OUTSIDE_2ND_NO_TI" value="1" <cfif get_fees.A_1112_OUTSIDE_2ND_NO_TI eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1113. <input type="text" value="#get_fees.A_1113_DESCRIPTION_2ND_NO_TI#" class="textnormal" name="A_1113_DESCRIPTION_2ND_NO_TI"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_1113_PAYTO_2ND_NO_TI#" class="textnormal" name="A_1113_PAYTO_2ND_NO_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_1113_AMOUNT_2ND_NO_TI#" class="smallnormal" name="A_1113_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" onBlur="unfocus_this(this, '', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1113_OUTSIDE_2ND_NO_TI" value="1" <cfif get_fees.A_1113_OUTSIDE_2ND_NO_TI eq 1>checked</cfif> /></td></tr>
</table>
<!-- 1300 -->
<table width="650" summary="Type of Loan" border="1" cellspacing="0">
<tr>
<td class="bdarksilver_head">1300. Additional Settlement Charges (for Non-Title/Settlement Charges)</td>
<td class="bdarksilver_head" align="right">Amount</td>
<td class="bdarksilver_head" align="right">Outside</td>

</tr>
<!--- <tr>
<td class="bsilver">1301. <input type="text" value="#get_fees_b.A_1301_DESCRIPTION_2ND_NO_TI#" class="textnormal" name="A_1301_DESCRIPTION_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1301_PAYTO_2ND_NO_TI#" class="textnormal" name="A_1301_PAYTO_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b.A_1301_AMOUNT_2ND_NO_TI#" class="smallnormal" name="A_1301_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1301_OUTSIDE_2ND_NO_TI" value="1" <cfif get_fees_b.A_1301_OUTSIDE_2ND_NO_TI eq 1>checked</cfif>  /></td></tr>
 ---><tr>
<td class="bsilver">1302. <input type="text" value="#get_fees_b.A_1302_DESCRIPTION_2ND_NO_TI#" class="textnormal" name="A_1302_DESCRIPTION_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1302_PAYTO_2ND_NO_TI#" class="textnormal" name="A_1302_PAYTO_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b.A_1302_AMOUNT_2ND_NO_TI#" class="smallnormal" name="A_1302_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1302_OUTSIDE_2ND_NO_TI" value="1" <cfif get_fees_b.A_1302_OUTSIDE_2ND_NO_TI eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1303. <input type="text" value="#get_fees_b.A_1303_DESCRIPTION_2ND_NO_TI#" class="textnormal" name="A_1303_DESCRIPTION_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1303_PAYTO_2ND_NO_TI#" class="textnormal" name="A_1303_PAYTO_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b.A_1303_AMOUNT_2ND_NO_TI#" class="smallnormal" name="A_1303_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1303_OUTSIDE_2ND_NO_TI" value="1" <cfif get_fees_b.A_1303_OUTSIDE_2ND_NO_TI eq 1>checked</cfif>  /></td></tr>
<tr>
<td class="bsilver">1304. <input type="text" value="#get_fees_b.A_1304_DESCRIPTION_2ND_NO_TI#" class="textnormal" name="A_1304_DESCRIPTION_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1304_PAYTO_2ND_NO_TI#" class="textnormal" name="A_1304_PAYTO_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b.A_1304_AMOUNT_2ND_NO_TI#" class="smallnormal" name="A_1304_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1304_OUTSIDE_2ND_NO_TI" value="1" <cfif get_fees_b.A_1304_OUTSIDE_2ND_NO_TI eq 1>checked</cfif>  /></td></tr>

<tr>
<td class="bsilver">1305. <input type="text" value="#get_fees_b.A_1305_DESCRIPTION_2ND_NO_TI#" class="textnormal" name="A_1305_DESCRIPTION_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1305_PAYTO_2ND_NO_TI#" class="textnormal" name="A_1305_PAYTO_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b.A_1305_AMOUNT_2ND_NO_TI#" class="smallnormal" name="A_1305_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1305_OUTSIDE_2ND_NO_TI" value="1" <cfif get_fees_b.A_1305_OUTSIDE_2ND_NO_TI eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1306. <input type="text" value="#get_fees_b.A_1306_DESCRIPTION_2ND_NO_TI#" class="textnormal" name="A_1306_DESCRIPTION_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1306_PAYTO_2ND_NO_TI#" class="textnormal" name="A_1306_PAYTO_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b.A_1306_AMOUNT_2ND_NO_TI#" class="smallnormal" name="A_1306_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1306_OUTSIDE_2ND_NO_TI" value="1"  <cfif get_fees_b.A_1306_OUTSIDE_2ND_NO_TI eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1307. <input type="text" value="#get_fees_b.A_1307_DESCRIPTION_2ND_NO_TI#" class="textnormal" name="A_1307_DESCRIPTION_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1307_PAYTO_2ND_NO_TI#" class="textnormal" name="A_1307_PAYTO_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b.A_1307_AMOUNT_2ND_NO_TI#" class="smallnormal" name="A_1307_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1307_OUTSIDE_2ND_NO_TI" value="1" <cfif get_fees_b.A_1307_OUTSIDE_2ND_NO_TI eq 1>checked</cfif>  /></td></tr>
<tr>
<td class="bsilver">1308. <input type="text" value="#get_fees_b.A_1308_DESCRIPTION_2ND_NO_TI#" class="textnormal" name="A_1308_DESCRIPTION_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1308_PAYTO_2ND_NO_TI#" class="textnormal" name="A_1308_PAYTO_2ND_NO_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b.A_1308_AMOUNT_2ND_NO_TI#" class="smallnormal" name="A_1308_AMOUNT_2ND_NO_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1308_OUTSIDE_2ND_NO_TI" value="1" <cfif get_fees_b.A_1308_OUTSIDE_2ND_NO_TI eq 1>checked</cfif>  /></td></tr>
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
<td class="bsilver">801. <input type="text" value="#get_fees.A_0801_DESCRIPTION_2ND_WITH_TI#" class="textnormal" name="A_0801_DESCRIPTION_2ND_WITH_TI" onFocus="this.blur();" style="width:381;" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0801_AMOUNT_2ND_WITH_TI#" class="smallnormal" name="A_0801_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<tr>
<td class="bsilver">802. <input type="text" value="#get_fees.A_0802_DESCRIPTION_2ND_WITH_TI#" class="textnormal" name="A_0802_DESCRIPTION_2ND_WITH_TI" onFocus="this.blur();"  style="width:381;"  /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0802_AMOUNT_2ND_WITH_TI#" class="smallnormal" name="A_0802_AMOUNT_2ND_WITH_TI"  onFocus="focus_this(this, 'smallnormal');"  /></td>
</tr>
<tr>
<td class="bsilver">804. <input type="text" value="#get_fees.A_0804_DESCRIPTION_2ND_WITH_TI#" class="textnormal" name="A_0804_DESCRIPTION_2ND_WITH_TI" onFocus="this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_0804_PAYTO_2ND_WITH_TI#" class="textnormal" name="A_0804_PAYTO_2ND_WITH_TI"   onFocus="focus_this(this, 'textnormal');"  /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0804_AMOUNT_2ND_WITH_TI#" class="smallnormal" name="A_0804_AMOUNT_2ND_WITH_TI"   onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">805. <input type="text" value="#get_fees.A_0805_DESCRIPTION_2ND_WITH_TI#" class="textnormal" name="A_0805_DESCRIPTION_2ND_WITH_TI" onFocus="this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_0805_PAYTO_2ND_WITH_TI#" class="textnormal" name="A_0805_PAYTO_2ND_WITH_TI"    onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0805_AMOUNT_2ND_WITH_TI#" class="smallnormal" name="A_0805_AMOUNT_2ND_WITH_TI"  onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">806. <input type="text" value="#get_fees.A_0806_DESCRIPTION_2ND_WITH_TI#" class="textnormal" name="A_0806_DESCRIPTION_2ND_WITH_TI" onFocus="this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_0806_PAYTO_2ND_WITH_TI#" class="textnormal" name="A_0806_PAYTO_2ND_WITH_TI"    onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0806_AMOUNT_2ND_WITH_TI#" class="smallnormal" name="A_0806_AMOUNT_2ND_WITH_TI"   onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>

<tr>
<td class="bsilver">807. <input type="text" value="#get_fees.A_0807_DESCRIPTION_2ND_WITH_TI#" class="textnormal" name="A_0807_DESCRIPTION_2ND_WITH_TI" onFocus="this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_0807_PAYTO_2ND_WITH_TI#" class="textnormal" name="A_0807_PAYTO_2ND_WITH_TI"   onFocus="focus_this(this, 'textnormal');"  /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0807_AMOUNT_2ND_WITH_TI#" class="smallnormal" name="A_0807_AMOUNT_2ND_WITH_TI"  onFocus="focus_this(this, 'smallnormal');"  /></td>
</tr>
<tr>
<td class="bsilver">808. <input type="text" value="#get_fees.A_0808_DESCRIPTION_2ND_WITH_TI#" class="textnormal" name="A_0808_DESCRIPTION_2ND_WITH_TI"     onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_0808_PAYTO_2ND_WITH_TI#" class="textnormal" name="A_0808_PAYTO_2ND_WITH_TI"    onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0808_AMOUNT_2ND_WITH_TI#" class="smallnormal" name="A_0808_AMOUNT_2ND_WITH_TI"   onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">809. <input type="text" value="#get_fees.A_0809_DESCRIPTION_2ND_WITH_TI#" class="textnormal" name="A_0809_DESCRIPTION_2ND_WITH_TI"    onFocus="focus_this(this, 'textnormal');"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_0809_PAYTO_2ND_WITH_TI#" class="textnormal" name="A_0809_PAYTO_2ND_WITH_TI"   onFocus="focus_this(this, 'textnormal');"  /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0809_AMOUNT_2ND_WITH_TI#" class="smallnormal" name="A_0809_AMOUNT_2ND_WITH_TI"  onFocus="focus_this(this, 'smallnormal');"  /></td>
</tr>
<tr>
<td class="bsilver">810. <input type="text" value="#get_fees.A_0810_DESCRIPTION_2ND_WITH_TI#" class="textnormal" name="A_0810_DESCRIPTION_2ND_WITH_TI"    onFocus="focus_this(this, 'textnormal');"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_0810_PAYTO_2ND_WITH_TI#" class="textnormal" name="A_0810_PAYTO_2ND_WITH_TI"    onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0810_AMOUNT_2ND_WITH_TI#" class="smallnormal" name="A_0810_AMOUNT_2ND_WITH_TI"   onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">811. <input type="text" value="#get_fees.A_0811_DESCRIPTION_2ND_WITH_TI#" class="textnormal" name="A_0811_DESCRIPTION_2ND_WITH_TI"    onFocus="focus_this(this, 'textnormal');"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_0811_PAYTO_2ND_WITH_TI#" class="textnormal" name="A_0811_PAYTO_2ND_WITH_TI"   onFocus="focus_this(this, 'textnormal');"  /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0811_AMOUNT_2ND_WITH_TI#" class="smallnormal" name="A_0811_AMOUNT_2ND_WITH_TI"  onFocus="focus_this(this, 'smallnormal');"  /></td>
</tr>
<tr>
<td class="bsilver">812. <input type="text" value="#get_fees.A_0812_DESCRIPTION_2ND_WITH_TI#" class="textnormal" name="A_0812_DESCRIPTION_2ND_WITH_TI"    onFocus="focus_this(this, 'textnormal');"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_0812_PAYTO_2ND_WITH_TI#" class="textnormal" name="A_0812_PAYTO_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0812_AMOUNT_2ND_WITH_TI#" class="smallnormal" name="A_0812_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
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
<td class="bordered"><input type="text"  value="#get_fees.A_1101_AMOUNT_2ND_WITH_TI#" class="smallnormal" name="A_1101_AMOUNT_2ND_WITH_TI" onFocus="blur();" onBlur="a_1101_amount(); unfocus_this(this, '', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Itemized 1101 Charges</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_01_2ND_WITH_TI#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_01_2ND_WITH_TI"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_01_2ND_WITH_TI#" class="textnormal" name="A_1101_ITEM_AMOUNT_01_2ND_WITH_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_with_ti(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_01_2ND_WITH_TI" value="1" onClick="a_1101_01_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_01_2ND_WITH_TI eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_02_2ND_WITH_TI#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_02_2ND_WITH_TI"   onFocus="focus_this(this, 'textnormal');" onBlur=" unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_02_2ND_WITH_TI#" class="textnormal" name="A_1101_ITEM_AMOUNT_02_2ND_WITH_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_with_ti(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_02_2ND_WITH_TI" value="1" onClick="a_1101_02_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_02_2ND_WITH_TI eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_03_2ND_WITH_TI#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_03_2ND_WITH_TI"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_03_2ND_WITH_TI#" class="textnormal" name="A_1101_ITEM_AMOUNT_03_2ND_WITH_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_with_ti(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_03_2ND_WITH_TI" value="1" onClick="a_1101_03_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_03_2ND_WITH_TI eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_04_2ND_WITH_TI#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_04_2ND_WITH_TI"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_04_2ND_WITH_TI#" class="textnormal" name="A_1101_ITEM_AMOUNT_04_2ND_WITH_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_with_ti(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_04_2ND_WITH_TI" value="1" onClick="a_1101_04_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_04_2ND_WITH_TI eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_05_2ND_WITH_TI#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_05_2ND_WITH_TI"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_05_2ND_WITH_TI#" class="textnormal" name="A_1101_ITEM_AMOUNT_05_2ND_WITH_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_with_ti(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_05_2ND_WITH_TI" value="1" onClick="a_1101_05_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_05_2ND_WITH_TI eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_06_2ND_WITH_TI#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_06_2ND_WITH_TI"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_06_2ND_WITH_TI#" class="textnormal" name="A_1101_ITEM_AMOUNT_06_2ND_WITH_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_with_ti(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_06_2ND_WITH_TI" value="1" onClick="a_1101_06_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_06_2ND_WITH_TI eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_07_2ND_WITH_TI#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_07_2ND_WITH_TI"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_07_2ND_WITH_TI#" class="textnormal" name="A_1101_ITEM_AMOUNT_07_2ND_WITH_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_with_ti(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_07_2ND_WITH_TI" value="1" onClick="a_1101_07_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_07_2ND_WITH_TI eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_08_2ND_WITH_TI#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_08_2ND_WITH_TI"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_08_2ND_WITH_TI#" class="textnormal" name="A_1101_ITEM_AMOUNT_08_2ND_WITH_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_with_ti(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_08_2ND_WITH_TI" value="1" onClick="a_1101_08_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_08_2ND_WITH_TI eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_09_2ND_WITH_TI#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_09_2ND_WITH_TI"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_09_2ND_WITH_TI#" class="textnormal" name="A_1101_ITEM_AMOUNT_09_2ND_WITH_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_with_ti(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_09_2ND_WITH_TI" value="1" onClick="a_1101_09_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_09_2ND_WITH_TI eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_10_2ND_WITH_TI#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_10_2ND_WITH_TI"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_10_2ND_WITH_TI#" class="textnormal" name="A_1101_ITEM_AMOUNT_10_2ND_WITH_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_with_ti(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_10_2ND_WITH_TI" value="1" onClick="a_1101_10_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_10_2ND_WITH_TI eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_11_2ND_WITH_TI#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_11_2ND_WITH_TI"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_11_2ND_WITH_TI#" class="textnormal" name="A_1101_ITEM_AMOUNT_11_2ND_WITH_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_with_ti(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_11_2ND_WITH_TI" value="1" onClick="a_1101_11_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_11_2ND_WITH_TI eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_12_2ND_WITH_TI#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_12_2ND_WITH_TI"   onFocus="focus_this(this, 'textnormal');" onBlur=" unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_12_2ND_WITH_TI#" class="textnormal" name="A_1101_ITEM_AMOUNT_12_2ND_WITH_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_with_ti(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_12_2ND_WITH_TI" value="1" onClick="a_1101_12_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_12_2ND_WITH_TI eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_13_2ND_WITH_TI#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_13_2ND_WITH_TI"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_13_2ND_WITH_TI#" class="textnormal" name="A_1101_ITEM_AMOUNT_13_2ND_WITH_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_with_ti(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_13_2ND_WITH_TI" value="1" onClick="a_1101_13_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_13_2ND_WITH_TI eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_14_2ND_WITH_TI#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_14_2ND_WITH_TI"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_14_2ND_WITH_TI#" class="textnormal" name="A_1101_ITEM_AMOUNT_14_2ND_WITH_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_with_ti(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_14_2ND_WITH_TI" value="1" onClick="a_1101_14_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_14_2ND_WITH_TI eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_15_2ND_WITH_TI#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_15_2ND_WITH_TI"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_15_2ND_WITH_TI#" class="textnormal" name="A_1101_ITEM_AMOUNT_15_2ND_WITH_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_with_ti(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_15_2ND_WITH_TI" value="1" onClick="a_1101_15_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_15_2ND_WITH_TI eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_16_2ND_WITH_TI#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_16_2ND_WITH_TI"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_16_2ND_WITH_TI#" class="textnormal" name="A_1101_ITEM_AMOUNT_16_2ND_WITH_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_with_ti(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_16_2ND_WITH_TI" value="1" onClick="a_1101_16_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_16_2ND_WITH_TI eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_17_2ND_WITH_TI#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_17_2ND_WITH_TI"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_17_2ND_WITH_TI#" class="textnormal" name="A_1101_ITEM_AMOUNT_17_2ND_WITH_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_with_ti(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_17_2ND_WITH_TI" value="1" onClick="a_1101_17_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_17_2ND_WITH_TI eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_18_2ND_WITH_TI#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_18_2ND_WITH_TI"   onFocus="focus_this(this, 'textnormal');" onBlur=" unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_18_2ND_WITH_TI#" class="textnormal" name="A_1101_ITEM_AMOUNT_18_2ND_WITH_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_with_ti(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_18_2ND_WITH_TI" value="1" onClick="a_1101_18_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_18_2ND_WITH_TI eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_19_2ND_WITH_TI#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_19_2ND_WITH_TI"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_19_2ND_WITH_TI#" class="textnormal" name="A_1101_ITEM_AMOUNT_19_2ND_WITH_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_with_ti(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_19_2ND_WITH_TI" value="1" onClick="a_1101_19_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_19_2ND_WITH_TI eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_20_2ND_WITH_TI#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_20_2ND_WITH_TI"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_20_2ND_WITH_TI#" class="textnormal" name="A_1101_ITEM_AMOUNT_20_2ND_WITH_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_2nd_with_ti(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_20_2ND_WITH_TI" value="1" onClick="a_1101_20_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_20_2ND_WITH_TI eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">1102. <input type="text" value="#get_fees.A_1102_DESCRIPTION_2ND_WITH_TI#" class="textnormal" name="A_1102_DESCRIPTION_2ND_WITH_TI"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_1102_PAYTO_2ND_WITH_TI#" class="textnormal" name="A_1102_PAYTO_2ND_WITH_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_1102_AMOUNT_2ND_WITH_TI#" class="smallnormal" name="A_1102_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" onBlur="unfocus_this(this, '', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102A. <input type="text" value="#get_fees_b.A_1102A_DESCRIPTION_2ND_WITH_TI#" class="textnormal" name="A_1102A_DESCRIPTION_2ND_WITH_TI"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1102A_PAYTO_2ND_WITH_TI#" class="textnormal" name="A_1102A_PAYTO_2ND_WITH_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102A_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td><td class="bordered"><input type="text"  value="#get_fees_b.A_1102A_AMOUNT_2ND_WITH_TI#" class="smallnormal" name="A_1102A_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102A_amount(); unfocus_this(this, '', 'small');" /></td><td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102B. <input type="text" value="#get_fees_b.A_1102B_DESCRIPTION_2ND_WITH_TI#" class="textnormal" name="A_1102B_DESCRIPTION_2ND_WITH_TI"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1102B_PAYTO_2ND_WITH_TI#" class="textnormal" name="A_1102B_PAYTO_2ND_WITH_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102B_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td><td class="bordered"><input type="text"  value="#get_fees_b.A_1102B_AMOUNT_2ND_WITH_TI#" class="smallnormal" name="A_1102B_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102B_amount(); unfocus_this(this, '', 'small');" /></td><td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102C. <input type="text" value="#get_fees_b.A_1102C_DESCRIPTION_2ND_WITH_TI#" class="textnormal" name="A_1102C_DESCRIPTION_2ND_WITH_TI"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1102C_PAYTO_2ND_WITH_TI#" class="textnormal" name="A_1102C_PAYTO_2ND_WITH_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102C_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td><td class="bordered"><input type="text"  value="#get_fees_b.A_1102C_AMOUNT_2ND_WITH_TI#" class="smallnormal" name="A_1102C_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102C_amount(); unfocus_this(this, '', 'small');" /></td><td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102D. <input type="text" value="#get_fees_b.A_1102D_DESCRIPTION_2ND_WITH_TI#" class="textnormal" name="A_1102D_DESCRIPTION_2ND_WITH_TI"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1102D_PAYTO_2ND_WITH_TI#" class="textnormal" name="A_1102D_PAYTO_2ND_WITH_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102D_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td><td class="bordered"><input type="text"  value="#get_fees_b.A_1102D_AMOUNT_2ND_WITH_TI#" class="smallnormal" name="A_1102D_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102D_amount(); unfocus_this(this, '', 'small');" /></td><td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102E. <input type="text" value="#get_fees_b.A_1102E_DESCRIPTION_2ND_WITH_TI#" class="textnormal" name="A_1102E_DESCRIPTION_2ND_WITH_TI"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1102E_PAYTO_2ND_WITH_TI#" class="textnormal" name="A_1102E_PAYTO_2ND_WITH_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102E_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td><td class="bordered"><input type="text"  value="#get_fees_b.A_1102E_AMOUNT_2ND_WITH_TI#" class="smallnormal" name="A_1102E_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102E_amount(); unfocus_this(this, '', 'small');" /></td><td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102F. <input type="text" value="#get_fees_b.A_1102F_DESCRIPTION_2ND_WITH_TI#" class="textnormal" name="A_1102F_DESCRIPTION_2ND_WITH_TI"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1102F_PAYTO_2ND_WITH_TI#" class="textnormal" name="A_1102F_PAYTO_2ND_WITH_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102F_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td><td class="bordered"><input type="text"  value="#get_fees_b.A_1102F_AMOUNT_2ND_WITH_TI#" class="smallnormal" name="A_1102F_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102F_amount(); unfocus_this(this, '', 'small');" /></td><td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102G. <input type="text" value="#get_fees_b.A_1102G_DESCRIPTION_2ND_WITH_TI#" class="textnormal" name="A_1102G_DESCRIPTION_2ND_WITH_TI"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1102G_PAYTO_2ND_WITH_TI#" class="textnormal" name="A_1102G_PAYTO_2ND_WITH_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102G_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td><td class="bordered"><input type="text"  value="#get_fees_b.A_1102G_AMOUNT_2ND_WITH_TI#" class="smallnormal" name="A_1102G_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102G_amount(); unfocus_this(this, '', 'small');" /></td><td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102H. <input type="text" value="#get_fees_b.A_1102H_DESCRIPTION_2ND_WITH_TI#" class="textnormal" name="A_1102H_DESCRIPTION_2ND_WITH_TI"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1102H_PAYTO_2ND_WITH_TI#" class="textnormal" name="A_1102H_PAYTO_2ND_WITH_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102H_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td><td class="bordered"><input type="text"  value="#get_fees_b.A_1102H_AMOUNT_2ND_WITH_TI#" class="smallnormal" name="A_1102H_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102H_amount(); unfocus_this(this, '', 'small');" /></td><td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102I. <input type="text" value="#get_fees_b.A_1102I_DESCRIPTION_2ND_WITH_TI#" class="textnormal" name="A_1102I_DESCRIPTION_2ND_WITH_TI"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1102I_PAYTO_2ND_WITH_TI#" class="textnormal" name="A_1102I_PAYTO_2ND_WITH_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102I_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td><td class="bordered"><input type="text"  value="#get_fees_b.A_1102I_AMOUNT_2ND_WITH_TI#" class="smallnormal" name="A_1102I_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102I_amount(); unfocus_this(this, '', 'small');" /></td><td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1109. <input type="text" value="#get_fees.A_1109_DESCRIPTION_2ND_WITH_TI#" class="textnormal" name="A_1109_DESCRIPTION_2ND_WITH_TI"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_1109_PAYTO_2ND_WITH_TI#" class="textnormal" name="A_1109_PAYTO_2ND_WITH_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_1109_AMOUNT_2ND_WITH_TI#" class="smallnormal" name="A_1109_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" onBlur="unfocus_this(this, '', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1109_OUTSIDE_2ND_WITH_TI" value="1"  <cfif get_fees.A_1109_OUTSIDE_2ND_WITH_TI eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1110. <input type="text" value="#get_fees.A_1110_DESCRIPTION_2ND_WITH_TI#" class="textnormal" name="A_1110_DESCRIPTION_2ND_WITH_TI"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_1110_PAYTO_2ND_WITH_TI#" class="textnormal" name="A_1110_PAYTO_2ND_WITH_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_1110_AMOUNT_2ND_WITH_TI#" class="smallnormal" name="A_1110_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" onBlur="unfocus_this(this, '', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1110_OUTSIDE_2ND_WITH_TI" value="1" <cfif get_fees.A_1110_OUTSIDE_2ND_WITH_TI eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1111. <input type="text" value="#get_fees.A_1111_DESCRIPTION_2ND_WITH_TI#" class="textnormal" name="A_1111_DESCRIPTION_2ND_WITH_TI"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_1111_PAYTO_2ND_WITH_TI#" class="textnormal" name="A_1111_PAYTO_2ND_WITH_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_1111_AMOUNT_2ND_WITH_TI#" class="smallnormal" name="A_1111_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" onBlur="unfocus_this(this, '', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1111_OUTSIDE_2ND_WITH_TI" value="1"  <cfif get_fees.A_1111_OUTSIDE_2ND_WITH_TI eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1112. <input type="text" value="#get_fees.A_1112_DESCRIPTION_2ND_WITH_TI#" class="textnormal" name="A_1112_DESCRIPTION_2ND_WITH_TI"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_1112_PAYTO_2ND_WITH_TI#" class="textnormal" name="A_1112_PAYTO_2ND_WITH_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_1112_AMOUNT_2ND_WITH_TI#" class="smallnormal" name="A_1112_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" onBlur="unfocus_this(this, '', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1112_OUTSIDE_2ND_WITH_TI" value="1" <cfif get_fees.A_1112_OUTSIDE_2ND_WITH_TI eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1113. <input type="text" value="#get_fees.A_1113_DESCRIPTION_2ND_WITH_TI#" class="textnormal" name="A_1113_DESCRIPTION_2ND_WITH_TI"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_1113_PAYTO_2ND_WITH_TI#" class="textnormal" name="A_1113_PAYTO_2ND_WITH_TI"  onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_1113_AMOUNT_2ND_WITH_TI#" class="smallnormal" name="A_1113_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" onBlur="unfocus_this(this, '', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1113_OUTSIDE_2ND_WITH_TI" value="1" <cfif get_fees.A_1113_OUTSIDE_2ND_WITH_TI eq 1>checked</cfif> /></td></tr>
</table>
<!-- 1300 -->
<table width="650" summary="Type of Loan" border="1" cellspacing="0">
<tr>
<td class="bdarksilver_head">1300. Additional Settlement Charges (for Non-Title/Settlement Charges)</td>
<td class="bdarksilver_head" align="right">Amount</td>
<td class="bdarksilver_head" align="right">Outside</td>

</tr>
<!--- <tr>
<td class="bsilver">1301. <input type="text" value="#get_fees_b.A_1301_DESCRIPTION_2ND_WITH_TI#" class="textnormal" name="A_1301_DESCRIPTION_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1301_PAYTO_2ND_WITH_TI#" class="textnormal" name="A_1301_PAYTO_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b.A_1301_AMOUNT_2ND_WITH_TI#" class="smallnormal" name="A_1301_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1301_OUTSIDE_2ND_WITH_TI" value="1" <cfif get_fees_b.A_1301_OUTSIDE_2ND_WITH_TI eq 1>checked</cfif>  /></td></tr>
 ---><tr>
<td class="bsilver">1302. <input type="text" value="#get_fees_b.A_1302_DESCRIPTION_2ND_WITH_TI#" class="textnormal" name="A_1302_DESCRIPTION_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1302_PAYTO_2ND_WITH_TI#" class="textnormal" name="A_1302_PAYTO_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b.A_1302_AMOUNT_2ND_WITH_TI#" class="smallnormal" name="A_1302_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1302_OUTSIDE_2ND_WITH_TI" value="1" <cfif get_fees_b.A_1302_OUTSIDE_2ND_WITH_TI eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1303. <input type="text" value="#get_fees_b.A_1303_DESCRIPTION_2ND_WITH_TI#" class="textnormal" name="A_1303_DESCRIPTION_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1303_PAYTO_2ND_WITH_TI#" class="textnormal" name="A_1303_PAYTO_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b.A_1303_AMOUNT_2ND_WITH_TI#" class="smallnormal" name="A_1303_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1303_OUTSIDE_2ND_WITH_TI" value="1" <cfif get_fees_b.A_1303_OUTSIDE_2ND_WITH_TI eq 1>checked</cfif>  /></td></tr>
<tr>
<td class="bsilver">1304. <input type="text" value="#get_fees_b.A_1304_DESCRIPTION_2ND_WITH_TI#" class="textnormal" name="A_1304_DESCRIPTION_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1304_PAYTO_2ND_WITH_TI#" class="textnormal" name="A_1304_PAYTO_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b.A_1304_AMOUNT_2ND_WITH_TI#" class="smallnormal" name="A_1304_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1304_OUTSIDE_2ND_WITH_TI" value="1" <cfif get_fees_b.A_1304_OUTSIDE_2ND_WITH_TI eq 1>checked</cfif>  /></td></tr>

<tr>
<td class="bsilver">1305. <input type="text" value="#get_fees_b.A_1305_DESCRIPTION_2ND_WITH_TI#" class="textnormal" name="A_1305_DESCRIPTION_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1305_PAYTO_2ND_WITH_TI#" class="textnormal" name="A_1305_PAYTO_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b.A_1305_AMOUNT_2ND_WITH_TI#" class="smallnormal" name="A_1305_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1305_OUTSIDE_2ND_WITH_TI" value="1" <cfif get_fees_b.A_1305_OUTSIDE_2ND_WITH_TI eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1306. <input type="text" value="#get_fees_b.A_1306_DESCRIPTION_2ND_WITH_TI#" class="textnormal" name="A_1306_DESCRIPTION_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1306_PAYTO_2ND_WITH_TI#" class="textnormal" name="A_1306_PAYTO_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b.A_1306_AMOUNT_2ND_WITH_TI#" class="smallnormal" name="A_1306_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1306_OUTSIDE_2ND_WITH_TI" value="1"  <cfif get_fees_b.A_1306_OUTSIDE_2ND_WITH_TI eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1307. <input type="text" value="#get_fees_b.A_1307_DESCRIPTION_2ND_WITH_TI#" class="textnormal" name="A_1307_DESCRIPTION_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1307_PAYTO_2ND_WITH_TI#" class="textnormal" name="A_1307_PAYTO_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b.A_1307_AMOUNT_2ND_WITH_TI#" class="smallnormal" name="A_1307_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1307_OUTSIDE_2ND_WITH_TI" value="1" <cfif get_fees_b.A_1307_OUTSIDE_2ND_WITH_TI eq 1>checked</cfif>  /></td></tr>
<tr>
<td class="bsilver">1308. <input type="text" value="#get_fees_b.A_1308_DESCRIPTION_2ND_WITH_TI#" class="textnormal" name="A_1308_DESCRIPTION_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1308_PAYTO_2ND_WITH_TI#" class="textnormal" name="A_1308_PAYTO_2ND_WITH_TI" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b.A_1308_AMOUNT_2ND_WITH_TI#" class="smallnormal" name="A_1308_AMOUNT_2ND_WITH_TI" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1308_OUTSIDE_2ND_WITH_TI" value="1" <cfif get_fees_b.A_1308_OUTSIDE_2ND_WITH_TI eq 1>checked</cfif>  /></td></tr>
</table>
<br>
<br>
<br>
<span class="page_title">PURCHASE - SELLER</span><BR>
<!-- 800 -->
<table width="650" summary="Type of Loan" border="1" cellspacing="0">
<tr><td height="4" colspan="6"></td></tr>
<tr>
<td class="bdarksilver_head">800. Items Payable in Connection with Loan</td>
<td class="bdarksilver_head" align="right">Amount</td>
</tr>
<tr>
<td class="bsilver">801. <input type="text" value="#get_fees.A_0801_DESCRIPTION_PURCHASE_SELLER#" class="textnormal" name="A_0801_DESCRIPTION_PURCHASE_SELLER" onFocus="this.blur();" style="width:381;" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0801_AMOUNT_PURCHASE_SELLER#" class="smallnormal" name="A_0801_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<tr>
<td class="bsilver">802. <input type="text" value="#get_fees.A_0802_DESCRIPTION_PURCHASE_SELLER#" class="textnormal" name="A_0802_DESCRIPTION_PURCHASE_SELLER" onFocus="this.blur();"  style="width:381;"  /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0802_AMOUNT_PURCHASE_SELLER#" class="smallnormal" name="A_0802_AMOUNT_PURCHASE_SELLER"  onFocus="focus_this(this, 'smallnormal');"  /></td>
</tr>
<tr>
<td class="bsilver">804. <input type="text" value="#get_fees.A_0804_DESCRIPTION_PURCHASE_SELLER#" class="textnormal" name="A_0804_DESCRIPTION_PURCHASE_SELLER" onFocus="this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_0804_PAYTO_PURCHASE_SELLER#" class="textnormal" name="A_0804_PAYTO_PURCHASE_SELLER"   onFocus="focus_this(this, 'textnormal');"  /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0804_AMOUNT_PURCHASE_SELLER#" class="smallnormal" name="A_0804_AMOUNT_PURCHASE_SELLER"   onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">805. <input type="text" value="#get_fees.A_0805_DESCRIPTION_PURCHASE_SELLER#" class="textnormal" name="A_0805_DESCRIPTION_PURCHASE_SELLER" onFocus="this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_0805_PAYTO_PURCHASE_SELLER#" class="textnormal" name="A_0805_PAYTO_PURCHASE_SELLER"    onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0805_AMOUNT_PURCHASE_SELLER#" class="smallnormal" name="A_0805_AMOUNT_PURCHASE_SELLER"  onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">806. <input type="text" value="#get_fees.A_0806_DESCRIPTION_PURCHASE_SELLER#" class="textnormal" name="A_0806_DESCRIPTION_PURCHASE_SELLER" onFocus="this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_0806_PAYTO_PURCHASE_SELLER#" class="textnormal" name="A_0806_PAYTO_PURCHASE_SELLER"    onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0806_AMOUNT_PURCHASE_SELLER#" class="smallnormal" name="A_0806_AMOUNT_PURCHASE_SELLER"   onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>

<tr>
<td class="bsilver">807. <input type="text" value="#get_fees.A_0807_DESCRIPTION_PURCHASE_SELLER#" class="textnormal" name="A_0807_DESCRIPTION_PURCHASE_SELLER" onFocus="this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_0807_PAYTO_PURCHASE_SELLER#" class="textnormal" name="A_0807_PAYTO_PURCHASE_SELLER"   onFocus="focus_this(this, 'textnormal');"  /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0807_AMOUNT_PURCHASE_SELLER#" class="smallnormal" name="A_0807_AMOUNT_PURCHASE_SELLER"  onFocus="focus_this(this, 'smallnormal');"  /></td>
</tr>
<tr>
<td class="bsilver">808. <input type="text" value="#get_fees.A_0808_DESCRIPTION_PURCHASE_SELLER#" class="textnormal" name="A_0808_DESCRIPTION_PURCHASE_SELLER"     onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_0808_PAYTO_PURCHASE_SELLER#" class="textnormal" name="A_0808_PAYTO_PURCHASE_SELLER"    onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0808_AMOUNT_PURCHASE_SELLER#" class="smallnormal" name="A_0808_AMOUNT_PURCHASE_SELLER"   onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">809. <input type="text" value="#get_fees.A_0809_DESCRIPTION_PURCHASE_SELLER#" class="textnormal" name="A_0809_DESCRIPTION_PURCHASE_SELLER"    onFocus="focus_this(this, 'textnormal');"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_0809_PAYTO_PURCHASE_SELLER#" class="textnormal" name="A_0809_PAYTO_PURCHASE_SELLER"   onFocus="focus_this(this, 'textnormal');"  /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0809_AMOUNT_PURCHASE_SELLER#" class="smallnormal" name="A_0809_AMOUNT_PURCHASE_SELLER"  onFocus="focus_this(this, 'smallnormal');"  /></td>
</tr>
<tr>
<td class="bsilver">810. <input type="text" value="#get_fees.A_0810_DESCRIPTION_PURCHASE_SELLER#" class="textnormal" name="A_0810_DESCRIPTION_PURCHASE_SELLER"    onFocus="focus_this(this, 'textnormal');"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_0810_PAYTO_PURCHASE_SELLER#" class="textnormal" name="A_0810_PAYTO_PURCHASE_SELLER"    onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0810_AMOUNT_PURCHASE_SELLER#" class="smallnormal" name="A_0810_AMOUNT_PURCHASE_SELLER"   onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">811. <input type="text" value="#get_fees.A_0811_DESCRIPTION_PURCHASE_SELLER#" class="textnormal" name="A_0811_DESCRIPTION_PURCHASE_SELLER"    onFocus="focus_this(this, 'textnormal');"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_0811_PAYTO_PURCHASE_SELLER#" class="textnormal" name="A_0811_PAYTO_PURCHASE_SELLER"   onFocus="focus_this(this, 'textnormal');"  /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0811_AMOUNT_PURCHASE_SELLER#" class="smallnormal" name="A_0811_AMOUNT_PURCHASE_SELLER"  onFocus="focus_this(this, 'smallnormal');"  /></td>
</tr>
<tr>
<td class="bsilver">812. <input type="text" value="#get_fees.A_0812_DESCRIPTION_PURCHASE_SELLER#" class="textnormal" name="A_0812_DESCRIPTION_PURCHASE_SELLER"    onFocus="focus_this(this, 'textnormal');"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_0812_PAYTO_PURCHASE_SELLER#" class="textnormal" name="A_0812_PAYTO_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_0812_AMOUNT_PURCHASE_SELLER#" class="smallnormal" name="A_0812_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" /></td>
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
<td class="bordered"><input type="text"  value="#get_fees.A_1101_AMOUNT_PURCHASE_SELLER#" class="smallnormal" name="A_1101_AMOUNT_PURCHASE_SELLER" onFocus="blur();" onBlur="a_1101_amount(); unfocus_this(this, '', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Itemized 1101 Charges</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_01_PURCHASE_SELLER#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_01_PURCHASE_SELLER"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_01_PURCHASE_SELLER#" class="textnormal" name="A_1101_ITEM_AMOUNT_01_PURCHASE_SELLER"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase_seller(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_01_PURCHASE_SELLER" value="1" onClick="a_1101_01_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_01_PURCHASE_SELLER eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_02_PURCHASE_SELLER#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_02_PURCHASE_SELLER"   onFocus="focus_this(this, 'textnormal');" onBlur=" unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_02_PURCHASE_SELLER#" class="textnormal" name="A_1101_ITEM_AMOUNT_02_PURCHASE_SELLER"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase_seller(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_02_PURCHASE_SELLER" value="1" onClick="a_1101_02_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_02_PURCHASE_SELLER eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_03_PURCHASE_SELLER#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_03_PURCHASE_SELLER"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_03_PURCHASE_SELLER#" class="textnormal" name="A_1101_ITEM_AMOUNT_03_PURCHASE_SELLER"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase_seller(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_03_PURCHASE_SELLER" value="1" onClick="a_1101_03_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_03_PURCHASE_SELLER eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_04_PURCHASE_SELLER#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_04_PURCHASE_SELLER"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_04_PURCHASE_SELLER#" class="textnormal" name="A_1101_ITEM_AMOUNT_04_PURCHASE_SELLER"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase_seller(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_04_PURCHASE_SELLER" value="1" onClick="a_1101_04_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_04_PURCHASE_SELLER eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_05_PURCHASE_SELLER#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_05_PURCHASE_SELLER"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_05_PURCHASE_SELLER#" class="textnormal" name="A_1101_ITEM_AMOUNT_05_PURCHASE_SELLER"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase_seller(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_05_PURCHASE_SELLER" value="1" onClick="a_1101_05_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_05_PURCHASE_SELLER eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_06_PURCHASE_SELLER#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_06_PURCHASE_SELLER"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_06_PURCHASE_SELLER#" class="textnormal" name="A_1101_ITEM_AMOUNT_06_PURCHASE_SELLER"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase_seller(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_06_PURCHASE_SELLER" value="1" onClick="a_1101_06_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_06_PURCHASE_SELLER eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_07_PURCHASE_SELLER#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_07_PURCHASE_SELLER"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_07_PURCHASE_SELLER#" class="textnormal" name="A_1101_ITEM_AMOUNT_07_PURCHASE_SELLER"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase_seller(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_07_PURCHASE_SELLER" value="1" onClick="a_1101_07_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_07_PURCHASE_SELLER eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_08_PURCHASE_SELLER#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_08_PURCHASE_SELLER"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_08_PURCHASE_SELLER#" class="textnormal" name="A_1101_ITEM_AMOUNT_08_PURCHASE_SELLER"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase_seller(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_08_PURCHASE_SELLER" value="1" onClick="a_1101_08_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_08_PURCHASE_SELLER eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_09_PURCHASE_SELLER#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_09_PURCHASE_SELLER"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_09_PURCHASE_SELLER#" class="textnormal" name="A_1101_ITEM_AMOUNT_09_PURCHASE_SELLER"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase_seller(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_09_PURCHASE_SELLER" value="1" onClick="a_1101_09_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_09_PURCHASE_SELLER eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_10_PURCHASE_SELLER#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_10_PURCHASE_SELLER"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_10_PURCHASE_SELLER#" class="textnormal" name="A_1101_ITEM_AMOUNT_10_PURCHASE_SELLER"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase_seller(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_10_PURCHASE_SELLER" value="1" onClick="a_1101_10_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_10_PURCHASE_SELLER eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_11_PURCHASE_SELLER#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_11_PURCHASE_SELLER"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_11_PURCHASE_SELLER#" class="textnormal" name="A_1101_ITEM_AMOUNT_11_PURCHASE_SELLER"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase_seller(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_11_PURCHASE_SELLER" value="1" onClick="a_1101_11_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_11_PURCHASE_SELLER eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_12_PURCHASE_SELLER#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_12_PURCHASE_SELLER"   onFocus="focus_this(this, 'textnormal');" onBlur=" unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_12_PURCHASE_SELLER#" class="textnormal" name="A_1101_ITEM_AMOUNT_12_PURCHASE_SELLER"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase_seller(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_12_PURCHASE_SELLER" value="1" onClick="a_1101_12_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_12_PURCHASE_SELLER eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_13_PURCHASE_SELLER#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_13_PURCHASE_SELLER"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_13_PURCHASE_SELLER#" class="textnormal" name="A_1101_ITEM_AMOUNT_13_PURCHASE_SELLER"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase_seller(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_13_PURCHASE_SELLER" value="1" onClick="a_1101_13_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_13_PURCHASE_SELLER eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_14_PURCHASE_SELLER#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_14_PURCHASE_SELLER"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_14_PURCHASE_SELLER#" class="textnormal" name="A_1101_ITEM_AMOUNT_14_PURCHASE_SELLER"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase_seller(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_14_PURCHASE_SELLER" value="1" onClick="a_1101_14_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_14_PURCHASE_SELLER eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_15_PURCHASE_SELLER#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_15_PURCHASE_SELLER"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_15_PURCHASE_SELLER#" class="textnormal" name="A_1101_ITEM_AMOUNT_15_PURCHASE_SELLER"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase_seller(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_15_PURCHASE_SELLER" value="1" onClick="a_1101_15_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_15_PURCHASE_SELLER eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_16_PURCHASE_SELLER#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_16_PURCHASE_SELLER"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_16_PURCHASE_SELLER#" class="textnormal" name="A_1101_ITEM_AMOUNT_16_PURCHASE_SELLER"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase_seller(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_16_PURCHASE_SELLER" value="1" onClick="a_1101_16_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_16_PURCHASE_SELLER eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_17_PURCHASE_SELLER#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_17_PURCHASE_SELLER"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_17_PURCHASE_SELLER#" class="textnormal" name="A_1101_ITEM_AMOUNT_17_PURCHASE_SELLER"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase_seller(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_17_PURCHASE_SELLER" value="1" onClick="a_1101_17_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_17_PURCHASE_SELLER eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_18_PURCHASE_SELLER#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_18_PURCHASE_SELLER"   onFocus="focus_this(this, 'textnormal');" onBlur=" unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_18_PURCHASE_SELLER#" class="textnormal" name="A_1101_ITEM_AMOUNT_18_PURCHASE_SELLER"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase_seller(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_18_PURCHASE_SELLER" value="1" onClick="a_1101_18_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_18_PURCHASE_SELLER eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_19_PURCHASE_SELLER#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_19_PURCHASE_SELLER"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_19_PURCHASE_SELLER#" class="textnormal" name="A_1101_ITEM_AMOUNT_19_PURCHASE_SELLER"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase_seller(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_19_PURCHASE_SELLER" value="1" onClick="a_1101_19_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_19_PURCHASE_SELLER eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_DESCRIPTION_20_PURCHASE_SELLER#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_20_PURCHASE_SELLER"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees.A_1101_ITEM_AMOUNT_20_PURCHASE_SELLER#" class="textnormal" name="A_1101_ITEM_AMOUNT_20_PURCHASE_SELLER"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_purchase_seller(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_20_PURCHASE_SELLER" value="1" onClick="a_1101_20_selectable();" <cfif find_itemized.A_1101_ITEM_SELECTABLE_20_PURCHASE_SELLER eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">1102. <input type="text" value="#get_fees.A_1102_DESCRIPTION_PURCHASE_SELLER#" class="textnormal" name="A_1102_DESCRIPTION_PURCHASE_SELLER"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_1102_PAYTO_PURCHASE_SELLER#" class="textnormal" name="A_1102_PAYTO_PURCHASE_SELLER"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_1102_AMOUNT_PURCHASE_SELLER#" class="smallnormal" name="A_1102_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" onBlur="unfocus_this(this, '', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102A. <input type="text" value="#get_fees_b.A_1102A_DESCRIPTION_PURCHASE_SELLER#" class="textnormal" name="A_1102A_DESCRIPTION_PURCHASE_SELLER"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1102A_PAYTO_PURCHASE_SELLER#" class="textnormal" name="A_1102A_PAYTO_PURCHASE_SELLER"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102A_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td><td class="bordered"><input type="text"  value="#get_fees_b.A_1102A_AMOUNT_PURCHASE_SELLER#" class="smallnormal" name="A_1102A_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102A_amount(); unfocus_this(this, '', 'small');" /></td><td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102B. <input type="text" value="#get_fees_b.A_1102B_DESCRIPTION_PURCHASE_SELLER#" class="textnormal" name="A_1102B_DESCRIPTION_PURCHASE_SELLER"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1102B_PAYTO_PURCHASE_SELLER#" class="textnormal" name="A_1102B_PAYTO_PURCHASE_SELLER"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102B_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td><td class="bordered"><input type="text"  value="#get_fees_b.A_1102B_AMOUNT_PURCHASE_SELLER#" class="smallnormal" name="A_1102B_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102B_amount(); unfocus_this(this, '', 'small');" /></td><td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102C. <input type="text" value="#get_fees_b.A_1102C_DESCRIPTION_PURCHASE_SELLER#" class="textnormal" name="A_1102C_DESCRIPTION_PURCHASE_SELLER"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1102C_PAYTO_PURCHASE_SELLER#" class="textnormal" name="A_1102C_PAYTO_PURCHASE_SELLER"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102C_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td><td class="bordered"><input type="text"  value="#get_fees_b.A_1102C_AMOUNT_PURCHASE_SELLER#" class="smallnormal" name="A_1102C_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102C_amount(); unfocus_this(this, '', 'small');" /></td><td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102D. <input type="text" value="#get_fees_b.A_1102D_DESCRIPTION_PURCHASE_SELLER#" class="textnormal" name="A_1102D_DESCRIPTION_PURCHASE_SELLER"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1102D_PAYTO_PURCHASE_SELLER#" class="textnormal" name="A_1102D_PAYTO_PURCHASE_SELLER"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102D_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td><td class="bordered"><input type="text"  value="#get_fees_b.A_1102D_AMOUNT_PURCHASE_SELLER#" class="smallnormal" name="A_1102D_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102D_amount(); unfocus_this(this, '', 'small');" /></td><td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102E. <input type="text" value="#get_fees_b.A_1102E_DESCRIPTION_PURCHASE_SELLER#" class="textnormal" name="A_1102E_DESCRIPTION_PURCHASE_SELLER"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1102E_PAYTO_PURCHASE_SELLER#" class="textnormal" name="A_1102E_PAYTO_PURCHASE_SELLER"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102E_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td><td class="bordered"><input type="text"  value="#get_fees_b.A_1102E_AMOUNT_PURCHASE_SELLER#" class="smallnormal" name="A_1102E_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102E_amount(); unfocus_this(this, '', 'small');" /></td><td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102F. <input type="text" value="#get_fees_b.A_1102F_DESCRIPTION_PURCHASE_SELLER#" class="textnormal" name="A_1102F_DESCRIPTION_PURCHASE_SELLER"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1102F_PAYTO_PURCHASE_SELLER#" class="textnormal" name="A_1102F_PAYTO_PURCHASE_SELLER"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102F_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td><td class="bordered"><input type="text"  value="#get_fees_b.A_1102F_AMOUNT_PURCHASE_SELLER#" class="smallnormal" name="A_1102F_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102F_amount(); unfocus_this(this, '', 'small');" /></td><td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102G. <input type="text" value="#get_fees_b.A_1102G_DESCRIPTION_PURCHASE_SELLER#" class="textnormal" name="A_1102G_DESCRIPTION_PURCHASE_SELLER"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1102G_PAYTO_PURCHASE_SELLER#" class="textnormal" name="A_1102G_PAYTO_PURCHASE_SELLER"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102G_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td><td class="bordered"><input type="text"  value="#get_fees_b.A_1102G_AMOUNT_PURCHASE_SELLER#" class="smallnormal" name="A_1102G_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102G_amount(); unfocus_this(this, '', 'small');" /></td><td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102H. <input type="text" value="#get_fees_b.A_1102H_DESCRIPTION_PURCHASE_SELLER#" class="textnormal" name="A_1102H_DESCRIPTION_PURCHASE_SELLER"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1102H_PAYTO_PURCHASE_SELLER#" class="textnormal" name="A_1102H_PAYTO_PURCHASE_SELLER"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102H_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td><td class="bordered"><input type="text"  value="#get_fees_b.A_1102H_AMOUNT_PURCHASE_SELLER#" class="smallnormal" name="A_1102H_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102H_amount(); unfocus_this(this, '', 'small');" /></td><td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102I. <input type="text" value="#get_fees_b.A_1102I_DESCRIPTION_PURCHASE_SELLER#" class="textnormal" name="A_1102I_DESCRIPTION_PURCHASE_SELLER"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1102I_PAYTO_PURCHASE_SELLER#" class="textnormal" name="A_1102I_PAYTO_PURCHASE_SELLER"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102I_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td><td class="bordered"><input type="text"  value="#get_fees_b.A_1102I_AMOUNT_PURCHASE_SELLER#" class="smallnormal" name="A_1102I_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" onBlur="a_1102I_amount(); unfocus_this(this, '', 'small');" /></td><td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1109. <input type="text" value="#get_fees.A_1109_DESCRIPTION_PURCHASE_SELLER#" class="textnormal" name="A_1109_DESCRIPTION_PURCHASE_SELLER"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_1109_PAYTO_PURCHASE_SELLER#" class="textnormal" name="A_1109_PAYTO_PURCHASE_SELLER"  onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_1109_AMOUNT_PURCHASE_SELLER#" class="smallnormal" name="A_1109_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" onBlur="unfocus_this(this, '', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1109_OUTSIDE_PURCHASE_SELLER" value="1"  <cfif get_fees.A_1109_OUTSIDE_PURCHASE_SELLER eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1110. <input type="text" value="#get_fees.A_1110_DESCRIPTION_PURCHASE_SELLER#" class="textnormal" name="A_1110_DESCRIPTION_PURCHASE_SELLER"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_1110_PAYTO_PURCHASE_SELLER#" class="textnormal" name="A_1110_PAYTO_PURCHASE_SELLER"  onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_1110_AMOUNT_PURCHASE_SELLER#" class="smallnormal" name="A_1110_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" onBlur="unfocus_this(this, '', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1110_OUTSIDE_PURCHASE_SELLER" value="1" <cfif get_fees.A_1110_OUTSIDE_PURCHASE_SELLER eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1111. <input type="text" value="#get_fees.A_1111_DESCRIPTION_PURCHASE_SELLER#" class="textnormal" name="A_1111_DESCRIPTION_PURCHASE_SELLER"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_1111_PAYTO_PURCHASE_SELLER#" class="textnormal" name="A_1111_PAYTO_PURCHASE_SELLER"  onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_1111_AMOUNT_PURCHASE_SELLER#" class="smallnormal" name="A_1111_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" onBlur="unfocus_this(this, '', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1111_OUTSIDE_PURCHASE_SELLER" value="1"  <cfif get_fees.A_1111_OUTSIDE_PURCHASE_SELLER eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1112. <input type="text" value="#get_fees.A_1112_DESCRIPTION_PURCHASE_SELLER#" class="textnormal" name="A_1112_DESCRIPTION_PURCHASE_SELLER"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_1112_PAYTO_PURCHASE_SELLER#" class="textnormal" name="A_1112_PAYTO_PURCHASE_SELLER"  onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_1112_AMOUNT_PURCHASE_SELLER#" class="smallnormal" name="A_1112_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" onBlur="unfocus_this(this, '', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1112_OUTSIDE_PURCHASE_SELLER" value="1" <cfif get_fees.A_1112_OUTSIDE_PURCHASE_SELLER eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1113. <input type="text" value="#get_fees.A_1113_DESCRIPTION_PURCHASE_SELLER#" class="textnormal" name="A_1113_DESCRIPTION_PURCHASE_SELLER"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees.A_1113_PAYTO_PURCHASE_SELLER#" class="textnormal" name="A_1113_PAYTO_PURCHASE_SELLER"  onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees.A_1113_AMOUNT_PURCHASE_SELLER#" class="smallnormal" name="A_1113_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" onBlur="unfocus_this(this, '', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1113_OUTSIDE_PURCHASE_SELLER" value="1" <cfif get_fees.A_1113_OUTSIDE_PURCHASE_SELLER eq 1>checked</cfif> /></td></tr>
</table>
<!-- 1300 -->
<table width="650" summary="Type of Loan" border="1" cellspacing="0">
<tr>
<td class="bdarksilver_head">1300. Additional Settlement Charges (for Non-Title/Settlement Charges)</td>
<td class="bdarksilver_head" align="right">Amount</td>
<td class="bdarksilver_head" align="right">Outside</td>

</tr>
<!--- <tr>
<td class="bsilver">1301. <input type="text" value="#get_fees_b.A_1301_DESCRIPTION_PURCHASE_SELLER#" class="textnormal" name="A_1301_DESCRIPTION_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1301_PAYTO_PURCHASE_SELLER#" class="textnormal" name="A_1301_PAYTO_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b.A_1301_AMOUNT_PURCHASE_SELLER#" class="smallnormal" name="A_1301_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1301_OUTSIDE_PURCHASE_SELLER" value="1" <cfif get_fees_b.A_1301_OUTSIDE_PURCHASE_SELLER eq 1>checked</cfif>  /></td></tr>
 ---><tr>
<td class="bsilver">1302. <input type="text" value="#get_fees_b.A_1302_DESCRIPTION_PURCHASE_SELLER#" class="textnormal" name="A_1302_DESCRIPTION_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1302_PAYTO_PURCHASE_SELLER#" class="textnormal" name="A_1302_PAYTO_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b.A_1302_AMOUNT_PURCHASE_SELLER#" class="smallnormal" name="A_1302_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1302_OUTSIDE_PURCHASE_SELLER" value="1" <cfif get_fees_b.A_1302_OUTSIDE_PURCHASE_SELLER eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1303. <input type="text" value="#get_fees_b.A_1303_DESCRIPTION_PURCHASE_SELLER#" class="textnormal" name="A_1303_DESCRIPTION_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1303_PAYTO_PURCHASE_SELLER#" class="textnormal" name="A_1303_PAYTO_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b.A_1303_AMOUNT_PURCHASE_SELLER#" class="smallnormal" name="A_1303_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1303_OUTSIDE_PURCHASE_SELLER" value="1" <cfif get_fees_b.A_1303_OUTSIDE_PURCHASE_SELLER eq 1>checked</cfif>  /></td></tr>
<tr>
<td class="bsilver">1304. <input type="text" value="#get_fees_b.A_1304_DESCRIPTION_PURCHASE_SELLER#" class="textnormal" name="A_1304_DESCRIPTION_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1304_PAYTO_PURCHASE_SELLER#" class="textnormal" name="A_1304_PAYTO_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b.A_1304_AMOUNT_PURCHASE_SELLER#" class="smallnormal" name="A_1304_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1304_OUTSIDE_PURCHASE_SELLER" value="1" <cfif get_fees_b.A_1304_OUTSIDE_PURCHASE_SELLER eq 1>checked</cfif>  /></td></tr>

<tr>
<td class="bsilver">1305. <input type="text" value="#get_fees_b.A_1305_DESCRIPTION_PURCHASE_SELLER#" class="textnormal" name="A_1305_DESCRIPTION_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1305_PAYTO_PURCHASE_SELLER#" class="textnormal" name="A_1305_PAYTO_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b.A_1305_AMOUNT_PURCHASE_SELLER#" class="smallnormal" name="A_1305_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1305_OUTSIDE_PURCHASE_SELLER" value="1" <cfif get_fees_b.A_1305_OUTSIDE_PURCHASE_SELLER eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1306. <input type="text" value="#get_fees_b.A_1306_DESCRIPTION_PURCHASE_SELLER#" class="textnormal" name="A_1306_DESCRIPTION_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1306_PAYTO_PURCHASE_SELLER#" class="textnormal" name="A_1306_PAYTO_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b.A_1306_AMOUNT_PURCHASE_SELLER#" class="smallnormal" name="A_1306_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1306_OUTSIDE_PURCHASE_SELLER" value="1"  <cfif get_fees_b.A_1306_OUTSIDE_PURCHASE_SELLER eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1307. <input type="text" value="#get_fees_b.A_1307_DESCRIPTION_PURCHASE_SELLER#" class="textnormal" name="A_1307_DESCRIPTION_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1307_PAYTO_PURCHASE_SELLER#" class="textnormal" name="A_1307_PAYTO_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b.A_1307_AMOUNT_PURCHASE_SELLER#" class="smallnormal" name="A_1307_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1307_OUTSIDE_PURCHASE_SELLER" value="1" <cfif get_fees_b.A_1307_OUTSIDE_PURCHASE_SELLER eq 1>checked</cfif>  /></td></tr>
<tr>
<td class="bsilver">1308. <input type="text" value="#get_fees_b.A_1308_DESCRIPTION_PURCHASE_SELLER#" class="textnormal" name="A_1308_DESCRIPTION_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b.A_1308_PAYTO_PURCHASE_SELLER#" class="textnormal" name="A_1308_PAYTO_PURCHASE_SELLER" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b.A_1308_AMOUNT_PURCHASE_SELLER#" class="smallnormal" name="A_1308_AMOUNT_PURCHASE_SELLER" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1308_OUTSIDE_PURCHASE_SELLER" value="1" <cfif get_fees_b.A_1308_OUTSIDE_PURCHASE_SELLER eq 1>checked</cfif>  /></td></tr>
</table>


<br>
<br>
<br>
<span class="page_title">CONSTRUCTION - 1X CLOSE</span><BR>
<!-- 800 -->
<table width="650" summary="Type of Loan" border="1" cellspacing="0">
<tr><td height="4" colspan="6"></td></tr>
<tr>
<td class="bdarksilver_head">800. Items Payable in Connection with Loan</td>
<td class="bdarksilver_head" align="right">Amount</td>
</tr>
<tr>
<td class="bsilver">801. <input type="text" value="#get_fees_construction.A_0801_DESCRIPTION_CONSTR_1X#" class="textnormal" name="A_0801_DESCRIPTION_CONSTR_1X" onFocus="this.blur();" style="width:381;" /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_0801_AMOUNT_CONSTR_1X#" class="smallnormal" name="A_0801_AMOUNT_CONSTR_1X" onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<tr>
<td class="bsilver">802. <input type="text" value="#get_fees_construction.A_0802_DESCRIPTION_CONSTR_1X#" class="textnormal" name="A_0802_DESCRIPTION_CONSTR_1X" onFocus="this.blur();"  style="width:381;"  /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_0802_AMOUNT_CONSTR_1X#" class="smallnormal" name="A_0802_AMOUNT_CONSTR_1X"  onFocus="focus_this(this, 'smallnormal');"  /></td>
</tr>
<tr>
<td class="bsilver">804. <input type="text" value="#get_fees_construction.A_0804_DESCRIPTION_CONSTR_1X#" class="textnormal" name="A_0804_DESCRIPTION_CONSTR_1X" onFocus="this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees_construction.A_0804_PAYTO_CONSTR_1X#" class="textnormal" name="A_0804_PAYTO_CONSTR_1X"   onFocus="focus_this(this, 'textnormal');"  /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_0804_AMOUNT_CONSTR_1X#" class="smallnormal" name="A_0804_AMOUNT_CONSTR_1X"   onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">805. <input type="text" value="#get_fees_construction.A_0805_DESCRIPTION_CONSTR_1X#" class="textnormal" name="A_0805_DESCRIPTION_CONSTR_1X" onFocus="this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees_construction.A_0805_PAYTO_CONSTR_1X#" class="textnormal" name="A_0805_PAYTO_CONSTR_1X"    onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_0805_AMOUNT_CONSTR_1X#" class="smallnormal" name="A_0805_AMOUNT_CONSTR_1X"  onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">806. <input type="text" value="#get_fees_construction.A_0806_DESCRIPTION_CONSTR_1X#" class="textnormal" name="A_0806_DESCRIPTION_CONSTR_1X" onFocus="this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees_construction.A_0806_PAYTO_CONSTR_1X#" class="textnormal" name="A_0806_PAYTO_CONSTR_1X"    onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_0806_AMOUNT_CONSTR_1X#" class="smallnormal" name="A_0806_AMOUNT_CONSTR_1X"   onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>

<tr>
<td class="bsilver">807. <input type="text" value="#get_fees_construction.A_0807_DESCRIPTION_CONSTR_1X#" class="textnormal" name="A_0807_DESCRIPTION_CONSTR_1X" onFocus="this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees_construction.A_0807_PAYTO_CONSTR_1X#" class="textnormal" name="A_0807_PAYTO_CONSTR_1X"   onFocus="focus_this(this, 'textnormal');"  /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_0807_AMOUNT_CONSTR_1X#" class="smallnormal" name="A_0807_AMOUNT_CONSTR_1X"  onFocus="focus_this(this, 'smallnormal');"  /></td>
</tr>
<tr>
<td class="bsilver">808. <input type="text" value="#get_fees_construction.A_0808_DESCRIPTION_CONSTR_1X#" class="textnormal" name="A_0808_DESCRIPTION_CONSTR_1X"     onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_construction.A_0808_PAYTO_CONSTR_1X#" class="textnormal" name="A_0808_PAYTO_CONSTR_1X"    onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_0808_AMOUNT_CONSTR_1X#" class="smallnormal" name="A_0808_AMOUNT_CONSTR_1X"   onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">809. <input type="text" value="#get_fees_construction.A_0809_DESCRIPTION_CONSTR_1X#" class="textnormal" name="A_0809_DESCRIPTION_CONSTR_1X"    onFocus="focus_this(this, 'textnormal');"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees_construction.A_0809_PAYTO_CONSTR_1X#" class="textnormal" name="A_0809_PAYTO_CONSTR_1X"   onFocus="focus_this(this, 'textnormal');"  /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_0809_AMOUNT_CONSTR_1X#" class="smallnormal" name="A_0809_AMOUNT_CONSTR_1X"  onFocus="focus_this(this, 'smallnormal');"  /></td>
</tr>
<tr>
<td class="bsilver">810. <input type="text" value="#get_fees_construction.A_0810_DESCRIPTION_CONSTR_1X#" class="textnormal" name="A_0810_DESCRIPTION_CONSTR_1X"    onFocus="focus_this(this, 'textnormal');"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees_construction.A_0810_PAYTO_CONSTR_1X#" class="textnormal" name="A_0810_PAYTO_CONSTR_1X"    onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_0810_AMOUNT_CONSTR_1X#" class="smallnormal" name="A_0810_AMOUNT_CONSTR_1X"   onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">811. <input type="text" value="#get_fees_construction.A_0811_DESCRIPTION_CONSTR_1X#" class="textnormal" name="A_0811_DESCRIPTION_CONSTR_1X"    onFocus="focus_this(this, 'textnormal');"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees_construction.A_0811_PAYTO_CONSTR_1X#" class="textnormal" name="A_0811_PAYTO_CONSTR_1X"   onFocus="focus_this(this, 'textnormal');"  /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_0811_AMOUNT_CONSTR_1X#" class="smallnormal" name="A_0811_AMOUNT_CONSTR_1X"  onFocus="focus_this(this, 'smallnormal');"  /></td>
</tr>
<tr>
<td class="bsilver">812. <input type="text" value="#get_fees_construction.A_0812_DESCRIPTION_CONSTR_1X#" class="textnormal" name="A_0812_DESCRIPTION_CONSTR_1X"    onFocus="focus_this(this, 'textnormal');"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees_construction.A_0812_PAYTO_CONSTR_1X#" class="textnormal" name="A_0812_PAYTO_CONSTR_1X" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_0812_AMOUNT_CONSTR_1X#" class="smallnormal" name="A_0812_AMOUNT_CONSTR_1X" onFocus="focus_this(this, 'smallnormal');" /></td>
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
<td class="bordered"><input type="text"  value="#get_fees_construction.A_1101_AMOUNT_CONSTR_1X#" class="smallnormal" name="A_1101_AMOUNT_CONSTR_1X" onFocus="blur();" onBlur="a_1101_amount(); unfocus_this(this, '', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Itemized 1101 Charges</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_01_CONSTR_1X#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_01_CONSTR_1X"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_01_CONSTR_1X#" class="textnormal" name="A_1101_ITEM_AMOUNT_01_CONSTR_1X"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_CONSTR_1X(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_01_CONSTR_1X" value="1" onClick="a_1101_01_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_01_CONSTR_1X eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_02_CONSTR_1X#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_02_CONSTR_1X"   onFocus="focus_this(this, 'textnormal');" onBlur=" unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_02_CONSTR_1X#" class="textnormal" name="A_1101_ITEM_AMOUNT_02_CONSTR_1X"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_CONSTR_1X(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_02_CONSTR_1X" value="1" onClick="a_1101_02_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_02_CONSTR_1X eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_03_CONSTR_1X#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_03_CONSTR_1X"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_03_CONSTR_1X#" class="textnormal" name="A_1101_ITEM_AMOUNT_03_CONSTR_1X"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_CONSTR_1X(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_03_CONSTR_1X" value="1" onClick="a_1101_03_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_03_CONSTR_1X eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_04_CONSTR_1X#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_04_CONSTR_1X"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_04_CONSTR_1X#" class="textnormal" name="A_1101_ITEM_AMOUNT_04_CONSTR_1X"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_CONSTR_1X(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_04_CONSTR_1X" value="1" onClick="a_1101_04_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_04_CONSTR_1X eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_05_CONSTR_1X#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_05_CONSTR_1X"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_05_CONSTR_1X#" class="textnormal" name="A_1101_ITEM_AMOUNT_05_CONSTR_1X"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_CONSTR_1X(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_05_CONSTR_1X" value="1" onClick="a_1101_05_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_05_CONSTR_1X eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_06_CONSTR_1X#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_06_CONSTR_1X"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_06_CONSTR_1X#" class="textnormal" name="A_1101_ITEM_AMOUNT_06_CONSTR_1X"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_CONSTR_1X(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_06_CONSTR_1X" value="1" onClick="a_1101_06_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_06_CONSTR_1X eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_07_CONSTR_1X#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_07_CONSTR_1X"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_07_CONSTR_1X#" class="textnormal" name="A_1101_ITEM_AMOUNT_07_CONSTR_1X"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_CONSTR_1X(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_07_CONSTR_1X" value="1" onClick="a_1101_07_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_07_CONSTR_1X eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_08_CONSTR_1X#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_08_CONSTR_1X"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_08_CONSTR_1X#" class="textnormal" name="A_1101_ITEM_AMOUNT_08_CONSTR_1X"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_CONSTR_1X(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_08_CONSTR_1X" value="1" onClick="a_1101_08_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_08_CONSTR_1X eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_09_CONSTR_1X#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_09_CONSTR_1X"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_09_CONSTR_1X#" class="textnormal" name="A_1101_ITEM_AMOUNT_09_CONSTR_1X"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_CONSTR_1X(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_09_CONSTR_1X" value="1" onClick="a_1101_09_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_09_CONSTR_1X eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_10_CONSTR_1X#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_10_CONSTR_1X"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_10_CONSTR_1X#" class="textnormal" name="A_1101_ITEM_AMOUNT_10_CONSTR_1X"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_CONSTR_1X(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_10_CONSTR_1X" value="1" onClick="a_1101_10_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_10_CONSTR_1X eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_11_CONSTR_1X#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_11_CONSTR_1X"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_11_CONSTR_1X#" class="textnormal" name="A_1101_ITEM_AMOUNT_11_CONSTR_1X"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_CONSTR_1X(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_11_CONSTR_1X" value="1" onClick="a_1101_11_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_11_CONSTR_1X eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_12_CONSTR_1X#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_12_CONSTR_1X"   onFocus="focus_this(this, 'textnormal');" onBlur=" unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_12_CONSTR_1X#" class="textnormal" name="A_1101_ITEM_AMOUNT_12_CONSTR_1X"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_CONSTR_1X(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_12_CONSTR_1X" value="1" onClick="a_1101_12_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_12_CONSTR_1X eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_13_CONSTR_1X#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_13_CONSTR_1X"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_13_CONSTR_1X#" class="textnormal" name="A_1101_ITEM_AMOUNT_13_CONSTR_1X"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_CONSTR_1X(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_13_CONSTR_1X" value="1" onClick="a_1101_13_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_13_CONSTR_1X eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_14_CONSTR_1X#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_14_CONSTR_1X"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_14_CONSTR_1X#" class="textnormal" name="A_1101_ITEM_AMOUNT_14_CONSTR_1X"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_CONSTR_1X(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_14_CONSTR_1X" value="1" onClick="a_1101_14_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_14_CONSTR_1X eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_15_CONSTR_1X#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_15_CONSTR_1X"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_15_CONSTR_1X#" class="textnormal" name="A_1101_ITEM_AMOUNT_15_CONSTR_1X"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_CONSTR_1X(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_15_CONSTR_1X" value="1" onClick="a_1101_15_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_15_CONSTR_1X eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_16_CONSTR_1X#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_16_CONSTR_1X"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_16_CONSTR_1X#" class="textnormal" name="A_1101_ITEM_AMOUNT_16_CONSTR_1X"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_CONSTR_1X(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_16_CONSTR_1X" value="1" onClick="a_1101_16_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_16_CONSTR_1X eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_17_CONSTR_1X#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_17_CONSTR_1X"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_17_CONSTR_1X#" class="textnormal" name="A_1101_ITEM_AMOUNT_17_CONSTR_1X"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_CONSTR_1X(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_17_CONSTR_1X" value="1" onClick="a_1101_17_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_17_CONSTR_1X eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_18_CONSTR_1X#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_18_CONSTR_1X"   onFocus="focus_this(this, 'textnormal');" onBlur=" unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_18_CONSTR_1X#" class="textnormal" name="A_1101_ITEM_AMOUNT_18_CONSTR_1X"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_CONSTR_1X(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_18_CONSTR_1X" value="1" onClick="a_1101_18_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_18_CONSTR_1X eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_19_CONSTR_1X#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_19_CONSTR_1X"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_19_CONSTR_1X#" class="textnormal" name="A_1101_ITEM_AMOUNT_19_CONSTR_1X"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_CONSTR_1X(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_19_CONSTR_1X" value="1" onClick="a_1101_19_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_19_CONSTR_1X eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_20_CONSTR_1X#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_20_CONSTR_1X"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_20_CONSTR_1X#" class="textnormal" name="A_1101_ITEM_AMOUNT_20_CONSTR_1X"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_CONSTR_1X(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_20_CONSTR_1X" value="1" onClick="a_1101_20_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_20_CONSTR_1X eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">1102. <input type="text" value="#get_fees_construction.A_1102_DESCRIPTION_CONSTR_1X#" class="textnormal" name="A_1102_DESCRIPTION_CONSTR_1X"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees_construction.A_1102_PAYTO_CONSTR_1X#" class="textnormal" name="A_1102_PAYTO_CONSTR_1X"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_1102_AMOUNT_CONSTR_1X#" class="smallnormal" name="A_1102_AMOUNT_CONSTR_1X" onFocus="focus_this(this, 'smallnormal');" onBlur="unfocus_this(this, '', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1109. <input type="text" value="#get_fees_construction.A_1109_DESCRIPTION_CONSTR_1X#" class="textnormal" name="A_1109_DESCRIPTION_CONSTR_1X"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_construction.A_1109_PAYTO_CONSTR_1X#" class="textnormal" name="A_1109_PAYTO_CONSTR_1X"  onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_1109_AMOUNT_CONSTR_1X#" class="smallnormal" name="A_1109_AMOUNT_CONSTR_1X" onFocus="focus_this(this, 'smallnormal');" onBlur="unfocus_this(this, '', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1109_OUTSIDE_CONSTR_1X" value="1"  <cfif get_fees_construction.A_1109_OUTSIDE_CONSTR_1X eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1110. <input type="text" value="#get_fees_construction.A_1110_DESCRIPTION_CONSTR_1X#" class="textnormal" name="A_1110_DESCRIPTION_CONSTR_1X"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_construction.A_1110_PAYTO_CONSTR_1X#" class="textnormal" name="A_1110_PAYTO_CONSTR_1X"  onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_1110_AMOUNT_CONSTR_1X#" class="smallnormal" name="A_1110_AMOUNT_CONSTR_1X" onFocus="focus_this(this, 'smallnormal');" onBlur="unfocus_this(this, '', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1110_OUTSIDE_CONSTR_1X" value="1" <cfif get_fees_construction.A_1110_OUTSIDE_CONSTR_1X eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1111. <input type="text" value="#get_fees_construction.A_1111_DESCRIPTION_CONSTR_1X#" class="textnormal" name="A_1111_DESCRIPTION_CONSTR_1X"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_construction.A_1111_PAYTO_CONSTR_1X#" class="textnormal" name="A_1111_PAYTO_CONSTR_1X"  onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_1111_AMOUNT_CONSTR_1X#" class="smallnormal" name="A_1111_AMOUNT_CONSTR_1X" onFocus="focus_this(this, 'smallnormal');" onBlur="unfocus_this(this, '', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1111_OUTSIDE_CONSTR_1X" value="1"  <cfif get_fees_construction.A_1111_OUTSIDE_CONSTR_1X eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1112. <input type="text" value="#get_fees_construction.A_1112_DESCRIPTION_CONSTR_1X#" class="textnormal" name="A_1112_DESCRIPTION_CONSTR_1X"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_construction.A_1112_PAYTO_CONSTR_1X#" class="textnormal" name="A_1112_PAYTO_CONSTR_1X"  onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_1112_AMOUNT_CONSTR_1X#" class="smallnormal" name="A_1112_AMOUNT_CONSTR_1X" onFocus="focus_this(this, 'smallnormal');" onBlur="unfocus_this(this, '', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1112_OUTSIDE_CONSTR_1X" value="1" <cfif get_fees_construction.A_1112_OUTSIDE_CONSTR_1X eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1113. <input type="text" value="#get_fees_construction.A_1113_DESCRIPTION_CONSTR_1X#" class="textnormal" name="A_1113_DESCRIPTION_CONSTR_1X"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_construction.A_1113_PAYTO_CONSTR_1X#" class="textnormal" name="A_1113_PAYTO_CONSTR_1X"  onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_1113_AMOUNT_CONSTR_1X#" class="smallnormal" name="A_1113_AMOUNT_CONSTR_1X" onFocus="focus_this(this, 'smallnormal');" onBlur="unfocus_this(this, '', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1113_OUTSIDE_CONSTR_1X" value="1" <cfif get_fees_construction.A_1113_OUTSIDE_CONSTR_1X eq 1>checked</cfif> /></td></tr>
</table>
<!-- 1300 -->
<table width="650" summary="Type of Loan" border="1" cellspacing="0">
<tr>
<td class="bdarksilver_head">1300. Additional Settlement Charges (for Non-Title/Settlement Charges)</td>
<td class="bdarksilver_head" align="right">Amount</td>
<td class="bdarksilver_head" align="right">Outside</td>

</tr>
<!--- <tr>
<td class="bsilver">1301. <input type="text" value="#get_fees_b_construction.A_1301_DESCRIPTION_CONSTR_1X#" class="textnormal" name="A_1301_DESCRIPTION_CONSTR_1X" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b_construction.A_1301_PAYTO_CONSTR_1X#" class="textnormal" name="A_1301_PAYTO_CONSTR_1X" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b_construction.A_1301_AMOUNT_CONSTR_1X#" class="smallnormal" name="A_1301_AMOUNT_CONSTR_1X" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1301_OUTSIDE_CONSTR_1X" value="1" <cfif get_fees_b_construction.A_1301_OUTSIDE_CONSTR_1X eq 1>checked</cfif>  /></td></tr>
 ---><tr>
<td class="bsilver">1302. <input type="text" value="#get_fees_b_construction.A_1302_DESCRIPTION_CONSTR_1X#" class="textnormal" name="A_1302_DESCRIPTION_CONSTR_1X" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b_construction.A_1302_PAYTO_CONSTR_1X#" class="textnormal" name="A_1302_PAYTO_CONSTR_1X" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b_construction.A_1302_AMOUNT_CONSTR_1X#" class="smallnormal" name="A_1302_AMOUNT_CONSTR_1X" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1302_OUTSIDE_CONSTR_1X" value="1" <cfif get_fees_b_construction.A_1302_OUTSIDE_CONSTR_1X eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1303. <input type="text" value="#get_fees_b_construction.A_1303_DESCRIPTION_CONSTR_1X#" class="textnormal" name="A_1303_DESCRIPTION_CONSTR_1X" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b_construction.A_1303_PAYTO_CONSTR_1X#" class="textnormal" name="A_1303_PAYTO_CONSTR_1X" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b_construction.A_1303_AMOUNT_CONSTR_1X#" class="smallnormal" name="A_1303_AMOUNT_CONSTR_1X" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1303_OUTSIDE_CONSTR_1X" value="1" <cfif get_fees_b_construction.A_1303_OUTSIDE_CONSTR_1X eq 1>checked</cfif>  /></td></tr>
<tr>
<td class="bsilver">1304. <input type="text" value="#get_fees_b_construction.A_1304_DESCRIPTION_CONSTR_1X#" class="textnormal" name="A_1304_DESCRIPTION_CONSTR_1X" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b_construction.A_1304_PAYTO_CONSTR_1X#" class="textnormal" name="A_1304_PAYTO_CONSTR_1X" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b_construction.A_1304_AMOUNT_CONSTR_1X#" class="smallnormal" name="A_1304_AMOUNT_CONSTR_1X" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1304_OUTSIDE_CONSTR_1X" value="1" <cfif get_fees_b_construction.A_1304_OUTSIDE_CONSTR_1X eq 1>checked</cfif>  /></td></tr>

<tr>
<td class="bsilver">1305. <input type="text" value="#get_fees_b_construction.A_1305_DESCRIPTION_CONSTR_1X#" class="textnormal" name="A_1305_DESCRIPTION_CONSTR_1X" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b_construction.A_1305_PAYTO_CONSTR_1X#" class="textnormal" name="A_1305_PAYTO_CONSTR_1X" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b_construction.A_1305_AMOUNT_CONSTR_1X#" class="smallnormal" name="A_1305_AMOUNT_CONSTR_1X" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1305_OUTSIDE_CONSTR_1X" value="1" <cfif get_fees_b_construction.A_1305_OUTSIDE_CONSTR_1X eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1306. <input type="text" value="#get_fees_b_construction.A_1306_DESCRIPTION_CONSTR_1X#" class="textnormal" name="A_1306_DESCRIPTION_CONSTR_1X" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b_construction.A_1306_PAYTO_CONSTR_1X#" class="textnormal" name="A_1306_PAYTO_CONSTR_1X" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b_construction.A_1306_AMOUNT_CONSTR_1X#" class="smallnormal" name="A_1306_AMOUNT_CONSTR_1X" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1306_OUTSIDE_CONSTR_1X" value="1"  <cfif get_fees_b_construction.A_1306_OUTSIDE_CONSTR_1X eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1307. <input type="text" value="#get_fees_b_construction.A_1307_DESCRIPTION_CONSTR_1X#" class="textnormal" name="A_1307_DESCRIPTION_CONSTR_1X" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b_construction.A_1307_PAYTO_CONSTR_1X#" class="textnormal" name="A_1307_PAYTO_CONSTR_1X" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b_construction.A_1307_AMOUNT_CONSTR_1X#" class="smallnormal" name="A_1307_AMOUNT_CONSTR_1X" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1307_OUTSIDE_CONSTR_1X" value="1" <cfif get_fees_b_construction.A_1307_OUTSIDE_CONSTR_1X eq 1>checked</cfif>  /></td></tr>
<tr>
<td class="bsilver">1308. <input type="text" value="#get_fees_b_construction.A_1308_DESCRIPTION_CONSTR_1X#" class="textnormal" name="A_1308_DESCRIPTION_CONSTR_1X" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b_construction.A_1308_PAYTO_CONSTR_1X#" class="textnormal" name="A_1308_PAYTO_CONSTR_1X" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b_construction.A_1308_AMOUNT_CONSTR_1X#" class="smallnormal" name="A_1308_AMOUNT_CONSTR_1X" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1308_OUTSIDE_CONSTR_1X" value="1" <cfif get_fees_b_construction.A_1308_OUTSIDE_CONSTR_1X eq 1>checked</cfif>  /></td></tr>
</table>
<br>
<br>
<br>
<span class="page_title">CONSTRUCTION - 2X CLOSE</span><BR>
<!-- 800 -->
<table width="650" summary="Type of Loan" border="1" cellspacing="0">
<tr><td height="4" colspan="6"></td></tr>
<tr>
<td class="bdarksilver_head">800. Items Payable in Connection with Loan</td>
<td class="bdarksilver_head" align="right">Amount</td>
</tr>
<tr>
<td class="bsilver">801. <input type="text" value="#get_fees_construction.A_0801_DESCRIPTION_CONSTR_2X#" class="textnormal" name="A_0801_DESCRIPTION_CONSTR_2X" onFocus="this.blur();" style="width:381;" /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_0801_AMOUNT_CONSTR_2X#" class="smallnormal" name="A_0801_AMOUNT_CONSTR_2X" onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<tr>
<td class="bsilver">802. <input type="text" value="#get_fees_construction.A_0802_DESCRIPTION_CONSTR_2X#" class="textnormal" name="A_0802_DESCRIPTION_CONSTR_2X" onFocus="this.blur();"  style="width:381;"  /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_0802_AMOUNT_CONSTR_2X#" class="smallnormal" name="A_0802_AMOUNT_CONSTR_2X"  onFocus="focus_this(this, 'smallnormal');"  /></td>
</tr>
<tr>
<td class="bsilver">804. <input type="text" value="#get_fees_construction.A_0804_DESCRIPTION_CONSTR_2X#" class="textnormal" name="A_0804_DESCRIPTION_CONSTR_2X" onFocus="this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees_construction.A_0804_PAYTO_CONSTR_2X#" class="textnormal" name="A_0804_PAYTO_CONSTR_2X"   onFocus="focus_this(this, 'textnormal');"  /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_0804_AMOUNT_CONSTR_2X#" class="smallnormal" name="A_0804_AMOUNT_CONSTR_2X"   onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">805. <input type="text" value="#get_fees_construction.A_0805_DESCRIPTION_CONSTR_2X#" class="textnormal" name="A_0805_DESCRIPTION_CONSTR_2X" onFocus="this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees_construction.A_0805_PAYTO_CONSTR_2X#" class="textnormal" name="A_0805_PAYTO_CONSTR_2X"    onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_0805_AMOUNT_CONSTR_2X#" class="smallnormal" name="A_0805_AMOUNT_CONSTR_2X"  onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">806. <input type="text" value="#get_fees_construction.A_0806_DESCRIPTION_CONSTR_2X#" class="textnormal" name="A_0806_DESCRIPTION_CONSTR_2X" onFocus="this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees_construction.A_0806_PAYTO_CONSTR_2X#" class="textnormal" name="A_0806_PAYTO_CONSTR_2X"    onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_0806_AMOUNT_CONSTR_2X#" class="smallnormal" name="A_0806_AMOUNT_CONSTR_2X"   onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>

<tr>
<td class="bsilver">807. <input type="text" value="#get_fees_construction.A_0807_DESCRIPTION_CONSTR_2X#" class="textnormal" name="A_0807_DESCRIPTION_CONSTR_2X" onFocus="this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees_construction.A_0807_PAYTO_CONSTR_2X#" class="textnormal" name="A_0807_PAYTO_CONSTR_2X"   onFocus="focus_this(this, 'textnormal');"  /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_0807_AMOUNT_CONSTR_2X#" class="smallnormal" name="A_0807_AMOUNT_CONSTR_2X"  onFocus="focus_this(this, 'smallnormal');"  /></td>
</tr>
<tr>
<td class="bsilver">808. <input type="text" value="#get_fees_construction.A_0808_DESCRIPTION_CONSTR_2X#" class="textnormal" name="A_0808_DESCRIPTION_CONSTR_2X"     onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_construction.A_0808_PAYTO_CONSTR_2X#" class="textnormal" name="A_0808_PAYTO_CONSTR_2X"    onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_0808_AMOUNT_CONSTR_2X#" class="smallnormal" name="A_0808_AMOUNT_CONSTR_2X"   onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">809. <input type="text" value="#get_fees_construction.A_0809_DESCRIPTION_CONSTR_2X#" class="textnormal" name="A_0809_DESCRIPTION_CONSTR_2X"    onFocus="focus_this(this, 'textnormal');"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees_construction.A_0809_PAYTO_CONSTR_2X#" class="textnormal" name="A_0809_PAYTO_CONSTR_2X"   onFocus="focus_this(this, 'textnormal');"  /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_0809_AMOUNT_CONSTR_2X#" class="smallnormal" name="A_0809_AMOUNT_CONSTR_2X"  onFocus="focus_this(this, 'smallnormal');"  /></td>
</tr>
<tr>
<td class="bsilver">810. <input type="text" value="#get_fees_construction.A_0810_DESCRIPTION_CONSTR_2X#" class="textnormal" name="A_0810_DESCRIPTION_CONSTR_2X"    onFocus="focus_this(this, 'textnormal');"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees_construction.A_0810_PAYTO_CONSTR_2X#" class="textnormal" name="A_0810_PAYTO_CONSTR_2X"    onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_0810_AMOUNT_CONSTR_2X#" class="smallnormal" name="A_0810_AMOUNT_CONSTR_2X"   onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">811. <input type="text" value="#get_fees_construction.A_0811_DESCRIPTION_CONSTR_2X#" class="textnormal" name="A_0811_DESCRIPTION_CONSTR_2X"    onFocus="focus_this(this, 'textnormal');"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees_construction.A_0811_PAYTO_CONSTR_2X#" class="textnormal" name="A_0811_PAYTO_CONSTR_2X"   onFocus="focus_this(this, 'textnormal');"  /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_0811_AMOUNT_CONSTR_2X#" class="smallnormal" name="A_0811_AMOUNT_CONSTR_2X"  onFocus="focus_this(this, 'smallnormal');"  /></td>
</tr>
<tr>
<td class="bsilver">812. <input type="text" value="#get_fees_construction.A_0812_DESCRIPTION_CONSTR_2X#" class="textnormal" name="A_0812_DESCRIPTION_CONSTR_2X"    onFocus="focus_this(this, 'textnormal');"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees_construction.A_0812_PAYTO_CONSTR_2X#" class="textnormal" name="A_0812_PAYTO_CONSTR_2X" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_0812_AMOUNT_CONSTR_2X#" class="smallnormal" name="A_0812_AMOUNT_CONSTR_2X" onFocus="focus_this(this, 'smallnormal');" /></td>
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
<td class="bordered"><input type="text"  value="#get_fees_construction.A_1101_AMOUNT_CONSTR_2X#" class="smallnormal" name="A_1101_AMOUNT_CONSTR_2X" onFocus="blur();" onBlur="a_1101_amount(); unfocus_this(this, '', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Itemized 1101 Charges</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_01_CONSTR_2X#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_01_CONSTR_2X"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_01_CONSTR_2X#" class="textnormal" name="A_1101_ITEM_AMOUNT_01_CONSTR_2X"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_CONSTR_2X(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_01_CONSTR_2X" value="1" onClick="a_1101_01_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_01_CONSTR_2X eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_02_CONSTR_2X#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_02_CONSTR_2X"   onFocus="focus_this(this, 'textnormal');" onBlur=" unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_02_CONSTR_2X#" class="textnormal" name="A_1101_ITEM_AMOUNT_02_CONSTR_2X"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_CONSTR_2X(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_02_CONSTR_2X" value="1" onClick="a_1101_02_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_02_CONSTR_2X eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_03_CONSTR_2X#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_03_CONSTR_2X"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_03_CONSTR_2X#" class="textnormal" name="A_1101_ITEM_AMOUNT_03_CONSTR_2X"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_CONSTR_2X(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_03_CONSTR_2X" value="1" onClick="a_1101_03_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_03_CONSTR_2X eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_04_CONSTR_2X#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_04_CONSTR_2X"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_04_CONSTR_2X#" class="textnormal" name="A_1101_ITEM_AMOUNT_04_CONSTR_2X"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_CONSTR_2X(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_04_CONSTR_2X" value="1" onClick="a_1101_04_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_04_CONSTR_2X eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_05_CONSTR_2X#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_05_CONSTR_2X"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_05_CONSTR_2X#" class="textnormal" name="A_1101_ITEM_AMOUNT_05_CONSTR_2X"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_CONSTR_2X(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_05_CONSTR_2X" value="1" onClick="a_1101_05_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_05_CONSTR_2X eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_06_CONSTR_2X#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_06_CONSTR_2X"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_06_CONSTR_2X#" class="textnormal" name="A_1101_ITEM_AMOUNT_06_CONSTR_2X"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_CONSTR_2X(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_06_CONSTR_2X" value="1" onClick="a_1101_06_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_06_CONSTR_2X eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_07_CONSTR_2X#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_07_CONSTR_2X"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_07_CONSTR_2X#" class="textnormal" name="A_1101_ITEM_AMOUNT_07_CONSTR_2X"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_CONSTR_2X(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_07_CONSTR_2X" value="1" onClick="a_1101_07_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_07_CONSTR_2X eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_08_CONSTR_2X#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_08_CONSTR_2X"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_08_CONSTR_2X#" class="textnormal" name="A_1101_ITEM_AMOUNT_08_CONSTR_2X"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_CONSTR_2X(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_08_CONSTR_2X" value="1" onClick="a_1101_08_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_08_CONSTR_2X eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_09_CONSTR_2X#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_09_CONSTR_2X"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_09_CONSTR_2X#" class="textnormal" name="A_1101_ITEM_AMOUNT_09_CONSTR_2X"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_CONSTR_2X(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_09_CONSTR_2X" value="1" onClick="a_1101_09_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_09_CONSTR_2X eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_10_CONSTR_2X#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_10_CONSTR_2X"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_10_CONSTR_2X#" class="textnormal" name="A_1101_ITEM_AMOUNT_10_CONSTR_2X"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_CONSTR_2X(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_10_CONSTR_2X" value="1" onClick="a_1101_10_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_10_CONSTR_2X eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_11_CONSTR_2X#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_11_CONSTR_2X"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_11_CONSTR_2X#" class="textnormal" name="A_1101_ITEM_AMOUNT_11_CONSTR_2X"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_CONSTR_2X(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_11_CONSTR_2X" value="1" onClick="a_1101_11_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_11_CONSTR_2X eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_12_CONSTR_2X#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_12_CONSTR_2X"   onFocus="focus_this(this, 'textnormal');" onBlur=" unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_12_CONSTR_2X#" class="textnormal" name="A_1101_ITEM_AMOUNT_12_CONSTR_2X"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_CONSTR_2X(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_12_CONSTR_2X" value="1" onClick="a_1101_12_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_12_CONSTR_2X eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_13_CONSTR_2X#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_13_CONSTR_2X"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_13_CONSTR_2X#" class="textnormal" name="A_1101_ITEM_AMOUNT_13_CONSTR_2X"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_CONSTR_2X(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>

<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_13_CONSTR_2X" value="1" onClick="a_1101_13_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_13_CONSTR_2X eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_14_CONSTR_2X#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_14_CONSTR_2X"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_14_CONSTR_2X#" class="textnormal" name="A_1101_ITEM_AMOUNT_14_CONSTR_2X"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_CONSTR_2X(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_14_CONSTR_2X" value="1" onClick="a_1101_14_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_14_CONSTR_2X eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_15_CONSTR_2X#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_15_CONSTR_2X"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_15_CONSTR_2X#" class="textnormal" name="A_1101_ITEM_AMOUNT_15_CONSTR_2X"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_CONSTR_2X(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_15_CONSTR_2X" value="1" onClick="a_1101_15_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_15_CONSTR_2X eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_16_CONSTR_2X#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_16_CONSTR_2X"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_16_CONSTR_2X#" class="textnormal" name="A_1101_ITEM_AMOUNT_16_CONSTR_2X"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_CONSTR_2X(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_16_CONSTR_2X" value="1" onClick="a_1101_16_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_16_CONSTR_2X eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_17_CONSTR_2X#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_17_CONSTR_2X"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_17_CONSTR_2X#" class="textnormal" name="A_1101_ITEM_AMOUNT_17_CONSTR_2X"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_CONSTR_2X(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_17_CONSTR_2X" value="1" onClick="a_1101_17_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_17_CONSTR_2X eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_18_CONSTR_2X#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_18_CONSTR_2X"   onFocus="focus_this(this, 'textnormal');" onBlur=" unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_18_CONSTR_2X#" class="textnormal" name="A_1101_ITEM_AMOUNT_18_CONSTR_2X"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_CONSTR_2X(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_18_CONSTR_2X" value="1" onClick="a_1101_18_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_18_CONSTR_2X eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_19_CONSTR_2X#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_19_CONSTR_2X"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_19_CONSTR_2X#" class="textnormal" name="A_1101_ITEM_AMOUNT_19_CONSTR_2X"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_CONSTR_2X(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_19_CONSTR_2X" value="1" onClick="a_1101_19_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_19_CONSTR_2X eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_20_CONSTR_2X#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_20_CONSTR_2X"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_20_CONSTR_2X#" class="textnormal" name="A_1101_ITEM_AMOUNT_20_CONSTR_2X"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_CONSTR_2X(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_20_CONSTR_2X" value="1" onClick="a_1101_20_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_20_CONSTR_2X eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">1102. <input type="text" value="#get_fees_construction.A_1102_DESCRIPTION_CONSTR_2X#" class="textnormal" name="A_1102_DESCRIPTION_CONSTR_2X"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees_construction.A_1102_PAYTO_CONSTR_2X#" class="textnormal" name="A_1102_PAYTO_CONSTR_2X"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_1102_AMOUNT_CONSTR_2X#" class="smallnormal" name="A_1102_AMOUNT_CONSTR_2X" onFocus="focus_this(this, 'smallnormal');" onBlur="unfocus_this(this, '', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1109. <input type="text" value="#get_fees_construction.A_1109_DESCRIPTION_CONSTR_2X#" class="textnormal" name="A_1109_DESCRIPTION_CONSTR_2X"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_construction.A_1109_PAYTO_CONSTR_2X#" class="textnormal" name="A_1109_PAYTO_CONSTR_2X"  onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_1109_AMOUNT_CONSTR_2X#" class="smallnormal" name="A_1109_AMOUNT_CONSTR_2X" onFocus="focus_this(this, 'smallnormal');" onBlur="unfocus_this(this, '', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1109_OUTSIDE_CONSTR_2X" value="1"  <cfif get_fees_construction.A_1109_OUTSIDE_CONSTR_2X eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1110. <input type="text" value="#get_fees_construction.A_1110_DESCRIPTION_CONSTR_2X#" class="textnormal" name="A_1110_DESCRIPTION_CONSTR_2X"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_construction.A_1110_PAYTO_CONSTR_2X#" class="textnormal" name="A_1110_PAYTO_CONSTR_2X"  onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_1110_AMOUNT_CONSTR_2X#" class="smallnormal" name="A_1110_AMOUNT_CONSTR_2X" onFocus="focus_this(this, 'smallnormal');" onBlur="unfocus_this(this, '', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1110_OUTSIDE_CONSTR_2X" value="1" <cfif get_fees_construction.A_1110_OUTSIDE_CONSTR_2X eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1111. <input type="text" value="#get_fees_construction.A_1111_DESCRIPTION_CONSTR_2X#" class="textnormal" name="A_1111_DESCRIPTION_CONSTR_2X"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_construction.A_1111_PAYTO_CONSTR_2X#" class="textnormal" name="A_1111_PAYTO_CONSTR_2X"  onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_1111_AMOUNT_CONSTR_2X#" class="smallnormal" name="A_1111_AMOUNT_CONSTR_2X" onFocus="focus_this(this, 'smallnormal');" onBlur="unfocus_this(this, '', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1111_OUTSIDE_CONSTR_2X" value="1"  <cfif get_fees_construction.A_1111_OUTSIDE_CONSTR_2X eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1112. <input type="text" value="#get_fees_construction.A_1112_DESCRIPTION_CONSTR_2X#" class="textnormal" name="A_1112_DESCRIPTION_CONSTR_2X"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_construction.A_1112_PAYTO_CONSTR_2X#" class="textnormal" name="A_1112_PAYTO_CONSTR_2X"  onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_1112_AMOUNT_CONSTR_2X#" class="smallnormal" name="A_1112_AMOUNT_CONSTR_2X" onFocus="focus_this(this, 'smallnormal');" onBlur="unfocus_this(this, '', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1112_OUTSIDE_CONSTR_2X" value="1" <cfif get_fees_construction.A_1112_OUTSIDE_CONSTR_2X eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1113. <input type="text" value="#get_fees_construction.A_1113_DESCRIPTION_CONSTR_2X#" class="textnormal" name="A_1113_DESCRIPTION_CONSTR_2X"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_construction.A_1113_PAYTO_CONSTR_2X#" class="textnormal" name="A_1113_PAYTO_CONSTR_2X"  onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_1113_AMOUNT_CONSTR_2X#" class="smallnormal" name="A_1113_AMOUNT_CONSTR_2X" onFocus="focus_this(this, 'smallnormal');" onBlur="unfocus_this(this, '', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1113_OUTSIDE_CONSTR_2X" value="1" <cfif get_fees_construction.A_1113_OUTSIDE_CONSTR_2X eq 1>checked</cfif> /></td></tr>
</table>
<!-- 1300 -->
<table width="650" summary="Type of Loan" border="1" cellspacing="0">
<tr>
<td class="bdarksilver_head">1300. Additional Settlement Charges (for Non-Title/Settlement Charges)</td>
<td class="bdarksilver_head" align="right">Amount</td>
<td class="bdarksilver_head" align="right">Outside</td>

</tr>
<!--- <tr>
<td class="bsilver">1301. <input type="text" value="#get_fees_b_construction.A_1301_DESCRIPTION_CONSTR_2X#" class="textnormal" name="A_1301_DESCRIPTION_CONSTR_2X" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b_construction.A_1301_PAYTO_CONSTR_2X#" class="textnormal" name="A_1301_PAYTO_CONSTR_2X" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b_construction.A_1301_AMOUNT_CONSTR_2X#" class="smallnormal" name="A_1301_AMOUNT_CONSTR_2X" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1301_OUTSIDE_CONSTR_2X" value="1" <cfif get_fees_b_construction.A_1301_OUTSIDE_CONSTR_2X eq 1>checked</cfif>  /></td></tr>
 ---><tr>
<td class="bsilver">1302. <input type="text" value="#get_fees_b_construction.A_1302_DESCRIPTION_CONSTR_2X#" class="textnormal" name="A_1302_DESCRIPTION_CONSTR_2X" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b_construction.A_1302_PAYTO_CONSTR_2X#" class="textnormal" name="A_1302_PAYTO_CONSTR_2X" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b_construction.A_1302_AMOUNT_CONSTR_2X#" class="smallnormal" name="A_1302_AMOUNT_CONSTR_2X" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1302_OUTSIDE_CONSTR_2X" value="1" <cfif get_fees_b_construction.A_1302_OUTSIDE_CONSTR_2X eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1303. <input type="text" value="#get_fees_b_construction.A_1303_DESCRIPTION_CONSTR_2X#" class="textnormal" name="A_1303_DESCRIPTION_CONSTR_2X" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b_construction.A_1303_PAYTO_CONSTR_2X#" class="textnormal" name="A_1303_PAYTO_CONSTR_2X" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b_construction.A_1303_AMOUNT_CONSTR_2X#" class="smallnormal" name="A_1303_AMOUNT_CONSTR_2X" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1303_OUTSIDE_CONSTR_2X" value="1" <cfif get_fees_b_construction.A_1303_OUTSIDE_CONSTR_2X eq 1>checked</cfif>  /></td></tr>
<tr>
<td class="bsilver">1304. <input type="text" value="#get_fees_b_construction.A_1304_DESCRIPTION_CONSTR_2X#" class="textnormal" name="A_1304_DESCRIPTION_CONSTR_2X" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b_construction.A_1304_PAYTO_CONSTR_2X#" class="textnormal" name="A_1304_PAYTO_CONSTR_2X" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b_construction.A_1304_AMOUNT_CONSTR_2X#" class="smallnormal" name="A_1304_AMOUNT_CONSTR_2X" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1304_OUTSIDE_CONSTR_2X" value="1" <cfif get_fees_b_construction.A_1304_OUTSIDE_CONSTR_2X eq 1>checked</cfif>  /></td></tr>

<tr>
<td class="bsilver">1305. <input type="text" value="#get_fees_b_construction.A_1305_DESCRIPTION_CONSTR_2X#" class="textnormal" name="A_1305_DESCRIPTION_CONSTR_2X" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b_construction.A_1305_PAYTO_CONSTR_2X#" class="textnormal" name="A_1305_PAYTO_CONSTR_2X" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b_construction.A_1305_AMOUNT_CONSTR_2X#" class="smallnormal" name="A_1305_AMOUNT_CONSTR_2X" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1305_OUTSIDE_CONSTR_2X" value="1" <cfif get_fees_b_construction.A_1305_OUTSIDE_CONSTR_2X eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1306. <input type="text" value="#get_fees_b_construction.A_1306_DESCRIPTION_CONSTR_2X#" class="textnormal" name="A_1306_DESCRIPTION_CONSTR_2X" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b_construction.A_1306_PAYTO_CONSTR_2X#" class="textnormal" name="A_1306_PAYTO_CONSTR_2X" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b_construction.A_1306_AMOUNT_CONSTR_2X#" class="smallnormal" name="A_1306_AMOUNT_CONSTR_2X" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1306_OUTSIDE_CONSTR_2X" value="1"  <cfif get_fees_b_construction.A_1306_OUTSIDE_CONSTR_2X eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1307. <input type="text" value="#get_fees_b_construction.A_1307_DESCRIPTION_CONSTR_2X#" class="textnormal" name="A_1307_DESCRIPTION_CONSTR_2X" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b_construction.A_1307_PAYTO_CONSTR_2X#" class="textnormal" name="A_1307_PAYTO_CONSTR_2X" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b_construction.A_1307_AMOUNT_CONSTR_2X#" class="smallnormal" name="A_1307_AMOUNT_CONSTR_2X" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1307_OUTSIDE_CONSTR_2X" value="1" <cfif get_fees_b_construction.A_1307_OUTSIDE_CONSTR_2X eq 1>checked</cfif>  /></td></tr>
<tr>
<td class="bsilver">1308. <input type="text" value="#get_fees_b_construction.A_1308_DESCRIPTION_CONSTR_2X#" class="textnormal" name="A_1308_DESCRIPTION_CONSTR_2X" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b_construction.A_1308_PAYTO_CONSTR_2X#" class="textnormal" name="A_1308_PAYTO_CONSTR_2X" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b_construction.A_1308_AMOUNT_CONSTR_2X#" class="smallnormal" name="A_1308_AMOUNT_CONSTR_2X" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1308_OUTSIDE_CONSTR_2X" value="1" <cfif get_fees_b_construction.A_1308_OUTSIDE_CONSTR_2X eq 1>checked</cfif>  /></td></tr>
</table>
<br>
<br>
<br>
<span class="page_title">CONSTRUCTION - END LOAN</span><BR>
<!-- 800 -->
<table width="650" summary="Type of Loan" border="1" cellspacing="0">
<tr><td height="4" colspan="6"></td></tr>
<tr>
<td class="bdarksilver_head">800. Items Payable in Connection with Loan</td>
<td class="bdarksilver_head" align="right">Amount</td>
</tr>
<tr>
<td class="bsilver">801. <input type="text" value="#get_fees_construction.A_0801_DESCRIPTION_END_LOAN#" class="textnormal" name="A_0801_DESCRIPTION_END_LOAN" onFocus="this.blur();" style="width:381;" /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_0801_AMOUNT_END_LOAN#" class="smallnormal" name="A_0801_AMOUNT_END_LOAN" onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<tr>
<td class="bsilver">802. <input type="text" value="#get_fees_construction.A_0802_DESCRIPTION_END_LOAN#" class="textnormal" name="A_0802_DESCRIPTION_END_LOAN" onFocus="this.blur();"  style="width:381;"  /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_0802_AMOUNT_END_LOAN#" class="smallnormal" name="A_0802_AMOUNT_END_LOAN"  onFocus="focus_this(this, 'smallnormal');"  /></td>
</tr>
<tr>
<td class="bsilver">804. <input type="text" value="#get_fees_construction.A_0804_DESCRIPTION_END_LOAN#" class="textnormal" name="A_0804_DESCRIPTION_END_LOAN" onFocus="this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees_construction.A_0804_PAYTO_END_LOAN#" class="textnormal" name="A_0804_PAYTO_END_LOAN"   onFocus="focus_this(this, 'textnormal');"  /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_0804_AMOUNT_END_LOAN#" class="smallnormal" name="A_0804_AMOUNT_END_LOAN"   onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">805. <input type="text" value="#get_fees_construction.A_0805_DESCRIPTION_END_LOAN#" class="textnormal" name="A_0805_DESCRIPTION_END_LOAN" onFocus="this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees_construction.A_0805_PAYTO_END_LOAN#" class="textnormal" name="A_0805_PAYTO_END_LOAN"    onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_0805_AMOUNT_END_LOAN#" class="smallnormal" name="A_0805_AMOUNT_END_LOAN"  onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">806. <input type="text" value="#get_fees_construction.A_0806_DESCRIPTION_END_LOAN#" class="textnormal" name="A_0806_DESCRIPTION_END_LOAN" onFocus="this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees_construction.A_0806_PAYTO_END_LOAN#" class="textnormal" name="A_0806_PAYTO_END_LOAN"    onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_0806_AMOUNT_END_LOAN#" class="smallnormal" name="A_0806_AMOUNT_END_LOAN"   onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>

<tr>
<td class="bsilver">807. <input type="text" value="#get_fees_construction.A_0807_DESCRIPTION_END_LOAN#" class="textnormal" name="A_0807_DESCRIPTION_END_LOAN" onFocus="this.blur();"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees_construction.A_0807_PAYTO_END_LOAN#" class="textnormal" name="A_0807_PAYTO_END_LOAN"   onFocus="focus_this(this, 'textnormal');"  /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_0807_AMOUNT_END_LOAN#" class="smallnormal" name="A_0807_AMOUNT_END_LOAN"  onFocus="focus_this(this, 'smallnormal');"  /></td>
</tr>
<tr>
<td class="bsilver">808. <input type="text" value="#get_fees_construction.A_0808_DESCRIPTION_END_LOAN#" class="textnormal" name="A_0808_DESCRIPTION_END_LOAN"     onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_construction.A_0808_PAYTO_END_LOAN#" class="textnormal" name="A_0808_PAYTO_END_LOAN"    onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_0808_AMOUNT_END_LOAN#" class="smallnormal" name="A_0808_AMOUNT_END_LOAN"   onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">809. <input type="text" value="#get_fees_construction.A_0809_DESCRIPTION_END_LOAN#" class="textnormal" name="A_0809_DESCRIPTION_END_LOAN"    onFocus="focus_this(this, 'textnormal');"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees_construction.A_0809_PAYTO_END_LOAN#" class="textnormal" name="A_0809_PAYTO_END_LOAN"   onFocus="focus_this(this, 'textnormal');"  /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_0809_AMOUNT_END_LOAN#" class="smallnormal" name="A_0809_AMOUNT_END_LOAN"  onFocus="focus_this(this, 'smallnormal');"  /></td>
</tr>
<tr>
<td class="bsilver">810. <input type="text" value="#get_fees_construction.A_0810_DESCRIPTION_END_LOAN#" class="textnormal" name="A_0810_DESCRIPTION_END_LOAN"    onFocus="focus_this(this, 'textnormal');"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees_construction.A_0810_PAYTO_END_LOAN#" class="textnormal" name="A_0810_PAYTO_END_LOAN"    onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_0810_AMOUNT_END_LOAN#" class="smallnormal" name="A_0810_AMOUNT_END_LOAN"   onFocus="focus_this(this, 'smallnormal');" /></td>
</tr>
<tr>
<td class="bsilver">811. <input type="text" value="#get_fees_construction.A_0811_DESCRIPTION_END_LOAN#" class="textnormal" name="A_0811_DESCRIPTION_END_LOAN"    onFocus="focus_this(this, 'textnormal');"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees_construction.A_0811_PAYTO_END_LOAN#" class="textnormal" name="A_0811_PAYTO_END_LOAN"   onFocus="focus_this(this, 'textnormal');"  /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_0811_AMOUNT_END_LOAN#" class="smallnormal" name="A_0811_AMOUNT_END_LOAN"  onFocus="focus_this(this, 'smallnormal');"  /></td>
</tr>
<tr>
<td class="bsilver">812. <input type="text" value="#get_fees_construction.A_0812_DESCRIPTION_END_LOAN#" class="textnormal" name="A_0812_DESCRIPTION_END_LOAN"    onFocus="focus_this(this, 'textnormal');"  /> &nbsp;to &nbsp;<input type="text" value="#get_fees_construction.A_0812_PAYTO_END_LOAN#" class="textnormal" name="A_0812_PAYTO_END_LOAN" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_0812_AMOUNT_END_LOAN#" class="smallnormal" name="A_0812_AMOUNT_END_LOAN" onFocus="focus_this(this, 'smallnormal');" /></td>
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
<td class="bordered"><input type="text"  value="#get_fees_construction.A_1101_AMOUNT_END_LOAN#" class="smallnormal" name="A_1101_AMOUNT_END_LOAN" onFocus="blur();" onBlur="a_1101_amount(); unfocus_this(this, '', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Itemized 1101 Charges</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_01_END_LOAN#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_01_END_LOAN"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_01_END_LOAN#" class="textnormal" name="A_1101_ITEM_AMOUNT_01_END_LOAN"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_END_LOAN(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_01_END_LOAN" value="1" onClick="a_1101_01_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_01_END_LOAN eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_02_END_LOAN#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_02_END_LOAN"   onFocus="focus_this(this, 'textnormal');" onBlur=" unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_02_END_LOAN#" class="textnormal" name="A_1101_ITEM_AMOUNT_02_END_LOAN"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_END_LOAN(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_02_END_LOAN" value="1" onClick="a_1101_02_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_02_END_LOAN eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_03_END_LOAN#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_03_END_LOAN"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_03_END_LOAN#" class="textnormal" name="A_1101_ITEM_AMOUNT_03_END_LOAN"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_END_LOAN(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_03_END_LOAN" value="1" onClick="a_1101_03_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_03_END_LOAN eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_04_END_LOAN#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_04_END_LOAN"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_04_END_LOAN#" class="textnormal" name="A_1101_ITEM_AMOUNT_04_END_LOAN"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_END_LOAN(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_04_END_LOAN" value="1" onClick="a_1101_04_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_04_END_LOAN eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_05_END_LOAN#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_05_END_LOAN"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_05_END_LOAN#" class="textnormal" name="A_1101_ITEM_AMOUNT_05_END_LOAN"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_END_LOAN(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_05_END_LOAN" value="1" onClick="a_1101_05_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_05_END_LOAN eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_06_END_LOAN#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_06_END_LOAN"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_06_END_LOAN#" class="textnormal" name="A_1101_ITEM_AMOUNT_06_END_LOAN"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_END_LOAN(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_06_END_LOAN" value="1" onClick="a_1101_06_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_06_END_LOAN eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_07_END_LOAN#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_07_END_LOAN"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_07_END_LOAN#" class="textnormal" name="A_1101_ITEM_AMOUNT_07_END_LOAN"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_END_LOAN(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_07_END_LOAN" value="1" onClick="a_1101_07_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_07_END_LOAN eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_08_END_LOAN#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_08_END_LOAN"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_08_END_LOAN#" class="textnormal" name="A_1101_ITEM_AMOUNT_08_END_LOAN"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_END_LOAN(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_08_END_LOAN" value="1" onClick="a_1101_08_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_08_END_LOAN eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_09_END_LOAN#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_09_END_LOAN"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_09_END_LOAN#" class="textnormal" name="A_1101_ITEM_AMOUNT_09_END_LOAN"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_END_LOAN(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_09_END_LOAN" value="1" onClick="a_1101_09_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_09_END_LOAN eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_10_END_LOAN#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_10_END_LOAN"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_10_END_LOAN#" class="textnormal" name="A_1101_ITEM_AMOUNT_10_END_LOAN"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_END_LOAN(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_10_END_LOAN" value="1" onClick="a_1101_10_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_10_END_LOAN eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_11_END_LOAN#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_11_END_LOAN"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_11_END_LOAN#" class="textnormal" name="A_1101_ITEM_AMOUNT_11_END_LOAN"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_END_LOAN(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_11_END_LOAN" value="1" onClick="a_1101_11_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_11_END_LOAN eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_12_END_LOAN#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_12_END_LOAN"   onFocus="focus_this(this, 'textnormal');" onBlur=" unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_12_END_LOAN#" class="textnormal" name="A_1101_ITEM_AMOUNT_12_END_LOAN"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_END_LOAN(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_12_END_LOAN" value="1" onClick="a_1101_12_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_12_END_LOAN eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_13_END_LOAN#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_13_END_LOAN"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_13_END_LOAN#" class="textnormal" name="A_1101_ITEM_AMOUNT_13_END_LOAN"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_END_LOAN(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_13_END_LOAN" value="1" onClick="a_1101_13_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_13_END_LOAN eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_14_END_LOAN#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_14_END_LOAN"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_14_END_LOAN#" class="textnormal" name="A_1101_ITEM_AMOUNT_14_END_LOAN"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_END_LOAN(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_14_END_LOAN" value="1" onClick="a_1101_14_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_14_END_LOAN eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_15_END_LOAN#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_15_END_LOAN"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_15_END_LOAN#" class="textnormal" name="A_1101_ITEM_AMOUNT_15_END_LOAN"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_END_LOAN(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_15_END_LOAN" value="1" onClick="a_1101_15_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_15_END_LOAN eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_16_END_LOAN#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_16_END_LOAN"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_16_END_LOAN#" class="textnormal" name="A_1101_ITEM_AMOUNT_16_END_LOAN"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_END_LOAN(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_16_END_LOAN" value="1" onClick="a_1101_16_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_16_END_LOAN eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_17_END_LOAN#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_17_END_LOAN"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_17_END_LOAN#" class="textnormal" name="A_1101_ITEM_AMOUNT_17_END_LOAN"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_END_LOAN(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_17_END_LOAN" value="1" onClick="a_1101_17_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_17_END_LOAN eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_18_END_LOAN#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_18_END_LOAN"   onFocus="focus_this(this, 'textnormal');" onBlur=" unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_18_END_LOAN#" class="textnormal" name="A_1101_ITEM_AMOUNT_18_END_LOAN"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_END_LOAN(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_18_END_LOAN" value="1" onClick="a_1101_18_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_18_END_LOAN eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_19_END_LOAN#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_19_END_LOAN"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_19_END_LOAN#" class="textnormal" name="A_1101_ITEM_AMOUNT_19_END_LOAN"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_END_LOAN(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_19_END_LOAN" value="1" onClick="a_1101_19_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_19_END_LOAN eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_DESCRIPTION_20_END_LOAN#" class="textnormal" name="A_1101_ITEM_DESCRIPTION_20_END_LOAN"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="#get_fees_construction.A_1101_ITEM_AMOUNT_20_END_LOAN#" class="textnormal" name="A_1101_ITEM_AMOUNT_20_END_LOAN"  onFocus="focus_this(this, 'textnormal');" onBlur="roll_up_1101_END_LOAN(); unfocus_this(this, '', 'text');" /></td>
<td class="bordered">&nbsp;</td>
<td class="bordered">&nbsp;</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1101_ITEM_SELECTABLE_20_END_LOAN" value="1" onClick="a_1101_20_selectable();" <cfif find_itemized_construction.A_1101_ITEM_SELECTABLE_20_END_LOAN eq 1>checked </cfif> />
</td>
</tr>
<tr>
<td class="bsilver">1102. <input type="text" value="#get_fees_construction.A_1102_DESCRIPTION_END_LOAN#" class="textnormal" name="A_1102_DESCRIPTION_END_LOAN"   /> &nbsp;to &nbsp;<input type="text" value="#get_fees_construction.A_1102_PAYTO_END_LOAN#" class="textnormal" name="A_1102_PAYTO_END_LOAN"  onFocus="focus_this(this, 'textnormal');" onBlur="a_1102_payto(); unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_1102_AMOUNT_END_LOAN#" class="smallnormal" name="A_1102_AMOUNT_END_LOAN" onFocus="focus_this(this, 'smallnormal');" onBlur="unfocus_this(this, '', 'small');" /></td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1109. <input type="text" value="#get_fees_construction.A_1109_DESCRIPTION_END_LOAN#" class="textnormal" name="A_1109_DESCRIPTION_END_LOAN"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_construction.A_1109_PAYTO_END_LOAN#" class="textnormal" name="A_1109_PAYTO_END_LOAN"  onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_1109_AMOUNT_END_LOAN#" class="smallnormal" name="A_1109_AMOUNT_END_LOAN" onFocus="focus_this(this, 'smallnormal');" onBlur="unfocus_this(this, '', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1109_OUTSIDE_END_LOAN" value="1"  <cfif get_fees_construction.A_1109_OUTSIDE_END_LOAN eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1110. <input type="text" value="#get_fees_construction.A_1110_DESCRIPTION_END_LOAN#" class="textnormal" name="A_1110_DESCRIPTION_END_LOAN"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_construction.A_1110_PAYTO_END_LOAN#" class="textnormal" name="A_1110_PAYTO_END_LOAN"  onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_1110_AMOUNT_END_LOAN#" class="smallnormal" name="A_1110_AMOUNT_END_LOAN" onFocus="focus_this(this, 'smallnormal');" onBlur="unfocus_this(this, '', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1110_OUTSIDE_END_LOAN" value="1" <cfif get_fees_construction.A_1110_OUTSIDE_END_LOAN eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1111. <input type="text" value="#get_fees_construction.A_1111_DESCRIPTION_END_LOAN#" class="textnormal" name="A_1111_DESCRIPTION_END_LOAN"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_construction.A_1111_PAYTO_END_LOAN#" class="textnormal" name="A_1111_PAYTO_END_LOAN"  onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_1111_AMOUNT_END_LOAN#" class="smallnormal" name="A_1111_AMOUNT_END_LOAN" onFocus="focus_this(this, 'smallnormal');" onBlur="unfocus_this(this, '', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1111_OUTSIDE_END_LOAN" value="1"  <cfif get_fees_construction.A_1111_OUTSIDE_END_LOAN eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1112. <input type="text" value="#get_fees_construction.A_1112_DESCRIPTION_END_LOAN#" class="textnormal" name="A_1112_DESCRIPTION_END_LOAN"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_construction.A_1112_PAYTO_END_LOAN#" class="textnormal" name="A_1112_PAYTO_END_LOAN"  onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_1112_AMOUNT_END_LOAN#" class="smallnormal" name="A_1112_AMOUNT_END_LOAN" onFocus="focus_this(this, 'smallnormal');" onBlur="unfocus_this(this, '', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1112_OUTSIDE_END_LOAN" value="1" <cfif get_fees_construction.A_1112_OUTSIDE_END_LOAN eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1113. <input type="text" value="#get_fees_construction.A_1113_DESCRIPTION_END_LOAN#" class="textnormal" name="A_1113_DESCRIPTION_END_LOAN"   onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Description of Charge', 'text');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_construction.A_1113_PAYTO_END_LOAN#" class="textnormal" name="A_1113_PAYTO_END_LOAN"  onFocus="focus_this(this, 'textnormal');" onBlur="unfocus_this(this, 'Payee Name', 'text');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_construction.A_1113_AMOUNT_END_LOAN#" class="smallnormal" name="A_1113_AMOUNT_END_LOAN" onFocus="focus_this(this, 'smallnormal');" onBlur="unfocus_this(this, '', 'small');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1113_OUTSIDE_END_LOAN" value="1" <cfif get_fees_construction.A_1113_OUTSIDE_END_LOAN eq 1>checked</cfif> /></td></tr>
</table>
<!-- 1300 -->
<table width="650" summary="Type of Loan" border="1" cellspacing="0">
<tr>
<td class="bdarksilver_head">1300. Additional Settlement Charges (for Non-Title/Settlement Charges)</td>
<td class="bdarksilver_head" align="right">Amount</td>
<td class="bdarksilver_head" align="right">Outside</td>

</tr>
<!--- <tr>
<td class="bsilver">1301. <input type="text" value="#get_fees_b_construction.A_1301_DESCRIPTION_END_LOAN#" class="textnormal" name="A_1301_DESCRIPTION_END_LOAN" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b_construction.A_1301_PAYTO_END_LOAN#" class="textnormal" name="A_1301_PAYTO_END_LOAN" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b_construction.A_1301_AMOUNT_END_LOAN#" class="smallnormal" name="A_1301_AMOUNT_END_LOAN" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1301_OUTSIDE_END_LOAN" value="1" <cfif get_fees_b_construction.A_1301_OUTSIDE_END_LOAN eq 1>checked</cfif>  /></td></tr>
 ---><tr>
<td class="bsilver">1302. <input type="text" value="#get_fees_b_construction.A_1302_DESCRIPTION_END_LOAN#" class="textnormal" name="A_1302_DESCRIPTION_END_LOAN" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b_construction.A_1302_PAYTO_END_LOAN#" class="textnormal" name="A_1302_PAYTO_END_LOAN" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b_construction.A_1302_AMOUNT_END_LOAN#" class="smallnormal" name="A_1302_AMOUNT_END_LOAN" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1302_OUTSIDE_END_LOAN" value="1" <cfif get_fees_b_construction.A_1302_OUTSIDE_END_LOAN eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1303. <input type="text" value="#get_fees_b_construction.A_1303_DESCRIPTION_END_LOAN#" class="textnormal" name="A_1303_DESCRIPTION_END_LOAN" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b_construction.A_1303_PAYTO_END_LOAN#" class="textnormal" name="A_1303_PAYTO_END_LOAN" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b_construction.A_1303_AMOUNT_END_LOAN#" class="smallnormal" name="A_1303_AMOUNT_END_LOAN" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1303_OUTSIDE_END_LOAN" value="1" <cfif get_fees_b_construction.A_1303_OUTSIDE_END_LOAN eq 1>checked</cfif>  /></td></tr>
<tr>
<td class="bsilver">1304. <input type="text" value="#get_fees_b_construction.A_1304_DESCRIPTION_END_LOAN#" class="textnormal" name="A_1304_DESCRIPTION_END_LOAN" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b_construction.A_1304_PAYTO_END_LOAN#" class="textnormal" name="A_1304_PAYTO_END_LOAN" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b_construction.A_1304_AMOUNT_END_LOAN#" class="smallnormal" name="A_1304_AMOUNT_END_LOAN" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1304_OUTSIDE_END_LOAN" value="1" <cfif get_fees_b_construction.A_1304_OUTSIDE_END_LOAN eq 1>checked</cfif>  /></td></tr>

<tr>
<td class="bsilver">1305. <input type="text" value="#get_fees_b_construction.A_1305_DESCRIPTION_END_LOAN#" class="textnormal" name="A_1305_DESCRIPTION_END_LOAN" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b_construction.A_1305_PAYTO_END_LOAN#" class="textnormal" name="A_1305_PAYTO_END_LOAN" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b_construction.A_1305_AMOUNT_END_LOAN#" class="smallnormal" name="A_1305_AMOUNT_END_LOAN" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1305_OUTSIDE_END_LOAN" value="1" <cfif get_fees_b_construction.A_1305_OUTSIDE_END_LOAN eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1306. <input type="text" value="#get_fees_b_construction.A_1306_DESCRIPTION_END_LOAN#" class="textnormal" name="A_1306_DESCRIPTION_END_LOAN" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b_construction.A_1306_PAYTO_END_LOAN#" class="textnormal" name="A_1306_PAYTO_END_LOAN" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b_construction.A_1306_AMOUNT_END_LOAN#" class="smallnormal" name="A_1306_AMOUNT_END_LOAN" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1306_OUTSIDE_END_LOAN" value="1"  <cfif get_fees_b_construction.A_1306_OUTSIDE_END_LOAN eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1307. <input type="text" value="#get_fees_b_construction.A_1307_DESCRIPTION_END_LOAN#" class="textnormal" name="A_1307_DESCRIPTION_END_LOAN" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b_construction.A_1307_PAYTO_END_LOAN#" class="textnormal" name="A_1307_PAYTO_END_LOAN" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b_construction.A_1307_AMOUNT_END_LOAN#" class="smallnormal" name="A_1307_AMOUNT_END_LOAN" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1307_OUTSIDE_END_LOAN" value="1" <cfif get_fees_b_construction.A_1307_OUTSIDE_END_LOAN eq 1>checked</cfif>  /></td></tr>
<tr>
<td class="bsilver">1308. <input type="text" value="#get_fees_b_construction.A_1308_DESCRIPTION_END_LOAN#" class="textnormal" name="A_1308_DESCRIPTION_END_LOAN" onFocus="focus_this(this, 'textnormal');" /> &nbsp;to &nbsp;<input type="text" value="#get_fees_b_construction.A_1308_PAYTO_END_LOAN#" class="textnormal" name="A_1308_PAYTO_END_LOAN" onFocus="focus_this(this, 'textnormal');" /></td>
<td class="bordered"><input type="text"  value="#get_fees_b_construction.A_1308_AMOUNT_END_LOAN#" class="smallnormal" name="A_1308_AMOUNT_END_LOAN" onFocus="focus_this(this, 'smallnormal');" /></td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1308_OUTSIDE_END_LOAN" value="1" <cfif get_fees_b_construction.A_1308_OUTSIDE_END_LOAN eq 1>checked</cfif>  /></td></tr>
</table>


</cfoutput>



	</td>
<cfif read_this_sets_billing_states.recordcount eq 1>
			<td align="left" valign="top"><CFOUTPUT>
			<A href="./client_line_costs_display_2010.cfm?uid=#URL.uid#&al=#URL.al#&company_id=#company_id#&billing_id=#read_this_sets_billing_values.billing_id#&ft_agencies=#read_current_agency_assoc.title_FT_agency_id#&A_ST_LIST_2=#read_this_sets_billing_states.a_states#&add_counties=1&add_cities=0"><img src="./images/county_exceptions.jpg" width=144 height=20 border=0></A><br>
<br>
			<A href="./client_line_costs_display_2010.cfm?uid=#URL.uid#&al=#URL.al#&company_id=#company_id#&billing_id=#read_this_sets_billing_values.billing_id#&ft_agencies=#read_current_agency_assoc.title_FT_agency_id#&A_ST_LIST_2=#read_this_sets_billing_states.a_states#&add_counties=0&add_cities=1"><img src="./images/city_exceptions.jpg" width=144 height=20 border=0></A>
	</CFOUTPUT>
</td>
</cfif>
	</tr>

	</table>

	<table width=797 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
		<tr>
		<td width=797 colspan=4 align=right valign=top bgcolor=e6e6e6>

			<INPUT TYPE=image src="./images/button_modify.gif" border=0>

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
	<table width=798 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>

	<tr>

		<td width=300 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Current FT Agency
		</td>


			<CFOUTPUT QUERY="read_current_agency_assoc">


			<td width=298 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial><B>#title_FT_Agency_state#&nbsp;&nbsp;--&nbsp;#Title_FT_Agency_Name#	</B>
		</td>

			</tr>		</CFOUTPUT>
				<!--- <SELECT NAME="Current_agencies_id"
								size="10"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
						<CFOUTPUT QUERY="read_current_agency_assoc">
										<OPTION VALUE="#title_FT_Agency_ID#"> </OPTION>

							</CFOUTPUT>
						</SELECT>
				<p>
				<input type=image src="./images/button_delete.gif" border=0>--->



	<CFFORM METHOD=POST ACTION="https://#cgi.server_name#/admin_area/client_line_costs_modify_submit_2010.cfm?uid=#URL.uid#&al=#URL.al#&a_flag=3&company_id=#company_id#&billing_id=#billing_id#">

<tr>
		<td width=300 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Available Ft Agencies
		</td>

		<td width=298 align=right valign=top bgcolor=e6e6e6>
						<SELECT NAME="New_agency_id"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>

						<CFLOOP FROM="1" TO="#ArrayLen(a_agency_id)#" INDEX="PPP">

							<CFOUTPUT>
								<OPTION VALUE="#a_agency_ID[PPP]#">#a_agency_state[PPP]#&nbsp;&nbsp;--&nbsp;#a_agency_name[PPP]# </OPTION>
							</CFOUTPUT>
						</CFLOOP>


						</SELECT>
							<p>
							<input type=image src="./images/button_modify.gif" border=0>

		</td>
	</tr>
</cfFORM>
</table>
<cfif url.add_counties eq 0>
<table width=798 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>

<CFOUTPUT>
	<FORM METHOD=POST ACTION="https://#cgi.server_name#/admin_area/client_line_costs_modify_submit_2010.cfm?uid=#URL.uid#&al=#URL.al#&company_id=#company_id#&a_flag=4&billing_id=#billing_id#">
</CFOUTPUT>

	<tr>

		<tr>
		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Current States
		</td>

		<td width=147 align=left valign=top bgcolor=e6e6e6>
						<SELECT NAME="a_st_list_3"
								size="10"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
						<CFLOOP FROM="1" TO="#ArrayLen(a_st_list_4)#" INDEX="BBB">
							<CFOUTPUT>
								<OPTION VALUE="#a_st_list_4[BBB]#">#a_st_list_4[BBB]#</OPTION>
							</CFOUTPUT>
						</CFLOOP>
						</SELECT>
				<p><cfif #read_user.lname# neq "Hays" AND  #read_user.lname# neq "Elliott">
				<input type=image src="./images/button_delete.gif" border=0></cfif>
		</td>
</FORM>
<CFOUTPUT>
	<FORM METHOD=POST ACTION="https://#cgi.server_name#/admin_area/client_line_costs_modify_submit_2010.cfm?uid=#URL.uid#&al=#URL.al#&company_id=#company_id#&a_flag=5&billing_id=#billing_id#">
</CFOUTPUT>

		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Available States
		</td>

		<td width=150 align=left valign=top bgcolor=e6e6e6>
						<SELECT NAME="a_st_list_3" 	MULTIPLE
								size="10"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
							<CFOUTPUT QUERY="read_all_first_title_states">
								<CFSET b_trigger = "1">
								<CFLOOP FROM="1" TO="#ArrayLen(a_st_list_7)#" INDEX="CCC">
									<CFIF #a_st_list_7[CCC]# EQ #st_abbrev#>
										<CFSET b_trigger = "2">
									</CFIF>
								</CFLOOP>
									<CFIF #b_trigger# EQ "1">
										<OPTION VALUE="#st_abbrev#">#st_abbrev#</OPTION>
									</CFIF>
									<CFSET b_trigger = "1">
							</CFOUTPUT>
						</SELECT>
							<p><cfif #read_user.lname# neq "Hays" AND  #read_user.lname# neq "Elliott">
							<input type=image src="./images/button_add.gif" border=0></cfif>

		</td>
	</tr>
</FORM>
</table>
</cfif>
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

