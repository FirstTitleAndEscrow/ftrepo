<CFPARAM NAME="blastname1" DEFAULT="">
<CFPARAM NAME="bfirstname1" DEFAULT="">
<CFPARAM NAME="bminame1" DEFAULT="">
<CFPARAM NAME="bssn1" DEFAULT="">
<CFPARAM NAME="bhphone1" DEFAULT="">
<CFPARAM NAME="bwphone1" DEFAULT="">
<CFPARAM NAME="bext1" DEFAULT="">
<CFPARAM NAME="blastname2" DEFAULT="">
<CFPARAM NAME="bfirstname2" DEFAULT="">
<CFPARAM NAME="bminame2" DEFAULT="">
<CFPARAM NAME="bssn2" DEFAULT="">
<CFPARAM NAME="bhphone2" DEFAULT="">
<CFPARAM NAME="bwphone2" DEFAULT="">
<CFPARAM NAME="bext2" DEFAULT="">
<CFPARAM NAME="slastname1" DEFAULT="">
<CFPARAM NAME="sfirstname1" DEFAULT="">
<CFPARAM NAME="sminame1" DEFAULT="">
<CFPARAM NAME="sssn1" DEFAULT="">
<CFPARAM NAME="shphone1" DEFAULT="">
<CFPARAM NAME="swphone1" DEFAULT="">
<CFPARAM NAME="sext1" DEFAULT="">
<CFPARAM NAME="slastname2" DEFAULT="">
<CFPARAM NAME="sfirstname2" DEFAULT="">
<CFPARAM NAME="sminame2" DEFAULT="">
<CFPARAM NAME="sssn2" DEFAULT="">
<CFPARAM NAME="shphone2" DEFAULT="">
<CFPARAM NAME="swphone2" DEFAULT="">
<CFPARAM NAME="sext2" DEFAULT="">
<CFPARAM NAME="paddress" DEFAULT="">
<CFPARAM NAME="pcity" DEFAULT="">
<CFPARAM NAME="pstate" DEFAULT="">
<CFPARAM NAME="pzip" DEFAULT="">
<CFPARAM NAME="pcounty" DEFAULT="">
<CFPARAM NAME="plegaldesc" DEFAULT="">
<CFPARAM NAME="prop_use_type" DEFAULT="">
<CFPARAM NAME="condo_pud" DEFAULT="">
<CFPARAM NAME="a_comment" DEFAULT="">
<CFPARAM NAME="polender1" DEFAULT="">
<CFPARAM NAME="poacctno1" DEFAULT="">
<CFPARAM NAME="file_upload" DEFAULT="">
<CFPARAM NAME="pophone1" DEFAULT="">
<CFPARAM NAME="polender2" DEFAULT="">
<CFPARAM NAME="poacctno2" DEFAULT="">
<CFPARAM NAME="pophone2" DEFAULT="">
<CFPARAM NAME="SearchType" DEFAULT="">
<CFPARAM NAME="Deedtransfer" DEFAULT="">
<CFPARAM NAME="Insured" DEFAULT="">
<CFPARAM NAME="otherpro" DEFAULT="">
<CFPARAM NAME="loanamt_float" DEFAULT="0">
<CFPARAM NAME="loan_type_111" DEFAULT="">
<CFPARAM NAME="loan_program_333" DEFAULT="">
<CFPARAM NAME="Verifyemail" DEFAULT="">
<CFPARAM NAME="Verifyemail_2" DEFAULT="">
<CFPARAM NAME="Verifyemail_3" DEFAULT="">
<CFPARAM NAME="fax_no" DEFAULT="">
<CFPARAM NAME="RptbyEmail" DEFAULT="">
<CFPARAM NAME="request_icl" DEFAULT="">
<CFPARAM NAME="a_trigger" DEFAULT="0">
<CFPARAM NAME="loan_number" DEFAULT="0">
<CFPARAM NAME="appraisal_type" DEFAULT="">
<CFPARAM NAME="estimate_value" DEFAULT="">
<CFPARAM NAME="title_id" DEFAULT="1">


<script type="text/javascript">
function go(frm) {
window.location=frm;
}


