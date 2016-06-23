


<!--- make sure the user came in via HTTPS --->


		<CFQUERY datasource="#request.dsn#" NAME="read_content">
		
			SELECT *
			FROM web_site
			WHERE page_id = #page_id# 
		
		</CFQUERY>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE>First Title Services Admin</TITLE>

</HEAD>

<BODY BGCOLOR=e1e1e1 TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>



<CENTER>

<table width=500 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=500 align=center valign=top>
		
<table width=499 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
<CFOUTPUT>
				<tr>
					<td width=498 align=center valign=top bgcolor=white>
						<font size=2 color=blue face=arial>Site Management - <B>#read_content.page_title#</B>					
					</td>
				</tr>
			
<FORM METHOD=POST ACTION="./site_mgt_submit.cfm?page_id=#page_id#&uid=#URL.uid#&al=#URL.al#">
			
	<tr>
		<td width=499 align=center valign=top bgcolor=e2e2e2>

							<TEXTAREA NAME="page_cont" rows=40 cols=80
									style="font-size: 9; 
									font-family: verdana; 
									font-style: normal; 
									color: 003F1E; 
									background-color: E4E3E3; 
									border-color: white; 
									border-left-width: thin; 
									border-right-width: thin; 
									border-top-width: thin; 
									border-bottom-width: thin; 
									border-width: thin; 
									border-style: bar; 
									clear: none;" >#read_content.page_content#</textarea>
												
			
		</td>
	</tr>	

	<tr>
		<td width=499 align=center valign=top bgcolor=e2e2e2>
			
			<input type=submit value="Submit >">			
			
		</td>
	</tr>
	
</table>
		</td>
	</tr>	
</table>

	</FORM>
	
</CFOUTPUT>

</BODY>
</HTML>


