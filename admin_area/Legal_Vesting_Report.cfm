<CFQUERY  datasource="#request.dsn#" name="read_order">
	SELECT *
	FROM Property
	WHERE prop_id = #URL.rec_id#
</CFQUERY>

<CFQUERY  datasource="#request.dsn#" name="read_legal">
    SELECT *
	FROM Prop_Ins_View
	WHERE prop_id = #URL.rec_id#
</CFQUERY> 

<CFQUERY  datasource="#request.dsn#" name="read_taxes">
    SELECT *
	FROM Tax_Cert_Prop
	WHERE prop_id = #URL.rec_id#
</CFQUERY> 

<table cellpadding=1 cellspacing=1 border=0 width="100%">
    <table cellpadding=1 cellspacing=1 border=0 width="75%" align="center">
<CFOUTPUT> 	
        <tr>                                                 
            <td align="middle" valign="bottom" colspan="2">
      	        <P align=left><strong><FONT size=5>  
			    Legal & Vesting Report</FONT> 
        	    </strong></P>
	 	    </td>
        </tr>
  	    <tr>
            <td colspan="2">
                <font size="2" face="Arial, Helvetica, sans-serif">
                For Property Located At
                </font>
            </td>
        </tr> 
        <tr>
		    <td valign="top" colspan="2">
                <font size="2" face="Arial, Helvetica, sans-serif">
			    <B>#read_order.paddress#, #read_order.pcity#, #read_order.pstate# #read_order.pzip#</B>
                </font>
		    </td>
        </tr>
        <tr>
            <td>
                <HR>
            </td>
        </tr>        
	        <table cellpadding=1 cellspacing=1 border=0 width="75%" align="center">    
	            <tr> 
  		            <td colspan="1" height="10" width="25%">
                       <B>LEGAL</B>
		            </td>
                    <td colspan="1" height="10" width="25%">
                        &nbsp;
                    </td>
                    <td colspan="1" height="10" width="25%">
                        &nbsp;
                    </td>
                    <td colspan="1" height="10" width="25%">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="4" height="10">
                        In the County of <b>#read_order.pcounty#</b>, State of <b>#read_order.pstate#</b><BR><BR>
                    </td>
                </tr>
	            <tr> 
  		            <td height="10">
                        <font size="2" face="Arial, Helvetica, sans-serif">
			            Assessed Owner:
                        </font>
		            </td>
                    <td height="10" colspan="3">
                        <font size="2" face="Arial, Helvetica, sans-serif">
			             <B>#read_legal.data3#
                        </font>
		            </td>
                </tr>    
                <tr> 
                    <td height="10">
                        <font size="2" face="Arial, Helvetica, sans-serif">
			            
                        </font>
		            </td>
                    <td height="10" colspan="3">
                        <font size="2" face="Arial, Helvetica, sans-serif">
			             <B>#read_legal.data6#
                        </font>
		            </td>
  	            </tr>
                <tr>
                    <td colspan="4">
                        <BR>
                    </td>
                </tr>
	            <tr> 
  		            <td height="10">
                        <font size="2" face="Arial, Helvetica, sans-serif">
			            Legal Description:
                        </font>
		            </td>
                    <td colspan="3" height="10">
                        <font size="2" face="Arial, Helvetica, sans-serif">
			            <B>
                        <cfif #read_legal.notes# neq "">
                            #read_legal.notes#
                        </cfif>
                        <cfif #read_legal.data1# NEQ ""> 
                            Being the same property as transferred by #read_legal.data5# on #DateFormat(read_legal.data10, "mm")#/#DateFormat(read_legal.data10, "dd")#/#DateFormat(read_legal.data10, "yyyy")# and recorded #DateFormat(read_legal.data11, "mm")#/#DateFormat(read_legal.data11, "dd")#/#DateFormat(read_legal.data11, "yyyy")# from #read_legal.data1#
                        <cfif #read_legal.data2# NEQ ""> 
                            and #read_legal.data2#
                        </CFIF> 
                        to #read_legal.data3# 
                        <CFIF #read_legal.data4# NEQ "">
                            and #read_legal.data4#
                        </CFIF>
                        , #read_legal.data6#, 
                        <cfif #read_legal.data7# eq "">
                            <CFIF #read_legal.data8# NEQ ""> 
                                recorded in Book #read_legal.data8#
                            </cfif>
                            <cfif #read_legal.data9# neq ""> 
                                and Page #read_legal.data9#
                            </cfif>
                        <cfelse> 
                            recorded in Document Number #read_legal.data7# 
                        </cfif>
                    </cfif>
                    </B>
                    </font><BR>
		        </td>
  	        </tr>
            <tr>
                <td><BR></td>
            </tr>
            <tr>
                <td >
                    Subdivision:
                </td>
                <td>
                    <b>#read_legal.Legalsubdivision#</B>
                </td>
                <td >
                    Legal Block/Bldg:
                </td>
                <td>
                   <b>#read_legal.LegalBlock#</B>
                </td>            
            </tr>
            <tr>
                <td>
                    Legal Book/Page:
                </td>
                <td>
                    <B><CFIF #Len(read_legal.data7)# gt "1">#read_legal.data7#<CFELSE>#read_legal.data8#/#read_legal.data9#</CFIF></B>
                </td>
                <td >
                    Legal Lot/Unit:
                </td>
                <td>
                   <b>#read_legal.LegalLot#</B>
                </td>            
            </tr>
            <tr>
                <td>
                    Assessor's Parcel Number: 
                </td>
                <td colspan="3">
                    <B>#read_taxes.data19#</B>
                </td>
            </tr>
            <tr>
                <td colspan ="4">
                    <hr>
                </td>     
            </tr>        		
            <tr >
                <td Align="LEFT">
                    <B>PROPERTY ADDRESS</B>
                </td>
                <td>
                    &nbsp;
                </td>
                <td Align="left">
                    <B>MAILING ADDRESS</B>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>    
                <td colspan="4">
                    <BR>
                </TD>
            </tr>
            <tr>
                <td Align="left">
                   <font size="2" face="Arial, Helvetica, sans-serif"> <B>#read_order.paddress#</B></font>
                </td>
                <td Align="left">
                    &nbsp;
                </td>
                <td Align="left">
                    <font size="2" face="Arial, Helvetica, sans-serif">
                    <B>#read_Taxes.Tax_Address#</B>
                    </font>
                </td>
                <td Align="left">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td Align="left">
                    <font size="2" face="Arial, Helvetica, sans-serif">
                    <B>#read_order.pcity#<CFIF #Len(read_order.pcity)# gte "1">, #read_order.pstate# #read_order.pzip#</CFIF></B>
                    </font>
                </td>
                <td Align="left">
                    &nbsp;
                </td>
                <td Align="left">
                    <font size="2" face="Arial, Helvetica, sans-serif">
                    <B>#read_Taxes.Tax_City#, #read_Taxes.Tax_State# #read_Taxes.Tax_Zip#</B>
                    </font>
                </td>
                <td Align="left">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td colspan = "4">
                    <HR>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <B>Tax Information</B>
                </td>
            </tr>
            <tr>
                <td>
                    <font size="2" face="Arial, Helvetica, sans-serif">
                    Tax Year:
                    </font>
                </td>
                <td>
                    <font size="2" face="Arial, Helvetica, sans-serif">
                    <B>#read_Taxes.data29#</B>
                    </font>
                </td>
                <td>
                    <font size="2" face="Arial, Helvetica, sans-serif">
                    Property Tax:
                    </font>
                </td>
                <td>
                    <font size="2" face="Arial, Helvetica, sans-serif">
                    <B>#dollarformat(read_Taxes.data28)#</B>
                    </font>
                </td>
            </tr>
            <tr>
                <td>
                    <font size="2" face="Arial, Helvetica, sans-serif">
                    Assessed Year:
                    </font>
                </td>
                <td>
                    <font size="2" face="Arial, Helvetica, sans-serif">
                    <B>#read_Taxes.Tax_Accessed_Year#</B>
                    </font>
                </td>
                <td>
                    <font size="2" face="Arial, Helvetica, sans-serif">
                    Total Value:
                    </font>
                </td>
                <td>
                    <font size="2" face="Arial, Helvetica, sans-serif">
                    <B>#dollarformat(read_Taxes.Tax_Accessed_Value)#</B>
                    </font>
                </td>
            </tr>
            <tr>
                <td>
                    <font size="2" face="Arial, Helvetica, sans-serif">
                    Tax Rate Area:
                    </font>
                </td>
                <td>    
                    <font size="2" face="Arial, Helvetica, sans-serif">
                    <B>#read_Taxes.Tax_Rate_Area#</B>
                    </font>
                </td>
                <td>
                    <font size="2" face="Arial, Helvetica, sans-serif">
                    Land Value:
                    </font>
                </td>
                <td>
                    <font size="2" face="Arial, Helvetica, sans-serif">
                    <B>#dollarformat(read_taxes.Tax_Land_Value)#</B>
                    </font>
                </td>
            </tr>
            <tr>
                <td>
                    <font size="2" face="Arial, Helvetica, sans-serif">
                    Delinquent Tax:
                    </font>
                </td>
                <td>
                     <B>
                     <font size="2" face="Arial, Helvetica, sans-serif">
                     <CFIF #read_Taxes.Tax_Delinquent_Amount# gte "1">
                        #dollarformat(read_Taxes.Tax_Delinquent_Amount)#</B>
                     </CFIF>
                     </font>
                </td>
                <td>
                    <font size="2" face="Arial, Helvetica, sans-serif">
                    Improvement Value:
                    </font>
                </td>
                <td><CFSET #total# = #read_Taxes.Tax_Accessed_Value# - #read_taxes.Tax_Land_Value#>
                    <font size="2" face="Arial, Helvetica, sans-serif">
                    <B>#dollarformat(total)#</B>
                    </font>
                </td>
            </tr>
            <tr>
                <td>
                    <font size="2" face="Arial, Helvetica, sans-serif">
                    Year:
                    </font>
                </td>
                <td>
                    <font size="2" face="Arial, Helvetica, sans-serif">
                    <B>#read_Taxes.Tax_Delinquent_Year#</B>
                    </font>
                </td>     
            <tr>
                <td>
                    <font size="2" face="Arial, Helvetica, sans-serif">
                    Exemption:
                    </font>
                </td>
                <td>
                    <font size="2" face="Arial, Helvetica, sans-serif">
                    <B>#read_Taxes.Tax_Delinquent_Exemption#</B>
                    </font>
                </td>
                <td>
                    <font size="2" face="Arial, Helvetica, sans-serif">
                    % Improved:
                    </font>
                </td>
                <td>
                    <font size="2" face="Arial, Helvetica, sans-serif">
                    <!---Division by 0 must not be aloowed --->
                    <CFIF #read_Taxes.Tax_Accessed_Value# neq "0">
                        <CFSET Total_Improved = #total#/#read_Taxes.Tax_Accessed_Value#>
                        <cfset Improved_percent = #Total_Improved# * 100 >
                        <B>#Round(Improved_percent)#%</B>
                    <CFELSE>
                        <B>0%</B>      
                    </CFIF>
                    </font>                        
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <HR>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <B>TRANSACTION HISTORY</B>
                </td>
            </tr>
            <!---At this point, I am not sure if there is going to be a loop here. 
            Just incase I'm going to create a variable that could be a counter later on.--->
            <CFSET counter = "1" >        
            
            <tr>
                <td>
                    <font size="2" face="Arial, Helvetica, sans-serif">
                    Sale Recording Date:
                    </font>
                </td>
                <td>
                    <font size="2" face="Arial, Helvetica, sans-serif">
                     <B>#read_legal.data11#</B>
                     </font>
                </td>
                <TD>
                    <font size="2" face="Arial, Helvetica, sans-serif">
                    Sale Price:
                    </font>
                </td>
                <td>
                    <font size="2" face="Arial, Helvetica, sans-serif">
                   <B>#read_legal.data16#</B>
                   </font>
                </td>
            </tr>
            <tr>
                <td>
                    <font size="2" face="Arial, Helvetica, sans-serif">
                    Sale Date:
                    </font>
                </td>
                <td>
                    <font size="2" face="Arial, Helvetica, sans-serif">
                     <B>#read_legal.data10#</B>
                     </font>
                </td>
                <TD>
                    <font size="2" face="Arial, Helvetica, sans-serif">
                    Sale Price Type:
                    </font>
                </td>
                <td>
                    <font size="2" face="Arial, Helvetica, sans-serif">
                    <B>#read_legal.consider_type#</B>
                    </font>
                </td>
                
            </tr>
            <tr>
                <td>
                    <font size="2" face="Arial, Helvetica, sans-serif">
                    Recording Document No:
                    </font>
                </td>
                <td>
                    <font size="2" face="Arial, Helvetica, sans-serif">
                   <B><CFIF #Len(read_legal.data7)# gt "1">#read_legal.data7#<CFELSE>#read_legal.data8#/#read_legal.data9#</CFIF></B>
                   </font>
                </td>
                <td>
                    <font size="2" face="Arial, Helvetica, sans-serif">
                    Grantor:
                    </font>
                </td>
                <td colspan="3">
                    <font size="2" face="Arial, Helvetica, sans-serif">
                    <B>#read_legal.data1#</B>
                    </font>
                </td>
            </tr>
            <tr>
                <td>
                    <font size="2" face="Arial, Helvetica, sans-serif">
                    Document Type:
                    </font>
                </td>
                <td>
                    <font size="2" face="Arial, Helvetica, sans-serif">
                    <B>#read_legal.data5#</B>
                    </font>
                </td>
                <td>
                    <font size="2" face="Arial, Helvetica, sans-serif">
                    Grantee:
                    </font>
                </td>
                <td colspan="3">
                    <font size="2" face="Arial, Helvetica, sans-serif">
                    <B>#read_legal.data3#</B>
                    </font>
                </td>
            </tr>
            
                                  
</CFOUTPUT>


        </table>
    </table>
</table>