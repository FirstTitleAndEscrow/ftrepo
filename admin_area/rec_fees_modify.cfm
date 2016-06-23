

	<CFQUERY datasource="#request.dsn#" NAME="read_records">
		SELECT *
		FROM recording_fees
		where id = #a_rec_id#
	
	</CFQUERY>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE>First Title Services Admin</TITLE>

<script language="javascript">
function state_transfer() {
if (document.frm.state_transfer_paidby[2].checked) {
document.frm.state_transfer_buyer_split.value = document.frm.State_Transfer_tax.value * .5;
document.frm.state_transfer_seller_split.value = document.frm.State_Transfer_tax.value * .5;
} else {
document.frm.state_transfer_buyer_split.value = "";
document.frm.state_transfer_seller_split.value = "";
}
}

function county_transfer() {
if (document.frm.county_transfer_paidby[2].checked) {
document.frm.county_transfer_buyer_split.value = document.frm.County_Transfer_tax.value * .5;
document.frm.county_transfer_seller_split.value = document.frm.County_Transfer_tax.value * .5;
} else {
document.frm.county_transfer_buyer_split.value = "";
document.frm.county_transfer_seller_split.value = "";
}
}
function city_transfer() {
if (document.frm.city_transfer_paidby[2].checked) {
document.frm.city_transfer_buyer_split.value = document.frm.City_Transfer_tax.value * .5;
document.frm.city_transfer_seller_split.value = document.frm.City_transfer_tax.value * .5;
} else {
document.frm.city_transfer_buyer_split.value = "";
document.frm.city_transfer_seller_split.value = "";
}
}


</script>
</HEAD>

<BODY BGCOLOR=e1e1e1 TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>
<CENTER>
<table width=552 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=500 align=center valign=top>
<table width=651 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=651 align=center valign=top bgcolor=e2e2e2>
<table width=650 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>
<CFOUTPUT>
	<tr>
		<td width=650 align=center valign=top bgcolor=white>
			<font size=2 color=green face=arial><B>Manage First Title -- Recording Fees</B>
		</td>
	</tr>
</table>
		</td>
	</tr>
	<tr>
		<td width=651 align=center valign=top bgcolor=white>
			

<table width=650 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>

	<tr>
		<td width=650 align=left valign=top bgcolor=f1f1f1>
		<font size=2 color=black face=arial>
		You can modify any of the items shown below. 
		<br><font size=1 color=blue face=verdana> 
		</td>
	</tr>	
	
</table>
		
		</td>		
	</tr>



<FORM name="frm" METHOD=POST ACTION="./rec_fees_submit.cfm?a_rec_id=#a_rec_id#&uid=#URL.uid#&al=#URL.al#">

</CFOUTPUT>




<CFOUTPUT QUERY="read_records">
	<tr>
		<td width=651 align=center valign=top bgcolor=white>
			

