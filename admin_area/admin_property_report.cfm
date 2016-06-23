<CFPARAM NAME="a_trigger" DEFAULT=0>
<CFPARAM NAME="a_flag" DEFAULT=0>
<CFIF IsDefined("url.uid") is True>
<cfset uid = #url.uid#>
<cfelse>
<cfset uid = 79>
</cfif>
<CFQUERY DATASOURCE="#request.dsn#" NAME="get">
	SELECT *
	FROM property
	Where prop_id = #URL.rec_ID#
</CFQUERY>
<CFIF IsDefined("url.al") is True>
<cfset al = #url.al#>
<cfelse>
<cfset al = 0>
</cfif>
<CFIF IsDefined("comp_id") is True>
<cfset comp_id = #comp_id#>
<cfelse>
<cfset comp_id = #get.comp_id#>
</cfif>
<CFIF IsDefined("user_id_1") is True>
<cfset user_id_1 = #user_id_1#>
<cfelse>
<cfset user_id_1 = #get.user_id#>
</cfif>

<CFIF IsDefined("username") is True>
<cfset username = #username#>
<cfelse>
<cfset username = "">
</cfif>



<CFIF IsDefined("password") is True>
<cfset password = #password#>
<cfelse>
<cfset password = "">
</cfif>


<CFIF IsDefined("lo_id") is True>
<cfset lo_id = #lo_id#>
<cfelse>
<cfset lo_id = #get.loan_off_id#>
</cfif>

<cfquery name="get_adata" DATASOURCE="#request.dsn#">
select * from prop_ins_add where prop_id = #url.rec_id#
</cfquery>





<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>


<!--- <SCRIPT LANGUAGE="JavaScript">

function checkAll(field)
{
for (i = 0; i < field.length; i++)
	field[i].checked = true ;
}

function uncheckAll(field)
{
for (i = 0; i < field.length; i++)
	field[i].checked = false ;
}

</script> --->



</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>
<cfif #get_adata.recordcount# GT "0">
<cfif #a_trigger# eq 1>





  <!---Typing is finished because the merge button has been clicked --->
<CFQUERY DATASOURCE="#request.dsn#" >
	UPDATE tblUser_Roles
	SET Typing_End_Datetime = GetDate()
	WHERE  prop_id = #URL.rec_id#
</CFQUERY>
<!--- <CFQUERY DATASOURCE="#request.dsn#" NAME="insert_status">
		UPDATE Doc_Title_Insurance_Prop
		SET s_status = 1
    	WHERE Prop_ID = #URL.rec_ID#
</CFQUERY>
 --->

<CFIF IsDefined("form.selectedDeed") is True>
 <cfif #form.selectedDeed# is 1>


  <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs = null

			WHERE prop_id = #URL.rec_id# and type = 'DATA'

		</CFQUERY>


<CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view

			SET selectedOrgs = 1

			WHERE prop_id = #URL.rec_id# and type = 'DATA' and seq_num = 1

		</CFQUERY>
				<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_Prop

			WHERE prop_id = #URL.rec_id#

		</CFQUERY>
			 <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_Prop
			SET deed_status = null
			WHERE prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>

</cfif>
</cfif>

 <CFIF IsDefined("form.selectedDeed") is True>
 <cfif #form.selectedDeed# is 2>
  <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs = null

			WHERE prop_id = #URL.rec_id# and type = 'DATA'

		</CFQUERY>


<CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view

			SET selectedOrgs = 2

			WHERE prop_id = #URL.rec_id# and type = 'DATA' and seq_num = 2

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_Prop

			WHERE prop_id = #URL.rec_id#

		</CFQUERY>
			 <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_Prop
			SET deed_status = null
			WHERE prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>

<CFIF IsDefined("form.selectedDeed") is True>
 <cfif #form.selectedDeed# is 3>

  <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs = null

			WHERE prop_id = #URL.rec_id# and type = 'DATA'

		</CFQUERY>

<CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view

			SET selectedOrgs = 3

			WHERE prop_id = #URL.rec_id# and type = 'DATA' and seq_num = 3

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_Prop

			WHERE prop_id = #URL.rec_id#

		</CFQUERY>
			 <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_Prop
			SET deed_status = null
			WHERE prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>
<CFIF IsDefined("form.selectedDeed") is True>
 <cfif #form.selectedDeed# is 4>
  <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs = null

			WHERE prop_id = #URL.rec_id# and type = 'DATA'

		</CFQUERY>


<CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view

			SET selectedOrgs = 4

			WHERE prop_id = #URL.rec_id# and type = 'DATA' and seq_num = 4

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_Prop

			WHERE prop_id = #URL.rec_id#

		</CFQUERY>
			 <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_Prop
			SET deed_status = null
			WHERE prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>
<CFIF IsDefined("form.selectedDeed") is True>
 <cfif #form.selectedDeed# is 5>
  <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs = null

			WHERE prop_id = #URL.rec_id# and type = 'DATA'

		</CFQUERY>

<CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view

			SET selectedOrgs = 5

			WHERE prop_id = #URL.rec_id# and type = 'DATA' and seq_num = 5

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_Prop

			WHERE prop_id = #URL.rec_id#

		</CFQUERY>
			 <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_Prop
			SET deed_status = null
			WHERE prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>
<CFIF IsDefined("form.selectedDeed") is True>
 <cfif #form.selectedDeed# is 6>
  <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs = null

			WHERE prop_id = #URL.rec_id# and type = 'DATA'

		</CFQUERY>

<CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view

			SET selectedOrgs = 6

			WHERE prop_id = #URL.rec_id# and type = 'DATA' and seq_num = 6

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_Prop

			WHERE prop_id = #URL.rec_id#

		</CFQUERY>
			 <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_Prop
			SET deed_status = null
			WHERE prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>
<CFIF IsDefined("form.selectedDeed") is True>
 <cfif #form.selectedDeed# is 7>
  <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs = null

			WHERE prop_id = #URL.rec_id# and type = 'DATA'

		</CFQUERY>

<CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view

			SET selectedOrgs = 7

			WHERE prop_id = #URL.rec_id# and type = 'DATA' and seq_num = 7

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_Prop

			WHERE prop_id = #URL.rec_id#

		</CFQUERY>
			 <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_Prop
			SET deed_status = null
			WHERE prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>

<CFIF IsDefined("form.selectedDeed") is True>
 <cfif #form.selectedDeed# is 8>
  <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs = null

			WHERE prop_id = #URL.rec_id# and type = 'DATA'

		</CFQUERY>

<CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view

			SET selectedOrgs = 8

			WHERE prop_id = #URL.rec_id# and type = 'DATA' and seq_num = 8

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_Prop

			WHERE prop_id = #URL.rec_id#

		</CFQUERY>
			 <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_Prop
			SET deed_status = null
			WHEREprop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>

<CFIF IsDefined("form.selectedDeed") is True>
 <cfif #form.selectedDeed# is 9>
  <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs = null

			WHERE prop_id = #URL.rec_id# and type = 'DATA'

		</CFQUERY>

<CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view

			SET selectedOrgs = 9

			WHERE prop_id = #URL.rec_id# and type = 'DATA' and seq_num = 9

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_Prop

			WHERE prop_id = #URL.rec_id#

		</CFQUERY>
			 <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_Prop
			SET deed_status = null
			WHERE prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>

<CFIF IsDefined("form.selectedDeed") is True>
 <cfif #form.selectedDeed# is 10>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs = null

			WHERE prop_id = #URL.rec_id# and type = 'DATA'

		</CFQUERY>


<CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view

			SET selectedOrgs = 10


			WHERE prop_id = #URL.rec_id# and type = 'DATA' and seq_num = 10

		</CFQUERY>
				<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_Prop

			WHERE prop_id = #URL.rec_id#

		</CFQUERY>


		 <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_Prop
			SET deed_status = null
			WHERE prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>

</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien") is True>
 <cfif #form.selectedLien# is 1>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 1
			WHERE prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 1

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_Prop
			SET status11 = null
			WHERE prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>

<CFIF IsDefined("form.selectedLien2") is True>
 <cfif #form.selectedLien2# is 2>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 2
			WHERE prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 2

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_Prop

			WHERE prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_Prop
			SET status12 = null
			WHERE prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>

<CFIF IsDefined("form.selectedLien3") is True>
 <cfif #form.selectedLien3# is 3>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 3
			WHERE prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 3

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_Prop

			WHERE prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status13 = null
			WHERE prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>
<CFIF IsDefined("form.selectedLien4") is True>
 <cfif #form.selectedLien4# is 4>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 4
			WHERE prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 4

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status14 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>
<CFIF IsDefined("form.selectedLien5") is True>
 <cfif #form.selectedLien5# is 5>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 5
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 5

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status15 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>
<CFIF IsDefined("form.selectedLien6") is True>
 <cfif #form.selectedLien6# is 6>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 6
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 6

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status16 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>
<CFIF IsDefined("form.selectedLien7") is True>
 <cfif #form.selectedLien7# is 7>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 7
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 7

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status17 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>
<CFIF IsDefined("form.selectedLien8") is True>
 <cfif #form.selectedLien8# is 8>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 8
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 8

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status18 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>
<CFIF IsDefined("form.selectedLien9") is True>
 <cfif #form.selectedLien9# is 9>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 9
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 9

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status19 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>
<CFIF IsDefined("form.selectedLien10") is True>
 <cfif #form.selectedLien10# is 10>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 10
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 10

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>

<CFIF IsDefined("form.selectedLien11") is True>
 <cfif #form.selectedLien11# is 11>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 11
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 11

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>

