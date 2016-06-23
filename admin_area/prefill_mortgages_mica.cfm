<cfif check_if_mica.company contains 'MICA -'>
<CFPARAM NAME="mort1" DEFAULT="">
<CFPARAM NAME="mort2" DEFAULT="">
<CFPARAM NAME="mort3" DEFAULT="">
<CFPARAM NAME="amt" DEFAULT="">
<CFPARAM NAME="docnum" DEFAULT="">
<CFPARAM NAME="book" DEFAULT="">
<CFPARAM NAME="page" DEFAULT="">
<CFPARAM NAME="inst_mon" DEFAULT="">
<CFPARAM NAME="inst_day" DEFAULT="">
<CFPARAM NAME="inst_year" DEFAULT="">
<CFPARAM NAME="rec_mon" DEFAULT="">
<CFPARAM NAME="rec_day" DEFAULT="">
<CFPARAM NAME="rec_year" DEFAULT="">
<CFPARAM NAME="openend" DEFAULT="">
<CFPARAM NAME="trustee" DEFAULT="">
<CFPARAM NAME="info" DEFAULT="">
<CFPARAM NAME="info2" DEFAULT="">
<CFPARAM NAME="ass1" DEFAULT="">
<CFPARAM NAME="doc_num1" DEFAULT="">
<CFPARAM NAME="book1" DEFAULT="">
<CFPARAM NAME="page1" DEFAULT="">
<CFPARAM NAME="rec_mon1" DEFAULT="">
<CFPARAM NAME="rec_day1" DEFAULT="">
<CFPARAM NAME="rec_year1" DEFAULT="">
<CFPARAM NAME="ass2" DEFAULT="">
<CFPARAM NAME="doc_num2" DEFAULT="">
<CFPARAM NAME="book2" DEFAULT="">
<CFPARAM NAME="page2" DEFAULT="">
<CFPARAM NAME="rec_mon2" DEFAULT="">
<CFPARAM NAME="rec_day2" DEFAULT="">
<CFPARAM NAME="rec_year2" DEFAULT="">
<CFPARAM NAME="ass3" DEFAULT="">
<CFPARAM NAME="doc_num3" DEFAULT="">
<CFPARAM NAME="book3" DEFAULT="">
<CFPARAM NAME="page3" DEFAULT="">
<CFPARAM NAME="rec_mon3" DEFAULT="">
<CFPARAM NAME="rec_day3" DEFAULT="">
<CFPARAM NAME="rec_year3" DEFAULT="">
<CFPARAM NAME="ass4" DEFAULT="">
<CFPARAM NAME="doc_num4" DEFAULT="">
<CFPARAM NAME="book4" DEFAULT="">
<CFPARAM NAME="page4" DEFAULT="">
<CFPARAM NAME="rec_mon4" DEFAULT="">
<CFPARAM NAME="rec_day4" DEFAULT="">
<CFPARAM NAME="rec_year4" DEFAULT="">
<CFPARAM NAME="openend" DEFAULT="">

<cfset mort1 = "Wells Fargo Bank, N.A.">
<cfset mort2 = "Springwood Blair Mill Associates, LLC">
<cfset amt = "29,395,000.00">
<cfset book = "30150">
<cfset page = "645.">
<cfset inst_mon = "06">
<cfset inst_day = "22">
<cfset inst_year = "2005">
<cfset rec_mon = "06">
<cfset rec_day = "24">
<cfset rec_year = "2005">



<CFSET instdate = #CreateDate(#inst_year#, #inst_mon#, #inst_day#)#>
<CFSET recdate = #CreateDate(#rec_year#, #rec_mon#, #rec_day#)#>

