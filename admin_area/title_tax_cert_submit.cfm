<CFSET variables.uploadFileDestination = "c:\uploads\">

<cfparam name="form.file_upload" default="">
<cfparam name="tax_map_num" default="">
<cfparam name="Class_Code" default="">
<cfparam name="Total_Assessed_Value" default="">
<cfparam name="School_District" default="">
<cfparam name="Exemptions" default="">
<CFPARAM NAME="comments_only" DEFAULT="0">
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
<CFPARAM NAME="username" DEFAULT="">
<CFPARAM NAME="password" DEFAULT="">
<CFPARAM NAME="a_trigger" DEFAULT="0">
<CFPARAM NAME="Abstractor_ID_new" DEFAULT="">
<CFPARAM NAME="submitted" DEFAULT="">
<CFPARAM NAME="assigned" DEFAULT="">
<CFPARAM NAME="taxes_completed" DEFAULT="0">
<cfparam name="collects_for" default="">
<cfparam name="tax_dueDate" default="">
<cfparam name="tax_lateDate" default="">
<cfparam name="payto2" default="">
<cfparam name="taxcoll2" default="">
<cfparam name="collects_for2" default="">
<cfparam name="add12" default="">
<cfparam name="add22" default="">
<cfparam name="city2" default="">
<cfparam name="state2" default="">
<cfparam name="zip2" default="">
<cfparam name="phone2" default="">
<cfparam name="web2" default="">
<cfparam name="acctnum2" default="">
<cfparam name="taxfreq2" default="">
<cfparam name="tax_dueDate2" default="">
<cfparam name="tax_lateDate2" default="">
<cfparam name="paidDate2" default="">
<cfparam name="paidFrom2" default="">
<cfparam name="paidTo2" default="">
<cfparam name="lastamt2" default="">
<cfparam name="dueDate2" default="">
<cfparam name="dueFrom2" default="">
<cfparam name="dueTo2" default="">
<cfparam name="dueamt2" default="">
<cfparam name="delamt2" default="">
<cfparam name="thruDate2" default="">
<cfparam name="payto3" default="">
<cfparam name="taxcoll3" default="">
<cfparam name="collects_for3" default="">
<cfparam name="add13" default="">
<cfparam name="add23" default="">
<cfparam name="city3" default="">
<cfparam name="state3" default="">
<cfparam name="zip3" default="">
<cfparam name="phone3" default="">
<cfparam name="web3" default="">
<cfparam name="acctnum3" default="">
<cfparam name="taxfreq3" default="">
<cfparam name="tax_dueDate3" default="">
<cfparam name="tax_lateDate3" default="">
<cfparam name="paidDate3" default="">
<cfparam name="paidFrom3" default="">
<cfparam name="paidTo3" default="">
<cfparam name="lastamt3" default="">
<cfparam name="dueDate3" default="">
<cfparam name="dueFrom3" default="">
<cfparam name="dueTo3" default="">
<cfparam name="dueamt3" default="">
<cfparam name="delamt3" default="">
<cfparam name="thruDate3" default="">
<cfparam name="payto4" default="">
<cfparam name="taxcoll4" default="">
<cfparam name="collects_for4" default="">
<cfparam name="add14" default="">
<cfparam name="add24" default="">
<cfparam name="city4" default="">
<cfparam name="state4" default="">
<cfparam name="zip4" default="">
<cfparam name="phone4" default="">
<cfparam name="web4" default="">
<cfparam name="acctnum4" default="">
<cfparam name="taxfreq4" default="">
<cfparam name="tax_dueDate4" default="">
<cfparam name="tax_lateDate4" default="">
<cfparam name="paidDate4" default="">
<cfparam name="paidFrom4" default="">
<cfparam name="paidTo4" default="">
<cfparam name="lastamt4" default="">
<cfparam name="dueDate4" default="">
<cfparam name="dueFrom4" default="">
<cfparam name="dueTo4" default="">
<cfparam name="dueamt4" default="">
<cfparam name="delamt4" default="">
<cfparam name="thruDate4" default="">
<cfparam name="payto5" default="">
<cfparam name="taxcoll5" default="">
<cfparam name="collects_for5" default="">
<cfparam name="add15" default="">
<cfparam name="add25" default="">
<cfparam name="city5" default="">
<cfparam name="state5" default="">
<cfparam name="zip5" default="">
<cfparam name="phone5" default="">
<cfparam name="web5" default="">
<cfparam name="acctnum5" default="">
<cfparam name="taxfreq5" default="">
<cfparam name="tax_dueDate5" default="">
<cfparam name="tax_lateDate5" default="">
<cfparam name="paidDate5" default="">
<cfparam name="paidFrom5" default="">
<cfparam name="paidTo5" default="">
<cfparam name="lastamt5" default="">
<cfparam name="dueDate5" default="">
<cfparam name="dueFrom5" default="">
<cfparam name="dueTo5" default="">
<cfparam name="dueamt5" default="">
<cfparam name="delamt5" default="">
<cfparam name="thruDate5" default="">
<cfparam name="payto6" default="">
<cfparam name="taxcoll6" default="">
<cfparam name="collects_for6" default="">
<cfparam name="add16" default="">
<cfparam name="add26" default="">
<cfparam name="city6" default="">
<cfparam name="state6" default="">
<cfparam name="zip6" default="">
<cfparam name="phone6" default="">
<cfparam name="web6" default="">
<cfparam name="acctnum6" default="">
<cfparam name="taxfreq6" default="">
<cfparam name="tax_dueDate6" default="">
<cfparam name="tax_lateDate6" default="">
<cfparam name="paidDate6" default="">
<cfparam name="paidFrom6" default="">
<cfparam name="paidTo6" default="">
<cfparam name="lastamt6" default="">
<cfparam name="dueDate6" default="">
<cfparam name="dueFrom6" default="">
<cfparam name="dueTo6" default="">
<cfparam name="dueamt6" default="">
<cfparam name="delamt6" default="">
<cfparam name="thruDate6" default="">
<cfparam name="tax_cert" default="">
<cfparam name="deed_upload" default="">




