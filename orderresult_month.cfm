<!--
	Modified 6/16/00 by Andy
	Added "In Typing" to STATUS Select box
 -->








<cfparam name="sortorder" default="">
<cfparam name="blastname_pass" default="">
<cfparam name="bfirstname_pass" default="">
<cfparam name="get_id" default="">
<cfparam name="start_month_pass" default="">
<cfparam name="company_pass" default="">
<cfparam name="delayreason" default="">
<cfparam name="status" default="">

<CFOUTPUT>
<CFIF IsDefined("start_month_pass")>
	<cfif #start_month_pass# is not "">
	<CFSET start_month_pass = #start_month_pass#>
	</cfif>
</CFIF>
<CFIF IsDefined("get_id")><cfif #get_id# is not "">
	<CFSET get_id = #get_id#>
</cfif></CFIF>
<CFIF IsDefined("company_pass")><cfif #company_pass# is not "">
	<CFSET company_pass = #company_pass#>
</cfif></CFIF>
<CFIF IsDefined("blastname_pass")><cfif #Trim(blastname_pass)# is not "">
	<CFSET blastname_pass = #blastname_pass#>
</cfif></CFIF>
<CFIF IsDefined("bfirstname_pass")><cfif #Trim(bfirstname_pass)# is not "">
	<CFSET bfirstname_pass = #bfirstname_pass#>
</cfif></CFIF>
<CFIF IsDefined("delayreason")><cfif #delayreason# is not "">
	<CFSET delayreason = #delayreason#>
</cfif></CFIF>
<CFIF IsDefined("status")><cfif #status# is not "">
	<CFSET status = #status#>
</cfif></CFIF>
</CFOUTPUT>


