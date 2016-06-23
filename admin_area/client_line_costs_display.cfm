
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

		<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_values">

			SELECT *
			FROM company_billing_values
			WHERE billing_id = #billing_id#

		</CFQUERY>


		<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_states">

			SELECT *
			FROM company_billing_states
			WHERE billing_id = #billing_id#

		</CFQUERY>

		<CFSET a_st_list_4 = ArrayNew(1)>

		<CFSET a_count = "1">

		<CFOUTPUT QUERY="read_this_sets_billing_states">

				<CFSET a_st_list_4[a_count] = #a_states#>

				<CFSET a_count = #a_count# + "1">
		</CFOUTPUT>




		<CFQUERY datasource="#request.dsn#" NAME="read_company_billing_values">

			SELECT *
			FROM company_billing_values
			WHERE company_ID = #company_id#

		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_company_billing_states">

			SELECT *
			FROM company_billing_states
			WHERE company_ID = #company_id#

		</CFQUERY>
				<CFSET a_st_list_x = "">

					<CFOUTPUT QUERY="read_company_billing_states">
						<CFSET a_st_list_x = #a_st_list_x# & #a_states# & ",">
					</CFOUTPUT>

				<CFSET a_st_list_7 = #ListToArray(a_st_list_x, ",")#>


		<CFQUERY datasource="#request.dsn#" NAME="read_all_first_title_states">

			SELECT *
			FROM first_title_states
			ORDER BY st_abbrev ASC

		</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="read_current_agency_assoc">

			SELECT *
			FROM company_agency_assoc
			WHERE billing_id = #read_this_sets_billing_values.billing_id#

		</CFQUERY>



<CFQUERY datasource="#request.dsn#" NAME="read_agencies">

			SELECT *
			FROM Title_FT_agencies
			ORDER BY Company ASC, State ASC
		</CFQUERY>

		<CFSET a_agency_id = ArrayNew(1)>
		<CFSET a_agency_state = ArrayNew(1)>
		<CFSET a_agency_name = ArrayNew(1)>
		<CFSET a_count = "1">

		<CFOUTPUT QUERY="read_agencies">
				<CFSET a_agency_id[a_count] = #title_FT_Agency_ID#>
				<CFSET a_agency_state[a_count] = #state#>
				<CFSET a_agency_name[a_count] = #company#>
				<CFSET a_count = #a_count# + "1">
		</CFOUTPUT>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE>First Title Services Admin</TITLE>
<script type="text/javascript" language="JavaScript">
function add1101(form) {
document.frm.a_1101b.value = document.frm.a_1101.value;
document.frm.a_1101c.value = document.frm.a_1101.value;
document.frm.a_1101d.value = document.frm.a_1101.value;
}

function add1102(form) {
document.frm.a_1102b.value = document.frm.a_1102.value;
document.frm.a_1102c.value = document.frm.a_1102.value;
document.frm.a_1102d.value = document.frm.a_1102.value;
}

function add1103(form) {
document.frm.a_1103b.value = document.frm.a_1103.value;
document.frm.a_1103c.value = document.frm.a_1103.value;
document.frm.a_1103d.value = document.frm.a_1103.value;
}

