

<CFPARAM NAME="a_flag" DEFAULT="">
<Cfif (#form.confirm_mon# EQ "10") or (#form.confirm_mon# EQ "11") or (#form.confirm_mon# EQ "12")>
<CFSET mon_confirm = #form.confirm_mon#>
<cfelse>
<cfset mon_confirm = '00#form.confirm_mon#'>
</cfif>


<cfoutput>
<Cfif #a_flag# EQ "1">
<cfquery datasource="#request.dsn#">
update EventList
set 
c_month = '00#mon_confirm#',
c_day = #form.comfirm_day#,
c_year = #form.confirm_year#,
c_time = '#form.starttime#',
YearMonthDay = '#form.confirm_year##form.confirm_mon##form.comfirm_day#'
Where 
title_id = #URL.rec_id# AND comp_id = #URL.comp_id#
</cfquery>
<cfelse>
<cfquery datasource="#request.dsn#">
update EventList
set 
c_month = #form.confirm_mon#,
c_day = #form.comfirm_day#,
c_year = #form.confirm_year#,
c_time = '#form.starttime#',
YearMonthDay = '#form.confirm_year##form.confirm_mon##form.comfirm_day#'
Where 
title_id = #URL.rec_id#
</cfquery>
</cfif>
</cfoutput>


<html>
<head>
<title>		View
</title>
</head>

<body bgcolor="elelel">
<div align="center">

  <table border="0" cellpadding="0" cellspacing="0" width="650" bgcolor="black">
    <tr>
      <td>
        <div align="center">
        
          <table border="0" cellpadding="2" cellspacing="2" width="650" bgcolor="blue">
            <tr>
              <td bgcolor="blue" colspan="3" width="544">
                    <p align="center"><font color="white" face="Arial Black">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The Closing date has been changed 
                    </font></p>
              </td>
             </tr>
             
             
           



 

          
  
              

					


              


       
            
          </table>
</div>

      </td>
    </tr>
  </table>   </div>
 </body> 
</html>
