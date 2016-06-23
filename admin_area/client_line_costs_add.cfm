

		<CFQUERY datasource="#request.dsn#" NAME="read_company">
		
			SELECT *
			FROM companies
			WHERE ID = #company_id#
		
		</CFQUERY>

	<CFQUERY datasource="#request.dsn#" NAME="read_user">
		SELECT *
		FROM First_Admin
		WHERE ID = '#URL.UID#'
</CFQUERY>
		
		
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE>First Title Services Admin</TITLE>

</HEAD>

<BODY BGCOLOR=e1e1e1 TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>


<CENTER>

<CENTER>

<table width=500 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=500 align=center valign=top>
		
<table width=499 cellpadding=1 cellspacing=1 border=0 bgcolor=white>

	<tr>
		<td width=499 align=center valign=top bgcolor=e2e2e2>
			<FONT SIZE=2 color=black face=arial>

<table width=498 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

	<tr>
		<td width=498 align=center valign=top bgcolor=white>
			<font size=2 color=blue face=arial><B>ADD Line Costs to Mortgage Client</B>
			<p>
		</td>
	</tr>
<CFOUTPUT>
	<tr>
		<td width=498 align=center valign=top bgcolor=e3e3e3>
			<font size=3 color=blue face=arial>
			Client - <B>#read_company.company#</B>
		</td>
	</tr>
