
<CFPARAM NAME="a_flag" DEFAULT="">
<CFPARAM NAME="count" DEFAULT="">
<CFPARAM NAME="a_trigger" DEFAULT="">

<!--- <CFQUERY datasource="#request.dsn#" NAME="read_company">
SELECT *
FROM companies
WHERE id = '#comp_id#'
ORDER BY company ASC
</CFQUERY> 

<cfif #read_company.recordcount# GT 0>--->
<CFQUERY datasource="#request.dsn#" NAME="getuser">
select * from first_admin

			WHERE ID = #session.ft_user_id#

</CFQUERY>
<!--- </cfif> --->

<CFQUERY datasource="#request.dsn#" NAME="read_titleid">
		
			SELECT *
			FROM title_closing_order_request
			where a_filled_out_date is null
			ORDER BY Title_id
		
		</CFQUERY>
<!---<Cfoutput>
 <cfif #a_flag# EQ "1">
<cfquery datasource="#request.dsn#" name="getcompany">

select * from companies
where id = #URL.comp_id#
</cfquery>
</cfif> 
</cfoutput>--->
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
<!---<Cfoutput>
 <cfif #a_trigger# EQ "1">
<cfif #a_flag# EQ "1">

<cfquery datasource="#request.dsn#">
delete from EventList
 Where 
title_id = #URL.rec_id# AND comp_id = #getcompany.id#
</cfquery>
<cfelse>
<cfquery datasource="#request.dsn#">
delete from EventList
 Where 
title_id = #URL.rec_id# 
</cfquery>
</cfif>
</cfif>
</Cfoutput> --->
<html>
<head>
<title>		View
</title>
</head>

<body bgcolor="silver">
<div align="center">

  <table border="0" cellpadding="0" cellspacing="0" width="650" bgcolor="black">
    <tr>
      <td>
        <div align="center">
        
          <table border="1" cellpadding="1" cellspacing="0" width="650" bgcolor="white">
            <tr>
              <td bgcolor="navy" colspan="7" width="650">
                    <p align="center"><font color="white" face="Arial Black">
<!---Description Bar--->                
 <cfoutput>#DateFormat(ThisDate,'dddd, d, mmmm, yyyy')# <cfset plugday = #DateFormat(ThisDate,'mm/dd/yyyy')#></CFOUTPUT>
  <cfset tempdate = CreateODBCDate(plugday)>
	
	   <cfset temp = #DateFormat(Now(), 'mm/dd/yyyy')#>
	    <cfset current = CreateODBCDate(temp)>      
			 
			  </font></p>
              </td>
             </tr>
             
             

   <cfoutput>
		   <tr>
           
              <td bgcolor="blue" colspan = 9 valign=center width="100%" align="center">
               <font size=3 color=white face=verdana><b>
		Check below for Requested/Scheduled Closings</b></font><br>
		  </td> 
			  
         
		  </tr>
		  <tr>
          <CFSET comparison = DateCompare(tempdate, current)>

              <td bgcolor="white" colspan = 9 valign=center width="100%" align="center">
        
		  <font size=2 color=black face=verdana> 
		  <CFIF #comparison# eq "1"> **If you would like to schedule a new closing please <a href="./title_rep_closing_view.cfm?comp_id=#comp_id#&YearMonthDay=#plugDay#&uid=#url.uid#&al=#url.al#"><font size=3 color=red face=verdana><b>click here</b></font></a><br> 
		  <cfelse>
		 **If you would like to request a new closing, please chose a future date 
		  </cfif>
         
			  </td> 
			  
         
		  </tr>
   </cfoutput>
 
 <tr>
 <td bgcolor="elelel" valign=top width="20" align="center">
             <font size=2 color=blue face=verdana><b>
                Time 
        </b></font>
              </td> 
			<td bgcolor="elelel" valign=top width="40" align="center">
               <font size=2 color=blue face=verdana><b>
                Borrower
        </b></font>
              </td>  
			  <td bgcolor="elelel" valign=top width="30" align="center">
              <font size=2 color=blue face=verdana><b>
                View/Modify Closing
        </b></font>
              </td>  
			<!---   <td bgcolor="elelel" valign=top width="15%" align="center">
              <font size=2 color=blue face=verdana><b>
                Modify
        </b></font>
              </td>  --->
			   <td bgcolor="elelel" valign=top width="20" align="center">
              <font size=2 color=blue face=verdana><b>
                Closing Fee
        </b></font>
              </td>  
			   <td bgcolor="elelel" valign=top width="160" align="center">
              <font size=2 color=blue face=verdana><b>
                Closing Inst. upload time
        </b></font>
              </td>  
			  <td bgcolor="elelel" valign=top width="160" align="center">
              <font size=2 color=blue face=verdana><b>
              Final HUD upload time
        </b></font>
              </td> 
			    <td bgcolor="elelel" valign=top width="160" align="center">
              <font size=2 color=blue face=verdana><b>
             Comments
        </b></font>
              </td> 
			
			  </tr>
