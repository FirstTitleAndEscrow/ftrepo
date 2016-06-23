<CFPARAM NAME="vendor"     DEFAULT="">
<CFPARAM NAME="state"       DEFAULT="">
<CFPARAM NAME="county"       DEFAULT="">
<CFPARAM NAME="foo"       DEFAULT="">
<CFPARAM NAME="coo"       DEFAULT="">
<CFPARAM NAME="confirm_mon" DEFAULT="">
<CFPARAM NAME="comfirm_day" DEFAULT="">
<CFPARAM NAME="confirm_year" DEFAULT="">
<CFPARAM NAME="confirm_mon_to" DEFAULT="">
<CFPARAM NAME="comfirm_day_to" DEFAULT="">
<CFPARAM NAME="confirm_year_to" DEFAULT="">
<CFPARAM NAME="yearMon" DEFAULT="">
<CFPARAM NAME="yearMonto" DEFAULT="">

<CFIF #Transaction# neq 1>
	<CFQUERY datasource="#request.dsn#" NAME="read_cleartoclse">
		Update
		Doc_Closer_Title
		set paid=1,
		Paid_Amount = #paid_amount#,
		Paid_Date = '#paid_date#',
		Invoice_Num = '#Invoice_Num#'
		where title_ID = #URL.title_ID#
		and closer_ID = #closer_ID#
		and CL_DOC_ID = #CL_DOC_ID#
	</CFQuery>
<CFELSE>
	<CFQUERY datasource="#request.dsn#" NAME="read_cleartoclse">
		Update
		Doc_Closer_Title
		set paid=2,
		Paid_Amount = null,
		Paid_Date = null,
		Invoice_Num = null
		where title_ID = #URL.title_ID#
		and closer_ID = #closer_ID#
		and CL_DOC_ID = #CL_DOC_ID#
	</CFQuery>
</CFIF>
<CFLOCATION URL="https://#cgi.server_name#/admin_area/vendor_performance_report_result.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1uid=#URL.uid#&al=#URL.al#&closer_ID=#closer_ID#&CL_Doc_ID=#CL_Doc_ID#&vendor=#vendor#&state=#state#&county=#county#&foo=#foo#&coo=#coo#&confirm_mon=#confirm_mon#&comfirm_day=#comfirm_day#&confirm_year=#confirm_year#&confirm_mon_to=#confirm_mon_to#&comfirm_day_to=#comfirm_day_to#&confirm_year_to=#confirm_year_to#&type=closers&yearmon=#YearMon#&YearMonto=#YearMonto#">


