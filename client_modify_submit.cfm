	<CFPARAM NAME="intCustServ" DEFAULT="">
	<CFPARAM NAME="intSales" DEFAULT="">
    <CFPARAM NAME="companies_switch" DEFAULT="0">

	<CFIF #Len(intSales)# gte 4>
	<CFSET numberTime = 				#Find(",", intSales, 1 )#>
	<CFSET numberTime = #numbertime# - 1>
    <cfset intSales = #Mid(intSales,1,numbertime)#>
  </CFIF>
	<!---Customer Service Name ---->
	<CFIF #Form.intCustServ# neq "">
		<CFQUERY datasource="#request.dsn#" NAME="read_company_cserv">
			SELECT   fname + lname AS Name
			FROM     First_Admin
			WHERE    (ID = #intCustServ#)
 	 	</CFQUERY>
  	<CFELSE>
  		<CFSET intCustServ = "null">
	</CFIF>
	<!---Salesman Name --->
	<CFIF #Form.intSales# neq "">
	<CFQUERY datasource="#request.dsn#" NAME="read_company_Sales">
					  SELECT   fname + lname AS Name
					  FROM     First_Admin
					  WHERE    (ID = #intSales#)
	</CFQUERY>
	<CFELSE>
	<CFSET intSales = "null">
	</CFIF>
	<!---Set Boolean Values that are "on" to one and all others to zero --->
	<CFIF #Report# eq "On">
		<CFSET Report = "1">
	<cfelse>
		<CFSET Report = "0">
	</CFIF>
	<CFIF #Commit# eq "On">
		<CFSET Commit = "1">
	<cfelse>
		<CFSET Commit = "0">
	</CFIF>
	<CFIF #ClearC# eq "On">
		<CFSET ClearC = "1">
	<cfelse>
		<CFSET ClearC = "0">
	</CFIF>
	<CFIF #FullService# eq "On">
		<CFSET FullService = "1">
	<cfelse>
		<CFSET FullService = "0">
	</CFIF>
	<CFIF #Payoff# eq "On">
		<CFSET Payoff = "1">
	<cfelse>
		<CFSET Payoff = "0">
	</CFIF>
	<CFIF #disbursements# eq "On">
		<CFSET disbursements = "1">
	<cfelse>
		<CFSET disbursements = "0">
	</CFIF>
	<CFIF #recording# eq "On">
		<CFSET recording = "1">
	<cfelse>
		<CFSET recording = "0">
	</CFIF>
	<CFIF #appraisal# eq "On">
		<CFSET appraisal = "1">
	<cfelse>
		<CFSET appraisal = "0">
	</CFIF>
	<CFIF #signing# eq "On">
		<CFSET signing = "1">
	<cfelse>
		<CFSET signing = "0">
	</CFIF>
	<CFIF #shipping# eq "On">
		<CFSET shipping = "1">
	<cfelse>
		<CFSET shipping = "0">
	</CFIF>

<CFQUERY datasource="#request.dsn#">

			UPDATE companies
			SET company = '#company#',
			    a_user = '#a_user#',
				a_pass = '#a_pass#',
				phone = '#phone#',
				fax = '#fax#',
				addr1 = '#addr1#',
				addr2 = '#addr2#',
				city = '#city#',
				state = '#state#',
				zip_code = '#zip_code#',
				email = '#email#',
				a_note_1 = '#a_note_1#',
				a_date_mod = '#DateFormat(Now(), "mm/dd/yy")#',
				a_time_mod = '#TimeFormat(Now(), "HH:mm:ss")#',
				a_status = #a_status#,
				comment = '#comment#',
				a_uid_mod = '#URL.uid#',
				intCustServ = #intCustServ#,
				intSales = #intSales#,
				blnCommit = #commit#,
				blnFullServ = #FullService#,
				blnClearc = #clearc#,
				blnPayoff = #payoff#,
				blnDisbursements = #disbursements#,
				blnRecording = #recording#,
				blnAppraisal = #appraisal#,
				blnSigning = #signing#,
				blnShipping = #shipping#,
				FeeVestingLegal = #lstVesting#,
				FeeCurrentOwner = #lstOwner#,
				FeeFullSearch = #lstFullSearch#,
				FeePolicyOnly = #lstCommitOnly#,
				FeeSigning = #lstSigning#,
				FeeRecording = 60,
				FeeAppraisal = #lstAppraisal#,
                companies_switch = #companies_switch#
			WHERE ID = #company_id#

		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_company">
					  SELECT   *
					  FROM     Companies
					  WHERE    (ID = #company_id#)
	</CFQUERY>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE><cfoutput>#session.site.short_name#</cfoutput> Services Admin</TITLE>
</HEAD>
<BODY BGCOLOR=e1e1e1 TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>
<CENTER>

<table width=500 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=500 align=center valign=top>
<table width=499 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=499 align=center valign=top bgcolor=e2e2e2>
			<FONT SIZE=2 color=black face=arial>
<table width=498 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>
<CFOUTPUT>
	<tr>
		<td width=498 align=center valign=top bgcolor=white>
			<font size=2 color=black face=arial>Modify Mortgage Client/Customer
		</td>
	</tr>
</CFOUTPUT>
</table>
		</td>
	</tr>
	<tr>
		<td width=499 align=center valign=top bgcolor=white>
<table width=498 cellpadding=0 cellspacing=0 border=0 bgcolor=white>
	<tr>
		<td width=130 align=left valign=top bgcolor=d3d3d3>
			<FONT SIZE=2 color=green face=arial>
			The Client has been sucessfully MODIFIED.
			<p>
			To adjust the charges associated with line items on the HUD form for this client, click on the link below.
			<p><FONT SIZE=2 color=black face=arial>
<CFOUTPUT>
			<a href="./client_line_costs_select.cfm?uid=#URL.uid#&al=#URL.al#&company_id=#company_ID#"><img src="./images/button_line_costs.gif" border=0></a>
			<p>
			<a href="./client_lenders_select.cfm?uid=#URL.uid#&al=#URL.al#&company_id=#company_ID#"><img src="./images/button_lenders.gif" border=0></a>
</CFOUTPUT>
		</td>
		<td width=368 align=left valign=top bgcolor=e1e1e1>
<table width=367 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
<CFOUTPUT>
	<tr>
		<td width=367 colspan=2 align=right valign=top bgcolor=e6e6e6>
			<img src="./images/clear.gif" height=10 width=85>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Company Name
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#company#</B>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<b><font size=2 color=blue face=arial>
			Username - </b>
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=red face=arial>
			<b>#a_user#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<b><font size=2 color=blue face=arial>
			Password - </b>
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=red face=arial>
			<b>#a_pass#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Address1 -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#addr1#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Address2 -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#addr2#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Note -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#a_note_1#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			City -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#city#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			State -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#state#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Zip Code -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#zip_CODE#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Phone -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#phone#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Fax -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#fax#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Email -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#email#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Customer Service -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<CFIF #Form.intCustServ# neq "">
			<b>#read_company_cserv.name#</b>
			</CFIF>
		</td>
	</tr>
		<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Sales Person -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<CFIF #Form.intSales# neq "">
				<b>#read_company_Sales.name#</b>
			</CFIF>
		</td>
	</tr>
	<tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Status
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
					<CFIF #a_status# EQ "0">
						<font size=2 color=red face=arial><B>In-Active</B></FONT>
					<CFELSE>
						<font size=2 color=green face=arial><B>Active</B></FONT>
					</CFIF>
		</td>
	</tr>
    <tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Allow Employee Authentication
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
					<CFIF #companies_switch# NEQ "1">
						<font size=2 color=red face=arial><B>No</B></FONT>
					<CFELSE>
						<font size=2 color=green face=arial><B>Yes</B></FONT>
					</CFIF>
		</td>
	</tr>
	<tr>
		<td width=130  align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Comment
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#Comment#</b>
		</td>
	</tr>
	<!---New Stuff - Harry 091504 --->
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Required Services
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial><b>
			 	<CFIF #read_company.blnCommit# eq 1>
					Insurance Commitment Policy<BR>
				</CFIF>
				<CFIF #read_company.blnFullServ# eq 1>
					Full Closing Services<BR>
				</CFIF>
				<CFIF #read_company.blnClearc# eq 1>
					Clearc<BR>
				</CFIF>
				<CFIF #read_company.blnPayoff# eq 1>
					Payoff<BR>
				</CFIF>
				<CFIF #read_company.blnDisbursements# eq 1>
					Disbursements<BR>
				</CFIF>
				<CFIF #read_company.blnRecording# eq 1>
					Recording<BR>
				</CFIF>
                <CFIF #read_company.blnAppraisal# eq 1>
					Appraisal<BR>
				</CFIF>
                <CFIF #read_company.blnSigning# eq 1>
					Signing Services<BR>
				</CFIF>
				<CFIF #read_company.blnShipping# eq 1>
					Special Shipping Requirements
				</CFIF>
			</b></font>
		</td>
	</tr>
	<tr>
	<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Fees
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial><b>
			<CFIF #Len(read_company.FeeVestingLegal)# gte 1 >
				Vesting + Legal #dollarformat(read_company.FeeVestingLegal)#<br>
			</CFIF>
			<CFIF #Len(read_company.FeeCurrentOwner)# gte 1 >
				Current Owner #dollarformat(read_company.FeeCurrentOwner)#<br>
			</CFIF>
			<CFIF #Len(read_company.FeeFullSearch)# gte 1 >
				Full Search #dollarformat(read_company.FeeFullSearch)#<br>
			</CFIF>
			<CFIF #Len(read_company.FeePolicyOnly)# gte 1 >
				Commit/Policy Only $295 + Policy & &nbsp;&nbsp;&nbsp;Binder #dollarformat(read_company.FeePolicyOnly)#<br>
			</CFIF>
			<CFIF #Len(read_company.FeeSigning)# gte 1 >
				National Signing Services  #Dollarformat(read_company.FeeSigning)#<br>
			</CFIF>
			<CFIF #Len(read_company.FeeRecording)# gte 1 >
				Recording Services  #DollarFormat(read_company.FeeRecording)#<br>
			</CFIF>
			<CFIF #Len(read_company.FeeAppraisal)# gte 1 >
				Appraisal #DollarFormat(read_company.FeeAppraisal)#
			</CFIF>
	</tr>
</CFOUTPUT>
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

