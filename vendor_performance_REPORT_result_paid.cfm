<CFPARAM NAME="vendor"     DEFAULT="">
<CFPARAM NAME="state"       DEFAULT="">
<CFPARAM NAME="county"       DEFAULT="">
<CFPARAM NAME="foo"       DEFAULT="">
<CFPARAM NAME="coo"       DEFAULT="">



<CFQUERY datasource="#request.dsn#" NAME="read_abs">
				SELECT *
				FROM Doc_Abstract_Title
				WHERE title_id = #title_id# and abstractor_ID = #abstractor_ID#
				and Abs_Doc_ID = #Abs_Doc_ID#
			</cfquery>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Abstractor Paid</title>
</head>

<body>
<table>
<CFFORM METHOD=POST ACTION="./vendor_performance_Report_result_submit.cfm?uid=#URL.uid#&al=#URL.al#&title_ID=#title_ID#&abstractor_ID=#abstractor_ID#&Abs_Doc_ID=#Abs_Doc_ID#">
<CFSET Vendor = #URL.vendor#>
<CFSET State = #URL.state#>
<CFSET County = #URL.county#>
<CFSET foo = #URL.foo#>
<CFSET coo = #URL.coo#>

	<tr>
		<td>Please enter the amount the abstractor was paid</td>
	</tr>
	<tr>
		<td>
		<CFINPUT Type="Text"
			Name="Paid_Amount"
			Value="#read_abs.Paid_Amount#"
			Validate="float"
			Message = "Paid Amount must be a number."
			Required="yes">

		</td>
	</tr>
	<tr>
		<td>Please enter the date of payment</td>
	</tr>
	<tr>
		<td>
		<CFINPUT Type="Text"
			Name="Paid_Date"
			Value="#read_abs.Paid_Date#"
			Message = "Please enter date in the format mm/dd/yyyy"
			Required="yes"
			Validate="Date"
			>

		</td>
	</tr>
	<tr>
		<td>
			<Input Type="Submit" text="Submit">
		</td>
	</tr>
	<CFOUTPUT>
	<INPUT TYPE="hidden" NAME="Vendor" VALUE="#Vendor#">
	<INPUT TYPE="hidden" NAME="State" VALUE="#State#">
	<INPUT TYPE="hidden" NAME="County" VALUE="#County#">
	<INPUT TYPE="hidden" NAME="foo" VALUE="#foo#">
	<INPUT TYPE="hidden" NAME="coo" VALUE="#coo#">

	</CFOUTPUT>
</CFFORM>
</table>
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
