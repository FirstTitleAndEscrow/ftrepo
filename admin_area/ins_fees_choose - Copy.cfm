


		

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE>First Title Services Admin</TITLE>

</HEAD>

<BODY BGCOLOR=e1e1e1 TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>



<CENTER>

<table width=490 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=490 align=center valign=top>
		
<table width=489 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=489 align=center valign=top bgcolor=e2e2e2>
			<FONT SIZE=2 color=black face=arial>

<table width=489 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

<CFOUTPUT>
	<tr>
		<td width=489 align=left valign=top bgcolor=white>
			<font size=2 color=green face=arial><B>Manage First Title -- Insurance Fees</B>
		</td>
	</tr>

</table>

		</td>
	</tr>

	<tr>
		<td width=489 align=center valign=top bgcolor=white>
			

<table width=489 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>

	<tr>
		<td width=489 align=left valign=top bgcolor=f1f1f1>
		<font size=2 color=black face=arial>
		Use the pulldown to first select a State to view. 
		<br><font size=1 color=blue face=verdana> 
		</td>
	</tr>	
	
</table>
		
		</td>		
	</tr>


<FORM METHOD=POST ACTION="./ins_fees_view.cfm?uid=#URL.uid#&al=#URL.al#">

</CFOUTPUT>
	<tr>
		<td width=489 align=center valign=top bgcolor=white>
			