function add1104(form) {
document.frm.a_1104b.value = document.frm.a_1104.value;
document.frm.a_1104c.value = document.frm.a_1104.value;
document.frm.a_1104d.value = document.frm.a_1104.value;
}

	function add1105(form) {
document.frm.a_1105b.value = document.frm.a_1105.value;
document.frm.a_1105c.value = document.frm.a_1105.value;
document.frm.a_1105d.value = document.frm.a_1105.value;
}
	function add1106(form) {
document.frm.a_1106b.value = document.frm.a_1106.value;
document.frm.a_1106c.value = document.frm.a_1106.value;
document.frm.a_1106d.value = document.frm.a_1106.value;
}
			function add1107(form) {
document.frm.a_1107b.value = document.frm.a_1107.value;
document.frm.a_1107c.value = document.frm.a_1107.value;
document.frm.a_1107d.value = document.frm.a_1107.value;
}

		function add1111(form) {
document.frm.a_1111b.value = document.frm.a_1111.value;
document.frm.a_1111c.value = document.frm.a_1111.value;
document.frm.a_1111d.value = document.frm.a_1111.value;
}

				function add1111_text(form) {
document.frm.a_1111_textb.value = document.frm.a_1111_text.value;
document.frm.a_1111_textc.value = document.frm.a_1111_text.value;
document.frm.a_1111_textd.value = document.frm.a_1111_text.value;
}
			function add1112(form) {
document.frm.a_1112b.value = document.frm.a_1112.value;
document.frm.a_1112c.value = document.frm.a_1112.value;
document.frm.a_1112d.value = document.frm.a_1112.value;
}
			function add1112_text(form) {
document.frm.a_1112_textb.value = document.frm.a_1112_text.value;
document.frm.a_1112_textc.value = document.frm.a_1112_text.value;
document.frm.a_1112_textd.value = document.frm.a_1112_text.value;
}

					function add1113(form) {
document.frm.a_1113b.value = document.frm.a_1113.value;
document.frm.a_1113c.value = document.frm.a_1113.value;
document.frm.a_1113d.value = document.frm.a_1113.value;
}
	function add1113_text(form) {
document.frm.a_1113_textb.value = document.frm.a_1113_text.value;
document.frm.a_1113_textc.value = document.frm.a_1113_text.value;
document.frm.a_1113_textd.value = document.frm.a_1113_text.value;
}
					function add1205(form) {
document.frm.a_1205b.value = document.frm.a_1205.value;
document.frm.a_1205c.value = document.frm.a_1205.value;
document.frm.a_1205d.value = document.frm.a_1205.value;
}

							function add1205_text(form) {
document.frm.a_1205_textb.value = document.frm.a_1205_text.value;
document.frm.a_1205_textc.value = document.frm.a_1205_text.value;
document.frm.a_1205_textd.value = document.frm.a_1205_text.value;
}

							function add1303(form) {
document.frm.a_1303b.value = document.frm.a_1303.value;
document.frm.a_1303c.value = document.frm.a_1303.value;
document.frm.a_1303d.value = document.frm.a_1303.value;
}

								function add1303_text(form) {
document.frm.a_1303_textb.value = document.frm.a_1303_text.value;
document.frm.a_1303_textc.value = document.frm.a_1303_text.value;
document.frm.a_1303_textd.value = document.frm.a_1303_text.value;
}

								function add1304(form) {
document.frm.a_1304b.value = document.frm.a_1304.value;
document.frm.a_1304c.value = document.frm.a_1304.value;
document.frm.a_1304d.value = document.frm.a_1304.value;
}
									function add1304_text(form) {
document.frm.a_1304_textb.value = document.frm.a_1304_text.value;
document.frm.a_1304_textc.value = document.frm.a_1304_text.value;
document.frm.a_1304_textd.value = document.frm.a_1304_text.value;
}

										function add1305(form) {
document.frm.a_1305b.value = document.frm.a_1305.value;
document.frm.a_1305c.value = document.frm.a_1305.value;
document.frm.a_1305d.value = document.frm.a_1305.value;
}
function add1305_text(form) {
document.frm.a_1305_textb.value = document.frm.a_1305_text.value;
document.frm.a_1305_textc.value = document.frm.a_1305_text.value;
document.frm.a_1305_textd.value = document.frm.a_1305_text.value;
}
function add803(form) {
document.frm.a_803b.value = document.frm.a_803.value;
document.frm.a_803c.value = document.frm.a_803.value;
document.frm.a_803d.value = document.frm.a_803.value;
}
function add803_text(form) {
document.frm.a_803_textb.value = document.frm.a_803_text.value;
document.frm.a_803_textc.value = document.frm.a_803_text.value;
document.frm.a_803_textd.value = document.frm.a_803_text.value;
}
function add804(form) {
document.frm.a_804b.value = document.frm.a_804.value;
document.frm.a_804c.value = document.frm.a_804.value;
document.frm.a_804d.value = document.frm.a_804.value;
}
function add804_text(form) {
document.frm.a_804_textb.value = document.frm.a_804_text.value;
document.frm.a_804_textc.value = document.frm.a_804_text.value;
document.frm.a_804_textd.value = document.frm.a_804_text.value;
}
function add805(form) {
document.frm.a_805b.value = document.frm.a_805.value;
document.frm.a_805c.value = document.frm.a_805.value;
document.frm.a_805d.value = document.frm.a_805.value;
}
function add805_text(form) {
document.frm.a_805_textb.value = document.frm.a_805_text.value;
document.frm.a_805_textc.value = document.frm.a_805_text.value;
document.frm.a_805_textd.value = document.frm.a_805_text.value;
}
function add806(form) {
document.frm.a_806b.value = document.frm.a_806.value;
document.frm.a_806c.value = document.frm.a_806.value;
document.frm.a_806d.value = document.frm.a_806.value;
}
function add806_text(form) {
document.frm.a_806_textb.value = document.frm.a_806_text.value;
document.frm.a_806_textc.value = document.frm.a_806_text.value;
document.frm.a_806_textd.value = document.frm.a_806_text.value;
}
function add807(form) {
document.frm.a_807b.value = document.frm.a_807.value;
document.frm.a_807c.value = document.frm.a_807.value;
document.frm.a_807d.value = document.frm.a_807.value;
}
function add807_text(form) {
document.frm.a_807_textb.value = document.frm.a_807_text.value;
document.frm.a_807_textc.value = document.frm.a_807_text.value;
document.frm.a_807_textd.value = document.frm.a_807_text.value;
}
function add808(form) {
document.frm.a_808b.value = document.frm.a_808.value;
document.frm.a_808c.value = document.frm.a_808.value;
document.frm.a_808d.value = document.frm.a_808.value;
}
function add808_text(form) {
document.frm.a_808_textb.value = document.frm.a_808_text.value;
document.frm.a_808_textc.value = document.frm.a_808_text.value;
document.frm.a_808_textd.value = document.frm.a_808_text.value;
}
function add810(form) {
document.frm.a_810b.value = document.frm.a_810.value;
document.frm.a_810c.value = document.frm.a_810.value;
document.frm.a_810d.value = document.frm.a_810.value;
}
function add810_text(form) {
document.frm.a_810_textb.value = document.frm.a_810_text.value;
document.frm.a_810_textc.value = document.frm.a_810_text.value;
document.frm.a_810_textd.value = document.frm.a_810_text.value;
}
function add811(form) {
document.frm.a_811b.value = document.frm.a_811.value;
document.frm.a_811c.value = document.frm.a_811.value;
document.frm.a_811d.value = document.frm.a_811.value;
}
function add811_text(form) {
document.frm.a_811_textb.value = document.frm.a_811_text.value;
document.frm.a_811_textc.value = document.frm.a_811_text.value;
document.frm.a_811_textd.value = document.frm.a_811_text.value;
}
function add812(form) {
document.frm.a_812b.value = document.frm.a_812.value;
document.frm.a_812c.value = document.frm.a_812.value;
document.frm.a_812d.value = document.frm.a_812.value;
}
function add812_text(form) {
document.frm.a_812_textb.value = document.frm.a_812_text.value;
document.frm.a_812_textc.value = document.frm.a_812_text.value;
document.frm.a_812_textd.value = document.frm.a_812_text.value;
}
function add813(form) {
document.frm.a_813b.value = document.frm.a_813.value;
document.frm.a_813c.value = document.frm.a_813.value;
document.frm.a_813d.value = document.frm.a_813.value;
}
function add813_text(form) {
document.frm.a_813_textb.value = document.frm.a_813_text.value;
document.frm.a_813_textc.value = document.frm.a_813_text.value;
document.frm.a_813_textd.value = document.frm.a_813_text.value;
}
function add814(form) {
document.frm.a_814b.value = document.frm.a_814.value;
document.frm.a_814c.value = document.frm.a_814.value;
document.frm.a_814d.value = document.frm.a_814.value;
}
function add814_text(form) {
document.frm.a_814_textb.value = document.frm.a_814_text.value;
document.frm.a_814_textc.value = document.frm.a_814_text.value;
document.frm.a_814_textd.value = document.frm.a_814_text.value;
}

function add815(form) {
document.frm.a_815b.value = document.frm.a_815.value;
document.frm.a_815c.value = document.frm.a_815.value;
document.frm.a_815d.value = document.frm.a_815.value;
}
function add815_text(form) {
document.frm.a_815_textb.value = document.frm.a_815_text.value;
document.frm.a_815_textc.value = document.frm.a_815_text.value;
document.frm.a_815_textd.value = document.frm.a_815_text.value;
}
function add816(form) {
document.frm.a_816b.value = document.frm.a_816.value;
document.frm.a_816c.value = document.frm.a_816.value;
document.frm.a_816d.value = document.frm.a_816.value;
}
function add816_text(form) {
document.frm.a_816_textb.value = document.frm.a_816_text.value;
document.frm.a_816_textc.value = document.frm.a_816_text.value;
document.frm.a_816_textd.value = document.frm.a_816_text.value;
}



</script>
</HEAD>

<BODY BGCOLOR=e1e1e1 TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>


<CENTER>

<CENTER>

<table width=800 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=799 align=center valign=top>

<table width=799 cellpadding=1 cellspacing=1 border=0 bgcolor=white>

	<tr>
		<td width=799 align=center valign=top bgcolor=e2e2e2>
			<FONT SIZE=2 color=black face=arial>

<table width=798 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

	<tr>
		<td width=798 align=center valign=top bgcolor=white>
			<font size=2 color=blue face=arial><B>MODIFY Line Costs for Mortgage Client</B>
		</td>
	</tr>
