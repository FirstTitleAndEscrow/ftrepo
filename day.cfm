<CFPARAM NAME="a_flag" DEFAULT="">
<CFPARAM NAME="a_trigger" DEFAULT="">

<CFQUERY datasource="#request.dsn#" NAME="read_company">
         SELECT *
         FROM companies
         WHERE id = '#comp_id#'
         ORDER BY company ASC
</CFQUERY>

<cfif (read_company.id eq 6780 or read_company.master_co_id eq 6780)>
<cfset colspan = 11>
<cfelse>
<cfset colspan = 7>
</cfif>


<cfif read_company.child_ids eq '' or read_company.child_ids eq 'NULL'>
<cfset read_company.child_ids = '00000'>
</cfif>

<cfif #read_company.recordcount# GT 0>
      <CFQUERY datasource="#request.dsn#" NAME="getuser">
               SELECT *
               FROM users
               WHERE comp_id = #read_company.id#
               ORDER BY lp_lname ASC
      </CFQUERY>
</cfif>


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

<!--- Edit (Start) Added by Synechron Development for ticket# 777 --->
<cfobject component="cfc.CalculateWorkDays"	name="CalculateWorkDaysObj"	type="component">
<!--- Edit (End) Added by Synechron Development for ticket# 777 --->

<Cfoutput>
          <cfif #a_trigger# EQ "1">
                <cfif #a_flag# EQ "1">
                      <cfquery datasource="#request.dsn#">
                               delete from EventList
                               Where
                               title_id = #URL.rec_id# AND comp_id = #read_company.id#
                      </cfquery>
                <cfelse>
                        <cfquery datasource="#request.dsn#">
                                 delete from EventList
                                 Where
                                 title_id = #URL.rec_id#
                        </cfquery>
                 </cfif>
         </cfif>
