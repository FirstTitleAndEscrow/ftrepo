<!---<CFPARAM NAME="searchtype"     DEFAULT="">
<CFPARAM NAME="pstate"       DEFAULT="">
<CFPARAM NAME="loanamt_float"    DEFAULT="">
 <CFPARAM NAME="input_val"     DEFAULT=""> --->
<!--- <CFPARAM NAME="a_trigger"   DEFAULT="1"> --->

<cfif (#FORM.pstate# NEQ "AL") and (#FORM.pstate# NEQ "CO") and (#FORM.pstate# NEQ "GA") and (#FORM.pstate# NEQ "MI") and (#FORM.pstate# NEQ "NY") and (#FORM.pstate# NEQ "TN")>

		        <CFIF #pstate# EQ "AR">
					<CFSET a_tble_to_read = "StateArkansas">
				<CFELSEIF #pstate# EQ "AK">
					<CFSET a_tble_to_read = "StateAlaska">
				<CFELSEIF #pstate# EQ "MT">
					<CFSET a_tble_to_read = "StateMontana">
				<CFELSEIF #pstate# EQ "CT">
					<CFSET a_tble_to_read = "StateConnecticut">
				<CFELSEIF #pstate# EQ "DC">
					<CFSET a_tble_to_read = "StateDistrictColombia">
				<CFELSEIF #pstate# EQ "DE">
					<CFSET a_tble_to_read = "StateDelaware">
				<CFELSEIF #pstate# EQ "FL">
					<CFSET a_tble_to_read = "StateFlorida">
				<CFELSEIF #pstate# EQ "IL">
					<CFSET a_tble_to_read = "StateIllinois">
				<CFELSEIF #pstate# EQ "IN">
					<CFSET a_tble_to_read = "StateIndiana">
				<CFELSEIF #pstate# EQ "IA">
					<CFSET a_tble_to_read = "StateIowa">
				<CFELSEIF #pstate# EQ "KS">
					<CFSET a_tble_to_read = "StateKansas">
				<CFELSEIF #pstate# EQ "KY">
					<CFSET a_tble_to_read = "StateKentucky">
				<CFELSEIF #pstate# EQ "LA">
					<CFSET a_tble_to_read = "StateLouisianna">
				<CFELSEIF #pstate# EQ "ME">
					<CFSET a_tble_to_read = "StateMaine">
				<CFELSEIF #pstate# EQ "MD">
					<CFSET a_tble_to_read = "StateMaryland">
				<CFELSEIF #pstate# EQ "MA">
					<CFSET a_tble_to_read = "StateMassachusetts">
				<CFELSEIF #pstate# EQ "MN">
					<CFSET a_tble_to_read = "StateMinnesota">
				<CFELSEIF #pstate# EQ "MS">
					<CFSET a_tble_to_read = "StateMississipi">
				<CFELSEIF #pstate# EQ "MO">
					<CFSET a_tble_to_read = "StateMissouri">
				<CFELSEIF #pstate# EQ "NJ">
					<CFSET a_tble_to_read = "StateNewJersey">
				<CFELSEIF #pstate# EQ "NC">
					<CFSET a_tble_to_read = "StateNorthCarolina">
				<CFELSEIF #pstate# EQ "ND">
					<CFSET a_tble_to_read = "StateNorthDakota">
				<CFELSEIF #pstate# EQ "NH">
					<CFSET a_tble_to_read = "StateNewHampshire">
				<CFELSEIF #pstate# EQ "OH">
					<CFSET a_tble_to_read = "StateOhio">
				<CFELSEIF #pstate# EQ "PA">
					<CFSET a_tble_to_read = "StatePennsylvania">
				<CFELSEIF #pstate# EQ "RI">
					<CFSET a_tble_to_read = "StateRhodeIsland">
				<CFELSEIF #pstate# EQ "SC">
					<CFSET a_tble_to_read = "StateSouthCarolina">
				<CFELSEIF #pstate# EQ "VT">
					<CFSET a_tble_to_read = "StateVermont">
				<CFELSEIF #pstate# EQ "VA">
					<CFSET a_tble_to_read = "StateVirginia">
				<CFELSEIF #pstate# EQ "WV">
					<CFSET a_tble_to_read = "StateWestVirginia">
				<CFELSEIF #pstate# EQ "WI">
					<CFSET a_tble_to_read = "StateWisconsin">
			</cfif>


				<!--- Round up the value of the loan amount --->

					<!--- remove any potential decimal values --->
						 <CFSET   x  = #Round(loanamt_float)#>

					 <CFSET   x_len  = #Len(x)#>
						<CFIF #x_len# EQ "3">
							<CFSET x_temp = #x# / 10>
							<CFSET   x_final  = #Round(x_temp)# * 10>
						<CFELSEIF #x_len# EQ "4">
							<CFSET x_temp = #x# / 100>
							<CFSET   x_final  = #Round(x_temp)# * 100>
						<CFELSEIF #x_len# EQ "5">
							<CFSET x_temp = #x# / 1000>
							<CFSET   x_final  = #Round(x_temp)# * 1000>
						<CFELSEIF #x_len# EQ "6">
							<CFSET x_temp = #x# / 1000>
							<CFSET   x_final  = #Round(x_temp)# * 1000>
						<CFELSEIF #x_len# EQ "7">
							<CFSET x_temp = #x# / 10000>
							<CFSET   x_final  = #Round(x_temp)# * 10000>
						</CFIF>

				<!--- Now decide which field to use to do the calc  --->
				<!--- then Query the proper table                   --->

					<CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
      SELECT * FROM #a_tble_to_read# WHERE a_to >= #x_final#
	  order by a_to
      </CFQUERY>
													<!--- * #loanamt_float# --->
					<CFIF #searchtype# EQ "Refinance">
						<CFSET a_ins_premium = #read_ins_calc.Refinance#>

					<CFELSE>
						<CFSET a_ins_premium = #read_ins_calc.sale#>
					</CFIF>





</cfif>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. - Zip Search Form</title>
</head>

<BODY BGCOLOR="FFFFFF" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>
<table width=500 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=500 align=center valign=top>

<table width=499 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=499 align=center valign=top bgcolor=e1e1e1>
			<IMG SRC="./images/title_01.gif">

		</td>
	</tr>

	<tr>
		<td width=499 align=center valign=top bgcolor=e1e1e1>


<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=499 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=498 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>Title Insurance Calculator Result</B></CENTER>
			</TD>
		</TR>

<cfif (#FORM.pstate# NEQ "AL") and (#FORM.pstate# NEQ "CO") and (#FORM.pstate# NEQ "GA") and (#FORM.pstate# NEQ "MI") and (#FORM.pstate# NEQ "NY") and (#FORM.pstate# NEQ "TN")>

<tr>
			<td width=498 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>R e s u l t </B></CENTER>
			</TD>
		</TR>
	<tr>
			<td width=498 align=left valign=top bgcolor=d3d3d3>
				<table width=498 cellpadding=1 cellspacing=1 border=0>

					<tr>
						<td bgcolor=gray width=498 align=center valign=top>
							<b><FONT FACE=verdana SIZE=1 color="white">
							Title Insurance Premium </b>
						</td>

					</tr>

			<CFOUTPUT>
					<tr>
						<td bgcolor="d3d3d3" width=498 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#a_ins_premium#</b>
						</td>
						</tr>
			<tr>
					<td width=490 colspan=3 align=left valign=top bgcolor=e1e1e1>
						<A href="./calculator.cfm"><img src="./images/button_return.gif" border=0></A>
					</td>
				</tr>
			</CFOUTPUT>

<cfelseif #FORM.pstate# EQ "AL">
<cfoutput>
<FORM METHOD=POST ACTION="./calculator_county.cfm?a_trigger=1&searchtype=#FORM.searchtype#&pstate=#FORM.pstate#&loanamt_float=#FORM.loanamt_float#">
</cfoutput>
	<TR>
     <td bgcolor=white width=498 align=center valign=top>
		<font SIZE="2" face="arial">
			Please choose a county.
		</font>
    </TD>
</TR>
<TR>
	<td bgcolor=elelel width=498 align=left valign=top><font SIZE="2" face="arial">

<input type=radio name="input_val" value = "0" CHECKED>Metro Rates: Cherokee, Colbert, Dekalb, Etowah, Franklin, Jackson, Lauderdale, Lawrence, Limestone, Madison, Marion, Marshall and Winston Counties
<BR>
<input type=radio name="input_val" value = "1">National Rates: All Other Counties<BR>

	</TD></tr> <TR><td bgcolor=d3d3d3 width=498 align=right valign=top>
							<INPUT TYPE=image src="./images/button_continue.gif" border=0>
						</td><TR> </form>

<cfelseif #FORM.pstate# EQ "CO">
<cfoutput>
<FORM METHOD=POST ACTION="./calculator_county.cfm?a_trigger=6&searchtype=#FORM.searchtype#&pstate=#FORM.pstate#&loanamt_float=#loanamt_float#">
<input type="hidden" name="loanamt_float" value="#loanamt_float#">
	</cfoutput>
	<TR>
     <td bgcolor=white width=498 align=center valign=top>
		<font SIZE="2" face="arial">
			Please choose a county.
		</font>
    </TD>
</TR>
<TR>
	<td bgcolor=elelel width=498 align=left valign=top><font SIZE="2" face="arial">

<input type=radio name="input_val" value = "13" CHECKED>Adams, Arapahoe, Clear Creek, Denver, Douglas, Elbert, and Jefferson Counties<BR>
<input type=radio name="input_val" value = "14">Alamosa, Conejos, Rio Grande and Saguache Counties<br>
<input type=radio name="input_val" value = "15">Archuleta and Mineral Counties<br>
<input type=radio name="input_val" value = "16">Boulder County<br>
<input type=radio name="input_val" value = "17">Chaffee County<br>


	</TD></tr> <TR><td bgcolor=d3d3d3 width=498 align=right valign=top>
							<INPUT TYPE=image src="./images/button_continue.gif" border=0>
						</td><TR> </form>

<cfelseif #FORM.pstate# EQ "GA">
<cfoutput>
<FORM METHOD=POST ACTION="./calculator_county.cfm?a_trigger=2&searchtype=#FORM.searchtype#&pstate=#FORM.pstate#&loanamt_float=#loanamt_float#">
<input type="hidden" name="loanamt_float" value="#loanamt_float#">
	</cfoutput>
	<TR>
     <td bgcolor=white width=498 align=center valign=top>
		<font SIZE="2" face="arial">
			Please choose a county.
		</font>
    </TD>
</TR>
<TR>
	<td bgcolor=elelel width=498 align=left valign=top><font SIZE="2" face="arial">

<input type=radio name="input_val" value = "2" CHECKED>Metro Rates: Fulton, Cobb, Clayton, Cherokee, Dekalb, Gwinnett, Henry, Douglas, Forsyth, Paulding and  Carroll Counties
<BR>
<input type=radio name="input_val" value = "3">National Rates: All Other Counties<BR>


	</TD></tr> <TR><td bgcolor=d3d3d3 width=498 align=right valign=top>
							<INPUT TYPE=image src="./images/button_continue.gif" border=0>
						</td><TR> </form>


		<cfelseif #FORM.pstate# EQ "MI">
<cfoutput>
<FORM METHOD=POST ACTION="./calculator_county.cfm?a_trigger=3&searchtype=#searchtype#&pstate=#pstate#&loanamt_float=#loanamt_float#">
</cfoutput>
	<TR>
     <td bgcolor=white width=498 align=center valign=top>
		<font SIZE="2" face="arial">
			Please choose a county.
		</font>
    </TD>
</TR>
<TR>
	<td bgcolor=elelel width=498 align=left valign=top><font SIZE="2" face="arial">

<input type=radio name="input_val" value = "4" CHECKED>Metro Rates: Allegan, Barry, Clinton, Eaton, Grand Traverse, Ingham, Ionia, Kent, Leelanau, Montcalm, Muskegon, Newaygo and Ottawa Counties
<BR>
<input type=radio name="input_val" value = "5">National Rates: All Other Counties<BR>


	</TD></tr> <TR><td bgcolor=d3d3d3 width=498 align=right valign=top>
							<INPUT TYPE=image src="./images/button_continue.gif" border=0>
						</td><TR> </form>


					<cfelseif #FORM.pstate# EQ "NY">
<cfoutput>
<FORM METHOD=POST ACTION="./calculator_county.cfm?a_trigger=4&searchtype=#searchtype#&pstate=#pstate#&loanamt_float=#loanamt_float#">
</cfoutput>
	<TR>
     <td bgcolor=white width=498 align=center valign=top>
		<font SIZE="2" face="arial">
			Please choose a county.
		</font>
    </TD>
</TR>
<TR>
	<td bgcolor=elelel width=498 align=left valign=top><font SIZE="2" face="arial">

<input type=radio name="input_val"   value = "6" CHECKED>Albany, Bronx, Columbia, Dutchess, Greene, Kings, Nassau, New York, Orange, Putnam, Queens, Rensselaer, Richmond, Rockland, Suffolk, Sullivan, Ulster or Westchester<BR>
<BR>
<input type=radio name="input_val"   value = "7">Allegany, Broome, Cattaraugus, Cayuga, Chautauqua, Chemung, Chenango, Clinton, Cortland, Delaware, Erie, Essex, Franklin, Fulton, Genesee, Hamilton, Herkimer, Jefferson, Lewis, Livingston, Madison, Monroe, Montgomery, Niagara, Oneida, Onodaga, Ontario, Orleans, Oswego, Otsego, St. Lawrence, Saratoga, Schenectady, Schoharie, Schuyler, Seneca, Steuben, Tioga, Tompkins, Warren, Washington, Wayne, Wyoming or Yates<BR>


	</TD></tr> <TR><td bgcolor=d3d3d3 width=498 align=right valign=top>
							<INPUT TYPE=image src="./images/button_continue.gif" border=0>
						</td><TR> </form>

		<cfelseif #FORM.pstate# EQ "TN">
<cfoutput>
<FORM METHOD=POST ACTION="./calculator_county.cfm?a_trigger=5&searchtype=#searchtype#&pstate=#pstate#&loanamt_float=#loanamt_float#">
</cfoutput>
	<TR>
     <td bgcolor=white width=498 align=center valign=top>
		<font SIZE="2" face="arial">
			Please choose a county.
		</font>
    </TD>
</TR>
<TR>
	<td bgcolor=elelel width=498 align=left valign=top><font SIZE="2" face="arial">

<input type=radio name="input_val"   value = "8" CHECKED>Davidson County<BR>
<input type=radio name="input_val"   value = "9" >Hamilton County<BR>
<input type=radio name="input_val"   value = "10" >Knox County<BR>
<input type=radio name="input_val"   value = "11">Shelby County<BR>
<input type=radio name="input_val"   value = "12">National Rates: All other counties<BR>


	</TD></tr> <TR><td bgcolor=d3d3d3 width=498 align=right valign=top>
							<INPUT TYPE=image src="./images/button_continue.gif" border=0>
						</td><TR> </form>

			</TD>
		</TR>
<cfelse>
		<font SIZE="2" face="arial">
			This State is not served by our company.
		</font>
			</cfif>

			</table>


			</TD>
		</TR>

	</table>


			</TD>
		</TR>

	</table>

<script type="text/javascript">



  var _gaq = _gaq || [];

  _gaq.push(['_setAccount', 'UA-195021-17']);

  _gaq.push(['_trackPageview']);



  (function() {

    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;

    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'https://www') + '.google-analytics.com/ga.js';

    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);

  })();



</script>

</body>
</HTML>