<CFOUTPUT>
	<tr>
		<td width=798 align=center valign=top bgcolor=e3e3e3>
			<font size=3 color=blue face=arial>
			Client - <B>#read_company.company#</B>
		</td>
	</tr>

	<tr>
		<td width=798 align=center valign=top bgcolor=e3e3e3>

			<table width=797 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

				<tr>
					<td width=790 colspan=4 align=left valign=top bgcolor=e1e1e1>
						<A href="./client_modify_display.cfm?uid=#URL.uid#&al=#URL.al#&company_id=#company_id#"><img src="./images/button_return.gif" border=0></A>
					</td>
				</tr>
</CFOUTPUT>

	<CFFORM name="frm" ACTION="./client_line_costs_modify_submit.cfm?uid=#URL.uid#&al=#URL.al#&company_id=#company_id#&a_flag=1&a_fla=1&billing_id=#billing_id#" ENCTYPE="multipart/form-data" METHOD=POST>

	<tr>
		<td width=797 colspan=4 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=blue face=verdana>
			In the fields below, enter the cost value associated with
			each of the line items.  If you need help with what text is
			associated with each line item, mouse over the image next to
			it and the text will appear.<br>
			<font size=1 color=red face=verdana>
			Do not enter <B>$</B> in any of the fields below.
			<p>
		</td>
	</tr>
<table width=797 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>

		<table width=250 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
		<!--- <tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>	 --->
<tr>

		<td width=250 align=center valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial><b>Refinance</b></font>
		</td>
		</tr>







		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			803. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text onBlur=add803(this.form) name="a_803" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_803#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text onBlur=add803_text(this.form) name="a_803_text" VALUE="#read_this_sets_billing_values.a_803_text#" size=22 maxlength=80
 				REQUIRED="No" style="font-size: 9;
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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			804. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text onBlur=add804(this.form) name="a_804" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_804#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text onBlur=add804_text(this.form) name="a_804_text" VALUE="#read_this_sets_billing_values.a_804_text#" size=22 maxlength=80
 				REQUIRED="No" style="font-size: 9;
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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			805. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text onBlur=add805(this.form) name="a_805" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_805#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text onBlur=add805_text(this.form) name="a_805_text" VALUE="#read_this_sets_billing_values.a_805_text#" size=22 maxlength=80
 				REQUIRED="No"
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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			806. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text onBlur=add806(this.form) name="a_806" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_806#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text onBlur=add806_text(this.form) name="a_806_text" VALUE="#read_this_sets_billing_values.a_806_text#" size=22 maxlength=80
 				REQUIRED="No" style="font-size: 9;
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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			807. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text onBlur=add807(this.form) name="a_807" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_807#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text onBlur=add807_text(this.form) name="a_807_text" VALUE="#read_this_sets_billing_values.a_807_text#" size=22 maxlength=80

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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			808. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text onBlur=add808(this.form) name="a_808" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_808#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text onBlur=add808_text(this.form) name="a_808_text" VALUE="#read_this_sets_billing_values.a_808_text#" size=22 maxlength=80
 				REQUIRED="No" style="font-size: 9;
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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			810. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text onBlur=add810(this.form) name="a_810" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_810#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text onBlur=add810_text(this.form) name="a_810_text" VALUE="#read_this_sets_billing_values.a_810_text#" size=22 maxlength=80

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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			811. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text onBlur=add811(this.form) name="a_811" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_811#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text onBlur=add811_text(this.form) name="a_811_text" VALUE="#read_this_sets_billing_values.a_811_text#" size=22 maxlength=80

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



<!--- <tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			812. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text onBlur=add812(this.form) name="a_812" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_812#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text onBlur=add812_text(this.form) name="a_812_text" VALUE="#read_this_sets_billing_values.a_812_text#" size=22 maxlength=20

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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			813. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text onBlur=add813(this.form) name="a_813" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_813#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text onBlur=add813_text(this.form) name="a_813_text" VALUE="#read_this_sets_billing_values.a_813_text#" size=22 maxlength=20

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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			814. <img src="./images/info-01.gif" ALT="Processing Fee"><CFINPUT type=text onBlur=add814(this.form) name="a_814" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_814#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text onBlur=add814_text(this.form) name="a_814_text" VALUE="#read_this_sets_billing_values.a_814_text#" size=22 maxlength=20

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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			815. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text onBlur=add815(this.form) name="a_815" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_815#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text onBlur=add815_text(this.form) name="a_815_text" VALUE="#read_this_sets_billing_values.a_815_text#" size=22 maxlength=20

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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			816. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text onBlur=add816(this.form) name="a_816" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_816#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text onBlur=add816_text(this.form) name="a_816_text" VALUE="#read_this_sets_billing_values.a_816_text#" size=22 maxlength=20

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
				clear: none; ">	<br>
<br>

		</td>
	</tr> --->








	<tr>

		<td width=250 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee">
		<CFINPUT type=text onBlur=add1101(this.form) name="a_1101" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_1101#" size=12 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			1111. <!--- <img src="./images/info-01.gif" ALT="Data on this line is variable"> --->
		<CFINPUT type=text onBlur=add1111(this.form) name="a_1111" VALUE="#read_this_sets_billing_values.a_1111#" size=12 maxlength=20
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
		<CFINPUT type=text onBlur=add1111_text(this.form) name="a_1111_text" VALUE="#read_this_sets_billing_values.a_1111_text#" size=12 maxlength=80

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
		<td width=250 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search">
		<CFINPUT type=text onBlur=add1102(this.form) name="a_1102"  REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_1102#" size=12 maxlength=20
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
				<!--- </td>



		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			1112. <!--- <img src="./images/info-01.gif" ALT="Data on this line is variable"> --->
		<CFINPUT type=text onBlur=add1112(this.form) name="a_1112" VALUE="#read_this_sets_billing_values.a_1112#" size=12 maxlength=20
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
		<CFINPUT type=text onBlur=add1112_text(this.form) name="a_1112_text" VALUE="#read_this_sets_billing_values.a_1112_text#" size=12 maxlength=80

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
		<td width=250 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1103. <img src="./images/info-01.gif" ALT="Title Examination">
		<CFINPUT type=text onBlur=add1103(this.form) name="a_1103"  REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_1103#" size=12 maxlength=20
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
					<!--- </td>



		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			1113.<!---  <img src="./images/info-01.gif" ALT="Data on this line is variable"> --->
		<CFINPUT type=text onBlur=add1113(this.form) name="a_1113" VALUE="#read_this_sets_billing_values.a_1113#" size=12 maxlength=20
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
		<CFINPUT type=text onBlur=add1113_text(this.form) name="a_1113_text" VALUE="#read_this_sets_billing_values.a_1113_text#" size=12 maxlength=80

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
		<td width=250 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder">
		<CFINPUT type=text onBlur=add1104(this.form) name="a_1104"  REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_1104#" size=12 maxlength=20
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
		<!--- </td>

		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			1205.<!---  <img src="./images/info-01.gif" ALT="Data on this line is variable"> --->
		<CFINPUT type=text onBlur=add1205(this.form) name="a_1205" VALUE="#read_this_sets_billing_values.a_1205#" size=12 maxlength=20
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
		<CFINPUT type=text onBlur=add1205_text(this.form) name="a_1205_text" VALUE="#read_this_sets_billing_values.a_1205_text#" size=12 maxlength=80

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
		<td width=250 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1105. <img src="./images/info-01.gif" ALT="Document Preparation">
		<CFINPUT type=text onBlur=add1105(this.form) name="a_1105" VALUE="#read_this_sets_billing_values.a_1105#" size=12 maxlength=20
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

		<!--- </td>

		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			1303. <!--- <img src="./images/info-01.gif" ALT="Data on this line is variable"> --->
		<CFINPUT type=text onBlur=add1303(this.form) name="a_1303" VALUE="#read_this_sets_billing_values.a_1303#" size=12 maxlength=20
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
		<CFINPUT type=text onBlur=add1303_text(this.form) name="a_1303_text" VALUE="#read_this_sets_billing_values.a_1303_text#" size=12 maxlength=80

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
		<td width=250 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1106. <img src="./images/info-01.gif" ALT="Notary Fees">
		<CFINPUT type=text onBlur=add1106(this.form) name="a_1106" VALUE="#read_this_sets_billing_values.a_1106#" size=12 maxlength=20
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
		<!--- </td>

		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			1304.<!---  <img src="./images/info-01.gif" ALT="Data on this line is variable"> --->
		<CFINPUT type=text onBlur=add1304(this.form) name="a_1304" VALUE="#read_this_sets_billing_values.a_1304#" size=12 maxlength=20
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

		<CFINPUT type=text onBlur=add1304_text(this.form) name="a_1304_text" VALUE="#read_this_sets_billing_values.a_1304_text#" size=12 maxlength=80

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
		<td width=250 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1107. <img src="./images/info-01.gif" ALT="Attorney's Fees">
		<CFINPUT type=text onBlur=add1107(this.form) name="a_1107" VALUE="#read_this_sets_billing_values.a_1107#" size=12 maxlength=20
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

		<!--- </td>

		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			1305.<!---  <img src="./images/info-01.gif" ALT="Data on this line is variable"> --->
		<CFINPUT type=text onBlur=add1305(this.form) name="a_1305" VALUE="#read_this_sets_billing_values.a_1305#" size=12 maxlength=20
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

		<CFINPUT type=text onBlur=add1305_text(this.form) name="a_1305_text" VALUE="#read_this_sets_billing_values.a_1305_text#" size=12 maxlength=80

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


	</table>

	</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
	<table width=250 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
		<!--- <tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>			 --->

