<CFQUERY datasource="#request.dsn#" NAME="check_taxes">
SELECT     payoff_ID
FROM       tblUser_Roles
WHERE      (payoff_ID IS NOT NULL) AND (payoff_Start_Datetime IS NOT NULL) AND (payoff_Finish_Datetime IS NULL) 
GROUP BY payoff_ID
</CFQUERY>

<CFSET taxes = #check_taxes.recordcount# * 5>

<CFQUERY datasource="#request.dsn#" NAME="check_taxes_Count">
SELECT     COUNT(payoff_ID) AS TaxCount
FROM         dbo.tblUser_Roles
WHERE     (payoff_Start_Datetime IS NOT NULL) AND (payoff_Finish_Datetime IS NULL)and cancelled is null
HAVING      (COUNT(payoff_ID) IS NOT NULL)
</CFQUERY>

<!---Clear to Close --->
<CFQUERY datasource="#request.dsn#" NAME="check_ctc">
	SELECT     CleartoClose_ID
	FROM       tblUser_Roles
	WHERE      (CleartoClose_ID IS NOT NULL) AND (CleartoClose_Start_Datetime IS NOT NULL) AND (CleartoClose_End_Datetime IS NULL) 
	GROUP BY CleartoClose_ID
</CFQUERY>

<CFSET cleartoclose = #check_ctc.recordcount# * 7>

<CFQUERY datasource="#request.dsn#" NAME="check_ctc_count">
	SELECT     COUNT(CleartoClose_ID) AS CTCCount
	FROM         dbo.tblUser_Roles
	WHERE     (cleartoclose_Start_Datetime IS NOT NULL) AND (cleartoclose_end_Datetime IS NULL)and cancelled is null
	HAVING      (COUNT(cleartoclose_ID) IS NOT NULL)
</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="check_abstractor">
SELECT     	 abstract_ID
FROM         tblUser_Roles
WHERE        (abstract_ID IS NOT NULL) AND (abstract_Start_Datetime IS NOT NULL) AND (abstract_Finish_Datetime IS NULL)
			 
GROUP BY abstract_ID
</CFQUERY>

<CFSET abstract = #check_abstractor.recordcount# * 10>

<CFQUERY datasource="#request.dsn#" NAME="check_abstractor_count">
SELECT     COUNT(abstract_ID) AS AbstractCount
FROM         dbo.tblUser_Roles
WHERE     (abstract_Start_Datetime IS NOT NULL) AND (abstract_Finish_Datetime IS NULL) and cancelled is null
HAVING      (COUNT(abstract_ID) IS NOT NULL)
</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="check_inhouse_abstractor">
SELECT     vendor_mgmt_InHouse_ID
FROM       tblUser_Roles
WHERE      (vendor_mgmt_InHouse_ID IS NOT NULL) AND (vendor_mgmt_InHouse_Start_Datetime IS NOT NULL) AND 
           (vendor_mgmt_InHouse_Finish_Datetime IS NULL)
GROUP BY vendor_mgmt_InHouse_ID
</CFQUERY>

<CFSET inhouse = #check_inhouse_abstractor.recordcount# * 10>

<CFQUERY datasource="#request.dsn#" NAME="check_inhouse_abstractor_Count">
	SELECT     COUNT(vendor_mgmt_InHouse_ID) AS InHouseCount
	FROM         dbo.tblUser_Roles
	WHERE     (Cancelled IS NULL) AND (vendor_mgmt_InHouse_Start_Datetime IS NOT NULL) AND (vendor_mgmt_InHouse_Finish_Datetime IS NULL)
	HAVING      (COUNT(vendor_mgmt_InHouse_ID) IS NOT NULL)
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="check_typing">
	SELECT     Typing_ID
	FROM       tblUser_Roles
	WHERE      (Typing_ID IS NOT NULL) AND (Typing_End_Datetime IS NOT NULL) AND 
           (Typing_End_Datetime IS NULL)
	GROUP BY Typing_ID
</CFQUERY>

<CFSET typing = #check_typing.recordcount# * 5>

<CFQUERY datasource="#request.dsn#" NAME="check_Typing_Count">
	SELECT     COUNT(Typing_ID) AS Typing_Count
	FROM         dbo.tblUser_Roles
	WHERE     (Cancelled IS NULL) AND (Typing_Start_Datetime IS NOT NULL) AND (Typing_End_Datetime IS NULL)
	HAVING      (COUNT(Typing_ID) IS NOT NULL)
</CFQUERY>

<CFIF #check_taxes_Count.TaxCount# gt #taxes#>
<CFMAIL
				TO="webmaster@firsttitleservices.com"
				FROM="webmaster@firsttitleservices.com"
				SERVER="127.0.0.1"
				Subject="Taxes/Payoffs"
				TIMEOUT="600"
				>
				The taxes/Payoffs Department has over #check_taxes_Count.TaxCount# outstanding.		
</cfmail>
</CFIF>

<CFIF #check_abstractor_count.AbstractCount# gt #abstract#>
<CFMAIL
				TO="webmaster@firsttitleservices.com"
				FROM="webmaster@firsttitleservices.com"
				SERVER="127.0.0.1"
				Subject="Abstractors"
				TIMEOUT="600"
				>
				The Abstractors have over #check_abstractor_count.AbstractCount# outstanding.		
</cfmail>
</CFIF>

<CFIF #check_inhouse_abstractor_Count.InHouseCount# gt #inhouse#>
<CFMAIL
				TO="webmaster@firsttitleservices.com"
				FROM="webmaster@firsttitleservices.com"
				SERVER="127.0.0.1"
				Subject="First Title In House Abstractors"
				TIMEOUT="600"
				>
				The In House Abstractors have over #check_abstractor_count.InHouseCount# outstanding.		
</cfmail>
</CFIF>
<!---
<CFIF #check_CTC_Count.CTCCount# gt #cleartoclose#>
<CFMAIL
				TO="jslattery@firsttitleservices.com,mhill@firsttitleservices.com,"
				FROM="webmaster@firsttitleservices.com"
				SERVER="127.0.0.1"
				Subject="Clear To Close"
				TIMEOUT="600"
				>
				The Clear To Close Department has over #check_Typing_Count.Typing_Count# outstanding.		
</cfmail>
</CFIF>
--->