<CFIF IsDefined("form.selectedLien12") is True>
 <cfif #form.selectedLien12# is 12>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 12
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 12

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>

<CFIF IsDefined("form.selectedLien13") is True>
 <cfif #form.selectedLien13# is 13>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 13
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 13

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>

<CFIF IsDefined("form.selectedLien14") is True>
 <cfif #form.selectedLien14# is 14>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 14
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 14

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>

<CFIF IsDefined("form.selectedLien15") is True>
 <cfif #form.selectedLien15# is 15>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 15
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 15

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>

<CFIF IsDefined("form.selectedLien16") is True>
 <cfif #form.selectedLien16# is 16>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 16
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 16

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>

<CFIF IsDefined("form.selectedLien17") is True>
 <cfif #form.selectedLien17# is 17>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 17
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 17

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>

<CFIF IsDefined("form.selectedLien18") is True>
 <cfif #form.selectedLien18# is 18>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 18
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 18

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>

<CFIF IsDefined("form.selectedLien19") is True>
 <cfif #form.selectedLien19# is 19>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 19
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 19

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>

<CFIF IsDefined("form.selectedLien20") is True>
 <cfif #form.selectedLien20# is 20>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 20
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 20

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>

<CFIF IsDefined("form.selectedLien21") is True>
 <cfif #form.selectedLien21# is 21>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 21
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 21

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>

<CFIF IsDefined("form.selectedLien22") is True>
 <cfif #form.selectedLien22# is 22>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 22
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 22

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>

<CFIF IsDefined("form.selectedLien23") is True>
 <cfif #form.selectedLien23# is 23>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 23
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 23

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>

<CFIF IsDefined("form.selectedLien24") is True>
 <cfif #form.selectedLien24# is 24>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 24
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 24

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>

<CFIF IsDefined("form.selectedLien25") is True>
 <cfif #form.selectedLien25# is 25>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 25
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 25

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>

<CFIF IsDefined("form.selectedLien26") is True>
 <cfif #form.selectedLien26# is 26>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 26
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 26

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>

<CFIF IsDefined("form.selectedLien27") is True>
 <cfif #form.selectedLien27# is 27>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 27
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 27

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>

<CFIF IsDefined("form.selectedLien28") is True>
 <cfif #form.selectedLien28# is 28>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 28
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 28

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>

<CFIF IsDefined("form.selectedLien29") is True>
 <cfif #form.selectedLien29# is 29>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 29
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 29

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>

<CFIF IsDefined("form.selectedLien30") is True>
 <cfif #form.selectedLien30# is 30>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 30
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 30

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien31") is True>
 <cfif #form.selectedLien31# is 31>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 31
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 31

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien32") is True>
 <cfif #form.selectedLien32# is 32>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 32
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 32

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien33") is True>
 <cfif #form.selectedLien33# is 33>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 33
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 33

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>



<CFIF IsDefined("form.selectedLien34") is True>
 <cfif #form.selectedLien34# is 34>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 34
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 34

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>



<CFIF IsDefined("form.selectedLien35") is True>
 <cfif #form.selectedLien35# is 35>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 35
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 35

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>



<CFIF IsDefined("form.selectedLien36") is True>
 <cfif #form.selectedLien36# is 36>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 36
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 36

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien37") is True>
 <cfif #form.selectedLien37# is 37>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 37
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 37

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>



<CFIF IsDefined("form.selectedLien38") is True>
 <cfif #form.selectedLien38# is 38>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 38
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 38

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>

<CFIF IsDefined("form.selectedLien39") is True>
 <cfif #form.selectedLien39# is 39>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 39
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 39

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien40") is True>
 <cfif #form.selectedLien40# is 40>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 40
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 40

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien41") is True>
 <cfif #form.selectedLien41# is 41>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 41
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 41

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien42") is True>
 <cfif #form.selectedLien42# is 42>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 42
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 42

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>



<CFIF IsDefined("form.selectedLien43") is True>
 <cfif #form.selectedLien43# is 43>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 43
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 43

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>



<CFIF IsDefined("form.selectedLien44") is True>
 <cfif #form.selectedLien44# is 44>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 44
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 44

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>



<CFIF IsDefined("form.selectedLien45") is True>
 <cfif #form.selectedLien45# is 45>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 45
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 45

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien46") is True>
 <cfif #form.selectedLien46# is 46>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 46
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 46

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien47") is True>
 <cfif #form.selectedLien47# is 47>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 47
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 47

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>



<CFIF IsDefined("form.selectedLien48") is True>
 <cfif #form.selectedLien48# is 48>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 48
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 48

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien49") is True>
 <cfif #form.selectedLien49# is 49>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 49
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 49

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien50") is True>
 <cfif #form.selectedLien50# is 50>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 50
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 50

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien51") is True>
 <cfif #form.selectedLien51# is 51>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 51
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 51

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien52") is True>
 <cfif #form.selectedLien52# is 52>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 52
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 52

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien53") is True>
 <cfif #form.selectedLien53# is 53>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 53
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 53

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>



<CFIF IsDefined("form.selectedLien54") is True>
 <cfif #form.selectedLien54# is 54>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 54
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 54

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>



<CFIF IsDefined("form.selectedLien55") is True>
 <cfif #form.selectedLien55# is 55>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 55
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 55

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>



<CFIF IsDefined("form.selectedLien56") is True>
 <cfif #form.selectedLien56# is 56>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 56
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 56

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>



<CFIF IsDefined("form.selectedLien57") is True>
 <cfif #form.selectedLien57# is 57>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 57
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 57

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien58") is True>
 <cfif #form.selectedLien58# is 58>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 58
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 58

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>



<CFIF IsDefined("form.selectedLien59") is True>
 <cfif #form.selectedLien59# is 59>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 59
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 59

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien60") is True>
 <cfif #form.selectedLien60# is 60>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 60
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 60

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>



<CFIF IsDefined("form.selectedLien61") is True>
 <cfif #form.selectedLien61# is 61>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 61
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 61

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>



<CFIF IsDefined("form.selectedLien62") is True>
 <cfif #form.selectedLien62# is 62>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 62
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 62

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien63") is True>
 <cfif #form.selectedLien63# is 63>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 63
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 63

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien64") is True>
 <cfif #form.selectedLien64# is 64>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 64
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 64

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>



<CFIF IsDefined("form.selectedLien65") is True>
 <cfif #form.selectedLien65# is 65>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 65
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 65

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien66") is True>
 <cfif #form.selectedLien66# is 66>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 66
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 66

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>



<CFIF IsDefined("form.selectedLien67") is True>
 <cfif #form.selectedLien67# is 67>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 67
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 67

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien68") is True>
 <cfif #form.selectedLien68# is 68>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 68
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 68

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien69") is True>
 <cfif #form.selectedLien69# is 69>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 69
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 69

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>

<CFIF IsDefined("form.selectedLien70") is True>
 <cfif #form.selectedLien70# is 70>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 70
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 70

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien71") is True>
 <cfif #form.selectedLien71# is 71>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 71
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 71

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien72") is True>
 <cfif #form.selectedLien72# is 72>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 72
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 72

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien73") is True>
 <cfif #form.selectedLien73# is 73>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 73
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 73

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien74") is True>
 <cfif #form.selectedLien74# is 74>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 74
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 74

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien75") is True>
 <cfif #form.selectedLien75# is 75>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 75
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 75

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>

<CFIF IsDefined("form.selectedLien76") is True>
 <cfif #form.selectedLien76# is 76>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 76
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 76

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien77") is True>
 <cfif #form.selectedLien77# is 77>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 77
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 77

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien78") is True>
 <cfif #form.selectedLien78# is 78>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 78
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 78

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien79") is True>
 <cfif #form.selectedLien79# is 79>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 79
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 79

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien80") is True>
 <cfif #form.selectedLien80# is 80>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 80
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 80

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien81") is True>
 <cfif #form.selectedLien81# is 81>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 81
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 81

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien82") is True>
 <cfif #form.selectedLien82# is 82>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 82
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 82

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien83") is True>
 <cfif #form.selectedLien83# is 83>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 83
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 83

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>

<CFIF IsDefined("form.selectedLien84") is True>
 <cfif #form.selectedLien84# is 84>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 84
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 84

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien85") is True>
 <cfif #form.selectedLien85# is 85>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 85
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 85

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien86") is True>
 <cfif #form.selectedLien86# is 86>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 86
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 86

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien87") is True>
 <cfif #form.selectedLien87# is 87>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 87
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 87

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien88") is True>
 <cfif #form.selectedLien88# is 88>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 88
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 88

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien89") is True>
 <cfif #form.selectedLien89# is 89>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 89
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 89

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>

<CFIF IsDefined("form.selectedLien90") is True>
 <cfif #form.selectedLien90# is 90>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 90
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 90

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien91") is True>
 <cfif #form.selectedLien91# is 91>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 91
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 91

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien92") is True>
 <cfif #form.selectedLien92# is 92>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 92
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 92

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>

<CFIF IsDefined("form.selectedLien93") is True>
 <cfif #form.selectedLien93# is 93>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 93
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 93

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien94") is True>
 <cfif #form.selectedLien94# is 94>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 94
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 94

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien95") is True>
 <cfif #form.selectedLien95# is 95>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 95
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 95

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>

