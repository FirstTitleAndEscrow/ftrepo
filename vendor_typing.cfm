<cfif IsDefined("form.rec_id")>
<cfset url.rec_id = form.rec_id>
</cfif>

<cfparam name="url.cleartoclose" default="">
<CFPARAM NAME="a_trigger" DEFAULT="">
<CFPARAM NAME="a_trig" DEFAULT="">


<CFQUERY datasource="#request.dsn#" NAME="get_file_type">
select order_type from vendor_tracker_new
where <!--- vendor_id = #session.logged_in_vendor_id#
and  --->order_id = #url.rec_id#
and task = 'Typing'
</CFQUERY>


<cfif get_file_type.order_type eq 'P'>
		<CFQUERY datasource="#request.dsn#" NAME="read_order">
			SELECT *
			FROM property
			WHERE prop_id = #url.rec_id#
		</CFQUERY>
<cfelse>
		<CFQUERY datasource="#request.dsn#" NAME="read_order">
			SELECT *
			FROM title
			WHERE title_id = #url.rec_id#
		</CFQUERY>
</cfif>




<cfif url.cleartoclose eq 1>
<!--- new Vendor Manager --->
<CFQUERY datasource="#request.dsn#" NAME="find_new_vendor">
select vendor_id from Vendor_Tracker_New
where Order_id = #url.rec_ID#
and task = 'Review'
and (completed = 0 or completed IS NULL)
</cfquery>
<cfif find_new_vendor.recordcount gt 0>
<CFQUERY datasource="#request.dsn#" NAME="find_new_vendor_info">
select company from Vendors_Stacie
where vendor_id = #find_new_vendor.vendor_id#
</cfquery>

