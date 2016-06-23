<cfparam name="loc" default="0">
<cfparam name="a_trigger" default="0">
<CFPARAM NAME="SearchType" DEFAULT="">
<CFPARAM NAME="pstate"       DEFAULT="">
<CFPARAM NAME="loanamt_float"    DEFAULT="">
<CFPARAM NAME="input_val"     DEFAULT="">
<CFPARAM NAME="a_trigger"   DEFAULT="0">


<CFQUERY datasource="#request.dsn#" NAME="read_state_list">

			SELECT *
			FROM first_title_states
			ORDER BY st_abbrev ASC

		</CFQUERY>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>

<head>
<title>1st Title & Escrow, Inc. </title>



	<script type="text/javascript">
function go(frm) {
window.location=frm;
}


</script>
<script type="text/javascript">
function isNumeric(str)
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
    if ('0'<=ch && ch<='9')
      p++;
    else
      ok= false;
  }
  return ok;
}



function ValidateForm(frm)
{
frm = document.frm;
if (frm.SearchType.value=='') {
 alert("Please select a search type in order to proceed!")
 frm.SearchType.focus();
      return false;
 }

if (frm.loanamt_float.value=='') {

 alert("The LOAN AMOUNT field cannot be left blank!")
 frm.loanamt_float.focus();
      return false;
 }

if (!isNumeric(frm.loanamt_float.value)) {

 alert("Only numbers are allowed in the LOAN AMOUNT field!")
 frm.loanamt_float.focus();
      return false;
 }
 if (frm.loanamt_float.value.length < 3 || frm.loanamt_float.value.length > 8) {
 alert("Only numbers between 3 and 8 digits can be entered in the loan amount field!")
  frm.loanamt_float.focus();
      return false;
 }
return true;

 }
 </script>

</head>

<BODY BGCOLOR="FFFFFF" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>

<table width=780 border="0" cellpadding="0" cellspacing="0" background="./images/back_03.gif">
  <TBODY>
   <tr>
  <td align = "center">



<table width=770 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=770 align=left valign=top bgcolor="blue">

				<CENTER><FONT FACE=ARIAL SIZE=2 color="white"><B>Title Insurance Calculator</B></font></CENTER>
			</TD>
		</TR>




<td width=770 align=center valign=top bgcolor=d3d3d3>

<table width=600 cellpadding=1 cellspacing=1 border=0>

	<tr>


						<td bgcolor=d3d3d3 width=600 colspan = 3 align=center valign=top>
							<br>
							<FONT FACE=verdana SIZE=2 color="blue">
							<b>To proceed your request enter the appropriate information below:</font><br><FONT FACE=verdana SIZE=1 color="red"></FONT></b>
					<br><br>	</td>
</tr>
					<tr>


						<td bgcolor=d3d3d3 width=160 align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Transaction Type
						</td>


						<td bgcolor=d3d3d3 width=100 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							State
						</td>

						<td bgcolor=d3d3d3 width=190 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">Loan Amount/Purchase Price
						</td>

						<td bgcolor=d3d3d3 width=68 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">&nbsp;
						</td>

					</tr>


					<tr>

<CFFORM name = "frm" ACTION="./calculator.cfm?uid=#uid#&al=#al#&loc=4&a_trigger=11" onsubmit="javascript:return ValidateForm(this)" ENCTYPE="multipart/form-data" METHOD=POST>



                    <td width=160 bgcolor="d3d3d3" align=left valign=top> <select name="SearchType"
											size="1"
											style="font-size: 9;
											font-family: verdana;
											font-style: normal;
											color: 003F1E;
											background-color: E4E3E3;
											border-color: white;
											border-left-width: thin;
											border-right-width: thin;
											border-top-width: thin;
											border-bottom-width: thin;
											border-width: thin;
											border-style: bar;
											clear: none;
											float: none;"
											rows="3"
											cols="45"
											>
                        <option value="">Select</option>
                        <option value="Purchase">Purchase</option>
                        <option value="Refinance">Refinance</option>
                        <option value="New Second Mortgage">New Second Mortgage</option>
                      </select></td>

						<td bgcolor=d3d3d3 width=100 align=center valign=top>
							 <Select NAME="pstate"
									size="1"
									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;
									float: none;"
									rows="3"
									cols="45"
									>
				<!--- <CFSET a_count = "1">
					<CFLOOP FROM="1" TO="#ArrayLen(a_state_abbrev)#" INDEX="DDD">
						<CFOUTPUT>
						<CFIF #DDD# EQ "1">
							<option value="#a_state_abbrev[DDD]#" SELECTED>#a_state_abbrev[DDD]#</option>
						<CFELSE>
							<option value="#a_state_abbrev[DDD]#">#a_state_abbrev[DDD]#</option>
						</CFIF>
						</CFOUTPUT>
					</CFLOOP>	 --->
								<CFOUTPUT QUERY="read_state_list"><OPTION VALUE="#st_abbrev#">#st_abbrev# </OPTION></CFOUTPUT>

								</select>
						</td>




						<td bgcolor=d3d3d3 width=190 align=center valign=top>
							<INPUT NAME="loanamt_float" SIZE=20 MAXLENGTH=120

									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" >
						</td>

						<td bgcolor=d3d3d3 width=90 align=center valign=top>
							<INPUT TYPE=image src="./images/button_submit.gif" border=0>
						</td>
					</tr>

			</table>
				<CFOUTPUT>




</CFOUTPUT>

	</cfform>



<!--- <cfset #loc# = 3> --->
<cfif #a_trigger# eq 11>


			<!---This was "CA"  I'm going to change it to a non-existant State to make this
            work --->
	<cfif #pstate# eq "BB">


	<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=780 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>Title Insurance Calculator Result</B></CENTER>
			</TD>
		</TR>


