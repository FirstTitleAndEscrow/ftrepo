<CFPARAM NAME="a_flag" DEFAULT="">
<CFPARAM NAME="comp_id" DEFAULT="">
<cfquery datasource="#request.dsn#" name="getuser">

select * from first_admin
where id = #session.ft_user_id#
</cfquery>

<cfoutput>
<cfif #a_flag# EQ "2">
<cfquery datasource="#request.dsn#" name="getcompany">

select * from companies
where id = #URL.comp_id#
</cfquery>
</cfif>

</cfoutput>
<CFQUERY datasource="#request.dsn#" NAME="aaaa">		
				SELECT *
				FROM eventlist
				Where Title_Id = #URL.rec_id#
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
<title>		View
</title>
</head>

<body bgcolor="elelel">
<div align="center">

  <table border="0" cellpadding="1" cellspacing="1" width="650" bgcolor="blue">
    <tr>
      <td>
        <div align="center">
        
          <table border="0" cellpadding="1" cellspacing="1" width="650" bgcolor="blue">
            <tr>
              <td bgcolor="blue" colspan="3" width="544">
                    <p align="center"><font color="white" face="Arial Black">
<!---Description Bar--->                
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<cfoutput>#DateFormat(ThisDate,'dddd, d, mmmm, yyyy')#</CFOUTPUT>
                    </font></p>
              </td>
             </tr>
             
             
    <cfquery datasource="#request.dsn#" name="getList">
select * From EventList
Where title_id = #aaaa.title_id#
</cfquery>         



 
<cfoutput>
   <cfif #a_flag# EQ "2">
              <form action="./calendar_modify_submit.cfm?a_flag=1&F=#URL.F#&rec_id=#getlist.title_id#&comp_id=#getcompany.id#&YearMonthDay=#yearMonthDay#&UserID=#getuser.ID#&uid=#URL.uid#" method="post">
            <cfelse>
			<form action="./calendar_modify_submit.cfm?F=#URL.F#&rec_id=#getlist.title_id#&YearMonthDay=#yearMonthDay#&UserID=#getuser.ID#&uid=#URL.uid#" method="post">
       </Cfif>
	   </cfoutput>
          
  <table border="0" cellpadding="2" cellspacing="2" width="650" bgcolor="elelel">

 
             
         
	   <center> 
     <td bgcolor="elelel" width="300">
        <font color="blue" face="Arial"><b>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    Change Closing Date
        </b></font>
      </td>
    
              

	<cfoutput>				
<td bgcolor="elelel" width="472">



   <select name="confirm_mon">
	 	<Cfif #getList.recordcount# GT "0">