<CFIF IsDefined("form.selectedLien96") is True>
 <cfif #form.selectedLien96# is 96>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 96
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 96

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien97") is True>
 <cfif #form.selectedLien97# is 97>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 97
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 97

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien98") is True>
 <cfif #form.selectedLien98# is 98>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 98
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 98

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien99") is True>
 <cfif #form.selectedLien99# is 99>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 99
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 99

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>

<CFIF IsDefined("form.selectedLien100") is True>
 <cfif #form.selectedLien100# is 100>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 100
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 100

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien101") is True>
 <cfif #form.selectedLien101# is 101>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 101
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 101

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien102") is True>
 <cfif #form.selectedLien102# is 102>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 102
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 102

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">


			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>

<CFIF IsDefined("form.selectedLien103") is True>
 <cfif #form.selectedLien103# is 103>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 103
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 103

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien104") is True>
 <cfif #form.selectedLien104# is 104>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 104
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 104

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien105") is True>
 <cfif #form.selectedLien105# is 105>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 105
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 105

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien106") is True>
 <cfif #form.selectedLien106# is 106>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 106
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 106

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien107") is True>
 <cfif #form.selectedLien107# is 107>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 107
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 107

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien108") is True>
 <cfif #form.selectedLien108# is 108>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 108
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 108

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien109") is True>
 <cfif #form.selectedLien109# is 109>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 109
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 109

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien110") is True>
 <cfif #form.selectedLien110# is 110>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 110
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 110

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien111") is True>
 <cfif #form.selectedLien111# is 111>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 111
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 111

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien112") is True>
 <cfif #form.selectedLien112# is 112>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 112
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 112

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien113") is True>
 <cfif #form.selectedLien113# is 113>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 113
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 113

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien114") is True>
 <cfif #form.selectedLien114# is 114>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 114
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 114

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien115") is True>
 <cfif #form.selectedLien115# is 115>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 115
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 115

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>

<CFIF IsDefined("form.selectedLien116") is True>
 <cfif #form.selectedLien116# is 116>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 116
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 116

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien117") is True>
 <cfif #form.selectedLien117# is 117>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 117
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 117

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien118") is True>
 <cfif #form.selectedLien118# is 118>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 118
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 118

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>

<CFIF IsDefined("form.selectedLien119") is True>
 <cfif #form.selectedLien119# is 119>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 119
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 119

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>


<CFIF IsDefined("form.selectedLien120") is True>
 <cfif #form.selectedLien120# is 120>

 <CFQUERY datasource="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs3 = 120
			WHERE  prop_id = #URL.rec_id# and type = 'Lien' and seq_num = 120

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status20 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>




































<CFIF IsDefined("form.selectedMortgage") is True>
 <cfif #form.selectedMortgage# is 1>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs4 = 1
			WHERE  prop_id = #URL.rec_id# and type = 'Mortgage' and seq_num = 1

		</CFQUERY>

		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>

</cfif>
</cfif>

<CFIF IsDefined("form.selectedMortgage2") is True>
 <cfif #form.selectedMortgage2# is 2>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs4 = 2
			WHERE  prop_id = #URL.rec_id# and type = 'Mortgage' and seq_num = 2

		</CFQUERY>
<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status2 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>

</cfif>
</cfif>

<CFIF IsDefined("form.selectedMortgage3") is True>
 <cfif #form.selectedMortgage3# is 3>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs4 = 3
			WHERE  prop_id = #URL.rec_id# and type = 'Mortgage' and seq_num = 3

		</CFQUERY>

		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status3 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>
<CFIF IsDefined("form.selectedMortgage4") is True>
 <cfif #form.selectedMortgage4# is 4>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs4 = 4
			WHERE prop_id = #URL.rec_id# and type = 'Mortgage' and seq_num = 4

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status4 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>
<CFIF IsDefined("form.selectedMortgage5") is True>
 <cfif #form.selectedMortgage5# is 5>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs4 = 5
			WHERE  prop_id = #URL.rec_id# and type = 'Mortgage' and seq_num = 5

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status5 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>
<CFIF IsDefined("form.selectedMortgage6") is True>
 <cfif #form.selectedMortgage6# is 6>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs4 = 6
			WHERE  prop_id = #URL.rec_id# and type = 'Mortgage' and seq_num = 6

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status6 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>
<CFIF IsDefined("form.selectedMortgage7") is True>
 <cfif #form.selectedMortgage7# is 7>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs4 = 7
			WHERE  prop_id = #URL.rec_id# and type = 'Mortgage' and seq_num = 7

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status7 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>
<CFIF IsDefined("form.selectedMortgage8") is True>
 <cfif #form.selectedMortgage8# is 8>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs4 = 8
			WHERE  prop_id = #URL.rec_id# and type = 'Mortgage' and seq_num = 8

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status8 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>
<CFIF IsDefined("form.selectedMortgage9") is True>
 <cfif #form.selectedMortgage9# is 9>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs4 = 9
			WHERE  prop_id = #URL.rec_id# and type = 'Mortgage' and seq_num = 9

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status9 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>
<CFIF IsDefined("form.selectedMortgage10") is True>
 <cfif #form.selectedMortgage10# is 10>

 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE prop_ins_view
			SET


			selectedOrgs4 = 10
			WHERE  prop_id = #URL.rec_id# and type = 'Mortgage' and seq_num = 10

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" name="get">

			Select * from Doc_Amer_Pioneer_Ins_ALL_prop

			WHERE  prop_id = #URL.rec_id#

		</CFQUERY> <cfif #get.recordcount# gt 0>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			SET status10 = null
			WHERE  prop_id = #URL.rec_id#

		</CFQUERY>
		</cfif>
</cfif>
</cfif>

</cfif>




<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=elelel>
	<tr>
		<td width=790 align=center valign=top>
		<CFIF IsDefined("url.uid") is True and #username# eq "">
			<CFINCLUDE TEMPLATE="./includes/prop_top_nav.cfm">

			</cfif>

<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
			<td width=790 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Abstractor Data Information</B></CENTER>
			</TD>
		</TR>
	<tr>
		<td width=790 align=center valign=top bgcolor=e1e1e1>
<CFFORM name = "frm" METHOD=POST ACTION="https://#cgi.server_name#/admin_area/admin_property_report.cfm?uid=#uid#&al=#al#&rec_id=#url.rec_id#&a_trigger=1&username=#username#&password=#password#&a_flag=1&company_id=0">


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_DEED">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'DATA'

</CFQUERY>


<cfif #read_deed.recordcount# GT 0>



<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num1">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'DATA' and seq_num = 1

</CFQUERY>



<cfif #read_seq_num1.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num1">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
		<td width=140 align=left valign=top bgcolor=e1e1e1>



<cfif #status# EQ "U">
		<a href="prop_abstractor_add_deed_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Deed 1</font></a>
			<cfelse>
			<a href="prop_abstractor_add_deed_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Deed 1</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=1>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge DEED 1<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>

	</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num2">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'DATA' and seq_num = 2

</CFQUERY>

<cfif #read_seq_num2.recordcount# GT 0>
<CFOUTPUT QUERY="read_seq_num2">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
		<td width=140 align=left valign=top bgcolor=e1e1e1>



<cfif #status# EQ "U">
		<a href="prop_abstractor_add_deed_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Deed 2</font></a>
			<cfelse>
			<a href="prop_abstractor_add_deed_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Deed 2</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=2>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge DEED 2<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>

</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num3">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'DATA' and seq_num = 3

</CFQUERY>

<cfif #read_seq_num3.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num3">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
		<td width=140 align=left valign=top bgcolor=e1e1e1>



<cfif #status# EQ "U">
		<a href="prop_abstractor_add_deed_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Deed 3</font></a>
			<cfelse>
			<a href="prop_abstractor_add_deed_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Deed 3</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=3>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge DEED 3<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>

		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num4">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'DATA' and seq_num = 4

</CFQUERY>
<cfif #read_seq_num4.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num4">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
			<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #status# EQ "U">
		<a href="prop_abstractor_add_deed_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Deed 4</font></a>
			<cfelse>
			<a href="prop_abstractor_add_deed_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Deed 4</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=4>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge DEED 4<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>

		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num5">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'DATA' and seq_num = 5

</CFQUERY>
<cfif #read_seq_num5.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num5">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<cfif #status# EQ "U">
		<a href="prop_abstractor_add_deed_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Deed 5</font></a>
			<cfelse>
			<a href="prop_abstractor_add_deed_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Deed 5</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=5>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge DEED 5<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num6">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'DATA' and seq_num = 6

</CFQUERY>
<cfif #read_seq_num6.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num6">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #status# EQ "U">
		<a href="prop_abstractor_add_deed_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Deed 6</font></a>
			<cfelse>
			<a href="prop_abstractor_add_deed_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Deed 6</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=6>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge DEED 6<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num7">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'DATA' and seq_num = 7

</CFQUERY>
<cfif #read_seq_num7.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num7">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #status# EQ "U">
		<a href="prop_abstractor_add_deed_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Deed 7</font></a>
			<cfelse>
			<a href="prop_abstractor_add_deed_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Deed 7</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=7>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge DEED 7<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>

		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num8">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'DATA' and seq_num = 8

</CFQUERY>

<cfif #read_seq_num8.recordcount# GT 0>
<CFOUTPUT QUERY="read_seq_num8">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #status# EQ "U">
		<a href="prop_abstractor_add_deed_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Deed 8</font></a>
			<cfelse>
			<a href="prop_abstractor_add_deed_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Deed 8</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=8>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge DEED 8<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>

		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num9">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'DATA' and seq_num = 9

</CFQUERY>

