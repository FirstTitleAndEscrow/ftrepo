			<CFQUERY datasource="#request.dsn#" NAME="aaaa">		
				SELECT *
				FROM Title_Closing_Order_Request
				Where Title_Id = 3
			</CFQUERY>

<CFOUTPUT QUERY="aaaa">

Job_Number = #Job_Number#<br>
a_Req_Date = '#a_Req_Date#'<br>
a_Req_Time = '#a_Req_Time#'<br>
a_Req_Closing_Date = '#a_Req_Closing_Date#'<br>
a_Req_Closing_Time = '#a_Req_Closing_Time#'<br>
a_Settle_Location = '#a_Settle_Location#'<br>
a_Requested_By = '#a_Requested_By#'<br>
a_Req_By_Title = '#a_Req_By_Title#'<br>
a_Req_By_Company = '#a_Req_By_Company#'<br>
a_Req_By_Phone = '#a_Req_By_Phone#'<br>
a_Req_By_Ext = '#a_Req_By_Ext#'<br>
a_Req_By_Fax = '#a_Req_By_Fax#'<br>
a_Req_By_Email = '#a_Req_By_Email#'<br>
a_Req_By_After_Hours_Phone = '#a_Req_By_After_Hours_Phone#'<br>
a_Managers_Name = '#a_Managers_Name#'<br>
a_Managers_Phone = '#a_Managers_Phone#'<br>
a_When_Pkg_Will_Be_Ready = '#a_When_Pkg_Will_Be_Ready#'<br>
a_How_Will_Be_Shipped = '#a_How_Will_Be_Shipped#'<br>
a_Special_Inst = '#a_Special_Inst#'<br>
a_sent_by = '#a_sent_by#'<br>
a_filled_out_by = '#a_filled_out_by#'<br>

</CFOUTPUT>