<cfif #comp_id# neq "ALL">
<CFSET zip_id_2 = #ListToArray(comp_id, ",")#>
<CFSET cty_name_1 = ArrayNew(1)>
<CFLOOP FROM="1" TO="#ArrayLen(zip_id_2)#" INDEX="MMM">
			<CFSET st_temp = #ListToArray(zip_id_2[MMM], "|")#>

			<CFSET cty_name_1[MMM] = #st_temp[1]#>		
		
		
		</CFLOOP>

<CFLOOP FROM="1" TO="#ArrayLen(cty_name_1)#" INDEX="TTT">

<cfquery datasource="#request.dsn#" name="getList">
select * From EventList
Where (YearMonth = '#YearMonthDay#') AND (comp_id = '#cty_name_1[TTT]#')
order by c_time
</cfquery>



<cfquery datasource="#request.dsn#" name="getList2">
select * From Title_Closing_Order_Request a, EventList b where a.title_id = b.title_id and a.request_date = '#YearMonthDay#' and b.yearmonth is null AND (a.c_comp_id = '#cty_name_1[TTT]#')
order by b.c_time
</cfquery>

 <CFQUERY datasource="#request.dsn#" NAME="read_comp">
						SELECT *
						FROM Companies 
						WHERE ID = #cty_name_1[TTT]#
					</CFQUERY>
			
						
		 <CFSET r_count = #getlist.recordcount# + #getlist2.recordcount#>
