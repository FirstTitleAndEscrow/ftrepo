<CFPARAM NAME="proptype" DEFAULT="">
<CFPARAM NAME="taxid" DEFAULT="">
<CFPARAM NAME="parcel" DEFAULT="">
<CFPARAM NAME="exempt" DEFAULT="">
<CFPARAM NAME="amount" DEFAULT="">
<CFPARAM NAME="extype" DEFAULT="">
<CFPARAM NAME="land" DEFAULT="">
<CFPARAM NAME="impass" DEFAULT="">
<CFPARAM NAME="other" DEFAULT="">
<CFPARAM NAME="val" DEFAULT="">
<CFPARAM NAME="tx" DEFAULT="">
<CFPARAM NAME="tax_year" DEFAULT="">
<CFPARAM NAME="inst_monx" DEFAULT="">
<CFPARAM NAME="inst_dayx" DEFAULT="">
<CFPARAM NAME="inst_yearx" DEFAULT="">
<CFPARAM NAME="inst_mont" DEFAULT="">
<CFPARAM NAME="inst_dayt" DEFAULT="">
<CFPARAM NAME="inst_yeart" DEFAULT="">
<CFPARAM NAME="rec_mont" DEFAULT="">
<CFPARAM NAME="rec_dayt" DEFAULT="">
<CFPARAM NAME="rec_yeart" DEFAULT="">
<CFPARAM NAME="stat" DEFAULT="">
<CFPARAM NAME="pay_to" DEFAULT="">
<CFPARAM NAME="txamt" DEFAULT="">
<CFPARAM NAME="del_year" DEFAULT="">
<CFPARAM NAME="infotax" DEFAULT="">
<CFPARAM NAME="a_trigger" DEFAULT="0">
<CFPARAM NAME="taxes_completed" DEFAULT="0">


<cfif #a_trigger# eq 1>

<cfif #rec_yeart# NEQ "" AND #rec_mont# NEQ "" AND #rec_dayt# NEQ "">
<CFSET recdatet = #CreateDate(#rec_yeart#, #rec_mont#, #rec_dayt#)#>
<cfelse>
<cfset recdatet = "">
</cfif>

<CFSET c_date = #DateFormat(Now(), "mm/dd/yyyy")#>
<CFSET c_time = #TimeFormat(Now(), "HH:mm:ss")#>



<CFSET order_date_adj = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>

<CFQUERY datasource="#request.dsn#" NAME="read_user">
	SELECT     First_Admin.fname, First_Admin.lname
	FROM       tblUser_Roles LEFT OUTER JOIN
               First_Admin ON tblUser_Roles.payoff_ID = First_Admin.ID
	WHERE      (tblUser_Roles.Title_ID = #rec_id#)
</CFQUERY>

<CFQUERY datasource="#request.dsn#" >
	UPDATE tblUser_Roles
	SET 	payoff_Finish_Datetime = getDate()
	where title_id = #rec_id#
 </cfquery>

 <!---Create note that Taxes were completed--->
 <cfif taxes_completed eq 1>
 <CFQUERY datasource="#request.dsn#">
						INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type)
						VALUES('Auto', 'Web', #rec_id#,'Taxes completed by #read_user.fname# #read_user.lname#' ,'#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T')
</CFQUERY>
</cfif>

<CFQUERY datasource="#request.dsn#" >

			UPDATE tax_cert_title
			SET 	a_date_started = 'Yes',
			 <cfif taxes_completed eq 1>
			 taxes_completed = 1,
			 </cfif>
			 a_date_finished = '#c_date#',
			t_dateandtime = '#order_date_adj#',
			a_time_finished = '#c_time#',
			data19 = '#taxid#',
			data28 = '#tx#',
			data29 = '#tax_year#',
			data30 = '#duedate#',
			data31 = '#stat#',
			data34 = '#infotax#',
			data36 = '#DateFormat(recdatet, "mm/dd/yyyy")#',
			data37 = '#howoften#'
			where title_id = #rec_id#

 </cfquery>
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_report">

			SELECT *
			FROM tax_cert_title
			where title_id = #rec_id#
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_title">

			SELECT *
			FROM Title
			WHERE title_ID = #rec_ID#

		</CFQUERY>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>
<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=790 align=center valign=top>

<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
			<td width=790 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Title Committment Report</B></CENTER>
			</TD>
		</TR>

	<tr>
		<td width=790 align=center valign=top bgcolor=e1e1e1>

		<cfif username eq "richmond_vendor">
		<CFINCLUDE TEMPLATE="./includes/title_top_navt.cfm">
        <cfelse>
		<CFINCLUDE TEMPLATE="./admin_area/includes/title_top_nav.cfm">
		</cfif>




<!--- =================================== --->
<!--- =================================== --->


<CFOUTPUT>


<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>

		<tr>
			<td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3>
				<font size=2 color=black face=arial>
				<B>Property Address:</B>
			</td>
		</tr>

		<tr>
			<td width=519 colspan=2  align=center valign=top bgcolor=e1e1e1>

				<table width=518 cellpadding=1 cellspacing=1 border=0>
					<tr>
						<td width=217 align=right valign=top>
							<font size=2 color=blue face=arial>
							<B>#read_title.paddress#</B>
						</td>

						<td width=120 align=right valign=top>
							<font size=2 color=blue face=arial>
							<B>#read_title.pcity#</B>
						</td>

						<td width=20 align=right valign=top>
							<font size=2 color=blue face=arial>
							<B>#read_title.pstate#</B>
						</td>

						<td width=60 align=right valign=top>
							<font size=2 color=blue face=arial>
							<B>#read_title.pzip#</B>
						</td>
						<td width=100 align=right valign=top>
							<font size=2 color=blue face=arial>
							<B>#read_title.pcounty#</B>
						</td>
					</tr>
					<tr>
						<td width=517 colspan=5 align=right valign=top>
							<font size=2 color=blue face=arial>
							Loan Amount is.... <font size=2 color=blue face=arial>
							<B>$ #NumberFormat(read_title.loanamt_float, "999,999,999.99")#</B><br>
							</td>
					</tr>

				</table>

			</td>
		</tr>
<!--- =========================================================== --->
		<tr>
			<td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3>
				<font size=2 color=black face=arial>
				<B>Tax Bill - Payment Information:</B>
			</td>
		</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Tax ID


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#taxid#


		</td>
	</tr>


	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Tax Amount


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
	#tx#


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			How often


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
	#howoften#


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Tax Year


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
	#tax_year#


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Due Date


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#duedate#



		</td>
	</tr>
		 <tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Taxes Paid Through


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		#rec_mont#/#rec_dayt#/#rec_yeart#



		</td>
	</tr>



	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Tax Status


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
						#stat#

		</td>
	</tr>
	<tr>
	<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>

		Additional Info

		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#infotax#

		</td>
	</tr>

	</table>

</CFOUTPUT>


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