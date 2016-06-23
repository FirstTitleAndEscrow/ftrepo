
<cfparam name="form.problem1" default="">
<cfparam name="form.problem1_comments" default="">
<cfparam name="form.problem1_date_cleared" default="">
<cfparam name="form.problem2" default="">
<cfparam name="form.problem2_comments" default="">
<cfparam name="form.problem2_date_cleared" default="">
<cfparam name="form.problem3" default="">
<cfparam name="form.problem3_comments" default="">
<cfparam name="form.problem3_date_cleared" default="">
<cfparam name="form.problem4" default="">
<cfparam name="form.problem4_comments" default="">
<cfparam name="form.problem4_date_cleared" default="">
<cfparam name="form.problem5" default="">
<cfparam name="form.problem5_comments" default="">
<cfparam name="form.problem5_date_cleared" default="">
<cfparam name="form.problem6" default="">
<cfparam name="form.problem6_comments" default="">
<cfparam name="form.problem6_date_cleared" default="">
<cfparam name="form.problem7" default="">
<cfparam name="form.problem7_comments" default="">
<cfparam name="form.problem7_date_cleared" default="">
<cfparam name="form.problem8" default="">
<cfparam name="form.problem8_comments" default="">
<cfparam name="form.problem8_date_cleared" default="">
<cfparam name="form.problem9" default="">
<cfparam name="form.problem9_comments" default="">
<cfparam name="form.problem9_date_cleared" default="">
<cfparam name="form.problem10" default="">
<cfparam name="form.problem10_comments" default="">
<cfparam name="form.problem10_date_cleared" default="">
<cfparam name="form.order_id" default="100">
<cfparam name="form.submit" default="">



<cfif form.submit eq 'Save' or form.submit eq 'Save and Mark As Sent'>

<CFQUERY datasource="#request.dsn#" NAME="find_data">
Select * from Rosicki where order_id = #form.order_id#
</cfquery>
<cfif find_data.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="insert_data">
Insert into Rosicki (problem1, problem1_comments, problem1_date_cleared,
problem2, problem2_comments, problem2_date_cleared,
problem3, problem3_comments, problem3_date_cleared,
problem4, problem4_comments, problem4_date_cleared,
problem5, problem5_comments, problem5_date_cleared,
problem6, problem6_comments, problem6_date_cleared,
problem7, problem7_comments, problem7_date_cleared,
problem8, problem8_comments, problem8_date_cleared,
problem9, problem9_comments, problem9_date_cleared,
problem10, problem10_comments, problem10_date_cleared, order_id)
values ('#form.problem1#', '#form.problem1_comments#', '#form.problem1_date_cleared#',
'#form.problem2#', '#form.problem2_comments#', '#form.problem2_date_cleared#',
'#form.problem3#', '#form.problem3_comments#', '#form.problem3_date_cleared#',
'#form.problem4#', '#form.problem4_comments#', '#form.problem4_date_cleared#',
'#form.problem5#', '#form.problem5_comments#', '#form.problem5_date_cleared#',
'#form.problem6#', '#form.problem6_comments#', '#form.problem6_date_cleared#',
'#form.problem7#', '#form.problem7_comments#', '#form.problem7_date_cleared#',
'#form.problem8#', '#form.problem8_comments#', '#form.problem8_date_cleared#',
'#form.problem9#', '#form.problem9_comments#', '#form.problem9_date_cleared#',
'#form.problem10#', '#form.problem10_comments#', '#form.problem10_date_cleared#', '#form.order_id#')
</cfquery>

<cfelse>