<CFQUERY datasource="#request.dsn#" name="check_for_record">
	SELECT * FROM  tblUser_Roles
	where title_id = #rec_id#
 </cfquery>
 <cfif check_for_record.recordcount lt 1>
<CFQUERY datasource="#request.dsn#" name="insert_for_record">
	INSERT INTO  tblUser_Roles (title_id)
	values (#rec_id#)
 </cfquery>
 </cfif>
 <CFQUERY datasource="#request.dsn#" name="check_for_record">
	SELECT * FROM  tax_cert_title
	where title_id = #rec_id#
 </cfquery>
 <cfif check_for_record.recordcount lt 1>
<CFQUERY datasource="#request.dsn#" name="insert_for_record">
	INSERT INTO tax_cert_title (title_id)
	values (#rec_id#)
 </cfquery>
 </cfif>


<cfif Len(form.file_upload)>
<CFFILE 			
	    DESTINATION="#variables.uploadFileDestination#"
		ACTION="UPLOAD"
		NAMECONFLICT="MAKEUNIQUE"
		FILEFIELD="file_upload">
 <cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset new_file_name = #fileSys.MoveFromUploads('#FILE.ServerFile#')#>
<CFQUERY datasource="#request.dsn#" >
			UPDATE tax_cert_title
			set tax_cert = '#new_file_name#'
			where title_id = #rec_id#
 </cfquery>
</cfif>


<cfif Len(form.file_upload2)>
<CFFILE 			
	    DESTINATION="#variables.uploadFileDestination#"
		ACTION="UPLOAD"
		NAMECONFLICT="MAKEUNIQUE"
		FILEFIELD="file_upload2">
 <cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset new_file_name = #fileSys.MoveFromUploads('#FILE.ServerFile#')#>
<CFQUERY datasource="#request.dsn#" >
			UPDATE tax_cert_title
			set deed_upload = '#new_file_name#'
			where title_id = #rec_id#
 </cfquery>
</cfif>



<cfif #assigned# neq "1">


<cfif #rec_yeart# NEQ "" AND #rec_mont# NEQ "" AND #rec_dayt# NEQ "">
<CFSET recdatet = #CreateDate(#rec_yeart#, #rec_mont#, #rec_dayt#)#>
<cfelse>
<cfset recdatet = "">
</cfif>

<CFSET c_date = #DateFormat(Now(), "mm/dd/yyyy")#>
<CFSET c_time = #TimeFormat(Now(), "HH:mm:ss")#>



<CFSET order_date_adj = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>

<CFQUERY datasource="#request.dsn#" NAME="read_user">
	SELECT     First_Admin.fname, First_Admin.lname
	FROM       tblUser_Roles LEFT OUTER JOIN
               First_Admin ON tblUser_Roles.payoff_ID = First_Admin.ID
	WHERE      (tblUser_Roles.Title_ID = #rec_id#)
</CFQUERY>



 <CFQUERY datasource="#request.dsn#" >
	UPDATE tblUser_Roles
	SET 	payoff_Finish_Datetime = getDate()
	where title_id = #rec_id#
 </cfquery>

 <!---Create note that Taxes were completed--->
 <cfif taxes_completed eq 1>
 <CFQUERY datasource="#request.dsn#">
						INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type)
						VALUES('Auto', 'Web', #rec_id#,'Taxes completed by #read_user.fname# #read_user.lname#' ,'#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T')
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="vendor_tracker">
		Update Vendor_Tracker
		set return_date = '#DateFormat(Now(), "m/d/yyyy")#'
		Where Order_id = #rec_id# and return_date IS NULL and vendor_type = 'taxes'
</CFQUERY>
</cfif>



<cfif comments_only eq 1>
<CFQUERY datasource="#request.dsn#" >
			UPDATE tax_cert_title
			set a_date_started = 'Yes',
			 <cfif taxes_completed eq 1>
			 taxes_completed = 1,
			 </cfif>
			comments='#comments#',
			comments_only = '#comments_only#'
			where title_id = #rec_id#
 </cfquery>

 <cfelse>

<CFQUERY datasource="#request.dsn#" >
			UPDATE tax_cert_title
			SET 	a_date_started = 'Yes',
			<cfif taxes_completed eq 1>
			 taxes_completed = 1,
			 </cfif>
			 a_date_finished = '#c_date#',
			t_dateandtime = '#order_date_adj#',
			a_time_finished = '#c_time#',

			tax_map_num = '#tax_map_num#',
			Class_Code = '#Class_Code#',
			Total_Assessed_Value = '#Total_Assessed_Value#',
			School_District = '#School_District#',
			Exemptions = '#Exemptions#',

      <cfif #submitted# eq 1>
			submitted = 1,
			</cfif>
			payto='#payto#',
			taxcoll='#taxcoll#',
			add1='#add1#',
			add2='#add2#',
			city='#city#',
			state='#state#',
			zip='#zip#',
			phone='#phone#',
			web='#web#',
			acctnum='#acctnum#',
			taxfreq='#taxfreq#',
			<cfif #paidfrom# neq "" and #paidfrom# neq "na" and #paidfrom# neq "n/a">
			paidfrom='#DateFormat(paidfrom, "mm/dd/yyyy")#',
			<cfelse>
			paidfrom=NULL,
			</cfif>
			<cfif #paidto# neq "" and #paidto# neq "na" and #paidto# neq "n/a">
			paidto='#DateFormat(paidto, "mm/dd/yyyy")#',
			<cfelse>
			paidto=NULL,
			</cfif>
			lastamt='#lastamt#',
			<cfif #duefrom# neq "" and #duefrom# neq "na" and #duefrom# neq "n/a">
			duefrom='#DateFormat(duefrom, "mm/dd/yyyy")#',
			<cfelse>
			duefrom=NULL,
			</cfif>
			<cfif #dueto# neq "" and #dueto# neq "na" and #dueto# neq "n/a">
			dueto='#DateFormat(dueto, "mm/dd/yyyy")#',
			<cfelse>
			dueto=NULL,
			</cfif>
			dueamt='#dueamt#',
			<cfif #paiddate# neq "" and #paiddate# neq "na" and #paiddate# neq "n/a">
			paiddate='#DateFormat(paiddate, "mm/dd/yyyy")#',
			<Cfelse>
			paiddate=NULL,
			</cfif>
			<cfif #duedate# neq "" and #duedate# neq "na" and #duedate# neq "n/a">
			duedate='#DateFormat(duedate, "mm/dd/yyyy")#',
			<cfelse>
			duedate=NULL,
			</cfif>
      <cfif #thrudate# neq "" and #thrudate# neq "na" and #thrudate# neq "n/a">
			thrudate='#DateFormat(thrudate, "mm/dd/yyyy")#',
			<cfelse>
			thrudate=NULL,
			</cfif>
			delamt='#delamt#',
			payto2 = '#payto2#',
			taxcoll2 = '#taxcoll2#',
			collects_for = '#collects_for#',
			tax_dueDate = '#tax_dueDate#',
			tax_lateDate = '#tax_lateDate#',
			tax_dueDateB = '#tax_dueDateB#',
			tax_lateDateB = '#tax_lateDateB#',
			tax_dueDateC = '#tax_dueDateC#',
			tax_lateDateC = '#tax_lateDateC#',
			tax_dueDateD = '#tax_dueDateD#',
			tax_lateDateD = '#tax_lateDateD#',
		    collects_for2 = '#collects_for2#',
			add12 = '#add12#',
			add22 = '#add22#',
			city2 = '#city2#',
			state2 = '#state2#',
			zip2 = '#zip2#',
			phone2 = '#phone2#',
			web2 = '#web2#',
			acctnum2 = '#acctnum2#',
			taxfreq2 = '#taxfreq2#',
			tax_dueDate2 = '#tax_dueDate2#',
			tax_lateDate2 = '#tax_lateDate2#',
			tax_dueDate2B = '#tax_dueDate2B#',
			tax_lateDate2B = '#tax_lateDate2B#',
			tax_dueDate2C = '#tax_dueDate2C#',
			tax_lateDate2C = '#tax_lateDate2C#',
			tax_dueDate2D = '#tax_dueDate2D#',
			tax_lateDate2D = '#tax_lateDate2D#',
			paidDate2 = '#paidDate2#',
			paidFrom2 = '#paidFrom2#',
			paidTo2 = '#paidTo2#',
			lastamt2 = '#lastamt2#',
			dueDate2 = '#dueDate2#',
			dueFrom2 = '#dueFrom2#',
			dueTo2 = '#dueTo2#',
			dueamt2 = '#dueamt2#',
			delamt2 = '#delamt2#',
			thruDate2 = '#thruDate2#',
			payto3 = '#payto3#',
			taxcoll3 = '#taxcoll3#',
			collects_for3 = '#collects_for3#',
			add13 = '#add13#',
			add23 = '#add23#',
			city3 = '#city3#',
			state3 = '#state3#',
			zip3 = '#zip3#',
			phone3 = '#phone3#',
			web3 = '#web3#',
			acctnum3 = '#acctnum3#',
			taxfreq3 = '#taxfreq3#',
			tax_dueDate3 = '#tax_dueDate3#',
			tax_lateDate3 = '#tax_lateDate3#',
			tax_dueDate3B = '#tax_dueDate3B#',
			tax_lateDate3B = '#tax_lateDate3B#',
			tax_dueDate3C = '#tax_dueDate3C#',
			tax_lateDate3C = '#tax_lateDate3C#',
			tax_dueDate3D = '#tax_dueDate3D#',
			tax_lateDate3D = '#tax_lateDate3D#',
			paidDate3 = '#paidDate3#',
			paidFrom3 = '#paidFrom3#',
			paidTo3 = '#paidTo3#',
			lastamt3  = '#lastamt3#',
			dueDate3 = '#dueDate3#',
			dueFrom3 = '#dueFrom3#',
			dueTo3 = '#dueTo3#',
			dueamt3 = '#dueamt3#',
			delamt3 = '#delamt3#',
			thruDate3 = '#thruDate3#',

			payto4 = '#payto4#',
			taxcoll4 = '#taxcoll4#',
			collects_for4 = '#collects_for4#',
			add14 = '#add14#',
			add24 = '#add24#',
			city4 = '#city4#',
			state4 = '#state4#',
			zip4 = '#zip4#',
			phone4 = '#phone4#',
			web4 = '#web4#',
			acctnum4 = '#acctnum4#',
			taxfreq4 = '#taxfreq4#',
			tax_dueDate4 = '#tax_dueDate4#',
			tax_lateDate4 = '#tax_lateDate4#',
			tax_dueDate4B = '#tax_dueDate4B#',
			tax_lateDate4B = '#tax_lateDate4B#',
			tax_dueDate4C = '#tax_dueDate4C#',
			tax_lateDate4C = '#tax_lateDate4C#',
			tax_dueDate4D = '#tax_dueDate4D#',
			tax_lateDate4D = '#tax_lateDate4D#',
			paidDate4 = '#paidDate4#',
			paidFrom4 = '#paidFrom4#',
			paidTo4 = '#paidTo4#',
			lastamt4  = '#lastamt4#',
			dueDate4 = '#dueDate4#',
			dueFrom4 = '#dueFrom4#',
			dueTo4 = '#dueTo4#',
			dueamt4 = '#dueamt4#',
			delamt4 = '#delamt4#',
			thruDate4 = '#thruDate4#',


			payto5 = '#payto5#',
			taxcoll5 = '#taxcoll5#',
			collects_for5 = '#collects_for5#',
			add15 = '#add15#',
			add25 = '#add25#',
			city5 = '#city5#',
			state5 = '#state5#',
			zip5 = '#zip5#',
			phone5 = '#phone5#',
			web5 = '#web5#',
			acctnum5 = '#acctnum5#',
			taxfreq5 = '#taxfreq5#',
			tax_dueDate5 = '#tax_dueDate5#',
			tax_lateDate5 = '#tax_lateDate5#',
			tax_dueDate5B = '#tax_dueDate5B#',
			tax_lateDate5B = '#tax_lateDate5B#',
			tax_dueDate5C = '#tax_dueDate5C#',
			tax_lateDate5C = '#tax_lateDate5C#',
			tax_dueDate5D = '#tax_dueDate5D#',
			tax_lateDate5D = '#tax_lateDate5D#',
			paidDate5 = '#paidDate5#',
			paidFrom5 = '#paidFrom5#',
			paidTo5 = '#paidTo5#',
			lastamt5  = '#lastamt5#',
			dueDate5 = '#dueDate5#',
			dueFrom5 = '#dueFrom5#',
			dueTo5 = '#dueTo5#',
			dueamt5 = '#dueamt5#',
			delamt5 = '#delamt5#',
			thruDate5 = '#thruDate5#',

			payto6 = '#payto6#',
			taxcoll6 = '#taxcoll6#',
			collects_for6 = '#collects_for6#',
			add16 = '#add16#',
			add26 = '#add26#',
			city6 = '#city6#',
			state6 = '#state6#',
			zip6 = '#zip6#',
			phone6 = '#phone6#',
			web6 = '#web6#',
			acctnum6 = '#acctnum6#',
			taxfreq6 = '#taxfreq6#',
			tax_dueDate6 = '#tax_dueDate6#',
			tax_lateDate6 = '#tax_lateDate6#',
			tax_dueDate6B = '#tax_dueDate6B#',
			tax_lateDate6B = '#tax_lateDate6B#',
			tax_dueDate6C = '#tax_dueDate6C#',
			tax_lateDate6C = '#tax_lateDate6C#',
			tax_dueDate6D = '#tax_dueDate6D#',
			tax_lateDate6D = '#tax_lateDate6D#',
			paidDate6 = '#paidDate6#',
			paidFrom6 = '#paidFrom6#',
			paidTo6 = '#paidTo6#',
			lastamt6  = '#lastamt6#',
			dueDate6 = '#dueDate6#',
			dueFrom6 = '#dueFrom6#',
			dueTo6 = '#dueTo6#',
			dueamt6 = '#dueamt6#',
			delamt6 = '#delamt6#',
			thruDate6 = '#thruDate6#',

			comments='#comments#',
			comments_only = '#comments_only#'
			where title_id = #rec_id#
 </cfquery>
</cfif>



  <cfif #submitted# neq "">
 <CFQUERY datasource="#request.dsn#" NAME="check_taxes">
			Select taxes_from_search
			from Doc_Abstract_Title
			WHERE title_ID = #rec_ID#
		</CFQUERY>

<cfif check_taxes.taxes_from_search eq 1>
 <CFQUERY datasource="#request.dsn#" NAME="read_title_abs">
			UPDATE Doc_Abstract_Title
			SET Abstractor_tax_ID = 2377,
			tx_type = 1
			WHERE title_ID = #rec_ID#
		</CFQUERY>
</cfif>

<cfif taxes_completed eq 1>
 	<CFMAIL
				TO="taxcomplete@firsttitleservices.com"
				FROM="vendormgr@firsttitleservices.com" Subject="Taxes Completed and ready for Review - Order #rec_id#"
				TIMEOUT="600"
>

 Taxes Completed in-house and ready for Review - Order #rec_id#

</cfmail>
 </cfif>



 <cfif #username# eq "">
  <CFQUERY datasource="#request.dsn#" NAME="ft_user">
 	SELECT     fname, lname
	FROM       First_Admin
	WHERE      ID = #url.uid#
 </CFQUERY>

<cfif taxes_completed eq 1>
  <CFQUERY datasource="#request.dsn#">
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#ft_user.FName#', '#ft_user.LName#', #URL.rec_id#, 'Taxes Completed and ready for Review', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')
		</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="vendor_tracker">
		Update Vendor_Tracker
		set return_date = '#DateFormat(Now(), "m/d/yyyy")#'
		Where Order_id = #URL.Rec_id# and return_date IS NULL and vendor_type = 'taxes'
</CFQUERY>

	<CFMAIL
				TO="vendormgr@firsttitleservices.com"
				FROM="vendormgr@firsttitleservices.com" Subject="Taxes Completed and ready for Review - Order #rec_id#"
				TIMEOUT="600"
>

 Taxes Completed in-house and ready for Review - Order #rec_id#

</cfmail>
</cfif>

<cfelse>


  <CFQUERY datasource="#request.dsn#" NAME="ft_user">
 	SELECT     company, lname
	FROM       abstractors
	WHERE      username = '#username#' and password = '#password#'
 </CFQUERY>
 <cfif taxes_completed eq 1>
  <CFQUERY datasource="#request.dsn#">
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#ft_user.company#', '#ft_user.LName#', #URL.rec_id#, 'Taxes Completed and ready for Review', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')
	</CFQUERY>

<CFMAIL
				TO="vendormgr@firsttitleservices.com"
				FROM="vendormgr@firsttitleservices.com" Subject="Taxes Completed by #ft_user.company# and ready for Review - Order #rec_id#"
				TIMEOUT="600"
>

 Taxes Completed by vendor #ft_user.company# and ready for Review - Order #rec_id#

</cfmail>
</cfif>


</cfif>



 </cfif>








 <cfelse>




 <cfif #Abstractor_ID_new# neq "none" AND #username# eq "">


 <CFSET order_date_adj = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>


 <CFQUERY datasource="#request.dsn#" name="check_exists">
						select title_id from Doc_Abstract_Title
						where title_id = #rec_id#
</CFQUERY>
<cfif NOT check_exists.recordcount>
<CFQUERY datasource="#request.dsn#" name="create_record">
						insert into Doc_Abstract_Title (title_id)
						values (#rec_id#)
</CFQUERY>
</cfif>


  <cfif #Abstractor_ID_new# eq "">

 <CFQUERY datasource="#request.dsn#" name="check_for_record">
	SELECT * FROM  Doc_Abstract_Title
	where title_id = #rec_id#
 </cfquery>
 <cfif check_for_record.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" name="insert_for_record">
	INSERT INTO Doc_Abstract_Title (title_id)
	values (#rec_id#)
 </cfquery>
 </cfif>

 <CFQUERY datasource="#request.dsn#" NAME="read_title_abs">

			UPDATE Doc_Abstract_Title
			SET Abstractor_tax_ID = null,
			tx_type = 1
			WHERE title_ID = #rec_ID#

		</CFQUERY>


		<cfelse>

 <CFQUERY datasource="#request.dsn#" name="check_for_record">
	SELECT * FROM  Doc_Abstract_Title
	where title_id = #rec_id#
 </cfquery>
 <cfif check_for_record.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" name="insert_for_record">
	INSERT INTO Doc_Abstract_Title (title_id)
	values (#rec_id#)
 </cfquery>
 </cfif>

		 <CFQUERY datasource="#request.dsn#" NAME="read_title_abs">

			UPDATE Doc_Abstract_Title
			SET Abstractor_tax_ID = #Abstractor_ID_new#,
			tx_type = 1
			WHERE title_ID = #rec_ID#

		</CFQUERY>
		 <CFQUERY datasource="#request.dsn#" NAME="read_title_abs">

			UPDATE tax_cert_Title
			SET a_date_started = NULL,
			taxes_completed = 0
			WHERE title_ID = #rec_ID#

		</CFQUERY>


		</cfif>


 </cfif>






  <CFQUERY datasource="#request.dsn#" NAME="ft_user">
 	SELECT     company, lname,email
	FROM       abstractors
	WHERE      abstractor_id = '#Abstractor_ID_new#'
 </CFQUERY>



  <CFQUERY datasource="#request.dsn#">
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#ft_user.company#', '#ft_user.LName#', #URL.rec_id#, 'Tax Certification report request assigned to #ft_user.company#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')
	</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="vendor_tracker">
		Insert into Vendor_Tracker (Vendor_id, Order_id, order_type, assign_date, assigned_by, vendor_type, task)
		values
		(#Abstractor_ID_new#, #URL.rec_id#, 'T', #createODBCDateTime(Now())#, #uid#, 'taxes', 'Tax Certification Report')
</CFQUERY>





<cfset to_email = ft_user.email & ",akumar@firsttitleservices.com,vendormgr@firsttitleservices.com">

<CFQUERY datasource="#request.dsn#" NAME="get_streamline">
		select c.streamline_client, c.intSales from title t, companies c
		where t.title_id = #rec_id# and c.ID = t.comp_id
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="get_company_city">
		select mi_employee, mo_employee, mi_flushing_employee, va_employee, tx_employee, ft_fairfax_employee
		from First_Admin where ID = #get_streamline.intSales#
</CFQUERY>

<cfif get_streamline.streamline_client eq 'True'>
<cfset prefix = 'ST'>
<cfelseif get_company_city.mi_employee eq 'True'>
<cfset prefix = 'MI'>
<cfelseif get_company_city.mo_employee eq 'True'>
<cfset prefix = 'MO'>
<cfelseif get_company_city.mi_flushing_employee eq 'True'>
<cfset prefix = 'MF'>
<cfelseif get_company_city.va_employee eq 'True'>
<cfset prefix = 'RI'>
<cfelseif get_company_city.tx_employee eq 'True'>
<cfset prefix = 'TX'>
<cfelseif get_company_city.ft_fairfax_employee eq 'True'>
<cfset prefix = 'FX'>
<cfelse>
<cfset prefix = 'T'>
</cfif>

	<CFMAIL
				TO="#to_email#"
				FROM="vendormgr@firsttitleservices.com" Subject="New Tax Certification report request from Abstracts, USA - Order #prefix#-#rec_id#"
				TIMEOUT="600"
>

New Tax Certification report request from Abstracts, USA - Order #prefix#-#rec_id#

</cfmail>





 </cfif>





<cfif #username# eq "">
<CFLOCATION URL="https://#cgi.server_name#/admin_area/title_tax_cert_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=0">

<cfelse>
<CFLOCATION URL="https://#cgi.server_name#/title_abstract_doc_view_c.cfm?username=#username#&password=#password#&prop_id=NONE&rec_id=#rec_id#&a_trigger=1&title_id=#rec_id#&company_id=0">

</cfif>
<!--
			data19 = '#taxid#',
			data28 = '#tx#',
			data29 = '#tax_year#',
			data30 = '#duedate#',
			data31 = '#stat#', too
			data34 = '#infotax#',
-->