<tr>

		<td width=250 align=center valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial><b>Purchase</b></font>
		</td>
		</tr>


		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			803. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text name="a_803b" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_803b#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_803_textb" VALUE="#read_this_sets_billing_values.a_803_textb#" size=22 maxlength=80
 				REQUIRED="No" style="font-size: 9;
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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			804. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text name="a_804b" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_804b#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_804_textb" VALUE="#read_this_sets_billing_values.a_804_textb#" size=22 maxlength=80
 				REQUIRED="No" style="font-size: 9;
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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			805. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text name="a_805b" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_805b#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text  name="a_805_textb" VALUE="#read_this_sets_billing_values.a_805_textb#" size=22 maxlength=80
 				REQUIRED="No"
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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			806. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text name="a_806b" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_806b#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_806_textb" VALUE="#read_this_sets_billing_values.a_806_textb#" size=22 maxlength=80
 				REQUIRED="No" style="font-size: 9;
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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			807. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text name="a_807b" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_807b#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_807_textb" VALUE="#read_this_sets_billing_values.a_807_textb#" size=22 maxlength=80

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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			808. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text name="a_808b" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_808b#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_808_textb" VALUE="#read_this_sets_billing_values.a_808_textb#" size=22 maxlength=80
 				REQUIRED="No" style="font-size: 9;
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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			810. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text name="a_810b" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_810b#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_810_textb" VALUE="#read_this_sets_billing_values.a_810_textb#" size=22 maxlength=80

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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			811. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text name="a_811b" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_811b#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_811_textb" VALUE="#read_this_sets_billing_values.a_811_textb#" size=22 maxlength=80

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



<!--- <tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			812. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text name="a_812b" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_812b#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_812_textb" VALUE="#read_this_sets_billing_values.a_812_textb#" size=22 maxlength=20

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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			813. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text name="a_813b" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_813b#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_813_textb" VALUE="#read_this_sets_billing_values.a_813_textb#" size=22 maxlength=20

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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			814. <img src="./images/info-01.gif" ALT="Processing Fee"><CFINPUT type=text name="a_814b" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_814b#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_814_textb" VALUE="#read_this_sets_billing_values.a_814_textb#" size=22 maxlength=20

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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			815. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text name="a_815b" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_815b#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_815_textb" VALUE="#read_this_sets_billing_values.a_815_textb#" size=22 maxlength=20

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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			816. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text  name="a_816b" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_816b#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_816_textb" VALUE="#read_this_sets_billing_values.a_816_textb#" size=22 maxlength=20

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
				clear: none; ">	<br>
<br>

		</td>
	</tr> --->


