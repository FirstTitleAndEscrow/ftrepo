<CFQUERY datasource="#request.dsn#" NAME="check_report">
		SELECT *
		FROM title
		WHERE a_insert_date = '#DateFormat(Now(), "mm-dd-yyyy")#'
	</cfquery>
	<CFQUERY datasource="#request.dsn#" NAME="check_report2">
		SELECT *
		FROM property
		WHERE a_insert_date = '#DateFormat(Now(), "mm-dd-yyyy")#'
	</cfquery>
	<CFQUERY datasource="#request.dsn#" NAME="check_report3">
		SELECT *
		FROM Appraisal
		WHERE a_insert_date = '#DateFormat(Now(), "mm-dd-yyyy")#'
	</cfquery>
				<CFMAIL
				TO="spape@firsttitleservices.com"
				FROM="webmaster@firsttitleservices.com"
				SERVER="127.0.0.1"
				Subject="#check_report.recordcount# titles -- #check_report2.recordcount# properties -- #check_report3.recordcount# appraisals found as of #DateFormat(Now(), "mm-dd-yyyy")# #TimeFormat(Now(), "hh:mm:sstt")#"
				TIMEOUT="600"
				>
		#check_report.recordcount# titles -- #check_report2.recordcount# properties -- #check_report3.recordcount# appraisals found as of #DateFormat(Now(), "mm-dd-yyyy")# #TimeFormat(Now(), "hh:mm:sstt")#

<cfif #check_report.recordcount# GT 0>
Titles:
<cfloop query="check_report">
<CFQUERY datasource="#request.dsn#" NAME="check_client">
		SELECT company
		FROM companies
		WHERE ID = '#comp_id#'
	</cfquery>
Client-- #check_client.company#, Title Number-- #title_id#, Borrower-- #bfirstname1#	#blastname1#
</cfloop>
</cfif>
<cfif #check_report2.recordcount# GT 0>
Properties:
<cfloop query="check_report2">
<CFQUERY datasource="#request.dsn#" NAME="check_client2">
		SELECT company
		FROM companies
		WHERE ID = '#comp_id#'
	</cfquery>
Client-- #check_client2.company#, Prop Number-- #prp_id#, Borrower-- #bfirstname1#	#blastname1#
</cfloop>
</cfif>
<cfif #check_report3.recordcount# GT 0>
Appraisals:
<cfloop query="check_report3">
<CFQUERY datasource="#request.dsn#" NAME="check_client3">
		SELECT company
		FROM companies
		WHERE ID = '#comp_id#'
	</cfquery>
Client-- #check_client3.company#, App Number-- #app_id#, Borrower-- #bfirstname1#	#blastname1#
</cfloop>
</cfif>
				</cfmail>
	