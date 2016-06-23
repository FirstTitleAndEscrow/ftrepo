

		

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE>First Title Services Admin</TITLE>

</HEAD>

<BODY BGCOLOR=e1e1e1 TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>
<CENTER>
<table width=552 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=500 align=center valign=top>
<table width=551 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=551 align=center valign=top bgcolor=e2e2e2>
<table width=550 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>
<CFOUTPUT>
	<tr>
		<td width=550 align=center valign=top bgcolor=white>
			<font size=2 color=green face=arial><B>Manage First Title -- Recording Fees</B>
		</td>
	</tr>
</table>
		</td>
	</tr>

	<tr>
		<td width=551 align=center valign=top bgcolor=white>
			

<table width=550 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>

	<tr>
		<td width=550 align=left valign=top bgcolor=f1f1f1>
		<font size=2 color=black face=arial>
		You can add a recording fee record to the database.
		<p>
		Be sure you do not try to add a record that already exists, as
		this will result in an error.
		</td>
	</tr>	
	
</table>
		
		</td>		
	</tr>



<FORM METHOD=POST ACTION="./rec_fees_add_submit.cfm?uid=#URL.uid#&al=#URL.al#">

</CFOUTPUT>



	<tr>
		<td width=551 align=center valign=top bgcolor=white>
			

<table width=550 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>

	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			State		
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="state" VALUE="" size=8 maxlength=2
				size="1" 
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
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			County		
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="county" VALUE="" size=35 maxlength=70
				size="1" 
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
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Mortgage Recording Fee		
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="Mort_rec_Fee" VALUE="" size=35 maxlength=20
				size="1" 
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
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Release  Fee		
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="Release_rec_fee" VALUE="" size=35 maxlength=20
				size="1" 
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
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Mortgage Stamps		
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="Mort_Stamps" VALUE="" size=35 maxlength=20
				size="1" 
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
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Stamp Difference 	
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="Stamps_diff" VALUE="" size=35 maxlength=20
				size="1" 
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
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Intangibles Tax	
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="Intangible_Tax" VALUE="" size=35 maxlength=20
				size="1" 
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
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Transfer Tax	
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="Transfer_tax" VALUE="" size=35 maxlength=20
				size="1" 
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
		<td width=550 colspan=2 align=right valign=top bgcolor=f1f1f1>
			<input type=submit value="add">	
			</td>		
	</tr>

	
</table>
		
		</td>		
	</tr>



</FORM>






</table>

	</td>
</tr>
</table>	

	</td>
</tr>
</table>

</BODY>
</HTML>

