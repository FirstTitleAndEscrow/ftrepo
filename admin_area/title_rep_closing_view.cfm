
<CFSET r_count = "0">
<CFQUERY datasource="#request.dsn#" NAME="read_user" cachedwithin="#CreateTimeSpan(0,0,1,0)#">
	SELECT  *
	FROM	First_Admin 
	where id = #url.uid#
</CFQUERY>

	
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>

<script type="text/javascript">
function monthresult() {
var frm;
frm = document.frm;


if (frm.confirm_mon.value != 'Month') {

  frm.confirm_mon_to.value = frm.confirm_mon.options[frm.confirm_mon.selectedIndex].value;

}
}

</script>
<script type="text/javascript">
function dayresult() {
var frm;
frm = document.frm;
if (frm.comfirm_day.value != 'Day') {
 frm.comfirm_day_to.value = frm.comfirm_day.options[frm.comfirm_day.selectedIndex].value;
}
}
</script>
<script type="text/javascript">
function yearresult() {
var frm;
frm = document.frm;
if (frm.confirm_year.value != 'Year') {

frm.confirm_year_to.value = frm.confirm_year.options[frm.confirm_year.selectedIndex].value;
}
}

</script>
<script type="text/javascript">
function stateSelect() {
var frm;
frm = document.frm;


  frm.state.options[0].selected = false;


}

</script>

</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>
<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=780 align=center valign=top>
		
<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=780 align=center valign=top bgcolor=e1e1e1>
		
	
<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->

<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=780 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Title Commitment Report Search</B></CENTER>
			</TD>
		</TR>
<CFFORM NAME="frm" ACTION="./title_rep_closing_display.cfm?uid=#URL.uid#&al=#URL.al#&comp_id=#comp_id#&YearMonthDay=#YearMonthDay#&a_trigger=1" METHOD=POST>
<tr>
			<td width=780 align=center valign=top bgcolor=d3d3d3>
		
	


<table width=850 cellpadding=1 cellspacing=1 border=0>
							
							
							
							
							
							<tr>
						<nobr><td bgcolor=d3d3d3 width=850 align=center valign=top>
								<B>FROM</B>
		<select name="confirm_mon" onChange="monthresult()"
		
											size="1" 
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: BLUE; 
											background-color: E4E3E3; 
											border-color: white; 
											border-left-width: thin; 
											border-right-width: thin; 
											border-top-width: thin; 
											border-bottom-width: thin; 
											border-width: thin; 
											border-style: bar; 
											clear: none; 
											float: none;" 
											rows="3" 
											cols="45" 
											>
<option value="Month">Month</option>

		
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


</select>

<select name="comfirm_day" onChange="dayresult()"
size="1" 
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: BLUE; 
											background-color: E4E3E3; 
											border-color: white; 
											border-left-width: thin; 
											border-right-width: thin; 
											border-top-width: thin; 
											border-bottom-width: thin; 
											border-width: thin; 
											border-style: bar; 
											clear: none; 
											float: none;" 
											rows="3" 
											cols="45" 
											>



<OPTION VALUE="Day">Day</OPTION>

	 	
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
<select name="confirm_year" onChange="yearresult()"
size="1" 
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: BLUE; 
											background-color: E4E3E3; 
											border-color: white; 
											border-left-width: thin; 
											border-right-width: thin; 
											border-top-width: thin; 
											border-bottom-width: thin; 
											border-width: thin; 
											border-style: bar; 
											clear: none; 
											float: none;" 
											rows="3" 
											cols="45" 
											>
		


<option value="Year">Year</option>

		
		
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
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <B>TO</B>

		<select name="confirm_mon_to"
		size="1" 
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: BLUE; 
											background-color: E4E3E3; 
											border-color: white; 
											border-left-width: thin; 
											border-right-width: thin; 
											border-top-width: thin; 
											border-bottom-width: thin; 
											border-width: thin; 
											border-style: bar; 
											clear: none; 
											float: none;" 
											rows="3" 
											cols="45" 
											>

<option value="Month">Month</option>

		
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


</select>

<select name="comfirm_day_to"
size="1" 
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: BLUE; 
											background-color: E4E3E3; 
											border-color: white; 
											border-left-width: thin; 
											border-right-width: thin; 
											border-top-width: thin; 
											border-bottom-width: thin; 
											border-width: thin; 
											border-style: bar; 
											clear: none; 
											float: none;" 
											rows="3" 
											cols="45" 
											>



