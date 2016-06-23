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
<CFFORM METHOD=POST ACTION="./vendor_performance_Report_result_submit.cfm?uid=#URL.uid#&al=#URL.al#&title_ID=#title_ID#&abstractor_ID=#abstractor_ID#&Abs_Doc_ID=#Abs_Doc_ID#&type=#type#">
<CFSET Vendor = #URL.vendor#>
<CFSET State = #URL.state#>
<CFSET County = #URL.county#>
<CFSET foo = #URL.foo#>
<CFSET coo = #URL.coo#>
<CFSET type = #URL.type#>


	<tr>
		<td>Please enter the amount the abstractor was paid for Order Number <cfoutput>#title_ID#</cfoutput></td>
	</tr>
	<tr>
		<td>
		<CFINPUT Type="Text" 
			Name="Paid_Amount" 
			Value="#DollarFormat(read_abs.Paid_Amount)#"
			Required="No">

		</td>
	</tr>
	<tr>
		<td>Please enter the date of payment</td>
	</tr>
	<tr>
		<td>
		<CFINPUT Type="Text" 
			Name="Paid_Date"
			Value="#DateFormat(read_abs.Paid_Date,'mm/dd/yyyy')#"
			Message = "Please enter date in the format mm/dd/yyyy"
			Required="No"
			Validate="Date"
			>

		</td>
	</tr>
	<tr>
		<td>Please enter the Invoice Number</td>
	</tr>
	<tr>
		<td>
		<CFINPUT Type="Text" 
			Name="Invoice_Num"
			Value="#read_abs.Invoice_Num#"
			Required="No"
			>

		</td>
	</tr>
	<tr>
		<td>Is this a void transaction?  No<CFInput type=Radio Name="Transaction" Value="0" Checked>
			Yes<CFInput type=Radio Name="Transaction" Value="1">
		</td>
	</tr>
	<tr>
		<td>
			<Input Type="Submit" text="Submit" value="Submit">
		</td>
		
	</tr>
	<CFOUTPUT>
	<INPUT TYPE="hidden" NAME="Vendor" VALUE="#Vendor#">
	<INPUT TYPE="hidden" NAME="State" VALUE="#State#">
	<INPUT TYPE="hidden" NAME="County" VALUE="#County#">
	<INPUT TYPE="hidden" NAME="foo" VALUE="#foo#">
	<INPUT TYPE="hidden" NAME="coo" VALUE="#coo#">
	<INPUT TYPE="hidden" NAME="type" VALUE="#type#">
	<INPUT TYPE="hidden" NAME="YearMon" VALUE="#YearMon#">
	<INPUT TYPE="hidden" NAME="YearMonto" VALUE="#YearMonto#">
	<INPUT TYPE="hidden" NAME="return_string" VALUE="#url.return_string#">
	</CFOUTPUT>
<!---<CFOUTPUT>
The Vendor is #vendor# <BR>
The State is #state# <BR>
The County is #county# <BR>
The Foo is #Foo# <BR>
The Coo is #Coo# <BR>
The Type is #type#<br>
YearMon is #YearMon# <br>
YearMonto is #YearMonto#
</CFOUTPUT>
--->
</CFFORM>	
</table>
</body>
</html>
