<CFPARAM NAME="username" DEFAULT="">
<CFPARAM NAME="password" DEFAULT="">
<CFPARAM NAME="delinq" DEFAULT="0">
<CFPARAM NAME="paddress" DEFAULT="">
<CFPARAM NAME="pcity" DEFAULT="">
<CFPARAM NAME="pstate" DEFAULT="">
<CFPARAM NAME="pzip" DEFAULT="">
<CFPARAM NAME="pcounty" DEFAULT="">
<CFPARAM NAME="taxid" DEFAULT="">
<CFPARAM NAME="tx" DEFAULT="">
<CFPARAM NAME="Tax_Accessed_Value" DEFAULT="">
<CFPARAM NAME="Tax_Land_Value" DEFAULT="">
<CFPARAM NAME="howoften" DEFAULT="">
<CFPARAM NAME="tax_year" DEFAULT="">
<CFPARAM NAME="duedate" DEFAULT="">     
<CFPARAM NAME="stat" DEFAULT="">  
<CFPARAM NAME="Tax_Delinquent_Amount" DEFAULT="">      
<CFPARAM NAME="Tax_Delinquent_Year" DEFAULT="">      
<CFPARAM NAME="Tax_Delinquent_Exemption" DEFAULT="">      
<CFPARAM NAME="Tax_address" DEFAULT="">      
<CFPARAM NAME="Tax_city" DEFAULT="">  
<CFPARAM NAME="Tax_State" DEFAULT="">  
<CFPARAM NAME="Tax_Zip" DEFAULT="">  
<CFPARAM NAME="infotax" DEFAULT="">  

<CFQUERY datasource="#request.dsn#" NAME="read_report">
    SELECT *
	FROM tax_cert_prop
	where prop_id = #rec_id#
</CFQUERY>
		
<CFQUERY datasource="#request.dsn#" NAME="read_title">
    SELECT *
	FROM Property
	WHERE prop_ID = #rec_ID#
</CFQUERY>









<CFQUERY datasource="#request.dsn#" NAME="read_title_abstract">
	SELECT *
	FROM Doc_Abstract_Prop
	WHERE prop_ID = #rec_id#
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_assigned_abstractor">
	SELECT *
	FROM Abstractors 
	WHERE abstractor_ID = '#read_title_abstract.abstractor_tax_ID#'
</CFQUERY> 
<CFIF #read_title_abstract.abstractor_ID_2# neq "">
	<CFQUERY datasource="#request.dsn#" NAME="read_assigned_abstractor_2">
		SELECT *
		FROM Abstractors 
		WHERE abstractor_ID = '#read_title_abstract.abstractor_ID_2#'
	</CFQUERY> 
</CFIF>

<CFIF #read_title_abstract.abstractor_ID_3# neq "">
	<CFQUERY datasource="#request.dsn#" NAME="read_assigned_abstractor_3">
		SELECT *
		FROM Abstractors 
		WHERE abstractor_ID = '#read_title_abstract.abstractor_ID_3#'
	</CFQUERY> 
</CFIF>		

<CFQUERY datasource="#request.dsn#" NAME="read_all_abstractors">
	SELECT *
	FROM Abstractors where type = 4
	ORDER BY company ASC, lname ASC, fname ASC
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_zip_code">
	SELECT *
	FROM title
	WHERE pstate = '#read_title.pstate#' AND UPPER(pcounty) = UPPER('#read_title.pcounty#')
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_state">
	SELECT *
	FROM Abstractors_county 
	where st_abbrev = '#read_zip_code.pstate#' AND UPPER(ct_name) = UPPER('#read_zip_code.pcounty#')
</CFQUERY>  
		