<tr>

		<td width=250 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee">
		<CFINPUT type=text name="a_1101b" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_1101b#" size=12 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			1111. <!--- <img src="./images/info-01.gif" ALT="Data on this line is variable"> --->
		<CFINPUT type=text name="a_1111b" VALUE="#read_this_sets_billing_values.a_1111b#" size=12 maxlength=20
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
		<CFINPUT type=text name="a_1111_textb" VALUE="#read_this_sets_billing_values.a_1111_textb#" size=12 maxlength=80

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
		<td width=250 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search">
		<CFINPUT type=text name="a_1102b"  REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_1102b#" size=12 maxlength=20
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
				<!--- </td>



		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			1112. <!--- <img src="./images/info-01.gif" ALT="Data on this line is variable"> --->
		<CFINPUT type=text name="a_1112b" VALUE="#read_this_sets_billing_values.a_1112b#" size=12 maxlength=20
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
		<CFINPUT type=text name="a_1112_textb" VALUE="#read_this_sets_billing_values.a_1112_textb#" size=12 maxlength=80

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
		<td width=250 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1103. <img src="./images/info-01.gif" ALT="Title Examination">
		<CFINPUT type=text name="a_1103b"  REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_1103b#" size=12 maxlength=20
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
					<!--- </td>



		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			1113.<!---  <img src="./images/info-01.gif" ALT="Data on this line is variable"> --->
		<CFINPUT type=text name="a_1113b" VALUE="#read_this_sets_billing_values.a_1113b#" size=12 maxlength=20
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
				clear: none; "><br>
		<CFINPUT type=text name="a_1113_textb" VALUE="#read_this_sets_billing_values.a_1113_textb#" size=12 maxlength=80

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
		<td width=250 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder">
		<CFINPUT type=text name="a_1104b"  REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_1104b#" size=12 maxlength=20
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
		<!--- </td>

		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			1205.<!---  <img src="./images/info-01.gif" ALT="Data on this line is variable"> --->
		<CFINPUT type=text name="a_1205b" VALUE="#read_this_sets_billing_values.a_1205b#" size=12 maxlength=20
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
		<CFINPUT type=text name="a_1205_textb" VALUE="#read_this_sets_billing_values.a_1205_textb#" size=12 maxlength=80

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
		<td width=250 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1105. <img src="./images/info-01.gif" ALT="Document Preparation">
		<CFINPUT type=text name="a_1105b" VALUE="#read_this_sets_billing_values.a_1105b#" size=12 maxlength=20
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

		<!--- </td>

		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			1303. <!--- <img src="./images/info-01.gif" ALT="Data on this line is variable"> --->
		<CFINPUT type=text name="a_1303b" VALUE="#read_this_sets_billing_values.a_1303b#" size=12 maxlength=20
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
		<CFINPUT type=text name="a_1303_textb" VALUE="#read_this_sets_billing_values.a_1303_textb#" size=12 maxlength=80

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
		<td width=250 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1106. <img src="./images/info-01.gif" ALT="Notary Fees">
		<CFINPUT type=text name="a_1106b" VALUE="#read_this_sets_billing_values.a_1106b#" size=12 maxlength=20
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
		<!--- </td>

		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			1304.<!---  <img src="./images/info-01.gif" ALT="Data on this line is variable"> --->
		<CFINPUT type=text name="a_1304b" VALUE="#read_this_sets_billing_values.a_1304b#" size=12 maxlength=20
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

		<CFINPUT type=text name="a_1304_textb" VALUE="#read_this_sets_billing_values.a_1304_textb#" size=12 maxlength=80

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
		<td width=250 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1107. <img src="./images/info-01.gif" ALT="Attorney's Fees">
		<CFINPUT type=text name="a_1107b" VALUE="#read_this_sets_billing_values.a_1107b#" size=12 maxlength=20
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

		<!--- </td>

		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			1305.<!---  <img src="./images/info-01.gif" ALT="Data on this line is variable"> --->
		<CFINPUT type=text name="a_1305b" VALUE="#read_this_sets_billing_values.a_1305b#" size=12 maxlength=20
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

		<CFINPUT type=text name="a_1305_textb" VALUE="#read_this_sets_billing_values.a_1305_textb#" size=12 maxlength=80

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

	</table>

	</td>

		<td width=250 align=left valign=top bgcolor=e6e6e6>

		<table width=250 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
		<!--- <tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>	 --->
<tr>

		<td width=250 align=center valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial><b>Second Mortgage No Title Ins<b></font>
		</td>
		</tr>



		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			803. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text name="a_803c" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_803c#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_803_textc" VALUE="#read_this_sets_billing_values.a_803_textc#" size=22 maxlength=80
 				REQUIRED="No" style="font-size: 9;
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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			804. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text name="a_804c" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_804c#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_804_textc" VALUE="#read_this_sets_billing_values.a_804_textc#" size=22 maxlength=80
 				REQUIRED="No" style="font-size: 9;
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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			805. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text name="a_805c" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_805c#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_805_textc" VALUE="#read_this_sets_billing_values.a_805_textc#" size=22 maxlength=80
 				REQUIRED="No"
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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			806. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text name="a_806c" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_806c#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_806_textc" VALUE="#read_this_sets_billing_values.a_806_textc#" size=22 maxlength=80
 				REQUIRED="No" style="font-size: 9;
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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			807. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text name="a_807c" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_807c#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_807_textc" VALUE="#read_this_sets_billing_values.a_807_textc#" size=22 maxlength=80

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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			808. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text name="a_808c" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_808c#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_808_textc" VALUE="#read_this_sets_billing_values.a_808_textc#" size=22 maxlength=80
 				REQUIRED="No" style="font-size: 9;
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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			810. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text name="a_810c" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_810c#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_810_textc" VALUE="#read_this_sets_billing_values.a_810_textc#" size=22 maxlength=80

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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			811. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text name="a_811c" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_811c#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_811_textc" VALUE="#read_this_sets_billing_values.a_811_textc#" size=22 maxlength=80

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



<!--- <tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			812. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text name="a_812c" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_812c#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_812_textc" VALUE="#read_this_sets_billing_values.a_812_textc#" size=22 maxlength=20

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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			813. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text name="a_813c" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_813c#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_813_textc" VALUE="#read_this_sets_billing_values.a_813_textc#" size=22 maxlength=20

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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			814. <img src="./images/info-01.gif" ALT="Processing Fee"><CFINPUT type=text name="a_814c" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_814c#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_814_textc" VALUE="#read_this_sets_billing_values.a_814_textc#" size=22 maxlength=20

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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			815. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text name="a_815c" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_815c#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_815_textc" VALUE="#read_this_sets_billing_values.a_815_textc#" size=22 maxlength=20

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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			816. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text name="a_816c" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_816c#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_816_textc" VALUE="#read_this_sets_billing_values.a_816_textc#" size=22 maxlength=20

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
				clear: none; ">	<br>
<br>

		</td>
	</tr> --->