<OPTION VALUE="Day">Day</OPTION>

	 	
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
<select name="confirm_year_to"
size="1" 
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: BLUE; 
											background-color: E4E3E3; 
											border-color: white; 
											border-left-width: thin; 
											border-right-width: thin; 
											border-top-width: thin; 
											border-bottom-width: thin; 
											border-width: thin; 
											border-style: bar; 
											clear: none; 
											float: none;" 
											rows="3" 
											cols="45" 
											>
		


<option value="Year">Year</option>

		
		
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
						</td></nobr>
					</tr>
				</table>		
					<table width=650 cellpadding=1 cellspacing=1 border=0>
					
				
							<tr>
					<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Title Number
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
						<cfif #comp_id# eq "ALL">
							<cfif #url.uid# eq "92">

<CFQUERY datasource="#request.dsn#" NAME="read_titleid">
		
			SELECT a.title_id
			FROM title a, Title_Closing_Order_Request b
			where a.title_id = b.title_id and b.request_date is null and comp_ID = 128 or comp_ID = 115 or comp_id = 154 or comp_id = 155 or comp_id = 156 or comp_id = 157 or comp_id = 158 or comp_id = 159 or comp_id = 160 or comp_id = 161 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 166 or comp_id = 167 or comp_id = 168 or comp_id = 169 or comp_id = 170 or comp_id = 182 or comp_id = 181 or comp_id = 183 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 192 or comp_id = 190 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197  or comp_id = 198  or comp_id = 199  or comp_id = 200  or comp_id = 201 or comp_ID = 210 or comp_ID = 213 or comp_ID = 141
			ORDER BY a.Title_id
		
		</CFQUERY>
	<cfelseif #url.uid# eq "93">	
		
		<CFQUERY datasource="#request.dsn#" NAME="read_titleid">
		
			SELECT a.title_id
			FROM title a, Title_Closing_Order_Request b
			where a.title_id = b.title_id and  b.request_date is null and comp_ID = 211 or comp_ID = 174 or comp_ID = 208
			ORDER BY a.itle_id
		
		</CFQUERY>
		<cfelse>
<cfset va_comps = "">
<CFQUERY datasource="#request.dsn#" NAME="get_va_companies" cachedwithin="#CreateTimeSpan(0,0,1,0)#">
	SELECT  ID
	FROM	companies 
	where intSales in (Select ID from First_admin where va_employee = 1)
</CFQUERY>
<cfset va_comps = ValueList(get_va_companies.ID)>


<cfset fx_comps = "">
<CFQUERY datasource="#request.dsn#" NAME="get_fx_companies" cachedwithin="#CreateTimeSpan(0,0,1,0)#">
	SELECT  ID
	FROM	companies 
	where intSales in (Select ID from First_admin where ft_fairfax_employee = 1)