<CFQUERY datasource="#request.dsn#" NAME="insert_data">
Update Rosicki 
set problem1 = '#form.problem1#', 
problem1_comments = '#form.problem1_comments#', 
problem1_date_cleared = '#form.problem1_date_cleared#',
problem2 = '#form.problem2#', 
problem2_comments = '#form.problem2_comments#', 
problem2_date_cleared = '#form.problem2_date_cleared#',
problem3 = '#form.problem3#', 
problem3_comments = '#form.problem3_comments#', 
problem3_date_cleared = '#form.problem3_date_cleared#',
problem4 = '#form.problem4#', 
problem4_comments = '#form.problem4_comments#', 
problem4_date_cleared = '#form.problem4_date_cleared#',
problem5 = '#form.problem5#', 
problem5_comments = '#form.problem5_comments#', 
problem5_date_cleared = '#form.problem5_date_cleared#',
problem6 = '#form.problem6#', 
problem6_comments = '#form.problem6_comments#', 
problem6_date_cleared = '#form.problem6_date_cleared#',
problem7 = '#form.problem7#', 
problem7_comments = '#form.problem7_comments#', 
problem7_date_cleared = '#form.problem7_date_cleared#',
problem8 = '#form.problem8#', 
problem8_comments = '#form.problem8_comments#', 
problem8_date_cleared = '#form.problem8_date_cleared#',
problem9 = '#form.problem9#', 
problem9_comments = '#form.problem9_date_cleared#', 
problem9_date_cleared = '#form.problem9_date_cleared#',
problem10 = '#form.problem10#', 
problem10_comments = '#form.problem10_comments#', 
problem10_date_cleared = '#form.problem10_date_cleared#'
WHERE order_id = '#form.order_id#'
</cfquery>
</cfif>
<cfif form.submit eq "Save and Mark As Sent">

<cflocation url="/admin_area/title_committment_submit.cfm?#cgi.query_string#&go_through=1">
<cfelse>
<center><BR><font color="red">The Title Commitment Checklist has been Saved</font></center><br>
</cfif>
</cfif>
<CFQUERY datasource="#request.dsn#" NAME="find_data">
Select * from Rosicki where order_id = #url.rec_id#
</cfquery>


<center>
<font face="Arial, Helvetica, sans-serif">The Client has requested that the following information be<BR> filled-out, which will be sent along with the Title Commitment:</center><br>
<br>

<form action="<cfoutput>#cgi.SCRIPT_NAME#?#CGI.QUERY_STRING#</cfoutput>" method="post">
<cfoutput>
<input type="hidden" name="order_id" value="#rec_id#">

