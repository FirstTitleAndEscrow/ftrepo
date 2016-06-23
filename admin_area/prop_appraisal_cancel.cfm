

<!--- ===/ At the bottom of this page, the    \=== --->
<!--- ===/ Appraisers information is deleted  \=== --->
<!--- ===/ from the appraisal_Doc_Prop Table \=== --->



		<CFQUERY datasource="#request.dsn#" NAME="read_prop_appraisal">
		
			SELECT *
			FROM appraisal_Doc_Prop
			WHERE Prop_ID = #rec_ID#
		
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_assigned_appraiser">
		
			SELECT *
			FROM Appraisers 
			WHERE  appraiser_ID = #read_prop_appraisal.appraiser_ID#
			      
		</CFQUERY>
		

		<CFQUERY datasource="#request.dsn#" NAME="read_prop_appraisers">
		
			SELECT *
			FROM Appraisers 
			ORDER BY company ASC, lname ASC, fname ASC
		
		</CFQUERY>


		<CFQUERY datasource="#request.dsn#" NAME="read_prop">
		
			SELECT *
			FROM Property
			WHERE prop_ID = #rec_ID#
		
		</CFQUERY>





		
		
<CFIF #read_prop_appraisal.a_Assigned_by# GT "">


		<!--- ===/ Get the name of the person that is  \=== --->
		<!--- ===/ STARTED the Appraisal Process        \=== --->
		
		<CFQUERY datasource="#request.dsn#" NAME="read_user_starting">
		
			SELECT *
			FROM first_admin
			WHERE ID = #read_prop_appraisal.a_Assigned_by#
		
		</CFQUERY>		
		
		
		<CFSET user_that_started = #read_user_starting.fname# & " " & #read_user_starting.lname#>

		
<CFELSE>
		<CFSET user_that_started = "Not Assigned Yet">
</CFIF>


<CFIF #read_prop_appraisal.a_Recieved_by# GT "">

		<!--- ===/ Get the name of the person that is  \=== --->
		<!--- ===/ FINISHED the Appraisal Process       \=== --->
		
		<CFQUERY datasource="#request.dsn#" NAME="read_user_finished">
		
			SELECT *
			FROM first_admin
			WHERE ID = #read_prop_appraisal.a_Recieved_by#
		
		</CFQUERY>		
		
		<CFSET user_that_started = #read_user_finished.fname# & " " & #read_user_finished.lname#>

<CFELSE>
		<CFSET user_that_finished = "Not Received Yet">
</CFIF>
			

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
			<td width=790 align=left valign=top bgcolor=maroon>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Property Report</B></CENTER>
			</TD>
		</TR>

	<tr>
		<td width=790 align=center valign=top bgcolor=e1e1e1>

		<CFINCLUDE TEMPLATE="./includes/prop_top_nav.cfm">




<!--- =================================== --->
<!--- =================================== --->



<CFOUTPUT>


<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 colspan=2 align=center valign=top bgcolor=f3f3f3>
				<font size=3 color=red face=arial>
				<B>Appraisal Cancellation Form</B>
			</td>
		</tr>

		<tr>
			<td width=519 colspan=2 align=left valign=top bgcolor=f3f3f3>
				<font size=2 color=red face=arial>
				Since you have cancelled the appraisal, you need to contact the Appraiser and notify them of the cancellation.
				<CFIF #read_assigned_appraiser.pref_for_send# EQ "Email">
				<p>	Since the Appraisal Assignment was done via email, click <a href="mailto:#read_assigned_appraiser.email#"><B>here</B></a> to send a cancellation email.
				<CFELSE>
				<p>Since the Appraisal Assignment was done via fax, you should contact the Appraiser by telephone to notify them of the cancellation.
				</CFIF>
			</td>
		</tr>

		<tr>
			<td width=519 colspan=2 align=left valign=top bgcolor=red>
				<font size=1 color=white face=verdana>
				<B>The information as shown below has been deleted from the database.</B>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Person that Assigned the Appraiser - 
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=red face=verdana>
				<B>#user_that_started#</B>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Date Started - 
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=red face=verdana>
				<B>#read_prop_appraisal.a_date_assigned#</B>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Time Started - 
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=red face=verdana>
				<B>#read_prop_appraisal.a_time_assigned#</B>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Person that received the Abstract - 
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=red face=verdana>
				<B>#user_that_finished#</B>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Date Completed - 
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=red face=verdana>
				<B>#read_prop_appraisal.a_Date_Completed#</B>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Time Completed - 
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=red face=verdana>
				<B>#read_prop_appraisal.a_Time_Completed#</B>
			</td>
		</tr>
		
		<tr>
			<td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3>
				<font size=2 color=black face=arial>
				<B>Appraiser Assigned :</B>
			</td>
		</tr>	

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Company -  
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=blue face=verdana>
				<CFIF #read_assigned_appraiser.recordcount# EQ "0">
					Not yet Assigned
				<CFELSE>
					<B>#read_assigned_appraiser.company#</B>
				</CFIF>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Phone -  
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=blue face=verdana>
				<B>#read_assigned_appraiser.phone#</B>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Ext -  
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=blue face=verdana>
				<B>#read_assigned_appraiser.ext#</B>
			</td>
		</tr>
		
		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Fax -  
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=blue face=verdana>
				<B>#read_assigned_appraiser.fax#</B>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Sent by -  
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=blue face=verdana>
				<B>#read_assigned_appraiser.pref_for_send#</B>
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


		<CFQUERY datasource="#request.dsn#" >
		
			DELETE 
			FROM appraisal_Doc_Prop
			WHERE prop_ID = #rec_ID#
		
		</CFQUERY>


		<CFQUERY datasource="#request.dsn#" >
		
			INSERT INTO appraisal_Doc_Prop(prop_id)
			VALUES(#rec_id#)
		
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" >
		
			UPDATE Property
			SET do_appraisal = 'No',
			appraisal_type = '0',
			estimate_value = '0',
			payment_type_1 = 'Bill Us',
			partial_cod = '0'
			WHERE prop_id = #rec_id#
		
		</CFQUERY>


</BODY>
</HTML>