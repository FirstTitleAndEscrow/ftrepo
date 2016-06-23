<CFPARAM NAME="username" DEFAULT="">
<CFPARAM NAME="proptype" DEFAULT="">
<CFPARAM NAME="taxid" DEFAULT="">
<CFPARAM NAME="parcel" DEFAULT="">
<CFPARAM NAME="exempt" DEFAULT="">
<CFPARAM NAME="amount" DEFAULT="">
<CFPARAM NAME="extype" DEFAULT="">
<CFPARAM NAME="land" DEFAULT="">
<CFPARAM NAME="impass" DEFAULT="">
<CFPARAM NAME="other" DEFAULT="">
<CFPARAM NAME="val" DEFAULT="">
<CFPARAM NAME="tx" DEFAULT="">
<CFPARAM NAME="tax_year" DEFAULT="">
<CFPARAM NAME="inst_monx" DEFAULT="">
<CFPARAM NAME="inst_dayx" DEFAULT="">
<CFPARAM NAME="inst_yearx" DEFAULT="">
<CFPARAM NAME="inst_mont" DEFAULT="">
<CFPARAM NAME="inst_dayt" DEFAULT="">
<CFPARAM NAME="inst_yeart" DEFAULT="">
<CFPARAM NAME="rec_mont" DEFAULT="">
<CFPARAM NAME="rec_dayt" DEFAULT="">
<CFPARAM NAME="rec_yeart" DEFAULT="">
<CFPARAM NAME="stat" DEFAULT="">
<CFPARAM NAME="pay_to" DEFAULT="">
<CFPARAM NAME="txamt" DEFAULT="">
<CFPARAM NAME="del_year" DEFAULT="">
<CFPARAM NAME="infotax" DEFAULT="">
<CFPARAM NAME="a_trigger" DEFAULT="0">
<CFPARAM NAME="Tax_Delinquent_Year" DEFAULT="">
<CFPARAM NAME="Tax_Delinquent_Exemption" DEFAULT="">
<CFPARAM NAME="Tax_Delinquent_Amount" DEFAULT="0">
<CFPARAM NAME="Tax_Accessed_Value" DEFAULT="0">
<CFPARAM NAME="Tax_Accessed_Year" DEFAULT="0">
<CFPARAM NAME="Tax_Land_Value" DEFAULT="0">
<CFPARAM NAME="taxes_completed" DEFAULT="0">
<CFPARAM NAME="assigned" DEFAULT="">

<cfif #assigned# neq "1">



<cfif #a_trigger# eq 1>

    <CFSET c_date = #DateFormat(Now(), "mm/dd/yyyy")#>
    <CFSET c_time = #TimeFormat(Now(), "HH:mm:ss")#>

    <CFQUERY datasource="#request.dsn#" >
	    UPDATE tblUser_Roles
		SET 	payoff_Finish_Datetime = getDate()
		where prop_id = #rec_id#
    </cfquery>

    <CFQUERY datasource="#request.dsn#" name="find_tax_rec">
	select * from tax_cert_prop
	where prop_id = #rec_id#
	</CFQUERY>