<tr>

		<td width=250 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee">
		<CFINPUT type=text name="a_1101c" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_1101c#" size=12 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			1111. <!--- <img src="./images/info-01.gif" ALT="Data on this line is variable"> --->
		<CFINPUT type=text name="a_1111c" VALUE="#read_this_sets_billing_values.a_1111c#" size=12 maxlength=20
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
		<CFINPUT type=text name="a_1111_textc" VALUE="#read_this_sets_billing_values.a_1111_textc#" size=12 maxlength=80

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
		<td width=250 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search">
		<CFINPUT type=text name="a_1102c"  REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_1102c#" size=12 maxlength=20
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
				<!--- </td>



		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			1112. <!--- <img src="./images/info-01.gif" ALT="Data on this line is variable"> --->
		<CFINPUT type=text name="a_1112c" VALUE="#read_this_sets_billing_values.a_1112c#" size=12 maxlength=20
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
		<CFINPUT type=text name="a_1112_textc" VALUE="#read_this_sets_billing_values.a_1112_textc#" size=12 maxlength=80

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
		<td width=250 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1103. <img src="./images/info-01.gif" ALT="Title Examination">
		<CFINPUT type=text name="a_1103c"  REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_1103c#" size=12 maxlength=20
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
					<!--- </td>



		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			1113.<!---  <img src="./images/info-01.gif" ALT="Data on this line is variable"> --->
		<CFINPUT type=text name="a_1113c" VALUE="#read_this_sets_billing_values.a_1113c#" size=12 maxlength=20
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
		<CFINPUT type=text name="a_1113_textc" VALUE="#read_this_sets_billing_values.a_1113_textc#" size=12 maxlength=80

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
		<td width=250 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder">
		<CFINPUT type=text name="a_1104c"  REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_1104c#" size=12 maxlength=20
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
		<!--- </td>

		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			1205.<!---  <img src="./images/info-01.gif" ALT="Data on this line is variable"> --->
		<CFINPUT type=text name="a_1205c" VALUE="#read_this_sets_billing_values.a_1205c#" size=12 maxlength=20
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
		<CFINPUT type=text name="a_1205_textc" VALUE="#read_this_sets_billing_values.a_1205_textc#" size=12 maxlength=80

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
		<td width=250 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1105. <img src="./images/info-01.gif" ALT="Document Preparation">
		<CFINPUT type=text name="a_1105c" VALUE="#read_this_sets_billing_values.a_1105c#" size=12 maxlength=20
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

		<!--- </td>

		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			1303. <!--- <img src="./images/info-01.gif" ALT="Data on this line is variable"> --->
		<CFINPUT type=text name="a_1303c" VALUE="#read_this_sets_billing_values.a_1303c#" size=12 maxlength=20
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
		<CFINPUT type=text name="a_1303_textc" VALUE="#read_this_sets_billing_values.a_1303_textc#" size=12 maxlength=80

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
		<td width=250 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1106. <img src="./images/info-01.gif" ALT="Notary Fees">
		<CFINPUT type=text name="a_1106c" VALUE="#read_this_sets_billing_values.a_1106c#" size=12 maxlength=20
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
		<!--- </td>

		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			1304.<!---  <img src="./images/info-01.gif" ALT="Data on this line is variable"> --->
		<CFINPUT type=text name="a_1304c" VALUE="#read_this_sets_billing_values.a_1304c#" size=12 maxlength=20
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

		<CFINPUT type=text name="a_1304_textc" VALUE="#read_this_sets_billing_values.a_1304_textc#" size=12 maxlength=80

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
		<td width=250 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1107. <img src="./images/info-01.gif" ALT="Attorney's Fees">
		<CFINPUT type=text name="a_1107c" VALUE="#read_this_sets_billing_values.a_1107c#" size=12 maxlength=20
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

		<!--- </td>

		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			1305.<!---  <img src="./images/info-01.gif" ALT="Data on this line is variable"> --->
		<CFINPUT type=text name="a_1305c" VALUE="#read_this_sets_billing_values.a_1305c#" size=12 maxlength=20
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

		<CFINPUT type=text name="a_1305_textc" VALUE="#read_this_sets_billing_values.a_1305_text#" size=12 maxlength=80

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

	</table>



	</td>

	</tr>
	</table>
	<!---Harry 07/01/2004--->
<!---This appears to be the end for the first row of information --->
	<table width=797 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>
		<tr>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<table width=250 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
		<!--- <tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>	 --->
<tr>

		<td width=250 align=center valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial><b>Second Mortgage With Title Ins<b></font>
		</td>
		</tr>




		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			803. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text name="a_803d" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_803d#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_803_textd" VALUE="#read_this_sets_billing_values.a_803_textd#" size=22 maxlength=80
 				REQUIRED="No" style="font-size: 9;
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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			804. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text name="a_804d" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_804d#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_804_textd" VALUE="#read_this_sets_billing_values.a_804_textd#" size=22 maxlength=80
 				REQUIRED="No" style="font-size: 9;
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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			805. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text name="a_805d" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_805d#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_805_textd" VALUE="#read_this_sets_billing_values.a_805_textd#" size=22 maxlength=80
 				REQUIRED="No"
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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			806. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text name="a_806d" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_806d#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_806_textd" VALUE="#read_this_sets_billing_values.a_806_textd#" size=22 maxlength=80
 				REQUIRED="No" style="font-size: 9;
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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			807. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text name="a_807d" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_807d#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_807_textd" VALUE="#read_this_sets_billing_values.a_807_textd#" size=22 maxlength=80

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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			808. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text name="a_808d" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_808d#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_808_textd" VALUE="#read_this_sets_billing_values.a_808_textd#" size=22 maxlength=80
 				REQUIRED="No" style="font-size: 9;
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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			810. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text name="a_810d" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_810d#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_810_textd" VALUE="#read_this_sets_billing_values.a_810_textd#" size=22 maxlength=80

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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			811. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text name="a_811d" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_811d#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_811_textd" VALUE="#read_this_sets_billing_values.a_811_textd#" size=22 maxlength=80

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



<!--- <tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			812. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text name="a_812d" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_812d#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_812_textd" VALUE="#read_this_sets_billing_values.a_812_textd#" size=22 maxlength=20

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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			813. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text name="a_813d" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_813d#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_813_textd" VALUE="#read_this_sets_billing_values.a_813_textd#" size=22 maxlength=20

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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			814. <img src="./images/info-01.gif" ALT="Processing Fee"><CFINPUT type=text name="a_814d" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_814d#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_814_textd" VALUE="#read_this_sets_billing_values.a_814_textd#" size=22 maxlength=20

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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			815. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text name="a_815d" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_815d#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_815_textd" VALUE="#read_this_sets_billing_values.a_815_textd#" size=22 maxlength=20

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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			816. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text name="a_816d" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_816d#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_816_textd" VALUE="#read_this_sets_billing_values.a_816_textd#" size=22 maxlength=20

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
				clear: none; ">	<br>
