
<CFPARAM NAME="state" DEFAULT="">
<CFPARAM NAME="county" DEFAULT="">
<CFPARAM NAME="city" DEFAULT="">
<CFPARAM NAME="mort_rec_fee" DEFAULT="">
<CFPARAM NAME="release_rec_fee" DEFAULT="">
<CFPARAM NAME="mort_stamps" DEFAULT="">
<CFPARAM NAME="stamps_diff" DEFAULT="">
<CFPARAM NAME="intangible_tax" DEFAULT="">
<CFPARAM NAME="transfer_tax" DEFAULT="">
<CFPARAM NAME="deedrecfees" DEFAULT="">
<CFPARAM NAME="state_transfer_tax" DEFAULT="">
<CFPARAM NAME="county_transfer_tax" DEFAULT="">
<CFPARAM NAME="city_transfer_tax" DEFAULT="">
<CFPARAM NAME="state_transfer_paidby" DEFAULT="buyer">
<CFPARAM NAME="county_transfer_paidby" DEFAULT="buyer">
<CFPARAM NAME="city_transfer_paidby" DEFAULT="buyer">
<CFPARAM NAME="state_transfer_buyer_split" DEFAULT="">
<CFPARAM NAME="state_transfer_seller_split" DEFAULT="">
<CFPARAM NAME="state_transfer_exempt" DEFAULT="">
<CFPARAM NAME="county_transfer_buyer_split" DEFAULT="">
<CFPARAM NAME="county_transfer_seller_split" DEFAULT="">
<CFPARAM NAME="county_transfer_exempt" DEFAULT="">
<CFPARAM NAME="city_transfer_buyer_split" DEFAULT="">
<CFPARAM NAME="city_transfer_seller_split" DEFAULT="">
<CFPARAM NAME="city_transfer_exempt" DEFAULT="">
<CFPARAM NAME="ti_premium_tax_city" DEFAULT="">
<CFPARAM NAME="ti_premium_tax_county" DEFAULT="">
<CFPARAM NAME="ti_premium_tax_code" DEFAULT="">






	<CFQUERY datasource="#request.dsn#">
		UPDATE recording_fees
		SET state = '#state#',
		county  = '#county#',
		city  = '#city#',
		mort_rec_fee = '#mort_rec_fee#',
		release_rec_fee  = '#release_rec_fee#',
		mort_stamps   = '#mort_stamps#',
		stamps_diff  = '#stamps_diff#',
		intangible_tax  = '#intangible_tax#',
		transfer_tax  = '#transfer_tax#',
		deedrecfees = '#deedrecfees#',
		state_transfer_tax = '#state_transfer_tax#',
		county_transfer_tax = '#county_transfer_tax#',
		city_transfer_tax = '#city_transfer_tax#',
		state_transfer_paidby = '#state_transfer_paidby#',
		county_transfer_paidby = '#county_transfer_paidby#',
		city_transfer_paidby = '#city_transfer_paidby#',
		state_transfer_buyer_split = '#state_transfer_buyer_split#',
		state_transfer_seller_split = '#state_transfer_seller_split#',
		state_transfer_exempt = '#state_transfer_exempt#',
		county_transfer_buyer_split = '#county_transfer_buyer_split#',
		county_transfer_seller_split = '#county_transfer_seller_split#',
		county_transfer_exempt = '#county_transfer_exempt#',
		city_transfer_buyer_split = '#city_transfer_buyer_split#',
		city_transfer_seller_split = '#city_transfer_seller_split#',
		city_transfer_exempt = '#city_transfer_exempt#',
		ti_premium_tax_city = '#ti_premium_tax_city#',
		ti_premium_tax_county = '#ti_premium_tax_county#',
		ti_premium_tax_code = '#ti_premium_tax_code#'
		where id = #a_rec_id#
	
	</CFQUERY>

		

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE>First Title Services Admin</TITLE>

</HEAD>

<BODY BGCOLOR=e1e1e1 TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>
<CENTER>
<table width=552 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=500 align=center valign=top>
<table width=551 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=551 align=center valign=top bgcolor=e2e2e2>
<table width=550 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>
<CFOUTPUT>
	<tr>
		<td width=550 align=center valign=top bgcolor=white>
			<font size=2 color=green face=arial><B>Manage First Title -- Recording Fees</B>
		</td>
	</tr>
</table>
		</td>
	</tr>
	<tr>
		<td width=551 align=center valign=top bgcolor=white>
<table width=550 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=550 align=left valign=top bgcolor=f1f1f1>
		<font size=2 color=black face=arial>
		The record has been successfully modified. 
		<br><font size=1 color=blue face=verdana> 
		</td>
	</tr>	
</table>
		</td>		
	</tr>
</CFOUTPUT>
<CFOUTPUT>
	<tr>
		<td width=551 align=center valign=top bgcolor=white>