<CFIF '#update#' EQ 'yes'>
	<!---- BEGIN MODIFY  ----->

		<CFIF (#status# EQ "Report E-mailed") OR (#status# EQ "Report Faxed")>

				<CFQUERY name="updateinfo" DATASOURCE="First_Title_Services">
				UPDATE orders
				SET status = '#status#',
					delivery_date = '#DateFormat(Now(), "d-mmm-yyyy")# #TimeFormat(Now(), "HH:mm:ss")#',
					delayreason = '#delayreason#'
				WHERE orderid = #orderid#
				</CFQUERY>
		<CFELSE>


				<CFQUERY name="updateinfo" DATASOURCE="First_Title_Services">
				UPDATE orders
				SET status = '#status#',
					delayreason = '#delayreason#'
				WHERE orderid = #orderid#
				</CFQUERY>

		</CFIF>

	<!------ END MODIFY ------>
</CFIF>


<cfquery name="getorderinfo" DATASOURCE="First_Title_Services">
SELECT O.orderid, O.servicetype, O.orderdate, O.status, O.delayreason, O.delivery_date, O.file_upload, C.blastname1, C.bfirstname1, C.blastname2, C.bfirstname2, C.pcity, C.pstate, C.pcounty, C.customerid, O.duedate, L.company
FROM Orders O, Customers C, Login L
WHERE O.customerid=C.customerid AND O.loginid=L.loginid

<cfif #start_month_pass# is not "">
and O.orderdate LIKE '%#start_month_pass#%'
</cfif>

<cfif #get_id# is not "">
and O.orderid = #get_id#
</cfif>

<cfif #delayreason# is not "">
and O.delayreason LIKE '%#delayreason#%'
</cfif>

<cfif #status# is not "">
and O.status LIKE '%#status#%'
</cfif>


<cfif #company_pass# is not "">
and L.company = '#company_pass#'
</cfif>

<cfif #Trim(blastname_pass)# is not "">
and (C.blastname1 LIKE '%#Trim(blastname_pass)#%' or C.blastname2 LIKE '%#Trim(blastname_pass)#%')
</cfif>

<cfif #Trim(bfirstname_pass)# is not "">
and (C.bfirstname1 LIKE '%#Trim(bfirstname_pass)#%' or C.bfirstname2 LIKE '%#Trim(bfirstname_pass)#%')
</cfif>

ORDER BY #sortorder#
</cfquery>



<CFSET datnow = "#DateFormat(Now())#">
<CFSET timnow = "#TimeFormat(Now())#">
<html>
<head>
	<title>1st Title & Escrow, Inc. - Show Detail Order</title>
</head>

<body leftmargin="0" topmargin="0" marginheight="0" marginwidth="0">



<TABLE WIDTH=440 BORDER=0 CELLSPACING=-1 align="center">
<TR>
<TD ALIGN=CENTER>
<FONT FACE=ARIAL COLOR="red" SIZE=4>Admin - Search Order Results</FONT>
<HR>
<FONT SIZE=2 FACE=ARIAL>
<!---------------------------------------------------->
<!--- FORWARD and BACK BUTTONS --->
<!---------------------------------------------------->
		<CFIF IsDefined("count")>

			<!---------------------------------------------------->
			<!--- AT FIRST RECORD --->
			<!---------------------------------------------------->
			<CFIF #count# EQ 0>

				<CFSET count_forward = 10>

				<CFIF #count_forward# GTE #getorderinfo.recordcount#>
				<!--- IF AT END OF LIST, DO NOT DISPLAY --->

				<CFELSE><font size="2">
				<CFOUTPUT><A HREF="./orderresult_month.cfm?update=#update#&start_month_pass=#start_month_pass#&sortorder=#sortorder#&get_id=#get_id#&delayreason=#delayreason#&status=#status#&company_pass=#company_pass#&blastname_pass=#blastname_pass#&bfirstname_pass=#bfirstname_pass#&adminid=#adminid#&adminlogin=#adminlogin#&adminpassword=#adminpassword#&count=#count_forward#">
				Next Screen</a></CFOUTPUT>
				</CFIF>

			<CFELSE><font size="2">

				<CFSET count_forward = #count# + 10>
				<CFSET count_back = #count# - 10>

					<CFIF (#count# EQ 0) OR (#count# EQ 1)>
					<CFOUTPUT><A HREF="./orderresult_month.cfm?update=#update#&start_month_pass=#start_month_pass#&sortorder=#sortorder#&get_id=#get_id#&delayreason=#delayreason#&status=#status#&company_pass=#company_pass#&blastname_pass=#blastname_pass#&bfirstname_pass=#bfirstname_pass#&adminid=#adminid#&adminlogin=#adminlogin#&adminpassword=#adminpassword#"></CFOUTPUT>
					<CFELSE>
					<CFOUTPUT><A HREF="./orderresult_month.cfm?update=#update#&start_month_pass=#start_month_pass#&sortorder=#sortorder#&get_id=#get_id#&delayreason=#delayreason#&status=#status#&company_pass=#company_pass#&blastname_pass=#blastname_pass#&bfirstname_pass=#bfirstname_pass#&adminid=#adminid#&adminlogin=#adminlogin#&adminpassword=#adminpassword#&count=#count_back#"></CFOUTPUT>
					</CFIF>
				Previous Screen</a>

				<CFIF #count_forward# GTE #getorderinfo.recordcount#>
				<!--- IF AT END OF LIST, DO NOT DISPLAY --->
				<CFELSE>
				<CFOUTPUT><A HREF="./orderresult_month.cfm?update=#update#&start_month_pass=#start_month_pass#&sortorder=#sortorder#&get_id=#get_id#&delayreason=#delayreason#&status=#status#&company_pass=#company_pass#&blastname_pass=#blastname_pass#&bfirstname_pass=#bfirstname_pass#&adminid=#adminid#&adminlogin=#adminlogin#&adminpassword=#adminpassword#&count=#count_forward#">
				Next Screen</a></CFOUTPUT>
				</CFIF></td>

			</CFIF>

		<CFELSE>
		<!---------------------------------------------------->
		<!--- NOT DEFINED & BEGINNING OF LIST ---->
		<!---------------------------------------------------->
			<CFIF #getorderinfo.recordcount# LT 10>

			<CFELSE><font size="2">

				<CFSET count_forward = 10>

				<CFIF #count_forward# GTE #getorderinfo.recordcount#>
				<!--- IF AT END OF LIST, DO NOT DISPLAY --->

				<CFELSE>
				<CFOUTPUT><A HREF="./orderresult_month.cfm?update=#update#&start_month_pass=#start_month_pass#&sortorder=#sortorder#&get_id=#get_id#&delayreason=#delayreason#&status=#status#&company_pass=#company_pass#&blastname_pass=#blastname_pass#&bfirstname_pass=#bfirstname_pass#&adminid=#adminid#&adminlogin=#adminlogin#&adminpassword=#adminpassword#&count=#count_forward#">
				Next Screen</a></CFOUTPUT>
				</CFIF></td></tr>

			</CFIF>
		</CFIF>
</TD>
</TR>
</TABLE>


<table border=1 cellspacing=0 cellpadding=3 align=center>
<tr align=center>
    <td><FONT FACE=verdana size=1><b>Account</b></td>
	<td><FONT FACE=verdana size=1><b>Order No.</b></td>
	<td><FONT FACE=verdana size=1><b>Product</b></td>
	<td><FONT FACE=verdana size=1><b>Borrower's<BR>Last Name</b></td>
	<td><FONT FACE=verdana size=1><b>Borrower's<BR>First Name</b></td>
	<td><FONT FACE=verdana size=1><b>State</b></td>
	<td><FONT FACE=verdana size=1><b>Order Date</b></td>
	<td><FONT FACE=verdana size=1><b>Due Date</b></td>
	<td><FONT FACE=verdana size=1><b>Del Date</b></td>
	<td><FONT FACE=verdana size=1><b>Status</b></td>
	<td><FONT FACE=verdana size=1><b>Comments</b></td>
	<td><FONT FACE=verdana size=1><b>Customer Info</b></td>
	<td><FONT FACE=verdana size=1><b>Edit</b></td>
	<td><FONT FACE=verdana size=1><b>File Upload</b></td>
<!--- 	<td><FONT FACE=verdana size=1><b>Update</b></td> --->

</tr>

<!---------------------------------------------------->
<!--- DISPLAY SEARCH RESULTS --->
<!---------------------------------------------------->

		<!---------------------------------------------------->
		<!--- SET COUNT FOR RECORD DISPLAY - 10 at a time --->
		<!---------------------------------------------------->
		<CFIF IsDefined("count")>
			<CFIF #count# EQ 0>
				<CFSET count = 1>
			</CFIF>
		<CFELSE>
			<CFSET count = 1>
		</CFIF>

		<!---------------------------------------------------->
		<!--- SET COUNT_END FOR RECORD DISPLAY --->
		<!---------------------------------------------------->
		<CFSET count_end = #count# + 9>

			 <CFLOOP QUERY="getorderinfo" startrow="#count#" endrow="#count_end#">
<CFOUTPUT>
<tr align=center>
   <td valign="middle"><FONT FACE=verdana size=1>#company#&nbsp;</TD>
   <td valign="middle"><FONT FACE=verdana size=1>#orderid#&nbsp;</TD>
	<td valign="middle"><FONT FACE=verdana size=1>#servicetype#</TD>
	<td valign="middle"><FONT FACE=verdana size=1>#blastname1#</TD>
	<td valign="middle"><FONT FACE=verdana size=1>#bfirstname1#</TD>
	<td valign="middle"><FONT FACE=verdana size=1>#pstate#</TD>

<!--- 	<cfset date1=#DateFormat("#startdate#", "d-mmm-yy")#> --->
	<td valign="middle"><FONT FACE=verdana size=1>#orderdate#</TD>
	<td valign="middle"><FONT  FACE=verdana size=1>#duedate#</TD>
	<td valign="middle"><FONT FACE=verdana size=1>#DateFormat(delivery_date, "d-mmm-yy")#</TD>


<cfFORM action="./orderresult_month.cfm">
<cfif #start_month_pass# is not ""><input type="hidden" name="start_month_pass" value="#start_month_pass#"></cfif>
<cfif #get_id# is not ""><input type="hidden" name="get_id" value="#get_id#"></cfif>
<cfif #delayreason# is not ""><input type="hidden" name="delayreason" value="#delayreason#"></cfif>
<cfif #status# is not ""><input type="hidden" name="status" value="#status#"></cfif>
<cfif #company_pass# is not ""><input type="hidden" name="company_pass" value="#company_pass#"></cfif>
<cfif #Trim(blastname_pass)# is not ""><input type="hidden" name="blastname_pass" value="#blastname_pass#"></cfif>
<cfif #Trim(bfirstname_pass)# is not ""><input type="hidden" name="bfirstname_pass" value="#bfirstname_pass#"></cfif>

<INPUT type="hidden" name="sortorder" value="#sortorder#">
<INPUT type="hidden" name="update" value="yes">
<INPUT type="hidden" name="orderid" value="#orderid#">
	<td valign="middle"><FONT SIZE=2 FACE=ARIAL>
	  	<select name="status">
	<cfif #status# is not "open">
	 <option value="#status#" selected>#status#
	<cfelse>
	  <option value="In Process" selected>In Process</OPTION>
	 </cfif>

	  <option value="In Process">In Process</OPTION>
	  <option value="In Typing">In Typing</OPTION>
	<option value="Report E-mailed">Report E-mailed</OPTION>
	<option value="Report Faxed">Report Faxed</OPTION>
	<option value="Cancelled per client">Cancelled per client</OPTION>
    <option value="Delayed">Delayed</OPTION>
	<option value="Loan Closed">Loan Closed</OPTION>
	<option value=""></option>
	</select></td>

	<td valign="middle"><FONT SIZE=2 FACE=ARIAL>
	<select name="delayreason">
	  <option value="#delayreason#">#delayreason#</OPTION>
	  <option value="Court House Closed">Court House Closed</OPTION>
	  <option value="Waiting on Tax Info.">Waiting on Tax Info.</OPTION>
	  <option value="In Typing">In Typing</OPTION>
	  <option value="Waiting on Judgment Info">Waiting on Judgment Info</OPTION>
      <option value="Call for Detail">Call for Detail</OPTION>
	  <option value="Judgment Exists">Judgment Exists</OPTION>
	  <option value="Subordination Needed">Subordination Needed</OPTION>
	  <option value="Vesting Issue">Vesting Issue</OPTION>
	  <option value="Unreleased Mortgage Exists">Unreleased Mortgage Exists</OPTION>
	  <option value="Clear to Close">Clear to Close</OPTION>
	   <option value="Loan Funded">Loan Funded</OPTION>
	    <option value="Funds Short to Disperse">Funds Short to Disperse</OPTION>
		<option value="Funds not Received">Funds not Received</OPTION>
	  <option value=""></option>
	  </select></td>

	<td valign="middle">
	<input type="hidden" name="adminid" value="#adminid#">
<input type="hidden" name="adminlogin" value="#adminlogin#">
<input type="hidden" name="adminpassword" value="#adminpassword#">
	<input type="hidden" name="customerid" value="#customerid#">
	<input type="hidden" name="orderid" value="#orderid#">
	<input type="submit" value="Update Row Info">
	</td>
	</cfFORM>

<FORM action="./showcustomer.cfm">
	<td valign="middle"><FONT SIZE=2 FACE=ARIAL>
	<input type="hidden" name="adminid" value="#adminid#">
<input type="hidden" name="adminlogin" value="#adminlogin#">
<input type="hidden" name="adminpassword" value="#adminpassword#">
	<input type="hidden" name="customerid" value="#customerid#">
	<input type="hidden" name="orderid" value="#orderid#">
	<input type="submit" value="Edit">
 	</td>
	</FORM>

<FORM action="./file_upload.cfm">
	<td><FONT SIZE=2 FACE=ARIAL><CFIF #file_upload# EQ "">
	<input type="hidden" name="adminid" value="#adminid#">
<input type="hidden" name="adminlogin" value="#adminlogin#">
<input type="hidden" name="adminpassword" value="#adminpassword#">
	<input type="hidden" name="customerid" value="#customerid#">
	<input type="hidden" name="orderid" value="#orderid#">
	<input type="submit" value="Upload File"></td>
	</FORM>
	<CFELSE>#file_upload#&nbsp;<br>
	<a href="./delete-uploaded-file.cfm?order_id=#orderid#" target="New" onClick="window.open('','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">delete</a></TD></CFIF>



<!--- 	<td><a href="./detailorder.cfm?orderid=#orderid#&adminid=#adminid#&adminlogin=#adminlogin#&adminpassword=#adminpassword#"><FONT SIZE=2 FACE=ARIAL>Detail/Update/Delete</a></td> --->
</tr>
</CFOUTPUT>
</CFLOOP>

</table>


<center>
<form action="./adminmain.cfm" method="post">
<cfoutput>
<input type="hidden" name="adminid" value="#adminid#">
<input type="hidden" name="adminlogin" value="#adminlogin#">
<input type="hidden" name="adminpassword" value="#adminpassword#">
</cfoutput>
<input type="submit" value="Main Admin Page">
</form></center>

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
</html>
