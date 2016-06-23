<CFPARAM NAME="a_flag" DEFAULT="">
<CFPARAM NAME="count" DEFAULT="">
<CFPARAM NAME="a_trigger" DEFAULT="">
<CFQUERY datasource="#request.dsn#" NAME="getuser">
select * from first_admin

			WHERE ID = #session.ft_user_id#
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_titleid">
SELECT * FROM title_closing_order_request where a_filled_out_date is null ORDER BY Title_id
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_propid">
SELECT * FROM title_closing_order_request_prop where a_filled_out_date is null ORDER BY prop_id
</CFQUERY>
<cfif isdefined('URL.F')>
  <cfset y = mid(URL.F,1,4)>
  <cfset m = mid(URL.F,5,2)>
  <cfset d = mid(URL.F,7,2)>
  <cfset h = mid(URL.F,9,2)>
  <cfset mn = mid(URL.F,11,2)>
  <cfelse>
  <cfset y = mid(now(),6,4)>
  <cfset m = mid(now(),11,2)>
  <cfset d = mid(now(),14,2)>
  <cfset h = mid(now(),17,2)>
  <cfset mn = mid(now(),20,2)>
</cfif>
<!---Variables--->
<cfset ThisDate = CreateDate(y,m,d)>
<cfset ThisDate = CreateODBCDateTime(ThisDate)>
<cfset TimeStamp = y&m&d&h&mn>
<cfset F = TimeStamp>
<cfset YearMonth = y&m>
<cfset YearMonthDay = y&m&d>
<cfset Clock = h&mn>
<html>
<head>
<title>View</title>
</head>
<body bgcolor="silver">
<div align="center">
<!--- Edit (Start) Added by Synechron Development for ticket# 777 --->
<cfobject component="cfc.CalculateWorkDays"	name="CalculateWorkDaysObj"	type="component">
<!--- Edit (End) Added by Synechron Development for ticket# 777 --->
  <table border="0" cellpadding="0" cellspacing="0" width="650" bgcolor="black">
    <tr>
      <td>
      <div align="center">
      <table border="1" cellpadding="1" cellspacing="0" width="650" bgcolor="white">
        <tr>
          <td bgcolor="navy" colspan="9" width="650"><p align="center"><font color="white" face="Arial Black">
              <!---Description Bar--->
              <cfoutput>#DateFormat(ThisDate,'dddd, d, mmmm, yyyy')#
                <cfset plugday = #DateFormat(ThisDate,'mm/dd/yyyy')#>
              </CFOUTPUT>
              <cfset tempdate = CreateODBCDate(plugday)>
              <cfset temp = #DateFormat(Now(), 'mm/dd/yyyy')#>
              <cfset current = CreateODBCDate(temp)>
              </font></p></td>
        </tr>
        <cfoutput>
          <tr>
            <td bgcolor="blue" colspan = 10 valign=center width="100%" align="center"><font size=3 color=white face=verdana><b> Check below for Requested/Scheduled Closings</b></font><br>
            </td>
          </tr>
          <tr>
            <CFSET comparison = DateCompare(tempdate, current)>
            <td bgcolor="white" colspan = 10 valign=center width="100%" align="center"><font size=2 color=black face=verdana>
              <!--date chosen is today --->
              <CFIF #comparison# eq "1">
                **If you would like to schedule a new closing please <a href="./title_rep_closing_view.cfm?comp_id=#comp_id#&YearMonthDay=#plugDay#&uid=#url.uid#&al=#url.al#"><font size=3 color=red face=verdana><b>click here</b></font></a><br>
                <cfelse>
                **If you would like to request a new closing, please chose a future date
              </cfif>
            </td>
          </tr>
        </cfoutput>
        <!---Field List --->
        <tr>
          <td bgcolor="elelel" valign=top  align="center"><font size=2 color=blue face=verdana><b> Time </b></font> </td>
          <td bgcolor="elelel" valign=top  align="center"><font size=2 color=blue face=verdana><b> Borrower </b></font> </td>
          <td bgcolor="elelel" valign=top align="center"><font size=2 color=blue face=verdana><b> Order Number </b></font> </td>
          <td bgcolor="elelel" valign=top align="center"><font size=2 color=blue face=verdana><b> View/Modify Closing </b></font> </td>
          <td bgcolor="elelel" valign=top align="center"><font size=2 color=blue face=verdana><b> Lender </b></font> </td>
          <td bgcolor="elelel" valign=top align="center"><font size=2 color=blue face=verdana><b> Closing Fee </b></font> </td>
          <td bgcolor="elelel" valign=top align="center"><font size=2 color=blue face=verdana><b> Closing Inst. upload time </b></font> </td>
          <td bgcolor="elelel" valign=top align="center"><font size=2 color=blue face=verdana><b> Pre-HUD upload time </b></font> </td>
		<!--- Edit (Start) Added by Synechron Development for ticket# 777 --->
		  <td bgcolor="elelel" valign=top align="center"><font size=2 color=blue face=verdana><b> HUD Turn-Time (mins) </b></font> </td>
		 <!--- Edit (end) Added by Synechron Development for ticket# 777 --->		
          <td bgcolor="elelel" valign=top align="center"><font size=2 color=blue face=verdana><b> Final HUD upload time </b></font> </td>
          <td bgcolor="elelel" valign=top align="center"><font size=2 color=blue face=verdana><b> Comments </b></font> </td>
		  <td bgcolor="elelel" valign=top align="center"><font size=2 color=blue face=verdana><b> Seller Rep </b></font> </td>
		  <td bgcolor="elelel" valign=top align="center"><font size=2 color=blue face=verdana><b> Processor </b></font> </td>
        </tr>
        <!--If a selected amount of companies were selected --->
        <cfif #comp_id# neq "ALL">
		<cfset company_id_list = comp_id>

          <cfquery datasource="#request.dsn#" name="getList">
          select e.*, t.comp_id From EventList e, Title t Where (e.YearMonth = '#YearMonthDay#')
		  <!--- Carrie Rico's stuff --->
		  <cfif session.ft_user_id eq 327>
          and t.comp_id in (3276)
		  <cfelseif session.ft_user_id eq 322>
		  and t.comp_id in (Select ID from companies where test_account <> 1 and streamline_client <> 1)
		  <cfelseif session.mi_employee eq 1 or session.mo_employee eq 1 or session.mi_flushing_employee eq 1 or session.ft_fairfax_employee eq 1 or session.tx_employee eq 1 or session.ft_user_id eq 366 or session.va_employee eq 1 or session.va_admin eq 1 or getuser.role_id eq 24>
          and (t.comp_id in (#company_id_list#) <cfif session.ft_user_id eq 630 or session.ft_user_id eq 631> or t.comp_id in (Select ID from companies where (team_id = 5 or ID = 12324))</cfif>)
          </cfif>
          <!---Cindy Mills --->
          <cfif #url.uid# EQ "93">
            and (t.comp_id = 211 or t.comp_id = 227 or t.comp_id = 231 or t.comp_id = 232 or t.comp_id = 251 or t.comp_id = 209 or t.comp_id = 174 or t.comp_id = 178 or t.comp_id = 141 OR t.comp_id = 205)
          </cfif>
          <!---Nita Farrow --->
          <cfif #url.uid# eq "167">
            and t.comp_id = 100
          </cfif>
          <!---Rebecca Lott --->
          <cfif #url.uid# EQ "203">
            and (t.comp_id = 224 or t.comp_id = 465 or t.comp_id = 522 or t.comp_id = 333 or t.comp_id = 523)
          </cfif>
		  and t.title_id = e.title_id
          and e.title_id is not null order by e.c_time
          </cfquery>
          <CFIF #getlist.recordcount# gte 1>
            <CFQUERY datasource="#request.dsn#" NAME="get_company">
            SELECT company FROM companies WHERE id = #getlist.comp_id#
            </CFQUERY>
          </CFIF>
         <cfquery datasource="#request.dsn#" name="getList4">
          select * From EventList Where (YearMonth = '#YearMonthDay#')
          <!--- Carrie Rico's stuff --->
		  <cfif session.ft_user_id eq 327>
          and comp_id in (3276)
		  <cfelseif session.ft_user_id eq 322>
		  and comp_id in (Select ID from companies where test_account <> 1 and streamline_client <> 1)
          </cfif>
		  <cfif session.va_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_employee eq 1 or session.mo_employee eq 1 or session.mi_flushing_employee eq 1 or session.ft_user_id eq 366 or session.va_admin eq 1 or getuser.role_id eq 24>
          and (comp_id in (#company_id_list#)  <cfif session.ft_user_id eq 630 or session.ft_user_id eq 631> or comp_id in (Select ID from companies where (team_id = 5 or ID = 12324))</cfif>)
          </cfif>
		  <!---Cindy Mills --->
          <cfif #url.uid# EQ "93">
            and (comp_id = 211 or comp_id = 227 or comp_id = 231 or comp_id = 232 or comp_id = 251 or comp_id = 209 or comp_id = 174 or comp_id = 178 or comp_id = 141 OR comp_id = 205)
          </cfif>
          <!---Nita Farrow --->
          <cfif #url.uid# eq "167">
            and comp_id = 100
          </cfif>
          <!---Rebecca Lott --->
          <cfif #url.uid# EQ "203">
            and (comp_id = 224 or comp_id = 465 or comp_id = 522 or comp_id = 333 or comp_id = 523)
          </cfif>
          and prop_id is not null order by c_time
          </cfquery>
          <CFIF #getlist4.recordcount# gte 1>
            <CFQUERY datasource="#request.dsn#" NAME="get_company4">
            SELECT company FROM companies WHERE id = #getlist4.comp_id#
            </CFQUERY>
          </CFIF>
          <cfquery datasource="#request.dsn#" name="getList2">
          select t.title_id, a.*, b.* From Title_Closing_Order_Request a, EventList b, title t where a.title_id = b.title_id and t.title_id = b.title_id and a.request_date = #ThisDate# and b.yearmonth is null
		  <!--- Carrie Rico's stuff --->
		  <cfif session.ft_user_id eq 327>
          and b.comp_id in (3276)
		  <cfelseif session.ft_user_id eq 322>
		  and b.comp_id in (Select ID from companies where test_account <> 1 and streamline_client <> 1)
          </cfif>
		  <cfif session.va_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_employee eq 1 or session.mo_employee eq 1 or session.mi_flushing_employee eq 1 or session.tx_employee eq 1 or session.ft_user_id eq 366 or session.va_admin eq 1 or getuser.role_id eq 24>
          and (t.comp_id in (#company_id_list#)  <cfif session.ft_user_id eq 630 or session.ft_user_id eq 631> or t.comp_id in (Select ID from companies where (team_id = 5 or ID = 12324))</cfif>)
          </cfif>
          <!---Cindy Mills --->
          <cfif #url.uid# EQ "93">
            and (b.comp_id = 211 or b.comp_id = 227 or b.comp_id = 231 or b.comp_id = 232 or b.comp_id = 251 or b.comp_id = 209 or b.comp_id = 174 or b.comp_id = 178 or b.comp_id = 141 OR b.comp_id = 205)
          </cfif>
          <!---Nita Farrow --->
          <cfif #url.uid# eq "167">
            and b.comp_id = 100
          </cfif>
          <!---Rebecca Lott --->
          <cfif #url.uid# EQ "203">
            and (comp_id = 224 or comp_id = 465 or comp_id = 522 or comp_id = 333 or comp_id = 523)
          </cfif>
          order by b.c_time
          </cfquery>
          <cfquery datasource="#request.dsn#" name="getList3">
          select * From Title_Closing_Order_Request_Prop a, EventList b where a.prop_id = b.prop_id and a.request_date = '#YearMonthDay#' and b.yearmonth is null
		  <!--- Carrie Rico's stuff --->
		  <cfif session.ft_user_id eq 327>
          and b.comp_id in (3276)
		  <cfelseif session.ft_user_id eq 322>
		  and b.comp_id in (Select ID from companies where test_account <> 1 and streamline_client <> 1)
		  <cfelseif session.va_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_employee eq 1  or session.mo_employee eq 1 or session.mi_flushing_employee eq 1 or session.tx_employee eq 1 or session.ft_user_id eq 366 or session.va_admin eq 1 or getuser.role_id eq 24>
          and (b.comp_id in (#company_id_list#)  <cfif session.ft_user_id eq 630 or session.ft_user_id eq 631> or b.comp_id in (Select ID from companies where (team_id = 5 or ID = 12324))</cfif>)
          </cfif>
          <!---Cindy Mills --->
          <cfif #url.uid# EQ "93">
            and (b.comp_id = 211 or b.comp_id = 227 or b.comp_id = 231 or b.comp_id = 232 or b.comp_id = 251 or b.comp_id = 209 or b.comp_id = 174 or b.comp_id = 178 or b.comp_id = 141 OR b.comp_id = 205)
          </cfif>
          <!---Rebecca Lott --->
          <cfif #url.uid# EQ "203">
            and (comp_id = 224 or comp_id = 465 or comp_id = 522 or comp_id = 333 or comp_id = 523)
          </cfif>
          <!---Nita Farrow --->
          <cfif #url.uid# eq "167">
            and b.comp_id = 100
          </cfif>
          order by b.c_time
          </cfquery>
          <cfoutput>
            <CFSET r_count = #getlist.recordcount# + #getlist2.recordcount# + #getlist3.recordcount# + #getlist4.recordcount#>
            <CFSET r_count2 = #getlist2.recordcount# + #getlist3.recordcount# >
            <CFSET r_count1 = #getlist.recordcount# + #getlist4.recordcount# >
            <tr>
              <td bgcolor="00ff00" colspan = 12 width="100%" align=center valign=top><FONT FACE=verdana SIZE=1 color="black"> Company: ALL. Total of #r_count# records found for #DateFormat(ThisDate,'m/d/yyyy')# </td>
            </tr>
            <cfif #r_count2# neq 0>
              <tr>
                <td bgcolor="yellow" colspan = 12 width="100%" align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
                  <cfif #r_count2# neq 0>
                    #r_count2# are <b>REQUESTED</b> for #DateFormat(ThisDate,'m/d/yyyy')#. See below 
                  </cfif>
                </td>
              </tr>
            </cfif>
          </cfoutput>
          <!---Title--->
		  
          <cfoutput query="getList2">
            <CFQUERY datasource="#request.dsn#" NAME="get_file2">
            SELECT * FROM doc_closer_title WHERE title_ID = #title_id#
            </CFQUERY>
            <CFQUERY datasource="#request.dsn#" NAME="get_title">
            SELECT * FROM title WHERE title_ID = #title_id#
            </CFQUERY>
            <CFQUERY datasource="#request.dsn#" NAME="get_company2">
            SELECT company FROM companies WHERE id = #get_title.comp_id#
            </CFQUERY>
            <tr <cfif get_title.SearchType eq 'Purchase'>bgcolor="FFCC66"<cfelse>bgcolor="white"</cfif>>
              <td valign=center  align="center"><font size=1 color=black face=verdana> <b>
                <cfif #getlist2.a_req_closing_time# eq"">
                  N/A
                  <cfelse>
                  #TimeFormat(getlist2.a_req_closing_time, "h:mm tt")#
                </cfif> 
                </B></font> </td>
              <td valign=center  align="center"><font size=1 color=black face=verdana><b> #get_title.bfirstname1# &nbsp; #get_title.blastname1#</b> </td>
              <td valign=center  align=center valign=top>
              <FONT FACE=verdana SIZE=1 color="black">
              <a href="./title_report_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#getlist2.title_id#&a_trigger=1&company_id=#comp_id#"target="prop_hud_pg2" onClick="window.open('','prop_hud_pg2','width=620,height=500,status=0,resizable=1,scrollbars=1')"><font size=1 color=blue face=verdana>#title_id#</font></a>
              </td>
              <td valign=center  align="center"><a href="./TITLE_CLOSING_ORDER_REQUEST_VIEW_ONLY.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#getlist2.title_id#&company_id=#getlist2.comp_id#"><font size=1 color=blue face=verdana>View/Modify</font></a> </td>
              <td valign=center  align="center"><font size=1 color=black face=verdana><b>#get_company2.company#</FONT></B> </td>
              <td valign=center  align="center"><cfif  #getlist2.fee# neq "">
                  <font size=1 color=black face=verdana><b>#getlist2.fee#</FONT></B>
                  <cfelse>
                  <font size=1 color=black face=verdana><b>N/A</FONT></B>
                </cfif>
              </td>
              <td valign=center  align="center"><cfif #get_file2.closing_instructions# neq "">
                  <A HREF="#fileSys.FindFilePath('#get_file2.closing_instructions#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(get_file2.closing_inst_date,'m/d/yy')#&nbsp;#TimeFormat(get_file2.closing_inst_time, "HH:mm")#</b></a>
                  <cfelse>
                  <B><font size=1 color=black face=verdana>N/A</B>
                </cfif>
              </td>
              <td valign=center  align="center"><cfif #get_file2.pre_hud# neq "">
                  <A HREF="#fileSys.FindFilePath('#get_file2.pre_hud#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(get_file2.preHUD_upload_date,'m/d/yy')#&nbsp;#TimeFormat(get_file2.preHUD_upload_date, "HH:mm")#</b></a>
                  <cfelse>
                  <B><font size=1 color=black face=verdana>N/A</B>
                </cfif>
              </td>
			<!--- Edit (Start) Added by Synechron Development for ticket# 777 --->
				<td valign=center  align="center">			
				<cfset int_time_value = DateFormat(get_file2.closing_inst_date) & ' ' & TimeFormat(get_file2.closing_inst_time)>		
 					<cfif #get_file2.closing_instructions# neq "" and #get_file2.pre_hud# neq "">
						<cfset WorkingDate=CalculateWorkDaysObj.ElapsedTime(ParseDateTime(#int_time_value#),ParseDateTime(#get_file2.preHUD_upload_date#), #getlist2.title_id#)>
						#Int(WorkingDate.EffectiveWorkmins)#				
					<cfelse>
                  		<B><font size=1 color=black face=verdana>tttt</B>
					</cfif> 
				</td>			
			<!--- Edit (end) Added by Synechron Development for ticket# 777 --->
              <td valign=center  align="center"><cfif #get_file2.final_hud# neq "">
                  <A HREF="#fileSys.FindFilePath('#get_file2.final_HUD#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(get_file2.final_hud_date,'m/d/yy')#&nbsp;#TimeFormat(get_file2.final_hud_time, "HH:mm")#</b></a>
                  <cfelse>
                  <B><font size=1 color=black face=verdana>N/A</B>
                </cfif>
              </td>
              <td valign=center  align="center"><a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#getlist2.title_id#&user_id=0&company_id=0&a_trigger=0&code=T" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a> </td>
				<td valign=center  align="center"><cfif get_title.seller_rep eq 'True'>X<cfelse>&nbsp;</cfif></td>
				<td valign=center  align="center"><font size=1 color=black face=verdana><b>#get_title.ipname#</b></font></td>
            </tr>
            <CFSET count = 1>
          </cfoutput>
          <!---Property--->
          <cfoutput query="getList3">
            <CFQUERY datasource="#request.dsn#" NAME="get_file3">
            SELECT * FROM doc_closer_prop WHERE prop_ID = #prop_id#
            </CFQUERY>
            <CFQUERY datasource="#request.dsn#" NAME="get_title">
            SELECT * FROM property WHERE prop_ID = #prop_id#
            </CFQUERY>
            <CFQUERY datasource="#request.dsn#" NAME="get_company3">
            SELECT company FROM companies WHERE id = #get_title.comp_id#
            </CFQUERY>
            <tr <cfif get_title.SearchType eq 'Purchase'>bgcolor="FFCC66"<cfelse>bgcolor="white"</cfif>>
              <td valign=center  align="center"><font size=1 color=black face=verdana> <b>
                <cfif #getlist3.a_req_closing_time# eq"">
                  N/A
                  <cfelse>
                  #TimeFormat(getlist3.a_req_closing_time, "h:mm tt")#
                </cfif>
                </B></font> </td>
              <td valign=center  align="center"><font size=1 color=black face=verdana><b> #get_title.bfirstname1# &nbsp; #get_title.blastname1#</b> </td>
              <td valign=center  align=center valign=top>
              <FONT FACE=verdana SIZE=1 color="black">
              <a href="./prop_report_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#getlist3.prop_id#&a_trigger=1&company_id=#comp_id#"target="prop_hud_pg2" onClick="window.open('','prop_hud_pg2','width=620,height=500,status=0,resizable=1,scrollbars=1')"><font size=1 color=blue face=verdana>0232#prop_id#</font></a>
              </td>
              <td valign=center  align="center"><a href="./prop_CLOSING_ORDER_REQUEST_VIEW_ONLY.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#getlist3.prop_id#&company_id=#getlist3.comp_id#"><font size=1 color=blue face=verdana>View/Modify</font></a> </td>
              <td valign=center  align="center"><font size=1 color=black face=verdana><b>#get_company3.company#</FONT></B> </td>
              <td valign=center  align="center"><cfif  #getlist3.fee# neq "">
                  <font size=1 color=black face=verdana><b>#getlist3.fee#</FONT></B>
                  <cfelse>
                  <font size=1 color=black face=verdana><b>N/A</FONT></B>
                </cfif>
              </td>
              <td valign=center  align="center"><!--- <cfif #get_file3.closing_instructions# neq "">
                  <A HREF="#fileSys.FindFilePath('#get_file3.closing_instructions#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(get_file3.closing_inst_date,'m/d/yy')#&nbsp;#TimeFormat(get_file3.closing_inst_time, "HH:mm")#</b></a>
                  <cfelse>
                  <B><font size=1 color=black face=verdana>N/A</B>
                </cfif> ---><B><font size=1 color=black face=verdana>N/A</B>
              </td>
              <td valign=center  align="center"><!--- <cfif #get_file3.pre_hud# neq "">
                  <A HREF="#fileSys.FindFilePath('#get_file3.pre_hud#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(get_file3.preHUD_upload_date,'m/d/yy')#&nbsp;#TimeFormat(get_file3.preHUD_upload_date, "HH:mm")#</b></a>
                  <cfelse>
                  <B><font size=1 color=black face=verdana>N/A</B>
                </cfif> ---><B><font size=1 color=black face=verdana>N/A</B>
              </td>
			<!--- Edit (start) Added by Synechron Development for ticket# 777 --->
				<td valign=center  align="center">		
				<!--- <cfset int_time_value = DateFormat(get_file3.closing_inst_date) & ' ' & TimeFormat(get_file3.closing_inst_time)>			
 					<cfif #get_file3.closing_instructions# neq "" and #get_file3.pre_hud# neq "">
						<cfset WorkingDate=CalculateWorkDaysObj.ElapsedTime(ParseDateTime(#int_time_value#),ParseDateTime(#get_file3.preHUD_upload_date#), #getlist3.prop_id#)>
						#Int(WorkingDate.EffectiveWorkmins)#				
					<cfelse>
                  		<B><font size=1 color=black face=verdana>N/A</B>
					</cfif> ---> <B><font size=1 color=black face=verdana>N/A</B>
				</td>
			<!--- Edit (end) Added by Synechron Development for ticket# 777 --->
<td valign=center  align="center"><!--- <cfif #get_file3.final_hud# neq "">
                  <A HREF="#fileSys.FindFilePath('#get_file3.final_HUD#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(get_file3.final_hud_date,'m/d/yy')#&nbsp;#TimeFormat(get_file3.final_hud_time, "HH:mm")#</b></a>
                  <cfelse>
                  <B><font size=1 color=black face=verdana>N/A</B>
                </cfif> ---><B><font size=1 color=black face=verdana>N/A</B>
              </td>
              <td valign=center  align="center"><a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#getlist3.prop_id#&user_id=0&company_id=0&a_trigger=0&code=P" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a> </td>
				<td valign=center  align="center">&nbsp;</td>
            </tr>
            <CFSET count = 1>
          </cfoutput>
          <cfif #r_count1# neq 0>
            <cfoutput>
              <tr>
                <td bgcolor="yellow" colspan = 12 width="100%" align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
                  <cfif #r_count1# neq 0>
                    #r_count1# are <b>SCHEDULED</b> for #DateFormat(ThisDate,'m/d/yyyy')#. See below
                  </cfif>
                </td>
              </tr>
            </cfoutput>
          </cfif>
          <cfoutput query="getList">
            <CFQUERY datasource="#request.dsn#" NAME="get_file">
            SELECT d.*, t.searchtype, t.seller_rep, t.ipname FROM doc_closer_title d, title t WHERE d.title_ID = #title_id#
			and d.title_id = t.title_id
            </CFQUERY>
            <cfquery datasource="#request.dsn#" NAME="get_company">
            Select company from companies where id = #getList.comp_id#
            </cfquery>
            <tr <cfif get_file.SearchType eq 'Purchase'>bgcolor="FFCC66"<cfelse>bgcolor="elelel"</cfif>>
              <td valign=center  align="center"><font size=1 color=black face=verdana> <b>
                <cfif #getlist.c_time# eq"">
                  N/A
                  <cfelse>
                  #TimeFormat(getlist.c_time, "h:mm tt")#
                </cfif>
                </B></font> </td>
              <td valign=center  align="center"><font size=1 color=black face=verdana><b> #getlist.b_fname# &nbsp #getlist.b_lname#</b> </td>
              <td valign=center  align=center valign=top>
              <FONT FACE=verdana SIZE=1 color="black">
              <a href="./title_report_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#getlist.title_id#&a_trigger=1&company_id=#comp_id#"target="prop_hud_pg2" onClick="window.open('','prop_hud_pg2','width=620,height=500,status=0,resizable=1,scrollbars=1')"><font size=1 color=blue face=verdana>#title_id#</font></a>
              </td>
              <td valign=center  align="center"><a href="./calendar_closing_info.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#getlist.title_id#&company_id=#getlist.comp_id#"><font size=1 color=blue face=verdana>View/Modify</font></a> </td>
              <td valign=center  align="center"><B><font size=1 color=black face=verdana>#get_company.company#</B> </td>
              <td valign=center align="center"><cfif  #getlist.fee# neq "">
                  <font size=1 color=black face=verdana><b>#getlist.fee#</FONT></B>
                  <cfelse>
                  <font size=1 color=black face=verdana><b>N/A</FONT></B>
                </cfif>
              </td>
              <td valign=center  align="center"><cfif #get_file.closing_instructions# neq "">
                  <A HREF="#fileSys.FindFilePath('#get_file.closing_instructions#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(get_file.closing_inst_date,'m/d/yy')#&nbsp;#TimeFormat(get_file.closing_inst_time, "HH:mm")#</b></a>
                  <cfelse>
                  <B><font size=1 color=black face=verdana>N/A</B>
                </cfif>
              </td>
              <td valign=center  align="center"><cfif #get_file.pre_hud# neq "">
                  <A HREF="#fileSys.FindFilePath('#get_file.pre_hud#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(get_file.preHUD_upload_date,'m/d/yy')#&nbsp;#TimeFormat(get_file.preHUD_upload_date, "HH:mm")#</b></a>
                  <cfelse>
                  <B><font size=1 color=black face=verdana>N/A</B>
                </cfif>
              </td>
			<!--- Edit (Start) Added by Synechron Development for ticket# 777 --->
				<td valign=center  align="center">		
				<cfset int_time_value = DateFormat(get_file.closing_inst_date) & ' ' & TimeFormat(get_file.closing_inst_time)>					
 					<cfif #get_file.closing_instructions# neq "" and #get_file.pre_hud# neq "">
						<cfset WorkingDate=CalculateWorkDaysObj.ElapsedTime(ParseDateTime(#int_time_value#),ParseDateTime(#get_file.preHUD_upload_date#), #getlist.title_id#)>
						#Int(WorkingDate.EffectiveWorkmins)#				
					<cfelse>
                  		<B><font size=1 color=black face=verdana>N/A</B>
					</cfif> 
				</td>
			<!--- Edit (End) Added by Synechron Development for ticket# 777 --->
<td valign=center  align="center"><cfif #get_file.final_hud# neq "">
                  <A HREF="#fileSys.FindFilePath('#get_file.final_HUD#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(get_file.final_hud_date,'m/d/yy')#&nbsp;#TimeFormat(get_file.final_hud_time, "HH:mm")#</b></a>
                  <cfelse>
                  <B><font size=1 color=black face=verdana>N/A</B>
                </cfif>
              </td>
              <td valign=center  align="center"><a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#getlist.title_id#&user_id=0&company_id=0&a_trigger=0&code=T" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a> </td>
				<td valign=center  align="center"><cfif get_file.seller_rep eq 'True'>X<cfelse>&nbsp;</cfif></td>
				<td valign=center  align="center"><font size=1 color=black face=verdana><b>#get_file.ipname#</b></font></td>
            </tr>
            <CFSET count = 1>
          </cfoutput>
          <!---Property--->
          <cfoutput query="getList4">
            <CFQUERY datasource="#request.dsn#" NAME="get_file4">
            SELECT d.*, p.searchtype FROM doc_closer_prop d, property p WHERE d.prop_ID = #prop_id#
			and d.prop_id = p.prop_id
            </CFQUERY>
            <cfquery datasource="#request.dsn#" NAME="get_company">
            Select company from companies where id = #getList4.comp_id#
            </cfquery>
            <tr <cfif get_file4.SearchType eq 'Purchase'>bgcolor="FFCC66"<cfelse>bgcolor="elelel"</cfif>>
              <td valign=center  align="center"><font size=1 color=black face=verdana> <b>
                <cfif #getlist4.c_time# eq"">
                  N/A
                  <cfelse>
                  #TimeFormat(getlist4.c_time, "h:mm tt")#
                </cfif>
                </B></font> </td>
              <td valign=center  align="center"><font size=1 color=black face=verdana><b> #getlist4.b_fname# &nbsp #getlist4.b_lname#</b> </td>
              <td valign=center  align=center valign=top>
              <FONT FACE=verdana SIZE=1 color="black">
              <a href="./prop_report_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#getlist4.prop_id#&a_trigger=1&company_id=#comp_id#"target="prop_hud_pg2" onClick="window.open('','prop_hud_pg2','width=620,height=500,status=0,resizable=1,scrollbars=1')"><font size=1 color=blue face=verdana>0232#prop_id#</font></a>
              </td>
              <td valign=center  align="center"><a href="./calendar_closing_info.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#getlist4.prop_id#&company_id=#getlist4.comp_id#"><font size=1 color=blue face=verdana>View/Modify</font></a> </td>
              <td valign=center  align="center"><B><font size=1 color=black face=verdana>#get_company.company#</B> </td>
              <td valign=center align="center"><cfif  #getlist4.fee# neq "">
                  <font size=1 color=black face=verdana><b>#getlist4.fee#</FONT></B>
                  <cfelse>
                  <font size=1 color=black face=verdana><b>N/A</FONT></B>
                </cfif>
              </td>
              <td valign=center  align="center"><!--- <cfif #get_file4.closing_instructions# neq "">
                  <A HREF="#fileSys.FindFilePath('#get_file4.closing_instructions#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(get_file4.closing_inst_date,'m/d/yy')#&nbsp;#TimeFormat(get_file4.closing_inst_time, "HH:mm")#</b></a>
                  <cfelse>
                  <B><font size=1 color=black face=verdana>N/A</B>
                </cfif> ---><font size=1 color=black face=verdana>N/A</B>
              </td>
              <td valign=center  align="center"><!--- <cfif #get_file4.pre_hud# neq "">
                  <A HREF="#fileSys.FindFilePath('#get_file4.pre_hud#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(get_file4.preHUD_upload_date,'m/d/yy')#&nbsp;#TimeFormat(get_file4.preHUD_upload_date, "HH:mm")#</b></a>
                  <cfelse>
                  <B><font size=1 color=black face=verdana>N/A</B>
                </cfif> ---><font size=1 color=black face=verdana>N/A</B>
              </td>
<td valign=center  align="center"><!--- <cfif #get_file4.final_hud# neq "">
                  <A HREF="#fileSys.FindFilePath('#get_file4.final_HUD#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(get_file4.final_hud_date,'m/d/yy')#&nbsp;#TimeFormat(get_file4.final_hud_time, "HH:mm")#</b></a>
                  <cfelse>
                  <B><font size=1 color=black face=verdana>N/A</B>
                </cfif> ---><font size=1 color=black face=verdana>N/A</B>
              </td>
              <td valign=center  align="center"><a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#getlist4.prop_id#&user_id=0&company_id=0&a_trigger=0&code=P" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a> </td>
				<td valign=center  align="center">&nbsp;</td>
            </tr>
            <CFSET count = 1>
          </cfoutput>
		  
         <CFSET zip_id_2 = #ListToArray(comp_id, ",")#>
          <CFSET cty_name_1 = ArrayNew(1)>
          <CFLOOP FROM="1" TO="#ArrayLen(zip_id_2)#" INDEX="MMM">
            <CFSET st_temp = #ListToArray(zip_id_2[MMM], "|")#>
            <CFSET cty_name_1[MMM] = #st_temp[1]#>
          </CFLOOP>
		  
          <CFLOOP FROM="1" TO="#ArrayLen(cty_name_1)#" INDEX="TTT">
            <!---Titles only--->
            <cfquery datasource="#request.dsn#" name="getList">
			select e.*, c.master_co_id, c.id From EventList e, Companies c where yearmonth = '#YearMonthDay#' AND (e.comp_id = #TTT# or e.comp_id IN (select id from Companies where master_co_id = #TTT#)
            and e.title_ID is not null)  and e.comp_id = c.ID order by e.c_time
            </cfquery>
            <!---Props--->
            <cfquery datasource="#request.dsn#" name="getList4">
            select * From EventList Where (YearMonth = '#YearMonthDay#') AND (comp_id = #TTT# or comp_id IN (select id from Companies where master_co_id = #TTT#)
            and prop_ID is not null) order by c_time

            </cfquery>
            <cfquery datasource="#request.dsn#" name="getList2">
            select * From Title_Closing_Order_Request a, EventList b where
            (a.request_date = '#YearMonthDay#' and b.yearmonth is null AND (b.comp_id = #TTT#) and a.title_id = b.title_id)
            or
            (a.request_date = '#YearMonthDay#' and b.yearmonth is null AND (b.comp_id IN (select id from Companies where master_co_id = #TTT#)) and a.title_id = b.title_id)
            </cfquery>
            <!---Property Orders--->
            <cfquery datasource="#request.dsn#" name="getList3">
            select * From Title_Closing_Order_Request_prop a, EventList b where
            (a.request_date = '#YearMonthDay#' and b.yearmonth is null AND (b.comp_id = #TTT#) and a.prop_id = b.prop_id)
            or
            (a.request_date = '#YearMonthDay#' and b.yearmonth is null AND b.comp_id IN (select id from Companies where master_co_id = #TTT#) and a.prop_id = b.prop_id)
            </cfquery>
            <CFQUERY datasource="#request.dsn#" NAME="read_comp">
            SELECT * FROM Companies WHERE ID = #cty_name_1[TTT]#
            </CFQUERY>
            <CFSET r_count = #getlist.recordcount# + #getlist2.recordcount# + #getlist3.recordcount# + #getlist4.recordcount#>
            <!---Event List Titles and Props--->
            <CFSET r_count1 = #getlist.recordcount# + + #getlist4.recordcount#>
            <!---Closing Table Titles and Props--->
            <CFSET r_count2 = #getlist2.recordcount# + + #getlist3.recordcount#>
            <cfoutput>
              <cfif #r_count# neq 0>
                <tr>
                  <td bgcolor="ffff00" colspan = 11 width="100%" align=center valign=top><FONT FACE=verdana SIZE=1 color="black"> Company: #read_comp.company#. Total of #r_count# records found for #DateFormat(ThisDate,'m/d/yyyy')# </td>
                </tr>
              </cfif>
              <cfif #getlist2.recordcount# neq 0 or #getlist3.recordcount# neq 0 >
                <tr>
                  <td bgcolor="ffffff" colspan = 11 width="100%" align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
                    <cfif #r_count2# neq 0>
                      #r_count2# are <b>REQUESTED</b> for #DateFormat(ThisDate,'m/d/yyyy')#. See below
                    </cfif>
                  </td>
                </tr>
              </cfif>
            </cfoutput>
			<cfoutput query="getList2">
              <CFQUERY datasource="#request.dsn#" NAME="get_file2">
              SELECT * FROM doc_closer_title WHERE title_ID = #title_id#
              </CFQUERY>
              <CFQUERY datasource="#request.dsn#" NAME="get_title">
              SELECT * FROM title WHERE title_ID = #title_id#
              </CFQUERY>
              <CFQUERY datasource="#request.dsn#" NAME="get_company2">
              SELECT company FROM companies WHERE id = #getlist2.c_comp_id#
              </CFQUERY>
              <tr <cfif get_title.SearchType eq 'Purchase'>bgcolor="FFCC66"<cfelse>bgcolor="elelel"</cfif>>
                <td valign="center"  align="center"><font size=1 color=black face=verdana> <b>
                  <cfif #getlist2.a_req_closing_time# eq"">
                    N/A 
                    <cfelse>
                    #TimeFormat(getlist2.a_req_closing_time, "h:mm tt")#
                  </cfif>
                  </B> </font> </td>
                <td valign="center" align="center"><font size=1 color=black face=verdana><b> #get_title.bfirstname1# &nbsp; #get_title.blastname1#</b> </td>
                <td valign=center  align=center valign=top>
                <FONT FACE=verdana SIZE=1 color="black">
                <a href="./title_report_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#getlist2.title_id#&a_trigger=1&company_id=#comp_id#"target="prop_hud_pg2" onClick="window.open('','prop_hud_pg2','width=620,height=500,status=0,resizable=1,scrollbars=1')"><font size=1 color=blue face=verdana>#title_id#</font></a>
                </td>
                <td valign=center  align="center"><a href="./TITLE_CLOSING_ORDER_REQUEST_VIEW_ONLY.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#getlist2.title_id#&company_id=#getlist2.comp_id#"><font size=1 color=blue face=verdana>View/Modify</font></a> </td>
                <td valign=center  align="center"> Company1#get_company2.company# </td>
                <td valign=center  align="center"><cfif  #getlist2.fee# neq "">
                    <font size=1 color=black face=verdana><b>#getlist2.fee#</FONT></B>
                    <cfelse>
                    <font size=1 color=black face=verdana><b>N/A</FONT></B>
                  </cfif>
                </td>
                <td valign=center  align="center"><cfif #get_file2.closing_instructions# neq "">
                    <A HREF="#fileSys.FindFilePath('#get_file2.closing_instructions#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(get_file2.closing_inst_date,'m/d/yy')#&nbsp;#TimeFormat(get_file2.closing_inst_time, "HH:mm")#</b></a>
                    <cfelse>
                    <B><font size=1 color=black face=verdana>N/A</B>
                  </cfif>
                </td>
                <td valign=center  align="center"><cfif #get_file2.final_hud# neq "">
                    <A HREF="#fileSys.FindFilePath('#get_file2.final_HUD#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(get_file2.final_hud_date,'m/d/yy')#&nbsp;#TimeFormat(get_file2.final_hud_time, "HH:mm")#</b></a>
                    <cfelse>
                    <B><font size=1 color=black face=verdana>N/A</B>
                  </cfif>
                </td>
                <td valign=center  align="center"><a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#getlist2.title_id#&user_id=0&company_id=0&a_trigger=0&code=T" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a> </td>
				<td valign=center  align="center"><cfif get_title.seller_rep eq 'True'>X<cfelse>&nbsp;</cfif></td>
				<td valign=center  align="center"><font size=1 color=black face=verdana><b>#get_title.ipname#</b></font></td>
              </tr>
            </cfoutput>
            <!---Property--->
            <cfoutput query="getList3">
              <CFQUERY datasource="#request.dsn#" NAME="get_file3">
              SELECT * FROM doc_closer_prop WHERE prop_ID = #prop_id#
              </CFQUERY>
              <CFQUERY datasource="#request.dsn#" NAME="get_title">
              SELECT * FROM property WHERE prop_ID = #prop_id#
              </CFQUERY>
              <CFQUERY datasource="#request.dsn#" NAME="get_company3">
              SELECT company FROM companies WHERE id = #getlist3.c_comp_id#
              </CFQUERY>
              <tr <cfif get_title.SearchType eq 'Purchase'>bgcolor="FFCC66"<cfelse>bgcolor="elelel"</cfif>>
                <td valign=center  align="center"><font size=1 color=black face=verdana> <b>
                  <cfif #getlist3.a_req_closing_time# eq"">
                    N/A
                    <cfelse>
                    #TimeFormat(getlist3.a_req_closing_time, "h:mm tt")#
                  </cfif>
                  </B> </font> </td>
                <td valign=center  align="center"><font size=1 color=black face=verdana><b> #get_title.bfirstname1# &nbsp; #get_title.blastname1#</b> </td>
                <td valign=center  align=center valign=top>
                <FONT FACE=verdana SIZE=1 color="black">
                <a href="./prop_report_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#getlist3.prop_id#&a_trigger=1&company_id=#comp_id#"target="prop_hud_pg2" onClick="window.open('','prop_hud_pg2','width=620,height=500,status=0,resizable=1,scrollbars=1')"><font size=1 color=blue face=verdana>#prop_id#</font></a>
                </td>
                <td valign=center  align="center"><a href="./PROP_CLOSING_ORDER_REQUEST_VIEW_ONLY.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#getlist3.prop_id#&company_id=#getlist3.comp_id#"><font size=1 color=blue face=verdana>View/Modify</font></a> </td>
                <td valign=center  align="center"> Company1#get_company3.company# </td>
                <td valign=center  align="center"><cfif  #getlist3.fee# neq "">
                    <font size=1 color=black face=verdana><b>#getlist3.fee#</FONT></B>
                    <cfelse>
                    <font size=1 color=black face=verdana><b>N/A</FONT></B>
                  </cfif>
                </td>
                <td valign=center  align="center"><cfif #get_file3.closing_instructions# neq "">
                    <A HREF="#fileSys.FindFilePath('#get_file3.closing_instructions#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(get_file3.closing_inst_date,'m/d/yy')#&nbsp;#TimeFormat(get_file3.closing_inst_time, "HH:mm")#</b></a>
                    <cfelse>
                    <B><font size=1 color=black face=verdana>N/A</B>
                  </cfif>
                </td>
                <td valign=center  align="center"><cfif #get_file3.final_hud# neq "">
                    <A HREF="#fileSys.FindFilePath('#get_file3.final_HUD#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(get_file3.final_hud_date,'m/d/yy')#&nbsp;#TimeFormat(get_file3.final_hud_time, "HH:mm")#</b></a>
                    <cfelse>
                    <B><font size=1 color=black face=verdana>N/A</B>
                  </cfif>
                </td>
                <td  valign=center  align="center"><a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#getlist3.prop_id#&user_id=0&company_id=0&a_trigger=0&code=P" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a> </td>
				<td valign=center  align="center">&nbsp;</td>
              </tr>
            </cfoutput> <cfoutput>
              <cfif #getlist.recordcount# neq 0 or #getlist4.recordcount# neq 0>
                <tr>
                  <td bgcolor="white" colspan = 12  align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
                    <cfif #r_count1# neq 0>
                      #r_count1# are<b>SCHEDULED </b> for #DateFormat(ThisDate,'m/d/yyyy')#. See below
                    </cfif>
                  </td>
                </tr>
              </cfif>
            </cfoutput>
            <!---Title--->
            <cfoutput query="getList">
              <CFQUERY datasource="#request.dsn#" NAME="get_file">
              SELECT d.*, t.searchtype, t.seller_rep, t.ipname FROM doc_closer_title d, title t WHERE d.title_ID = #title_id#
			  and d.title_id = t.title_id
              </CFQUERY>
              <CFQUERY datasource="#request.dsn#" NAME="get_company">
              SELECT company FROM companies WHERE id = #getList.comp_id#
              </CFQUERY>
              <tr <cfif get_file.SearchType eq 'Purchase'>bgcolor="FFCC66"<cfelse>bgcolor="elelel"</cfif>>
                <td valign=center  align="center"><font size=1 color=black face=verdana> <b>
                  <cfif #getlist.c_time# eq"">
                    N/A
                    <cfelse>
                    #TimeFormat(getlist.c_time, "h:mm tt")#
                  </cfif>
                  </B></font> </td>
                <td valign=center  align="center"><font size=1 color=black face=verdana><b> #getlist.b_fname# &nbsp; #getlist.b_lname#</b> </td>
                <td valign=center  align=center valign=top>
                <FONT FACE=verdana SIZE=1 color="black">
                <a href="./title_report_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#getlist.title_id#&a_trigger=1&company_id=#comp_id#"target="prop_hud_pg2" onClick="window.open('','prop_hud_pg2','width=620,height=500,status=0,resizable=1,scrollbars=1')"><font size=1 color=blue face=verdana>#title_id#</font></a>
                </td>
                <td valign=center  align="center"><a href="./calendar_closing_info.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#getlist.title_id#&company_id=#getlist.comp_id#"><font size=1 color=blue face=verdana>View/Modify</font></a> </td>
                <td valign=center  align="center"><font size=1 color=black face=verdana><b>#get_company.company#</FONT></B> </td>
                <td valign=center  align="center"><cfif  #getlist.fee# neq "">
                    <font size=1 color=black face=verdana><b>#getlist.fee#</FONT></B>
                    <cfelse>
                    <font size=1 color=black face=verdana><b>N/A</FONT></B>
                  </cfif>
                </td>
                <td valign=center  align="center"><cfif #get_file.closing_instructions# neq "">
                    <A HREF="#fileSys.FindFilePath('#get_file.closing_instructions#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(get_file.closing_inst_date,'m/d/yy')#&nbsp;#TimeFormat(get_file.closing_inst_time, "HH:mm")#</b></a>
                    <cfelse>
                    <B><font size=1 color=black face=verdana>N/A</B>
                  </cfif>
                </td>
                <td valign=center  align="center"><cfif #get_file.final_hud# neq "">
                    <A HREF="#fileSys.FindFilePath('#get_file.final_HUD#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(get_file.final_hud_date,'m/d/yy')#&nbsp;#TimeFormat(get_file.final_hud_time, "HH:mm")#</b></a>
                    <cfelse>
                    <B><font size=1 color=black face=verdana>N/A</B>
                  </cfif>
                </td>
                <td valign=center  align="center"><a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#getlist.title_id#&user_id=0&company_id=0&a_trigger=0&code=T" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a> </td>
				<td valign=center  align="center"><cfif get_file.seller_rep eq 'True'>X<cfelse>&nbsp;</cfif></td>
				<td valign=center  align="center"><font size=1 color=black face=verdana><b>#get_file.ipname#</b></font></td>

              </tr>
            </cfoutput>
            <!---End of Title--->
            <!---Property--->
            <cfoutput query="getList4">
              <CFQUERY datasource="#request.dsn#" NAME="get_file4">
              SELECT d.*, p.searchtype FROM doc_closer_prop d, Property p WHERE d.prop_ID = #getList4.prop_id#
			  and d.prop_id = p.prop_id
              </CFQUERY>
              <CFQUERY datasource="#request.dsn#" NAME="get_company4">
              SELECT company FROM companies WHERE id = #getList4.comp_id#
              </CFQUERY>
              <tr <cfif get_file4.SearchType eq 'Purchase'>bgcolor="FFCC66"<cfelse>bgcolor="elelel"</cfif>>
                <td valign=center  align="center"><font size=1 color=black face=verdana> <b>
                  <cfif #getlist4.c_time# eq"">
                    N/A
                    <cfelse>
                    #TimeFormat(getlist4.c_time, "h:mm tt")#
                  </cfif>
                  </B></font> </td>
                <td valign=center  align="center"><font size=1 color=black face=verdana><b> #getlist4.b_fname# &nbsp; #getlist4.b_lname#</b> </td>
                <td bgcolor="elelel" valign=center  align=center valign=top>
                <FONT FACE=verdana SIZE=1 color="black">
                <a href="./prop_report_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#getlist4.prop_id#&a_trigger=1&company_id=#comp_id#"target="prop_hud_pg2" onClick="window.open('','prop_hud_pg2','width=620,height=500,status=0,resizable=1,scrollbars=1')"><font size=1 color=blue face=verdana>0232#prop_id#</font></a>
                </td>
                <td valign=center  align="center"><a href="./calendar_closing_info.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#getlist4.prop_id#&company_id=#getlist4.comp_id#"><font size=1 color=blue face=verdana>View/Modify</font></a> </td>
                <td valign=center  align="center"><font size=1 color=black face=verdana><b>#get_company4.company#</FONT></B> </td>
                <td valign=center  align="center"><cfif  #getlist4.fee# neq "">
                    <font size=1 color=black face=verdana><b>#getlist4.fee#</FONT></B>
                    <cfelse>
                    <font size=1 color=black face=verdana><b>N/A</FONT></B>
                  </cfif>
                </td>
                <td valign=center  align="center"><cfif #get_file4.closing_instructions# neq "">
                    <A HREF="#fileSys.FindFilePath('#get_file4.closing_instructions#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(get_file4.closing_inst_date,'m/d/yy')#&nbsp;#TimeFormat(get_file4.closing_inst_time, "HH:mm")#</b></a>
                    <cfelse>
                    <B><font size=1 color=black face=verdana>N/A</B>
                  </cfif>
                </td>
                <td valign=center  align="center"><cfif #get_file4.final_hud# neq "">
                    <A HREF="#fileSys.FindFilePath('#get_file4.final_HUD#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(get_file4.final_hud_date,'m/d/yy')#&nbsp;#TimeFormat(get_file4.final_hud_time, "HH:mm")#</b></a>
                    <cfelse>
                    <B><font size=1 color=black face=verdana>N/A</B>
                  </cfif>
                </td>
                <td valign=center  align="center"><a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#getlist4.prop_id#&user_id=0&company_id=0&a_trigger=0&code=P" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a> </td>
				<td valign=center  align="center">&nbsp;</td>
              </tr>
            </cfoutput>
            <!---End of Property--->
			</CFLOOP> --->
          <!---If all companies were selected --->
          <cfelse>
<cfset company_id_list = ''>

<cfif IsDefined("session.is_logged_in") and (session.va_admin eq 1)>
<cfquery datasource="#request.dsn#" name="get_CompaniesList">
select * From Companies where intSales IN (select ID from First_admin where va_employee = 1) 
</cfquery>
<cfset company_id_list = ValueList(get_CompaniesList.ID, ",")>
<cfelseif IsDefined("session.is_logged_in") and (session.va_employee eq 1)>
<cfquery datasource="#request.dsn#" name="get_CompaniesList">
select * From Companies where intSales = '#session.ft_user_id#'
</cfquery>
<cfset company_id_list = ValueList(get_CompaniesList.ID, ",")>
<cfelseif IsDefined("session.is_logged_in") and (session.ft_fairfax_employee eq 1)>
<cfquery datasource="#request.dsn#" name="get_CompaniesList">
select * From Companies where intSales = '#session.ft_user_id#'
</cfquery>
<cfset company_id_list = ValueList(get_CompaniesList.ID, ",")>
</cfif>




<cfif IsDefined("session.is_logged_in") and (session.ft_fairfax_admin eq 1)>
<cfquery datasource="#request.dsn#" name="get_CompaniesList">
select * From Companies where intSales IN (select ID from First_admin where ft_fairfax_employee = 1) 
</cfquery>
<cfset company_id_list = ValueList(get_CompaniesList.ID, ",")>
<cfelseif IsDefined("session.is_logged_in") and (session.ft_fairfax_employee eq 1)>
<cfquery datasource="#request.dsn#" name="get_CompaniesList">
select * From Companies where intSales = '#session.ft_user_id#'
</cfquery>
<cfset company_id_list = ValueList(get_CompaniesList.ID, ",")>
</cfif>


<cfif session.ft_user_id eq 319 or session.ft_user_id eq 320 or session.ft_user_id eq 324 or session.ft_user_id eq 426 or session.ft_user_id eq 366 or getuser.role_id eq 24>
<cfquery datasource="#request.dsn#" name="get_CompaniesList">
select * From Companies where intSales = '#session.ft_user_id#' 
</cfquery>
<cfset company_id_list = ValueList(get_CompaniesList.ID, ",")>
</cfif>


<cfif IsDefined("session.is_logged_in") and (session.mi_admin eq 1)>
<cfquery datasource="#request.dsn#" name="get_CompaniesList">
select * From Companies where (intSales in (select ID from first_admin where role_id = 24 and mi_employee = 'True'))
    <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
    or id in (9711,10436,11086,11100,11087)
    </cfif>
</cfquery>
<cfset company_id_list = ValueList(get_CompaniesList.ID, ",")>
</cfif>

<cfif IsDefined("session.is_logged_in") and (session.mo_admin eq 1)>
<cfquery datasource="#request.dsn#" name="get_CompaniesList">
select * From Companies where (intSales in (select ID from first_admin where role_id = 24 and mo_employee = 'True'))
    <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
    or id in (9711,10436,11086,11100,11087)
    </cfif>
</cfquery>
<cfset company_id_list = ValueList(get_CompaniesList.ID, ",")>
</cfif>

<cfif IsDefined("session.is_logged_in") and (session.mi_flushing_admin eq 1)>
<cfquery datasource="#request.dsn#" name="get_CompaniesList">
select * From Companies where (intSales in (select ID from first_admin where role_id = 24 and mi_flushing_employee = 'True'))
    <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
    or id in (9711,10436,11086,11100,11087)
    </cfif>
</cfquery>
<cfset company_id_list = ValueList(get_CompaniesList.ID, ",")>
</cfif>

<cfif IsDefined("session.is_logged_in") and (session.tx_admin eq 1)>
<cfquery datasource="#request.dsn#" name="get_CompaniesList">
select * From Companies where (intSales in (select ID from first_admin where role_id = 24 and tx_employee = 'True'))
    <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
    or id in (9711,10436,11086,11100,11087)
    </cfif>
</cfquery>
<cfset company_id_list = ValueList(get_CompaniesList.ID, ",")>
</cfif>


<cfif session.ft_user_id eq 327>
<cfquery datasource="#request.dsn#" name="get_CompaniesList">
select * From Companies where comp_id = 3276 
</cfquery>
<cfset company_id_list = 3276>
</cfif>


<cfif session.ft_user_id eq 339>
<cfquery datasource="#request.dsn#" name="get_moreCompaniesList">
select * From Companies where team_id = 21
</cfquery>
<cfset company_id_list = ListAppend(company_id_list,ValueList(get_moreCompaniesList.ID, ","),",")>
</cfif>


<cfif session.ft_user_id eq 322>
<cfquery datasource="#request.dsn#" name="get_moreCompaniesList">
select * From Companies where test_account <> 1 and streamline_client <> 1
</cfquery>
<cfset company_id_list = ListAppend(company_id_list,ValueList(get_moreCompaniesList.ID, ","),",")>
</cfif>


<cfif Len(company_id_list) eq 0>
<cfset company_id_list = 9999999>
</cfif>


          <cfquery datasource="#request.dsn#" name="getList">
          select e.*, t.comp_id From EventList e, Title t Where (e.YearMonth = '#YearMonthDay#')
		  <!--- Carrie Rico's stuff --->
		  <cfif session.ft_user_id eq 327>
          and t.comp_id in (3276)
		  <cfelseif session.mi_employee eq 1 or session.mo_employee eq 1 or session.mi_flushing_employee eq 1 or session.ft_fairfax_employee eq 1 or session.tx_employee eq 1 or session.ft_user_id eq 366 or session.va_employee eq 1 or session.va_admin eq 1 or getuser.role_id eq 24>
          and (t.comp_id in (#company_id_list#)  <cfif session.ft_user_id eq 630 or session.ft_user_id eq 631> or t.comp_id in (Select ID from companies where (team_id = 5 or ID = 12324))</cfif>)
    <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
    or t.comp_id in (9711,10436,11086,11100,11087)
    </cfif>
          </cfif>
          <!---Cindy Mills --->
          <cfif #url.uid# EQ "93">
            and (t.comp_id = 211 or t.comp_id = 227 or t.comp_id = 231 or t.comp_id = 232 or t.comp_id = 251 or t.comp_id = 209 or t.comp_id = 174 or t.comp_id = 178 or t.comp_id = 141 OR t.comp_id = 205)
          </cfif>
          <!---Nita Farrow --->
          <cfif #url.uid# eq "167">
            and t.comp_id = 100
          </cfif>
          <!---Rebecca Lott --->
          <cfif #url.uid# EQ "203">
            and (t.comp_id = 224 or t.comp_id = 465 or t.comp_id = 522 or t.comp_id = 333 or t.comp_id = 523)
          </cfif>
		  and t.title_id = e.title_id
          and e.title_id is not null order by e.c_time
          </cfquery>
          <CFIF #getlist.recordcount# gte 1>
            <CFQUERY datasource="#request.dsn#" NAME="get_company">
            SELECT company FROM companies WHERE id = #getlist.comp_id#
            </CFQUERY>
          </CFIF>
          <cfquery datasource="#request.dsn#" name="getList4">
          select * From EventList Where (YearMonth = '#YearMonthDay#')
          <!--- Carrie Rico's stuff --->
		  <cfif session.ft_user_id eq 327>
          and comp_id in (3276)
          </cfif>
		  <cfif session.va_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_employee eq 1 or session.mo_employee eq 1 or session.mi_flushing_employee eq 1 or session.tx_employee eq 1 or session.ft_user_id eq 366 or session.va_admin eq 1 or getuser.role_id eq 24>
          and (comp_id in (#company_id_list#)  <cfif session.ft_user_id eq 630 or session.ft_user_id eq 631> or comp_id in (Select ID from companies where (team_id = 5 or ID = 12324))</cfif>)
     <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
    or comp_id in (9711,10436,11086,11100,11087)
    </cfif>
         </cfif>
		  <!---Cindy Mills --->
          <cfif #url.uid# EQ "93">
            and (comp_id = 211 or comp_id = 227 or comp_id = 231 or comp_id = 232 or comp_id = 251 or comp_id = 209 or comp_id = 174 or comp_id = 178 or comp_id = 141 OR comp_id = 205)
          </cfif>
          <!---Nita Farrow --->
          <cfif #url.uid# eq "167">
            and comp_id = 100
          </cfif>
          <!---Rebecca Lott --->
          <cfif #url.uid# EQ "203">
            and (comp_id = 224 or comp_id = 465 or comp_id = 522 or comp_id = 333 or comp_id = 523)
          </cfif>
          and prop_id is not null order by c_time
          </cfquery>
          <CFIF #getlist4.recordcount# gte 1>
            <CFQUERY datasource="#request.dsn#" NAME="get_company4">
            SELECT company FROM companies WHERE id = #getlist4.comp_id#
            </CFQUERY>
          </CFIF>
          <cfquery datasource="#request.dsn#" name="getList2">
          select t.title_id, a.*, b.* From Title_Closing_Order_Request a, EventList b, title t where a.title_id = b.title_id and t.title_id = b.title_id and a.request_date = #ThisDate# and b.yearmonth is null
		  <!--- Carrie Rico's stuff --->
		  <cfif session.ft_user_id eq 327>
          and b.comp_id in (3276)
          </cfif>
		  <cfif session.va_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_employee eq 1 or session.mo_employee eq 1 or session.mi_flushing_employee eq 1 or session.tx_employee eq 1 or session.ft_user_id eq 366 or session.va_admin eq 1 or getuser.role_id eq 24>
          and (t.comp_id in (#company_id_list#)  <cfif session.ft_user_id eq 630 or session.ft_user_id eq 631> or t.comp_id in (Select ID from companies where (team_id = 5 or ID = 12324))</cfif>)
     <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
    or t.comp_id in (9711,10436,11086,11100,11087)
    </cfif>
          </cfif>
          <!---Cindy Mills --->
          <cfif #url.uid# EQ "93">
            and (b.comp_id = 211 or b.comp_id = 227 or b.comp_id = 231 or b.comp_id = 232 or b.comp_id = 251 or b.comp_id = 209 or b.comp_id = 174 or b.comp_id = 178 or b.comp_id = 141 OR b.comp_id = 205)
          </cfif>
          <!---Nita Farrow --->
          <cfif #url.uid# eq "167">
            and b.comp_id = 100
          </cfif>
          <!---Rebecca Lott --->
          <cfif #url.uid# EQ "203">
            and (comp_id = 224 or comp_id = 465 or comp_id = 522 or comp_id = 333 or comp_id = 523)
          </cfif>
          order by b.c_time
          </cfquery>
          <cfquery datasource="#request.dsn#" name="getList3">
          select * From Title_Closing_Order_Request_Prop a, EventList b where a.prop_id = b.prop_id and a.request_date = '#YearMonthDay#' and b.yearmonth is null
		  <!--- Carrie Rico's stuff --->
		  <cfif session.ft_user_id eq 327>
          and b.comp_id in (3276)
		  <cfelseif session.va_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_employee eq 1 or session.mo_employee eq 1 or session.mi_flushing_employee eq 1 or session.tx_employee eq 1 or session.ft_user_id eq 366 or session.va_admin eq 1 or getuser.role_id eq 24>
          and (b.comp_id in (#company_id_list#)  <cfif session.ft_user_id eq 630 or session.ft_user_id eq 631> or b.comp_id in (Select ID from companies where (team_id = 5 or ID = 12324))</cfif>)
     <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
    or b.comp_id in (9711,10436,11086,11100,11087)
    </cfif>
          </cfif>
          <!---Cindy Mills --->
          <cfif #url.uid# EQ "93">
            and (b.comp_id = 211 or b.comp_id = 227 or b.comp_id = 231 or b.comp_id = 232 or b.comp_id = 251 or b.comp_id = 209 or b.comp_id = 174 or b.comp_id = 178 or b.comp_id = 141 OR b.comp_id = 205)
          </cfif>
          <!---Rebecca Lott --->
          <cfif #url.uid# EQ "203">
            and (comp_id = 224 or comp_id = 465 or comp_id = 522 or comp_id = 333 or comp_id = 523)
          </cfif>
          <!---Nita Farrow --->
          <cfif #url.uid# eq "167">
            and b.comp_id = 100
          </cfif>
          order by b.c_time
          </cfquery>
          <cfoutput>
            <CFSET r_count = #getlist.recordcount# + #getlist2.recordcount# + #getlist3.recordcount# + #getlist4.recordcount#>
            <CFSET r_count2 = #getlist2.recordcount# + #getlist3.recordcount# >
            <CFSET r_count1 = #getlist.recordcount# + #getlist4.recordcount# >
            <tr>
              <td bgcolor="00ff00" colspan = 12 width="100%" align=center valign=top><FONT FACE=verdana SIZE=1 color="black"> Company: ALL. Total of #r_count# records found for #DateFormat(ThisDate,'m/d/yyyy')# </td>
            </tr>
            <cfif #r_count2# neq 0>
              <tr>
                <td bgcolor="yellow" colspan = 12 width="100%" align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
                  <cfif #r_count2# neq 0>
                    #r_count2# are <b>REQUESTED</b> for #DateFormat(ThisDate,'m/d/yyyy')#. See below 
                  </cfif>
                </td>
              </tr>
            </cfif>
          </cfoutput>
          <!---Title--->
		  
          <cfoutput query="getList2">
            <CFQUERY datasource="#request.dsn#" NAME="get_file2">
            SELECT * FROM doc_closer_title WHERE title_ID = #title_id#
            </CFQUERY>
            <CFQUERY datasource="#request.dsn#" NAME="get_title">
            SELECT * FROM title WHERE title_ID = #title_id#
            </CFQUERY>
            <CFQUERY datasource="#request.dsn#" NAME="get_company2">
            SELECT company FROM companies WHERE id = #get_title.comp_id#
            </CFQUERY>
            <tr <cfif get_title.SearchType eq 'Purchase'>bgcolor="FFCC66"<cfelse>bgcolor="white"</cfif>>
              <td valign=center  align="center"><font size=1 color=black face=verdana> <b>
                <cfif #getlist2.a_req_closing_time# eq"">
                  N/A
                  <cfelse>
                  #TimeFormat(getlist2.a_req_closing_time, "h:mm tt")#
                </cfif>
                </B></font> </td>
              <td valign=center  align="center"><font size=1 color=black face=verdana><b> #get_title.bfirstname1# &nbsp; #get_title.blastname1#</b> </td>
              <td valign=center  align=center valign=top>
              <FONT FACE=verdana SIZE=1 color="black">
              <a href="./title_report_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#getlist2.title_id#&a_trigger=1&company_id=#comp_id#"target="prop_hud_pg2" onClick="window.open('','prop_hud_pg2','width=620,height=500,status=0,resizable=1,scrollbars=1')"><font size=1 color=blue face=verdana>#title_id#</font></a>
              </td>
              <td valign=center  align="center"><a href="./TITLE_CLOSING_ORDER_REQUEST_VIEW_ONLY.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#getlist2.title_id#&company_id=#getlist2.comp_id#"><font size=1 color=blue face=verdana>View/Modify</font></a> </td>
              <td valign=center  align="center"><font size=1 color=black face=verdana><b>#get_company2.company#</FONT></B> </td>
              <td valign=center  align="center"><cfif  #getlist2.fee# neq "">
                  <font size=1 color=black face=verdana><b>#getlist2.fee#</FONT></B>
                  <cfelse>
                  <font size=1 color=black face=verdana><b>N/A</FONT></B>
                </cfif>
              </td>
              <td valign=center  align="center"><cfif #get_file2.closing_instructions# neq "">
                  <A HREF="#fileSys.FindFilePath('#get_file2.closing_instructions#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(get_file2.closing_inst_date,'m/d/yy')#&nbsp;#TimeFormat(get_file2.closing_inst_time, "HH:mm")#</b></a>
                  <cfelse>
                  <B><font size=1 color=black face=verdana>N/A</B>
                </cfif>
              </td>
              <td valign=center  align="center"><cfif #get_file2.pre_hud# neq "">
                  <A HREF="#fileSys.FindFilePath('#get_file2.pre_hud#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(get_file2.preHUD_upload_date,'m/d/yy')#&nbsp;#TimeFormat(get_file2.preHUD_upload_date, "HH:mm")#</b></a>
                  <cfelse>
                  <B><font size=1 color=black face=verdana>N/A</B>
                </cfif>
              </td>
				<!--- Edit (Start) Added by Synechron Development for ticket# 777 --->
				<td valign=center  align="center">			
				<cfset int_time_value = DateFormat(get_file2.closing_inst_date) & ' ' & TimeFormat(get_file2.closing_inst_time)>		
 					<cfif #get_file2.closing_instructions# neq "" and #get_file2.pre_hud# neq "">
						<cfset WorkingDate=CalculateWorkDaysObj.ElapsedTime(ParseDateTime(#int_time_value#),ParseDateTime(#get_file2.preHUD_upload_date#), #getlist2.title_id#)>
						#Int(WorkingDate.EffectiveWorkmins)#				
					<cfelse>
                  		<B><font size=1 color=black face=verdana>N/A</B>
					</cfif> 
				</td>
				<!--- Edit (end) Added by Synechron Development for ticket# 777 --->
<td valign=center  align="center"><cfif #get_file2.final_hud# neq "">
                  <A HREF="#fileSys.FindFilePath('#get_file2.final_HUD#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(get_file2.final_hud_date,'m/d/yy')#&nbsp;#TimeFormat(get_file2.final_hud_time, "HH:mm")#</b></a>
                  <cfelse>
                  <B><font size=1 color=black face=verdana>N/A</B>
                </cfif>
              </td>
              <td valign=center  align="center"><a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#getlist2.title_id#&user_id=0&company_id=0&a_trigger=0&code=T" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a> </td>
				<td valign=center  align="center"><cfif get_title.seller_rep eq 'True'>X<cfelse>&nbsp;</cfif></td>
				<td valign=center  align="center"><font size=1 color=black face=verdana><b>#get_title.ipname#</b></font></td>
            </tr>
            <CFSET count = 1>
          </cfoutput>
          <!---Property--->
          <cfoutput query="getList3">
            <CFQUERY datasource="#request.dsn#" NAME="get_file3">
            SELECT * FROM doc_closer_prop WHERE prop_ID = #prop_id#
            </CFQUERY>
            <CFQUERY datasource="#request.dsn#" NAME="get_title">
            SELECT * FROM property WHERE prop_ID = #prop_id#
            </CFQUERY>
            <CFQUERY datasource="#request.dsn#" NAME="get_company3">
            SELECT company FROM companies WHERE id = #get_title.comp_id#
            </CFQUERY>
            <tr <cfif get_title.SearchType eq 'Purchase'>bgcolor="FFCC66"<cfelse>bgcolor="white"</cfif>>
              <td valign=center  align="center"><font size=1 color=black face=verdana> <b>
                <cfif #getlist3.a_req_closing_time# eq"">
                  N/A
                  <cfelse>
                  #TimeFormat(getlist3.a_req_closing_time, "h:mm tt")#
                </cfif>
                </B></font> </td>
              <td valign=center  align="center"><font size=1 color=black face=verdana><b> #get_title.bfirstname1# &nbsp; #get_title.blastname1#</b> </td>
              <td valign=center  align=center valign=top>
              <FONT FACE=verdana SIZE=1 color="black">
              <a href="./prop_report_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#getlist3.prop_id#&a_trigger=1&company_id=#comp_id#"target="prop_hud_pg2" onClick="window.open('','prop_hud_pg2','width=620,height=500,status=0,resizable=1,scrollbars=1')"><font size=1 color=blue face=verdana>0232#prop_id#</font></a>
              </td>
              <td valign=center  align="center"><a href="./prop_CLOSING_ORDER_REQUEST_VIEW_ONLY.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#getlist3.prop_id#&company_id=#getlist3.comp_id#"><font size=1 color=blue face=verdana>View/Modify</font></a> </td>
              <td valign=center  align="center"><font size=1 color=black face=verdana><b>#get_company3.company#</FONT></B> </td>
              <td valign=center  align="center"><cfif  #getlist3.fee# neq "">
                  <font size=1 color=black face=verdana><b>#getlist3.fee#</FONT></B>
                  <cfelse>
                  <font size=1 color=black face=verdana><b>N/A</FONT></B>
                </cfif>
              </td>
              <td valign=center  align="center"><!--- <cfif #get_file3.closing_instructions# neq "">
                  <A HREF="#fileSys.FindFilePath('#get_file3.closing_instructions#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(get_file3.closing_inst_date,'m/d/yy')#&nbsp;#TimeFormat(get_file3.closing_inst_time, "HH:mm")#</b></a>
                  <cfelse>
                  <B><font size=1 color=black face=verdana>N/A</B>
                </cfif> ---><B><font size=1 color=black face=verdana>N/A</B>
              </td>
              <td valign=center  align="center"><!--- <cfif #get_file3.pre_hud# neq "">
                  <A HREF="#fileSys.FindFilePath('#get_file3.pre_hud#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(get_file3.preHUD_upload_date,'m/d/yy')#&nbsp;#TimeFormat(get_file3.preHUD_upload_date, "HH:mm")#</b></a>
                  <cfelse>
                  <B><font size=1 color=black face=verdana>N/A</B>
                </cfif> ---><B><font size=1 color=black face=verdana>N/A</B>
              </td>
				<!--- Edit (Start) Added by Synechron Development for ticket# 777 --->
				<td valign=center  align="center">	
				<!--- <cfset int_time_value = DateFormat(get_file3.closing_inst_date) & ' ' & TimeFormat(get_file3.closing_inst_time)>					
 					<cfif #get_file3.closing_instructions# neq "" and #get_file3.pre_hud# neq "">
						<cfset WorkingDate=CalculateWorkDaysObj.ElapsedTime(ParseDateTime(#int_time_value#),ParseDateTime(#get_file3.preHUD_upload_date#), #getlist3.prop_id#)>
						#Int(WorkingDate.EffectiveWorkmins)#				
					<cfelse>
                  		<B><font size=1 color=black face=verdana>N/A</B>
					</cfif> ---> <B><font size=1 color=black face=verdana>N/A</B>
				</td>
			<!--- Edit (End) Added by Synechron Development for ticket# 777 --->
<td valign=center  align="center"><!--- <cfif #get_file3.final_hud# neq "">
                  <A HREF="#fileSys.FindFilePath('#get_file3.final_HUD#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(get_file3.final_hud_date,'m/d/yy')#&nbsp;#TimeFormat(get_file3.final_hud_time, "HH:mm")#</b></a>
                  <cfelse>
                  <B><font size=1 color=black face=verdana>N/A</B>
                </cfif> ---><B><font size=1 color=black face=verdana>N/A</B>
              </td>
              <td valign=center  align="center"><a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#getlist3.prop_id#&user_id=0&company_id=0&a_trigger=0&code=P" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a> </td>
				<td valign=center  align="center">&nbsp;</td>
            </tr>
            <CFSET count = 1>
          </cfoutput>
          <cfif #r_count1# neq 0>
            <cfoutput>
              <tr>
                <td bgcolor="yellow" colspan = 12 width="100%" align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
                  <cfif #r_count1# neq 0>
                    #r_count1# are <b>SCHEDULED</b> for #DateFormat(ThisDate,'m/d/yyyy')#. See below
                  </cfif>
                </td>
              </tr>
            </cfoutput>
          </cfif>
          <cfoutput query="getList">
            <CFQUERY datasource="#request.dsn#" NAME="get_file">
            SELECT d.*, t.searchtype, t.seller_rep, t.ipname FROM doc_closer_title d, title t WHERE d.title_ID = #title_id#
			and d.title_id = t.title_id
            </CFQUERY>
            <cfquery datasource="#request.dsn#" NAME="get_company">
            Select company from companies where id = #getList.comp_id#
            </cfquery>
            <tr <cfif get_file.SearchType eq 'Purchase'>bgcolor="FFCC66"<cfelse>bgcolor="elelel"</cfif>>
              <td valign=center  align="center"><font size=1 color=black face=verdana> <b>
                <cfif #getlist.c_time# eq"">
                  N/A
                  <cfelse>
                  #TimeFormat(getlist.c_time, "h:mm tt")#
                </cfif>
                </B></font> </td>
              <td valign=center  align="center"><font size=1 color=black face=verdana><b> #getlist.b_fname# &nbsp #getlist.b_lname#</b> </td>
              <td valign=center  align=center valign=top>
              <FONT FACE=verdana SIZE=1 color="black">
              <a href="./title_report_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#getlist.title_id#&a_trigger=1&company_id=#comp_id#"target="prop_hud_pg2" onClick="window.open('','prop_hud_pg2','width=620,height=500,status=0,resizable=1,scrollbars=1')"><font size=1 color=blue face=verdana>#title_id#</font></a>
              </td>
              <td valign=center  align="center"><a href="./calendar_closing_info.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#getlist.title_id#&company_id=#getlist.comp_id#"><font size=1 color=blue face=verdana>View/Modify</font></a> </td>
              <td valign=center  align="center"><B><font size=1 color=black face=verdana>#get_company.company#</B> </td>
              <td valign=center align="center"><cfif  #getlist.fee# neq "">
                  <font size=1 color=black face=verdana><b>#getlist.fee#</FONT></B>
                  <cfelse>
                  <font size=1 color=black face=verdana><b>N/A</FONT></B>
                </cfif>
              </td>
              <td valign=center  align="center"><cfif #get_file.closing_instructions# neq "">
                  <A HREF="#fileSys.FindFilePath('#get_file.closing_instructions#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(get_file.closing_inst_date,'m/d/yy')#&nbsp;#TimeFormat(get_file.closing_inst_time, "HH:mm")#</b></a>
                  <cfelse>
                  <B><font size=1 color=black face=verdana>N/A</B>
                </cfif>
              </td>
              <td valign=center  align="center"><cfif #get_file.pre_hud# neq "">
                  <A HREF="#fileSys.FindFilePath('#get_file.pre_hud#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(get_file.preHUD_upload_date,'m/d/yy')#&nbsp;#TimeFormat(get_file.preHUD_upload_date, "HH:mm")#</b></a>
                  <cfelse>
                  <B><font size=1 color=black face=verdana>N/A</B>
                </cfif>
              </td>
				<!--- Edit (Start) Added by Synechron Development for ticket# 777 --->
				<td valign=center  align="center">					
 					<cfif #get_file.closing_instructions# neq "" and #get_file.pre_hud# neq "" >
					<cfset int_time_value = DateFormat(get_file.closing_inst_date) & ' ' & TimeFormat(get_file.closing_inst_time)>
						<cfset WorkingDate=CalculateWorkDaysObj.ElapsedTime(ParseDateTime(#int_time_value#),ParseDateTime(#get_file.preHUD_upload_date#), #getlist.title_id#)>
						#Int(WorkingDate.EffectiveWorkmins)#
					<cfelse>
                  		<B><font size=1 color=black face=verdana>N/A</B>
					</cfif> 
				</td>
			<!--- Edit (end) Added by Synechron Development for ticket# 777 --->
<td valign=center  align="center"><cfif #get_file.final_hud# neq "">
                  <A HREF="#fileSys.FindFilePath('#get_file.final_HUD#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(get_file.final_hud_date,'m/d/yy')#&nbsp;#TimeFormat(get_file.final_hud_time, "HH:mm")#</b></a>
                  <cfelse>
                  <B><font size=1 color=black face=verdana>N/A</B>
                </cfif>
              </td>
              <td valign=center  align="center"><a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#getlist.title_id#&user_id=0&company_id=0&a_trigger=0&code=T" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a> </td>
				<td valign=center  align="center"><cfif get_file.seller_rep eq 'True'>X<cfelse>&nbsp;</cfif></td>
				<td valign=center  align="center"><font size=1 color=black face=verdana><b>#get_file.ipname#</b></font></td>
            </tr>
            <CFSET count = 1>
          </cfoutput>
          <!---Property--->
          <cfoutput query="getList4">
            <CFQUERY datasource="#request.dsn#" NAME="get_file4">
            SELECT d.*, p.searchtype FROM doc_closer_prop d, property p WHERE d.prop_ID = #prop_id#
			and d.prop_id = p.prop_id
            </CFQUERY>
            <cfquery datasource="#request.dsn#" NAME="get_company">
            Select company from companies where id = #getList4.comp_id#
            </cfquery>
            <tr <cfif get_file4.SearchType eq 'Purchase'>bgcolor="FFCC66"<cfelse>bgcolor="elelel"</cfif>>
              <td valign=center  align="center"><font size=1 color=black face=verdana> <b>
                <cfif #getlist4.c_time# eq"">
                  N/A
                  <cfelse>
                  #TimeFormat(getlist4.c_time, "h:mm tt")#
                </cfif>
                </B></font> </td>
              <td valign=center  align="center"><font size=1 color=black face=verdana><b> #getlist4.b_fname# &nbsp #getlist4.b_lname#</b> </td>
              <td valign=center  align=center valign=top>
              <FONT FACE=verdana SIZE=1 color="black">
              <a href="./prop_report_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#getlist4.prop_id#&a_trigger=1&company_id=#comp_id#"target="prop_hud_pg2" onClick="window.open('','prop_hud_pg2','width=620,height=500,status=0,resizable=1,scrollbars=1')"><font size=1 color=blue face=verdana>0232#prop_id#</font></a>
              </td>
              <td valign=center  align="center"><a href="./calendar_closing_info.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#getlist4.prop_id#&company_id=#getlist4.comp_id#"><font size=1 color=blue face=verdana>View/Modify</font></a> </td>
              <td valign=center  align="center"><B><font size=1 color=black face=verdana>#get_company.company#</B> </td>
              <td valign=center align="center"><cfif  #getlist4.fee# neq "">
                  <font size=1 color=black face=verdana><b>#getlist4.fee#</FONT></B>
                  <cfelse>
                  <font size=1 color=black face=verdana><b>N/A</FONT></B>
                </cfif>
              </td>
              <td valign=center  align="center"><!--- <cfif #get_file4.closing_instructions# neq "">
                  <A HREF="#fileSys.FindFilePath('#get_file4.closing_instructions#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(get_file4.closing_inst_date,'m/d/yy')#&nbsp;#TimeFormat(get_file4.closing_inst_time, "HH:mm")#</b></a>
                  <cfelse>
                  <B><font size=1 color=black face=verdana>N/A</B>
                </cfif> ---><B><font size=1 color=black face=verdana>N/A</B>
              </td>
              <td valign=center  align="center"><!--- <cfif #get_file4.pre_hud# neq "">
                  <A HREF="#fileSys.FindFilePath('#get_file4.pre_hud#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(get_file4.preHUD_upload_date,'m/d/yy')#&nbsp;#TimeFormat(get_file4.preHUD_upload_date, "HH:mm")#</b></a>
                  <cfelse>
                  <B><font size=1 color=black face=verdana>N/A</B>
                </cfif> ---><B><font size=1 color=black face=verdana>N/A</B>
              </td>
			  <!--- Edit (start) Added by Synechron Development for ticket# 777 --->
				<td valign=center  align="center"><!--- 
				<cfset int_time_value = DateFormat(get_file4.closing_inst_date) & ' ' & TimeFormat(get_file4.closing_inst_time)>				
 					<cfif #get_file4.closing_instructions# neq "" and #get_file4.pre_hud# neq "">
						<cfset WorkingDate=CalculateWorkDaysObj.ElapsedTime(ParseDateTime(#int_time_value#),ParseDateTime(#get_file4.preHUD_upload_date#), #getlist4.prop_id#)>
						#Int(WorkingDate.EffectiveWorkmins)#
					<cfelse>
                  		<B><font size=1 color=black face=verdana>N/A</B>
					</cfif> ---> <B><font size=1 color=black face=verdana>N/A</B>
				</td>			 
			   <!--- Edit (end) Added by Synechron Development for ticket# 777 --->
<td valign=center  align="center"><!--- <cfif #get_file4.final_hud# neq "">
                  <A HREF="#fileSys.FindFilePath('#get_file4.final_HUD#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(get_file4.final_hud_date,'m/d/yy')#&nbsp;#TimeFormat(get_file4.final_hud_time, "HH:mm")#</b></a>
                  <cfelse>
                  <B><font size=1 color=black face=verdana>N/A</B>
                </cfif> ---><B><font size=1 color=black face=verdana>N/A</B>
              </td>
              <td valign=center  align="center"><a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#getlist4.prop_id#&user_id=0&company_id=0&a_trigger=0&code=P" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a> </td>
				<td valign=center  align="center">&nbsp;</td>
            </tr>
            <CFSET count = 1>
          </cfoutput>
        </cfif>
      </table>
      </td>
    </tr>
  </table>
</div>
</td>
</tr>
</table>
</body>
</html>
