
<cfset title_id = getTitleID()>
<cfset bankerName = "#firstname# #lastName#">
<cfset bankerEmail = email>

<!---
<cfset title_id = 99005>
<cfset bankerName = "John Doe">
<cfset bankerEmail = "ericmbrancaccio@gmail.com">
--->
 <CFQUERY DATASOURCE="#request.dsn#" NAME="read_title"> 
                 
	SELECT *
	FROM Title
	where title_id = #title_id#
</cfquery>

<cfmail 
subject="Chase Title Order with First Title & Escrow, Inc. for #read_title.bfirstname1# #read_title.blastname1#"
to="#bankerEmail#"
from="AGano@FirstTitleServices.com"
bcc="htanner@firsttitleservices.com,cricco@firsttitleservices.com"
type="html">
<img src="http://www.firsttitleservices.com/wp-content/themes/firsttitle/images/logo.png"><br><br>

Dear #bankerName#<br><br>          

We are pleased to have received the order for your customer, #read_title.bfirstname1# #read_title.blastname1#, LOAN## #read_title.loan_number#.  <br>
<br>
We will work closely with you and the assigned Chase Processor toward a clear to close Title and final closing experience.  
<br><br>
Please see below for First Title contact information to include a toll-free number which is staffed Monday – Friday from 8:30 am to 7:30 pm EST. I’ve also included the direct dial number and email address for me as I will be the Processor for this loan. If at any time I am not available when you call, another one of my team members will be able to assist you at the toll-free number. 
<br><br>
While our main means of communication will be through RealEC, you can call First Title anytime with questions and we will assist you with this loan and any other loan with First Title for Chase. I have listed Key Contacts below.
<br><br>
Below my contact information is the contact information we have for you. If any of this information needs to be updated, please let me know as I want to ensure we both have accurate contact information as we work on this file. 
<br><br>
Thank you for your time and I look forward to working with you. 
<br><br>
Sincerely,<br> 

Anita Gano<br> 
First Title & Escrow, Inc.<br> 
Direct dial number:  (301) 738-1925<br> 
Toll-free number:  1-866-484-8537 ext. 358<br> 
Email address: <a href="mailto:AGano@FirstTitleServices.com">AGano@FirstTitleServices.com</a><br><br>
<br>


<table border=1 cellpadding=2>
<tr>
<td align="left" valign="top" colspan="4"><strong>KEY CONTACTS</strong></td>
</tr>

<tr>
<td align="left" valign="top" width="150"><strong>Sales Team:</strong></td>
<td align="left" valign="top" width="150">Carrie Ricco</td>
<td align="left" valign="top" width="250">(<a href="mailto:CRicco@FirstTitleServices.com">CRicco@FirstTitleServices.com</a>)</td>
<td align="left" valign="top" width="150">248-202-1444</td>
</tr>

<tr>
<td align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">Heather Tanner</td>
<td align="left" valign="top">(<a href="mailto:HTanner@FirstTitleServices.com">HTanner@FirstTitleServices.com</a>)</td>
<td align="left" valign="top">804-338-3480</td>
</tr>

<tr>
<td align="left" valign="top"><strong>Title Dept:</strong></td>
<td align="left" valign="top">LaKeisha Wilson</td>
<td align="left" valign="top">(<a href="mailto:LWilson@FirstTitleServices.com">LWilson@FirstTitleServices.com</a>)</td>
<td align="left" valign="top">301-738-1922</td>
</tr>

<tr>
<td align="left" valign="top"><strong>Scheduling:</strong></td>
<td align="left" valign="top">Chris Hinkel</td>
<td align="left" valign="top">(<a href="mailto:CHinkel@FirstTitleServices.com">CHinkel@FirstTitleServices.com</a>)</td>
<td align="left" valign="top">301-315-8166</td>
</tr>


<tr>
<td align="left" valign="top"><strong>Operations Mgr.</strong></td>
<td align="left" valign="top">Jonathan Moore</td>
<td align="left" valign="top">(<a href="mailto:JMoore@FirstTitleServices.com">JMoore@FirstTitleServices.com</a>)</td>
<td align="left" valign="top">301-315-8173</td>
</tr>
</table>

<br>
<br>

<strong>Chase Mortgage Banker Contact information received from RealEC</strong>: <br>
<br>

Loan Contact Confirmation<BR>
Name: 
#read_title.oname# <BR>
Function: <BR>
Loan Officer <BR>
Phone: <BR>
#read_title.ophone#<BR>
Email: <BR>
#read_title.o_email# <BR>





</cfmail>