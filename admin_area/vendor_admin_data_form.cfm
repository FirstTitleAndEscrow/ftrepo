<CFPARAM NAME="a_trigger" DEFAULT="">
		<CFQUERY datasource="#request.dsn#" NAME="read_order">
		
			SELECT *
			FROM title
			WHERE title_id = '#url.rec_ID#'

		
		</CFQUERY>
		
	

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
</head>

<BODY BGCOLOR="elelel" TEXT="#000000" LINK="#ff0000" VLINK="#800000" ALINK="#ff00ff" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth="0" MarginHeight="0">

<CENTER>
<CENTER>
<table width=830 cellpadding=1 cellspacing=1 border=0 bgcolor="gray">
	<tr>
		<td width=830 align=middle valign=top>
		
<table width=830 cellpadding=1 cellspacing=1 border=0 bgcolor="white">
	
		<!---<tr> <td width=830 align=middle valign=top bgcolor="e1e1el">
			<IMG src="./images/logo_title_reports.gif">
			
		</td></tr> --->
	



	<tr>
		<td width=830 align=middle valign=top bgcolor=e1e1el>




	<CFINCLUDE TEMPLATE="./includes/title_top_navt.cfm">
	
<CFFORM METHOD=POST ACTION="./vendor_admin_data_form.cfm?uid=#url.uid#&al=#url.al#&rec_id=#url.rec_id#&a_trigger=2" name="frm" ENABLECAB="Yes">


<CFOUTPUT QUERY="read_order"> 
<table width=720 cellpadding=1 cellspacing=1 border=0 bgcolor=bfbfbf>
	<tr>
			<td width=719 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>ORDER INFO</B></CENTER></FONT>
			</td>
		</tr>

			<TR>
			<TD width=719 align=center valign=top bgcolor=blue>
				<FONT SIZE=3 color=white face=arial>
				Order Number is...<b>#read_order.title_id#</b>
				 </FONT>
			</TD>
		</TR><br><br>
		<TR>
			<TD width=719 align=center valign=top bgcolor=elelel>
				<FONT SIZE=2 color=blue face=arial>
				<b>Click in any buttons above to add new data for this order.<br><br>
				If you would like to view/modify already sent data click here <a href="./abstractor_admin_add_data_modify.cfm?uid=#url.uid#&al=#url.al#&rec_id=#rec_id#&a_trigger=1"><img src="./images/button_modify.gif" border=0 ALT="Click this button to add Raw Data for this order"></a> 
	
				 </b></FONT><br><br>
			
			</TD>
		</TR>
		
		
		</TD>
	</TR>
</TABLE>
</CFOUTPUT>
<!--- 
Click here to complete!! <NOBR><input type=image src="./images/button_submit.gif" border=0><img src="../images/clear.gif" height=10 width=40></NOBR><br><br>
	 --->				
	

</CFFORM>		
		<!--- <cfif #a_trigger# eq 2>
		<b><FONT SIZE=2 color=blue face=arial> Data Form for this order has been completed and merged to Title Insurance form </b></FONT>
		</cfif>
		 --->
		</td>
		
		</tr>

	
	
	</table>

			
			</td>
		</tr>

	</table></CENTER></CENTER>
	
</BODY>
</HTML>
	

	
	
	
	