<table width=489 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>

	<tr>
		<td width=489 align=center valign=top bgcolor=f1f1f1>
			<SELECT NAME="st_abbrev" 		
				size="1" 
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e1e1e1; 
				border-color: e1e1e1; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; 
				float: none;" 
				rows="5" 
				cols="45" 
				>
	<OPTION VALUE="StateAlabamaMetro|Alabama-Metro">Alabama Metro</OPTION>	
	<OPTION VALUE="StateAlabamaState|Alabama-State">Alabama State</OPTION>
	<OPTION VALUE="StateArkansas|Arkansas">Arkansas</OPTION>
	<OPTION VALUE="StateConnecticut|Connecticut">Connecticut</OPTION>
	<OPTION VALUE="StateArizonaMIC|ArizonaMIC">Arizona-MIC</OPTION>
	<OPTION VALUE="StateArizona|Arizona">Arizona</OPTION>
	<OPTION VALUE="StateArizonaZone1|Arizona-zone1">Arizona-zone1</OPTION>
	<OPTION VALUE="StateArizonaZone2|Arizona-zone2">Arizona-zone2</OPTION>
	<OPTION VALUE="StateArizonaZone3|Arizona-zone3">Arizona-zone3</OPTION>
	<OPTION VALUE="StateArizonaZone4|Arizona-zone4">Arizona-zone4</OPTION>
	<OPTION VALUE="StateArizonaZone5|Arizona-zone5">Arizona-zone5</OPTION>
	
	<OPTION VALUE="StateArizonaStewartZone1|ArizonaStewart-zone1">ArizonaStewart-zone1</OPTION>
	<OPTION VALUE="StateArizonaStewartZone2|ArizonaStewart-zone2">ArizonaStewart-zone2</OPTION>
	<OPTION VALUE="StateArizonaStewartZone3|ArizonaStewart-zone3">ArizonaStewart-zone3</OPTION>
	<OPTION VALUE="StateArizonaStewartZone4|ArizonaStewart-zone4">ArizonaStewart-zone4</OPTION>
	<OPTION VALUE="StateArizonaStewartZone5|ArizonaStewart-zone5">ArizonaStewart-zone5</OPTION>
	
	<OPTION VALUE="StateColoradoZone1|Colorado-zone1">Colorado-zone1</OPTION>
	<OPTION VALUE="StateColoradoZone2|Colorado-zone2">Colorado-zone2</OPTION>
	<OPTION VALUE="StateColoradoZone3|Colorado-zone3">Colorado-zone3</OPTION>
	<OPTION VALUE="StateColoradoZone4|Colorado-zone4">Colorado-zone4</OPTION>
	<OPTION VALUE="StateColoradoZone5|Colorado-zone5">Colorado-zone5</OPTION>
		<OPTION VALUE="StateColoradoZone6|Colorado-zone6">Colorado-zone6</OPTION>
	<OPTION VALUE="StateColoradoZone7|Colorado-zone7">Colorado-zone7</OPTION>
	<OPTION VALUE="StateColoradoZone8|Colorado-zone8">Colorado-zone8</OPTION>
	<OPTION VALUE="StateColoradoZone9|Colorado-zone9">Colorado-zone9</OPTION>
	<OPTION VALUE="StateColoradoZone10|Colorado-zone10">Colorado-zone10</OPTION>
		<OPTION VALUE="StateColoradoZone11|Colorado-zone11">Colorado-zone11</OPTION>
	<OPTION VALUE="StateColoradoZone12|Colorado-zone12">Colorado-zone12</OPTION>
	<OPTION VALUE="StateColoradoZone13|Colorado-zone13">Colorado-zone13</OPTION>
	<OPTION VALUE="StateColoradoZone14|Colorado-zone14">Colorado-zone14</OPTION>
	<OPTION VALUE="StateColoradoZone15|Colorado-zone15">Colorado-zone15</OPTION>
	<OPTION VALUE="StateColoradoZone16|Colorado-zone16">Colorado-zone16</OPTION>
	<OPTION VALUE="StateColoradoZone17|Colorado-zone17">Colorado-zone17</OPTION>
		<OPTION VALUE="StateDelaware|Delaware">Delaware</OPTION>
	<OPTION VALUE="StateDistrictColombia|District of Colombia">District of Colombia</OPTION>
	<OPTION VALUE="StateFlorida|Florida">Florida</OPTION>
	<OPTION VALUE="StateGeorgiaMetro|Georgia-Metro">Georgia-Metro</OPTION>
	<OPTION VALUE="StateGeorgiaState|Georgia-State">Georgia-State</OPTION>
	<OPTION VALUE="StateIllinois|Illinois">Illinois</OPTION>
	<OPTION VALUE="StateIndiana|Indiana">Indiana</OPTION>
	<OPTION VALUE="StateIowa|Iowa">Iowa</OPTION>
	<OPTION VALUE="StateKansas|Kansas">Kansas</OPTION>
	<OPTION VALUE="StateKentucky|Kentucky">Kentucky</OPTION>
	<OPTION VALUE="StateLouisanna|Louisanna">Louisanna</OPTION>
	<OPTION VALUE="StateMaine|Maine">Maine</OPTION>
	<OPTION VALUE="StateMaryland|Maryland">Maryland</OPTION>
	<OPTION VALUE="StateMassachusetts|Massachusetts">Massachusetts</OPTION>
	<OPTION VALUE="StateMichiganZone1|Michigan-Zone1">Michigan-Zone1</OPTION>
	<OPTION VALUE="StateMichiganZone2|Michigan-Zone2">Michigan-Zone2</OPTION>
	<OPTION VALUE="StateMichiganZone3|Michigan-Zone3">Michigan-Zone3</OPTION>
	<OPTION VALUE="StateMinnesota|Minnesota">Minnesota</OPTION>
	<OPTION VALUE="StateMississippi|Mississippi">Mississippi</OPTION>
	<OPTION VALUE="StateMissouri|Missouri">Missouri</OPTION>
	<OPTION VALUE="StateMontana|Montana">Montana</OPTION>
	<OPTION VALUE="StateMontanaStewart|MontanaStewart">MontanaStewart</OPTION>
	<OPTION VALUE="StateNebraska|Nebraska">Nebraska</OPTION>
	<OPTION VALUE="StateNebraskaZone1|NebraskaZone1">Nebraska-Zone1</OPTION>
	<OPTION VALUE="StateNewHampshire|New Hampshire">New Hampshire</OPTION>
	<OPTION VALUE="StateNewJersey|New Jersey">New Jersey</OPTION>
	<OPTION VALUE="StateNewYorkZone1|New York Zone1">New York Zone1</OPTION>
	<OPTION VALUE="StateNewYorkZone2|New York Zone2">New York Zone2</OPTION>
		<OPTION VALUE="StateNevada|Nevada">Nevada</OPTION>
		<OPTION VALUE="StateNevadaStewart|Nevada Stewart">Nevada Stewart</OPTION>
		<OPTION VALUE="StateNorthCarolina|North Carolina">North Carolina</OPTION>
	<OPTION VALUE="StateNorthDakota|North Dakota">North Dakota</OPTION>
	<OPTION VALUE="StateOhio|Ohio">Ohio</OPTION>
    <OPTION VALUE="StateOregon|Oregon">Oregon</OPTION>
	<OPTION VALUE="StatePennsylvania|Pennsylvania">Pennsylvania</OPTION>
	<OPTION VALUE="StateRhodeIsland|Rhode Island">Rhode Island</OPTION>
	<OPTION VALUE="StateSouthCarolina|South Carolina">South Carolina</OPTION>
	<OPTION VALUE="StateTennessee|Tennessee">Tennessee</OPTION>
	<OPTION VALUE="StateTennesseeZone1|Tennessee-Zone1">Tennessee-Zone1</OPTION>
	<OPTION VALUE="StateTennesseeZone2|Tennessee-Zone2">Tennessee-Zone2</OPTION>
	<OPTION VALUE="StateTennesseeZone3|Tennessee-Zone3">Tennessee-Zone3</OPTION>
	<OPTION VALUE="StateTennesseeZone4|Tennessee-Zone4">Tennessee-Zone4</OPTION>
	
	<OPTION VALUE="StateTennesseeStewartZone1|TennesseeStewart-zone1">TennesseeStewart-zone1</OPTION>
	<OPTION VALUE="StateTennesseeStewartZone2|TennesseeStewart-zone2">TennesseeStewart-zone2</OPTION>
	<OPTION VALUE="StateTennesseeStewartZone3|TennesseeStewart-zone3">TennesseeStewart-zone3</OPTION>
	<OPTION VALUE="StateTennesseeStewartZone4|TennesseeStewart-zone4">TennesseeStewart-zone4</OPTION>
	<OPTION VALUE="StateTennesseeStewart|TennesseeStewart-All Others">TennesseeStewart-All Others</OPTION>
	
	<OPTION VALUE="StateVermont|Vermont">Vermont</OPTION>
	<OPTION VALUE="StateVirginia|Virginia">Virginia</OPTION>
	<OPTION VALUE="StateWestVirginia|West Virginia">West Virginia</OPTION>
	<OPTION VALUE="StateWisconsin|Wisconsin">Wisconsin</OPTION>
	
			</SELECT>
		</td>
		
	</tr>	


		<tr>
			<td width=489  align=right valign=top bgcolor=f1f1f1>
				<input type=submit value="select">	
				</td>		
	</tr>


</table>

		</td>
	</tr>


</table>
		
	<tr>
		<td width=489 align=center valign=top bgcolor=white>
			



	</td>
</tr>
</table>	

	</td>
</tr>
</table>

</BODY>
</HTML>

