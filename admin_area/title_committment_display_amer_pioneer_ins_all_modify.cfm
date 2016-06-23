

<CFPARAM NAME="a_direction" DEFAULT="">
<CFPARAM NAME="Insurance_Company" DEFAULT="">

<CFPARAM NAME="a_trigger" DEFAULT="0">
<CFPARAM NAME="Plant_no_1" DEFAULT="">
<CFPARAM NAME="Agent_Branch_1" DEFAULT="">
<CFPARAM NAME="ReInsurance_No_1" DEFAULT="">
<CFPARAM NAME="Policy_To_Issue_Lender_1" DEFAULT="">
<CFPARAM NAME="Policy_To_Issue_Buyer_1" DEFAULT="">
<CFPARAM NAME="inst_day" DEFAULT="">
<CFPARAM NAME="inst_mon" DEFAULT="">
<CFPARAM NAME="inst_year" DEFAULT="">
<CFPARAM NAME="select1" DEFAULT="">
<CFPARAM NAME="Buyer_Owner" DEFAULT="">
<CFPARAM NAME="a_comments" DEFAULT="">
<CFPARAM NAME="tax_info" DEFAULT="">
<CFPARAM NAME="a_comments2" DEFAULT="">
<CFPARAM NAME="a_comments3" DEFAULT="">
<CFPARAM NAME="a_comments4" DEFAULT="">
<CFPARAM NAME="a_comments5" DEFAULT="">
<CFPARAM NAME="a_comments6" DEFAULT="">
<CFPARAM NAME="a_comments7" DEFAULT="">
<CFPARAM NAME="a_comments8" DEFAULT="">
<CFPARAM NAME="a_comments9" DEFAULT="">
<CFPARAM NAME="a_comments10" DEFAULT="">
<CFPARAM NAME="a_comments11" DEFAULT="">
<CFPARAM NAME="a_comments12" DEFAULT="">
<CFPARAM NAME="a_comments13" DEFAULT="">
<CFPARAM NAME="a_comments14" DEFAULT="">
<CFPARAM NAME="a_comments15" DEFAULT="">
<CFPARAM NAME="a_comments16" DEFAULT="">
<CFPARAM NAME="a_comments17" DEFAULT="">
<CFPARAM NAME="a_comments18" DEFAULT="">
<CFPARAM NAME="a_comments19" DEFAULT="">
<CFPARAM NAME="a_comments20" DEFAULT="">
<CFPARAM NAME="a_comments21" DEFAULT="">



<CFQUERY datasource="#request.dsn#">		
				UPDATE Doc_Amer_Pioneer_Ins_ALL_Title
				SET status = 1,
				a_comments = 'hjkhjkhkj'
				WHERE Title_ID = #rec_ID#		
			</CFQUERY>

		