<table width="800" border="1" cellspacing="2" cellpadding="2">
  <tr>
    <td align="left" valign="top">PROBLEM</td>
    <td align="left" valign="top">COMMENTS</td>
    <td align="left" valign="top">DATE CLEARED</td>
  </tr>
  <tr>
    <td align="left" valign="top" width="600"><input name="problem1" type="checkbox" value="1" <cfif find_data.problem1 eq 1>checked</cfif>>Title Vested in</td>
    <td align="left" valign="top"><input name="problem1_comments" type="text" size="40" maxlength="250" value="#find_data.problem1_comments#"></td>
    <td align="left" valign="top"><input name="problem1_date_cleared" type="text" size="40" maxlength="20" value="#find_data.problem1_date_cleared#"></td>
  </tr>
  <tr>
    <td align="left" valign="top" width="600"><input name="problem2" type="checkbox" value="1" <cfif find_data.problem2 eq 1>checked</cfif>>Delinquent Taxes</td>
    <td align="left" valign="top"><input name="problem2_comments" type="text" size="40" maxlength="250" value="#find_data.problem2_comments#"></td>
    <td align="left" valign="top"><input name="problem2_date_cleared" type="text" size="40" maxlength="20" value="#find_data.problem2_date_cleared#"></td>
  </tr>
  <tr>
    <td align="left" valign="top" width="600"><input name="problem3" type="checkbox" value="1" <cfif find_data.problem3 eq 1>checked</cfif>>Delinquent HOA</td>
    <td align="left" valign="top"><input name="problem3_comments" type="text" size="40" maxlength="250" value="#find_data.problem3_comments#"></td>
    <td align="left" valign="top"><input name="problem3_date_cleared" type="text" size="40" maxlength="20" value="#find_data.problem3_date_cleared#"></td>
  </tr>
  <tr>
    <td align="left" valign="top" width="600"><input name="problem4" type="checkbox" value="1" <cfif find_data.problem4 eq 1>checked</cfif>>Utility Lien</td>
    <td align="left" valign="top"><input name="problem4_comments" type="text" size="40" maxlength="250" value="#find_data.problem4_comments#"></td>
    <td align="left" valign="top"><input name="problem4_date_cleared" type="text" size="40" maxlength="20" value="#find_data.problem4_date_cleared#"></td>
  </tr>
  <tr>
    <td align="left" valign="top" width="600"><input name="problem5" type="checkbox" value="1" <cfif find_data.problem5 eq 1>checked</cfif>>Bankruptcy Filed</td>
    <td align="left" valign="top"><input name="problem5_comments" type="text" size="40" maxlength="250" value="#find_data.problem5_comments#"></td>
    <td align="left" valign="top"><input name="problem5_date_cleared" type="text" size="40" maxlength="20" value="#find_data.problem5_date_cleared#"></td>
  </tr>
  <tr>
    <td align="left" valign="top" width="600"><input name="problem6" type="checkbox" value="1" <cfif find_data.problem6 eq 1>checked</cfif>>Outstanding Judgment</td>
    <td align="left" valign="top"><input name="problem6_comments" type="text" size="40" maxlength="250" value="#find_data.problem6_comments#"></td>
    <td align="left" valign="top"><input name="problem6_date_cleared" type="text" size="40" maxlength="20" value="#find_data.problem6_date_cleared#"></td>
  </tr>
  <tr>
    <td align="left" valign="top" width="600"><input name="problem7" type="checkbox" value="1" <cfif find_data.problem7 eq 1>checked</cfif>>IRS Liens</td>
    <td align="left" valign="top"><input name="problem7_comments" type="text" size="40" maxlength="250" value="#find_data.problem7_comments#"></td>
    <td align="left" valign="top"><input name="problem7_date_cleared" type="text" size="40" maxlength="20" value="#find_data.problem7_date_cleared#"></td>
  </tr>
  <tr>
    <td align="left" valign="top" width="600"><input name="problem8" type="checkbox" value="1" <cfif find_data.problem8 eq 1>checked</cfif>>Outstanding Mortgage</td>
    <td align="left" valign="top"><input name="problem8_comments" type="text" size="40" maxlength="250" value="#find_data.problem8_comments#"></td>
    <td align="left" valign="top"><input name="problem8_date_cleared" type="text" size="40" maxlength="20" value="#find_data.problem8_date_cleared#"></td>
  </tr>
  <tr>
    <td align="left" valign="top" width="600"><input name="problem9" type="checkbox" value="1" <cfif find_data.problem9 eq 1>checked</cfif>>Invalid Foreclosure</td>
    <td align="left" valign="top"><input name="problem9_comments" type="text" size="40" maxlength="250" value="#find_data.problem9_comments#"></td>
    <td align="left" valign="top"><input name="problem9_date_cleared" type="text" size="40" maxlength="20" value="#find_data.problem9_date_cleared#"></td>
  </tr>
  <tr>
    <td align="left" valign="top" width="600"><input name="problem10" type="checkbox" value="1" <cfif find_data.problem10 eq 1>checked</cfif>>Other Issues</td>
    <td align="left" valign="top"><input name="problem10_comments" type="text" size="40" maxlength="250" value="#find_data.problem10_comments#"></td>
    <td align="left" valign="top"><input name="problem10_date_cleared" type="text" size="40" maxlength="20" value="#find_data.problem10_date_cleared#"></td>
  </tr>
  <tr>
    <td align="center" valign="top" colspan="3"><input name="submit" type="submit" value="Save">&nbsp;&nbsp;&nbsp;&nbsp;<input name="submit" type="submit" value="Save and Mark As Sent"></td>
  </tr>
</table>
</cfoutput>
<br>
<br></font>
<cfinclude template="../title_committment_view_stewart_title_ins.cfm">
</form>