<CFQUERY datasource="#request.dsn#" NAME="read_all_abstractors">
	SELECT *
	FROM Abstractors_county a, abstractors b
	where (b.type = '4'
	and (a.st_abbrev = '#read_title.pstate#' AND UPPER(a.ct_name) = UPPER('#ReplaceNoCase(read_title.pcounty, "'", "", "ALL")#') 
	
	 AND a.abstractor_id = b.abstractor_id) ) 
</CFQUERY>


<!---This is for the formatting so that it does not interfere with --->

		
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>1st Title & Escrow, Inc. </title>

<!--- <script type="text/javascript">
function put() {
var frm;
frm = document.frm;

if (frm.tax_year.value=='') {
alert("The tax year cannot be left blank")
return false; }

}
</script> --->



</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>
<CENTER>
<CENTER>
<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=790 align=center valign=top>
            <table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	            <tr>
			        <td width=790 align=left valign=top bgcolor=green>
				        <FONT FACE=ARIAL SIZE=2 color="white">
				        <CENTER><B>Tax Data</B></CENTER>
			        </TD>
		        </TR>
                <tr>
		            <td width=790 align=center valign=top bgcolor=e1e1e1>
<cfif #username# eq "">
		<CFINCLUDE TEMPLATE="./includes/prop_top_nav.cfm">

<cfelse>


</cfif>
                        <!--- =================================== --->
                        <!--- =================================== --->
<CFFORM ACTION="./prop_tax_cert_submit.cfm?username=#username#&password=#password#&uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#" METHOD=POST name="frm" ENABLECAB="Yes" onSubmit="return put();">
    <CFOUTPUT>
    
                        <table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		                    <tr>
			                    <td width=519 colspan=2 align=center valign=top bgcolor=f3f3f3>
				                    <font size=3 color=blue face=arial>
				                    <B>Tax Data Form</B>
			                    </td>
		                    </tr>
                            <!--- =========================================================== --->
		                    <tr>
			                    <td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3>
				                    <font size=2 color=black face=arial>
				                    <B>Property Address:</B>
			                    </td>
		                    </tr>	
                            <tr>
			                    <td width=519 colspan=2  align=center valign=top bgcolor=e1e1e1>
				                    <table width=518 cellpadding=1 cellspacing=1 border=0>
					                    <tr>
						                    <td width=217 align=right valign=top>
							                    <font size=2 color=blue face=arial>
							                    <B>#read_title.paddress#</B>
						                    </td>
						                    <td width=120 align=right valign=top>
							                    <font size=2 color=blue face=arial>
							                    <B>#read_title.pcity#</B>
						                    </td>				
                                            <td width=20 align=right valign=top>
							                    <font size=2 color=blue face=arial>
							                    <B>#read_title.pstate#</B>
						                    </td>
                                            <td width=60 align=right valign=top>
							                    <font size=2 color=blue face=arial>
							                    <B>#read_title.pzip#</B>
						                    </td>				
						                    <td width=100 align=right valign=top>
							                    <font size=2 color=blue face=arial>
							                    <B>#read_title.pcounty#</B>
						                    </td>
					                    </tr>
                                    </table>
			                    </td>
		                    </tr>	
<!--- =========================================================== --->
<cfif #username# eq "">

								<tr  bgcolor="yellow">		
								<td width="65%" align=left valign=top bgcolor=yellow>	
									<font size=2 color=blue face=arial>
									<b>Select Tax Vendor to Outsource or Complete Tax Information Below:</b>
								</td>
								<td width="35%" align=center valign=top bgcolor=yellow>	
									<SELECT NAME="Abstractor_ID_new" 			
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
									<cfif #read_title_abstract.tx_type# neq "">
		<option value="<cfoutput>#read_assigned_abstractor.abstractor_id#</cfoutput>"  selected><cfoutput>#read_assigned_abstractor.company# -- #read_assigned_abstractor.a_cost#</cfoutput></option> <cfelse>
<option value="none" SELECTED></option>	
</cfif>
             					
										<CFloop query ="read_all_abstractors">
									<OPTION VALUE="#Abstractor_ID#">#company# -- #a_cost#</OPTION>
									</CFloop>		
									<OPTION VALUE=""></OPTION>
									<cfif read_title.pstate eq 'CA' or read_title.pstate eq 'OK' or read_title.pstate eq 'TX'>
									<OPTION VALUE="1705">CTC -- </OPTION>
									</cfif>
									</SELECT><input type=hidden  name="assigned"  id="assigned"  value="">	<input type=image src="./images/button_re-assign.gif" onClick="document.frm.assigned.value=1;" border=0></td>
		</tr>
</cfif>
	                        <tr>
			                    <td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3>
				                    <font size=2 color=black face=arial>
				                    <B>Tax Bill - Payment Information:</B>
			                    </td>
		                    </tr>	
	                        <tr>		
		                        <td width=170 align=right valign=top bgcolor=e6e6e6>	
			                        <font size=2 color=black face=arial>
			                        Tax ID Number
		                        </td>
                                <td width=237 align=left valign=top bgcolor=e6e6e6>	
			                        <CFINPUT Message="You must enter a TAX ID" type=text name="taxid"  size=40 maxlength=50
				                        VALUE="#trim(read_report.data19)#"
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
		                        <td width=170 align=right valign=top bgcolor=e6e6e6>	
			                        <font size=2 color=black face=arial>
			                        Tax Amount
		                        </td>
                                <td width=237 align=left valign=top bgcolor=e6e6e6>	
			                        <CFINPUT  type=text name="tx"  size=30 maxlength=50
				                        VALUE="#read_report.data28#"
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
		                        <td width=170 align=right valign=top bgcolor=e6e6e6>	
			                        <font size=2 color=black face=arial>
			                        Tax Rate Area
		                        </td>
                                <td width=237 align=left valign=top bgcolor=e6e6e6>	
			                        <CFINPUT  type=text name="Tax_Rate_Area"  size=30 maxlength=50
				                        VALUE="#trim(read_report.Tax_Rate_Area)#"
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
		                        <td width=170 align=right valign=top bgcolor=e6e6e6>	
			                        <font size=2 color=black face=arial>
			                        Assessed Value
		                        </td>
                                <td width=237 align=left valign=top bgcolor=e6e6e6>	
			                        <CFINPUT  type=text name="Tax_Accessed_Value"  size=30 maxlength=50
	VALUE="#numberformat(read_report.Tax_Accessed_Value, '__.99')#"
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
                            <!---ACCESSED YEAR Harry--->
                            <tr>		
		                        <td width=170 align=right valign=top bgcolor=e6e6e6>	
			                        <font size=2 color=black face=arial>
			                        Assessed Year
		                        </td>
                                <td width=237 align=left valign=top bgcolor=e6e6e6>	
			                        <select name="Tax_Accessed_Year"
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
        								cols="45">
	                                    <cfif #read_report.Tax_Accessed_Year# neq "">
		                                    <option value="#trim(read_report.Tax_Accessed_Year)#">#read_report.Tax_Accessed_Year#</option> <cfelse>
                                            <option value="">Year</option>
                                        </cfif>
<option value="2020">2020</option>
<option value="2019">2019</option>
<option value="2018">2018</option>
<option value="2017">2017</option>
<option value="2016">2016</option>
<option value="2015">2015</option>
<option value="2014">2014</option>
<option value="2013">2013</option>
<option value="2012">2012</option>
<option value="2011">2011</option>
<option value="2010">2010</option>
<option value="2009">2009</option>
<option value="2008">2008</option>
<option value="2007">2007</option>
<option value="2006">2006</option>
<option value="2005">2005</option>   
		                            <option value="2004">2004</option>
                            	   	<option value="2003">2003</option>
                            		<option value="2002">2002</option>
                            		<option value="2000">2000</option>
                            		<option value="2001">2001</option>
                            		<option value="1999">1999</option>
                            		<option value="1998">1998</option>
                                	<option value="1997">1997</option>
                            		<option value="1996">1996</option>
                            		<option value="1995">1995</option>
                            		<option value="1994">1994</option>
                                    <option value="1993">1993</option>
                            		<option value="1992">1992</option>
                            		<option value="1991">1991</option>
                              		<option value="1990">1990</option>
                            		<option value="1989">1989</option>
                            		<option value="1988">1988</option>
                            		<option value="1987">1987</option>
                            		<option value="1986">1986</option>
                            		<option value="1985">1985</option>
                              		<option value="1984">1984</option>
                              		<option value="1983">1983</option>
                              		<option value="1982">1982</option>
                              		<option value="1981">1981</option>
                              		<option value="1980">1980</option>
                              		<option value="1979">1979</option>
                              		<option value="1978">1978</option>
                              		<option value="1977">1977</option>
                              		<option value="1976">1976</option>
                              		<option value="1975">1975</option>
                              		<option value="1974">1974</option>
                              		<option value="1973">1973</option>
                              		<option value="1972">1972</option>
                              		<option value="1971">1971</option>
                              		<option value="1970">1970</option>
                              		<option value="1969">1969</option>
                              		<option value="1968">1968</option>
                              		<option value="1967">1967</option>
                              		<option value="1966">1966</option>
                              		<option value="1964">1964</option>
                              		<option value="1963">1963</option>
                              		<option value="1962">1962</option>
                              		<option value="1961">1961</option>
                              		<option value="1960">1960</option>
                              		<option value="1959">1959</option>
                              		<option value="1958">1958</option>
                              		<option value="1957">1957</option>
                              		<option value="1956">1956</option>
                              		<option value="1955">1955</option>
                              		<option value="1954">1954</option>
                              		<option value="1953">1953</option>
                              		<option value="1952">1952</option>
                              		<option value="1951">1951</option>
                              		<option value="1950">1950</option>
                              		<option value="1949">1949</option>
                              		<option value="1948">1948</option>
                              		<option value="1947">1947</option>
                              		<option value="1946">1946</option>
                              		<option value="1945">1945</option>
                              		<option value="1944">1944</option>
                              		<option value="1943">1943</option>
                              		<option value="1942">1942</option>
                              		<option value="1941">1941</option>
                              		<option value="1940">1940</option>
                              		<option value="1939">1939</option>
                              		<option value="1938">1938</option>
                              		<option value="1937">1937</option>
                              		<option value="1936">1936</option>
                              		<option value="1935">1935</option>
                              		<option value="1934">1934</option>
                              		<option value="1933">1933</option>
                              		<option value="1932">1932</option>
                              		<option value="1931">1931</option>
                              		<option value="1930">1930</option>
                              		<option value="1929">1929</option>
                              		<option value="1928">1928</option>
                              		<option value="1927">1927</option>
                              		<option value="1926">1926</option>
                              		<option value="1925">1925</option>
                              		<option value="1924">1924</option>
                              		<option value="1923">1923</option>
                              		<option value="1922">1922</option>
                              		<option value="1921">1921</option>
                              		<option value="1920">1920</option>
                              		<option value=""></option>
                              		</select>
					
		
		</td>
	</tr>
                            <!---End --->
                            <tr>		
		                        <td width=170 align=right valign=top bgcolor=e6e6e6>	
			                        <font size=2 color=black face=arial>
			                        Land Value
		                        </td>
                                <td width=237 align=left valign=top bgcolor=e6e6e6>	
			                        <CFINPUT  type=text name="Tax_Land_Value"  size=30 maxlength=50
				                        VALUE="#numberformat(read_report.Tax_Land_Value,"__.99")#"
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
		                        <td width=170 align=right valign=top bgcolor=e6e6e6>	
			                        <font size=2 color=black face=arial>
			                        How often?
		                        </td>
                                <td width=237 align=left valign=top bgcolor=e6e6e6>	
	                                <SELECT NAME="howoften" 			
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
			                            <cfif #read_report.data37# neq "">
			                                <OPTION VALUE="#trim(read_report.data37)#">#read_report.data37#</OPTION>
			                                <OPTION VALUE="Annually">Annually</OPTION>
			                                <OPTION VALUE="Semi Annually">Semi Annually</OPTION>
			                                <OPTION VALUE="Quarterly">Quarterly</OPTION>
			                            <cfelse>
			                                <OPTION VALUE="Annually">Annually</OPTION>
			                                <OPTION VALUE="Semi Annually">Semi Annually</OPTION>
			                                <OPTION VALUE="Quarterly">Quarterly</OPTION>
			                            </cfif>
			                            </SELECT>
	                        <tr>		
		                        <td width=170 align=right valign=top bgcolor=e6e6e6>	
			                        <font size=2 color=black face=arial>
			                        Tax Year
		                        </td>
                                <td width=237 align=left valign=top bgcolor=e6e6e6>	
			                        <select name="tax_year"
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
        								cols="45">
	                                    <cfif #read_report.data29# neq "">
		                                    <option value="#trim(read_report.data29)#">#read_report.data29#</option> <cfelse>
                                            <option value="">Year</option>
                                        </cfif>
<option value="2020">2020</option>
<option value="2019">2019</option>
<option value="2018">2018</option>
<option value="2017">2017</option>
<option value="2016">2016</option>
<option value="2015">2015</option>
<option value="2014">2014</option>
<option value="2013">2013</option>
<option value="2012">2012</option>
<option value="2011">2011</option>
<option value="2010">2010</option>
<option value="2009">2009</option>
<option value="2008">2008</option>
<option value="2007">2007</option>
<option value="2006">2006</option>
<option value="2005">2005</option>   
		                            <option value="2004">2004</option>
                            	   	<option value="2003">2003</option>
                            		<option value="2002">2002</option>
                            		<option value="2000">2000</option>
                            		<option value="2001">2001</option>
                            		<option value="1999">1999</option>
                            		<option value="1998">1998</option>
                                	<option value="1997">1997</option>
                            		<option value="1996">1996</option>
                            		<option value="1995">1995</option>
                            		<option value="1994">1994</option>
                                    <option value="1993">1993</option>
                            		<option value="1992">1992</option>
                            		<option value="1991">1991</option>
                              		<option value="1990">1990</option>
                            		<option value="1989">1989</option>
                            		<option value="1988">1988</option>
                            		<option value="1987">1987</option>
                            		<option value="1986">1986</option>
                            		<option value="1985">1985</option>
                              		<option value="1984">1984</option>
                              		<option value="1983">1983</option>
                              		<option value="1982">1982</option>
                              		<option value="1981">1981</option>
                              		<option value="1980">1980</option>
                              		<option value="1979">1979</option>
                              		<option value="1978">1978</option>
                              		<option value="1977">1977</option>
                              		<option value="1976">1976</option>
                              		<option value="1975">1975</option>
                              		<option value="1974">1974</option>
                              		<option value="1973">1973</option>
                              		<option value="1972">1972</option>
                              		<option value="1971">1971</option>
                              		<option value="1970">1970</option>
                              		<option value="1969">1969</option>
                              		<option value="1968">1968</option>
                              		<option value="1967">1967</option>
                              		<option value="1966">1966</option>
                              		<option value="1964">1964</option>
                              		<option value="1963">1963</option>
                              		<option value="1962">1962</option>
                              		<option value="1961">1961</option>
                              		<option value="1960">1960</option>
                              		<option value="1959">1959</option>
                              		<option value="1958">1958</option>
                              		<option value="1957">1957</option>
                              		<option value="1956">1956</option>
                              		<option value="1955">1955</option>
                              		<option value="1954">1954</option>
                              		<option value="1953">1953</option>
                              		<option value="1952">1952</option>
                              		<option value="1951">1951</option>
                              		<option value="1950">1950</option>
                              		<option value="1949">1949</option>
                              		<option value="1948">1948</option>
                              		<option value="1947">1947</option>
                              		<option value="1946">1946</option>
                              		<option value="1945">1945</option>
                              		<option value="1944">1944</option>
                              		<option value="1943">1943</option>
                              		<option value="1942">1942</option>
                              		<option value="1941">1941</option>
                              		<option value="1940">1940</option>
                              		<option value="1939">1939</option>
                              		<option value="1938">1938</option>
                              		<option value="1937">1937</option>
                              		<option value="1936">1936</option>
                              		<option value="1935">1935</option>
                              		<option value="1934">1934</option>
                              		<option value="1933">1933</option>
                              		<option value="1932">1932</option>
                              		<option value="1931">1931</option>
                              		<option value="1930">1930</option>
                              		<option value="1929">1929</option>
                              		<option value="1928">1928</option>
                              		<option value="1927">1927</option>
                              		<option value="1926">1926</option>
                              		<option value="1925">1925</option>
                              		<option value="1924">1924</option>
                              		<option value="1923">1923</option>
                              		<option value="1922">1922</option>
                              		<option value="1921">1921</option>
                              		<option value="1920">1920</option>
                              		<option value=""></option>
                              		</select>
					
		
		</td>
	</tr>
	<tr>		
		<td width=170 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Due Date(s)
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
		
		<CFINPUT  type=text name="duedate"  size=30 maxlength=50
				value="#Trim(read_report.data30)#"
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
		
	
	
	<tr>		
		<td width=170 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Tax Status
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
						<SELECT NAME="stat" 	onchange="go()"		
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
			<OPTION VALUE="#Trim(read_report.data31)#">#Trim(read_report.data31)#</OPTION>
			<OPTION VALUE="Not Available">Not Available</OPTION>
			<OPTION VALUE="Delinquent (w/ Penalty)">Delinquent (w/ Penalty)</OPTION>
			<OPTION VALUE="Not yet due or payable">Not yet due or payable</OPTION>
			<OPTION VALUE="Paid">Paid</OPTION>
			<OPTION VALUE="Too new has not been assessed yet">Too new has not been assessed yet</OPTION>
			<OPTION VALUE="Unpaid">Unpaid</OPTION>
		</SELECT>
		
		</td>
	</tr>
    <!----Only show the next boxes if the Taxes are delinquent ---->
    <CFIF #Delinq# eq "1">
    <TR>
        <td width=407 align=center valign=top bgcolor=e6e6e6 colspan="2">
        <font size=2 color=black face=arial>
            <center><B>Please enter the Delinquent Tax Amount, Year, and Exemption</B></center>
        </td>	
    </TR>
    <tr>		
		<td width=170 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			<B>Delinquent Tax</B>
		</td>
        <td width=237 align=left valign=top bgcolor=e6e6e6>	
            <B><CFINPUT type=text name="Tax_Delinquent_Amount"  size=12 maxlength=12
				                        VALUE="#Trim(numberformat(read_report.Tax_Delinquent_Amount,"9999.99"))#"
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
                        				clear: none;" ></B>
		</td>
    </tr>
    <tr>		
		<td width=170 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			<B>Delinquent Tax Year</B>
		</td>
        
                                <td width=237 align=left valign=top bgcolor=e6e6e6>	
			                        <B><select name="Tax_Delinquent_Year"
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
        								cols="45">
	                                    <cfif #read_report.Tax_Delinquent_Year# neq "">
		                                    <option value="#Trim(read_report.Tax_Delinquent_Year)#">#Trim(read_report.Tax_Delinquent_Year)#</option> <cfelse>
                                            <option value="">Year</option>
                                        </cfif>
<option value="2020">2020</option>
<option value="2019">2019</option>
<option value="2018">2018</option>
<option value="2017">2017</option>
<option value="2016">2016</option>
<option value="2015">2015</option>
<option value="2014">2014</option>
<option value="2013">2013</option>
<option value="2012">2012</option>
<option value="2011">2011</option>
<option value="2010">2010</option>
<option value="2009">2009</option>
<option value="2008">2008</option>
<option value="2007">2007</option>
<option value="2006">2006</option>
<option value="2005">2005</option>    
		                            <option value="2004">2004</option>
                            	   	<option value="2003">2003</option>
                            		<option value="2002">2002</option>
                            		<option value="2000">2000</option>
                            		<option value="2001">2001</option>
                            		<option value="1999">1999</option>
                            		<option value="1998">1998</option>
                                	<option value="1997">1997</option>
                            		<option value="1996">1996</option>
                            		<option value="1995">1995</option>
                            		<option value="1994">1994</option>
                                    <option value="1993">1993</option>
                            		<option value="1992">1992</option>
                            		<option value="1991">1991</option>
                              		<option value="1990">1990</option>
                            		<option value="1989">1989</option>
                            		<option value="1988">1988</option>
                            		<option value="1987">1987</option>
                            		<option value="1986">1986</option>
                            		<option value="1985">1985</option>
                              		<option value="1984">1984</option>
                              		<option value="1983">1983</option>
                              		<option value="1982">1982</option>
                              		<option value="1981">1981</option>
                              		<option value="1980">1980</option>
                              		<option value="1979">1979</option>
                              		<option value="1978">1978</option>
                              		<option value="1977">1977</option>
                              		<option value="1976">1976</option>
                              		<option value="1975">1975</option>
                              		<option value="1974">1974</option>
                              		<option value="1973">1973</option>
                              		<option value="1972">1972</option>
                              		<option value="1971">1971</option>
                              		<option value="1970">1970</option>
                              		<option value="1969">1969</option>
                              		<option value="1968">1968</option>
                              		<option value="1967">1967</option>
                              		<option value="1966">1966</option>
                              		<option value="1964">1964</option>
                              		<option value="1963">1963</option>
                              		<option value="1962">1962</option>
                              		<option value="1961">1961</option>
                              		<option value="1960">1960</option>
                              		<option value="1959">1959</option>
                              		<option value="1958">1958</option>
                              		<option value="1957">1957</option>
                              		<option value="1956">1956</option>
                              		<option value="1955">1955</option>
                              		<option value="1954">1954</option>
                              		<option value="1953">1953</option>
                              		<option value="1952">1952</option>
                              		<option value="1951">1951</option>
                              		<option value="1950">1950</option>
                              		<option value="1949">1949</option>
                              		<option value="1948">1948</option>
                              		<option value="1947">1947</option>
                              		<option value="1946">1946</option>
                              		<option value="1945">1945</option>
                              		<option value="1944">1944</option>
                              		<option value="1943">1943</option>
                              		<option value="1942">1942</option>
                              		<option value="1941">1941</option>
                              		<option value="1940">1940</option>
                              		<option value="1939">1939</option>
                              		<option value="1938">1938</option>
                              		<option value="1937">1937</option>
                              		<option value="1936">1936</option>
                              		<option value="1935">1935</option>
                              		<option value="1934">1934</option>
                              		<option value="1933">1933</option>
                              		<option value="1932">1932</option>
                              		<option value="1931">1931</option>
                              		<option value="1930">1930</option>
                              		<option value="1929">1929</option>
                              		<option value="1928">1928</option>
                              		<option value="1927">1927</option>
                              		<option value="1926">1926</option>
                              		<option value="1925">1925</option>
                              		<option value="1924">1924</option>
                              		<option value="1923">1923</option>
                              		<option value="1922">1922</option>
                              		<option value="1921">1921</option>
                              		<option value="1920">1920</option>
                              		<option value=""></option>
                              		</select>
					
		</B>
		</td>
	</tr>
    <tr>		
		<td width=170 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			<B>Exemption</B>
		</td>
        <td width=237 align=left valign=top bgcolor=e6e6e6>	
            <B><CFINPUT type=text name="Tax_Delinquent_Exemption"  size=40 maxlength=40
				                        VALUE="#Trim(read_report.Tax_Delinquent_Exemption)#"
				                        style="font-size: 9; 
				                        font-family: verdana; 
				                        font-style: normal; 
				                        color: blue; 
				                        background-color: e6e6e6; 
                        				border-color: e6e6e6; 
                        				border-left-width: thin; 
                        				border-right-width: thin; 
                        				border-top-width: thin; 
                        				border-bottom-width: thin
                        				border-style: bar; ; 
                        				border-width: thin; 
                        				clear: none;" ></B>
		</td>
    </tr>
    </CFIF>
    <!---Harry 10/28/04 adding items for Legal + Vesting --->
    <tr>		
		<td width=170 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Mailing Address
		</td>
        <td width=237 align=left valign=top bgcolor=e6e6e6>	
            <CFINPUT type=text name="tax_address"  size=60 maxlength=70
				                        VALUE="#Trim(read_report.tax_address)#"
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
		<td width=170 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			City, State, Zip
		</td>
        <td width=237 align=left valign=top bgcolor=e6e6e6>	
               <CFINPUT type=text name="tax_City"  size=25 maxlength=25
				                        VALUE="#Trim(read_report.tax_city)#"
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
            <CFINPUT type=text name="tax_State"  size=2 maxlength=2
				                        VALUE="#Trim(read_report.tax_state)#"
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
          <CFINPUT type=text name="tax_zip"  size=10 maxlength=10
				                        VALUE="#Trim(read_report.tax_zip)#"
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
    <!---End --->
	<tr>
	<td width=170 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			
		Additional Info (including taxes for city, municipal, school, etc)
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<TEXTAREA name="infotax"  COLS=50 ROWS=5
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
					clear: none;">#Trim(read_report.data34)#
					</TEXTAREA>
	
		</td>
	</tr>


	
<tr>
		<td colspan=2   align=left valign=top bgcolor=e1e1e1><input type="checkbox" value=1 name="taxes_completed" <cfif read_report.taxes_completed eq 1>checked</cfif>>  <font size=2 color=black face=arial><strong>I certify that tax information for this file is complete based on the information provided</strong><br>
(taxes will not be completed unless box is checked)</font>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=image src="./images/button_submit.gif" border=0>
			</td>
		</tr>




	</table>
                 
</CFOUTPUT>

</CFFORM>	
		</td>
	</tr>
</table>

		</td>
	</tr>
</table>

		</td>
	</tr>
</table>
			

			
</BODY>
</HTML>