<cfoutput> <cfif #r_count# neq 0>
 <tr>
						<td bgcolor="ffff00" colspan = 9 width="100%" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Company: #read_comp.company#. Total of #r_count# records found for #DateFormat(ThisDate,'m/d/yyyy')#
						</td>
						
						</tr>
						
						</cfif> <cfif #getlist2.recordcount# neq 0> <tr>
						<td bgcolor="ffffff" colspan = 9 width="100%" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif #getlist2.recordcount# neq 0>#getlist2.recordcount# are <b>REQUESTED</b> for #DateFormat(ThisDate,'m/d/yyyy')#. See below</cfif>
						
						</td>
						
						</tr></cfif> </cfoutput>
 <cfoutput query="getList2">

 <CFQUERY datasource="#request.dsn#" NAME="get_file2">
						SELECT *
						FROM doc_closer_title
						WHERE title_ID = #title_id#
					</CFQUERY>
           <CFQUERY datasource="#request.dsn#" NAME="get_title">
						SELECT *
						FROM title
						WHERE title_ID = #title_id#
					</CFQUERY>
						
						 <tr>
           
              <td bgcolor="elelel" valign=center width="10%" align="center">
               <font size=1 color=black face=verdana>
			  <b><cfif #getlist2.c_time# eq"">N/A<cfelse>#TimeFormat(getlist2.c_time, "HH:mm:ss")# </cfif></B></font>
              </td> 
            <td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
           
                #get_title.bfirstname1# &nbsp;&nbsp;&nbsp; #get_title.blastname1#</b>
              </td> 
			 
			  <td bgcolor="elelel" valign=center width="15%" align="center">
			  
             <a href="./TITLE_CLOSING_ORDER_REQUEST_VIEW_ONLY.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#getlist2.title_id#"><font size=1 color=blue face=verdana>View/Modify</font></a>	
						
			  </td> 
			 <!---  <td bgcolor="elelel" valign=center width="15%" align="center">
			  
            <a href="./title_closing_info.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#getlist2.title_id#"><font size=1 color=red face=verdana>Modify Closing</font></a>	
						
			  </td>    --->
			  <td bgcolor="elelel" valign=center width="10%" align="center">
    <cfif  #getlist2.fee# neq "">
	 <font size=1 color=black face=verdana><b>#getlist2.fee#</FONT></B><cfelse><font size=1 color=black face=verdana><b>N/A</FONT></B></cfif>  </td>  
	
			   <td bgcolor="elelel" valign=center width="30%" align="center">
      <cfif #get_file2.closing_instructions# neq "">
	     <A HREF="#fileSys.FindFilePath('#get_file2.closing_instructions#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(get_file2.closing_inst_date,'m/d/yyyy')#&nbsp;#TimeFormat(get_file2.closing_inst_time, "HH:mm:ss")#</b></a>
		 <cfelse><B><font size=1 color=black face=verdana>N/A</B></cfif> </td>  
		   <td bgcolor="elelel" valign=center width="30%" align="center">
      <cfif #get_file2.final_hud# neq "">
	     <A HREF="#fileSys.FindFilePath('#get_file2.final_HUD#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(get_file2.final_hud_date,'m/d/yyyy')#&nbsp;#TimeFormat(get_file2.final_hud_time, "HH:mm:ss")#</b></a>
		 <cfelse><B><font size=1 color=black face=verdana>N/A</B></cfif> </td>    
		  <td bgcolor="elelel" valign=center width="30%" align="center">
		  <a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#getlist2.title_id#&user_id=0&company_id=0&a_trigger=0" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	</td>
		  </tr>
 </cfoutput>  <cfoutput>  <cfif #getlist.recordcount# neq 0> <tr>
						<td bgcolor="white" colspan = 9 width="100%" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif #getlist.recordcount# neq 0>#getlist.recordcount# are <b>SCHEDULED</b> for #DateFormat(ThisDate,'m/d/yyyy')#. See below</cfif>
						
						</td>
						
						</tr></cfif> </cfoutput>
<cfoutput query="getList">

 <CFQUERY datasource="#request.dsn#" NAME="get_file">
						SELECT *
						FROM doc_closer_title
						WHERE title_ID = #title_id#
					</CFQUERY>
           
		      
		   
		    <tr>
           
              <td bgcolor="elelel" valign=center width="10%" align="center">
               <font size=1 color=black face=verdana>
			  <b><cfif #getlist.c_time# eq"">N/A<cfelse>#TimeFormat(getlist.c_time, "HH:mm:ss")# </cfif></B></font>
              </td> 
            <td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
           
              #getlist.b_fname# &nbsp;&nbsp;&nbsp; #getlist.b_lname#</b>
              </td> 
			 
			  <td bgcolor="elelel" valign=center width="15%" align="center">
			  
             <a href="./calendar_closing_info.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#getlist.title_id#"><font size=1 color=blue face=verdana>View/Modify</font></a>	
						
			  </td> 
			 <!---  <td bgcolor="elelel" valign=center width="15%" align="center">
			  
            <a href="./title_closing_info.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#getlist.title_id#"><font size=1 color=red face=verdana>Modify Closing</font></a>	
						
			  </td>    --->
			  <td bgcolor="elelel" valign=center width="10%" align="center">
    <cfif  #getlist.fee# neq "">
	 <font size=1 color=black face=verdana><b>#getlist.fee#</FONT></B><cfelse><font size=1 color=black face=verdana><b>N/A</FONT></B></cfif>  </td>  
	
			   <td bgcolor="elelel" valign=center width="30%" align="center">
      <cfif #get_file.closing_instructions# neq "">
	     <A HREF="#fileSys.FindFilePath('#get_file.closing_instructions#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(get_file.closing_inst_date,'m/d/yyyy')#&nbsp;#TimeFormat(get_file.closing_inst_time, "HH:mm:ss")#</b></a>
		 <cfelse><B><font size=1 color=black face=verdana>N/A</B></cfif> </td>  
		   <td bgcolor="elelel" valign=center width="30%" align="center">
      <cfif #get_file.final_hud# neq "">
	     <A HREF="#fileSys.FindFilePath('#get_file.final_HUD#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(get_file.final_hud_date,'m/d/yyyy')#&nbsp;#TimeFormat(get_file.final_hud_time, "HH:mm:ss")#</b></a>
		 <cfelse><B><font size=1 color=black face=verdana>N/A</B></cfif> </td>    
		  <td bgcolor="elelel" valign=center width="30%" align="center">
		  <a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#getlist.title_id#&user_id=0&company_id=0&a_trigger=0" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	</td>
		  </tr>
 </cfoutput>

 
 
 </CFLOOP>
 
 <cfelse>
 <cfquery datasource="#request.dsn#" name="getList">