<cfif #read_seq_num9.recordcount# GT 0>
<CFOUTPUT QUERY="read_seq_num9">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #status# EQ "U">
		<a href="prop_abstractor_add_deed_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Deed 9</font></a>
			<cfelse>
			<a href="prop_abstractor_add_deed_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Deed 9</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=9>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge DEED 9<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>

		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num10">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'DATA' and seq_num = 10

</CFQUERY>
<cfif #read_seq_num10.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num10">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #status# EQ "U">
		<a href="prop_abstractor_add_deed_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Deed 10</font></a>
			<cfelse>
			<a href="prop_abstractor_add_deed_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Deed 10</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=10>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge DEED 10<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>


</cfif>
</cfif>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_mortgage">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'MORTGAGE'

</CFQUERY>


<cfif #read_mortgage.recordcount# GT 0>



<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num1">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'MORTGAGE' and seq_num = 1

</CFQUERY>

<cfif #read_seq_num1.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num1">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_mortgage.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_mortgage_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Mortgage 1</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_mortgage_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Mortgage 1</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage" VALUE=1>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 1<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>

	</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num2">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'MORTGAGE' and seq_num = 2

</CFQUERY>

<cfif #read_seq_num2.recordcount# GT 0>
<CFOUTPUT QUERY="read_seq_num2">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_mortgage.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_mortgage_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Mortgage 2</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_mortgage_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Mortgage 2</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage2" VALUE=2>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 2<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>

</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num3">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'MORTGAGE' and seq_num = 3

</CFQUERY>

<cfif #read_seq_num3.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num3">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_mortgage.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_mortgage_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Mortgage 3</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_mortgage_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Mortgage 3</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage3" VALUE=3>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 3<br>
		</td>
	</tr>
</table>



		</CFOUTPUT>

		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num4">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'MORTGAGE' and seq_num = 4

</CFQUERY>
<cfif #read_seq_num4.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num4">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_mortgage.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_mortgage_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Mortgage 4</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_mortgage_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Mortgage 4</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage4" VALUE=4>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 4<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>

		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num5">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'MORTGAGE' and seq_num = 5

</CFQUERY>
<cfif #read_seq_num5.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num5">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_mortgage.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_mortgage_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Mortgage 5</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_mortgage_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Mortgage 5</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage5" VALUE=5>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 5<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num6">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'MORTGAGE' and seq_num = 6

</CFQUERY>
<cfif #read_seq_num6.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num6">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_mortgage.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_mortgage_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Mortgage 6</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_mortgage_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Mortgage 6</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage6" VALUE=6>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 6<br>
		</td>
	</tr>
</table>

		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num7">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'MORTGAGE' and seq_num = 7

</CFQUERY>
<cfif #read_seq_num7.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num7">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_mortgage.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_mortgage_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Mortgage 7</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_mortgage_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Mortgage 7</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage7" VALUE=7>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 7<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>

		</cfif>


 <CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num8">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'MORTGAGE' and seq_num = 8

</CFQUERY>

<cfif #read_seq_num8.recordcount# GT 0>
<CFOUTPUT QUERY="read_seq_num8">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_mortgage.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_mortgage_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Mortgage 8</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_mortgage_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Mortgage 8</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage8" VALUE=8>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 8<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>

		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num9">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'MORTGAGE' and seq_num = 9

</CFQUERY>

<cfif #read_seq_num9.recordcount# GT 0>
<CFOUTPUT QUERY="read_seq_num9">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_mortgage.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_mortgage_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Mortgage 9</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_mortgage_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Mortgage 9</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage9" VALUE=9>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 9<br>
		</td>
	</tr>
</table>

		</CFOUTPUT>

		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num10">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'MORTGAGE' and seq_num = 10

</CFQUERY>
<cfif #read_seq_num10.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num10">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_mortgage.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_mortgage_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Mortgage 10</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_mortgage_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Mortgage 10</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage10" VALUE=10>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 10<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>


</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_LIEN">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN'

</CFQUERY>


<cfif #read_LIEN.recordcount# GT 0>



<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num1">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 1

</CFQUERY>

<cfif #read_seq_num1.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num1">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 1</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 1</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien" VALUE=1>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 1<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>

	</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num2">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 2

</CFQUERY>

<cfif #read_seq_num2.recordcount# GT 0>
<CFOUTPUT QUERY="read_seq_num2">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 2</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 2</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien2" VALUE=2>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 2<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>

</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num3">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 3

</CFQUERY>

<cfif #read_seq_num3.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num3">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 3</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 3</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien3" VALUE=3>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 3<br>
		</td>
	</tr>
</table>



		</CFOUTPUT>

		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num4">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 4

</CFQUERY>
<cfif #read_seq_num4.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num4">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 4</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 4</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien4" VALUE=4>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 4<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>

		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num5">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 5

</CFQUERY>
<cfif #read_seq_num5.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num5">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 5</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 5</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien5" VALUE=5>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 5<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num6">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 6

</CFQUERY>
<cfif #read_seq_num6.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num6">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="./prop_abstractor_add_LIEN_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 6</font></a>
			<cfelse>
			<a href="./prop_abstractor_add_LIEN_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 6</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien6" VALUE=6>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 6<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num7">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 7

</CFQUERY>
<cfif #read_seq_num7.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num7">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 7</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 7</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien7" VALUE=7>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 7<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>

		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num8">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 8

</CFQUERY>

<cfif #read_seq_num8.recordcount# GT 0>
<CFOUTPUT QUERY="read_seq_num8">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 8</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 8</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien8" VALUE=8>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 8<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>

		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num9">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 9

</CFQUERY>

<cfif #read_seq_num9.recordcount# GT 0>
<CFOUTPUT QUERY="read_seq_num9">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 9</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 9</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien9" VALUE=9>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 9<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>

		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num10">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 10

</CFQUERY>
<cfif #read_seq_num10.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num10">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 10</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 10</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien10" VALUE=10>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 10<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num11">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 11

</CFQUERY>
<cfif #read_seq_num11.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num11">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 11</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 11</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien11" VALUE=11>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 11<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>



	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num12">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 12

</CFQUERY>
<cfif #read_seq_num12.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num12">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 12</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 12</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien12" VALUE=12>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 12<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>



	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num13">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 13

</CFQUERY>
<cfif #read_seq_num13.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num13">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 13</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 13</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien13" VALUE=13>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 13<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>



	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num14">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 14

</CFQUERY>
<cfif #read_seq_num14.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num14">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 14</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 14</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien14" VALUE=14>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 14<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>



	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num15">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 15

</CFQUERY>
<cfif #read_seq_num15.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num15">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 15</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 15</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien15" VALUE=15>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 15<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>



	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num16">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 16

</CFQUERY>
<cfif #read_seq_num16.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num16">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 16</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 16</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien16" VALUE=16>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 16<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>

	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num17">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 17

</CFQUERY>
<cfif #read_seq_num17.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num17">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 17</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 17</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien17" VALUE=17>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 17<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>

	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num18">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 18

</CFQUERY>
<cfif #read_seq_num18.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num18">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 18</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 18</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien18" VALUE=18>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 18<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>


	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num19">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 19

</CFQUERY>
<cfif #read_seq_num19.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num19">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 19</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 19</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien19" VALUE=19>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 19<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>


	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num20">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 20

</CFQUERY>
<cfif #read_seq_num20.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num20">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 20</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 20</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien20" VALUE=20>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 20<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>


	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num21">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 21

</CFQUERY>
<cfif #read_seq_num21.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num21">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 21</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 21</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien21" VALUE=21>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 21<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>


	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num22">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 22

</CFQUERY>
<cfif #read_seq_num22.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num22">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 22</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 22</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien22" VALUE=22>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 22<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>


	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num23">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 23

</CFQUERY>
<cfif #read_seq_num23.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num23">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 23</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 23</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien23" VALUE=23>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 23<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>


	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num24">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 24

</CFQUERY>
<cfif #read_seq_num24.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num24">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 24</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 24</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien24" VALUE=24>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 24<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>


	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num25">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 25

</CFQUERY>
<cfif #read_seq_num25.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num25">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 25</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 25</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien25" VALUE=25>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 25<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>


	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num26">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 26

</CFQUERY>
<cfif #read_seq_num26.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num26">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>


				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 26</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 26</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien26" VALUE=26>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 26<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>

	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num27">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 27

</CFQUERY>
<cfif #read_seq_num27.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num27">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 27</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 27</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien27" VALUE=27>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 27<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>


	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num28">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 28

</CFQUERY>
<cfif #read_seq_num28.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num28">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 28</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 28</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien28" VALUE=28>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 28<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>


	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num29">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 29

</CFQUERY>
<cfif #read_seq_num29.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num29">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 29</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 29</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien29" VALUE=29>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 29<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>


	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num30">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 30

</CFQUERY>
<cfif #read_seq_num30.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num30">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 30</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 30</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien30" VALUE=30>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 30<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>


	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num31">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 31

</CFQUERY>
<cfif #read_seq_num31.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num31">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 31</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 31</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien31" VALUE=31>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 31<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>


	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num32">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 32

</CFQUERY>
<cfif #read_seq_num32.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num32">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 32</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 32</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien32" VALUE=32>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 32<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>





	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num33">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 33

</CFQUERY>
<cfif #read_seq_num33.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num33">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 33</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 33</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien33" VALUE=33>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 33<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>



	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num34">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 34

</CFQUERY>
<cfif #read_seq_num34.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num34">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 34</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 34</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien34" VALUE=34>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 34<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>




	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num35">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 35