<table width=550 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			State		
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
			<font size=1 color=blue face=verdana>			
			<B>#state#	</B>
			</td>		
	</tr>
	
	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			County		
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
			<font size=1 color=blue face=verdana>
			<B>#county#</B>	
			</td>		
	</tr>		
	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			City		
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
			<font size=1 color=blue face=verdana>
			<B>#city#</B>	
			</td>		
	</tr>		

	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Mortgage Recording Fee		
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
			<font size=1 color=blue face=verdana>
			<B>#Mort_rec_Fee#	</B>
			</td>		
	</tr>
	
	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Release  Fee		
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
			<font size=1 color=blue face=verdana>
			<B>#Release_rec_fee#</B>
			</td>		
	</tr>	

	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Mortgage Stamps		
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
			<font size=1 color=blue face=verdana>
			<B>#Mort_Stamps#</B>
			</td>		
	</tr>
	
	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Stamp Difference 	
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
			<font size=1 color=blue face=verdana>
			<B>#Stamps_diff#</B>	
			</td>		
	</tr>	


	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Intangibles Tax	
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
			<font size=1 color=blue face=verdana>
			<B>#Intangible_Tax#</B>
			</td>		
	</tr>

	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Transfer Tax	
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
			<font size=1 color=blue face=verdana>
			<B>#Transfer_tax#</B>
			</td>		
	</tr>

	<tr>
		<td width=250 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			State Transfer Tax	
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1>
			<font size=1 color=blue face=verdana>
			<B>#State_Transfer_tax#</B>
			</td>		
	</tr>
	<tr>
		<td width=250 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			State Transfer Tax Exemption Cap
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1>
			<font size=1 color=blue face=verdana>
			<B>#State_Transfer_exempt#</B>
			</td>		
	</tr>
	<tr>
		<td width=250 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			State Transfer Tax	Paid By
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1>
			<font size=1 color=blue face=verdana>
			<B><input type="radio" name="state_transfer_paidby" value="buyer" <cfif state_transfer_paidby eq 'buyer'>checked</cfif> disabled >&nbsp;Buyer&nbsp;&nbsp;<input type="radio" name="state_transfer_paidby" value="seller"  <cfif state_transfer_paidby eq 'seller'>checked</cfif> disabled >&nbsp;Seller&nbsp;&nbsp;<input type="radio" name="state_transfer_paidby" value="split"  <cfif state_transfer_paidby eq 'split'>checked</cfif> disabled >&nbsp;Split<cfif state_transfer_paidby eq 'split'>&nbsp;#state_transfer_buyer_split#-buyer&nbsp;&nbsp;#state_transfer_seller_split#-seller</cfif></B>
			</td>		
	</tr>
	<tr>
		<td width=250 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			County Transfer Tax	
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1>
			<font size=1 color=blue face=verdana>
			<B>#County_Transfer_tax#</B>
			</td>		
	</tr>
	<tr>
		<td width=250 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			County Transfer Tax Exemption Cap
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1>
			<font size=1 color=blue face=verdana>
			<B>#County_Transfer_exempt#</B>
			</td>		
	</tr>
	<tr>
		<td width=250 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			County Transfer Tax	Paid By
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1>
			<font size=1 color=blue face=verdana>
			<B><input type="radio" name="county_transfer_paidby" value="buyer" <cfif county_transfer_paidby eq 'buyer'>checked</cfif> disabled >&nbsp;Buyer&nbsp;&nbsp;<input type="radio" name="county_transfer_paidby" value="seller"  <cfif county_transfer_paidby eq 'seller'>checked</cfif> disabled >&nbsp;Seller&nbsp;&nbsp;<input type="radio" name="county_transfer_paidby" value="split"  <cfif county_transfer_paidby eq 'split'>checked</cfif> disabled >&nbsp;Split<cfif county_transfer_paidby eq 'split'>&nbsp;#county_transfer_buyer_split#-buyer&nbsp;&nbsp;#county_transfer_seller_split#-seller</cfif></B>
			</td>		
	</tr>
	<tr>
		<td width=250 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			City Transfer Tax	
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1>
			<font size=1 color=blue face=verdana>
			<B>#City_Transfer_tax#</B>
			</td>		
	</tr>
	<tr>
		<td width=250 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			City Transfer Tax Exemption Cap
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1>
			<font size=1 color=blue face=verdana>
			<B>#City_Transfer_exempt#</B>
			</td>		
	</tr>
	<tr>
		<td width=250 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			City Transfer Tax	Paid By
		</td>
		<td width=400 align=left valign=top bgcolor=f1f1f1>
			<font size=1 color=blue face=verdana>
			<B><input type="radio" name="city_transfer_paidby" value="buyer" <cfif city_transfer_paidby eq 'buyer'>checked</cfif> disabled >&nbsp;Buyer&nbsp;&nbsp;<input type="radio" name="city_transfer_paidby" value="seller"  <cfif city_transfer_paidby eq 'seller'>checked</cfif> disabled >&nbsp;Seller&nbsp;&nbsp;<input type="radio" name="city_transfer_paidby" value="split"  <cfif city_transfer_paidby eq 'split'>checked</cfif> disabled >&nbsp;Split<cfif city_transfer_paidby eq 'split'>&nbsp;#city_transfer_buyer_split#-buyer&nbsp;&nbsp;#city_transfer_seller_split#-seller</cfif></B>
			</td>		
	</tr>
	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Title Insurance Premium City Tax / Code
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
			<font size=1 color=blue face=verdana>
			<B>#ti_premium_tax_city# - #ti_premium_tax_code#</B>
			</td>		
	</tr>
	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Title Insurance Premium County Tax / Code
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
			<font size=1 color=blue face=verdana>
			<B>#ti_premium_tax_county# - #ti_premium_tax_code#</B>
			</td>		
	</tr>
	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Deed Recording Fees
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
			<font size=1 color=blue face=verdana>
			<B>#deedrecfees#</B>
			</td>		
	</tr>


</CFOUTPUT>
	
</table>
		
		</td>		
	</tr>
</table>
	</td>
</tr>
</table>

</BODY>
</HTML>