<CFQUERY datasource="#request.dsn#" NAME="insert_abs">
update Vendor_Tracker_New
set return_date = '#DateFormat(Now(), "mm/dd/yyyy")#',
return_time = '#TimeFormat(Now(), "HH:mm:ss")#',
completed = 1
where Order_id = #url.rec_ID#
and task = 'Review'
and completed is NULL
</cfquery>
<CFQUERY datasource="#request.dsn#" name="write_note">
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('Web', 'System', #url.rec_ID#, 'Title Review Completed by #find_new_vendor_info.company#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')
		</CFQUERY>
</cfif>
<!--- new vendor manager end --->

					<CFQUERY datasource="#request.dsn#">
						Update tax_cert_title
						set clear_close = 1
						where title_id = #url.rec_id#
					</CFQUERY>
					<CFQUERY datasource="#request.dsn#">
						Update tblUser_Roles
						set cleartoclose_End_Datetime = getdate()
						where title_id = #url.rec_id#
					</CFQUERY>
                     <!---If this is Weichert then they need to receive an email.--->
                    <CFQUERY datasource="#request.dsn#" Name="read_title">
				        Select * from Title
				        where title_id = #url.rec_id#
			        </CFQUERY>
                    <CFQUERY datasource="#request.dsn#" Name="read_comp_id">
				        Select * from companies
				        where id = #read_title.comp_id#
			        </CFQUERY>
                    <!--- <CFIF #read_title.comp_id# eq "559"><!---Change to Weichert after testing--->
                        <CFMAIL
				            TO="#read_title.o_email#,#read_title.p_email#"
				            FROM="#team_email#"
				            Subject="First Title Order Number - #read_title.Title_ID# #read_title.bfirstname1# #read_title.blastname1#"
				            TIMEOUT="600"
				            >
				        First Title Order number #read_title.Title_ID# for #read_title.bfirstname1# #read_title.blastname1# is marked Clear To Close.
                        </cfmail>
                    </CFIF>  --->
					<cfset email_flag=0>

					 <CFQUERY DATASOURCE="#request.dsn#" Name="get_comp_info">
				        Select * from Companies
				        where id = #read_title.comp_id#
			        </CFQUERY>
                    <cfif get_comp_info.company contains 'MB Financial' or get_comp_info.company contains'Inland Bank'>
							<cfset cleartoclose_email="#read_title.Verifyemail#">
							<cfset email_flag=1>
					<CFELSEIF #read_title.comp_id# eq "559">
							<cfset cleartoclose_email="#read_title.o_email#;#read_title.p_email#">
							<cfset email_flag=1>
					<cfelseif #read_title.comp_id# eq "859" or #read_title.comp_id# eq "919"
						   or #read_title.comp_id# eq "953" or #read_title.comp_id# eq "947"
						   or #read_title.comp_id# eq "946" or #read_title.comp_id# eq "948"
						   or #read_title.comp_id# eq "944" or #read_title.comp_id# eq "949"
						   or #read_title.comp_id# eq "951" or #read_title.comp_id# eq "945"
						   or #read_title.comp_id# eq "950" or #read_title.comp_id# eq "943"
						   or #read_title.comp_id# eq "941" or #read_title.comp_id# eq "942"
						   or #read_title.comp_id# eq "968">
							  <cfset cleartoclose_email="#read_title.o_email#;#read_title.p_email#;kklos@weichertfinancial.com">
					<cfset email_flag=1>
					</CFIF>

	<cfif read_comp_id.team_id eq 18>
	<cfset title_co_name = "Axiom Title">
	<cfelse>
	<cfset title_co_name = "First Title">
	</cfif>
					<cfif email_flag eq "1">
						<CFMAIL
				            TO="#cleartoclose_email#"
				            FROM="#team_email#"
				            Subject="#title_co_name# Order Number - #read_title.Title_ID# #read_title.bfirstname1# #read_title.blastname1#"
				            TIMEOUT="600"
				            >
				        #title_co_name# Order number #read_title.Title_ID# for #read_title.bfirstname1# #read_title.blastname1# is marked Clear To Close.
                    </cfmail>
					</cfif>

					<!---If the old message was Not Clear To Close and this was on a
					processors screen then the data and time needs to be changed--->
					<CFQUERY datasource="#request.dsn#" NAME="Not_Clear_To_Close">
						SELECT     *
						FROM         Title_Notes
						WHERE     (N_Note = 'Not Clear To Close') and Order_ID = #url.rec_id#
						order by n_date, n_time
					</CFQUERY>
					<CFIF #Not_Clear_To_Close.RecordCount# gte 1>
						<!---Is the Title_ID in Processing or Pre-Processing--->
						<!---If it's in neither then don't worry about it. --->
						<CFQUERY datasource="#request.dsn#" NAME="Not_Preprocessing">
							Select * from sqlPreprocessing_NotClearToClose where Title_ID = #url.rec_id#
						</CFQUERY>
						<CFIF #Not_Preprocessing.RecordCount# gte 1>
							<!---update time --->
                            <CFQUERY datasource="#request.dsn#">
							    Update tblUserRoles
							    set preprocessor_start_datetime = #Now()#
							    where Title_ID = #rec_id#
                            </CFQUERY>
						</CFIF>
						<CFQUERY datasource="#request.dsn#" NAME="Not_Processing">
							Select * from sqlProcessing_NotClearToClose where Title_ID = #url.rec_id#
						</CFQUERY>
						<CFIF #Not_Processing.RecordCount# gte 1>
							<!---Update time --->
							 <CFQUERY datasource="#request.dsn#">
							    Update tblUserRoles
							    set processor_start_datetime = #Now()#
							    where Title_ID = #rec_id#
                            </CFQUERY>
						</CFIF>
					</CFIF>
<!--- //Clear to close END --->


<cflocation url="vendor_landing.cfm?vendor_id=#session.logged_in_vendor_id#">
</cfif>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
</head>

<BODY BGCOLOR="elelel" TEXT="#000000" LINK="#ff0000" VLINK="#800000" ALINK="#ff00ff" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth="0" MarginHeight="0">

<CENTER>
<CENTER>
<table width=830 cellpadding=1 cellspacing=1 border=0 bgcolor="gray">
	<tr>
		<td width=830 align=middle valign=top>


		<table width=830 cellpadding=1 cellspacing=1 border=0 bgcolor="white">

		<!---<tr> <td width=830 align=middle valign=top bgcolor="e1e1el">
			<IMG src="./images/logo_title_reports.gif">

		</td></tr> --->




	<tr>
		<td width=830 align=middle valign=top bgcolor=e1e1el>







<CFINCLUDE TEMPLATE="includes/title_top_navt.cfm">



		</td>

		</tr>



	</table>


			</td>
		</tr>

	</table>

<table width=830 cellpadding=1 cellspacing=1 border=0 bgcolor="white">

		<!---<tr> <td width=830 align=middle valign=top bgcolor="e1e1el">
			<IMG src="./images/logo_title_reports.gif">

		</td></tr> --->




	<tr>
		<td width=830 align=middle valign=top bgcolor=e1e1el>






<cfset Im_A_Vendor = 1>
<CFINCLUDE TEMPLATE="admin_area/title_committment.cfm">



		</td>

		</tr>



	</table>

		<cfif #a_trig# eq 1>

			<table width=830 cellpadding=1 cellspacing=1 border=0 bgcolor="white">

		<!---<tr> <td width=830 align=middle valign=top bgcolor="e1e1el">
			<IMG src="./images/logo_title_reports.gif">

		</td></tr> --->




	<tr>
		<td width=830 align=middle valign=top bgcolor=e1e1el>






<b><font face=verdana size=2 color=blue>All selected item(s) were successfully merged to Title Commitment!</font></b>


		</td>

		</tr>



	</table>

</cfif>


			<table width=830 cellpadding=1 cellspacing=1 border=0 bgcolor="white">

		<!---<tr> <td width=830 align=middle valign=top bgcolor="e1e1el">
			<IMG src="./images/logo_title_reports.gif">

		</td></tr> --->




	<tr>
		<td width=830 align=middle valign=top bgcolor=e1e1el>





	<cfoutput>
Click here to go back to the main page.<a href="./vendor_landing.cfm?vendor_id=#session.logged_in_vendor_id#"><img src="./images/button_return.gif" border=0 ALT="Click this button to return to main"></a>
		</cfoutput>


		</td>

		</tr>



	</table>

			</td>
		</tr>

	</table></CENTER></CENTER>

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