<tr>
			<td width=780 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>R e s u l t </B></CENTER>
			</TD>
		</TR>
	<tr>
			<td width=780 align=left valign=top bgcolor=d3d3d3>
				<table width=780 cellpadding=1 cellspacing=1 border=0>

					<tr>
						<td bgcolor=gray width=780 align=center valign=top>
							<b><FONT FACE=verdana SIZE=1 color="white">
							Title Insurance Premium </b>
						</td>

					</tr>

			<CFOUTPUT>
					<tr>
						<td bgcolor="d3d3d3" width=780 align=center valign=top>
							<FONT FACE=verdana SIZE=2 color="BLACK">Title Insurance Premmium is:&nbsp;</FONT>
							<FONT FACE=verdana SIZE=3 color="blue"><b>CALL FOR QUOTE</b></font>
						</td>
						</tr>

			</CFOUTPUT>


<!--- <CFLOCATION URL="https://#cgi.server_name#/calculator.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&loc=20&a_trigger=20">
 --->
<cfelse>







<cfset a_trigger = 12>

</cfif>
</cfif>



<cfif #a_trigger# eq 12>
<CFOUTPUT>




<cfif (#FORM.pstate# NEQ "CA") and (#FORM.pstate# NEQ "AL") and (#FORM.pstate# NEQ "CO") and (#FORM.pstate# NEQ "GA") and (#FORM.pstate# NEQ "MI") and (#FORM.pstate# NEQ "NY") and (#FORM.pstate# NEQ "TN") and (#FORM.pstate# NEQ "AZ")>

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
                <CFELSEIF #pstate# EQ "HI">
				    <CFSET a_tble_to_read = "StateHawaii">
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
				<CFELSEIF #pstate# EQ "NV">
					<CFSET a_tble_to_read = "StateNevada">
                <CFELSEIF #pstate# EQ "NC">
					<CFSET a_tble_to_read = "StateNorthCarolina">
				<CFELSEIF #pstate# EQ "ND">
					<CFSET a_tble_to_read = "StateNorthDakota">
				<CFELSEIF #pstate# EQ "NH">
					<CFSET a_tble_to_read = "StateNewHampshire">
				<CFELSEIF #pstate# EQ "OH">
					<CFSET a_tble_to_read = "StateOhio">
                <CFELSEIF #pstate# EQ "OR">
					<CFSET a_tble_to_read = "StateOregon">
				<CFELSEIF #pstate# EQ "PA">
					<CFSET a_tble_to_read = "StatePennsylvania">
				<CFELSEIF #pstate# EQ "RI">
					<CFSET a_tble_to_read = "StateRhodeIsland">
				<CFELSEIF #pstate# EQ "SC">
					<CFSET a_tble_to_read = "StateSouthCarolina">
                <CFELSEIF #pstate# EQ "UT">
					<CFSET a_tble_to_read = "StateUtah">
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
						<CFELSEIF #x_len# EQ "8">
							<CFSET x_temp = #x# / 100000>
							<CFSET   x_final  = #Round(x_temp)# * 100000>

						</CFIF>

				<!--- Now decide which field to use to do the calc  --->
				<!--- then Query the proper table                   --->

					<CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
      SELECT * FROM #a_tble_to_read# WHERE a_to >= #x_final# order by a_to
      </CFQUERY>



					<CFIF #searchtype# EQ "Refinance">
						<CFSET a_ins_premium = #read_ins_calc.Refinance#>

					<CFELSE>
						<CFSET a_ins_premium = #read_ins_calc.sale#>
					</CFIF>





</cfif>

</CFOUTPUT>


<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=780 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>Title Insurance Calculator Result</B></CENTER>
			</TD>
		</TR>

<cfif (#FORM.pstate# NEQ "CA") and (#FORM.pstate# NEQ "AL") and (#FORM.pstate# NEQ "CO") and (#FORM.pstate# NEQ "GA") and (#FORM.pstate# NEQ "MI") and (#FORM.pstate# NEQ "NY") and (#FORM.pstate# NEQ "TN") and (#FORM.pstate# NEQ "AZ")>
<cfif #read_ins_calc.recordcount# gt "0">
<tr>
			<td width=780 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>R e s u l t </B></CENTER>
			</TD>
		</TR>
	<tr>
			<td width=780 align=left valign=top bgcolor=d3d3d3>
				<table width=780 cellpadding=1 cellspacing=1 border=0>

					<tr>
						<td bgcolor=gray width=780 align=center valign=top>
							<b><FONT FACE=verdana SIZE=1 color="white">
							Title Insurance Premium </b>
						</td>

					</tr>

			<CFOUTPUT>
					<tr>
						<td bgcolor="d3d3d3" width=780 align=center valign=top>
							<FONT FACE=verdana SIZE=2 color="BLACK">Title Insurance Premmium is:&nbsp;</FONT>
							<FONT FACE=verdana SIZE=3 color="blue"><b>#a_ins_premium#</b></font>
						</td>
						</tr>

			<tr>
					<td width=780 colspan=3 align=left valign=top bgcolor=e1e1e1>
						<A href="./calculator.cfm?uid=#uid#&al=#al#"><img src="./images/button_return.gif" border=0></A>
					</td>
				</tr>
			</CFOUTPUT>
			<cfelse>

			<tr>
					<td width=780 colspan=3 align=center valign=top bgcolor=e1e1e1>
							<FONT FACE=verdana SIZE=2 color="black">
							Sorry, there is no match of the loan amout you entered with any fees in out database.
							</td>
				</tr>


			</cfif>
<cfelseif #FORM.pstate# EQ "AL">
<cfoutput>
<FORM METHOD=POST ACTION="./calculator.cfm?uid=#uid#&al=#al#&loc=#loc#&a_trigger=1&searchtype=#FORM.searchtype#&pstate=#FORM.pstate#&loanamt_float=#FORM.loanamt_float#">
</cfoutput>
	<TR>
     <td bgcolor=white width=780 align=center valign=top>
		<font SIZE="2" face="arial">
			Please choose a county.
		</font>
    </TD>
</TR>
<TR>
	<td bgcolor=elelel width=780 align=left valign=top><font SIZE="2" face="arial">

<input type=radio name="input_val" value = "0" CHECKED>Metro Rates: Cherokee, Colbert, Dekalb, Etowah, Franklin, Jackson, Lauderdale, Lawrence, Limestone, Madison, Marion, Marshall and Winston Counties
<BR>
<input type=radio name="input_val" value = "1">National Rates: All Other Counties<BR>

	</TD></tr> <TR><td bgcolor=d3d3d3 width=780 align=right valign=top>
							<INPUT TYPE=image src="./images/button_continue.gif" border=0>
						</td><TR> </form>

<cfelseif #FORM.pstate# EQ "CO">
<cfoutput>
<FORM METHOD=POST ACTION="./calculator.cfm?uid=#uid#&al=#al#&loc=#loc#&a_trigger=6&searchtype=#FORM.searchtype#&pstate=#FORM.pstate#&loanamt_float=#loanamt_float#">
<input type="hidden" name="loanamt_float" value="#loanamt_float#">
	</cfoutput>
	<TR>
     <td bgcolor=white width=780 align=center valign=top>
		<font SIZE="2" face="arial">
			Please choose a county.
		</font>
    </TD>
</TR>
<TR>
	<td bgcolor=elelel width=780 align=left valign=top><font SIZE="2" face="arial">

<input type=radio name="input_val" value = "13" CHECKED>Adams, Arapahoe, Broomfield, Clear Creek, Denver, Douglas, Elbert, Jefferson Counties<BR>
<input type=radio name="input_val" value = "14">Alamosa, Conejos, Rio Grande and Saguache Counties<br>
<input type=radio name="input_val" value = "15">Archuleta and Mineral Counties<br>
<input type=radio name="input_val" value = "16">Boulder County<br>
<input type=radio name="input_val" value = "17">Chaffee County<br>
<input type=radio name="input_val" value = "30">Custer, Fremont Counties<br>
<input type=radio name="input_val" value = "31">Dolorse, LaPlata, Montezuma Counties<br>
<input type=radio name="input_val" value = "32">Eagle, Garfield, Grand, Jackson, Lake, Park, Pitkin, Routt, Summit Counties<br>
<input type=radio name="input_val" value = "33">El Paso County<br>
<input type=radio name="input_val" value = "34">Moffatt County<br>
<input type=radio name="input_val" value = "35">Larimer County<br>
<input type=radio name="input_val" value = "36">Montrose, Ouray Counties<br>
<input type=radio name="input_val" value = "37">Phillips County<br>
<input type=radio name="input_val" value = "38">Pueblo County<br>
<input type=radio name="input_val" value = "39">Rio Blanco County<br>
<input type=radio name="input_val" value = "40">Weld County<br>
<input type=radio name="input_val" value = "41">All other CO counties<br>


	</TD></tr> <TR><td bgcolor=d3d3d3 width=780 align=right valign=top>
							<INPUT TYPE=image src="./images/button_continue.gif" border=0>
						</td><TR> </form>

<cfelseif #FORM.pstate# EQ "GA">
<cfoutput>
<FORM METHOD=POST ACTION="./calculator.cfm?uid=#uid#&al=#al#&loc=#loc#&a_trigger=2&searchtype=#FORM.searchtype#&pstate=#FORM.pstate#&loanamt_float=#loanamt_float#">
<input type="hidden" name="loanamt_float" value="#loanamt_float#">
	</cfoutput>
	<TR>
     <td bgcolor=white width=780 align=center valign=top>
		<font SIZE="2" face="arial">
			Please choose a county.
		</font>
    </TD>
</TR>
<TR>
	<td bgcolor=elelel width=780 align=left valign=top><font SIZE="2" face="arial">

<input type=radio name="input_val" value = "2" CHECKED>Metro Rates: Fulton, Cobb, Clayton, Cherokee, Dekalb, Gwinnett, Henry, Douglas, Forsyth, Paulding and  Carroll Counties
<BR>
<input type=radio name="input_val" value = "3">National Rates: All Other Counties<BR>


	</TD></tr> <TR><td bgcolor=d3d3d3 width=780 align=right valign=top>
							<INPUT TYPE=image src="./images/button_continue.gif" border=0>
						</td><TR> </form>


		<cfelseif #FORM.pstate# EQ "MI">
<cfoutput>
<FORM METHOD=POST ACTION="./calculator.cfm?uid=#uid#&al=#al#&loc=#loc#&a_trigger=3&searchtype=#searchtype#&pstate=#pstate#&loanamt_float=#loanamt_float#">
</cfoutput>
	<TR>
     <td bgcolor=white width=780 align=center valign=top>
		<font SIZE="2" face="arial">
			Please choose a county.
		</font>
    </TD>
</TR>
<TR>
	<td bgcolor=elelel width=780 align=left valign=top><font SIZE="2" face="arial">

<input type=radio name="input_val" value = "4" CHECKED>Metro Rates: Allegan, Barry, Clinton, Eaton, Grand Traverse, Ingham, Ionia, Kent, Leelanau, Montcalm, Muskegon, Newaygo and Ottawa Counties
<BR>
<input type=radio name="input_val" value = "5">National Rates: All Other Counties<BR>


	</TD></tr> <TR><td bgcolor=d3d3d3 width=780 align=right valign=top>
							<INPUT TYPE=image src="./images/button_continue.gif" border=0>
						</td><TR> </form>

<cfelseif #FORM.pstate# EQ "CA">
<cfoutput>
<FORM METHOD=POST ACTION="./calculator.cfm?uid=#uid#&al=#al#&loc=#loc#&a_trigger=17&searchtype=#searchtype#&pstate=#pstate#&loanamt_float=#loanamt_float#">
</cfoutput>
	<TR>
     <td bgcolor=white width=780 align=center valign=top>
		<font SIZE="2" face="arial">
			Please choose a county.
		</font>
    </TD>
</TR>
<TR>
	<td bgcolor=elelel width=780 align=left valign=top><font SIZE="2" face="arial">

<input type=radio name="input_val" value = "0" CHECKED>Zone 1: Butte, Colusa, Del Norte, Glenn, Humboldt, and Lake Counties
<BR>
<input type=radio name="input_val" value = "1">Zone 2: All Other Counties<BR>


	</TD></tr> <TR><td bgcolor=d3d3d3 width=780 align=right valign=top>
							<INPUT TYPE=image src="./images/button_continue.gif" border=0>
						</td><TR> </form>


					<cfelseif #FORM.pstate# EQ "NY">
<cfoutput>
<FORM METHOD=POST ACTION="./calculator.cfm?uid=#uid#&al=#al#&loc=#loc#&a_trigger=4&searchtype=#searchtype#&pstate=#pstate#&loanamt_float=#loanamt_float#">
</cfoutput>
	<TR>
     <td bgcolor=white width=780 align=center valign=top>
		<font SIZE="2" face="arial">
			Please choose a county.
		</font>
    </TD>
</TR>
<TR>
	<td bgcolor=elelel width=780 align=left valign=top><font SIZE="2" face="arial">

<input type=radio name="input_val"   value = "6" CHECKED>Albany, Bronx, Columbia, Dutchess, Greene, Kings, Nassau, New York, Orange, Putnam, Queens, Rensselaer, Richmond, Rockland, Suffolk, Sullivan, Ulster or Westchester<BR>
<BR>
<input type=radio name="input_val"   value = "7">Allegany, Broome, Cattaraugus, Cayuga, Chautauqua, Chemung, Chenango, Clinton, Cortland, Delaware, Erie, Essex, Franklin, Fulton, Genesee, Hamilton, Herkimer, Jefferson, Lewis, Livingston, Madison, Monroe, Montgomery, Niagara, Oneida, Onodaga, Ontario, Orleans, Oswego, Otsego, St. Lawrence, Saratoga, Schenectady, Schoharie, Schuyler, Seneca, Steuben, Tioga, Tompkins, Warren, Washington, Wayne, Wyoming or Yates<BR>


	</TD></tr> <TR><td bgcolor=d3d3d3 width=498 align=right valign=top>
							<INPUT TYPE=image src="./images/button_continue.gif" border=0>
						</td><TR> </form>

		<cfelseif #FORM.pstate# EQ "TN">
<cfoutput>
<FORM METHOD=POST ACTION="./calculator.cfm?uid=#uid#&al=#al#&loc=#loc#&a_trigger=5&searchtype=#searchtype#&pstate=#pstate#&loanamt_float=#loanamt_float#">
</cfoutput>
	<TR>
     <td bgcolor=white width=780 align=center valign=top>
		<font SIZE="2" face="arial">
			Please choose a county.
		</font>
    </TD>
</TR>
<TR>
	<td bgcolor=elelel width=780 align=left valign=top><font SIZE="2" face="arial">

<input type=radio name="input_val"   value = "8" CHECKED>Davidson County<BR>
<input type=radio name="input_val"   value = "9" >Hamilton County<BR>
<input type=radio name="input_val"   value = "10" >Knox County<BR>
<input type=radio name="input_val"   value = "11">Shelby County<BR>
<input type=radio name="input_val"   value = "12">National Rates: All other counties<BR>


	</TD></tr> <TR><td bgcolor=d3d3d3 width=780 align=right valign=top>
							<INPUT TYPE=image src="./images/button_continue.gif" border=0>
						</td><TR> </form>

			</TD>
		</TR>

		<cfelseif #FORM.pstate# EQ "AZ">
<cfoutput>
<FORM METHOD=POST ACTION="./calculator.cfm?uid=#uid#&al=#al#&loc=#loc#&a_trigger=7&searchtype=#searchtype#&pstate=#pstate#&loanamt_float=#loanamt_float#">
</cfoutput>
	<TR>
     <td bgcolor=white width=780 align=center valign=top>
		<font SIZE="2" face="arial">
			Please choose a county.
		</font>
    </TD>
</TR>
<TR>
	<td bgcolor=elelel width=780 align=left valign=top><font SIZE="2" face="arial">

<input type=radio name="input_val"   value = "18" CHECKED>Maricopa, Pima, Pinal Counties<BR>
<input type=radio name="input_val"   value = "19" >Coconino County<BR>
<input type=radio name="input_val"   value = "20" >Cochise County<BR>
<input type=radio name="input_val"   value = "21">Yavapai County<BR>
<input type=radio name="input_val"   value = "22">Mohave County<BR>
<input type=radio name="input_val"   value = "23">National Rates: All other counties<BR>


	</TD></tr> <TR><td bgcolor=d3d3d3 width=780 align=right valign=top>
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

</cfif>


<CFIF #a_trigger# EQ "1">



					<cfif isdefined ("form.input_val") and #FORM.input_val# is "0">
					<CFSET a_tble_to_read = "StateAlabamaMetro">
					<cfelse>
					<CFSET a_tble_to_read = "StateAlabamaState">
 					</cfif>
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
						<CFELSEIF #x_len# EQ "8">
							<CFSET x_temp = #x# / 100000>
							<CFSET   x_final  = #Round(x_temp)# * 100000>

						</CFIF>

				<!--- Now decide which field to use to do the calc  --->
				<!--- then Query the proper table                   --->

					<CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
      SELECT * FROM #a_tble_to_read# WHERE a_to >= #x_final# order by a_to
      </CFQUERY>
													<!--- * #loanamt_float# --->
					<CFIF #searchtype# EQ "Refinance">
						<CFSET a_ins_premium = #read_ins_calc.Refinance#>

					<CFELSE>
						<CFSET a_ins_premium = #read_ins_calc.sale#>
					</CFIF>




		<CFelseIF #a_trigger# EQ "2">

					<cfif isdefined ("form.input_val") and #FORM.input_val# is "2">
					<CFSET a_tble_to_read = "StateGeorgiaMetro">

		<cfelse>

					<CFSET a_tble_to_read = "StateGeorgiaState">
		</cfif>

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
						<CFELSEIF #x_len# EQ "8">
							<CFSET x_temp = #x# / 100000>
							<CFSET   x_final  = #Round(x_temp)# * 100000>

						</CFIF>

				<!--- Now decide which field to use to do the calc  --->
				<!--- then Query the proper table                   --->

					<CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
      SELECT * FROM #a_tble_to_read# WHERE a_to >= #x_final# order by a_to
      </CFQUERY>
													<!--- * #loanamt_float# --->
					<CFIF #searchtype# EQ "Refinance">
						<CFSET a_ins_premium = #read_ins_calc.Refinance#>

					<CFELSE>
						<CFSET a_ins_premium = #read_ins_calc.sale#>
					</CFIF>


<CFelseIF #a_trigger# EQ "3">
					<cfif isdefined ("form.input_val") and #FORM.input_val# is "4">
					<CFSET a_tble_to_read = "StateMichiganZone2">

		<cfelse>

					<CFSET a_tble_to_read = "StateMichiganZone1">
		</cfif>
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
						<CFELSEIF #x_len# EQ "8">
							<CFSET x_temp = #x# / 100000>
							<CFSET   x_final  = #Round(x_temp)# * 100000>

						</CFIF>

				<!--- Now decide which field to use to do the calc  --->
				<!--- then Query the proper table                   --->

					<CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
      SELECT * FROM #a_tble_to_read# WHERE a_to >= #x_final# order by a_to
      </CFQUERY>
													<!--- * #loanamt_float# --->
					<CFIF #searchtype# EQ "Refinance">
						<CFSET a_ins_premium = #read_ins_calc.Refinance#>

					<CFELSE>
						<CFSET a_ins_premium = #read_ins_calc.sale#>
					</CFIF>

		<CFelseIF #a_trigger# EQ "17">
					<cfif isdefined ("form.input_val") and #FORM.input_val# is "0">
					<CFSET a_tble_to_read = "StateCaliforniaZone2">

		<cfelse>

					<CFSET a_tble_to_read = "StateCaliforniaZone1">
		</cfif>
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
						<CFELSEIF #x_len# EQ "8">
							<CFSET x_temp = #x# / 100000>
							<CFSET   x_final  = #Round(x_temp)# * 100000>

						</CFIF>

				<!--- Now decide which field to use to do the calc  --->
				<!--- then Query the proper table                   --->

					<CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
      SELECT * FROM #a_tble_to_read# WHERE a_to >= #x_final# order by a_to
      </CFQUERY>
													<!--- * #loanamt_float# --->
					<CFIF #searchtype# EQ "Refinance">
						<CFSET a_ins_premium = #read_ins_calc.Refinance#>

					<CFELSE>
						<CFSET a_ins_premium = #read_ins_calc.sale#>
					</CFIF>

		<CFelseIF #a_trigger# EQ "4">
					<cfif isdefined ("form.input_val") and #FORM.input_val# is "6">
					<CFSET a_tble_to_read = "StateNewYorkZone2">

 		<cfelse>

					<CFSET a_tble_to_read = "StateNewYorkZone1">
		</cfif>

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
						<CFELSEIF #x_len# EQ "8">
							<CFSET x_temp = #x# / 100000>
							<CFSET   x_final  = #Round(x_temp)# * 100000>

						</CFIF>

				<!--- Now decide which field to use to do the calc  --->
				<!--- then Query the proper table                   --->

					<CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
      SELECT * FROM #a_tble_to_read# WHERE a_to >= #x_final# order by a_to
      </CFQUERY>
													<!--- * #loanamt_float# --->
					<CFIF #searchtype# EQ "Refinance">
						<CFSET a_ins_premium = #read_ins_calc.Refinance#>

					<CFELSE>
						<CFSET a_ins_premium = #read_ins_calc.sale#>
					</CFIF>

		<CFelseIF #a_trigger# EQ "5">
					<cfif isdefined ("form.input_val") and #FORM.input_val# is "8">
					<CFSET a_tble_to_read = "StateTennesseeZone1">

 					<cfelseif isdefined ("form.input_val") and #FORM.input_val# is "9">
					<CFSET a_tble_to_read = "StateTennesseeZone2">

					<cfelseif isdefined ("form.input_val") and #FORM.input_val# is "10">
					<CFSET a_tble_to_read = "StateTennesseeZone3">
					<cfelseif isdefined ("form.input_val") and #FORM.input_val# is "11">
					<CFSET a_tble_to_read = "StateTennesseeZone4">
		<cfelse>
		<CFSET a_tble_to_read = "StateTennessee">
		</cfif>

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
						<CFELSEIF #x_len# EQ "8">
							<CFSET x_temp = #x# / 100000>
							<CFSET   x_final  = #Round(x_temp)# * 100000>

						</CFIF>


					<CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
      SELECT * FROM #a_tble_to_read# WHERE a_to >= #x_final# order by a_to
      </CFQUERY>

					<CFIF #searchtype# EQ "Refinance">
						<CFSET a_ins_premium = #read_ins_calc.Refinance#>

					<CFELSE>
						<CFSET a_ins_premium = #read_ins_calc.sale#>
					</CFIF>


			<CFelseIF #a_trigger# EQ "7">
					<cfif isdefined ("form.input_val") and #FORM.input_val# is "18">
					<CFSET a_tble_to_read = "StateArizona">

 					<cfelseif isdefined ("form.input_val") and #FORM.input_val# is "19">
					<CFSET a_tble_to_read = "StateArizonaZone2">

					<cfelseif isdefined ("form.input_val") and #FORM.input_val# is "20">
					<CFSET a_tble_to_read = "StateArizonaZone3">
					<cfelseif isdefined ("form.input_val") and #FORM.input_val# is "21">
					<CFSET a_tble_to_read = "StateArizonaZone4">
					<cfelseif isdefined ("form.input_val") and #FORM.input_val# is "22">
					<CFSET a_tble_to_read = "StateArizonaZone5">

		<cfelse>
		<CFSET a_tble_to_read = "StateArizona">
		</cfif>

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
						<CFELSEIF #x_len# EQ "8">
							<CFSET x_temp = #x# / 100000>
							<CFSET   x_final  = #Round(x_temp)# * 100000>

						</CFIF>


					<CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
      SELECT * FROM #a_tble_to_read# WHERE a_to >= #x_final# order by a_to
      </CFQUERY>

					<CFIF #searchtype# EQ "Refinance">
						<CFSET a_ins_premium = #read_ins_calc.Refinance#>

					<CFELSE>
						<CFSET a_ins_premium = #read_ins_calc.sale#>
					</CFIF>


		<CFelseIF #a_trigger# EQ "6">
					<cfif isdefined ("form.input_val") and #FORM.input_val# is "13">
					<CFSET a_tble_to_read = "StateColoradoZone1">

 					<cfelseif isdefined ("form.input_val") and #FORM.input_val# is "14">
					<CFSET a_tble_to_read = "StateColoradoZone2">

					<cfelseif isdefined ("form.input_val") and #FORM.input_val# is "15">
					<CFSET a_tble_to_read = "StateColoradoZone3">
					<cfelseif isdefined ("form.input_val") and #FORM.input_val# is "16">
					<CFSET a_tble_to_read = "StateColoradoZone4">
					<cfelseif isdefined ("form.input_val") and #FORM.input_val# is "17">
					<CFSET a_tble_to_read = "StateColoradoZone5">
					<cfelseif isdefined ("form.input_val") and #FORM.input_val# is "30">
					<CFSET a_tble_to_read = "StateColoradoZone6">
					<cfelseif isdefined ("form.input_val") and #FORM.input_val# is "31">
					<CFSET a_tble_to_read = "StateColoradoZone7">
					<cfelseif isdefined ("form.input_val") and #FORM.input_val# is "32">
					<CFSET a_tble_to_read = "StateColoradoZone8">
					<cfelseif isdefined ("form.input_val") and #FORM.input_val# is "33">
					<CFSET a_tble_to_read = "StateColoradoZone9">
					<cfelseif isdefined ("form.input_val") and #FORM.input_val# is "34">
					<CFSET a_tble_to_read = "StateColoradoZone10">
					<cfelseif isdefined ("form.input_val") and #FORM.input_val# is "35">
					<CFSET a_tble_to_read = "StateColoradoZone11">
					<cfelseif isdefined ("form.input_val") and #FORM.input_val# is "36">
					<CFSET a_tble_to_read = "StateColoradoZone12">
					<cfelseif isdefined ("form.input_val") and #FORM.input_val# is "37">
					<CFSET a_tble_to_read = "StateColoradoZone13">
					<cfelseif isdefined ("form.input_val") and #FORM.input_val# is "38">
					<CFSET a_tble_to_read = "StateColoradoZone14">
					<cfelseif isdefined ("form.input_val") and #FORM.input_val# is "39">
					<CFSET a_tble_to_read = "StateColoradoZone15">
					<cfelseif isdefined ("form.input_val") and #FORM.input_val# is "40">
					<CFSET a_tble_to_read = "StateColoradoZone16">
		<cfelse>
		<CFSET a_tble_to_read = "StateColoradoZone17">
		</cfif>

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
						<CFELSEIF #x_len# EQ "8">
							<CFSET x_temp = #x# / 100000>
							<CFSET   x_final  = #Round(x_temp)# * 100000>

						</CFIF>


					<CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
      SELECT * FROM #a_tble_to_read# WHERE a_to >= #x_final# order by a_to
      </CFQUERY>

					<CFIF #searchtype# EQ "Refinance">
						<CFSET a_ins_premium = #read_ins_calc.Refinance#>

					<CFELSE>
						<CFSET a_ins_premium = #read_ins_calc.sale#>
					</CFIF>




	<cfelse>
			</cfif>





<cfif #a_trigger# eq "1">
		<cfif #read_ins_calc.recordcount# GT 0>
<tr>
			<td width=780 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>R e s u l t </B></CENTER>
			</TD>
		</TR>
	<tr>
			<td width=780 align=left valign=top bgcolor=d3d3d3>
				<table width=780 cellpadding=1 cellspacing=1 border=0>

					<tr>
						<td bgcolor=gray width=780 align=center valign=top>
							<b><FONT FACE=verdana SIZE=1 color="white">
							Title Insurance Premium </b>
						</td>

					</tr>

			<CFOUTPUT>
					<tr>
						<td bgcolor="d3d3d3" width=780 align=center valign=top>
							<FONT FACE=verdana SIZE=2 color="BLACK">Title Insurance Premmium is:&nbsp;</FONT>
							<FONT FACE=verdana SIZE=3 color="blue"><b>#a_ins_premium#</b></font>
						</td>
						</tr>


			<tr>
					<td width=780 colspan=3 align=left valign=top bgcolor=e1e1e1>
						<A href="./calculator.cfm?uid=#uid#&al=#al#"><img src="./images/button_return.gif" border=0></A>
					</td>
				</tr>

			</CFOUTPUT>
	<cfelse>

			<tr>
					<td width=780 align=center valign=top bgcolor=e1e1e1>
							<FONT FACE=verdana SIZE=2 color="black">
							Sorry, there is no match of the loan amout you entered with any fees in out database.
							</td>
				</tr>


			</cfif>

<cfelseif #a_trigger# EQ "2">
<cfif #read_ins_calc.recordcount# GT "0">
<tr>
			<td width=780 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>R e s u l t </B></CENTER>
			</TD>
		</TR>
	<tr>
			<td width=780 align=left valign=top bgcolor=d3d3d3>
				<table width=780 cellpadding=1 cellspacing=1 border=0>

					<tr>
						<td bgcolor=gray width=780 align=center valign=top>
							<b><FONT FACE=verdana SIZE=1 color="white">
							Title Insurance Premium </b>
						</td>

					</tr>

			<CFOUTPUT>
					<tr>
						<td bgcolor="d3d3d3" width=780 align=center valign=top>
							<FONT FACE=verdana SIZE=2 color="BLACK">Title Insurance Premmium is:&nbsp;</FONT>
							<FONT FACE=verdana SIZE=3 color="blue"><b>#a_ins_premium#</b></font>
						</td>
						</tr>

			<tr>
					<td width=780 colspan=3 align=left valign=top bgcolor=e1e1e1>
						<A href="./calculator.cfm?uid=#uid#&al=#al#"><img src="./images/button_return.gif" border=0></A>
					</td>
				</tr>
			</CFOUTPUT>
			<cfelse>

			<tr>
					<td width=780 align=center valign=top bgcolor=e1e1e1>
							<FONT FACE=verdana SIZE=2 color="black">
							Sorry, there is no match of the loan amout you entered with any fees in out database.
							</td>
				</tr>





			</cfif>
<cfelseif #a_trigger# EQ "17">
<cfif #read_ins_calc.recordcount# GT "0">
<tr>
			<td width=780 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>R e s u l t </B></CENTER>
			</TD>
		</TR>
	<tr>
			<td width=780 align=left valign=top bgcolor=d3d3d3>
				<table width=780 cellpadding=1 cellspacing=1 border=0>

					<tr>
						<td bgcolor=gray width=780 align=center valign=top>
							<b><FONT FACE=verdana SIZE=1 color="white">
							Title Insurance Premium </b>
						</td>

					</tr>

			<CFOUTPUT>
					<tr>
						<td bgcolor="d3d3d3" width=780 align=center valign=top>
							<FONT FACE=verdana SIZE=2 color="BLACK">Title Insurance Premmium is:&nbsp;</FONT>
							<FONT FACE=verdana SIZE=3 color="blue"><b>#a_ins_premium#</b></font>
						</td>
						</tr>

			<tr>
					<td width=780 colspan=3 align=left valign=top bgcolor=e1e1e1>
						<A href="./calculator.cfm?uid=#uid#&al=#al#"><img src="./images/button_return.gif" border=0></A>
					</td>
				</tr>
			</CFOUTPUT>
			<cfelse>

			<tr>
					<td width=780 align=center valign=top bgcolor=e1e1e1>
							<FONT FACE=verdana SIZE=2 color="black">
							Sorry, there is no match of the loan amout you entered with any fees in out database.
							</td>
				</tr>





			</cfif>
	<cfelseif #a_trigger# EQ "3">
<cfif #read_ins_calc.recordcount# GT "0">
<tr>
			<td width=780 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>R e s u l t </B></CENTER>
			</TD>
		</TR>
	<tr>
			<td width=780 align=left valign=top bgcolor=d3d3d3>
				<table width=780 cellpadding=1 cellspacing=1 border=0>

					<tr>
						<td bgcolor=gray width=780 align=center valign=top>
							<b><FONT FACE=verdana SIZE=1 color="white">
							Title Insurance Premium </b>
						</td>

					</tr>

			<CFOUTPUT>
					<tr>
						<td bgcolor="d3d3d3" width=780 align=center valign=top>
							<FONT FACE=verdana SIZE=2 color="BLACK">Title Insurance Premmium is:&nbsp;</FONT>
							<FONT FACE=verdana SIZE=3 color="blue"><b>#a_ins_premium#</b></font>
						</td>
						</tr>

			<tr>
					<td width=780 colspan=3 align=left valign=top bgcolor=e1e1e1>
						<A href="./calculator.cfm?uid=#uid#&al=#al#"><img src="./images/button_return.gif" border=0></A>
					</td>
				</tr>

			</CFOUTPUT>

			<cfelse>

			<tr>
					<td width=780 align=center valign=top bgcolor=e1e1e1>
							<FONT FACE=verdana SIZE=2 color="black">
							Sorry, there is no match of the loan amout you entered with any fees in out database.
							</td>
				</tr>


			</cfif>

			<cfelseif #a_trigger# EQ "4">

<tr>
			<td width=780 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>R e s u l t </B></CENTER>
			</TD>
		</TR>
	<tr>
			<td width=780 align=left valign=top bgcolor=d3d3d3>
				<table width=780 cellpadding=1 cellspacing=1 border=0>

					<tr>
						<td bgcolor=gray width=780 align=center valign=top>
							<b><FONT FACE=verdana SIZE=1 color="white">
							Title Insurance Premium </b>
						</td>

					</tr>

			<CFOUTPUT>
					<tr>
						<td bgcolor="d3d3d3" width=780 align=center valign=top>
							<FONT FACE=verdana SIZE=2 color="BLACK">Title Insurance Premmium is:&nbsp;</FONT>
							<FONT FACE=verdana SIZE=3 color="blue"><b>#a_ins_premium#</b></font>
						</td>
						</tr>


			<tr>
					<td width=780 colspan=3 align=left valign=top bgcolor=e1e1e1>
						<A href="./calculator.cfm?uid=#uid#&al=#al#"><img src="./images/button_return.gif" border=0></A>
					</td>
				</tr>
			</CFOUTPUT>



						<cfelseif #a_trigger# EQ "5">

				<cfif #read_ins_calc.recordcount# gt "0">

<tr>
			<td width=780 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>R e s u l t </B></CENTER>
			</TD>
		</TR>
	<tr>
			<td width=780 align=left valign=top bgcolor=d3d3d3>
				<table width=780 cellpadding=1 cellspacing=1 border=0>

					<tr>
						<td bgcolor=gray width=780 align=center valign=top>
							<b><FONT FACE=verdana SIZE=1 color="white">
							Title Insurance Premium </b>
						</td>

					</tr>

			<CFOUTPUT>
					<tr>
						<td bgcolor="d3d3d3" width=780 align=center valign=top>
							<FONT FACE=verdana SIZE=2 color="BLACK">Title Insurance Premmium is:&nbsp;</FONT>
							<FONT FACE=verdana SIZE=3 color="blue"><b>#a_ins_premium#</b></font>
						</td>
						</tr>

		<tr>
					<td width=780 colspan=3 align=left valign=top bgcolor=e1e1e1>
						<A href="./calculator.cfm?uid=#uid#&al=#al#"><img src="./images/button_return.gif" border=0></A>
					</td>
				</tr>

			</CFOUTPUT>
			<cfelse>

			<tr>
					<td width=780 align=center valign=top bgcolor=e1e1e1>
							<FONT FACE=verdana SIZE=2 color="black">
							Sorry, there is no match of the loan amout you entered with any fees in out database.
							</td>
				</tr>


			</cfif>


				<cfelseif #a_trigger# EQ "7">

				<cfif #read_ins_calc.recordcount# gt "0">

<tr>
			<td width=780 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>R e s u l t </B></CENTER>
			</TD>
		</TR>
	<tr>
			<td width=780 align=left valign=top bgcolor=d3d3d3>
				<table width=780 cellpadding=1 cellspacing=1 border=0>

					<tr>
						<td bgcolor=gray width=780 align=center valign=top>
							<b><FONT FACE=verdana SIZE=1 color="white">
							Title Insurance Premium </b>
						</td>

					</tr>

			<CFOUTPUT>
					<tr>
						<td bgcolor="d3d3d3" width=780 align=center valign=top>
							<FONT FACE=verdana SIZE=2 color="BLACK">Title Insurance Premmium is:&nbsp;</FONT>
							<FONT FACE=verdana SIZE=3 color="blue"><b>#a_ins_premium#</b></font>
						</td>
						</tr>

		<tr>
					<td width=780 colspan=3 align=left valign=top bgcolor=e1e1e1>
						<A href="./calculator.cfm?uid=#uid#&al=#al#"><img src="./images/button_return.gif" border=0></A>
					</td>
				</tr>

			</CFOUTPUT>

			<cfelse>

			<tr>
					<td width=780 align=center valign=top bgcolor=e1e1e1>
							<FONT FACE=verdana SIZE=2 color="black">
							Sorry, there is no match of the loan amout you entered with any fees in out database.
							</td>
				</tr>


			</cfif>


									<cfelseif #a_trigger# EQ "6">

									<cfif #read_ins_calc.recordcount# gt "0">
<tr>
			<td width=780 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>R e s u l t </B></CENTER>
			</TD>
		</TR>
	<tr>
			<td width=780 align=left valign=top bgcolor=d3d3d3>
				<table width=780 cellpadding=1 cellspacing=1 border=0>

					<tr>
						<td bgcolor=gray width=780 align=center valign=top>
							<b><FONT FACE=verdana SIZE=1 color="white">
							Title Insurance Premium </b>
						</td>

					</tr>

			<CFOUTPUT>
					<tr>
						<td bgcolor="d3d3d3" width=780 align=center valign=top>
							<FONT FACE=verdana SIZE=2 color="BLACK">Title Insurance Premmium is:&nbsp;</FONT>
							<FONT FACE=verdana SIZE=3 color="blue"><b>#a_ins_premium#</b></font>
						</td>
						</tr>

			<tr>
					<td width=780 colspan=3 align=left valign=top bgcolor=e1e1e1>
						<A href="./calculator.cfm?uid=#uid#&al=#al#"><img src="./images/button_return.gif" border=0></A>
					</td>
				</tr>

			</CFOUTPUT>

					<cfelse>

			<tr>
					<td width=780 align=center valign=top bgcolor=e1e1e1>
							<FONT FACE=verdana SIZE=2 color="black">
							Sorry, there is no match of the loan amout you entered with any fees in out database.
							</td>
				</tr>


			</cfif>

			</cfif>
				</table>


			</TD>
		</TR>

	</table>



	<!--- </td> <tr><td width=780 align=left valign=bottom><IMG src="./images/bottom.gif" width = "780"></td></tr></TBODY></TABLE>
</tr></tbody></table> --->

</BODY>
</HTML>


