	<CFPARAM NAME="code" DEFAULT="">				
		
	<CFQUERY datasource="#request.dsn#" NAME="get_file">
			SELECT file_uploaded
			FROM ancillary_detl
			WHERE anc_id = #url.rec_id# and order_type='#URL.code#'
		</CFQUERY>
		
<cftry>
<cffile action="delete" file="#fileSys.FindFilePath('#get_file.file_uploaded#', 'file')#">
<cfcatch type="any">
</cfcatch>
</cftry>
				
		<CFQUERY name="updateinfo" datasource="#request.dsn#">
				UPDATE ancillary_detl	
					SET file_uploaded = NULL
				WHERE anc_id = #url.rec_id# and order_type='#URL.code#'
				</CFQUERY>		

	<HTML>
	<HEAD>
<TITLE></TITLE>
</HEAD>

<BODY BGCOLOR="#FFFFFF" TEXT="Black" LINK="Blue" VLINK="Blue" ALINK="Blue" BACKGROUND="./" TopMargin=0 LeftMargin=0 MarginHeight=0 MarginWidth=0>


	<CENTER>
	<table width=455 cellpadding=1 cellspacing=1 border=0>
		
		<tr>
		<td width=455 colspan=2 align=center valign=top>
	<font size=2 color=black face=verdana>
				File was deleted<p>
				<a href=javascript:window.close();>close</a>
				
</td>
		</tr>
		
		
		</tr>
		</table>
		
	      

    </td>
  </tr>
</table>
  </td>
  </tr>
</table>
</center>
</BODY>
</HTML>