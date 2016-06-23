




		<CFQUERY datasource="#request.dsn#" NAME="read_content">
		
			SELECT *
			FROM web_site
			WHERE page_id = #page_id# 
		
		</CFQUERY>
		
		<CFQUERY datasource="#request.dsn#">
		
			UPDATE web_site
			SET page_content = '#page_cont#'
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
					<td width=498 align=left valign=top bgcolor=white>
						<font size=2 color=blue face=arial>Site Management - <B>#read_content.page_title#</B>
						<p>
						<B>Has been updated</B></CENTER>					
					</td>
				</tr>
			
	<tr>
		<td width=499 align=center valign=top bgcolor=e2e2e2>
			
			#FORM.page_cont#			
			
		</td>
	</tr>	

	
</table>
		</td>
	</tr>	
</table>
	
</CFOUTPUT>

</BODY>
</HTML>