<Cfif (#aaaa.c_month# EQ "10") or (#aaaa.c_month# EQ "11") or (#aaaa.c_month# EQ "12")>
<option value="#aaaa.c_month#" selected>#aaaa.c_month#
<cfelse>
<option value="#aaaa.c_month#" selected>#aaaa.c_month#
</cfif>

<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
		<option value="4">4</option>
		<option value="5">5</option>
		<option value="6">6</option>
		<option value="7">7</option>
		<option value="8">8</option>
		<option value="9">9</option>
		<option value="10">10</option>
		<option value="11">11</option>
		<option value="12">12</option>
<cfelse>
<option value="">Month</option>

		
	   	<option value="01">January</option>
		<option value="02">February</option>
		<option value="03">March</option>
		<option value="04">April</option>
		<option value="05">May</option>
		<option value="06">June</option>
		<option value="07">July</option>
		<option value="08">August</option>
		<option value="09">September</option>
		<option value="10">October</option>
		<option value="11">November</option>
		<option value="12">December</option>
</cfif>
		
		
</select>   
	  
	  
<select name="comfirm_day">
	 	<Cfif #getList.recordcount# GT "0">
<Cfif (#aaaa.c_day# EQ "10") or (#aaaa.c_day# EQ "11") or (#aaaa.c_day# EQ "12")or (#aaaa.c_day# EQ "13")
or (#aaaa.c_day# EQ "14")or (#aaaa.c_day# EQ "15")or (#aaaa.c_day# EQ "16") or (#aaaa.c_day# EQ "17")
or (#aaaa.c_day# EQ "18")or (#aaaa.c_day# EQ "19")or (#aaaa.c_day# EQ "20")or (#aaaa.c_day# EQ "21")
or (#aaaa.c_day# EQ "22")or (#aaaa.c_day# EQ "23")or (#aaaa.c_day# EQ "24")or (#aaaa.c_day# EQ "24")
or (#aaaa.c_day# EQ "25")or (#aaaa.c_day# EQ "26")or (#aaaa.c_day# EQ "27")or (#aaaa.c_day# EQ "28")
or (#aaaa.c_day# EQ "29")or (#aaaa.c_day# EQ "30")or (#aaaa.c_day# EQ "31")>
<option value="#aaaa.c_day#" selected>#aaaa.c_day#
<cfelse>
<option value="#aaaa.c_day#" selected>0#aaaa.c_day#
</cfif>
<cfelse>
<OPTION VALUE="">Day</OPTION>
</cfif>
		<OPTION VALUE="01">01</OPTION>
		<OPTION VALUE="02">02</OPTION>
		<OPTION VALUE="03">03</OPTION>
		<OPTION VALUE="04">04</OPTION>
		<OPTION VALUE="05">05</OPTION>
		<OPTION VALUE="06">06</OPTION>
		<OPTION VALUE="07">07</OPTION>
		<OPTION VALUE="08">08</OPTION>
		<OPTION VALUE="09">09</OPTION>
		<OPTION VALUE="10">10</OPTION>
		<OPTION VALUE="11">11</OPTION>
		<OPTION VALUE="12">12</OPTION>
		<OPTION VALUE="13">13</OPTION>
		<OPTION VALUE="14">14</OPTION>
		<OPTION VALUE="15">15</OPTION>
		<OPTION VALUE="16">16</OPTION>
		<OPTION VALUE="17">17</OPTION>
		<OPTION VALUE="18">18</OPTION>
		<OPTION VALUE="19">19</OPTION>
		<OPTION VALUE="20">20</OPTION>
		<OPTION VALUE="21">21</OPTION>
		<OPTION VALUE="22">22</OPTION>
		<OPTION VALUE="23">23</OPTION>
		<OPTION VALUE="24">24</OPTION>
		<OPTION VALUE="25">25</OPTION>
		<OPTION VALUE="26">26</OPTION>
		<OPTION VALUE="27">27</OPTION>
		<OPTION VALUE="28">28</OPTION>
		<OPTION VALUE="29">29</OPTION>
		<OPTION VALUE="30">30</OPTION>			
		<OPTION VALUE="31">31</OPTION>
</select> 
<select name="confirm_year">
		<Cfif #getList.recordcount# GT "0">
<option value="#getList.c_year#" selected>#getList.c_year#
<cfelse>
<option value="">Year</option>
</cfif>
	   	<option value="2000">2000</option>
		<option value="2001">2001</option>
		<option value="2002">2002</option>
		<option value="2003">2003</option>
		<option value="2004">2004</option>
		<option value="2005">2005</option>
		<option value="2006">2006</option>
		<option value="2007">2007</option>
		<option value="2008">2008</option>
		<option value="2009">2009</option>
		<option value="2010">2010</option>
		<option value="2011">2011</option>
		<option value="2012">2012</option>
		<option value="2013">2013</option>
		<option value="2014">2014</option>
		<option value="2015">2015</option>
<option value="2016">2016</option>
<option value="2017">2017</option>
<option value="2018">2018</option>
<option value="2019">2019</option>
<option value="2020">2020</option>
		</select>
		
		<select size="1" name="StartTime">
  
<Cfif #getList.recordcount# GT "0">
<option value="#getList.c_Time#" selected>#getList.C_Time#
<cfelse>
<option value="">Time</option>
</cfif>
<option value="08:00 am">8:00 am
<option value="08:30 am">8:30 am
<option value="09:00 am">9:00 am
<option value="09:30 am">9:30 am
<option value="10:00 am">10:00 am
<option value="10:30 am">10:30 am
<option value="11:00 am">11:00 am
<option value="11:30 am">11:30 am
<option value="12:00 am">12:00 pm
<option value="12:30 am">12:30 pm
<option value="1:00 pm">1:00 pm
<option value="1:30 pm">1:30 pm
<option value="2:00 pm">2:00 pm
<option value="2:30 pm">2:30 pm
<option value="3:00 pm">3:00 pm
<option value="3:30 pm">3:30 pm
<option value="4:00 pm">4:00 pm
<option value="4:30 pm">4:30 pm
<option value="5:00 pm">5:00 pm
<option value="5:30 pm">5:30 pm
<option value="6:00 pm">6:00 pm
<option value="6:30 pm">6:30 pm
<option value="7:00 pm">7:00 pm
<option value="7:30 pm">7:30 pm
<option value="8:00 pm">8:00 pm
<option value="8:30 pm">8:30 pm
<option value="9:00 pm">9:00 pm
<option value="9:30 pm">9:30 pm
<option value="10:30 pm">10:30 pm
<option value="11:00 pm">11:00 pm
</SELECT> 
              						
	 </cfoutput>	
<input type=image src="./images/button_modify.gif" border=0>
  
              
       </td>
 </center> 
     </tr>
      
      
                </table>
                
              </div>
              </td>

   
                <tr>
       <td bgcolor="elelel" width="228" align="center">
    
              </td>
            </tr> 
            
            
          </table>
</form>                    
          
       
 
          
        </div>

      </td>
    </tr>
  </table>
  