</CFQUERY>
<cfif #read_seq_num35.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num35">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 35</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 35</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien35" VALUE=35>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 35<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>




	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num36">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 36

</CFQUERY>
<cfif #read_seq_num36.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num36">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 36</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 36</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien36" VALUE=36>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 36<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>



	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num37">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 37

</CFQUERY>
<cfif #read_seq_num37.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num37">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 37</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 37</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien37" VALUE=37>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 37<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>



	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num38">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 38

</CFQUERY>
<cfif #read_seq_num38.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num38">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 38</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 38</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien38" VALUE=38>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 38<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>



	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num39">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 39

</CFQUERY>
<cfif #read_seq_num39.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num39">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 39</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 39</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien39" VALUE=39>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 39<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>



	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num40">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 40

</CFQUERY>
<cfif #read_seq_num40.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num40">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 40</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 40</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien40" VALUE=40>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 40<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>



	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num41">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 41

</CFQUERY>
<cfif #read_seq_num41.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num41">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 41</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 41</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien41" VALUE=41>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 41<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>



	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num42">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 42

</CFQUERY>
<cfif #read_seq_num42.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num42">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 42</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 42</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien42" VALUE=42>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 42<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>





	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num43">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 43

</CFQUERY>
<cfif #read_seq_num43.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num43">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 43</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 43</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien43" VALUE=43>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 43<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>




	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num44">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 44

</CFQUERY>
<cfif #read_seq_num44.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num44">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 44</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 44</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien44" VALUE=44>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 44<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>




	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num45">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 45

</CFQUERY>
<cfif #read_seq_num45.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num45">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 45</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 45</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien45" VALUE=45>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 45<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>




	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num46">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 46

</CFQUERY>
<cfif #read_seq_num46.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num46">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 46</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 46</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien46" VALUE=46>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 46<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>



	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num47">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 47

</CFQUERY>
<cfif #read_seq_num47.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num47">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 47</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 47</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien47" VALUE=47>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 47<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>


	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num48">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 48

</CFQUERY>
<cfif #read_seq_num48.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num48">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 48</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 48</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien48" VALUE=48>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 48<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>



	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num49">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 49

</CFQUERY>
<cfif #read_seq_num49.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num49">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 49</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 49</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien49" VALUE=49>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 49<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>



	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num50">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 50

</CFQUERY>
<cfif #read_seq_num50.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num50">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 50</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 50</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien50" VALUE=50>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 50<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>



	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num51">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 51

</CFQUERY>
<cfif #read_seq_num51.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num51">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 51</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 51</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien51" VALUE=51>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 51<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>


	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num52">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 52

</CFQUERY>
<cfif #read_seq_num52.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num52">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 52</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 52</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien52" VALUE=52>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 52<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>


	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num53">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 53

</CFQUERY>
<cfif #read_seq_num53.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num53">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 53</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 53</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien53" VALUE=53>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 53<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>



	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num54">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 54

</CFQUERY>
<cfif #read_seq_num54.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num54">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 54</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 54</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien54" VALUE=54>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 54<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>



	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num55">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 55

</CFQUERY>
<cfif #read_seq_num55.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num55">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 55</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 55</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien55" VALUE=55>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 55<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>



	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num56">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 56

</CFQUERY>
<cfif #read_seq_num56.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num56">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 56</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 56</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien56" VALUE=56>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 56<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>



	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num57">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 57

</CFQUERY>
<cfif #read_seq_num57.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num57">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 57</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 57</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien57" VALUE=57>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 57<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>




	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num58">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 58

</CFQUERY>
<cfif #read_seq_num58.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num58">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 58</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 58</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien58" VALUE=58>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 58<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>


	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num59">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 59

</CFQUERY>
<cfif #read_seq_num59.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num59">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 59</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 59</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien59" VALUE=59>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 59<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>




	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num60">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 60

</CFQUERY>
<cfif #read_seq_num60.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num60">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 60</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 60</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien60" VALUE=60>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 60<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>




	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num61">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 61

</CFQUERY>
<cfif #read_seq_num61.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num61">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 61</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 61</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien61" VALUE=61>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 61<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>




	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num62">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 62

</CFQUERY>
<cfif #read_seq_num62.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num62">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 62</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 62</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien62" VALUE=62>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 62<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>




	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num63">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 63

</CFQUERY>
<cfif #read_seq_num63.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num63">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 63</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 63</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien63" VALUE=63>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 63<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>



	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num64">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 64

</CFQUERY>
<cfif #read_seq_num64.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num64">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 64</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 64</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien64" VALUE=64>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 64<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>



	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num65">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 65

</CFQUERY>
<cfif #read_seq_num65.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num65">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 65</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 65</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien65" VALUE=65>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 65<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>




	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num66">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 66

</CFQUERY>
<cfif #read_seq_num66.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num66">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 66</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 66</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien66" VALUE=66>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 66<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>



	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num67">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 67

</CFQUERY>
<cfif #read_seq_num67.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num67">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 67</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 67</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien67" VALUE=67>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 67<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>



	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num68">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 68

</CFQUERY>
<cfif #read_seq_num68.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num68">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 68</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 68</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien68" VALUE=68>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 68<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>


	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num69">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 69

</CFQUERY>
<cfif #read_seq_num69.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num69">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 69</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 69</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien69" VALUE=69>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 69<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>




	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num70">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 70

</CFQUERY>
<cfif #read_seq_num70.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num70">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 70</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 70</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien70" VALUE=70>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 70<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>


	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num71">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 71

</CFQUERY>
<cfif #read_seq_num71.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num71">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 71</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 71</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien71" VALUE=71>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 71<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>
	
	
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num72">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 72

</CFQUERY>
<cfif #read_seq_num72.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num72">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 72</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 72</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien72" VALUE=72>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 72<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>
	
	
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num73">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 73

</CFQUERY>
<cfif #read_seq_num73.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num73">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>


						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 73</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 73</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien73" VALUE=73>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 73<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>
	
	
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num74">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 74

</CFQUERY>
<cfif #read_seq_num74.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num74">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 74</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 74</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien74" VALUE=74>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 74<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>
	
	
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num75">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 75

</CFQUERY>
<cfif #read_seq_num75.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num75">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 75</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 75</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien75" VALUE=75>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 75<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>
	
	

	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num76">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 76

</CFQUERY>
<cfif #read_seq_num76.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num76">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 76</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 76</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien76" VALUE=76>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 76<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>
	
	

	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num77">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 77

</CFQUERY>
<cfif #read_seq_num77.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num77">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 77</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 77</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien77" VALUE=77>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 77<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>
	
	

	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num78">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 78

</CFQUERY>
<cfif #read_seq_num78.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num78">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 78</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 78</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien78" VALUE=78>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 78<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>
	
	
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num79">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 79

</CFQUERY>
<cfif #read_seq_num79.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num79">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 79</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 79</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien79" VALUE=79>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 79<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>
	
	
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num80">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 80

</CFQUERY>
<cfif #read_seq_num80.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num80">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 80</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 80</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien80" VALUE=80>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 80<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>
	
	
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num81">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 81

</CFQUERY>
<cfif #read_seq_num81.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num81">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 81</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 81</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien81" VALUE=81>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 81<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>
	
	
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num82">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 82

</CFQUERY>
<cfif #read_seq_num82.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num82">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 82</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 82</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien82" VALUE=82>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 82<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>
	
	
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num83">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 83

</CFQUERY>
<cfif #read_seq_num83.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num83">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 83</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 83</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien83" VALUE=83>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 83<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>
	
		<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num84">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 84

</CFQUERY>
<cfif #read_seq_num84.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num84">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 84</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 84</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien84" VALUE=84>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 84<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>
	
	

	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num85">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 85

</CFQUERY>
<cfif #read_seq_num85.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num85">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 85</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 85</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien85" VALUE=85>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 85<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>
	
	
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num86">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 86

</CFQUERY>
<cfif #read_seq_num86.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num86">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 86</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 86</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien86" VALUE=86>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 86<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>
	
	
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num87">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 87

</CFQUERY>
<cfif #read_seq_num87.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num87">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 87</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 87</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien87" VALUE=87>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 87<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>
	
	

	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num88">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 88

</CFQUERY>
<cfif #read_seq_num88.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num88">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 88</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 88</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien88" VALUE=88>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 88<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>
	
	

	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num89">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 89

</CFQUERY>
<cfif #read_seq_num89.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num89">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 89</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 89</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien89" VALUE=89>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 89<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>
	
	

	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num90">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 90

</CFQUERY>
<cfif #read_seq_num90.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num90">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 90</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 90</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien90" VALUE=90>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 90<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>
	
	
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num91">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 91

</CFQUERY>
<cfif #read_seq_num91.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num91">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 91</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 91</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien91" VALUE=91>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 91<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>
	
	
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num92">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 92

</CFQUERY>
<cfif #read_seq_num92.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num92">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 92</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 92</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien92" VALUE=92>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 92<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>
	
	

	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num93">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 93

</CFQUERY>
<cfif #read_seq_num93.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num93">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 93</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 93</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien93" VALUE=93>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 93<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>
	
	

	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num94">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 94

</CFQUERY>
<cfif #read_seq_num94.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num94">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 94</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 94</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien94" VALUE=94>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 94<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>
	
	

	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num95">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 95

</CFQUERY>
<cfif #read_seq_num95.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num95">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 95</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 95</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien95" VALUE=95>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 95<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>
	
	

	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num96">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 96

