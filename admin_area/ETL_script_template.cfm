<cfparam name="url.step" default="0">
<cfparam name="form.step" default="#url.step#">
<cfset request.lastTimestamp = Now()>
<cfset variables.timeformat = "hh:mm:ss">
<cfset request.boolDebug = false>
<cfparam name="application.DS" default="First_Title_Main_Admin">

<cfoutput>

<cffunction name="PrintMessage">
	<cfargument name="message">
	<cfset cts = Now()>
	<div class="message">#TimeFormat(cts,variables.timeformat)# (#DateDiff('s', request.lastTimestamp, cts )# seconds) >>> #message#</div>
	<cfset request.lastTimestamp = cts>
	<cfflush>
</cffunction>

<cffunction name="PrintStatus">
		<CFQUERY DATASOURCE="#application.DS#" NAME="status1">

		</CFQUERY>
		#PrintMessage('status1 returned: #status1.recordcount# records.')#
</cffunction>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"https://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>ETL</title>
<style type="text/css">
<!--
body { margin: 0px; padding: 0px; font-family: arial,sans-serif; font-size: 8px; }
table { font-size: 8px; }
.section_title { font-size: 20px; }
.message { padding: 15px, 0px, 0px, 20px; color: ##336600; }
-->
</style>
	</head>
	<body>

	<div class="section_title">
		Pre Action Status:
	</div>
	 #PrintStatus()#
	<br />
	<div id="form">
		<span class="section_title">Action Form:</span>
		<br />
		<form name="etl" id="etl" method="post" action="#cgi.SCRIPT_NAME#">

			<cfif form.step EQ '1'>-> </cfif><input type="submit" name="step" value="1"> : Step 1
			<br />

		</form>
	</div>
	<br />
	<div class="section_title">
		Actions:
	</div>

<cfswitch expression="#form.step#">

	<cfcase value="1">
		#PrintMessage('Step[#form.step#] begins.')#
		<CFQUERY DATASOURCE="#application.DS#" NAME="get" maxrows="1000">
			SELECT
		</CFQUERY>
		#PrintMessage('get returns #get.recordcount# records.')#
		<cfif request.boolDebug><cfdump var="#get#" expand="false" label="get"></cfif>


		<cfloop query="get">

			<cfif NOT IsDefined('pass1')>
				<form name="form_thisobject" id="form_thisobject">
					Conversion completed for Object: <input name="thisobject" type="text" disabled>
				</form>
				<cfset pass1 = true>
			</cfif>
			<script type="text/javascript">document.form_thisobject.thisobject.value = '#get.ID#';</script>
			<!--- #PrintMessage('Conversion completed for Billing ID: #get_2010_incomplete_billing_IDs.billing_ID#.')# --->
			<cfflush>

		</cfloop>

		#PrintMessage('Step[#form.step#] ends.')#

		<cfif get_2010_incomplete_billing_IDs.recordcount GT 0>
			<script type="text/javascript">
		       window.location="https://www.firsttitleservices.com#cgi.SCRIPT_NAME#?step=1";
			</script>
		</cfif>

	</cfcase>


	<cfdefaultcase>
		#PrintMessage('Step[#form.step#] has no associated actions.')#
	</cfdefaultcase>

</cfswitch>
	<br />
	<div class="section_title">
		Post Action Status:
	</div>
	#PrintStatus()#
	</body>
</html>
</cfoutput>