<cfif find_tax_rec.recordcount eq 0>
    <CFQUERY datasource="#request.dsn#" name="find_tax_rec">
	insert into tax_cert_prop (prop_id)
	values (#rec_id#)
	</CFQUERY>
</cfif>


    <CFQUERY datasource="#request.dsn#" >
	    UPDATE tax_cert_prop
		SET 	a_date_started = 'Yes',
		<cfif taxes_completed eq 1>
			 taxes_completed = 1,
			 </cfif>
		a_date_finished = '#trim(c_date)#',
		a_time_finished = '#trim(c_time)#',
		data19 = '#trim(taxid)#',
		data28 = '#trim(tx)#',
		data29 = '#trim(tax_year)#',
		data30 = '#trim(duedate)#',
		data31 = '#trim(stat)#',
		data34 = '#trim(infotax)#',
		data37 = '#trim(howoften)#',
        <CFIF #Len(Tax_Accessed_Value)# gte 1>
            Tax_Accessed_Value = #trim(Tax_Accessed_Value)#,
        </CFIF>
        <CFIF #Len(Tax_Accessed_Year)# gte 1>
            Tax_Accessed_Year = '#trim(Tax_Accessed_Year)#',
        </CFIF>
        <CFIF #Len(Tax_Rate_Area)# gte 1>
            Tax_Rate_Area = '#trim(Tax_Rate_Area)#',
        </CFIF>
        <CFIF #Len(Tax_Land_Value)# gte 1>
            Tax_Land_Value = #trim(Tax_Land_Value)#,
        </CFIF>
        <CFIF #Len(Tax_Delinquent_Year)# gte 1>
            Tax_Delinquent_Year = '#trim(Tax_Delinquent_Year)#',
        </CFIF>
        <CFIF #Len(Tax_Delinquent_Exemption)# gte 1>
            Tax_Delinquent_Exemption = '#trim(Tax_Delinquent_Exemption)#',
        </CFIF>
        <CFIF #Len(Tax_Delinquent_Amount)# gte 1>
            Tax_Delinquent_Amount = #trim(Tax_Delinquent_Amount)#,
        </CFIF>
            Tax_Address = '#Tax_Address#',
            Tax_City = '#Tax_City#',
            Tax_State = '#Tax_State#',
            Tax_Zip = '#Tax_Zip#'
			where prop_id = #rec_id#
         </cfquery>
</cfif>











<cfelse>




 <cfif #Abstractor_ID_new# neq "none" AND #username# eq "">


 <CFSET order_date_adj = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>


 <CFQUERY datasource="#request.dsn#" name="check_exists">
						select prop_id from Doc_Abstract_Prop
						where prop_id = #rec_id#
</CFQUERY>
<cfif NOT check_exists.recordcount>
<CFQUERY datasource="#request.dsn#" name="create_record">
						insert into Doc_Abstract_Prop (prop_id)
						values (#rec_id#)
</CFQUERY>
</cfif>


  <cfif #Abstractor_ID_new# eq "">

 <CFQUERY datasource="#request.dsn#" name="check_for_record">
	SELECT * FROM  Doc_Abstract_prop
	where prop_id = #rec_id#
 </cfquery>
 <cfif check_for_record.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" name="insert_for_record">
	INSERT INTO Doc_Abstract_prop (prop_id)
	values (#rec_id#)
 </cfquery>
 </cfif>

 <CFQUERY datasource="#request.dsn#" NAME="read_title_abs">

			UPDATE Doc_Abstract_prop
			SET Abstractor_tax_ID = null,
			tx_type = 1
			WHERE prop_ID = #rec_ID#

		</CFQUERY>


		<cfelse>

 <CFQUERY datasource="#request.dsn#" name="check_for_record">
	SELECT * FROM  Doc_Abstract_prop
	where prop_id = #rec_id#
 </cfquery>
 <cfif check_for_record.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" name="insert_for_record">
	INSERT INTO Doc_Abstract_prop (prop_id)
	values (#rec_id#)
 </cfquery>
 </cfif>

		 <CFQUERY datasource="#request.dsn#" NAME="read_title_abs">

			UPDATE Doc_Abstract_prop
			SET Abstractor_tax_ID = #Abstractor_ID_new#,
			tx_type = 1
			WHERE prop_ID = #rec_ID#

		</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="vendor_tracker">
		Insert into Vendor_Tracker (Vendor_id, Order_id, order_type, assign_date, assigned_by, vendor_type, task)
		values
		(#Abstractor_ID_new#, #rec_id#, 'P', #createODBCDateTime(Now())#, #uid#, 'taxes', 'Tax Certification Report')
</CFQUERY>
		</cfif>

</cfif>
 </cfif>





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


<cfif isDefined("session.ft_user_id")>
<CFQUERY datasource="#request.dsn#" NAME="read_user">
    select * from first_admin
    WHERE ID = #session.ft_user_id#
</CFQUERY>
</cfif>

<!---Create note that Taxes were completed--->
<cfif taxes_completed eq 1>
 <CFQUERY datasource="#request.dsn#">
						INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type)
						VALUES('Auto', 'Web', #rec_id#,'Taxes completed by Vendor' ,'#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T')
</CFQUERY>
</cfif>

<CFIF #stat# eq "Delinquent (w/ Penalty)">
    <CFIF (#Len(Tax_Delinquent_Year)# lte "1") OR (#Len(Tax_Delinquent_Exemption)# lte "1") OR (#Len(Tax_Delinquent_Amount)# lte "1")>
        <CFLOCATION URL="https://#cgi.server_name#/admin_area/prop_tax_cert_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&delinq=1">
    </CFIF>
</CFIF>
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
    <html>
    <head>
    <title>1st Title & Escrow, Inc. </title>
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
				            <CENTER><B>Title Committment Report</B></CENTER>
			            </TD>
		            </TR>
                    <tr>
		                <td width=790 align=center valign=top bgcolor=e1e1e1>
<CFINCLUDE TEMPLATE="./includes/prop_top_nav.cfm">
<CFOUTPUT>
                            <table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
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
	                            <tr>
	                                <td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3>
                            		    <font size=2 color=black face=arial>
                            			<B>Tax Bill - Payment Information:</B>
                            		</td>
	                            </tr>
	                            <tr>
		                            <td width=130 align=right valign=top bgcolor=e6e6e6>
			                            <font size=2 color=black face=arial>
			                            Tax ID
		                            </td>
                                    <td width=237 align=left valign=top bgcolor=e6e6e6>
			                            #taxid#
                            		</td>
                            	</tr>
                            	<tr>
                            		<td width=130 align=right valign=top bgcolor=e6e6e6>
                            			<font size=2 color=black face=arial>
                            			Tax Amount
                            		</td>
                                    <td width=237 align=left valign=top bgcolor=e6e6e6>
                            	        #dollarformat(tx)#
                            		</td>
                            	</tr>
                                <tr>
                            		<td width=130 align=right valign=top bgcolor=e6e6e6>
                            			<font size=2 color=black face=arial>
                            			Tax Rate Area
                            		</td>
                                    <td width=237 align=left valign=top bgcolor=e6e6e6>
                            	        #Tax_Rate_Area#
                            		</td>
                            	</tr>
                                <tr>
                            		<td width=130 align=right valign=top bgcolor=e6e6e6>
                            			<font size=2 color=black face=arial>
                            			Accessed Value
                            		</td>
                                    <td width=237 align=left valign=top bgcolor=e6e6e6>
                            	        #dollarformat(Tax_Accessed_Value)#
                            		</td>
                            	</tr>
                                 <tr>
                            		<td width=130 align=right valign=top bgcolor=e6e6e6>
                            			<font size=2 color=black face=arial>
                            			Accessed Year
                            		</td>
                                    <td width=237 align=left valign=top bgcolor=e6e6e6>
                            	        #Tax_Accessed_Year#
                            		</td>
                            	</tr>
                                <tr>
                            		<td width=130 align=right valign=top bgcolor=e6e6e6>
                            			<font size=2 color=black face=arial>
                            			Land Value
                            		</td>
                                    <td width=237 align=left valign=top bgcolor=e6e6e6>
                            	        #dollarformat(Tax_Land_Value)#
                            		</td>
                            	</tr>
                            	<tr>
                            		<td width=130 align=right valign=top bgcolor=e6e6e6>
                            			<font size=2 color=black face=arial>
                            			How often
                            		</td>
                                    <td width=237 align=left valign=top bgcolor=e6e6e6>
                            	        #howoften#
                            		</td>
                            	</tr>
                            	<tr>
                            		<td width=130 align=right valign=top bgcolor=e6e6e6>
                            			<font size=2 color=black face=arial>
                            			Tax Year
                            		</td>
                                    <td width=237 align=left valign=top bgcolor=e6e6e6>
                            	        #tax_year#
                            		</td>
                            	</tr>
                            	<tr>
                            		<td width=130 align=right valign=top bgcolor=e6e6e6>
                            			<font size=2 color=black face=arial>
                            			Due Date
                            		</td>
                                    <td width=237 align=left valign=top bgcolor=e6e6e6>
                            			#duedate#
                                    </td>
                            	</tr>
                            	<tr>
                            		<td width=130 align=right valign=top bgcolor=e6e6e6>
                            			<font size=2 color=black face=arial>
                            			Tax Status
                            		</td>
                                    <td width=237 align=left valign=top bgcolor=e6e6e6>
                            		    #stat#
                            		</td>
                            	</tr>
                                <CFIF #stat# eq "Delinquent (w/ Penalty)">
                                    <tr>
                            		    <td width=130 align=right valign=top bgcolor=e6e6e6>
                            			    <font size=2 color=black face=arial>
                            		    	Delinquent Tax
                            		    </td>
                                        <td width=237 align=left valign=top bgcolor=e6e6e6>
                            		        #dollarformat(Tax_Delinquent_Amount)#
                            		    </td>
                            	    </tr>
                                    <tr>
                            		    <td width=130 align=right valign=top bgcolor=e6e6e6>
                            			    <font size=2 color=black face=arial>
                            		    	Delinquent Tax Year
                            		    </td>
                                        <td width=237 align=left valign=top bgcolor=e6e6e6>
                            		        #Tax_Delinquent_Year#
                            		    </td>
                            	    </tr>
                                    <tr>
                            		    <td width=130 align=right valign=top bgcolor=e6e6e6>
                            			    <font size=2 color=black face=arial>
                            		    	Exemption
                            		    </td>
                                        <td width=237 align=left valign=top bgcolor=e6e6e6>
                            		        #Tax_Delinquent_Exemption#
                            		    </td>
                            	    </tr>
                                </CFIF>
                                <tr>
                            		<td width=130 align=right valign=top bgcolor=e6e6e6>
                            			<font size=2 color=black face=arial>
                            			Mailing Address
                            		</td>
                                    <td width=237 align=left valign=top bgcolor=e6e6e6>
                            		    #Tax_Address# #Tax_City# #Tax_State#, #Tax_Zip#
                            		</td>
                            	</tr>
                            	<tr>
                            	    <td width=130 align=right valign=top bgcolor=e6e6e6>
                            		    <font size=2 color=black face=arial>
                            		    Additional Info
                            		</td>
                                    <td width=237 align=left valign=top bgcolor=e6e6e6>
                            			#infotax#
                            		</td>
                            	</tr>
                            </table>
</CFOUTPUT>
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
</HTML><!---</CFIF>--->