</script>
<CENTER>
<table width=607 border="0" cellpadding="0" cellspacing="0" background="./images/back_02.gif">
	<tr><td width=607 align=left valign=top><IMG src="./images/logo_top_1.gif"></td></tr>
	<tr><td width=607 align=center valign=top><NOBR><!--- <a href="./zip_code_search.cfm" target="New" onClick="window.open('','New','width=550,height=550,status=0,resizable=0,scrollbars=1')"><img src="./images/nav_zip_search.gif" border=0></a> ---><a href="./site_page.cfm?page_id=1"><img border=0 src="./images/nav_serving.gif"></a><a href="./site_page.cfm?page_id=2"><img border=0 src="./images/nav_closing.gif"></a><a href="./client_login.cfm"><img border=0 src="./images/nav_cust_login.gif"></a><a href="./site_page.cfm?page_id=3"><img border=0 src="./images/nav_contact.gif"></a><a href="./email.cfm?pass=0"><img border=0 src="./images/nav_email.gif"></a></NOBR></td></tr>
	<tr><td width=607 align=right valign=top><CFOUTPUT><font size=1 color=blue face=arial><NOBR>[ #DateFormat(Now(), "ddddd")# ]&nbsp;&nbsp;&nbsp; #DateFormat(Now(), "mmmmm dd, yyyy")# - #TimeFormat(Now(), "HH:mm:ss")# (Eastern Standard Time)&nbsp;&nbsp;&nbsp;&nbsp;</NOBR></CFOUTPUT><p><br><p></td></tr>
<tr><td width=590 align=center valign=top bgcolor=d3d3d3>
				<!--- <cfif #get_user.recordcount# GT "0">
				<CFOUTPUT><FONT FACE=ARIAL SIZE=2><b>To email us click here <a href="mailto:#retrieve_user.email#">email</a>.</b></CFOUTPUT></FONT>
			</cfif> --->
			</TD>
</tr>
	<tr>
		<td width=607 align=center valign=top>
				<img src="./images/appraisal_title.gif">
				<p>

<CFFORM NAME="frm" ACTION="./order_verify_title_appraisal.cfm?comp_id=#comp_id#&loan_number=#loan_number#&title_id=#title_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&zip_id=#zip_id#&blastname1=#blastname1#&bfirstname1=#bfirstname1#&bminame1=#bminame1#&bssn1=#bssn1#&bhphone1=#bhphone1#&bwphone1=#bwphone1#&bext1=#bext1#&blastname2=#blastname2#&bfirstname2=#bfirstname2#&bminame2=#bminame2#&bssn2=#bssn2#&bhphone2=#bhphone2#&bwphone2=#bwphone2#&bext2=#bext2#&slastname1=#slastname1#&sfirstname1=#sfirstname1#&sminame1=#sminame1#&sssn1=#sssn1#&shphone1=#shphone1#&swphone1=#swphone1#&sext1=#sext1#&slastname2=#slastname2#&sfirstname2=#sfirstname2#&sminame2=#sminame2#&sssn2=#sssn2#&shphone2=#shphone2#&swphone2#swphone2#&sext2=#sext2#&paddress=#paddress#&pcity=#pcity#&pstate=#pstate#&pzip=#pzip#&pcounty=#pcounty#&plegaldesc=#plegaldesc#&prop_use_type=#prop_use_type#&condo_pud=#condo_pud#&a_comment=#a_comment#&polender1=#polender1#&poacctno1=#poacctno1#&pophone1=#pophone1#&polender2=#polender2#&poacctno2=#poacctno2#&pophone2=#pophone2#&SearchType=#SearchType#&Deedtransfer=#Deedtransfer#&Insured=#Insured#&otherpro=#otherpro#&loanamt_float=#loanamt_float#&loan_type_111=#loan_type_111#&loan_program_333=#loan_program_333#&Verifyemail=#Verifyemail#&Verifyemail_2=#Verifyemail_2#&Verifyemail_3=#Verifyemail_3#&fax_no=#fax_no#&RptbyEmail=#RptbyEmail#&request_icl=#request_icl#&title=#title#&property=#property#&appraisal=#appraisal#&other=#other#" ENCTYPE="multipart/form-data" METHOD=POST>



   <table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>PAYMENT METHOD FOR APPRAISAL</B></CENTER>
			</TD>

</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>



					<TR>
						<TD width=514 bgcolor="d3d3d3" colspan=4 align="center">


							<table width=515 cellpadding=1 cellspacing=1 border=0>
								<tr>
									<td width=514 colspan=3 align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="maroon">
										<B>Please select an Appraisal Payment method below<br><br>
<cfif #appraisal_type# eq "1004" OR #appraisal_type# eq "1073" OR #appraisal_type# eq "1025" OR #appraisal_type# eq "2055">

<FONT FACE=ARIAL SIZE=1 color="maroon"><B>Bill us</B> <img src="./images/arrow_right.gif">
<input type="radio" name="pay_by" value = "1" onClick="go('https://<cfoutput>#cgi.server_name#</cfoutput>/appraisal_form.cfm?comp_id=<cfoutput>#comp_id#</cfoutput>&estimate_value=<cfoutput>#estimate_value#</cfoutput>&appraisal_type=<cfoutput>#appraisal_type#</cfoutput>&loan_number=<cfoutput>#loan_number#</cfoutput>&title_id=<cfoutput>#title_id#</cfoutput>&user_id_1=<cfoutput>#USER_ID_1#</cfoutput>&lo_id=<cfoutput>#lo_id#</cfoutput>&zip_id=<cfoutput>#zip_id#</cfoutput>&blastname1=<cfoutput>#blastname1#</cfoutput>&bfirstname1=<cfoutput>#bfirstname1#</cfoutput>&bminame1=<cfoutput>#bminame1#</cfoutput>&bssn1=<cfoutput>#bssn1#</cfoutput>&bhphone1=<cfoutput>#bhphone1#</cfoutput>&bwphone1=<cfoutput>#bwphone1#</cfoutput>&bext1=<cfoutput>#bext1#</cfoutput>&blastname2=<cfoutput>#blastname2#</cfoutput>&bfirstname2=<cfoutput>#bfirstname2#</cfoutput>&bminame2=<cfoutput>#bminame2#</cfoutput>&bssn2=<cfoutput>#bssn2#</cfoutput>&bhphone2=<cfoutput>#bhphone2#</cfoutput>&bwphone2=<cfoutput>#bwphone2#</cfoutput>&bext2=<cfoutput>#bext2#</cfoutput>&slastname1=<cfoutput>#slastname1#</cfoutput>&sfirstname1=<cfoutput>#sfirstname1#</cfoutput>&sminame1=<cfoutput>#sminame1#</cfoutput>&sssn1=<cfoutput>#sssn1#</cfoutput>&shphone1=<cfoutput>#shphone1#</cfoutput>&swphone1=<cfoutput>#swphone1#</cfoutput>&sext1=<cfoutput>#sext1#</cfoutput>&slastname2=<cfoutput>#slastname2#</cfoutput>&sfirstname2=<cfoutput>#sfirstname2#</cfoutput>&sminame2=<cfoutput>#sminame2#</cfoutput>&sssn2=<cfoutput>#sssn2#</cfoutput>&shphone2=<cfoutput>#shphone2#</cfoutput>&swphone2=<cfoutput>#swphone2#</cfoutput>&sext2=<cfoutput>#sext2#</cfoutput>&paddress=<cfoutput>#paddress#</cfoutput>&pcity=<cfoutput>#pcity#</cfoutput>&pstate=<cfoutput>#pstate#</cfoutput>&pzip=<cfoutput>#pzip#</cfoutput>&pcounty=<cfoutput>#pcounty#</cfoutput>&plegaldesc=<cfoutput>#plegaldesc#</cfoutput>&prop_use_type=<cfoutput>#prop_use_type#</cfoutput>&condo_pud=<cfoutput>#condo_pud#</cfoutput>&a_comment=<cfoutput>#a_comment#</cfoutput>&Verifyemail=<cfoutput>#Verifyemail#</cfoutput>&Verifyemail_2=<cfoutput>#Verifyemail_2#</cfoutput>&Verifyemail_3=<cfoutput>#Verifyemail_3#</cfoutput>&fax_no=<cfoutput>#fax_no#</cfoutput>&RptbyEmail=<cfoutput>#RptbyEmail#</cfoutput>&title=<cfoutput>#title#</cfoutput>&property=<cfoutput>#property#</cfoutput>&appraisal=<cfoutput>#appraisal#</cfoutput>&other=<cfoutput>#other#</cfoutput>&pay_by=1');">&nbsp;&nbsp;&nbsp;&nbsp;
		<FONT FACE=ARIAL SIZE=1 color="maroon">
										<B>COD</B> <img src="./images/arrow_right.gif"> 								<input type="radio" name="pay_by" value = "2" onClick="go('https://<cfoutput>#cgi.server_name#</cfoutput>/appraisal_form.cfm?comp_id=<cfoutput>#comp_id#</cfoutput>&estimate_value=<cfoutput>#estimate_value#</cfoutput>&appraisal_type=<cfoutput>#appraisal_type#</cfoutput>&loan_number=<cfoutput>#loan_number#</cfoutput>&title_id=<cfoutput>#title_id#</cfoutput>&user_id_1=<cfoutput>#USER_ID_1#</cfoutput>&lo_id=<cfoutput>#lo_id#</cfoutput>&zip_id=<cfoutput>#zip_id#</cfoutput>&blastname1=<cfoutput>#blastname1#</cfoutput>&bfirstname1=<cfoutput>#bfirstname1#</cfoutput>&bminame1=<cfoutput>#bminame1#</cfoutput>&bssn1=<cfoutput>#bssn1#</cfoutput>&bhphone1=<cfoutput>#bhphone1#</cfoutput>&bwphone1=<cfoutput>#bwphone1#</cfoutput>&bext1=<cfoutput>#bext1#</cfoutput>&blastname2=<cfoutput>#blastname2#</cfoutput>&bfirstname2=<cfoutput>#bfirstname2#</cfoutput>&bminame2=<cfoutput>#bminame2#</cfoutput>&bssn2=<cfoutput>#bssn2#</cfoutput>&bhphone2=<cfoutput>#bhphone2#</cfoutput>&bwphone2=<cfoutput>#bwphone2#</cfoutput>&bext2=<cfoutput>#bext2#</cfoutput>&slastname1=<cfoutput>#slastname1#</cfoutput>&sfirstname1=<cfoutput>#sfirstname1#</cfoutput>&sminame1=<cfoutput>#sminame1#</cfoutput>&sssn1=<cfoutput>#sssn1#</cfoutput>&shphone1=<cfoutput>#shphone1#</cfoutput>&swphone1=<cfoutput>#swphone1#</cfoutput>&sext1=<cfoutput>#sext1#</cfoutput>&slastname2=<cfoutput>#slastname2#</cfoutput>&sfirstname2=<cfoutput>#sfirstname2#</cfoutput>&sminame2=<cfoutput>#sminame2#</cfoutput>&sssn2=<cfoutput>#sssn2#</cfoutput>&shphone2=<cfoutput>#shphone2#</cfoutput>&swphone2=<cfoutput>#swphone2#</cfoutput>&sext2=<cfoutput>#sext2#</cfoutput>&paddress=<cfoutput>#paddress#</cfoutput>&pcity=<cfoutput>#pcity#</cfoutput>&pstate=<cfoutput>#pstate#</cfoutput>&pzip=<cfoutput>#pzip#</cfoutput>&pcounty=<cfoutput>#pcounty#</cfoutput>&plegaldesc=<cfoutput>#plegaldesc#</cfoutput>&prop_use_type=<cfoutput>#prop_use_type#</cfoutput>&condo_pud=<cfoutput>#condo_pud#</cfoutput>&a_comment=<cfoutput>#a_comment#</cfoutput>&verifyemail=<cfoutput>#Verifyemail#</cfoutput>&Verifyemail_2=<cfoutput>#Verifyemail_2#</cfoutput>&Verifyemail_3=<cfoutput>#Verifyemail_3#</cfoutput>&fax_no=<cfoutput>#fax_no#</cfoutput>&RptbyEmail=<cfoutput>#RptbyEmail#</cfoutput>&title=<cfoutput>#title#</cfoutput>&property=<cfoutput>#property#</cfoutput>&appraisal=<cfoutput>#appraisal#</cfoutput>&other=<cfoutput>#other#</cfoutput>&pay_by=2');">&nbsp;&nbsp;&nbsp;&nbsp;
									<B>Pay by Credit Card</B> <img src="./images/arrow_right.gif">
										<input type="radio" name="pay_by" value = "3" onClick="go('https://<cfoutput>#cgi.server_name#</cfoutput>/appraisal_form.cfm?comp_id=<cfoutput>#comp_id#</cfoutput>&estimate_value=<cfoutput>#estimate_value#</cfoutput>&appraisal_type=<cfoutput>#appraisal_type#</cfoutput>&loan_number=<cfoutput>#loan_number#</cfoutput>&title_id=<cfoutput>#title_id#</cfoutput>&user_id_1=<cfoutput>#USER_ID_1#</cfoutput>&lo_id=<cfoutput>#lo_id#</cfoutput>&zip_id=<cfoutput>#zip_id#</cfoutput>&blastname1=<cfoutput>#blastname1#</cfoutput>&bfirstname1=<cfoutput>#bfirstname1#</cfoutput>&bminame1=<cfoutput>#bminame1#</cfoutput>&bssn1=<cfoutput>#bssn1#</cfoutput>&bhphone1=<cfoutput>#bhphone1#</cfoutput>&bwphone1=<cfoutput>#bwphone1#</cfoutput>&bext1=<cfoutput>#bext1#</cfoutput>&blastname2=<cfoutput>#blastname2#</cfoutput>&bfirstname2=<cfoutput>#bfirstname2#</cfoutput>&bminame2=<cfoutput>#bminame2#</cfoutput>&bssn2=<cfoutput>#bssn2#</cfoutput>&bhphone2=<cfoutput>#bhphone2#</cfoutput>&bwphone2=<cfoutput>#bwphone2#</cfoutput>&bext2=<cfoutput>#bext2#</cfoutput>&slastname1=<cfoutput>#slastname1#</cfoutput>&sfirstname1=<cfoutput>#sfirstname1#</cfoutput>&sminame1=<cfoutput>#sminame1#</cfoutput>&sssn1=<cfoutput>#sssn1#</cfoutput>&shphone1=<cfoutput>#shphone1#</cfoutput>&swphone1=<cfoutput>#swphone1#</cfoutput>&sext1=<cfoutput>#sext1#</cfoutput>&slastname2=<cfoutput>#slastname2#</cfoutput>&sfirstname2=<cfoutput>#sfirstname2#</cfoutput>&sminame2=<cfoutput>#sminame2#</cfoutput>&sssn2=<cfoutput>#sssn2#</cfoutput>&shphone2=<cfoutput>#shphone2#</cfoutput>&swphone2=<cfoutput>#swphone2#</cfoutput>&sext2=<cfoutput>#sext2#</cfoutput>&paddress=<cfoutput>#paddress#</cfoutput>&pcity=<cfoutput>#pcity#</cfoutput>&pstate=<cfoutput>#pstate#</cfoutput>&pzip=<cfoutput>#pzip#</cfoutput>&pcounty=<cfoutput>#pcounty#</cfoutput>&plegaldesc=<cfoutput>#plegaldesc#</cfoutput>&prop_use_type=<cfoutput>#prop_use_type#</cfoutput>&condo_pud=<cfoutput>#condo_pud#</cfoutput>&a_comment=<cfoutput>#a_comment#</cfoutput>&verifyemail=<cfoutput>#Verifyemail#</cfoutput>&Verifyemail_2=<cfoutput>#Verifyemail_2#</cfoutput>&Verifyemail_3=<cfoutput>#Verifyemail_3#</cfoutput>&fax_no=<cfoutput>#fax_no#</cfoutput>&RptbyEmail=<cfoutput>#RptbyEmail#</cfoutput>&title=<cfoutput>#title#</cfoutput>&property=<cfoutput>#property#</cfoutput>&appraisal=<cfoutput>#appraisal#</cfoutput>&other=<cfoutput>#other#</cfoutput>&pay_by=3');">&nbsp;&nbsp;&nbsp;&nbsp;									<B>Pay by Phone</B> <img src="./images/arrow_right.gif">
										<input type="radio" name="pay_by" value = "4" onClick="go('https://<cfoutput>#cgi.server_name#</cfoutput>/appraisal_form.cfm?comp_id=<cfoutput>#comp_id#</cfoutput>&estimate_value=<cfoutput>#estimate_value#</cfoutput>&appraisal_type=<cfoutput>#appraisal_type#</cfoutput>&loan_number=<cfoutput>#loan_number#</cfoutput>&title_id=<cfoutput>#title_id#</cfoutput>&user_id_1=<cfoutput>#USER_ID_1#</cfoutput>&lo_id=<cfoutput>#lo_id#</cfoutput>&zip_id=<cfoutput>#zip_id#</cfoutput>&blastname1=<cfoutput>#blastname1#</cfoutput>&bfirstname1=<cfoutput>#bfirstname1#</cfoutput>&bminame1=<cfoutput>#bminame1#</cfoutput>&bssn1=<cfoutput>#bssn1#</cfoutput>&bhphone1=<cfoutput>#bhphone1#</cfoutput>&bwphone1=<cfoutput>#bwphone1#</cfoutput>&bext1=<cfoutput>#bext1#</cfoutput>&blastname2=<cfoutput>#blastname2#</cfoutput>&bfirstname2=<cfoutput>#bfirstname2#</cfoutput>&bminame2=<cfoutput>#bminame2#</cfoutput>&bssn2=<cfoutput>#bssn2#</cfoutput>&bhphone2=<cfoutput>#bhphone2#</cfoutput>&bwphone2=<cfoutput>#bwphone2#</cfoutput>&bext2=<cfoutput>#bext2#</cfoutput>&slastname1=<cfoutput>#slastname1#</cfoutput>&sfirstname1=<cfoutput>#sfirstname1#</cfoutput>&sminame1=<cfoutput>#sminame1#</cfoutput>&sssn1=<cfoutput>#sssn1#</cfoutput>&shphone1=<cfoutput>#shphone1#</cfoutput>&swphone1=<cfoutput>#swphone1#</cfoutput>&sext1=<cfoutput>#sext1#</cfoutput>&slastname2=<cfoutput>#slastname2#</cfoutput>&sfirstname2=<cfoutput>#sfirstname2#</cfoutput>&sminame2=<cfoutput>#sminame2#</cfoutput>&sssn2=<cfoutput>#sssn2#</cfoutput>&shphone2=<cfoutput>#shphone2#</cfoutput>&swphone2=<cfoutput>#swphone2#</cfoutput>&sext2=<cfoutput>#sext2#</cfoutput>&paddress=<cfoutput>#paddress#</cfoutput>&pcity=<cfoutput>#pcity#</cfoutput>&pstate=<cfoutput>#pstate#</cfoutput>&pzip=<cfoutput>#pzip#</cfoutput>&pcounty=<cfoutput>#pcounty#</cfoutput>&plegaldesc=<cfoutput>#plegaldesc#</cfoutput>&prop_use_type=<cfoutput>#prop_use_type#</cfoutput>&condo_pud=<cfoutput>#condo_pud#</cfoutput>&a_comment=<cfoutput>#a_comment#</cfoutput>&verifyemail=<cfoutput>#Verifyemail#</cfoutput>&Verifyemail_2=<cfoutput>#Verifyemail_2#</cfoutput>&Verifyemail_3=<cfoutput>#Verifyemail_3#</cfoutput>&fax_no=<cfoutput>#fax_no#</cfoutput>&RptbyEmail=<cfoutput>#RptbyEmail#</cfoutput>&title=<cfoutput>#title#</cfoutput>&property=<cfoutput>#property#</cfoutput>&appraisal=<cfoutput>#appraisal#</cfoutput>&other=<cfoutput>#other#</cfoutput>&pay_by=4');">&nbsp;&nbsp;&nbsp;&nbsp;
	<cfelse>

	<FONT FACE=ARIAL SIZE=1 color="maroon"><B>Bill us</B> <img src="./images/arrow_right.gif">
<input type="radio" name="pay_by" value = "1" onClick="go('https://<cfoutput>#cgi.server_name#</cfoutput>/appraisal_form.cfm?comp_id=<cfoutput>#comp_id#</cfoutput>&estimate_value=<cfoutput>#estimate_value#</cfoutput>&appraisal_type=<cfoutput>#appraisal_type#</cfoutput>&loan_number=<cfoutput>#loan_number#</cfoutput>&title_id=<cfoutput>#title_id#</cfoutput>&user_id_1=<cfoutput>#USER_ID_1#</cfoutput>&lo_id=<cfoutput>#lo_id#</cfoutput>&zip_id=<cfoutput>#zip_id#</cfoutput>&blastname1=<cfoutput>#blastname1#</cfoutput>&bfirstname1=<cfoutput>#bfirstname1#</cfoutput>&bminame1=<cfoutput>#bminame1#</cfoutput>&bssn1=<cfoutput>#bssn1#</cfoutput>&bhphone1=<cfoutput>#bhphone1#</cfoutput>&bwphone1=<cfoutput>#bwphone1#</cfoutput>&bext1=<cfoutput>#bext1#</cfoutput>&blastname2=<cfoutput>#blastname2#</cfoutput>&bfirstname2=<cfoutput>#bfirstname2#</cfoutput>&bminame2=<cfoutput>#bminame2#</cfoutput>&bssn2=<cfoutput>#bssn2#</cfoutput>&bhphone2=<cfoutput>#bhphone2#</cfoutput>&bwphone2=<cfoutput>#bwphone2#</cfoutput>&bext2=<cfoutput>#bext2#</cfoutput>&slastname1=<cfoutput>#slastname1#</cfoutput>&sfirstname1=<cfoutput>#sfirstname1#</cfoutput>&sminame1=<cfoutput>#sminame1#</cfoutput>&sssn1=<cfoutput>#sssn1#</cfoutput>&shphone1=<cfoutput>#shphone1#</cfoutput>&swphone1=<cfoutput>#swphone1#</cfoutput>&sext1=<cfoutput>#sext1#</cfoutput>&slastname2=<cfoutput>#slastname2#</cfoutput>&sfirstname2=<cfoutput>#sfirstname2#</cfoutput>&sminame2=<cfoutput>#sminame2#</cfoutput>&sssn2=<cfoutput>#sssn2#</cfoutput>&shphone2=<cfoutput>#shphone2#</cfoutput>&swphone2=<cfoutput>#swphone2#</cfoutput>&sext2=<cfoutput>#sext2#</cfoutput>&paddress=<cfoutput>#paddress#</cfoutput>&pcity=<cfoutput>#pcity#</cfoutput>&pstate=<cfoutput>#pstate#</cfoutput>&pzip=<cfoutput>#pzip#</cfoutput>&pcounty=<cfoutput>#pcounty#</cfoutput>&plegaldesc=<cfoutput>#plegaldesc#</cfoutput>&prop_use_type=<cfoutput>#prop_use_type#</cfoutput>&condo_pud=<cfoutput>#condo_pud#</cfoutput>&a_comment=<cfoutput>#a_comment#</cfoutput>&Verifyemail=<cfoutput>#Verifyemail#</cfoutput>&Verifyemail_2=<cfoutput>#Verifyemail_2#</cfoutput>&Verifyemail_3=<cfoutput>#Verifyemail_3#</cfoutput>&fax_no=<cfoutput>#fax_no#</cfoutput>&RptbyEmail=<cfoutput>#RptbyEmail#</cfoutput>&title=<cfoutput>#title#</cfoutput>&property=<cfoutput>#property#</cfoutput>&appraisal=<cfoutput>#appraisal#</cfoutput>&other=<cfoutput>#other#</cfoutput>&pay_by=1');">&nbsp;&nbsp;&nbsp;&nbsp;

									<B>Pay by Credit Card</B> <img src="./images/arrow_right.gif">
										<input type="radio" name="pay_by" value = "3" onClick="go('https://<cfoutput>#cgi.server_name#</cfoutput>/appraisal_form.cfm?comp_id=<cfoutput>#comp_id#</cfoutput>&estimate_value=<cfoutput>#estimate_value#</cfoutput>&appraisal_type=<cfoutput>#appraisal_type#</cfoutput>&loan_number=<cfoutput>#loan_number#</cfoutput>&title_id=<cfoutput>#title_id#</cfoutput>&user_id_1=<cfoutput>#USER_ID_1#</cfoutput>&lo_id=<cfoutput>#lo_id#</cfoutput>&zip_id=<cfoutput>#zip_id#</cfoutput>&blastname1=<cfoutput>#blastname1#</cfoutput>&bfirstname1=<cfoutput>#bfirstname1#</cfoutput>&bminame1=<cfoutput>#bminame1#</cfoutput>&bssn1=<cfoutput>#bssn1#</cfoutput>&bhphone1=<cfoutput>#bhphone1#</cfoutput>&bwphone1=<cfoutput>#bwphone1#</cfoutput>&bext1=<cfoutput>#bext1#</cfoutput>&blastname2=<cfoutput>#blastname2#</cfoutput>&bfirstname2=<cfoutput>#bfirstname2#</cfoutput>&bminame2=<cfoutput>#bminame2#</cfoutput>&bssn2=<cfoutput>#bssn2#</cfoutput>&bhphone2=<cfoutput>#bhphone2#</cfoutput>&bwphone2=<cfoutput>#bwphone2#</cfoutput>&bext2=<cfoutput>#bext2#</cfoutput>&slastname1=<cfoutput>#slastname1#</cfoutput>&sfirstname1=<cfoutput>#sfirstname1#</cfoutput>&sminame1=<cfoutput>#sminame1#</cfoutput>&sssn1=<cfoutput>#sssn1#</cfoutput>&shphone1=<cfoutput>#shphone1#</cfoutput>&swphone1=<cfoutput>#swphone1#</cfoutput>&sext1=<cfoutput>#sext1#</cfoutput>&slastname2=<cfoutput>#slastname2#</cfoutput>&sfirstname2=<cfoutput>#sfirstname2#</cfoutput>&sminame2=<cfoutput>#sminame2#</cfoutput>&sssn2=<cfoutput>#sssn2#</cfoutput>&shphone2=<cfoutput>#shphone2#</cfoutput>&swphone2=<cfoutput>#swphone2#</cfoutput>&sext2=<cfoutput>#sext2#</cfoutput>&paddress=<cfoutput>#paddress#</cfoutput>&pcity=<cfoutput>#pcity#</cfoutput>&pstate=<cfoutput>#pstate#</cfoutput>&pzip=<cfoutput>#pzip#</cfoutput>&pcounty=<cfoutput>#pcounty#</cfoutput>&plegaldesc=<cfoutput>#plegaldesc#</cfoutput>&prop_use_type=<cfoutput>#prop_use_type#</cfoutput>&condo_pud=<cfoutput>#condo_pud#</cfoutput>&a_comment=<cfoutput>#a_comment#</cfoutput>&verifyemail=<cfoutput>#Verifyemail#</cfoutput>&Verifyemail_2=<cfoutput>#Verifyemail_2#</cfoutput>&Verifyemail_3=<cfoutput>#Verifyemail_3#</cfoutput>&fax_no=<cfoutput>#fax_no#</cfoutput>&RptbyEmail=<cfoutput>#RptbyEmail#</cfoutput>&title=<cfoutput>#title#</cfoutput>&property=<cfoutput>#property#</cfoutput>&appraisal=<cfoutput>#appraisal#</cfoutput>&other=<cfoutput>#other#</cfoutput>&pay_by=3');">&nbsp;&nbsp;&nbsp;&nbsp;									<B>Pay by Phone</B> <img src="./images/arrow_right.gif">
										<input type="radio" name="pay_by" value = "4" onClick="go('https://<cfoutput>#cgi.server_name#</cfoutput>/appraisal_form.cfm?comp_id=<cfoutput>#comp_id#</cfoutput>&estimate_value=<cfoutput>#estimate_value#</cfoutput>&appraisal_type=<cfoutput>#appraisal_type#</cfoutput>&loan_number=<cfoutput>#loan_number#</cfoutput>&title_id=<cfoutput>#title_id#</cfoutput>&user_id_1=<cfoutput>#USER_ID_1#</cfoutput>&lo_id=<cfoutput>#lo_id#</cfoutput>&zip_id=<cfoutput>#zip_id#</cfoutput>&blastname1=<cfoutput>#blastname1#</cfoutput>&bfirstname1=<cfoutput>#bfirstname1#</cfoutput>&bminame1=<cfoutput>#bminame1#</cfoutput>&bssn1=<cfoutput>#bssn1#</cfoutput>&bhphone1=<cfoutput>#bhphone1#</cfoutput>&bwphone1=<cfoutput>#bwphone1#</cfoutput>&bext1=<cfoutput>#bext1#</cfoutput>&blastname2=<cfoutput>#blastname2#</cfoutput>&bfirstname2=<cfoutput>#bfirstname2#</cfoutput>&bminame2=<cfoutput>#bminame2#</cfoutput>&bssn2=<cfoutput>#bssn2#</cfoutput>&bhphone2=<cfoutput>#bhphone2#</cfoutput>&bwphone2=<cfoutput>#bwphone2#</cfoutput>&bext2=<cfoutput>#bext2#</cfoutput>&slastname1=<cfoutput>#slastname1#</cfoutput>&sfirstname1=<cfoutput>#sfirstname1#</cfoutput>&sminame1=<cfoutput>#sminame1#</cfoutput>&sssn1=<cfoutput>#sssn1#</cfoutput>&shphone1=<cfoutput>#shphone1#</cfoutput>&swphone1=<cfoutput>#swphone1#</cfoutput>&sext1=<cfoutput>#sext1#</cfoutput>&slastname2=<cfoutput>#slastname2#</cfoutput>&sfirstname2=<cfoutput>#sfirstname2#</cfoutput>&sminame2=<cfoutput>#sminame2#</cfoutput>&sssn2=<cfoutput>#sssn2#</cfoutput>&shphone2=<cfoutput>#shphone2#</cfoutput>&swphone2=<cfoutput>#swphone2#</cfoutput>&sext2=<cfoutput>#sext2#</cfoutput>&paddress=<cfoutput>#paddress#</cfoutput>&pcity=<cfoutput>#pcity#</cfoutput>&pstate=<cfoutput>#pstate#</cfoutput>&pzip=<cfoutput>#pzip#</cfoutput>&pcounty=<cfoutput>#pcounty#</cfoutput>&plegaldesc=<cfoutput>#plegaldesc#</cfoutput>&prop_use_type=<cfoutput>#prop_use_type#</cfoutput>&condo_pud=<cfoutput>#condo_pud#</cfoutput>&a_comment=<cfoutput>#a_comment#</cfoutput>&verifyemail=<cfoutput>#Verifyemail#</cfoutput>&Verifyemail_2=<cfoutput>#Verifyemail_2#</cfoutput>&Verifyemail_3=<cfoutput>#Verifyemail_3#</cfoutput>&fax_no=<cfoutput>#fax_no#</cfoutput>&RptbyEmail=<cfoutput>#RptbyEmail#</cfoutput>&title=<cfoutput>#title#</cfoutput>&property=<cfoutput>#property#</cfoutput>&appraisal=<cfoutput>#appraisal#</cfoutput>&other=<cfoutput>#other#</cfoutput>&pay_by=4');">&nbsp;&nbsp;&nbsp;&nbsp;

	</cfif>
									</td>
								</tr>



							</table>
						</TD>
					</TR>
				</table>
		</TD>
	</TR>
</TABLE>
<p>



		<tr><td width=607 align=left valign=bottom><IMG src="./images/bottom.gif"></td></tr></table>

</CFFORM>
</CENTER>