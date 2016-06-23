

		

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
document.frm.city_transfer_seller_split.value = document.frm.City_Transfer_tax.value * .5;
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
		You can add a recording fee record to the database.
		<p>
		Be sure you do not try to add a record that already exists, as
		this will result in an error.
		</td>
	</tr>	
	
</table>
		
		</td>		
	</tr>



<FORM name="frm" METHOD=POST ACTION="./rec_fees_add_submit.cfm?uid=#URL.uid#&al=#URL.al#">

</CFOUTPUT>



	<tr>
		<td width=651 align=center valign=top bgcolor=white>
			

<table width=650 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>

	<tr>
		<td width=300 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			State		
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="state" VALUE="" size=8 maxlength=2
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
		<td width=300 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			County		
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="county" VALUE="" size=35 maxlength=70
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
		<td width=300 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			City		
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="city" VALUE="" size=35 maxlength=70
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
		<td width=300 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Mortgage Recording Fee		
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="Mort_rec_Fee" VALUE="" size=35 maxlength=20
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
		<td width=300 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Release  Fee		
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="Release_rec_fee" VALUE="" size=35 maxlength=20
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
		<td width=300 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Mortgage Stamps		
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="Mort_Stamps" VALUE="" size=35 maxlength=20
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
		<td width=300 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Stamp Difference 	
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="Stamps_diff" VALUE="" size=35 maxlength=20
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
		<td width=300 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Intangibles Tax	
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="Intangible_Tax" VALUE="" size=35 maxlength=20
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
		<td width=300 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Transfer Tax	
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="Transfer_tax" VALUE="" size=35 maxlength=20
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
		<td width=300 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			State Transfer Tax	
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="State_Transfer_tax" VALUE="" size=35 maxlength=20
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
		<td width=300 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			State Transfer Tax	Exemption Cap
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="State_Transfer_exempt" VALUE="" size=35 maxlength=20
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
		<td width=300 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			State Transfer Taxes Paid By: 
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1><font size=1 color=black face=verdana><input type="radio" name="state_transfer_paidby" value="buyer" onclick="state_transfer();">&nbsp;Buyer&nbsp;&nbsp;<input type="radio" name="state_transfer_paidby" value="seller" onclick="state_transfer();">&nbsp;Seller&nbsp;&nbsp;<input type="radio" name="state_transfer_paidby" value="split" onclick="state_transfer();">&nbsp;Split &nbsp;&nbsp;<input type="text" name="state_transfer_buyer_split" value="" style="font-size: 9; 
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
				clear: none; width: 25; ">-buyer&nbsp;&nbsp;/&nbsp;&nbsp;<input type="text" name="state_transfer_seller_split" value="" style="font-size: 9; 
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
		<td width=300 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			County Transfer Tax	
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="County_Transfer_tax" VALUE="" size=35 maxlength=20
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
		<td width=300 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			County Transfer Tax	Exemption Cap
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="County_Transfer_exempt" VALUE="" size=35 maxlength=20
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
		<td width=300 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			County Transfer Taxes Paid By: 
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1><font size=1 color=black face=verdana><input type="radio" name="county_transfer_paidby" value="buyer" onclick="county_transfer();">&nbsp;Buyer&nbsp;&nbsp;<input type="radio" name="county_transfer_paidby" value="seller" onclick="county_transfer();">&nbsp;Seller&nbsp;&nbsp;<input type="radio" name="county_transfer_paidby" value="split" onclick="county_transfer();">&nbsp;Split &nbsp;&nbsp;<input type="text" name="county_transfer_buyer_split" value="" style="font-size: 9; 
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
				clear: none; width: 25; ">-buyer&nbsp;&nbsp;/&nbsp;&nbsp;<input type="text" name="county_transfer_seller_split" value="" style="font-size: 9; 
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
		<td width=300 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			City Transfer Tax	
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="City_Transfer_tax" VALUE="" size=35 maxlength=20
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
		<td width=300 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			City Transfer Tax	Exemption Cap
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="City_Transfer_exempt" VALUE="" size=35 maxlength=20
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
		<td width=300 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			City Transfer Taxes Paid By: 
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1><font size=1 color=black face=verdana><input type="radio" name="city_transfer_paidby" value="buyer" onclick="city_transfer();">&nbsp;Buyer&nbsp;&nbsp;<input type="radio" name="city_transfer_paidby" value="seller" onclick="city_transfer();">&nbsp;Seller&nbsp;&nbsp;<input type="radio" name="city_transfer_paidby" value="split" onclick="city_transfer();">&nbsp;Split &nbsp;&nbsp;<input type="text" name="city_transfer_buyer_split" value="" style="font-size: 9; 
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
				clear: none; width: 25; ">-buyer&nbsp;&nbsp;/&nbsp;&nbsp;<input type="text" name="city_transfer_seller_split" value="" style="font-size: 9; 
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
		<td width=300 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Deed Recording Fee	
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="deedrecfees" VALUE="" size=35 maxlength=20
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
		<td width=650 colspan=2 align=right valign=top bgcolor=f1f1f1>
			<input type=submit value="add">	
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

	</td>
</tr>
</table>

</BODY>
</HTML>