</CFQUERY>
<cfif #read_seq_num96.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num96">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 96</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 96</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien96" VALUE=96>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 96<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>
	
	

	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num97">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 97

</CFQUERY>
<cfif #read_seq_num97.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num97">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 97</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 97</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien97" VALUE=97>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 97<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>
	
	
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num98">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 98

</CFQUERY>
<cfif #read_seq_num98.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num98">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 98</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 98</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien98" VALUE=98>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 98<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>
	
	

	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num99">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 99

</CFQUERY>
<cfif #read_seq_num99.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num99">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 99</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 99</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien99" VALUE=99>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 99<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>
	
	
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_seq_num100">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 100

</CFQUERY>
<cfif #read_seq_num100.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num100">


	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 100</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 100</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien100" VALUE=100>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 100<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>
	


	<CFQUERY datasource="#request.dsn#" NAME="read_seq_num101">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 101

</CFQUERY>
<cfif #read_seq_num101.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num101">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 101</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 101</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien101" VALUE=101>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 101<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>


	<CFQUERY datasource="#request.dsn#" NAME="read_seq_num102">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 102

</CFQUERY>
<cfif #read_seq_num102.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num102">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 102</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 102</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien102" VALUE=102>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 102<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>


	<CFQUERY datasource="#request.dsn#" NAME="read_seq_num103">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 103

</CFQUERY>
<cfif #read_seq_num103.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num103">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 103</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 103</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien103" VALUE=103>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 103<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>


	<CFQUERY datasource="#request.dsn#" NAME="read_seq_num104">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 104

</CFQUERY>
<cfif #read_seq_num104.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num104">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 104</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 104</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien104" VALUE=104>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 104<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>


	<CFQUERY datasource="#request.dsn#" NAME="read_seq_num105">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 105

</CFQUERY>
<cfif #read_seq_num105.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num105">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 105</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 105</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien105" VALUE=105>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 105<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>


	<CFQUERY datasource="#request.dsn#" NAME="read_seq_num106">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 106

</CFQUERY>
<cfif #read_seq_num106.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num106">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 106</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 106</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien106" VALUE=106>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 106<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>


	<CFQUERY datasource="#request.dsn#" NAME="read_seq_num107">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 107

</CFQUERY>
<cfif #read_seq_num107.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num107">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 107</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 107</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien107" VALUE=107>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 107<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>


	<CFQUERY datasource="#request.dsn#" NAME="read_seq_num108">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 108

</CFQUERY>
<cfif #read_seq_num108.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num108">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 108</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 108</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien108" VALUE=108>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 108<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>


	<CFQUERY datasource="#request.dsn#" NAME="read_seq_num109">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 109

</CFQUERY>
<cfif #read_seq_num109.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num109">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 109</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 109</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien109" VALUE=109>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 109<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>


	<CFQUERY datasource="#request.dsn#" NAME="read_seq_num110">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 110

</CFQUERY>
<cfif #read_seq_num110.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num110">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 110</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 110</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien110" VALUE=110>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 110<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>


	<CFQUERY datasource="#request.dsn#" NAME="read_seq_num111">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 111

</CFQUERY>
<cfif #read_seq_num111.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num111">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 111</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 111</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien111" VALUE=111>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 111<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>


	<CFQUERY datasource="#request.dsn#" NAME="read_seq_num112">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 112

</CFQUERY>
<cfif #read_seq_num112.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num112">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 112</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 112</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien112" VALUE=112>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 112<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>


	<CFQUERY datasource="#request.dsn#" NAME="read_seq_num113">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 113

</CFQUERY>
<cfif #read_seq_num113.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num113">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 113</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 113</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien113" VALUE=113>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 113<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>


	<CFQUERY datasource="#request.dsn#" NAME="read_seq_num114">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 114

</CFQUERY>
<cfif #read_seq_num114.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num114">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 114</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 114</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien114" VALUE=114>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 114<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>


	<CFQUERY datasource="#request.dsn#" NAME="read_seq_num115">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 115

</CFQUERY>
<cfif #read_seq_num115.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num115">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 115</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 115</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien115" VALUE=115>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 115<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>

	<CFQUERY datasource="#request.dsn#" NAME="read_seq_num116">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 116

</CFQUERY>
<cfif #read_seq_num116.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num116">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 116</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 116</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien116" VALUE=116>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 116<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>


	<CFQUERY datasource="#request.dsn#" NAME="read_seq_num117">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 117

</CFQUERY>
<cfif #read_seq_num117.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num117">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 117</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 117</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien117" VALUE=117>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 117<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>


	<CFQUERY datasource="#request.dsn#" NAME="read_seq_num118">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 118

</CFQUERY>
<cfif #read_seq_num118.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num118">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 118</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 118</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien118" VALUE=118>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 118<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>


	<CFQUERY datasource="#request.dsn#" NAME="read_seq_num119">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 119

</CFQUERY>
<cfif #read_seq_num119.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num119">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 119</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 119</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien119" VALUE=119>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 119<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>


	<CFQUERY datasource="#request.dsn#" NAME="read_seq_num120">
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 120

</CFQUERY>
<cfif #read_seq_num120.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num120">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 120</font></a>
			<cfelse>
			<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 120</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien120" VALUE=120>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 120<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>



	</cfif>



































</cfif>



			</td>
		</tr>
</table>

<!--- <nobr><input type="button" name="CheckAll" value="Check All"
onClick="checkAll(document.frm.selectedDeed)">
<input type="button" name="UnCheckAll" value="Uncheck All"
onClick="uncheckAll(document.frm.selectedDeed)"></nobr>
--->
<br>
Click this button to merge <cfoutput><INPUT TYPE=IMAGE SRC="https://#cgi.server_name#/admin_area/images/button_merge.gif" border=0> </cfoutput>
</cfform>

<cfif #a_trigger# eq 1>

<CFSET c_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET c_date = #DateFormat(Now(), "mm/dd/yyyy")#>

		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE title_ins_add
			SET
			insert_date = '#c_date#',
			insert_time = '#c_time#',
			complete = 1
			WHERE  title_id = #URL.rec_id#
		</CFQUERY>
		 <CFQUERY DATASOURCE="#request.dsn#" >

			UPDATE Doc_Title_Insurance_Title
			SET
			merge_date = '#c_date#',
			merge_time = '#c_time#'
			WHERE  title_id = #URL.rec_id#
		</CFQUERY>
		<cfparam name="session.ft_user_id" default=0>
		<CFQUERY DATASOURCE="#request.dsn#" NAME="read_user">

			select * from first_admin
			WHERE ID = #session.ft_user_id#

		</CFQUERY>
		<!---This already happes in page prop_report_submit.  No need to have duplcates
		<CFQUERY DATASOURCE="#request.dsn#">
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#read_user.FName#', '#read_user.LName#', #URL.rec_id#, 'Property form Completed - Property in review', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')
		</CFQUERY>
		--->
		<CFQUERY DATASOURCE="#request.dsn#" NAME="read_em">

			select * from Doc_Title_Insurance_prop
			WHERE prop_id = #URL.rec_id# and merge_date is null

		</CFQUERY>
		<cfif #read_em.recordcount# GT 0>
		<CFMAIL
TO="titlereview@firsttitleservices.com"
FROM="binders@firsttitleservices.com" Subject="File #rec_id# -- Ready for property review"
TIMEOUT="600"
type="HTML"
>

File #rec_id# -- Ready for property review

First Title staff
</cfmail>
	</cfif>

<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
<tr>
			<td width=699 align=center valign=top bgcolor=e1e1e1>

<b><font face=verdana size=2 color=blue>All selected item(s) were successfully merged to Property Report!</font></b><br>
</td>
</tr>
</table>
</cfif>

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent">
				SELECT *
				FROM prop_ins_view
				Where prop_id = #URL.rec_id# and type = 'DATA' and selectedOrgs is not null

</CFQUERY>
<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
<tr>
			<td width=699 align=center valign=top bgcolor=e1e1e1>

<b><font face=verdana size=2 color=black>Merged data is shown below (if any).</b><br>

</td>
</tr>

<cfif #read_sent.recordcount# GT 0>

<CFOUTPUT QUERY="read_sent">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="../admin_area/prop_abstractor_add_deed_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Deed submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>


	<a href="../admin_area/prop_abstractor_admin_deed_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
	<a href="../admin_area/prop_abstractor_add_deed_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Delete</b></font></a>

		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>

		<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_mortgage">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs4 = 1
			</cfquery>

<cfif #read_sent_mortgage.recordcount# GT 0>

<CFOUTPUT QUERY="read_sent_mortgage">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_mortgage_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Mortgage 1 submitted</font></a>

			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_mortgage_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_mortgage_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_mortgage2">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs4 = 2
			</cfquery>

<cfif #read_sent_mortgage2.recordcount# GT 0>

<CFOUTPUT QUERY="read_sent_mortgage2">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_mortgage_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Mortgage 2 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_mortgage_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_mortgage_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Delete</b></font></a>

		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_mortgage3">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs4 = 3
			</cfquery>

<cfif #read_sent_mortgage3.recordcount# GT 0>

<CFOUTPUT QUERY="read_sent_mortgage3">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_mortgage_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Mortgage 3 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_mortgage_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_mortgage_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Delete</b></font></a>

		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_mortgage4">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs4 = 4
			</cfquery>

<cfif #read_sent_mortgage4.recordcount# GT 0>

