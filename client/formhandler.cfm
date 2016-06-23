<!---
<cfif not FindNoCase("www.firsttitleservices.com",cgi.http_referer) AND FindNoCase("www.titlecompany.com",cgi.http_referer)>
	<cfabort showerror="request came from invalid domain">
</cfif>
--->
<cfset fromemail="webmaster@firsttitleservices.com">
<CFPARAM NAME="a_trigger" DEFAULT="0">
<cfinclude template="vendorHeader.cfm">
		<div class="main_area">
		<cfswitch expression="#url.mode#">
		<cfcase value="contact">
			<script>
			  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
			  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
			  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
			  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
			
			  ga('create', 'UA-31856419-1', 'auto');
			  ga('send', 'pageview');
			
			</script>
			
			<!-- Google Code for Main Contact Form Conversion Page --> <script type="text/javascript">
			/* <![CDATA[ */
			var google_conversion_id = 967705185;
			var google_conversion_language = "en";
			var google_conversion_format = "2";
			var google_conversion_color = "ffffff";
			var google_conversion_label = "Ha6xCP_b9gkQ4YS4zQM"; var google_remarketing_only = false;
			/* ]]> */
			</script>
			<script type="text/javascript"  
			src="//www.googleadservices.com/pagead/conversion.js">
			</script>
			<noscript>
			<div style="display:inline;">
			<img height="1" width="1" style="border-style:none;" alt=""  
			src="//www.googleadservices.com/pagead/conversion/967705185/?label=Ha6xCP_b9gkQ4YS4zQM&amp;guid=ON&amp;script=0"/>
			</div>
			</noscript>


			<h1>Contact Us</h1>
			Thank you! We have received your information and will be in touch with you shortly.
						
			<center>
				<a href="http://www.firsttitleservices.com/index.php/download-pdf/" target="_blank"><img src="http://www.firsttitleservices.com/wp-content/themes/firsttitle/images/dlbrochure.png"></a> | <a href="/index.php/request-a-free-consultation/"><img src="http://www.firsttitleservices.com/wp-content/themes/firsttitle/images/requestcons.png"></a>
			</center>
			<cfquery datasource="#request.dsn#" name="insform">
				insert into webforms(fname,lname,email,company,discuss,phone,sourcepage)
				values('#fname#','#lname#','#email#','#company#','#discuss#','#phone#','Contact Us Page')
			</cfquery>
			<cfmail to="ebrancaccio@firsttitleservices.com,blogs@firsttitleservices.com,mlizmi@firsttitleservices.com,jmarshall@firsttitleservices.com" from="#fromemail#" subject="Inquiry Received" type="html">
				
				
				<table cellpadding="5" cellspacing="0" border="0" style="background-color:##FFF; width:550px; height:250px; border:1px ##CCC dashed;">
						
						<tr>
							<td style="padding-left:25px; font-family:Arial, Helvetica, sans-serif; font-size:12px;" valign="top">
							
							
							<table cellpadding="5" cellspacing="0" border="0" style="font-family:Arial, Helvetica, sans-serif; font-size:12px;">
							
								<tr>
									<td><b>First Name</b></td>
									<td>#fname#</td>
								</tr>
								<tr>
									<td><b>Last Name</b></td>
									<td>#lname#</td>
								</tr>
								<tr>
									<td><b>Email</b></td>
									<td>#email#</td>
								</tr>
								<tr>
									<td><b>Phone</b></td>
									<td>#phone#</td>
								</tr>
								<tr>
									<td><b>Company Name</b></td>
									<td>#company#</td>
								</tr>
								<tr>
									<td><b>Discuss</b></td>
									<td>#discuss#</td>
								</tr>
								<tr>
									<td><b>Source</b></td>
									<td>Contact Us Page</td>
								</tr>
							</table>
							</td> 
						</tr>
						
					</table>
			
			</cfmail>
							
			</cfcase>
			<cfcase value="nmn">
			<h1>Thank You</h1>
			<p>Thank you! We have received your information and will be in touch with you shortly.</p>
			<p>Download our free whitepaper, <a href="http://www.firsttitleservices.com/FTwhitepaper.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">"How well do you know your title company?"</a></p>
	
						
			<center>
				<a href="http://www.firsttitleservices.com/index.php/download-pdf/" target="_blank"><img src="http://www.firsttitleservices.com/wp-content/themes/firsttitle/images/dlbrochure.png"></a> | <a href="/index.php/request-a-free-consultation/"><img src="http://www.firsttitleservices.com/wp-content/themes/firsttitle/images/requestcons.png"></a>
			</center>
			<cfquery datasource="#request.dsn#" name="insform">
					insert into webforms(fname,lname,email,company,phone,sourcepage)
					values('#fname#','#lname#','#email#','#company#','#phone#','Contact Us Page')
				</cfquery>
			<cfmail to="ebrancaccio@firsttitleservices.com,blogs@firsttitleservices.com,mlizmi@firsttitleservices.com,jmarshall@firsttitleservices.com" from="#fromemail#" subject="Inquiry Received" type="html">
				<table cellpadding="5" cellspacing="0" border="0" style="background-color:##FFF; width:550px; height:250px; border:1px ##CCC dashed;">
						
						<tr>
							<td style="padding-left:25px; font-family:Arial, Helvetica, sans-serif; font-size:12px;" valign="top">
							
							
							<table cellpadding="5" cellspacing="0" border="0" style="font-family:Arial, Helvetica, sans-serif; font-size:12px;">
							
								<tr>
									<td><b>First Name</b></td>
									<td>#fname#</td>
								</tr>
								<tr>
									<td><b>Last Name</b></td>
									<td>#lname#</td>
								</tr>
								<tr>
									<td><b>Email</b></td>
									<td>#email#</td>
								</tr>
								<tr>
									<td><b>Phone</b></td>
									<td>#phone#</td>
								</tr>
								<tr>
									<td><b>Company Name</b></td>
									<td>#company#</td>
								</tr>
								<tr>
									<td><b>Source</b></td>
									<td>NMN</td>
								</tr>
							</table>
							</td> 
						</tr>
						
					</table>
			
			</cfmail>
							
			</cfcase>
			<cfcase value="quickcontact">
				<h1>Contact Us</h1>
				Thank you! We have received your information and will be in touch with you shortly.
							
				<center>
					<a href="http://www.firsttitleservices.com/index.php/download-pdf/" target="_blank"><img src="http://www.firsttitleservices.com/wp-content/themes/firsttitle/images/dlbrochure.png"></a> | <a href="/index.php/request-a-free-consultation/"><img src="http://www.firsttitleservices.com/wp-content/themes/firsttitle/images/requestcons.png"></a>
				</center>
			</cfcase>
		</cfswitch>	
		
		
		
		</div>
			

<cfinclude template="vendorFooter.cfm">
