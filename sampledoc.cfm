<!---set date --->
<cfset todayDate=#day(now())#&" "&#MonthAsString(month(now()))#&",  "&#year(now())#>

<!---simulate a query variable--->
<cfset simulatedcontent="This could be a query result">
<!--- if a query, it could be <cfset simulatedcontent = "#queryname.fieldname#"> --->
<!---this comes next--->
<cfsetting enablecfoutputonly="yes">

<!---add variables--->
<cfset variables.todayDate="#todayDate#">
<cfset variables.fieldcontent="#simulatedcontent#">

<!---Fire it up--->
<cfheader name="content-disposition" value="inline;filename=sampledoc.fdf">
<cfcontent type="application/vnd.fdf">
<cfsetting enablecfoutputonly="no">
<cfinclude template="sampledoc.fdf">