<CFOUTPUT QUERY="read_sent_mortgage4">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_mortgage_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Mortgage 4 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_mortgage_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_mortgage_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b><b>Delete</b></b></font></a>

		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_mortgage5">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs4 = 5
			</cfquery>

<cfif #read_sent_mortgage5.recordcount# GT 0>

<CFOUTPUT QUERY="read_sent_mortgage5">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_mortgage_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Mortgage 5 submitted</font></a>

			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_mortgage_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_mortgage_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_mortgage6">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs4 = 6
			</cfquery>

<cfif #read_sent_mortgage6.recordcount# GT 0>

<CFOUTPUT QUERY="read_sent_mortgage6">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_mortgage_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Mortgage 6 submitted</font></a>

			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_mortgage_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_mortgage_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_mortgage7">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs4 = 7
			</cfquery>

<cfif #read_sent_mortgage7.recordcount# GT 0>

<CFOUTPUT QUERY="read_sent_mortgage7">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_mortgage_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Mortgage 7 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_mortgage_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_mortgage_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_mortgage8">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs4 = 8
			</cfquery>

<cfif #read_sent_mortgage8.recordcount# GT 0>

<CFOUTPUT QUERY="read_sent_mortgage8">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_mortgage_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Mortgage 8 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_mortgage_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_mortgage_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_mortgage9">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs4 = 9
			</cfquery>

<cfif #read_sent_mortgage9.recordcount# GT 0>

<CFOUTPUT QUERY="read_sent_mortgage9">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_mortgage_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Mortgage 9 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_mortgage_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_mortgage_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_mortgage10">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs4 = 10
			</cfquery>

<cfif #read_sent_mortgage10.recordcount# GT 0>

<CFOUTPUT QUERY="read_sent_mortgage10">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_mortgage_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Mortgage 10 submitted</font></a>

			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_mortgage_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_mortgage_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>

		<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 1
			</cfquery>


<cfif #read_sent_lien.recordcount# GT 0>

<CFOUTPUT QUERY="read_sent_lien">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 1 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>

		<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien2">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 2
			</cfquery>

		<cfif #read_sent_lien2.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien2">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 2 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>

		<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien3">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 3
			</cfquery>

		<cfif #read_sent_lien3.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien3">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 3 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>

	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien4">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 4
			</cfquery>

		<cfif #read_sent_lien4.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien4">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 4 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien5">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 5
			</cfquery>

		<cfif #read_sent_lien5.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien5">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 5 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien6">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 6
			</cfquery>

		<cfif #read_sent_lien6.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien6">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 6 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>

	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien7">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 7
			</cfquery>

		<cfif #read_sent_lien7.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien7">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 7 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Delete</b> </font></a>
		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien8">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 8
			</cfquery>

		<cfif #read_sent_lien8.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien8">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 8 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien9">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 9
			</cfquery>
		<cfif #read_sent_lien9.recordcount# GT 0>

<CFOUTPUT QUERY="read_sent_lien9">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 9 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien10">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 10
			</cfquery>

		<cfif #read_sent_lien10.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien10">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 10 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien11">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 11
			</cfquery>

		<cfif #read_sent_lien11.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien11">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 11 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien12">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 12
			</cfquery>

		<cfif #read_sent_lien12.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien12">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 12 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>



<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien13">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 13
			</cfquery>

		<cfif #read_sent_lien13.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien13">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 13 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>



<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien14">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 14
			</cfquery>

		<cfif #read_sent_lien14.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien14">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 14 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>



<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien15">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 15
			</cfquery>

		<cfif #read_sent_lien15.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien15">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 15 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>



<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien16">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 16
			</cfquery>

		<cfif #read_sent_lien16.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien16">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 16 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien17">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 17
			</cfquery>

		<cfif #read_sent_lien17.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien17">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 17 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien18">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 18
			</cfquery>

		<cfif #read_sent_lien18.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien18">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 18 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien19">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 19
			</cfquery>

		<cfif #read_sent_lien19.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien19">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 19 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>



<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien20">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 20
			</cfquery>

		<cfif #read_sent_lien20.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien20">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 20 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien21">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 21
			</cfquery>

		<cfif #read_sent_lien21.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien21">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 21 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>



<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien22">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 22
			</cfquery>

		<cfif #read_sent_lien22.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien22">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 22 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien23">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 23
			</cfquery>

		<cfif #read_sent_lien23.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien23">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 23 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien24">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 24
			</cfquery>

		<cfif #read_sent_lien24.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien24">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 24 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>



<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien25">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 25
			</cfquery>

		<cfif #read_sent_lien25.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien25">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 25 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>



<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien26">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 26
			</cfquery>

		<cfif #read_sent_lien26.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien26">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 26 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>



<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien27">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 27
			</cfquery>

		<cfif #read_sent_lien27.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien27">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 27 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>



<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien28">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 28
			</cfquery>

		<cfif #read_sent_lien28.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien28">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 28 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>



<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien29">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 29
			</cfquery>

		<cfif #read_sent_lien29.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien29">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 29 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>



<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien30">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 30
			</cfquery>

		<cfif #read_sent_lien30.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien30">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 30 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>



<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien31">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 31
			</cfquery>

		<cfif #read_sent_lien31.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien31">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 31 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien32">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 32
			</cfquery>

		<cfif #read_sent_lien32.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien32">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 32 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien33">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 33
			</cfquery>

		<cfif #read_sent_lien33.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien33">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 33 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien34">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 34
			</cfquery>

		<cfif #read_sent_lien34.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien34">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 34 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien35">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 35
			</cfquery>

		<cfif #read_sent_lien35.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien35">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>



			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 35 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien36">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 36
			</cfquery>

		<cfif #read_sent_lien36.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien36">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 36 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien37">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 37
			</cfquery>

		<cfif #read_sent_lien37.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien37">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 37 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien38">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 38
			</cfquery>

		<cfif #read_sent_lien38.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien38">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 38 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien39">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 39
			</cfquery>

		<cfif #read_sent_lien39.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien39">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 39 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien40">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 40
			</cfquery>

		<cfif #read_sent_lien40.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien40">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 40 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien41">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 41
			</cfquery>

		<cfif #read_sent_lien41.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien41">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 41 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien42">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 42
			</cfquery>

		<cfif #read_sent_lien42.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien42">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 42 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien43">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 43
			</cfquery>

		<cfif #read_sent_lien43.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien43">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 43 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien44">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 44
			</cfquery>

		<cfif #read_sent_lien44.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien44">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 44 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien45">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 45
			</cfquery>

		<cfif #read_sent_lien45.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien45">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 45 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien46">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 46
			</cfquery>

		<cfif #read_sent_lien46.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien46">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 46 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien47">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 47
			</cfquery>

		<cfif #read_sent_lien47.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien47">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 47 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien48">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 48
			</cfquery>

		<cfif #read_sent_lien48.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien48">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 48 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien49">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 49
			</cfquery>

		<cfif #read_sent_lien49.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien49">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 49 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien50">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 50
			</cfquery>

		<cfif #read_sent_lien50.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien50">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 50 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien51">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 51
			</cfquery>

		<cfif #read_sent_lien51.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien51">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 51 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien52">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 52
			</cfquery>

		<cfif #read_sent_lien52.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien52">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 52 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien53">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 53
			</cfquery>

		<cfif #read_sent_lien53.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien53">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 53 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien54">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 54
			</cfquery>

		<cfif #read_sent_lien54.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien54">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 54 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien55">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 55
			</cfquery>

		<cfif #read_sent_lien55.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien55">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 55 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien56">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 56
			</cfquery>

		<cfif #read_sent_lien56.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien56">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 56 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien57">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 57
			</cfquery>

		<cfif #read_sent_lien57.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien57">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 57 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien58">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 58
			</cfquery>

		<cfif #read_sent_lien58.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien58">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 58 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien59">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 59
			</cfquery>

		<cfif #read_sent_lien59.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien59">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 59 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien60">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 60
			</cfquery>

		<cfif #read_sent_lien60.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien60">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 60 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien61">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 61
			</cfquery>

		<cfif #read_sent_lien61.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien61">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 61 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien62">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 62
			</cfquery>

		<cfif #read_sent_lien62.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien62">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 62 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien63">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 63
			</cfquery>

		<cfif #read_sent_lien63.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien63">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 63 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien64">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 64
			</cfquery>

		<cfif #read_sent_lien64.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien64">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 64 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien65">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 65
			</cfquery>

		<cfif #read_sent_lien65.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien65">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 65 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien66">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 66
			</cfquery>

		<cfif #read_sent_lien66.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien66">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 66 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien67">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 67
			</cfquery>

		<cfif #read_sent_lien67.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien67">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 67 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien68">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 68
			</cfquery>

		<cfif #read_sent_lien68.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien68">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 68 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien69">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 69
			</cfquery>

		<cfif #read_sent_lien69.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien69">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 69 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien70">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 70
			</cfquery>

		<cfif #read_sent_lien70.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien70">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 70 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien71">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 71
			</cfquery>

		<cfif #read_sent_lien71.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien71">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 71 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien72">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 72
			</cfquery>

		<cfif #read_sent_lien72.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien72">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 72 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien73">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 73
			</cfquery>

		<cfif #read_sent_lien73.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien73">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 73 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien74">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 74
			</cfquery>

		<cfif #read_sent_lien74.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien74">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 74 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien75">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 75
			</cfquery>

		<cfif #read_sent_lien75.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien75">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 75 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien76">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 76
			</cfquery>

		<cfif #read_sent_lien76.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien76">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 76 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien77">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 77
			</cfquery>

		<cfif #read_sent_lien77.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien77">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 77 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien78">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 78
			</cfquery>

		<cfif #read_sent_lien78.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien78">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 78 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien79">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 79
			</cfquery>

		<cfif #read_sent_lien79.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien79">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 79 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien80">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 80
			</cfquery>

		<cfif #read_sent_lien80.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien80">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 80 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien81">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 81
			</cfquery>

		<cfif #read_sent_lien81.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien81">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 81 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien82">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 82
			</cfquery>

		<cfif #read_sent_lien82.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien82">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 82 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien83">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 83
			</cfquery>

		<cfif #read_sent_lien83.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien83">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 83 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien84">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 84
			</cfquery>

		<cfif #read_sent_lien84.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien84">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 84 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien85">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 85
			</cfquery>

		<cfif #read_sent_lien85.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien85">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 85 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien86">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 86
			</cfquery>

		<cfif #read_sent_lien86.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien86">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 86 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien87">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 87
			</cfquery>

		<cfif #read_sent_lien87.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien87">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 87 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien88">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 88
			</cfquery>

		<cfif #read_sent_lien88.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien88">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 88 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien89">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 89
			</cfquery>

		<cfif #read_sent_lien89.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien89">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 89 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien90">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 90
			</cfquery>

		<cfif #read_sent_lien90.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien90">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 90 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien91">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 91
			</cfquery>

		<cfif #read_sent_lien91.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien91">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 91 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien92">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 92
			</cfquery>

		<cfif #read_sent_lien92.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien92">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 92 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien93">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 93
			</cfquery>

		<cfif #read_sent_lien93.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien93">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 93 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		



