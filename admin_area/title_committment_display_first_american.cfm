


<CFPARAM NAME="a_trigger" DEFAULT="0">


		<CFQUERY datasource="#request.dsn#" NAME="read_Title">

			SELECT *
			FROM Title
			WHERE Title_ID = #rec_ID#

		</CFQUERY>
			<CFSET Buyer_1 = #read_Title.bfirstname1# & " " & #read_Title.bminame1# & " " & #read_Title.blastname1#>

			<CFSET Buyer_2 = #read_Title.bfirstname2# & " " & #read_Title.bminame2# & " " & #read_Title.blastname2#>

			<CFSET Seller_1 = #read_Title.sfirstname1# & " " & #read_Title.sminame1# & " " & #read_Title.slastname1#>

			<CFSET Seller_2 = #read_Title.sfirstname2# & " " & #read_Title.sminame2# & " " & #read_Title.slastname2#>

		<CFQUERY datasource="#request.dsn#" NAME="Read_Committment_Doc">
			SELECT *
			FROM Doc_Title_Insurance_Title
			WHERE Title_ID = #rec_ID# and Insurance_co = 15
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="read_ins_committments">
			SELECT *
			FROM Doc_Title_Insurance_Title
			WHERE Title_ID = #rec_ID#
		</CFQUERY>
	<CFQUERY datasource="#request.dsn#" NAME="get_billing_states">
		SELECT *
		FROM  Company_Billing_states
		WHERE company_id = '#read_title.comp_id#' AND a_states = '#read_title.pstate#'

</CFQUERY>

<cfif #get_billing_states.recordcount# GT "0">
<CFQUERY datasource="#request.dsn#" NAME="get_line_costs">
		SELECT *
		FROM Company_Billing_Values
		WHERE company_id = #read_title.comp_id# AND billing_id = #get_billing_states.billing_id#
	</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_age">
		SELECT *
		FROM  company_agency_assoc
		WHERE billing_id = '#get_billing_states.billing_id#'

</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_Title_FT_Agency_company">
		SELECT *
		FROM  title_ft_agencies
		WHERE title_ft_agency_id = #read_age.title_ft_agency_id#

</CFQUERY>


<cfelse>
<CFQUERY datasource="#request.dsn#" NAME="read_Title_FT_Agency_company">
		SELECT *
		FROM  title_ft_agencies
		WHERE 0 = 1

</CFQUERY>

</cfif>
	<CFQUERY datasource="#request.dsn#" NAME="Read_Doc">
			SELECT *
			FROM Doc_Amer_Pioneer_Ins_ALL_Title
			WHERE Title_ID = #rec_ID#
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_company">
			SELECT *
			FROM Title_Companies
			WHERE Title_Co_ID = 15
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="Read_Committment_Doc">
			SELECT *
			FROM Doc_Amer_Pioneer_Ins_ALL_Title
			WHERE Title_ID = #rec_ID#
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_tax_info">

			SELECT *
			FROM tax_cert_title
			where title_id = #rec_id#
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="read_deed_info">
		SELECT     *
FROM         title_ins_view
WHERE     (title_id = #rec_id#) AND (type = 'DATA')
ORDER BY insert_date, insert_time DESC
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_data_info">
		SELECT     *
FROM        doc_title_insurance_title
WHERE     (title_id = #rec_id#)
</CFQUERY>

 <CFQUERY datasource="#request.dsn#" NAME="read_title_file">
            select * from title_ins_view WHERE title_id = #url.rec_ID# and selectedOrgs
            is not null </cfquery>
	<CFSET alta1 =	"ALTA Owners Form B">
<CFSET alta2 =	"ALTA Mortgagees">
<CFSET d_out = '"' & "Commitment Number: " & #read_Title.title_id# & '"' & "," &
				'"' & "Commitment Date: " & #read_ins_committments.a_recieved_date# & " " & "at: " & #read_ins_committments.a_recieved_time# & '"' & "," &
				'"' & "Owner Policy: " & #alta1# & " " & "Proposed Insured: $ " & #Buyer_1# & " " & "Policy Amount $ " & #read_title.Purchase# & '"' & "," &
				'"' & "Owner Policy: " & #alta2# & " " & "Proposed Insured: $ " & #read_title.Insured# & " " & "Policy Amount $ " & #read_title.loanamt_float# & '"' & "," &
				'"' & "The Estate or interest in the land described in this Commitment is owned at the Commitment Date by: " &  #Buyer_1# & '"' & "," &
				'"' & "The land referred to in the Commitment is described as follows: " & #read_title_file.notes#	& '"' & "," &
        '"' & "The following are the requirements to be complied with: " & #read_title_file.addreq# & '"' & "," &
		    '"' & "Schedule B of the policy or policies to be issued will contain exceptions to the following matters unless the same are disposed of to the satisfaction of the company: " & #read_title_file.addex# & '"' & "," &
				'"' & " " & '"' & ","
				>

<!--- read out the last number used for a file name

	<CFFILE ACTION="read"
	FILE="C:\Inetpub\wwwroot\clients\firsttitleservices.com\www\file_number\file_no.txt"
	variable="n_OUT">--->

<!--- increment that number

	<CFSET n_no = #n_out# + "1">--->

<!--- delete the old file with the old number --->
<!--- FILE="F:\InetPub\wwwroot\71.068___www.firsttitleservices.com\file_number\file_no.txt" --->
	<!---<CFFILE ACTION="delete"
	FILE="C:\Inetpub\wwwroot\clients\firsttitleservices.com\www\file_number\file_no.txt"
	> --->
<!--- write the new number to the file --->

	<!--- <CFFILE ACTION="WRITE"
	FILE="C:\Inetpub\wwwroot\clients\firsttitleservices.com\www\file_number\file_no.txt"
	OUTPUT="#n_no#">--->

<!--- now writ the data for this order to the file --->
<!--- FILE="F:\InetPub\wwwroot\71.068___www.firsttitleservices.com\dhfvtywty_1\data_#n_no#.txt" --->
	<CFFILE ACTION="WRITE"
	FILE="C:\Inetpub\wwwroot\clients\firsttitleservices.com\www\dhfvtywty_1\#read_Title.title_id#.txt"
	OUTPUT="#D_OUT#">


<HTML XMLNS:IE>
<HEAD>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

</head>
<BODY>

<p>

<table width="100%" cellpadding=1 cellspacing=1 border=0 bgcolor=white>
<cfoutput>
<FORM action="./Title_committment_submit.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&company_id=#company_ID#&a_trigger=7"  ENCTYPE="multipart/form-data" method="post">
</cfoutput>
<tr>
<td width="100%" align=center valign=top bgcolor=yellow>
			<b><font face=verdana size=3 color=red>Click this button to complete </font></b><INPUT TYPE=IMAGE SRC="./images/button_mark_as_sent.gif" border=0>
</td>	</tr>
<cfif Len(read_title.realec_transactionID)>
<tr>
<td width="100%" align=center valign=top bgcolor=yellow><font face=verdana size=3 color=red>RealEC Comment: </font><input name="comment" type="text"></td>
</tr>
</cfif>
</form>
</table>
<CFINCLUDE TEMPLATE="../title_committment_view_first_american2.cfm">

</body>
</html>