select * From EventList
Where (YearMonth = '#YearMonthDay#')
order by c_time
</cfquery>
  <cfquery datasource="#request.dsn#" name="getList2">
select * From Title_Closing_Order_Request a, EventList b where a.title_id = b.title_id and a.request_date = '#YearMonthDay#' and b.yearmonth is null
order by b.c_time
</cfquery>

 
 
<cfoutput>
  <CFSET r_count = #getlist.recordcount# + #getlist2.recordcount#> <tr>
						<td bgcolor="00ff00" colspan = 9 width="100%" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Company: ALL. Total of #r_count# records found for #DateFormat(ThisDate,'m/d/yyyy')# 
						</td>
						
						</tr>    <cfif #getlist2.recordcount# neq 0> <tr>
						<td bgcolor="yellow" colspan = 9 width="100%" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif #getlist2.recordcount# neq 0>#getlist2.recordcount# are <b>REQUESTED</b> for #DateFormat(ThisDate,'m/d/yyyy')#. See below</cfif>
						
						</td>
						
						</tr></cfif></cfoutput>
 <cfoutput query="getList2"> 
 <CFQUERY datasource="#request.dsn#" NAME="get_file2">
						SELECT *
						FROM doc_closer_title
						WHERE title_ID = #title_id#
					</CFQUERY>
 <CFQUERY datasource="#request.dsn#" NAME="get_title">
						SELECT *
						FROM title
						WHERE title_ID = #title_id#
					</CFQUERY>
		
		    <tr>
           
              <td bgcolor="white" valign=center width="10%" align="center">
               <font size=1 color=black face=verdana>
			  <b><cfif #getlist2.c_time# eq"">N/A<cfelse>#TimeFormat(getlist2.c_time, "HH:mm:ss")# </cfif> </B></font>
              </td> 
            <td bgcolor="white" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
           
              #get_title.bfirstname1# &nbsp;&nbsp;&nbsp; #get_title.blastname1#</b>
              </td> 
			 
			  <td bgcolor="white" valign=center width="15%" align="center">
			  
         <a href="./TITLE_CLOSING_ORDER_REQUEST_VIEW_ONLY.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#getlist2.title_id#"><font size=1 color=blue face=verdana>View/Modify</font></a>	
						
			  </td> 
			 <!---  <td bgcolor="white" valign=center width="15%" align="center">
			  
            <a href="./title_closing_info.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#getlist2.title_id#"><font size=1 color=red face=verdana>Modify Closing</font></a>	
				
			  </td>   --->
			     <td bgcolor="white" valign=center width="10%" align="center">