<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien94">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 94
			</cfquery>

		<cfif #read_sent_lien94.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien94">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 94 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien95">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 95
			</cfquery>

		<cfif #read_sent_lien95.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien95">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 95 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien96">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 96
			</cfquery>

		<cfif #read_sent_lien96.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien96">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 96 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien97">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 97
			</cfquery>

		<cfif #read_sent_lien97.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien97">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 97 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien98">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 98
			</cfquery>

		<cfif #read_sent_lien98.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien98">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 98 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien99">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 99
			</cfquery>

		<cfif #read_sent_lien99.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien99">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 99 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sent_lien100">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 100
			</cfquery>

		<cfif #read_sent_lien100.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien100">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 100 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		

<CFQUERY datasource="#request.dsn#" NAME="read_sent_lien101">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 101
			</cfquery>

		<cfif #read_sent_lien101.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien101">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 101 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		

<CFQUERY datasource="#request.dsn#" NAME="read_sent_lien102">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 102
			</cfquery>

		<cfif #read_sent_lien102.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien102">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 102 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		

<CFQUERY datasource="#request.dsn#" NAME="read_sent_lien103">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 103
			</cfquery>

		<cfif #read_sent_lien103.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien103">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 103 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		

<CFQUERY datasource="#request.dsn#" NAME="read_sent_lien104">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 104
			</cfquery>

		<cfif #read_sent_lien104.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien104">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 104 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		

<CFQUERY datasource="#request.dsn#" NAME="read_sent_lien105">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 105
			</cfquery>

		<cfif #read_sent_lien105.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien105">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 105 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		

<CFQUERY datasource="#request.dsn#" NAME="read_sent_lien106">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 106
			</cfquery>

		<cfif #read_sent_lien106.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien106">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 106 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		

<CFQUERY datasource="#request.dsn#" NAME="read_sent_lien107">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 107
			</cfquery>

		<cfif #read_sent_lien107.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien107">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 107 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		

<CFQUERY datasource="#request.dsn#" NAME="read_sent_lien108">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 108
			</cfquery>

		<cfif #read_sent_lien108.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien108">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 108 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		

<CFQUERY datasource="#request.dsn#" NAME="read_sent_lien109">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 109
			</cfquery>

		<cfif #read_sent_lien109.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien109">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 109 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		

<CFQUERY datasource="#request.dsn#" NAME="read_sent_lien110">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 110
			</cfquery>

		<cfif #read_sent_lien110.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien110">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 110 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		

<CFQUERY datasource="#request.dsn#" NAME="read_sent_lien111">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 111
			</cfquery>

		<cfif #read_sent_lien111.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien111">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 111 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		

<CFQUERY datasource="#request.dsn#" NAME="read_sent_lien112">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 112
			</cfquery>

		<cfif #read_sent_lien112.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien112">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 112 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		

<CFQUERY datasource="#request.dsn#" NAME="read_sent_lien113">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 113
			</cfquery>

		<cfif #read_sent_lien113.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien113">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 113 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		

<CFQUERY datasource="#request.dsn#" NAME="read_sent_lien114">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 114
			</cfquery>

		<cfif #read_sent_lien114.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien114">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 114 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		

<CFQUERY datasource="#request.dsn#" NAME="read_sent_lien115">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 115
			</cfquery>

		<cfif #read_sent_lien115.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien115">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 115 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		

<CFQUERY datasource="#request.dsn#" NAME="read_sent_lien116">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 116
			</cfquery>

		<cfif #read_sent_lien116.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien116">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 116 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		

<CFQUERY datasource="#request.dsn#" NAME="read_sent_lien117">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 117
			</cfquery>

		<cfif #read_sent_lien117.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien117">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 117 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		

<CFQUERY datasource="#request.dsn#" NAME="read_sent_lien118">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 118
			</cfquery>

		<cfif #read_sent_lien118.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien118">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 118 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		

<CFQUERY datasource="#request.dsn#" NAME="read_sent_lien119">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 119
			</cfquery>

		<cfif #read_sent_lien119.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien119">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 119 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		

<CFQUERY datasource="#request.dsn#" NAME="read_sent_lien120">
			select * from prop_ins_view
			Where prop_id = #url.rec_ID# and selectedOrgs3 = 120
			</cfquery>

		<cfif #read_sent_lien120.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien120">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien 120 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="https://#cgi.server_name#/admin_area/prop_abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>
		</CFOUTPUT>
		</cfif>
		















<CFQUERY DATASOURCE="#request.dsn#" NAME="read_com">
			select * from Doc_Title_Insurance_prop
			Where prop_id = #url.rec_ID#
</cfquery>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_user">
			select * from first_admin
			WHERE id = '#read_com.a_recieved_by#'
</cfquery>
<CFIF (IsDefined("url.uid") is True and #username# eq "")>
			<table width="99%" cellpadding=1 cellspacing=1 border=0 >
				<tr>

					<td width="98%" align=center valign=middle bgcolor=d1d1d1>
					<br><br>
					<b><font face=verdana size=2 color=black>View/Mark as sent <cfoutput>
                    <cfif comp_id eq 9711 OR comp_id eq 9810>
                    <a href="https://#cgi.server_name#/admin_area/landsafe_property_report_submit.cfm?uid=#uid#&al=#al#&rec_id=#rec_id#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Property Report</font></a>
                    <cfelse>
                    
                    
                    <a href="https://#cgi.server_name#/admin_area/property_report_<cfif read_company.ID eq 6349 or read_company.master_co_id eq 6349 or read_company.ID eq 9506 or read_company.master_co_id eq 6349 or read_company.streamline_client eq 1>sb_<cfelseif (Read_Company.id eq 8260 or read_company.master_co_id eq 8260 or Read_Company.id eq 9031)>doj_</cfif>submit.cfm?uid=#uid#&al=#al#&rec_id=#rec_id#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Property Report</font></a>
                                        </cfif>
</cfoutput></font></b>
	</td>

				</tr>
				<tr>

					<td width="98%" align=center valign=middle bgcolor=d1d1d1>
					<br>
					<cfif #read_com.s_status# eq 1>
					<b><font face=verdana size=2 color=red>Property Report is marked as sent </b></font><cfoutput><b><font face=verdana size=2 color=blue>#DateFormat(read_com.a_recieved_date, "dd-mm-yyyy")# at #TimeFormat(read_com.a_recieved_time, "HH:mm:ss")# by #read_user.fname# #read_user.lname#<font></b></cfoutput>
					<cfelse><b><font face=verdana size=2 color=blue>Property Report is NOT YET marked as sent</font></b></cfif>
	</td>

				</tr>
</table>

		</cfif>


<cfelse>
			<table width="99%" cellpadding=1 cellspacing=1 border=0 >
				<tr>

					<td width="98%" align=center valign=middle bgcolor=d1d1d1>
						<p><br>
						<font face=verdana size=2 color=red>
						<b>Property Report for this order has not yet been prepared. To do so you first need to upload an abstract file under "abstract" button and then go to the view area of that file where the "Property Report Form" is located </b><br></p>
					</td>

				</tr>
</table>

</cfif>
</td>
</tr>

	</table>


			</TD>
		</TR>

	</table>




</BODY>
</HTML>


<CFIF #username# neq "" and #a_flag# eq 1>

<CFLOCATION URL="https://#cgi.server_name#/prop_vendor_data_form.cfm?username=#url.username#&password=#url.password#&rec_id=#url.rec_id#&a_trig=1">

</cfif>