<br>

		</td>
	</tr>
	 --->
	<tr>

		<td width=250 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee">
		<CFINPUT type=text name="a_1101d" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_1101d#" size=12 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			1111. <!--- <img src="./images/info-01.gif" ALT="Data on this line is variable"> --->
		<CFINPUT type=text name="a_1111d" VALUE="#read_this_sets_billing_values.a_1111d#" size=12 maxlength=20
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
		<CFINPUT type=text name="a_1111_textd" VALUE="#read_this_sets_billing_values.a_1111_textd#" size=12 maxlength=80

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
		<td width=250 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search">
		<CFINPUT type=text name="a_1102d"  REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_1102d#" size=12 maxlength=20
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
				<!--- </td>



		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			1112. <!--- <img src="./images/info-01.gif" ALT="Data on this line is variable"> --->
		<CFINPUT type=text name="a_1112d" VALUE="#read_this_sets_billing_values.a_1112d#" size=12 maxlength=20
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
		<CFINPUT type=text name="a_1112_textd" VALUE="#read_this_sets_billing_values.a_1112_textd#" size=12 maxlength=80

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
		<td width=250 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1103. <img src="./images/info-01.gif" ALT="Title Examination">
		<CFINPUT type=text name="a_1103d"  REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_1103d#" size=12 maxlength=20
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
					<!--- </td>



		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			1113.<!---  <img src="./images/info-01.gif" ALT="Data on this line is variable"> --->
		<CFINPUT type=text name="a_1113d" VALUE="#read_this_sets_billing_values.a_1113d#" size=12 maxlength=20
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
		<CFINPUT type=text name="a_1113_textd" VALUE="#read_this_sets_billing_values.a_1113_textd#" size=12 maxlength=80

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
		<td width=250 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder">
		<CFINPUT type=text name="a_1104d"  REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_1104d#" size=12 maxlength=20
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
		<!--- </td>

		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			1205.<!---  <img src="./images/info-01.gif" ALT="Data on this line is variable"> --->
		<CFINPUT type=text name="a_1205d" VALUE="#read_this_sets_billing_values.a_1205d#" size=12 maxlength=20
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
		<CFINPUT type=text name="a_1205_textd" VALUE="#read_this_sets_billing_values.a_1205_textd#" size=12 maxlength=80

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
		<td width=250 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1105. <img src="./images/info-01.gif" ALT="Document Preparation">
		<CFINPUT type=text name="a_1105d" VALUE="#read_this_sets_billing_values.a_1105d#" size=12 maxlength=20
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

		<!--- </td>

		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			1303. <!--- <img src="./images/info-01.gif" ALT="Data on this line is variable"> --->
		<CFINPUT type=text name="a_1303d" VALUE="#read_this_sets_billing_values.a_1303d#" size=12 maxlength=20
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
		<CFINPUT type=text name="a_1303_textd" VALUE="#read_this_sets_billing_values.a_1303_textd#" size=12 maxlength=80

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
		<td width=250 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1106. <img src="./images/info-01.gif" ALT="Notary Fees">
		<CFINPUT type=text name="a_1106d" VALUE="#read_this_sets_billing_values.a_1106d#" size=12 maxlength=20
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
		<!--- </td>

		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			1304.<!---  <img src="./images/info-01.gif" ALT="Data on this line is variable"> --->
		<CFINPUT type=text name="a_1304d" VALUE="#read_this_sets_billing_values.a_1304d#" size=12 maxlength=20
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

		<CFINPUT type=text name="a_1304_textd" VALUE="#read_this_sets_billing_values.a_1304_textd#" size=12 maxlength=80

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
		<td width=250 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1107. <img src="./images/info-01.gif" ALT="Attorney's Fees">
		<CFINPUT type=text name="a_1107d" VALUE="#read_this_sets_billing_values.a_1107d#" size=12 maxlength=20
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

		<!--- </td>

		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			1305.<!---  <img src="./images/info-01.gif" ALT="Data on this line is variable"> --->
		<CFINPUT type=text name="a_1305d" VALUE="#read_this_sets_billing_values.a_1305d#" size=12 maxlength=20
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

		<CFINPUT type=text name="a_1305_textd" VALUE="#read_this_sets_billing_values.a_1305_text#" size=12 maxlength=80

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







	</table>

	</td>




	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<table width=250 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
		<!--- <tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>	 --->
<tr>

		<td width=250 align=center valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial><b>Purchase - Seller<b></font>
		</td>
		</tr>




		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			803. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text name="a_803f" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_803f#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_803_textf" VALUE="#read_this_sets_billing_values.a_803_textf#" size=22 maxlength=80
 				REQUIRED="No" style="font-size: 9;
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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			804. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text name="a_804f" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_804f#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_804_textf" VALUE="#read_this_sets_billing_values.a_804_textf#" size=22 maxlength=80
 				REQUIRED="No" style="font-size: 9;
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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			805. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text name="a_805f" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_805f#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_805_textf" VALUE="#read_this_sets_billing_values.a_805_textf#" size=22 maxlength=80
 				REQUIRED="No"
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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			806. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text name="a_806f" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_806f#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_806_textf" VALUE="#read_this_sets_billing_values.a_806_textf#" size=22 maxlength=80
 				REQUIRED="No" style="font-size: 9;
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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			807. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text name="a_807f" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_807f#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_807_textf" VALUE="#read_this_sets_billing_values.a_807_textf#" size=22 maxlength=80

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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			808. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text name="a_808f" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_808f#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_808_textf" VALUE="#read_this_sets_billing_values.a_808_textf#" size=22 maxlength=80
 				REQUIRED="No" style="font-size: 9;
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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			810. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text name="a_810f" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_810f#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_810_textf" VALUE="#read_this_sets_billing_values.a_810_textf#" size=22 maxlength=80

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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			811. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text name="a_811f" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_811f#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_811_textf" VALUE="#read_this_sets_billing_values.a_811_textf#" size=22 maxlength=80

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



<!--- <tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			812. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text name="a_812f" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_812f#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_812_textf" VALUE="#read_this_sets_billing_values.a_812_textf#" size=22 maxlength=20

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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			813. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text name="a_813f" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_813f#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_813_textf" VALUE="#read_this_sets_billing_values.a_813_textf#" size=22 maxlength=20

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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			814. <img src="./images/info-01.gif" ALT="Processing Fee"><CFINPUT type=text name="a_814f" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_814f#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_814_textf" VALUE="#read_this_sets_billing_values.a_814_textf#" size=22 maxlength=20

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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			815. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text name="a_815f" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_815f#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_815_textf" VALUE="#read_this_sets_billing_values.a_815_textf#" size=22 maxlength=20

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

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			816. <img src="./images/info-01.gif" ALT=""><CFINPUT type=text name="a_816f" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_816f#" size=10 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			<CFINPUT type=text name="a_816_textf" VALUE="#read_this_sets_billing_values.a_816_textf#" size=22 maxlength=20

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
				clear: none; ">	<br>
<br>

		</td>
	</tr> --->