<table width=650 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>

	<tr>
		<td width=250 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			State		
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="state" VALUE="#state#" size=8 maxlength=2
				size="1" 
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; ">	
			</td>		
	</tr>
		
	<tr>
		<td width=250 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			County		
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="county" VALUE="#county#" size=35 maxlength=70
				size="1" 
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; ">	
			</td>		
	</tr>		
	<tr>
		<td width=250 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			City		
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="city" VALUE="#city#" size=35 maxlength=70
				size="1" 
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; ">	
			</td>		
	</tr>		

	<tr>
		<td width=250 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Mortgage Recording Fee		
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="Mort_rec_Fee" VALUE="#Mort_rec_Fee#" size=35 maxlength=20
				size="1" 
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; ">	
			</td>		
	</tr>
	
	<tr>
		<td width=250 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Release  Fee		
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="Release_rec_fee" VALUE="#Release_rec_fee#" size=35 maxlength=20
				size="1" 
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; ">	
			</td>		
	</tr>	

	<tr>
		<td width=250 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Mortgage Stamps		
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="Mort_Stamps" VALUE="#Mort_Stamps#" size=35 maxlength=20
				size="1" 
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; ">	
			</td>		
	</tr>
	
	<tr>
		<td width=250 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Stamp Difference 	
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="Stamps_diff" VALUE="#Stamps_diff#" size=35 maxlength=20
				size="1" 
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; ">	
			</td>		
	</tr>	


	<tr>
		<td width=250 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Intangibles Tax	
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="Intangible_Tax" VALUE="#Intangible_Tax#" size=35 maxlength=20
				size="1" 
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; ">	
			</td>		
	</tr>

	<tr>
		<td width=250 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Transfer Tax	
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="Transfer_tax" VALUE="#Transfer_tax#" size=35 maxlength=20
				size="1" 
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; ">	
			</td>		
	</tr>
	
	<tr>
		<td width=250 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			State Transfer Tax	
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="State_Transfer_tax" VALUE="#State_Transfer_tax#" size=35 maxlength=20
				size="1" 
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; ">	
			</td>		
	</tr>
		<tr>
		<td width=250 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			State Transfer Tax	Exemption Cap
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="State_Transfer_exempt" VALUE="#State_Transfer_exempt#" size=35 maxlength=20
				size="1" 
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; ">	
			</td>		
	</tr>
		<tr>
		<td width=250 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			State Transfer Tax Paid By	
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1><font size=1 color=black face=verdana>
			<input type="radio" name="state_transfer_paidby" value="buyer" <cfif state_transfer_paidby eq 'buyer'>checked</cfif>  onclick="state_transfer();">&nbsp;Buyer&nbsp;&nbsp;<input type="radio" name="state_transfer_paidby" value="seller"  <cfif state_transfer_paidby eq 'seller'>checked</cfif>  onclick="state_transfer();">&nbsp;Seller&nbsp;&nbsp;<input type="radio" name="state_transfer_paidby" value="split"  <cfif state_transfer_paidby eq 'split'>checked</cfif> onclick="state_transfer();">&nbsp;Split&nbsp;&nbsp;<input type="text" name="state_transfer_buyer_split" value="#state_transfer_buyer_split#" style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; width: 25; ">-buyer&nbsp;&nbsp;/&nbsp;&nbsp;<input type="text" name="state_transfer_seller_split" value="#state_transfer_seller_split#" style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; width: 25; ">-seller</font>
			</td>		
	</tr>
	
	<tr>
		<td width=250 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			County Transfer Tax	
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="County_Transfer_tax" VALUE="#County_Transfer_tax#" size=35 maxlength=20
				size="1" 
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; ">	
			</td>		
	</tr>
		<tr>
		<td width=250 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			County Transfer Tax	Exemption Cap
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="County_Transfer_exempt" VALUE="#County_Transfer_exempt#" size=35 maxlength=20
				size="1" 
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; ">	
			</td>		
	</tr>
		<tr>
		<td width=250 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			County Transfer Tax Paid By	
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1><font size=1 color=black face=verdana>
			<input type="radio" name="county_transfer_paidby" value="buyer" <cfif county_transfer_paidby eq 'buyer'>checked</cfif>  onclick="county_transfer();">&nbsp;Buyer&nbsp;&nbsp;<input type="radio" name="county_transfer_paidby" value="seller"  <cfif county_transfer_paidby eq 'seller'>checked</cfif>  onclick="county_transfer();">&nbsp;Seller&nbsp;&nbsp;<input type="radio" name="county_transfer_paidby" value="split"  <cfif county_transfer_paidby eq 'split'>checked</cfif> onclick="county_transfer();">&nbsp;Split&nbsp;&nbsp;<input type="text" name="county_transfer_buyer_split" value="#county_transfer_buyer_split#" style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; width: 25; ">-buyer&nbsp;&nbsp;/&nbsp;&nbsp;<input type="text" name="county_transfer_seller_split" value="#county_transfer_seller_split#" style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; width: 25; ">-seller</font>
			</td>		
	</tr>
	
	<tr>
		<td width=250 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			City Transfer Tax	
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="City_Transfer_tax" VALUE="#City_Transfer_tax#" size=35 maxlength=20
				size="1" 
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; ">	
			</td>		
	</tr>
		<tr>
		<td width=250 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			City Transfer Tax	Exemption Cap
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="City_Transfer_exempt" VALUE="#City_Transfer_exempt#" size=35 maxlength=20
				size="1" 
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; ">	
			</td>		
	</tr>
		<tr>
		<td width=250 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			City Transfer Tax Paid By	
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1><font size=1 color=black face=verdana>
			<input type="radio" name="city_transfer_paidby" value="buyer" <cfif city_transfer_paidby eq 'buyer'>checked</cfif>  onclick="city_transfer();">&nbsp;Buyer&nbsp;&nbsp;<input type="radio" name="city_transfer_paidby" value="seller"  <cfif city_transfer_paidby eq 'seller'>checked</cfif>  onclick="city_transfer();">&nbsp;Seller&nbsp;&nbsp;<input type="radio" name="city_transfer_paidby" value="split"  <cfif city_transfer_paidby eq 'split'>checked</cfif> onclick="city_transfer();">&nbsp;Split&nbsp;&nbsp;<input type="text" name="city_transfer_buyer_split" value="#city_transfer_buyer_split#" style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; width: 25; ">-buyer&nbsp;&nbsp;/&nbsp;&nbsp;<input type="text" name="city_transfer_seller_split" value="#city_transfer_seller_split#" style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; width: 25; ">-seller</font>
			</td>		
	</tr>
	<tr>
		<td width=250 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Title Insurance Premium City Tax
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="ti_premium_tax" VALUE="#ti_premium_tax_city#" size=35 maxlength=20
				size="1" 
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; ">	
			</td>		
	</tr>
	<tr>
		<td width=250 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Title Insurance Premium County Tax
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="ti_premium_tax" VALUE="#ti_premium_tax_county#" size=35 maxlength=20
				size="1" 
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; ">	
			</td>		
	</tr>
	<tr>
		<td width=250 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Title Insurance Premium Tax Code
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="ti_premium_tax_code" VALUE="#ti_premium_tax_code#" size=35 maxlength=20
				size="1" 
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; ">	
			</td>		
	</tr>
	<tr>
		<td width=250 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Deed Recording Fee
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="deedrecfees" VALUE="#deedrecfees#" size=35 maxlength=20
				size="1" 
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; ">	
			</td>		
	</tr>


</CFOUTPUT>

	<tr>
		<td width=650 colspan=2 align=right valign=top bgcolor=f1f1f1>
			<input type=submit value="modify">	
			</td>		
	</tr>

	
</table>
		
		</td>		
	</tr>



</FORM>






</table>
		
	

	</td>
</tr>
</table>

</BODY>
</HTML>