</CFOUTPUT>
	<tr>
		<td width=498 align=center valign=top bgcolor=e3e3e3>

			<table width=497 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>	

	<CFFORM METHOD=POST ACTION="./client_line_costs_add_submit.cfm?uid=#URL.uid#&al=#URL.al#&company_id=#company_id#&ft_agencies=#ft_agencies#&a_st_list_2=#a_st_list_2#">

	<tr>		
		<td width=497 colspan=4 align=left valign=top bgcolor=e6e6e6>	
			<font size=1 color=blue face=verdana>
			In the fields below, enter the cost value associated with
			each of the line items.  If you need help with what text is 
			associated with each line item, mouse over the image next to 
			it and the text will appear.<br>
			<font size=1 color=red face=verdana>
			Do not enter <B>$</B> in any of the fields below.
			<p>
			<font size=2 color=blue face=arial>
	<CFOUTPUT>
	#ft_agencies#	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	#a_st_list_2#
	</CFOUTPUT>
			<p>			
		</td>
	</tr>


	<tr>		
		<td width=100 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee">
		</td>

		<td width=147 align=left valign=top bgcolor=e6e6e6>	
			<CFINPUT type=text name="a_1101" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="" size=12 maxlength=20  
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; ">	
		</td>

		
		<td width=100 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			1111. <img src="./images/info-01.gif" ALT="Data on this line is variable">
		</td>

		<td width=150 align=left valign=top bgcolor=e6e6e6>	
			<CFINPUT type=text name="a_1111" VALUE="" size=12 maxlength=20
 				REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" 
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; ">	
		
		<CFINPUT type=text name="a_1111_text" VALUE="" size=12 maxlength=20
 				
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; ">	
		
		</td>
	</tr>

	<tr>		
		<td width=100 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search">
		</td>

		<td width=147 align=left valign=top bgcolor=e6e6e6>	
			<CFINPUT type=text name="a_1102"  REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="" size=12 maxlength=20
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; ">	
		</td>

		<td width=100 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			1112. <img src="./images/info-01.gif" ALT="Data on this line is variable">
		</td>

		<td width=150 align=left valign=top bgcolor=e6e6e6>	
			<CFINPUT type=text name="a_1112" VALUE="" size=12 maxlength=20
 				REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" 
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; ">			
		<CFINPUT type=text name="a_1112_text" VALUE="" size=12 maxlength=20
 		
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; ">	
		
		
		
		
		</td>
	</tr>

	<tr>		
		<td width=100 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			1103. <img src="./images/info-01.gif" ALT="Title Examination">
		</td>

		<td width=147 align=left valign=top bgcolor=e6e6e6>	
			<CFINPUT type=text name="a_1103"  REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="" size=12 maxlength=20
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; ">	
		</td>

		<td width=100 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			1113. <img src="./images/info-01.gif" ALT="Data on this line is variable">
		</td>

		<td width=150 align=left valign=top bgcolor=e6e6e6>	
			<CFINPUT type=text name="a_1113" VALUE="" size=12 maxlength=20
 				REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields"
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; ">
		
		<CFINPUT type=text name="a_1113_text" VALUE="" size=12 maxlength=20
 				 
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; ">	
		
		
		</td>
	</tr>

	<tr>		
		<td width=100 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder">
		</td>

		<td width=147 align=left valign=top bgcolor=e6e6e6>	
			<CFINPUT type=text name="a_1104"  REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="" size=12 maxlength=20 
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; ">	
		</td>

		<td width=100 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			1205. <img src="./images/info-01.gif" ALT="Data on this line is variable">
		</td>

		<td width=150 align=left valign=top bgcolor=e6e6e6>	
			<CFINPUT type=text name="a_1205" VALUE="" size=12 maxlength=20
 				REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields"
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; ">
		
		<CFINPUT type=text name="a_1205_text" VALUE="" size=12 maxlength=20
 			
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; ">	
		
		</td>
	</tr>

	<tr>		
		<td width=100 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			1105. <img src="./images/info-01.gif" ALT="Document Preparation">
		</td>

		<td width=147 align=left valign=top bgcolor=e6e6e6>	
			<CFINPUT type=text name="a_1105" VALUE="" size=12 maxlength=20
 				REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" 
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; ">	
		</td>

		<td width=100 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			1303. <img src="./images/info-01.gif" ALT="Data on this line is variable">
		</td>

		<td width=150 align=left valign=top bgcolor=e6e6e6>	
			<CFINPUT type=text name="a_1303" VALUE="" size=12 maxlength=20
 				REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields"
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; ">
		<CFINPUT type=text name="a_1303_text" VALUE="" size=12 maxlength=20
 				
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; ">	
		
		</td>
	</tr>

	<tr>		
		<td width=100 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			1106. <img src="./images/info-01.gif" ALT="Notary Fees">
		</td>

		<td width=147 align=left valign=top bgcolor=e6e6e6>	
			<CFINPUT type=text name="a_1106" VALUE="" size=12 maxlength=20
 				REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields"
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; ">	
		</td>

		<td width=100 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			1304. <img src="./images/info-01.gif" ALT="Data on this line is variable">
		</td>

		<td width=147 align=left valign=top bgcolor=e6e6e6>	
			<CFINPUT type=text name="a_1304" VALUE="" size=12 maxlength=20
 				REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields"
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; ">
		<CFINPUT type=text name="a_1304_text" VALUE="" size=12 maxlength=20
 				
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; ">	
		
		
		
		</td>
	</tr>

	<tr>		
		<td width=100 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			1107. <img src="./images/info-01.gif" ALT="Attorney's Fees">
		</td>

		<td width=147 align=left valign=top bgcolor=e6e6e6>	
			<CFINPUT type=text name="a_1107" VALUE="" size=12 maxlength=20
 				REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields"
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; ">	
		</td>

		<td width=100 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			1305. <img src="./images/info-01.gif" ALT="Data on this line is variable">
		</td>

		<td width=150 align=left valign=top bgcolor=e6e6e6>	
			<CFINPUT type=text name="a_1305" VALUE="" size=12 maxlength=20
 				REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields"
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; ">
		<CFINPUT type=text name="a_1305_text" VALUE="" size=12 maxlength=20
 				
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; ">	
		
		</td>
	</tr>

	<tr>
		<td width=497 colspan=4 align=right valign=top bgcolor=e6e6e6>	
			<INPUT TYPE=image src="./images/button_submit.gif" border=0>
		</td>
	</tr>

	
	</CFFORM>
</table>

			
	<!--- ======================================================== --->

		</td>
	</tr>

		</td>
	</tr>
</table>
		
		</td>		

		

	</tr>
</table>


	</td>
</tr>
</table>	

	</td>
</tr>
</table>


</BODY>
</HTML>