<tr>

		<td width=250 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee">
		<CFINPUT type=text name="a_1101f" REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_1101f#" size=12 maxlength=20
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

		<!--- </td>


		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			1111. <!--- <img src="./images/info-01.gif" ALT="Data on this line is variable"> --->
		<CFINPUT type=text name="a_1111f" VALUE="#read_this_sets_billing_values.a_1111f#" size=12 maxlength=20
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
		<CFINPUT type=text name="a_1111_textf" VALUE="#read_this_sets_billing_values.a_1111_textf#" size=12 maxlength=80

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
		<td width=250 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search">
		<CFINPUT type=text name="a_1102f"  REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_1102f#" size=12 maxlength=20
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
				<!--- </td>



		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			1112. <!--- <img src="./images/info-01.gif" ALT="Data on this line is variable"> --->
		<CFINPUT type=text name="a_1112f" VALUE="#read_this_sets_billing_values.a_1112f#" size=12 maxlength=20
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
		<CFINPUT type=text name="a_1112_textf" VALUE="#read_this_sets_billing_values.a_1112_textf#" size=12 maxlength=80

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
		<td width=250 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1103. <img src="./images/info-01.gif" ALT="Title Examination">
		<CFINPUT type=text name="a_1103f"  REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_1103f#" size=12 maxlength=20
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
					<!--- </td>



		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			1113.<!---  <img src="./images/info-01.gif" ALT="Data on this line is variable"> --->
		<CFINPUT type=text name="a_1113f" VALUE="#read_this_sets_billing_values.a_1113f#" size=12 maxlength=20
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
		<CFINPUT type=text name="a_1113_textf" VALUE="#read_this_sets_billing_values.a_1113_textf#" size=12 maxlength=80

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
		<td width=250 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder">
		<CFINPUT type=text name="a_1104f"  REQUIRED="No" VALIDATE="Float" MESSAGE="Do not enter anything other than numbers in the fields" VALUE="#read_this_sets_billing_values.a_1104f#" size=12 maxlength=20
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
		<!--- </td>

		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			1205.<!---  <img src="./images/info-01.gif" ALT="Data on this line is variable"> --->
		<CFINPUT type=text name="a_1205f" VALUE="#read_this_sets_billing_values.a_1205f#" size=12 maxlength=20
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
		<CFINPUT type=text name="a_1205_textf" VALUE="#read_this_sets_billing_values.a_1205_textf#" size=12 maxlength=80

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
		<td width=250 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1105. <img src="./images/info-01.gif" ALT="Document Preparation">
		<CFINPUT type=text name="a_1105f" VALUE="#read_this_sets_billing_values.a_1105f#" size=12 maxlength=20
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

		<!--- </td>

		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			1303. <!--- <img src="./images/info-01.gif" ALT="Data on this line is variable"> --->
		<CFINPUT type=text name="a_1303f" VALUE="#read_this_sets_billing_values.a_1303f#" size=12 maxlength=20
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
		<CFINPUT type=text name="a_1303_textf" VALUE="#read_this_sets_billing_values.a_1303_textf#" size=12 maxlength=80

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
		<td width=250 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1106. <img src="./images/info-01.gif" ALT="Notary Fees">
		<CFINPUT type=text name="a_1106f" VALUE="#read_this_sets_billing_values.a_1106f#" size=12 maxlength=20
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
		<!--- </td>

		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			1304.<!---  <img src="./images/info-01.gif" ALT="Data on this line is variable"> --->
		<CFINPUT type=text name="a_1304f" VALUE="#read_this_sets_billing_values.a_1304f#" size=12 maxlength=20
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

		<CFINPUT type=text name="a_1304_textf" VALUE="#read_this_sets_billing_values.a_1304_textf#" size=12 maxlength=80

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
		<td width=250 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1107. <img src="./images/info-01.gif" ALT="Attorney's Fees">
		<CFINPUT type=text name="a_1107f" VALUE="#read_this_sets_billing_values.a_1107f#" size=12 maxlength=20
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

		<!--- </td>

		<td width=150 align=right valign=top bgcolor=e6e6e6>	 --->
			<font size=2 color=black face=arial>
			1305.<!---  <img src="./images/info-01.gif" ALT="Data on this line is variable"> --->
		<CFINPUT type=text name="a_1305f" VALUE="#read_this_sets_billing_values.a_1305f#" size=12 maxlength=20
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

		<CFINPUT type=text name="a_1305_textf" VALUE="#read_this_sets_billing_values.a_1305_textf#" size=12 maxlength=80

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

	</table>

					</td>

	<td width=250>
	</td>
	</tr>

	</table>

	<table width=797 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
		<tr>
		<td width=797 colspan=4 align=right valign=top bgcolor=e6e6e6>

			<INPUT TYPE=image src="./images/button_modify.gif" border=0>

	</td>
	</tr>
	</table

><!---

	<tr>
		<td width=797 colspan=4 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			&nbsp; --->
		</td></tr></table>
</CFFORM>
	<!--- ========================================================
--->
	<table width=798 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>

	<tr>

		<td width=300 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Current FT Agency
		</td>


			<CFOUTPUT QUERY="read_current_agency_assoc">


			<td width=298 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial><B>#title_FT_Agency_state#&nbsp;&nbsp;--&nbsp;#Title_FT_Agency_Name#	</B>
		</td>

			</tr>		</CFOUTPUT>
				<!--- <SELECT NAME="Current_agencies_id"
								size="10"
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
						<CFOUTPUT QUERY="read_current_agency_assoc">
										<OPTION VALUE="#title_FT_Agency_ID#"> </OPTION>

							</CFOUTPUT>
						</SELECT>
				<p>
				<input type=image src="./images/button_delete.gif" border=0>--->



	<CFFORM METHOD=POST ACTION="https://#cgi.server_name#/admin_area/client_line_costs_modify_submit.cfm?uid=#URL.uid#&al=#URL.al#&a_flag=3&company_id=#company_id#&billing_id=#billing_id#">

<tr>
		<td width=300 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Available Ft Agencies
		</td>

		<td width=298 align=right valign=top bgcolor=e6e6e6>
						<SELECT NAME="New_agency_id"
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

						<CFLOOP FROM="1" TO="#ArrayLen(a_agency_id)#" INDEX="PPP">

							<CFOUTPUT>
								<OPTION VALUE="#a_agency_ID[PPP]#">#a_agency_state[PPP]#&nbsp;&nbsp;--&nbsp;#a_agency_name[PPP]# </OPTION>
							</CFOUTPUT>
						</CFLOOP>


						</SELECT>
							<p>
							<input type=image src="./images/button_modify.gif" border=0>

		</td>
	</tr>
</cfFORM>
</table>
<table width=798 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>

<CFOUTPUT>
	<FORM METHOD=POST ACTION="https://#cgi.server_name#/admin_area/client_line_costs_modify_submit.cfm?uid=#URL.uid#&al=#URL.al#&company_id=#company_id#&a_flag=4&billing_id=#billing_id#">
</CFOUTPUT>

	<tr>

		<tr>
		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Current States
		</td>

		<td width=147 align=left valign=top bgcolor=e6e6e6>
						<SELECT NAME="a_st_list_3"
								size="10"
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
						<CFLOOP FROM="1" TO="#ArrayLen(a_st_list_4)#" INDEX="BBB">
							<CFOUTPUT>
								<OPTION VALUE="#a_st_list_4[BBB]#">#a_st_list_4[BBB]#</OPTION>
							</CFOUTPUT>
						</CFLOOP>
						</SELECT>
				<p><cfif #read_user.lname# neq "Hays" AND  #read_user.lname# neq "Elliott">
				<input type=image src="./images/button_delete.gif" border=0></cfif>
		</td>
</FORM>
<CFOUTPUT>
	<FORM METHOD=POST ACTION="https://#cgi.server_name#/admin_area/client_line_costs_modify_submit.cfm?uid=#URL.uid#&al=#URL.al#&company_id=#company_id#&a_flag=5&billing_id=#billing_id#">
</CFOUTPUT>

		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Available States
		</td>

		<td width=150 align=left valign=top bgcolor=e6e6e6>
						<SELECT NAME="a_st_list_3" 	MULTIPLE
								size="10"
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
							<CFOUTPUT QUERY="read_all_first_title_states">
								<CFSET b_trigger = "1">
								<CFLOOP FROM="1" TO="#ArrayLen(a_st_list_7)#" INDEX="CCC">
									<CFIF #a_st_list_7[CCC]# EQ #st_abbrev#>
										<CFSET b_trigger = "2">
									</CFIF>
								</CFLOOP>
									<CFIF #b_trigger# EQ "1">
										<OPTION VALUE="#st_abbrev#">#st_abbrev#</OPTION>
									</CFIF>
									<CFSET b_trigger = "1">
							</CFOUTPUT>
						</SELECT>
							<p><cfif #read_user.lname# neq "Hays" AND  #read_user.lname# neq "Elliott">
							<input type=image src="./images/button_add.gif" border=0></cfif>

		</td>
	</tr>
</FORM>
</table>

</table>




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

