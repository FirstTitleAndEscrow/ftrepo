<IE:DEVICERECT ID="<CFOUTPUT><CFIF #read_Title.pstate# eq "CA" OR #read_Title.pstate# eq "NV">page1<CFELSE>Page0</CFIF></cfoutput>" CLASS="masterstyle" MEDIA="print">
<STYLE TYPE="text/css">
P {page-break-after:always;}
TD {font:Arial, Helvetica, sans-serif;}
</style>
<!----1st page starts ----->
<!----------body table starts---------->
<!--- <table width=98% cellpadding=0 cellspacing=0 border=2 align="center" bordercolor="000000" bordercolordark="000000" bordercolorlight="000000">
<tr><td valign="top" align="center">	
====================================================================== --->
<!--- =================[ BEGIN SCHEDULE A         ]======================== --->
<!--- ====================================================================== --->
<table width="100%" cellpadding=0 cellspacing=0 border=0 >
        <tr>
		  <td colspan="2" align="center" valign="middle" bgcolor="000000" height="30"><B><font color="FFFFFF" size="4">&nbsp;</font></B></td>
	</tr>
</table>
<table width="93%" cellpadding=0 cellspacing=0 border=0 >
	<tr>
		<td width="33%"><!--- ===/ This is the Title_ID from the Title Table \=== --->
						<cfoutput><NOBR>Order Number: <B>#read_Title.Title_ID#</B></NOBR></td>
		<td align="Center">
            <NOBR>Stewart Title Guaranty Company</NOBR>
         </td> 
    <td align="right"><NOBR>Commitment Number: D-#read_Title.Title_ID# </NOBR></td></cfoutput>
	</tr>
</table>
<table width="93%" cellpadding=0 cellspacing=0 border=0 >
    <tr>
          <td>
            <BR><BR>
          </td>  
    </tr>
    <tr>      
          <td width="100%" align=left valign=top><font color="gray">


<cfif read_title.comp_id eq 3251>
<CFif read_keystone.recordcount>

</cfif>
</cfif>
          </td>  
        
    </tr>
</table>
<!--- ====================================================================== --->
<!--- =================[ END OF SCHEDULE A         ]======================== --->
<!--- ====================================================================== --->
</IE:DEVICERECT><P>