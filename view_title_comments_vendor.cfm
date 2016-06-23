
<CFPARAM NAME="a_direction" DEFAULT="">
<CFPARAM NAME="Insurance_Company" DEFAULT="">
<CFPARAM NAME="Title_Ins_Co_Is" DEFAULT="0">
<CFPARAM NAME="A_Update_DB_Flag" DEFAULT="0">
<CFPARAM NAME="N_Note_1" DEFAULT="0">






		<!--- ===/ If the A_Update_DB_Flag is GT 0   \=== --->
		<!--- ===/ then we need to update the proper \=== --->
		<!--- ===/ Table with the data from the form \=== --->



		<!--- <CFIF #A_Update_DB_Flag# GT "0"> --->

			<!---  <CFQUERY datasource="#request.dsn#" NAME="read_uder_info">
				SELECT *
				FROM First_Admin
				WHERE ID = #URL.uid#
			</CFQUERY>
		 --->



			<!--- <CFQUERY datasource="#request.dsn#">
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time)
				VALUES('#read_uder_info.FName#', '#read_uder_info.LName#', #URL.rec_id#, '#N_Note_1#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#')
			</CFQUERY>

		</CFIF>
 --->

	<!--- Read all of the Notes for this title --->

		<CFQUERY datasource="#request.dsn#" NAME="read_all_notes">
				SELECT *
				FROM Title_Notes
				Where Order_Id = #URL.rec_id# and note_type = 'T' and access2 = 1
				ORDER BY Note_ID ASC
			</CFQUERY>


		<CFQUERY datasource="#request.dsn#" NAME="read_vendor_notes">
				SELECT *
				FROM Title_Notes
				Where Order_Id = #URL.rec_id# and note_type = 'V' and access2 = 1
				ORDER BY Note_ID ASC
			</CFQUERY>




<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>


</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>
<table width=590 cellpadding=1 cellspacing=1 border=0 bgcolor=d3d3d3>
	<tr>
		<td width=590 align=center valign=top>

<table width=590 cellpadding=1 cellspacing=1 border=0 bgcolor=white>

		<td width=590 align=center valign=top bgcolor=e1e1e1>


<table width=590 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>


		<tr>
			<td width=590  align=right valign=top bgcolor=e1e1e1>
			<tr>
			<td width=590 align=center valign=top bgcolor=green>
				<font face=verdana size=1 color=white>
				<b>View Comments for order <CFOUTPUT>#url.rec_id#</CFOUTPUT></a>
		</tr>
				<cfif #read_all_notes.recordcount# GT 0>
<table width=590 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=590 align=center valign=top bgcolor=e1e1e1>
		<B><font face=verdana size=2 color=blue>Processing Notes</FONT></B>
</td></tr></table></cfif>
<CFOUTPUT QUERY="Read_all_notes">

	<table width=590 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=black>
						#DateFormat(N_Date, "mm/dd/yyyy")#
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=black>
						#TimeFormat(N_Time, "HH:mm:ss")#
					</td>
					<td width=125 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=black>
						#Fname# #LName#
					</td>
				<tr>
			</table>

		<td width=444 align=left valign=top bgcolor=e1e1e1>
			<PRE><font face=verdana size=1 color=black>#N_Note#</PRE>
		</td>
	</tr>
</table>

</CFOUTPUT>
<cfif #Read_vendor_notes.recordcount# GT 0>
<table width=590 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=590 align=center valign=top bgcolor=e1e1e1>
		<B><font face=verdana size=2 color=blue>Vendor Management Notes</FONT></B>
</td></tr></table></cfif>
<CFOUTPUT QUERY="Read_vendor_notes">

	<table width=590 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>

		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=black>
						#DateFormat(N_Date, "mm/dd/yyyy")#
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=black>
						#TimeFormat(N_Time, "HH:mm:ss")#
					</td>
					<td width=125 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=black>
						#Fname# #LName#
					</td>
				<tr>
			</table>

		<td width=444 align=left valign=top bgcolor=e1e1e1>
			<PRE><font face=verdana size=1 color=black>#N_Note#</PRE>
		</td>
	</tr>
</table>

</CFOUTPUT>

<p>

<!--- <CFFORM NAME="frm" ACTION="./Title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#url.rec_id#&a_trigger=1&Title_Ins_Co_Is=#Title_Ins_Co_Is#&A_Update_DB_Flag=1" METHOD=POST>

	<table width=590 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
		<tr>
			<td width=590 align=center valign=top bgcolor=green>
				<font face=verdana size=1 color=white>
				<b>Add Comments for order <CFOUTPUT>#url.rec_id#</CFOUTPUT></a>
		</tr>
		<tr>
			<td width=590 align=left valign=top bgcolor=e1e1e1>
		<font face=verdana size=1 color=blue>
		<br>Select an event here </font>
				<select name="otherpro" onchange="result()"
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
	  <option value="Selectval">Select</OPTION>
	  <option value="Court House Closed">Court House Closed</OPTION>
	  <option value="Waiting on Tax Info.">Waiting on Tax Info.</OPTION>
	  <option value="In Typing">In Typing</OPTION>
	  <option value="Waiting on Judgment Info">Waiting on Judgment Info</OPTION>
      <option value="Call for Detail">Call for Detail</OPTION>
	  <option value="Judgments Exist">Judgments Exist</OPTION>
	  <option value="Subordination Needed">Subordination Needed</OPTION>
	  <option value="Vesting Issue">Vesting Issue</OPTION>
	  <option value="Unreleased Mortgages Exists">Unreleased Mortgages Exists</OPTION>
	  <option value="Clear to Close">Clear to Close</OPTION>
	 <option value="Cancelled per client" style="thin">Cancelled per client</OPTION>

	  <option value=""></option>
	  </select> <font face=verdana size=1 color=blue> and/or simply type below and click "ADD" <br><br>


				<TEXTAREA name="N_Note_1"  COLS=80 ROWS=10
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
					clear: none;"></TEXTAREA>
		</tr>
		<tr>
			<td width=590 align=right valign=top bgcolor=e1e1e1>
				<input type=image src="./images/button_add.gif" border=0>
		</tr>
	</table>

</table>
			</td>
		</tr>
</table>

				</FORM>
<p>
<p>
 --->
<!---<font size=2 color=blue face=arial>
		<cfoutput>
		Click here to go back to the main page.<A HREF="./title_rep_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#url.rec_id#&a_trigger=1">
		<img src="./images/button_return.gif" border=0 ALT="Click this button to return to main"></a>
	 </cfoutput>

 &user_id=#user_id#&company_id=#url.company_id#&title_id=#url.title_id#&oda_year=#url.oda_year#&oda_day=#url.oda_day#&oda_month=#url.oda_month#&comments=#url.comments#&appraisal_status=#url.appraisal_status#&sortorder=#url.sortorder#&buyer_fname=#url.buyer_fname#&buyer_lname=#url.buyer_lname# --->

<br><br>
<a href="javascript:window.close();"><img src="./images/button_close.gif" border=0></a>
</td>
</tr>

	</table>


			</TD>
		</TR>

	</table>
<!--- </CFFORM>	 --->
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


