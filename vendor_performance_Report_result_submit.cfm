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

<CFQUERY datasource="#request.dsn#" NAME="read_cleartoclse">
	Update
	Doc_Abstract_Title
	set paid=1,
	Paid_Amount = #DollarFormat(paid_amount)#,
	Paid_Date = #DateFormat(paid_date,"mm/dd/yyyy")#
	where title_ID = #title_ID#
	and abstractor_ID = #abstractor_ID#
	and Abs_Doc_ID = #Abs_Doc_ID#
</CFQuery>

<!---<CFOUTPUT>
The Vendor is #vendor# <BR>
The State is #state# <BR>
The County is #county# <BR>
The Foo is #Foo# <BR>
The Coo is #Coo# <BR>

</CFOUTPUT>--->

<CFLOCATION URL="https://#cgi.server_name#/vendor_performance_report_result.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1uid=#URL.uid#&al=#URL.al#&abstractor_ID=#abstractor_ID#&Abs_Doc_ID=#Abs_Doc_ID#&vendor=#vendor#&state=#state#&county=#county#&foo=#foo#&coo=#coo#&confirm_mon=#confirm_mon#&comfirm_day=#comfirm_day#&confirm_year=#confirm_year#&confirm_mon_to=#confirm_mon_to#&comfirm_day_to=#comfirm_day_to#&confirm_year_to=#confirm_year_to#">