</Cfoutput>
<html>
<head>
<title>		View
</title>
<style>
TD {font-size:9px; color:#000000; font-family:Verdana, Arial, Helvetica, sans-serif;}
</style>
</head>

<body bgcolor="silver">
<div align="center">

  <table border="0" cellpadding="0" cellspacing="0" width="650" bgcolor="black">
    	<tr>
      		<td>
        		<div align="center">
          			<table border="1" cellpadding="1" cellspacing="0" width="650" bgcolor="white">
            			<tr>
              				<td bgcolor="navy" colspan=<cfoutput>#colspan#</cfoutput> width="650">
			                    <p align="center"><font color="white" face="Arial Black">
<!---Description Bar--->
<cfoutput>#DateFormat(ThisDate,'dddd, d, mmmm, yyyy')#
<cfset plugday = #DateFormat(ThisDate,'mm/dd/yyyy')#>
</CFOUTPUT>
<cfset tempdate = CreateODBCDate(plugday)>
<cfset temp = #DateFormat(Now(), 'mm/dd/yyyy')#>
<cfset current = CreateODBCDate(temp)>
								</font></p>
              				</td>
             			</tr>
<cfif #a_flag# EQ "1">
      <cfquery datasource="#request.dsn#" name="getList">
               select * From EventList
               Where (YearMonth = '#YearMonthDay#') and title_ID is not null AND  (comp_id = #read_company.id# or comp_id IN (select id from Companies where master_co_id = #read_company.id#) or comp_id IN (#read_company.child_ids#))
               order by c_time
      </cfquery>

	  <cfquery datasource="#request.dsn#" name="getList4">
               select * From EventList
               Where (YearMonth = '#YearMonthDay#')  and prop_ID is not null AND  (comp_id = #read_company.id# or comp_id IN (select id from Companies where master_co_id = #read_company.id#) or comp_id IN (#read_company.child_ids#))
               order by c_time
      </cfquery>


				  <cfquery datasource="#request.dsn#" name="getList5">
               select * From EventList
               Where (YearMonth = '#YearMonthDay#') and anc_ID is not null AND  (comp_id = #read_company.id# or comp_id IN (select id from Companies where master_co_id = #read_company.id#) or comp_id IN (#read_company.child_ids#))
               order by c_time
      </cfquery>

      <cfquery datasource="#request.dsn#" name="getList2">
               select * From Title_Closing_Order_Request a, EventList b where a.title_id = b.title_id and a.request_date = '#YearMonthDay#' and b.yearmonth is null AND (comp_id = #read_company.id# or comp_id IN (select id from Companies where master_co_id = #read_company.id#) or comp_id IN (#read_company.child_ids#))
               order by b.c_time
      </cfquery>

	  <!---Prop Orders--->
	   <cfquery datasource="#request.dsn#" name="getList3">
               select * From Title_Closing_Order_Request_Prop a, EventList b where a.prop_id = b.prop_id and a.request_date = '#YearMonthDay#' and b.yearmonth is null AND (comp_id = #read_company.id# or comp_id IN (select id from Companies where master_co_id = #read_company.id#) or comp_id IN (#read_company.child_ids#))
               order by b.c_time
      </cfquery>

			   <cfquery datasource="#request.dsn#" name="getList6">
               select * From Title_Closing_Order_Request_anc a, EventList b where a.anc_id = b.anc_id and a.request_date = '#YearMonthDay#' and b.yearmonth is null AND (comp_id = #read_company.id# or comp_id IN (select id from Companies where master_co_id = #read_company.id#) or comp_id IN (#read_company.child_ids#))
               order by b.c_time
      </cfquery>



<cfelse>
      <cfquery datasource="#request.dsn#" name="getList">
               select * From EventList
               Where (YearMonthDay = '#YearMonthDay#')
               order by c_time
      </cfquery>

      <cfquery datasource="#request.dsn#" name="getList2">
               select * From Title_Closing_Order_Request a, EventList b where a.title_id = b.title_id and a.request_date = '#YearMonthDay#' and b.yearmonth is null
               order by b.c_time
      </cfquery>

	   <cfquery datasource="#request.dsn#" name="getList3">
               select * From Title_Closing_Order_Request_Prop a, EventList b where a.prop_id = b.prop_id and a.request_date = '#YearMonthDay#' and b.yearmonth is null
               order by b.c_time
      </cfquery>

			  <cfquery datasource="#request.dsn#" name="getList4">
               select * From Title_Closing_Order_Request_anc a, EventList b where a.anc_id = b.anc_id and a.request_date = '#YearMonthDay#' and b.yearmonth is null
               order by b.c_time
      </cfquery>

</cfif>
<cfoutput>
						<tr>
    						<td bgcolor="blue" colspan = #colspan# valign=center width="80%" align="center">
       	 						<font size=3 color=white face=verdana><b>
         						Check below for scheduled Closings</b></font><br>
     						</td>
						</tr>
						<tr>
<CFSET comparison = DateCompare(tempdate, current)>
     						<td bgcolor="white" colspan = #colspan# valign=center width="80%" align="center">
          						<font size=2 color=black face=verdana>
          						<CFIF #comparison# eq "1">
								 **If you would like to schedule a new closing please
								 <a href="./title_closing_search.cfm?comp_id=#read_company.id#&YearMonthDay=#plugDay#&UserID=#getuser.ID#&user_id_1=#URL.user_id_1#&lo_id=#url.lo_id#"><font size=3 color=red face=verdana><b>click here</b></font></a><br>
		  						<cfelse>
		 							**If you would like to request a new closing, please chose a future date
		  						</cfif>
         					</td>
						</tr>
</cfoutput>
 						<tr>
  							<td bgcolor="elelel" valign=top width="15%" align="center">
             					<font size=2 color=blue face=verdana><b>
               					Loan No.
        						</b></font>
              				</td>
 							<td bgcolor="elelel" valign=top width="15%" align="center">
             					<font size=2 color=blue face=verdana><b>
                				Time
        						</b></font>
              				</td>
							<td bgcolor="elelel" valign=top width="25%" align="center">
               					<font size=2 color=blue face=verdana><b>
                				Borrower
        						</b></font>
              				</td>
							<td bgcolor="elelel" valign=top width="20%" align="center">
              					<font size=2 color=blue face=verdana><b>
                				Status
        						</b></font>
							</td>
			  				<td bgcolor="elelel" valign=top width="20%" align="center">
              					<font size=2 color=blue face=verdana><b>
				                Details
						        </b></font>
			              	</td>
<cfif (comp_id eq 6780 or read_company.master_co_id eq 6780)>

			  				<td bgcolor="elelel" valign=top width="20%" align="center">
              					<font size=2 color=blue face=verdana><b>
				                Closing Inst. upload time
						        </b></font>
			              	</td>
			  				<td bgcolor="elelel" valign=top width="20%" align="center">
              					<font size=2 color=blue face=verdana><b>
				               Pre-HUD upload time
						        </b></font>
			              	</td>
			  				<td bgcolor="elelel" valign=top width="20%" align="center">
              					<font size=2 color=blue face=verdana><b>
				               HUD Turn-Time (mins)
						        </b></font>
			              	</td>
			  				<td bgcolor="elelel" valign=top width="20%" align="center">
              					<font size=2 color=blue face=verdana><b>
				                Final HUD upload time
						        </b></font>
			              	</td>
</cfif>		

					  	   	<td bgcolor="elelel" valign=top width="20%" align="center">
				              	<font size=2 color=blue face=verdana><b>
                				Modify Closing
		        				</b></font>
              				</td>
							<td bgcolor="elelel" valign=top width="20%" align="center">
					              <font size=2 color=blue face=verdana><b>
					              Comments
							      </b></font>
              				</td>
						</tr>
<CFQUERY datasource="#request.dsn#" NAME="read_comp">
	SELECT *
	FROM Companies
	WHERE ID = #read_company.id#
</CFQUERY>

<CFSET r_count = #getlist.recordcount# + #getlist2.recordcount# + #getlist3.recordcount# + #getlist4.recordcount#>
<!---Adding properties to list--->
<CFSET r_count_prop = #getlist2.recordcount# + #getlist3.recordcount#>

<CFSET r_count_other = #getlist.recordcount# + #getlist4.recordcount#>
<cfoutput>

<cfif #r_count# neq 0>
 						<tr>
							<td bgcolor="ffff00" colspan = #colspan# width="100%" align=center valign=top>
								<FONT FACE=verdana SIZE=1 color="black">
								Company: #read_comp.company#. Total of #r_count# records found for #DateFormat(ThisDate,'m/d/yyyy')#
							</td>
						</tr>
</cfif>
<cfif #r_count_prop# neq 0>
						<tr>
							<td bgcolor="ffffff" colspan = #colspan# width="100%" align=center valign=top>
								<FONT FACE=verdana SIZE=1 color="black">
								<cfif #r_count_prop# neq 0 >
									#r_count_prop# are <b>REQUESTED</b> for #DateFormat(ThisDate,'m/d/yyyy')#. See below
								</cfif>
							</td>
						</tr>
</cfif>
</cfoutput>
<!---Title Orders Start--->
<cfoutput query="getList2">
	<CFQUERY datasource="#request.dsn#" NAME="get_title">
		SELECT *
		FROM title
		WHERE title_ID = #title_id#
	</CFQUERY>
		    			<tr>
            				<td bgcolor="elelel" valign=center width="15%" align="center">
			  					<font size=1 color=black face=verdana>#get_title.loan_number#
			  				</td>
              				<td bgcolor="elelel" valign=center width="15%" align="center">
               					<font size=1 color=black face=verdana>
			  					<b>
								<cfif #getlist2.a_req_closing_time# eq"">
									No time set
								<cfelse>
									#TimeFormat(getlist2.a_req_closing_time, "HH:mm tt")#
								</cfif>
								</B></font>
              				</td>
            				<td bgcolor="elelel" valign=center width="25%" align="center">
								<font size=1 color=black face=verdana><b>
           						#get_title.bfirstname1# &nbsp;&nbsp;&nbsp; #get_title.blastname1#</b>
              				</td>
			  				<td bgcolor="elelel" valign=center width="20%" align="center">
			  					<font size=1 color=blue face=verdana><b>
              					#get_title.appraisal_status#
			 	 			</td>
			  				<td bgcolor="elelel" valign=center width="20%" align="center">
			  					<a href="./title_closing_report_nav.cfm?comp_id=#comp_id#&rec_id=#getlist2.title_id#&company_id=#read_company.id#&YearMonthDay=#yearMonthDay#&UserID=#getuser.ID#&user_id_1=#URL.user_id_1#&lo_id=#url.lo_id#"><font size=1 color=blue face=verdana> Closing Requested </font></a>
         					</td>
					
<cfif (read_company.id eq 6780 or read_company.master_co_id eq 6780)>

							
			  				<td bgcolor="elelel" valign=center width="20%" align="center"><font size=1 color=black face=verdana>
			  					<cfif #get_file2.closing_instructions# neq "">
                  <A HREF="#fileSys.FindFilePath('#get_file2.closing_instructions#', 'url')#" target="new"><b>#DateFormat(get_file2.closing_inst_date,'m/d/yy')#&nbsp;#TimeFormat(get_file2.closing_inst_time, "HH:mm")#</b></a>
                  <cfelse>
                  <B><font size=1 color=black face=verdana>N/A</B>
                </cfif>
         					</td>
			  				<td bgcolor="elelel" valign=center width="20%" align="center"><font size=1 color=black face=verdana>
			  					<cfif #get_file2.pre_hud# neq "">
                  <A HREF="#fileSys.FindFilePath('#get_file2.pre_hud#', 'url')#" target="new"><b>#DateFormat(get_file2.preHUD_upload_date,'m/d/yy')#&nbsp;#TimeFormat(get_file2.preHUD_upload_date, "HH:mm")#</b></a>
                  <cfelse>
                  <B><font size=1 color=black face=verdana>N/A</B>
                </cfif>
         					</td>
			  				<td bgcolor="elelel" valign=center width="20%" align="center"><font size=1 color=black face=verdana>
			  				<cfset int_time_value = DateFormat(get_file2.closing_inst_date) & ' ' & TimeFormat(get_file2.closing_inst_time)>		
 					<cfif #get_file2.closing_instructions# neq "" and #get_file2.pre_hud# neq "">
						<cfset WorkingDate=CalculateWorkDaysObj.ElapsedTime(ParseDateTime(#int_time_value#),ParseDateTime(#get_file2.preHUD_upload_date#), #getlist2.title_id#)>
						#Int(WorkingDate.EffectiveWorkmins)#				
					<cfelse>
                  		<B><font size=1 color=black face=verdana>tttt</B>
					</cfif> 
         					</td>
			  				<td bgcolor="elelel" valign=center width="20%" align="center">
			  				<cfif #get_file2.final_hud# neq "">
                  <A HREF="#fileSys.FindFilePath('#get_file2.final_HUD#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(get_file2.final_hud_date,'m/d/yy')#&nbsp;#TimeFormat(get_file2.final_hud_time, "HH:mm")#</b></a>
                  <cfelse>
                  <B><font size=1 color=black face=verdana>N/A</B>
                </cfif>
         					</td>
</cfif>							
							
							
							
			  				<td bgcolor="elelel" valign=center width="20%" align="center">
			  					<a href="./form_title_closing_order_request_modify.cfm?comp_id=#comp_id#&rec_id=#getlist2.title_id#&company_id=#read_company.id#&YearMonthDay=#yearMonthDay#&UserID=#getuser.ID#&user_id_1=#URL.user_id_1#&lo_id=#url.lo_id#"><font size=1 color=blue face=verdana> Modify </font></a>
         					</td>
           					<td bgcolor="elelel" valign=center width="20%" align="center">
								<CFQUERY datasource="#request.dsn#" NAME="read_all_notes">
									SELECT *
									FROM Title_Notes
									Where Order_Id = #title_id# and access = 1
									ORDER BY Note_ID ASC
								</CFQUERY>
								<cfif (#read_all_notes.recordcount# gt 0)>
									<a href="./view_title_comments_nav.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#title_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=400,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
								<cfelse>
								</cfif>
				 			</td>
		  				</tr>
</cfoutput>
<!---Title Orders End--->
<!---Prop Orders Start--->
<cfoutput query="getList3">
	<CFQUERY datasource="#request.dsn#" NAME="get_title">
		SELECT *
		FROM Property
		WHERE prop_ID = #prop_id#
	</CFQUERY>
		    			<tr>
            				<td bgcolor="elelel" valign=center width="15%" align="center">
			  					<font size=1 color=black face=verdana>#get_title.loan_number#
			  				</td>
              				<td bgcolor="elelel" valign=center width="15%" align="center">
               					<font size=1 color=black face=verdana>
			  					<b>
								<cfif #getlist3.a_req_closing_time# eq"">
									No time set
								<cfelse>
									#TimeFormat(getlist3.a_req_closing_time, "HH:mm tt")#
								</cfif>
								</B></font>
              				</td>
            				<td bgcolor="elelel" valign=center width="25%" align="center">
								<font size=1 color=black face=verdana><b>
           						#get_title.bfirstname1# &nbsp;&nbsp;&nbsp; #get_title.blastname1#</b>
              				</td>
			  				<td bgcolor="elelel" valign=center width="20%" align="center">
			  					<font size=1 color=blue face=verdana><b>
              					#get_title.appraisal_status#
			 	 			</td>
			  				<td bgcolor="elelel" valign=center width="20%" align="center">
			  					<a href="./title_closing_report_nav.cfm?comp_id=#comp_id#&rec_id=#getlist3.prop_id#&company_id=#read_company.id#&YearMonthDay=#yearMonthDay#&UserID=#getuser.ID#&user_id_1=#URL.user_id_1#&lo_id=#url.lo_id#"><font size=1 color=blue face=verdana> Closing Requested </font></a>
         					</td>

<cfif (read_company.id eq 6780 or read_company.master_co_id eq 6780)>

							
			  				<td bgcolor="elelel" valign=center width="20%" align="center">
			  					<cfif #get_file3.closing_instructions# neq "">
                  <A HREF="#fileSys.FindFilePath('#get_file3.closing_instructions#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(get_file3.closing_inst_date,'m/d/yy')#&nbsp;#TimeFormat(get_file3.closing_inst_time, "HH:mm")#</b></a>
                  <cfelse>
                  <B><font size=1 color=black face=verdana>N/A</B>
                </cfif>
         					</td>
			  				<td bgcolor="elelel" valign=center width="20%" align="center">
			  					<cfif #get_file3.pre_hud# neq "">
                  <A HREF="#fileSys.FindFilePath('#get_file3.pre_hud#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(get_file3.preHUD_upload_date,'m/d/yy')#&nbsp;#TimeFormat(get_file3.preHUD_upload_date, "HH:mm")#</b></a>
                  <cfelse>
                  <B><font size=1 color=black face=verdana>N/A</B>
                </cfif>
         					</td>
			  				<td bgcolor="elelel" valign=center width="20%" align="center">
			  				<cfset int_time_value = DateFormat(get_file3.closing_inst_date) & ' ' & TimeFormat(get_file3.closing_inst_time)>		
 					<cfif #get_file3.closing_instructions# neq "" and #get_file3.pre_hud# neq "">
						<cfset WorkingDate=CalculateWorkDaysObj.ElapsedTime(ParseDateTime(#int_time_value#),ParseDateTime(#get_file3.preHUD_upload_date#), #getlist3.title_id#)>
						#Int(WorkingDate.EffectiveWorkmins)#				
					<cfelse>
                  		<B><font size=1 color=black face=verdana>tttt</B>
					</cfif> 
         					</td>
			  				<td bgcolor="elelel" valign=center width="20%" align="center">
			  				<cfif #get_file3.final_hud# neq "">
                  <A HREF="#fileSys.FindFilePath('#get_file3.final_HUD#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(get_file3.final_hud_date,'m/d/yy')#&nbsp;#TimeFormat(get_file3.final_hud_time, "HH:mm")#</b></a>
                  <cfelse>
                  <B><font size=1 color=black face=verdana>N/A</B>
                </cfif>
         					</td>
</cfif>						
			  				<td bgcolor="elelel" valign=center width="20%" align="center">
			  					<a href="./form_title_closing_order_request_modify.cfm?comp_id=#comp_id#&rec_id=#getlist3.prop_id#&company_id=#read_company.id#&YearMonthDay=#yearMonthDay#&UserID=#getuser.ID#&user_id_1=#URL.user_id_1#&lo_id=#url.lo_id#"><font size=1 color=blue face=verdana> Modify </font></a>
         					</td>
           					<td bgcolor="elelel" valign=center width="20%" align="center">
								<CFQUERY datasource="#request.dsn#" NAME="read_all_notes">
									SELECT *
									FROM Title_Notes
									Where Order_Id = #prop_id# and access = 1
									ORDER BY Note_ID ASC
								</CFQUERY>
								<cfif (#read_all_notes.recordcount# gt 0)>
									<a href="./view_title_comments_nav.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#prop_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=400,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
								<cfelse>
								</cfif>
				 			</td>
		  				</tr>
</cfoutput>


<!---SN Orders Start--->
<cfoutput query="getList6">
	<CFQUERY datasource="#request.dsn#" NAME="get_title">
		SELECT *
		FROM Ancillary
		WHERE anc_ID = #anc_id#
	</CFQUERY>
		    			<tr>
            				<td bgcolor="elelel" valign=center width="15%" align="center">
			  					<font size=1 color=black face=verdana>#get_title.loan_number#
			  				</td>
              				<td bgcolor="elelel" valign=center width="15%" align="center">
               					<font size=1 color=black face=verdana>
			  					<b>
								<cfif #a_req_closing_time# eq"">
									No time set
								<cfelse>
									#TimeFormat(a_req_closing_time, "HH:mm tt")#
								</cfif>
								</B></font>
              				</td>
            				<td bgcolor="elelel" valign=center width="25%" align="center">
								<font size=1 color=black face=verdana><b>
           						#get_title.bfirstname1# &nbsp;&nbsp;&nbsp; #get_title.blastname1#</b>
              				</td>
			  				<td bgcolor="elelel" valign=center width="20%" align="center">
			  					<font size=1 color=blue face=verdana><b>
              					#get_title.appraisal_status#
			 	 			</td>
			  				<td bgcolor="elelel" valign=center width="20%" align="center">
			  					<a href="./anc_closing_report_nav.cfm?comp_id=#comp_id#&rec_id=#anc_id#&company_id=#read_company.id#&YearMonthDay=#yearMonthDay#&UserID=#getuser.ID#&user_id_1=#URL.user_id_1#&lo_id=#url.lo_id#"><font size=1 color=blue face=verdana> Closing Requested </font></a>
         					</td>
<cfif (read_company.id eq 6780 or read_company.master_co_id eq 6780)>
			  				<td bgcolor="elelel" valign=center width="20%" align="center">&nbsp;</td>
			  				<td bgcolor="elelel" valign=center width="20%" align="center">&nbsp;</td>
			  				<td bgcolor="elelel" valign=center width="20%" align="center">&nbsp;</td>
			  				<td bgcolor="elelel" valign=center width="20%" align="center">&nbsp;</td>
</cfif>						
			  				<td bgcolor="elelel" valign=center width="20%" align="center">
			  					<a href="./form_title_closing_order_request_modify.cfm?comp_id=#comp_id#&rec_id=#anc_id#&company_id=#read_company.id#&YearMonthDay=#yearMonthDay#&UserID=#getuser.ID#&user_id_1=#URL.user_id_1#&lo_id=#url.lo_id#"><font size=1 color=blue face=verdana> Modify </font></a>
         					</td>
           					<td bgcolor="elelel" valign=center width="20%" align="center">
								<CFQUERY datasource="#request.dsn#" NAME="read_all_notes">
									SELECT *
									FROM Title_Notes
									Where Order_Id = #anc_id# and access = 1
									ORDER BY Note_ID ASC
								</CFQUERY>
								<cfif (#read_all_notes.recordcount# gt 0)>
									<a href="./view_title_comments_nav.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#anc_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=400,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
								<cfelse>
								</cfif>
				 			</td>
		  				</tr>
</cfoutput>
<!---SN Orders End--->
<!---Prop Orders End--->
<cfoutput>

<cfif #r_count_other# neq 0>
						<tr>
							<td bgcolor="white" colspan = 9 width="100%" align=center valign=top>
								<FONT FACE=verdana SIZE=1 color="black">
								<cfif #r_count_other# neq 0>
									#r_count_other# are <b>SCHEDULED</b> for #DateFormat(ThisDate,'m/d/yyyy')#. See below
								</cfif>
							</td>
						</tr>
</cfif>
</cfoutput>

<cfoutput query="getList">
            <CFQUERY datasource="#request.dsn#" NAME="get_files">
            SELECT * FROM doc_closer_title WHERE title_ID = #title_id#
            </CFQUERY>

	<CFQUERY datasource="#request.dsn#" NAME="get_title">
		SELECT *
		FROM title
		WHERE title_ID = #title_id#
	</CFQUERY>

		                <tr>
              				<td bgcolor="elelel" valign=center width="15%" align="center">
			  					#get_title.loan_number#
			  				</td>
              				<td bgcolor="elelel" valign=center width="15%" align="center">
               					<font size=1 color=black face=verdana>
				 			    <b>
								<cfif #getlist.c_time# eq"">
									No time set
								<cfelse>
									#TimeFormat(getlist.c_time, "h:mm tt")#
								</cfif>
							</B></font>
              				</td>
            				<td bgcolor="elelel" valign=center width="25%" align="center">
								<font size=1 color=black face=verdana><b>
           						#getlist.b_fname# &nbsp;&nbsp;&nbsp; #getlist.b_lname#</b>
              				</td>
			   				<td bgcolor="elelel" valign=center width="20%" align="center">
			  					<font size=1 color=blue face=verdana><b>
              					#get_title.appraisal_status#
						  	</td>
			  				<td bgcolor="elelel" valign=center width="20%" align="center">
              					<a href="./Title_Closing_View_info.cfm?comp_id=#comp_id#&rec_id=#getlist.title_id#&company_id=#read_company.id#&YearMonthDay=#yearMonthDay#&UserID=#getuser.ID#&user_id_1=#URL.user_id_1#&lo_id=#url.lo_id#"><font size=1 color=blue face=verdana> Closing Info </font></a>
         					</td>
<cfif (read_company.id eq 6780 or read_company.master_co_id eq 6780)>

							
			  				<td bgcolor="elelel" valign=center width="20%" align="center">
			  					<cfif #get_files.closing_instructions# neq "">
                  <A HREF="#fileSys.FindFilePath('#get_files.closing_instructions#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(get_files.closing_inst_date,'m/d/yy')#&nbsp;#TimeFormat(get_files.closing_inst_time, "HH:mm")#</b></a>
                  <cfelse>
                  <B><font size=1 color=black face=verdana>N/A</B>
                </cfif>
         					</td>
			  				<td bgcolor="elelel" valign=center width="20%" align="center">
			  					<cfif #get_files.pre_hud# neq "">
                  <A HREF="#fileSys.FindFilePath('#get_files.pre_hud#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(get_files.preHUD_upload_date,'m/d/yy')#&nbsp;#TimeFormat(get_files.preHUD_upload_date, "HH:mm")#</b></a>
                  <cfelse>
                  <B><font size=1 color=black face=verdana>N/A</B>
                </cfif>
         					</td>
			  				<td bgcolor="elelel" valign=center width="20%" align="center">
			  				<cfset int_time_value = DateFormat(get_files.closing_inst_date) & ' ' & TimeFormat(get_files.closing_inst_time)>		
 					<cfif #get_files.closing_instructions# neq "" and #get_files.pre_hud# neq "">
						<cfset WorkingDate=CalculateWorkDaysObj.ElapsedTime(ParseDateTime(#int_time_value#),ParseDateTime(#get_files.preHUD_upload_date#), #get_files.title_id#)>
						#Int(WorkingDate.EffectiveWorkmins)#				
					<cfelse>
                  		<B><font size=1 color=black face=verdana>tttt</B>
					</cfif> 
         					</td>
			  				<td bgcolor="elelel" valign=center width="20%" align="center">
			  				<cfif #get_files.final_hud# neq "">
                  <A HREF="#fileSys.FindFilePath('#get_files.final_HUD#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(get_files.final_hud_date,'m/d/yy')#&nbsp;#TimeFormat(get_files.final_hud_time, "HH:mm")#</b></a>
                  <cfelse>
                  <B><font size=1 color=black face=verdana>N/A</B>
                </cfif>
         					</td>
</cfif>			
			  				<td bgcolor="elelel" valign=center width="20%" align="center">
			  					<a href="./form_title_closing_order_request_modify.cfm?comp_id=#comp_id#&rec_id=#getlist.title_id#&company_id=#read_company.id#&YearMonthDay=#yearMonthDay#&UserID=#getuser.ID#&user_id_1=#URL.user_id_1#&lo_id=#url.lo_id#"><font size=1 color=blue face=verdana> Modify  </font></a>
         					</td>
                    		<td bgcolor="elelel" valign=center width="20%" align="center">
								<CFQUERY datasource="#request.dsn#" NAME="read_all_notes">
									SELECT *
									FROM Title_Notes
									Where Order_Id = #title_id# and access = 1
									ORDER BY Note_ID ASC
								</CFQUERY>

								<cfif (#read_all_notes.recordcount# gt 0)>
									<a href="./view_title_comments_nav.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#title_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=400,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
								<cfelse>

								</cfif>
							</td>
		  				</tr>
</cfoutput>
<!---Props start--->
<cfoutput query="getList4">

	<CFQUERY datasource="#request.dsn#" NAME="get_title">
		SELECT *
		FROM Property
		WHERE prop_ID = #prop_id#
	</CFQUERY>

		                <tr>
              				<td bgcolor="elelel" valign=center width="15%" align="center">
			  					#get_title.loan_number#
			  				</td>
              				<td bgcolor="elelel" valign=center width="15%" align="center">
               					<font size=1 color=black face=verdana>
				 			    <b>
								<cfif #getlist4.c_time# eq"">
									No time set
								<cfelse>
									#TimeFormat(getlist4.c_time, "h:mm tt")#
								</cfif>
							</B></font>
              				</td>
            				<td bgcolor="elelel" valign=center width="25%" align="center">
								<font size=1 color=black face=verdana><b>
           						#getlist4.b_fname# &nbsp;&nbsp;&nbsp; #getlist4.b_lname#</b>
              				</td>
			   				<td bgcolor="elelel" valign=center width="20%" align="center">
			  					<font size=1 color=blue face=verdana><b>
              					#get_title.appraisal_status#
						  	</td>
			  				<td bgcolor="elelel" valign=center width="20%" align="center">
              					<a href="./Title_Closing_View_info.cfm?comp_id=#comp_id#&rec_id=#getlist4.prop_id#&company_id=#read_company.id#&YearMonthDay=#yearMonthDay#&UserID=#getuser.ID#&user_id_1=#URL.user_id_1#&lo_id=#url.lo_id#"><font size=1 color=blue face=verdana> Closing Info </font></a>
         					</td>
<cfif (read_company.id eq 6780 or read_company.master_co_id eq 6780)>

							
			  				<td bgcolor="elelel" valign=center width="20%" align="center">
			  					<cfif #getList4.closing_instructions# neq "">
                  <A HREF="#fileSys.FindFilePath('#getList4.closing_instructions#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(getList4.closing_inst_date,'m/d/yy')#&nbsp;#TimeFormat(getList4.closing_inst_time, "HH:mm")#</b></a>
                  <cfelse>
                  <B><font size=1 color=black face=verdana>N/A</B>
                </cfif>
         					</td>
			  				<td bgcolor="elelel" valign=center width="20%" align="center">
			  					<cfif #getList4.pre_hud# neq "">
                  <A HREF="#fileSys.FindFilePath('#getList4.pre_hud#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(getList4.preHUD_upload_date,'m/d/yy')#&nbsp;#TimeFormat(getList4.preHUD_upload_date, "HH:mm")#</b></a>
                  <cfelse>
                  <B><font size=1 color=black face=verdana>N/A</B>
                </cfif>
         					</td>
			  				<td bgcolor="elelel" valign=center width="20%" align="center">
			  				<cfset int_time_value = DateFormat(getList4.closing_inst_date) & ' ' & TimeFormat(getList4.closing_inst_time)>		
 					<cfif #getList4.closing_instructions# neq "" and #getList4.pre_hud# neq "">
						<cfset WorkingDate=CalculateWorkDaysObj.ElapsedTime(ParseDateTime(#int_time_value#),ParseDateTime(#getList4.preHUD_upload_date#), #getList4.prop_id#)>
						#Int(WorkingDate.EffectiveWorkmins)#				
					<cfelse>
                  		<B><font size=1 color=black face=verdana>tttt</B>
					</cfif> 
         					</td>
			  				<td bgcolor="elelel" valign=center width="20%" align="center">
			  				<cfif #getList4.final_hud# neq "">
                  <A HREF="#fileSys.FindFilePath('#getList4.final_HUD#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(getList4.final_hud_date,'m/d/yy')#&nbsp;#TimeFormat(getList4.final_hud_time, "HH:mm")#</b></a>
                  <cfelse>
                  <B><font size=1 color=black face=verdana>N/A</B>
                </cfif>
         					</td>
</cfif>			
			  				<td bgcolor="elelel" valign=center width="20%" align="center">
			  					<a href="./form_title_closing_order_request_modify.cfm?comp_id=#comp_id#&rec_id=#getlist4.prop_id#&company_id=#read_company.id#&YearMonthDay=#yearMonthDay#&UserID=#getuser.ID#&user_id_1=#URL.user_id_1#&lo_id=#url.lo_id#"><font size=1 color=blue face=verdana> Modify  </font></a>
         					</td>
                    		<td bgcolor="elelel" valign=center width="20%" align="center">
								<CFQUERY datasource="#request.dsn#" NAME="read_all_notes">
									SELECT *
									FROM Title_Notes
									Where Order_Id = #prop_id# and access = 1
									ORDER BY Note_ID ASC
								</CFQUERY>

								<cfif (#read_all_notes.recordcount# gt 0)>
									<a href="./view_title_comments_nav.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#prop_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=400,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
								<cfelse>

								</cfif>
							</td>
		  				</tr>
</cfoutput>
<!---props end--->
<!---SN start--->
<cfoutput query="getList5">

	<CFQUERY datasource="#request.dsn#" NAME="get_title">
		SELECT *
		FROM Ancillary
		WHERE anc_ID = #anc_id#
	</CFQUERY>

		                <tr>
              				<td bgcolor="elelel" valign=center width="15%" align="center">
			  					#get_title.loan_number#
			  				</td>
              				<td bgcolor="elelel" valign=center width="15%" align="center">
               					<font size=1 color=black face=verdana>
				 			    <b>
								<cfif #c_time# eq"">
									No time set
								<cfelse>
									#TimeFormat(c_time, "h:mm tt")#
								</cfif>
							</B></font>
              				</td>
            				<td bgcolor="elelel" valign=center width="25%" align="center">
								<font size=1 color=black face=verdana><b>
           						#b_fname# &nbsp;&nbsp;&nbsp; #b_lname#</b>
              				</td>
			   				<td bgcolor="elelel" valign=center width="20%" align="center">
			  					<font size=1 color=blue face=verdana><b>
              					#get_title.appraisal_status#
						  	</td>
			  				<td bgcolor="elelel" valign=center width="20%" align="center">
              					<a href="./anc_Closing_View_info.cfm?comp_id=#comp_id#&rec_id=#anc_id#&company_id=#read_company.id#&YearMonthDay=#yearMonthDay#&UserID=#getuser.ID#&user_id_1=#URL.user_id_1#&lo_id=#url.lo_id#"><font size=1 color=blue face=verdana> Closing Info </font></a>
         					</td>
<cfif (read_company.id eq 6780 or read_company.master_co_id eq 6780)>
			  				<td bgcolor="elelel" valign=center width="20%" align="center">&nbsp;</td>
			  				<td bgcolor="elelel" valign=center width="20%" align="center">&nbsp;</td>
			  				<td bgcolor="elelel" valign=center width="20%" align="center">&nbsp;</td>
			  				<td bgcolor="elelel" valign=center width="20%" align="center">&nbsp;</td>
</cfif>						
			  				<td bgcolor="elelel" valign=center width="20%" align="center">
			  					<a href="./form_title_closing_order_request_modify.cfm?comp_id=#comp_id#&rec_id=#anc_id#&company_id=#read_company.id#&YearMonthDay=#yearMonthDay#&UserID=#getuser.ID#&user_id_1=#URL.user_id_1#&lo_id=#url.lo_id#"><font size=1 color=blue face=verdana> Modify  </font></a>
         					</td>
                    		<td bgcolor="elelel" valign=center width="20%" align="center">
								<CFQUERY datasource="#request.dsn#" NAME="read_all_notes">
									SELECT *
									FROM Title_Notes
									Where Order_Id = #anc_id# and access = 1
									ORDER BY Note_ID ASC
								</CFQUERY>

								<cfif (#read_all_notes.recordcount# gt 0)>
									<a href="./view_title_comments_nav.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#anc_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=400,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
								<cfelse>

								</cfif>
							</td>
		  				</tr>
</cfoutput>
<!---SN end--->
     				</table>
    			</td>
			</tr>
        </table>
        </div>
	 </td>
    </tr>
  </table>
 <script type="text/javascript">



  var _gaq = _gaq || [];

  _gaq.push(['_setAccount', 'UA-195021-17']);

  _gaq.push(['_trackPageview']);



  (function() {

    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;

    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'https://www') + '.google-analytics.com/ga.js';

    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);

  })();



</script>

</body>
</html>

