
<CFQUERY datasource="#request.dsn#" NAME="update_email_date">
				Update Title_Temp_Dynatek
				set email_date = #Now()#
				where Temp_loan_ID = #url.Temp_Loan_ID#
</CFQUERY>