<cfif #rec_year1# NEQ "" AND #rec_mon1# NEQ "" AND #rec_mon1# NEQ "">
<CFSET recdate1 = #CreateDate(#rec_year1#, #rec_mon1#, #rec_day1#)#>
<cfelse>
<cfset recdate1 = "">
</cfif>
<cfif #rec_year2# NEQ "" AND #rec_mon2# NEQ "" AND #rec_mon2# NEQ "">
<CFSET recdate2 = #CreateDate(#rec_year2#, #rec_mon2#, #rec_day2#)#>
<cfelse>
<cfset recdate2 = "">
</cfif>
<cfif #rec_year3# NEQ "" AND #rec_mon3# NEQ "" AND #rec_mon3# NEQ "">
<CFSET recdate3 = #CreateDate(#rec_year3#, #rec_mon3#, #rec_day3#)#>
<cfelse>
<cfset recdate3 = "">
</cfif>
<cfif #rec_year4# NEQ "" AND #rec_mon4# NEQ "" AND #rec_mon4# NEQ "">
<CFSET recdate4 = #CreateDate(#rec_year4#, #rec_mon4#, #rec_day4#)#>
<cfelse>
<cfset recdate4 = "">
</cfif>

<CFSET c_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET c_date = #DateFormat(Now(), "mm/dd/yyyy")#>



<CFQUERY datasource="#request.dsn#" NAME="read_type">
		
			SELECT type
			FROM title_ins_add
			where title_id = #url.rec_id# and type = 'MORTGAGE'
		</CFQUERY>
		
<cfset seq_num = read_type.recordcount + 1>
	

<cfquery  datasource="#request.dsn#">
			INSERT INTO 
				title_ins_add (title_id, type, seq_num, status, insert_date, insert_time, data1, data2, data3, data4, data5, data6, data7, data8, data9, data10, data11, data12, data13, data14, data15, data16, data17, data18, data19, data20, data21, data22, data23, data24, data25, data26, data27, data28, data29, data30, data31, data32, data33)
				VALUES (#url.rec_id#, 'MORTGAGE', '#seq_num#', 'O', '#c_date#', '#c_time#', '#mort1#', '#mort2#', '#mort3#', '#amt#', '#docnum#', '#book#', '#page#', '#DateFormat(instdate, "mm/dd/yyyy")#', '#DateFormat(recdate, "mm/dd/yyyy")#', '#trustee#', '#info#', '#info2#', '#ass1#', '#doc_num1#', '#book1#', '#page1#', '#DateFormat(recdate1, "mm/dd/yyyy")#', '#ass2#', '#doc_num2#', '#book2#', '#page2#', '#DateFormat(recdate2, "mm/dd/yyyy")#', '#ass3#', '#doc_num3#', '#book3#', '#page3#', '#DateFormat(recdate3, "mm/dd/yyyy")#', '#ass4#', '#doc_num4#', '#book4#', '#page4#', '#DateFormat(recdate4, "mm/dd/yyyy")#', '#openend#')

</cfquery>
<cfquery  datasource="#request.dsn#">
			INSERT INTO title_ins_view
				(title_id, type, seq_num, status, insert_date, insert_time, data1, data2, data3, data4, data5, data6, data7, data8, data9, data10, data11, data12, data13, data14, data15, data16, data17, data18, data19, data20, data21, data22, data23, data24, data25, data26, data27, data28, data29, data30, data31, data32, data33, prefill)
				VALUES (#url.rec_id#, 'MORTGAGE', '#seq_num#', 'O', '#c_date#', '#c_time#', '#mort1#', '#mort2#', '#mort3#', '#amt#', '#docnum#', '#book#', '#page#', '#DateFormat(instdate, "mm/dd/yyyy")#', '#DateFormat(recdate, "mm/dd/yyyy")#', '#trustee#', '#info#', '#info2#', '#ass1#', '#doc_num1#', '#book1#', '#page1#', '#DateFormat(recdate1, "mm/dd/yyyy")#', '#ass2#', '#doc_num2#', '#book2#', '#page2#', '#DateFormat(recdate2, "mm/dd/yyyy")#', '#ass3#', '#doc_num3#', '#book3#', '#page3#', '#DateFormat(recdate3, "mm/dd/yyyy")#', '#ass4#', '#doc_num4#', '#book4#', '#page4#', '#DateFormat(recdate4, "mm/dd/yyyy")#', '#openend#', 1)


</cfquery>
</cfif>