<cfif  #getlist2.fee# neq "">
	 <font size=1 color=black face=verdana><b>#getlist2.fee#</FONT></B><cfelse><font size=1 color=black face=verdana><b>N/A</FONT></B></cfif>  </td>  
				   
         <td bgcolor="white" valign=center width="30%" align="center">
      <cfif #get_file2.closing_instructions# neq "">
	     <A HREF="#fileSys.FindFilePath('#get_file2.closing_instructions#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(get_file2.closing_inst_date,'m/d/yyyy')#&nbsp;#TimeFormat(get_file2.closing_inst_time, "HH:mm:ss")#</b></a>
		<cfelse><B><font size=1 color=black face=verdana>N/A</B></cfif>  </td>  
		   <td bgcolor="white" valign=center width="30%" align="center">
      <cfif #get_file2.final_hud# neq "">
	     <A HREF="#fileSys.FindFilePath('#get_file2.final_HUD#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(get_file2.final_hud_date,'m/d/yyyy')#&nbsp;#TimeFormat(get_file2.final_hud_time, "HH:mm:ss")#</b></a>
		   <cfelse><B><font size=1 color=black face=verdana>N/A</B></cfif></td>   
		     <td bgcolor="white" valign=center width="30%" align="center">
		  <a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#getlist2.title_id#&user_id=0&company_id=0&a_trigger=0" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	</td>
		
		  </tr>
		  <CFSET count = 1>
 </cfoutput> 
 <cfif #getlist.recordcount# neq 0>
 <cfoutput> <tr>
						<td bgcolor="yellow" colspan = 9 width="100%" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif #getlist.recordcount# neq 0>#getlist.recordcount# are <b>SCHEDULED</b> for #DateFormat(ThisDate,'m/d/yyyy')#. See below</cfif>
						
						</td>
						
						</tr></cfoutput> </cfif> 
 <cfoutput query="getList"> 
 <CFQUERY datasource="#request.dsn#" NAME="get_file">
						SELECT *
						FROM doc_closer_title
						WHERE title_ID = #title_id#
					</CFQUERY>
 
		    <tr>
           
              <td bgcolor="elelel" valign=center width="10%" align="center">
               <font size=1 color=black face=verdana>
			  <b><cfif #getlist.c_time# eq"">N/A<cfelse>#TimeFormat(getlist.c_time, "HH:mm:ss")# </cfif> </B></font>
              </td> 
            <td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
           
              #getlist.b_fname# &nbsp;&nbsp;&nbsp; #getlist.b_lname#</b>
              </td> 
			 
			  <td bgcolor="elelel" valign=center width="15%" align="center">
			  
         <a href="./calendar_closing_info.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#getlist.title_id#"><font size=1 color=blue face=verdana>View/Modify</font></a>	
						
			  </td> 
			<!---   <td bgcolor="elelel" valign=center width="15%" align="center">
			  
            <a href="./title_closing_info.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#getlist.title_id#"><font size=1 color=red face=verdana>Modify Closing</font></a>	
				
			  </td>   --->
			     <td bgcolor="elelel" valign=center width="10%" align="center">
<cfif  #getlist.fee# neq "">
	 <font size=1 color=black face=verdana><b>#getlist.fee#</FONT></B><cfelse><font size=1 color=black face=verdana><b>N/A</FONT></B></cfif>  </td>  
				   
         <td bgcolor="elelel" valign=center width="30%" align="center">
      <cfif #get_file.closing_instructions# neq "">
	     <A HREF="#fileSys.FindFilePath('#get_file.closing_instructions#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(get_file.closing_inst_date,'m/d/yyyy')#&nbsp;#TimeFormat(get_file.closing_inst_time, "HH:mm:ss")#</b></a>
		<cfelse><B><font size=1 color=black face=verdana>N/A</B></cfif>  </td>  
		   <td bgcolor="elelel" valign=center width="30%" align="center">
      <cfif #get_file.final_hud# neq "">
	     <A HREF="#fileSys.FindFilePath('#get_file.final_HUD#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(get_file.final_hud_date,'m/d/yyyy')#&nbsp;#TimeFormat(get_file.final_hud_time, "HH:mm:ss")#</b></a>
		   <cfelse><B><font size=1 color=black face=verdana>N/A</B></cfif></td>    
		   <td bgcolor="elelel" valign=center width="30%" align="center">
		  <a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#getlist.title_id#&user_id=0&company_id=0&a_trigger=0" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	</td>
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

