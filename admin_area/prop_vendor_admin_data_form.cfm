<CFQUERY datasource="#request.dsn#" NAME="read_order">
    SELECT *
	FROM Property
	WHERE prop_id = '#url.rec_ID#'
        </CFQUERY>
<CFIF #read_order.search_Type# eq "D"><!---Legal + Vesting--->
    <CFLOCATION URL="https://#cgi.server_name#/admin_area/prop_abstractor_admin_add_deed.cfm?uid=#url.uid#&al=#url.al#&rec_id=#url.rec_id#&a_trigger=1">
</CFIF>
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
	            <tr>
		            <td width=830 align=middle valign=top bgcolor=e1e1el>
<CFINCLUDE TEMPLATE="./includes/prop_top_navt.cfm">

<CFFORM METHOD=POST ACTION="./prop_vendor_admin_data_form.cfm?uid=#url.uid#&al=#url.al#&rec_id=#url.rec_id#&a_trigger=2" name="frm" ENABLECAB="Yes">

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
				                    Order Number is...<b>#read_order.prop_id#</b>
				                    </FONT>
			                    </TD>
		                    </TR>
                            <br><br>
		                    <TR>
			                    <TD width=719 align=center valign=top bgcolor=elelel>
				                    <FONT SIZE=2 color=blue face=arial>
				                    <b>Click in any buttons above to add new data for this order.<br><br>
				                    </b></FONT><br><br>
			                    </TD>
		                    </TR>
		                </TD>
	                </TR>
                </TABLE>
</CFOUTPUT>
</CFFORM>
               </td>
		</tr>
    </table>
    </td>
    </tr>
</table></CENTER></CENTER>

</BODY>
</HTML>





