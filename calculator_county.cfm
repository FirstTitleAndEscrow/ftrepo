<CFPARAM NAME="searchtype"     DEFAULT="">
<CFPARAM NAME="pstate"       DEFAULT="">
<CFPARAM NAME="loanamt_float"    DEFAULT="">
<CFPARAM NAME="input_val"     DEFAULT="">
<CFPARAM NAME="a_trigger"   DEFAULT="0">





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
						</CFIF>

				<!--- Now decide which field to use to do the calc  --->
				<!--- then Query the proper table                   --->

					<CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
      SELECT * FROM #a_tble_to_read# WHERE a_to >= #x_final#
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

		<cfelse>
		<CFSET a_tble_to_read = "StateColoradoZone5">
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
						</CFIF>


					<CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
      SELECT * FROM #a_tble_to_read# WHERE a_to >= #x_final# order by a_to
      </CFQUERY>	 --->

					<CFIF #searchtype# EQ "Refinance">
						<CFSET a_ins_premium = #read_ins_calc.Refinance#>

					<CFELSE>
						<CFSET a_ins_premium = #read_ins_calc.sale#>
					</CFIF>




	<cfelse>
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
				<CENTER><B>Title Insurance Calculator Results</B></CENTER>
			</TD>
		</TR>

<cfif #a_trigger# eq "1">

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


<cfelseif #a_trigger# EQ "2">

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
	<cfelseif #a_trigger# EQ "3">

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
			<cfelseif #a_trigger# EQ "4">

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



						<cfelseif #a_trigger# EQ "5">

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

									<cfelseif #a_trigger# EQ "6">

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
