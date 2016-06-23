<CFQUERY datasource="#request.dsn#" NAME="read_REPORT">

			SELECT *
			FROM prop_ins_add
			where prop_id = #rec_id# and type = 'DATA' and seq_num = #seq_num#
		</CFQUERY>




<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>


<TITLE>First Title Abstractor Services</TITLE>

</HEAD>

<BODY BGCOLOR=e1e1e1 TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>

<CENTER>

<table width=798 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=798 align=center valign=top>
	<CENTER>
<table width=798 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>


	<tr>
		<td width=798 align=center valign=top bgcolor=e2e2e2>
			<FONT SIZE=2 color=black face=arial>
	<CFINCLUDE TEMPLATE="./includes/prop_top_nav.cfm">
<CENTER>
<table width=798 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>


<CFOUTPUT>
	<tr>
		<td width=798 align=center valign=top bgcolor=d3d3d3>
			<font size=2 color=green face=arial><b>Add Data receipt</b><font size=2 color=black face=arial>
			<p>
			<!--- Company - <B>#read_companies.company#</B> --->
			<p>
			 Abstractor has entered the data info shown below for order number <font size=2 color=green face=arial><b>#url.rec_id#</b><br>.
			<!--- Click here to go back to the main page.<a href="./title_vendor_data_form.cfm?username=#url.username#&password=#url.password#&rec_id=#url.rec_id#"><img src="./images/button_return.gif" border=0 ALT="Click this button to return to main"></a>
	 --->
		</td>
	</tr>
</CFOUTPUT>

</table>

		</td>
	</tr>

	<tr>
		<td width=798 align=center valign=top bgcolor=e6e6e6>

<center>
<table width=498 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>


	<!--- <CFFORM METHOD=POST ACTION="https://#cgi.server_name#/abstractor_add_deed_submit.cfm" name="frm" ENABLECAB="Yes"> --->


	<tr>

		<td width=498 colspan=2 align=right valign=top bgcolor=e6e6e6>
			<img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/clear.gif" height=10 width=85>


		</td>
	</tr>


<cfoutput query = "read_report">

<tr>
		<td width=498 colspan=2 align=center valign=top bgcolor=gray>
			<font size=2 color=white face=arial>
			<B>Effective</B> Date:


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Effective Date


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<nobr>#DateFormat(data37, "mm/dd/yyyy")#



		</td>
	</tr>

	<tr>
		<td width=498 colspan=2 align=center valign=top bgcolor=gray>
			<font size=2 color=white face=arial>
			<B>Type of Vesting:</B>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Type of Vesting


		</td>

	<td width=237 align=left valign=top bgcolor=e6e6e6>

#data38#


		</td>
	</tr>




	<tr>
		<td width=498 colspan=2 align=center valign=top bgcolor=gray>
			<font size=2 color=white face=arial>
			<B>Deed</B> Information entered:


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Grantor 1


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#data1#


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Grantor 2


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
	#data2#


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
		Grantee 1


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		#data3#


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Grantee 2


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
	#data4#


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Type of Deed


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#data5#

		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Manner of Tile


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
						#data6#

		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>

		Document Number

		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#data7#

		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Book


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#data8#


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Page


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
	#data9#


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Instrument Date


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#DateFormat(data10, "mm/dd/yyyy")#



		</td>
	</tr>
		<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Recording Date


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#DateFormat(data11, "mm/dd/yyyy")#


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Trustee


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#data12#

		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Vesting


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#data13#


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>

		Consideration

		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#data16#

		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>

		Township

		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#data17#

		</td>
	</tr>
    <!---Harry adding infor for Legal Vesting Report --->
    <tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
		    Subdivision
		</td>
        <td width=237 align=left valign=top bgcolor=e6e6e6>
			#Legalsubdivision#
		</td>
	</tr>
    <tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
		    Legal Block/Bldg
		</td>
        <td width=237 align=left valign=top bgcolor=e6e6e6>
			#LegalBlock#
		</td>
	</tr>
        <tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
		    Legal Lot
		</td>
        <td width=237 align=left valign=top bgcolor=e6e6e6>
			#LegalLot#
		</td>
	</tr>
    <!--- --->
	<tr>
	    <td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
		    Additional Info
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#data14#
		</td>
	</tr>
<tr>
	<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#data15#


		</td>
	</tr>

		<tr>
		<td width=498 colspan=2 align=center valign=top bgcolor=gray>
			<font size=2 color=white face=arial>
			<B>Tax</B> Information entered:


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Property Type


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		#data18#


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Tax ID


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#data19#


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Parcel


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		#data20#


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Tax Exempt


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#data21#

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Exempt Amount


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
	#data22#


		</td>
	</tr>

<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Exempt Type


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		#data23#


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Land Assessments


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		#data24#


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Improvements Assessments


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
	#data25#


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Other Assessments


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		#data26#


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Total Assessed Value


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
	#data27#


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Tax Amount


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
	#data28#


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Tax Year


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
	#data29#


		</td>
	</tr>

	<tr>
	<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
	Payable to

		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
	#data35#


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Due Date


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#DateFormat(data30, "mm/dd/yyyy")#



		</td>
	</tr>
		<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Taxes Paid Through


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		#DateFormat(data36, "mm/dd/yyyy")#



		</td>
	</tr>



	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Tax Status


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
						#data31#

		</td>
	</tr>
<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Delinquent Tax Amount


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#data32#


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Delinquent Tax Year


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
	#data33#


		</td>
	</tr>
	<tr>
	<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>

		Additional Info

		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#data34#

		</td>
	</tr>


	<table width=498 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=498 colspan=2 align=center valign=top bgcolor=gray>
			<font size=2 color=white face=arial>
			<B>Legal</B> Information Entered:


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Legal


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		#notes#


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Comments


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		#comments#


		</td>
	</tr>
	</table>

</cfoutput>

	<!--- <tr>

		<td width=498 colspan=2 align=right valign=top bgcolor=e6e6e6>
			<NOBR><input type=image src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/button_add.gif" border=0><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/clear.gif" height=10 width=40></NOBR>


		</td>
	</tr>
 --->


</table>

<!--- </CFFORM> --->
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


