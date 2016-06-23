<cfparam name="form.n_note" default="">

<form action="#cgi.SCRIPT_NAME#" name="form" method="post">
	<select name="n_note" onchange="javascript:document.form.submit();">
		<option value=""> </OPTION>
		<option value=""> </OPTION>
		<option value="Problem Alert! See Team Lead">Problem Alert! See Team Lead</OPTION>
		<option value="Call for Detail">Call for Detail</OPTION>
		<option value="Cancelled per client" style="thin">Cancelled per client</OPTION>
		<option value="Clear to Close">Clear to Close</OPTION>
		<option value="Commitment Resent Tax Data Now Complete" style="thin">Commitment Resent Tax Data Now Complete</OPTION>
		<option value="Commitment Sent Taxes to Follow" style="thin">Commitment Sent Taxes to Follow</OPTION>
		<option value="Court House Closed">Court House Closed</OPTION>
		<option value="FT Shipped Pack" style="thin">FT Shipped Pack</OPTION>
		<option value="Funds Not Received" style="thin">Funds Not Received</OPTION>
		<option value="HUD Approval Outstanding " style="thin">HUD Approval Outstanding </OPTION>
		<option value="HUD Approval Received " style="thin">HUD Approval Received </OPTION>
		<option value="Judgments Exist">Judgments Exist</OPTION>
		<option value="Loan Closed">Loan Closed</OPTION>
		<option value="Loan Closed-Seller Rep">Loan Closed-Seller Rep</OPTION>
		<option value="Package Received" style="thin">Package Received</OPTION>
		<option value="Loan Funded">Loan Funded</OPTION>
		<option value="Mortgage Rejected">Mortgage Rejected</OPTION>
		<option value="Mortgage Rejection Satisfied">Mortgage Rejection Satisfied</OPTION>	
		<option value="Name/Address found not matching order">Name/Address found not matching order</OPTION>
		<option value="Not Clear to Close">Not Clear to Close</OPTION>
		<option value="OK to fund" style="thin">OK to fund</OPTION>
   		<option value="Order Reinstated" style="thin">Order Reinstated</OPTION>
   		<option value="Package Due/Unrec." style="thin">Package Due/Unrec.</OPTION>
   		<option value="Pre-Funding Completed" style="thin">Pre-Funding Completed</OPTION>	
   		<option value="Pre-Funding Problem" style="thin">Pre-Funding Problem</OPTION>
		<option value="Subordination Needed">Subordination Needed</OPTION>
		<option value="Subordination Received">Subordination Received</OPTION>
		<option value="Supervisor Notification" style="thin">Supervisor Notification</OPTION>
		<option value="THIS FILE WILL BE CLEARED BY " style="thin">THIS FILE WILL BE CLEARED BY </OPTION>
		<option value="Title Update needed " style="thin">Title Update needed </OPTION>
		<option value="Unreleased Mortgages Exists">Unreleased Mortgages Exists</OPTION>
		<option value="Vesting Issue">Vesting Issue</OPTION>
    	<option value="Waiting on Judgment Info">Waiting on Judgment Info</OPTION>
		<option value="Waiting on Tax Info.">Waiting on Tax Info.</OPTION>		
		<option value="Closing Invoiced">Closing Invoiced</OPTION>
		<option value="SR Closing Paid">SR Closing Paid</OPTION>
		<option value="Mortgage Recording Issue">Mortgage Recording Issue</OPTION>
		<option value="Mortgage Recording Issue RESOLVED">Mortgage Recording Issue RESOLVED</OPTION>										
		<option value="Notice of Order Status">Notice of Order Status</OPTION>
		<option value="Order Delinquency Notice">Order Delinquency Notice</OPTION>
		<option value="Loan Withdrawn">Loan Withdrawn</OPTION>
		<option value="Product Revision Request">Product Revision Request</OPTION><br>
		<option value="Document Attached by Customer">Document Attached by Customer</OPTION>
		<option value="Service Completed">Service Completed</OPTION>
		<option value="Service Cancel Confirmed">Service Cancel Confirmed</OPTION>
	</select>											
</form>



<CFQUERY datasource="#request.dsn#" NAME="read_notes">		
	SELECT DISTINCT YEAR(n_date) as [NoteYear], fname + ' ' + lname as [NoteUser], COUNT(n_note) as [NoteCount]
	FROM Title_Notes
	WHERE N_Note = '#form.n_note#'
	GROUP BY year(n_date), fname + ' ' + lname	
</CFQUERY>	

<cfquery dbtype="query" name="output">
	SELECT DISTINCT NoteUser, MAX(NoteYear) as [MaxNoteYear], SUM(NoteCount) as [SumNoteCount]
	FROM read_notes
	GROUP BY NoteUser
	ORDER BY SumNoteCount DESC
</cfquery>

<cfquery dbtype="query" name="output">
	SELECT NoteYear, SUM(NoteCount) as [SumNoteCount]
	FROM read_notes
	GROUP BY NoteYear
	ORDER BY NoteYear
</cfquery>
	
<cfdump var="#output#" expand="true" label="#form.N_Note#">