</CFQUERY>
<cfset fx_comps = ValueList(get_fx_companies.ID)>

		<CFQUERY datasource="#request.dsn#" NAME="read_titleid">
		
			SELECT a.title_id
			FROM title a, Title_Closing_Order_Request b
			 where  b.request_date is null 
		<cfif read_user.va_admin eq 'True' and ListLen(va_comps,",") gt 0>
		and a.comp_id IN (#va_comps#)
		<cfelseif read_user.ft_fairfax_admin eq 'True' and ListLen(fx_comps,",") gt 0>
		and a.comp_id IN (#fx_comps#)
		</cfif>
			and a.title_id = b.title_id
			ORDER BY a.Title_id
		
		</CFQUERY>
		</cfif>
	
	<SELECT NAME="Title_id"			
								size="1" 
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: blue; 
								background-color: e1e1e1; 
								border-color: e1e1e1; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none; 
								float: none;" 
								rows="5" 
								cols="45" 
								>
								<OPTION VALUE="NONE">N/A</OPTION>
								<CFOUTPUT QUERY="read_titleid"><OPTION VALUE="#Title_ID#">#Title_ID#</OPTION></CFOUTPUT>			
							</SELECT>
	
	<cfelse>
	

<SELECT NAME="Title_id"			
								size="1" 
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: blue; 
								background-color: e1e1e1; 
								border-color: e1e1e1; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none; 
								float: none;" 
								rows="5" 
								cols="45" 
								>
								<OPTION VALUE="NONE">N/A</OPTION>
								<CFSET zip_id_2 = #ListToArray(comp_id, ",")#>
<CFSET cty_name_1 = ArrayNew(1)>
<CFLOOP FROM="1" TO="#ArrayLen(zip_id_2)#" INDEX="MMM">
			<CFSET st_temp = #ListToArray(zip_id_2[MMM], "|")#>

			<CFSET cty_name_1[MMM] = #st_temp[1]#>		
		
		
		</CFLOOP>

<CFLOOP FROM="1" TO="#ArrayLen(cty_name_1)#" INDEX="TTT">
					<cfif #url.uid# eq "92">				
				<CFQUERY datasource="#request.dsn#" NAME="read_titleid">
		
			SELECT distinct a.title_id
			FROM title a, Title_Closing_Order_Request b
			where a.title_id = b.title_id and b.request_date is null (comp_id = '#cty_name_1[TTT]#') and comp_ID = 128 or comp_ID = 115 or comp_id = 154 or comp_id = 155 or comp_id = 156 or comp_id = 157 or comp_id = 158 or comp_id = 159 or comp_id = 160 or comp_id = 161 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 166 or comp_id = 167 or comp_id = 168 or comp_id = 169 or comp_id = 170 or comp_id = 182 or comp_id = 181 or comp_id = 183 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 192 or comp_id = 190 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197  or comp_id = 198  or comp_id = 199  or comp_id = 200  or comp_id = 201 or comp_ID = 210 or comp_ID = 213 or comp_ID = 141
			ORDER BY a.Title_id
		
		</CFQUERY>
	<cfelseif #url.uid# eq "93">	
		
		<CFQUERY datasource="#request.dsn#" NAME="read_titleid">
		
			SELECT distinct a.title_id
			FROM title a, Title_Closing_Order_Request b
			where   a.title_id = b.title_id and b.request_date is null and comp_ID = 211 or comp_ID = 174 or comp_ID = 208 AND (comp_id = '#cty_name_1[TTT]#')
			ORDER BY a.itle_id
		
		</CFQUERY>
		<cfelse>
		<CFQUERY datasource="#request.dsn#" NAME="read_titleid">
		
			SELECT distinct a.title_id
			FROM title a, Title_Closing_Order_Request b
			 where a.title_id = b.title_id and b.request_date is null AND (comp_id = '#cty_name_1[TTT]#')  
			ORDER BY a.Title_id
		
		</CFQUERY>
		</cfif>						
								
								<CFOUTPUT QUERY="read_titleid"><OPTION VALUE="#Title_ID#">#Title_ID#</OPTION></CFOUTPUT>			
</cfloop>
							</SELECT>


</cfif>				
							
							
						</td>
					</tr>
		<!--- ================================================== --->
				<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Number -
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<input type=text name="loan_number" size=15 maxlength=15
								size="1" 
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: blue; 
								background-color: e6e6e6; 
								border-color: e6e6e6; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" 
								>
						</td>
					</tr>
				

		<!--- ================================================== --->						
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="Appraisal_status"			
								size="1" 
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: blue; 
								background-color: e1e1e1; 
								border-color: e1e1e1; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none; 
								float: none;" 
								rows="5" 
								cols="45" 
								>
								<OPTION VALUE="NONE">N/A</OPTION>
								 <option value="In Process" style="thin">In Process</OPTION>	 
	  <option value="In Typing">In Typing</OPTION>
	<option value="Report E-mailed" style="thin">Report E-mailed</OPTION>
	<option value="Report Faxed" style="thin" >Report Faxed</OPTION>
								</SELECT>
						</td>
					</tr>
						
					
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Buyer First Name -  
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<input type=text name="buyer_fname" size=25 maxlength=15
								size="1" 
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: blue; 
								background-color: e6e6e6; 
								border-color: e6e6e6; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>
		<!--- ================================================== --->						
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Buyer Last Name -  
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<input type=text name="buyer_lname"  size=25 maxlength=25
								size="1" 
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: blue; 
								background-color: e6e6e6; 
								border-color: e6e6e6; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>
					
			<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Sort By
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="sortorder"			
								size="1" 
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: blue; 
								background-color: e1e1e1; 
								border-color: e1e1e1; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none; 
								float: none;" 
								rows="5" 
								cols="45" 
								>
<OPTION VALUE="NONE">N/A</OPTION>
<OPTION VALUE="check_date">Order Date</OPTION>
<OPTION VALUE="Title_id">Order Number</OPTION>
<OPTION VALUE="appraisal_status">Status</OPTION>
<OPTION VALUE="User_ID">Loan Processor</OPTION>
</SELECT>
						</td>
					</tr>	
						

					<tr>
						<td bgcolor=d3d3d3 colspan=2 width=650 align=right valign=top>
							<INPUT TYPE=image src="./images/button_search.gif" border=0> 
						</td>

					</tr>
</CFFORM>
<!--- ======================================================================== --->

				</table>
			</TD>
		</TR>



<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->

			</TD>
		</TR>

	</table>



			

			
			</TD>
		</TR>

	</table>

			
			</TD>
		</TR>

	</table>
	
</BODY>
</HTML>
	
	
	