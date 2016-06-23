<cfparam name="variables.recipient" default="First Title User">
 <cfoutput>
	<div style="width:700px; font-family:Verdana, Arial, Helvetica, sans-serif; font-size:12px; padding:5px;">
	<center><IMG SRC="https://#cgi.server_name#/auto_emails/images/header.jpg"></center>
	<br />
	<center><em>February 18, 2010</em></center>
	<br /><br />
	Dear #variables.recipient#,
	<p>
	We are pleased to announce that our system has been updated to reflect the new 2010 HUD and GFE changes!!
	So, when accessing our system today, you will notice some changes when both placing a new order and using
	our Closing Cost Calculator. In accordance with the new RESPA regulations, we have introduced
	the following new features:
	</p>

<span style="text-decoration:underline; font-weight:bold;">
			New 2010 Automated HUD-1</span> &middot; Bundled fees in the 1100 series as required:
		<br><br>

		<center><IMG SRC="https://#cgi.server_name#/auto_emails/images/11n12series.png"></center>
		<br><br>
		And a separate itemization of line 1101 fees listed on Page 4 of the new HUD for your review:
		<br><br>
		<center><IMG SRC="https://#cgi.server_name#/auto_emails/images/1101item.png"></center>
		<br><br>
		<span style="text-decoration:underline; font-weight:bold;">
				Updated Nationwide Closing Cost Calculator</span> &middot;
				As all of you know, our system has been providing our customers with
				<span style="text-decoration:underline;">EXACT Title, Closing, Recordation and Transfer charges</span>
				in order to prepare their GFE’s in the past. So, to assist you in further preparation of the new
				form GFE, we display the charges in three different formats:
			<br /><br />
			1. 	<span style="text-decoration:underline;">HUD line number in order, as displayed on the new 2010 HUD-1</span>
			<br /><br />
					<center><IMG SRC="https://#cgi.server_name#/auto_emails/images/bulleta.png"></center>
		<br /><br />
		<blockquote>
		Not only have the line numbers changed on the new HUD-1, but there is a new column titled "<span style="font-weight:bold;"><em>Itemized Roll-ups</em></span>."
		<br /><br />
			<span style="text-decoration:underline;">What does "Itemized Roll-ups" mean</span>? The new rules require that certain charges subtotal into other charges on the HUD-1 so they can be
		represented as one single fee.  The following lines will all total and carry into another line displayed as a package to
		the buyer/borrower for your disclosures:
</blockquote>
				<ul>
				<li>Title and Settlement charges in lines 1102 and 1104 will roll into 1101 with other itemized charges as displayed
				in the line 1101 itemization.</li>

				<li>Clerk Recording charges listed in line 1202 will roll into line 1201.</li>

				<li>Transfer and Mortgage stamps listed in lines 1204-1206 will roll into 1203.</li>
				</ul>
			2.	<span style="text-decoration:underline;">GFE Box number, so you can take our numbers and INPUT THEM DIRECTLY INTO YOUR GFE</span>
			<br /><br />
					<center><IMG SRC="https://#cgi.server_name#/auto_emails/images/bulletb.png"></center>
					<br /><br />
				3.  <span style="text-decoration:underline;">1101 Itemization</span> – Line 1101 has been itemized to break down the various charge
					 that are included in the new 1101 bundle displayed on the new HUD
					<br /><br />
					<center><IMG SRC="https://#cgi.server_name#/auto_emails/images/bulletc.png"></center>
<p>
With these new features, ordering and staying compliant will be fast and easy.
Please contact anyone from the First Title team, including your
 sales representative or processing team lead should you have
any questions.  On behalf of First Title, I want to thank
you for entrusting your business to us.  We look forward to being a valuable title and
closing services partner to you in the years ahead.
</p>
<br>
<span style="font-weight:bold;">
<em>Stephen J. Papermaster</em>, President <br />
First Title & Escrow Inc <br />
<cfif NOT DateDiff("d", Now(), "1/30/2012")>
30 West Gude Drive, 4th Floor <br />
Rockville, MD 20850 <br />
<cfelse>
7361 Calhoun Place, Suite 200 <br />
Rockville, MD 20855 <br />
</cfif>
Main Phone: 301-315-8180 <br />
Direct Fax: 301-315-8181<BR />
Email: <A href="mailto:spape@firsttitleservices.com">spape@firsttitleservices.com</A>
<br /><br />
</span>
<center><IMG SRC="https://#cgi.server_name#/auto_emails/images/footer.jpg"></center>
</div>
</cfoutput>