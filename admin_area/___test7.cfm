
<CFPARAM NAME="a_trigger" DEFAULT="0">

	
		<CFQUERY datasource="#request.dsn#" NAME="read_Title">
		
			SELECT *
			FROM Title
			WHERE Title_ID = #rec_ID#
		
		</CFQUERY>
			<CFSET Buyer_1 = #read_Title.bfirstname1# & " " & #read_Title.bminame1# & " " & #read_Title.blastname1#>
			
			<CFSET Buyer_2 = #read_Title.bfirstname2# & " " & #read_Title.bminame2# & " " & #read_Title.blastname2#>
			
			<CFSET Seller_1 = #read_Title.sfirstname1# & " " & #read_Title.sminame1# & " " & #read_Title.slastname1#>
			
			<CFSET Seller_2 = #read_Title.sfirstname2# & " " & #read_Title.sminame2# & " " & #read_Title.slastname2#>		

		<CFQUERY datasource="#request.dsn#" NAME="Read_Committment_Doc">		
			SELECT *
			FROM Doc_Title_Insurance_Title
			WHERE Title_ID = #rec_ID# and Insurance_co = 16 	
		</CFQUERY> 
		<CFQUERY datasource="#request.dsn#" NAME="read_ins_committments">		
			SELECT *
			FROM Doc_Title_Insurance_Title
			WHERE Title_ID = #rec_ID#		
		</CFQUERY>
	<CFQUERY datasource="#request.dsn#" NAME="get_billing_states">
		SELECT *
		FROM  Company_Billing_states 
		WHERE company_id = #read_title.comp_id# AND a_states = '#read_title.pstate#'
	
</CFQUERY>	
		
<cfif #get_billing_states.recordcount# GT "0">
<CFQUERY datasource="#request.dsn#" NAME="get_line_costs">
		SELECT *
		FROM Company_Billing_Values
		WHERE company_id = #read_title.comp_id# AND billing_id = #get_billing_states.billing_id#
	</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_age">
		SELECT *
		FROM  company_agency_assoc
		WHERE billing_id = #get_billing_states.billing_id#
	
</CFQUERY>

<!---If the State is California or Nevada then they need to be the company 21 which is E-Title--->
<CFIF #read_title.pstate# eq "CA">
    <CFSET 	title_ft_agency_id = "21">
<CFELSEIF #read_title.pstate# eq "NV">    
        <CFSET 	title_ft_agency_id = "21">
<CFELSE>
    <CFSET 	title_ft_agency_id = "#read_age.title_ft_agency_id#">
</CFIF>        

<CFQUERY datasource="#request.dsn#" NAME="read_Title_FT_Agency_company">
		SELECT *
		FROM  title_ft_agencies
		WHERE title_ft_agency_id = #title_ft_agency_id #
</CFQUERY>	


<cfelse>
<CFQUERY datasource="#request.dsn#" NAME="read_Title_FT_Agency_company">
		SELECT *
		FROM  title_ft_agencies
		WHERE 0 = 1
	
</CFQUERY>	

</cfif>
	<CFQUERY datasource="#request.dsn#" NAME="Read_Doc">		
			SELECT *
			FROM Doc_Amer_Pioneer_Ins_ALL_Title
			WHERE Title_ID = #rec_ID#
		</CFQUERY> 

		<CFQUERY datasource="#request.dsn#" NAME="read_company">		
			SELECT *
			FROM Title_Companies
			WHERE Title_Co_ID = 16			
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="Read_Committment_Doc">		
			SELECT *
			FROM Doc_Amer_Pioneer_Ins_ALL_Title
			WHERE Title_ID = #rec_ID#
		</CFQUERY> 
				<CFQUERY datasource="#request.dsn#" NAME="read_tax_info">
		
			SELECT *
			FROM tax_cert_title
			where title_id = #rec_id# 
		</CFQUERY>
				<CFQUERY datasource="#request.dsn#" NAME="read_deed_info">
		SELECT     *
FROM         title_ins_view
WHERE     (title_id = #rec_id#) AND (type = 'DATA')
ORDER BY insert_date, insert_time DESC
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_data_info">
		SELECT     *
FROM        doc_title_insurance_title
WHERE     (title_id = #rec_id#) 
</CFQUERY>


 <CFQUERY datasource="#request.dsn#" NAME="read_title_file">
            select * from title_ins_view WHERE title_id = #url.rec_ID# and selectedOrgs 
            is not null </cfquery> 

	<CFSET alta1 =	"ALTA Owners Form B">
<CFSET alta2 =	"ALTA Mortgagees">
<CFSET d_out = '"' & "Commitment Number: " & #read_Title.title_id# & '"' & "," &
				'"' & "Commitment Date: " & #read_ins_committments.a_recieved_date# & " " & "at: " & #read_ins_committments.a_recieved_time# & '"' & "," &
				'"' & "Owner Policy: " & #alta1# & " " & "Proposed Insured: $ " & #Buyer_1# & " " & "Policy Amount $ " & #read_title.Purchase# & '"' & "," &
				'"' & "Owner Policy: " & #alta2# & " " & "Proposed Insured: $ " & #read_title.Insured# & " " & "Policy Amount $ " & #read_title.loanamt_float# & '"' & "," &
				'"' & "The Estate or interest in the land described in this Commitment is owned at the Commitment Date by: " &  #Buyer_1# & '"' & "," &
				'"' & "The land referred to in the Commitment is described as follows: " & #read_title_file.notes#	& '"' & "," &
        '"' & "The following are the requirements to be complied with: " & #read_title_file.addreq# & '"' & "," &
		    '"' & "Schedule B of the policy or policies to be issued will contain exceptions to the following matters unless the same are disposed of to the satisfaction of the company: " & #read_title_file.addex# & '"' & "," &
				'"' & " " & '"' & ","
				>

<!--- read out the last number used for a file name 

	<CFFILE ACTION="read"
	FILE="C:\Inetpub\wwwroot\clients\firsttitleservices.com\www\file_number\file_no.txt"
	variable="n_OUT">--->

<!--- increment that number 

	<CFSET n_no = #n_out# + "1">--->

<!--- delete the old file with the old number --->
<!--- FILE="F:\InetPub\wwwroot\71.068___www.firsttitleservices.com\file_number\file_no.txt" --->
	<!---<CFFILE ACTION="delete"
	FILE="C:\Inetpub\wwwroot\clients\firsttitleservices.com\www\file_number\file_no.txt"
	> --->
<!--- write the new number to the file --->

	<!--- <CFFILE ACTION="WRITE"
	FILE="C:\Inetpub\wwwroot\clients\firsttitleservices.com\www\file_number\file_no.txt"
	OUTPUT="#n_no#">--->

<!--- now writ the data for this order to the file --->
<!--- FILE="F:\InetPub\wwwroot\71.068___www.firsttitleservices.com\dhfvtywty_1\data_#n_no#.txt" --->
	<CFFILE ACTION="WRITE"
	FILE="C:\Inetpub\wwwroot\clients\firsttitleservices.com\www\dhfvtywty_1\#read_Title.title_id#.txt"
	OUTPUT="#D_OUT#">




<HTML XMLNS:IE>
<HEAD>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<?IMPORT NAMESPACE="IE" IMPLEMENTATION="#default">
<STYLE TYPE="text/css">
.contentstyle
{
  width:5.5in;
  height:8in;
  margin:1in;
  background:white;   
  border:1 dashed gray;
}
.masterstyle
{ 
  width:8.5in;
  height:11in;
  background:#FFFFFF;   
  border-left:0 solid black;
  border-top:1 solid black;
  border-right:4 solid black;
  border-bottom:4 solid black;
  margin:10px;
}
</STYLE>
<link rel="stylesheet" href="links.css" type="text/css">
<style media="print">
.noprint     { display: none }
</style>

</head>
<BODY>

<p>
 
<table width="100%" cellpadding=1 cellspacing=1 border=0 bgcolor=white>
<cfoutput>
<FORM action="./Title_committment_submit.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&company_id=#company_ID#&a_trigger=7"  ENCTYPE="multipart/form-data" method="post"> 
</cfoutput>
<tr>
<td width="100%" align=center valign=top bgcolor=yellow>
			<b><font face=verdana size=3 color=red>Click this button to complete </font></b><INPUT TYPE=IMAGE SRC="./images/button_mark_as_sent.gif" border=0> 
</td>	</tr>
</form>
</table><cfif #read_title.comp_id# eq "254">
<table  width="98%" cellpadding="3" cellspacing="0" border="0">
  <tr> 
    <td align="center" valign="middle" colspan="3"><p><font size="4" face="Verdana, Arial, Helvetica, sans-serif"><strong>First 
        Title Commitment Review Sheet</strong></font></p></td>
  </tr>
  <tr> 
    <td colspan="3"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr align="left" valign="top"> 
    <td width="45%"><font size="3" face="Verdana, Arial, Helvetica, sans-serif"><strong>Title 
      Company Name:</strong></font><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><br>
      <strong>Title Company Contact:</strong>&nbsp;</font></td>
    <td width="15%"><font size="3" face="Verdana, Arial, Helvetica, sans-serif"><strong><font size="2"><br>
      Name:&nbsp;&nbsp;</font></strong><font size="2"> <br>
      </font><font size="3" face="Verdana, Arial, Helvetica, sans-serif"><font size="2"><strong>Phone:&nbsp;&nbsp;</strong> 
      <br>
      </font><font size="3" face="Verdana, Arial, Helvetica, sans-serif"><font size="2"><strong>E-mail:&nbsp;&nbsp;</strong> 
      </font></font><font size="2"> </font></font><font size="2"> </font></font></td>
    <td width="40%"><strong><font size="3" face="Verdana, Arial, Helvetica, sans-serif">First 
      Title & Escrow, Inc.<br>
      <font size="2">Customer Relations Department<br>
      301-279-0303 x0<br>
      clientservices@firsttitleservices.com</font></font></strong></td>
  </tr>
  <tr align="left" valign="top"> 
    <td><font size="3" face="Verdana, Arial, Helvetica, sans-serif"><strong>File 
      Number:<br>
      Legal Address:<br><br>
      Tax ID info:</strong></font></td>
    <td>&nbsp;</td>
    <td><strong><font size="3" face="Verdana, Arial, Helvetica, sans-serif"><cfoutput>#read_title.loan_number#<br>
      #read_title.paddress#,<br> #read_title.pcity#, #read_title.pstate# #read_title.pzip#<br>
      #read_tax_info.data19#</font></strong></td>
  </tr>
  <tr align="left" valign="top"> 
    <td colspan="2"> <table border="1" bordercolor="333333" bordercolordark="333333" bordercolorlight="333333" cellpadding="5" cellspacing="0" width="100%">
        <tr> 
          <td valign="top"><font size="3" face="Verdana, Arial, Helvetica, sans-serif"><strong>Who 
            is on title to the property?:</strong><br>
            <strong><font size="1">(include middle name or initial as it appears 
            on title)</font></strong></font></td>
        </tr>
      </table></td>
    <td><strong><font size="3" face="Verdana, Arial, Helvetica, sans-serif">#read_deed_info.data3# <cfif #read_deed_info.data4# neq "">AND #read_deed_info.data4#</cfif></font></strong></td>
  </tr>
  <tr> 
    <td colspan="3">&nbsp;</td>
  </tr>
  <tr align="left" valign="top"> 
    <td colspan="3"><p><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif">1. 
        Have there been any changes in title in the past 12 months (someone added 
        or taken off title, etc.)<br><cfset testDate = #DateFormat(CreateODBCDate(read_deed_info.data11), "m/d/yyyy")#>
        <cfif #DATEDIFF("m", testDate, read_data_info.merge_date)# LT 12>&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/checked.jpg">YES&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/unchecked.jpg" width="73" height="23">NO 
        <cfelse>&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/unchecked.jpg">YES&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/checked.jpg" width="73" height="23">NO </cfif><font size="1">(if YES, explain in comments below.)</font> </font></strong></p>
     <p><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif">2. Are 
        there any items that need to be cleared:<br>
         <cfif #read_data_info.cleared# neq "" OR #read_data_info.clear_needed# neq "">&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/checked.jpg">YES&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/unchecked.jpg" width="73" height="23">NO 
         <cfelse>&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/unchecked.jpg">YES&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/checked.jpg" width="73" height="23">NO </cfif><font size="1">(if YES, explain in comments below.)</font> </font></strong></p>
   <font size="1">(if YES, explain in comments below.)</font></font></strong></p>
      <p><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif">3. 
        Are the property taxes up to date?<br>
        <cfif #read_tax_info.data31# eq "Paid">&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/checked.jpg">YES&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/unchecked.jpg" width="73" height="23">NO 
        <font size="1">(if NO, explain in comments below.)</font></font></strong></p></td>
 <cfelse>&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/unchecked.jpg">YES&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/checked.jpg" width="73" height="23">NO </cfif><font size="1">(if NO, explain in comments below.)</font> </font></strong></p>
     
  </tr>
  <tr> 
    <td colspan="3"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr> 
    <td align="center" valign="middle" colspan="3"> <table border="1" bordercolor="333333" bordercolordark="333333" bordercolorlight="333333" cellpadding="4" cellspacing="0" width="100%" align="center">
        <tr valign="middle"> 
          <td width="50%"><strong><font size="3" face="Verdana, Arial, Helvetica, sans-serif">Items 
            to be cleared:</font></strong></td>
          <td width="50%"><strong><font size="3" face="Verdana, Arial, Helvetica, sans-serif">What 
            is needed to clear issue:</font></strong></td>
        </tr>
<FORM action="./Title_committment_submit_review.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&company_id=#company_ID#&a_trigger=7"  ENCTYPE="multipart/form-data" method="post"> 

        <tr valign="top"> 
          <td width="50%"> <ol>
              <li><font size="2" face="Verdana, Arial, Helvetica, sans-serif">
			  <TEXTAREA name="cleared"  COLS=70 ROWS=3
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
					clear: none;">#read_data_info.cleared#</TEXTAREA>
					</font></li>
            </ol></td>
          <td width="50%"> <ol>
              <li><font size="2" face="Verdana, Arial, Helvetica, sans-serif">
			  <TEXTAREA name="clear_needed"  COLS=70 ROWS=3
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
					clear: none;">#read_data_info.clear_needed#</TEXTAREA>
			  </font></li>
            </ol></td>
        </tr><tr>
<td width="100%" colspan = 2 align=center valign=top bgcolor=yellow>
			<b><font face=verdana size=3 color=red>Type above and click </font></b><INPUT TYPE=IMAGE SRC="./images/button_modify.gif" border=0> to save changes
</td>	</tr></form>
      </table></td>
  </tr>
  <tr> 
    <td valign="middle" colspan="3"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Comments:</strong></font></td>
  </tr>
  <tr> 
    <td valign="middle" colspan="3"> <ol>
        <li><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><cfif #DATEDIFF("m", testDate, read_data_info.merge_date)# LT 12>1. #read_deed_info.data5# recorded on #read_deed_info.data11# from #read_deed_info.data1# #read_deed_info.data2# to #read_deed_info.data3# #read_deed_info.data4#<br></cfif><cfif #read_tax_info.data31# neq "Paid">2. status: #read_tax_info.data31#, amount due: #read_tax_info.data28#</cfif></font></li>
      </ol></td>
  </tr></cfoutput>
  <tr> 
    <td colspan="3"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr> 
    <td valign="middle" colspan="3"><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif">This 
      title review sheet must be filled out and included with every commitment 
      sent to Champion Mortgage. A commitment received without this cover sheet 
      will be considered incomplete.</font></strong></td>
  </tr>
</table>
</cfif>
<IE:DEVICERECT ID="page1" CLASS="masterstyle" MEDIA="print">

<!----1st page starts ----->
<!----------body table starts---------->
<!--- <table width=98% cellpadding=0 cellspacing=0 border=2 align="center" bordercolor="000000" bordercolordark="000000" bordercolorlight="000000">
<tr><td valign="top" align="center">	
====================================================================== --->
<!--- =================[ BEGIN SCHEDULE A         ]======================== --->
<!--- ====================================================================== --->
<table width="100%" cellpadding=0 cellspacing=0 border=0 >
        <tr>
		  <td colspan="2" align="center" valign="middle" bgcolor="000000" height="30"><B><font color="FFFFFF" size="4">Schedule 
            A</font></B></td>
	</tr>
</table>
<table width="93%" cellpadding=0 cellspacing=0 border=0 >
    <tr>
	    <td width="33%"><!--- ===/ This is the Title_ID from the Title Table \=== --->
		    <cfoutput><NOBR>Order Number: <B>#read_Title.Title_ID#</B></NOBR></td>
        <td align="Center"><NOBR>Stewart Title Guaranty Company</NOBR></td>    
	    <td align="right"><NOBR>Commitment Number: D-#read_Title.Title_ID# </NOBR></cfoutput></td>
	</tr>
</table>
<p>
      <table width="93%" cellpadding=1 cellspacing=1 border=0 valign="top" >
        <tr>      
          <td width="100%" align=left valign=top><font color="gray">
            <CFOUTPUT>Property known as:</font>  <font face="Verdana, Arial, Helvetica, sans-serif" size="2"><U>#read_title.paddress#, #read_title.pcity#, #read_title.pstate# #read_title.pzip#</U><BR><BR></font></cfoutput>
          </td>  
        
    </tr>
    </table>
    <table width="93%" cellpadding=1 cellspacing=1 border=0 valign="top" >
        <!-------- ( 1.) Starts --------------->
        <tr> 
          <td width="2%">&nbsp;</td>
          <td width="5%" align="left" valign="top">( 1.) </td>
          <td colspan="2" valign="top">Effective Date: 
            <CFQUERY datasource="#request.dsn#" NAME="read_title_update">
            select * from title_ins_view WHERE title_id = #url.rec_ID# and selectedOrgs 
            is not null </cfquery> 
			<CFIF #read_title_update.recordcount# GT 0 and #read_title_update.data1# neq "">
              <cfoutput> 
				#DateFormat(read_title_update.data37, "mm")#/#DateFormat(read_title_update.data37, "dd")#/#DateFormat(read_title_update.data37, "yyyy")#
				 </cfoutput> 
              <cfelse>
            </cfif> <br></td>
        </tr>
        <!-------- ( 1.) ends --------------->
        <tr>
          <td colspan="4">&nbsp;</td>
        </tr>
        <!-------- ( 2.) starts --------------->
        <CFOUTPUT> 
          <tr> 
            <td width="2%">&nbsp;</td>
            <td width="5%" align="left" valign="top">( 2.) </td>
            <td width="68%" valign="top">Policy or Policies to be issued:</td>
            <td width="25%" align="center">Amount of Insurance</td>
          </tr>
          <tr> 
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td valign="top"> <table width="100%" valign="top" cellpadding="0" cellspacing="0" border="0">
                <tr> 
                  <td align="right">(a)</td>
                  <td width="20">&nbsp;</td>
                  <td>ALTA Owner's Form B</td>
                </tr>
                <tr> 
                  <td>&nbsp;</td>
                  <td width="20">&nbsp;</td>
                  <td>Proposed Insured:</td>
                </tr>
                <tr> 
                  <td>&nbsp;</td>
                  <td width="20">&nbsp;</td>
                  <td><B><cfif #read_title.purchase# neq "">#Buyer_1#, &nbsp;&nbsp;#Buyer_2#</cfif></td>
                </tr>
              </table></td>
            <td align="center" valign="top">$<B> <cfif #read_title.purchase# neq "">#NumberFormat(read_title.Purchase, 
              "999,999,999.00")#</cfif></B></td>
          </tr>
          <tr>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr> 
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td valign="top"> <table width="100%" valign="top" cellpadding="0" cellspacing="0" border="0">
                <tr> 
                  <td align="right">(b)</td>
                  <td width="20">&nbsp;</td>
                  <td>ALTA Mortgagee's</td>
                </tr>
                <tr> 
                  <td>&nbsp;</td>
                  <td width="20">&nbsp;</td>
                  <td>Proposed Insured:</td>
                </tr>
                <tr> 
                  <td>&nbsp;</td>
                  <td width="20">&nbsp;</td>
                  <td><B>#read_title.insured#</B><br></td>
                </tr>
              </table></td>
            <td align="center" valign="top">$ <B>#NumberFormat(read_title.loanamt_float, 
              "999,999,999.00")#</B></td>
          </tr>
        </CFOUTPUT> 
        <!-------- ( 2.) ends --------------->
        <tr>
          <td colspan="4">&nbsp;</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td align="left" valign="top">( 3.) </td>
          <td colspan="2" valign="top">The estate or interest in the land described 
            or referred to in the committment and covered herein is:</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td align="right" valign="top">&nbsp;</td>
          <td colspan="2" valign="top"><CFQUERY datasource="#request.dsn#" NAME="read_title_data">
            select * from title_ins_view WHERE title_id = #url.rec_ID# and selectedOrgs 
            is not null </cfquery> <cfoutput>
			#read_title_data.data38# </td>
        </tr>
        <tr>
          <td colspan="4">&nbsp;</td>
        </tr>
        <CFQUERY datasource="#request.dsn#" NAME="read_title_data">
        select * from title_ins_view WHERE title_id = #url.rec_ID# and selectedOrgs 
        is not null 
        </cfquery>
        <tr> 
          <td>&nbsp;</td>
          <td align="left" valign="top">( 4.) </td>
          <td colspan="2" valign="top">Title to the estate or interest in the land is at effective date hereof vested 
            in:</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td align="right" valign="top">&nbsp;</td>
          <td colspan="2" valign="top">		
				#read_title_data.data3#<cfif #read_title_data.data4# neq "">&nbsp;AND&nbsp;#read_title_data.data4#</cfif><cfif #read_title_data.data6# neq "">,&nbsp;#read_title_data.DATA6#</b></font></cfif>
				</td>
        </tr>
        <tr>
          <td colspan="4">&nbsp;</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td align="left" valign="top">( 5.) </td>
          <td colspan="2" valign="top">The land referred to in this Committment 
            is described as follows:</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td align="right" valign="top">&nbsp;</td>
          <td colspan="2" align = "center"  valign="top"><b> See Exhibit "A"<br>Attached Hereto </cfoutput>
        <tr>
          <td colspan="4">&nbsp;</td>
        </tr>
		<tr>
          <td colspan="4">&nbsp;</td>
        </tr>
		<tr>
          <td colspan="4">&nbsp;</td>
        </tr>
		<tr>
          <td colspan="4">&nbsp;</td>
        </tr>
		<tr>
          <td colspan="4">&nbsp;</td>
        </tr>
		<tr>
          <td colspan="4">&nbsp;</td>
        </tr>
		<tr>
          <td colspan="4">&nbsp;</td>
        </tr>
		<tr>
          <td colspan="4">&nbsp;</td>
        </tr>
		<tr>
          <td colspan="4">&nbsp;</td>
        </tr>
		<tr>
          <td colspan="4">&nbsp;</td>
        </tr>
		<tr>
          <td colspan="4">&nbsp;</td>
        </tr>
		<tr>
          <td colspan="4">&nbsp;</td>
        </tr>
		<tr>
          <td colspan="4">&nbsp;</td>
        </tr>
		<tr>
          <td colspan="4">&nbsp;</td>
        </tr>
		<tr>
          <td colspan="4">&nbsp;</td>
        </tr>
		<tr>
          <td colspan="4">&nbsp;</td>
        </tr>
		
		<tr>
          <td colspan="4">&nbsp;</td>
        </tr>
		
       
        <tr> 
          <td colspan="4" valign="top"> <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <tr> 
                <td width="60%" valign="bottom">
				<table cellpadding=0 cellspacing=0 border=0><tr><td width="10%">&nbsp;</td>
                    <td align="center">
                    <!---Nevada and California should have Sig On File--->
				    <CFIF #read_Title.pstate# eq "CA">
                        <u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Signature on File&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</U>
                    <CFELSEIF #read_Title.pstate# eq "NV">
                        <u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Signature on File&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</U> 
                    <CFELSE>      
                        <img src="./images/sign4.gif">
                    </CFIF>
                </td>
				</tr><tr>
                  <td width="10%">&nbsp;</td><td align="center"> <strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Countersigned 
                  Authorized Signatory</font></strong>
				  </td></tr></table>
				  </td>
                <td width = "90%" align = "center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>Issued 
                  through the office of:</strong></font><br> <CFOUTPUT><B>#read_Title_FT_Agency_company.Company#</B><br>
                    #read_Title_FT_Agency_company.Addr1#<br>
                    <CFIF #read_Title_FT_Agency_company.Addr2# GT "" OR #read_Title_FT_Agency_company.Addr2# GT " ">
                      #read_Title_FT_Agency_company.Addr2#<br>
                    </CFIF>
                    <NOBR>#read_Title_FT_Agency_company.city#, #read_Title_FT_Agency_company.state#&nbsp;&nbsp;&nbsp;#read_Title_FT_Agency_company.zip_code#</NOBR><br>
                    Phone - #read_Title_FT_Agency_company.phone#<br>
                    <CFIF #read_Title_FT_Agency_company.fax# GT "" OR #read_Title_FT_Agency_company.fax# GT " ">
                      Fax - #read_Title_FT_Agency_company.fax#
                    </CFIF>
                  </CFOUTPUT></td>
              </tr>
              <tr> 
                <td valign="bottom" colspan="2" align="center">&nbsp;</td>
              </tr>
              <tr> 
                <td valign="bottom" colspan="2" align="center">&nbsp;</td>
              </tr>
              <tr> 
                <td valign="bottom" colspan="2" align="center">&nbsp;</td>
              </tr>
              <tr> 
                <td valign="middle" width="60%" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="black" size="1">This policy is invalid unless the Cover Sheet and Schedule B are attached.</font></td>
                <td align="center" valign="top"><img src="./images/logo-Stewart-title.gif"></td>
              </tr>	
            </table>
			
			  </td>
        </tr>
	
		
			
      </table>
<!--- ====================================================================== --->
<!--- =================[ END OF SCHEDULE A         ]======================== --->
<!--- ====================================================================== --->
</IE:DEVICERECT>
<IE:DEVICERECT ID="page2" CLASS="masterstyle" MEDIA="print">
<!--- ====================================================================== --->
<!--- =================[ BEGIN SCHEDULE B         ]======================== --->
<!--- ====================================================================== --->
<table width="100%" cellpadding=0 cellspacing=0 border=0 >
        <tr>
		  <td colspan="2" align="center" valign="middle" bgcolor="000000" height="30"><B><font color="FFFFFF" size="4">Schedule 
            B</font></B></td>
	</tr>
	</table>
<table width="93%" cellpadding=0 cellspacing=0 border=0 >
	<tr>
		<td width="33%"><!--- ===/ This is the Title_ID from the Title Table \=== --->
						<cfoutput><NOBR>Order Number: <B>#read_Title.Title_ID#</B></NOBR></td>
		<td align="Center"><NOBR>Stewart Title Guaranty Company</NOBR></td> 
    <td align="right"><NOBR>Commitment Number: D-#read_Title.Title_ID#</NOBR></cfoutput></td>
	</tr>
	<tr>
		  <td colspan="3" align="center"><B>Part I </B></td>
	</tr>
	<tr>
		  <td colspan="2" align="center">&nbsp;</td>
	</tr>
	<tr>
		<td colspan="2">Showing matters which will be excepted in the Policy unless the same are disposed of to the satisfaction of the Company:</td>
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
</table>
      <table width="93%" cellpadding=0 cellspacing=0 border=0 >
        <tr>
		  <td width="5%" valign="top">1.</td>
		<td>Defects, liens, encumbrances, adverse claims, or other matters, if any, created first appearing in the public records or attaching subsequent to the effective date hereof but prior to the date the proposed insured acquires for value of record the estate or interest or mortgage thereon covered by this Commitment.</td>
	</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
	<tr>
		  <td width="5%" valign="top">2.</td>
		<td>Taxes for the current year.</td>
	</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
	<tr>
		  <td width="5%" valign="top">3.</td>
		<td>Any discrepancies, conflicts, or shortages in area or boundary lines, or any encroachments or any overlapping of improvements or other boundary or location disputes (can be eliminated or amended in the mortgagee's policy upon proper evidence being furnished).</td>
	</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
	<tr>
		  <td width="5%" valign="top">4.</td>
		<td>Restrictive covenants affecting the property described in Schedule A.</td>
	</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
	<tr>
		  <td width="5%" valign="top">5.</td>
		<td>Rights or claims of parties in possession, and not of record in the public records; liens for labor, services or material or claims to same which are not of record in said records.</td>
	</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
	<tr>
		  <td width="5%" valign="top">6.</td>
		<td>Any roadway or easement, similar or dissimilar, on, under, over or accross said property, or any part hereof and not of record in said records.</td>
	</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
	<tr>
		  <td width="5%" valign="top">7.</td>
		<td>Any titles or rights asserted by anyone, including but not limited to persons, corporations, governments, or other entities, to tidelands, or lands comprising the shores or bottoms of navigable rivers, lakes bays, ocean or gulf, or lands beyond the line of the harbor or bulkhead lines as established or changed by the United States Government or riparian rights, if any.</td>
	</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
</table>
<table width="93%" cellpadding=0 cellspacing=0 border=0 >
<tr>
		  <td colspan="2" align="center"><B>Part II </B></td>
	</tr>
	<tr>
		  <td colspan="2" align="center">&nbsp;</td>
	</tr>
	<tr>
		<td colspan="2">The following matters will be excepted in Schedule B of the policy to be issued:</td>
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
</table>
      <table width="93%" cellpadding=0 cellspacing=0 border=0>
        <tr>
		  <td width="5%" valign="top">1.</td>
		  <td>State, County and Municipal real estate taxes subsequent to the original levy for the year ending <cfoutput>#read_tax_info.data36#</cfoutput>, not yet due and payable, plus possible supplemental taxes.</td>
		</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
        <tr>
		  <td width="5%" valign="top">2.</td>
		  <td>Terms, provisions, conditions, notes and restrictions as shown on plat of subdivision.</td>
		</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
        <tr>
		  <td width="5%" valign="top">3.</td>
		  <td>NOTE: The above exceptions omit any covenant, condition, or restriction based on race, color, religion, sex, handicap, familial status or national origin as provided in 42 U.S.C. Section 3604, unless and only to the extent that the covenant (a) is not in violation of state or federal law, (b) is exempt under 42 U.S.C. Section 3607, or (c) relates to a handicap, but does not discriminate against handicapped people.</td>
		</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
        <tr>
		  <td width="5%" valign="top">4.</td>
		  <td>No liability is assumed for matter occurring prior to record an owner became vested, entitled and which matters affect the title by virtue of, but not limited to, defects in title, liens, encumbrances, fees charges or assessments, taxes, general or special, ownership, rights of access marketability of or any defense as to matters or claims arising therefrom.</td>
		</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
        <tr>
		  <td width="5%" valign="top">&nbsp;</td>
		  <td></td>
		</tr>
	    <tr align="right" valign="top"> 
          <td colspan="2"><img src="./images/logo-Stewart-title.gif"></td>
	</tr>
	</table>
<!--- ====================================================================== --->
<!--- =================[ END OF SCHEDULE B         ]======================== --->
<!--- ====================================================================== --->	
	</IE:DEVICERECT>
	<cfif #read_title_data.addreq# neq "">
<IE:DEVICERECT ID="page6" CLASS="masterstyle" MEDIA="print">
<table cellpadding=1 cellspacing=1 border=0 width="100%">
  <tr>
    <td align="center" valign="middle" bgcolor="black" height="30"><font color="white" size="3" face="Arial, Helvetica, sans-serif"><b>COMMITMENT - Schedule B Cont'd</b></font></td>
	</tr></table>
	<table cellpadding=1 cellspacing=1 border=0 width="93%">
	<tr><td>&nbsp;</td></tr>
<!-----C1 starts----->
<CFOUTPUT>
	<tr>
		<td>
		<table width="100%" align="center">
        <tr align="center" valign="top"> 
          <td width="18%"> Order No. <br>
				<font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>#read_Title.Title_ID#</b></font>
				</td>
				
            
          <td width="64%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
<B>#read_company.Company#</B><br>
#read_company.Addr1#&nbsp;&nbsp;<CFIF #read_company.Addr2# GT "" OR #read_company.Addr2# GT " ">#read_company.Addr2#<br>
</CFIF>&nbsp;&nbsp;&nbsp;#read_company.city#, #read_company.state#&nbsp;&nbsp;&nbsp;#read_company.zip_code# &nbsp;&nbsp;<CFIF READ_COMPANY.phone GT "">
Phone - #read_company.phone#</CFIF><CFIF #read_company.fax# GT "" OR #read_company.fax# GT " ">
&nbsp;&nbsp;Fax - #read_company.fax#</CFIF></font>
				</td>
				
          <td width="19%">Order No.<br>
<font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>#read_Title.Title_ID#</b></font></td>
			</tr>
		</table>
</td></tr></CFOUTPUT>
	   <tr> 
          <td ALIGN = "CENTER"><p><B>ADDITIONAL REQUIREMENT</p></B><br><br></td>
        </tr>
        <tr> 
          <td align = "left"><p><B><cfoutput>
<cfif #read_title_data.addreq# neq "">#read_title_data.addreq#</cfif>
		</cfoutput>
		 </b><P></td>
        </tr>
        <tr> 
          <td colspan="2">&nbsp;</td>
        </tr>
     
      </table>				

</td></tr></table>
</IE:DEVICERECT>
</cfif>
<IE:DEVICERECT ID="page3" CLASS="masterstyle" MEDIA="print">
<!--- ====================================================================== --->
<!--- =================[ BEGIN SCHEDULE C         ]======================== --->
<!--- ====================================================================== --->	
<table width="100%" cellpadding=0 cellspacing=0 border=0 >
        <tr>
		  <td colspan="2" align="center" valign="middle" bgcolor="000000" height="30"><B><font color="FFFFFF" size="4">Schedule 
            C</font></B></td>
	</tr>
	</table>
<cfoutput>
     <table width="93%" cellpadding=0 cellspacing=0 border=0 >
        <tr> 
          <td width="33%">
            <!--- ===/ This is the Title_ID from the Title Table \=== --->
            <NOBR>Order Number: <B>#read_Title.Title_ID#</B></NOBR></td>
            <td align="Center"><NOBR>Stewart Title Guaranty Company</NOBR></td> 
          <td align="right"><NOBR>Commitment Number: D-#read_Title.Title_ID#</NOBR></td>
        </tr>

        <tr> 
          <td colspan="2" align="center">&nbsp;</td>
        </tr>
        <tr> 
          <td colspan="2">The following requirements must be met and completed to the satisfaction of the Company before its policy of title insurance will be issued:</td>
        </tr>
        <tr> 
          <td colspan="2">&nbsp;</td>
        </tr>
      </table>
  
      <table width="93%" cellpadding=0 cellspacing=0 border=0 >
        <tr> 
          <td width="5%" valign="top">1.</td>
          <td>Show that restrictions or restrictive covenants have not been violated.</td>
        </tr>
        <tr> 
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr> 
          <td width="5%" valign="top">2.</td>
          <td>Payment to or for the account of the grantors or mortgagors of the 
            full consideration for the estate or interest, mortgage or lien to 
            be issued.</td>
        </tr>
        <tr> 
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr> 
          <td width="5%" valign="top">3.</td>
          <td>Furnish proof of payment of all bills for labor and material furnished 
            or to be furnished in connection with improvements erected or to be 
            erected.</td>
        </tr>
        <tr> 
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr> 
          <td width="5%" valign="top">4.</td>
          <td>Pay all general and special taxes now due and payable including 
            the following:</td>
        </tr>
        <tr> 
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr> 
          <td width="5%" valign="top">5.</td>
          <td>Record instrument(c) conveying or encumbering the estate or interest 
            to be insured, briefly described:</td>
        </tr>
        <tr> 
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr> 
		 <td width="5%" valign="top">&nbsp;</td>
          <td>Property Security Instrument from 
            <cfif #Read_title.bfirstname1# neq "">
            #Read_title.bfirstname1#</cfif>
            <cfif #Read_title.blastname1# neq "">
            #Read_title.blastname1#
            </cfif><cfif #Read_title.bfirstname2# neq ""> and #Read_title.bfirstname2#</cfif><cfif #Read_title.blastname2# neq ""> #Read_title.blastname2#</cfif>
            , securing 
            <cfif #Read_title.insured# neq "">
            #Read_title.insured#
            </cfif>
            in the amount of $#Read_title.loanamt_float#</td>
        </tr></CFOUTPUT>
        <tr> 
          <td colspan="2">&nbsp;</td>
        </tr>

      </table>


      <table width="93%" cellpadding=0 cellspacing=0 border=0 >
      <cfset auto_number = 5>

	    <CFQUERY datasource="#request.dsn#" NAME="read_mortgage">
        select * from title_ins_view WHERE title_id = #url.rec_ID# and selectedOrgs4 
        = 1 
        </cfquery>
       
        <cfoutput query = "read_mortgage"> 	<cfset auto_number = #auto_number# + 1>
          <tr> 
            <td width="5%" valign="top">#auto_number#.</td>
            <td> 
              <cfif #read_mortgage.data1# NEQ "">
              Satisfaction and/or relase of Mortgage from #read_mortgage.data2# 
              <cfif #read_mortgage.data3# neq ""> and #read_mortgage.data3#</cfif> securing #read_mortgage.data1# in the original principal amount 
              of #read_mortgage.data4#, as dated #DateFormat(read_mortgage.data8, 
              "mm")#/#DateFormat(read_mortgage.data8, "dd")#/#DateFormat(read_mortgage.data8, 
              "yyyy")# and recorded on #DateFormat(read_mortgage.data9, 
              "mm")#/#DateFormat(read_mortgage.data9, "dd")#/#DateFormat(read_mortgage.data9, 
              "yyyy")# among the Land Records of #Read_title.pcounty# 
              County, <cfif #read_mortgage.data5# eq ""> in Book #read_mortgage.data6# at Page #read_mortgage.data7# <cfelse> in Document #read_mortgage.data5# </cfif>
              <cfif #read_mortgage.data13# neq "">  
              Assigned to #read_mortgage.data13# recorded on #DateFormat(read_mortgage.data17, 
              "mm")#/#DateFormat(read_mortgage.data17, "dd")#/#DateFormat(read_mortgage.data17, 
              "yyyy")#, <cfif #read_mortgage.data14# eq ""> in Book #read_mortgage.data15#, at Page #read_mortgage.data16# <cfelse> in Document #read_mortgage.data14# </cfif>
              </cfif>
              <cfif #read_mortgage.data18# neq "">
              Assigned to #read_mortgage.data18# recorded on #DateFormat(read_mortgage.data22, 
              "mm")#/#DateFormat(read_mortgage.data22, "dd")#/#DateFormat(read_mortgage.data22, 
              "yyyy")#, <cfif #read_mortgage.data19# eq "">in Book #read_mortgage.data20#, at Page #read_mortgage.data21# <cfelse> in Document #read_mortgage.data19# </cfif>
              </cfif>
              <cfif #read_mortgage.data23# neq "">
              Assigned to #read_mortgage.data23# recorded on #DateFormat(read_mortgage.data27, 
              "mm")#/#DateFormat(read_mortgage.data27, "dd")#/#DateFormat(read_mortgage.data27, 
              "yyyy")#, <cfif #read_mortgage.data24# eq "">in Book #read_mortgage.data25#, at Page #read_mortgage.data26# <cfelse> in Document #read_mortgage.data24# </cfif>
              </cfif>
              <cfif #read_mortgage.data28# neq "">
              Assigned to #read_mortgage.data28# recorded on #DateFormat(read_mortgage.data32, 
              "mm")#/#DateFormat(read_mortgage.data32, "dd")#/#DateFormat(read_mortgage.data32, 
              "yyyy")#, <cfif #read_mortgage.data29# eq ""> in Book #read_mortgage.data30#, at Page #read_mortgage.data31# <cfelse> in Document #read_mortgage.data29# </cfif>
              </cfif>
               <cfif #read_mortgage.data11# neq "">#read_mortgage.data11#</cfif> <cfif #read_mortgage.data12# neq "">#read_mortgage.data12#</cfif></cfif><br>&nbsp;
            </td>
          </tr>
        </cfoutput> 
	
         
	    <CFQUERY datasource="#request.dsn#" NAME="read_mortgage2">
        select * from title_ins_view WHERE title_id = #url.rec_ID# and selectedOrgs4 
        = 2 
        </cfquery>
        <cfoutput query = "read_mortgage2"> 
          <cfset auto_number = #auto_number# + 1>
          <tr> 
            <td width="5%" valign="top">#auto_number#.</td>
            <td> 
                         <cfif #read_mortgage2.data1# NEQ "">
              Satisfaction and/or relase of Mortgage from #read_mortgage2.data2# 
              <cfif #read_mortgage2.data3# neq ""> and #read_mortgage2.data3#</cfif> securing #read_mortgage2.data1# in the original principal amount 
              of #read_mortgage2.data4#, as dated #DateFormat(read_mortgage2.data8, 
              "mm")#/#DateFormat(read_mortgage2.data8, "dd")#/#DateFormat(read_mortgage2.data8, 
              "yyyy")# and recorded on #DateFormat(read_mortgage2.data9, 
              "mm")#/#DateFormat(read_mortgage2.data9, "dd")#/#DateFormat(read_mortgage2.data9, 
              "yyyy")# among the Land Records of #Read_title.pcounty# 
              County, <cfif #read_mortgage2.data5# eq ""> in Book #read_mortgage2.data6# at Page #read_mortgage2.data7# <cfelse> in Document #read_mortgage2.data5# </cfif>
              <cfif #read_mortgage2.data13# neq "">  
              Assigned to #read_mortgage2.data13# recorded on #DateFormat(read_mortgage2.data17, 
              "mm")#/#DateFormat(read_mortgage2.data17, "dd")#/#DateFormat(read_mortgage2.data17, 
              "yyyy")#, <cfif #read_mortgage2.data14# eq ""> in Book #read_mortgage2.data15#, at Page #read_mortgage2.data16# <cfelse> in Document #read_mortgage2.data14# </cfif>
              </cfif>
              <cfif #read_mortgage2.data18# neq "">
              Assigned to #read_mortgage2.data18# recorded on #DateFormat(read_mortgage2.data22, 
              "mm")#/#DateFormat(read_mortgage2.data22, "dd")#/#DateFormat(read_mortgage2.data22, 
              "yyyy")#, <cfif #read_mortgage2.data19# eq "">in Book #read_mortgage2.data20#, at Page #read_mortgage2.data21# <cfelse> in Document #read_mortgage2.data19# </cfif>
              </cfif>
              <cfif #read_mortgage2.data23# neq "">
              Assigned to #read_mortgage2.data23# recorded on #DateFormat(read_mortgage2.data27, 
              "mm")#/#DateFormat(read_mortgage2.data27, "dd")#/#DateFormat(read_mortgage2.data27, 
              "yyyy")#, <cfif #read_mortgage2.data24# eq "">in Book #read_mortgage2.data25#, at Page #read_mortgage2.data26# <cfelse> in Document #read_mortgage2.data24# </cfif>
              </cfif>
              <cfif #read_mortgage2.data28# neq "">
              Assigned to #read_mortgage2.data28# recorded on #DateFormat(read_mortgage2.data32, 
              "mm")#/#DateFormat(read_mortgage2.data32, "dd")#/#DateFormat(read_mortgage2.data32, 
              "yyyy")#, <cfif #read_mortgage2.data29# eq ""> in Book #read_mortgage2.data30#, at Page #read_mortgage2.data31# <cfelse> in Document #read_mortgage2.data29# </cfif>
              </cfif>
               <cfif #read_mortgage2.data11# neq "">#read_mortgage2.data11#</cfif> <cfif #read_mortgage2.data12# neq "">#read_mortgage2.data12#</cfif></cfif><br>&nbsp;
            </td>
          </tr>
        </cfoutput> 
        
	
        <CFQUERY datasource="#request.dsn#" NAME="read_mortgage3">
        select * from title_ins_view WHERE title_id = #url.rec_ID# and selectedOrgs4 
        = 3 
        </cfquery>
        <cfoutput query = "read_mortgage3"> 
          <cfset auto_number = #auto_number# + 1>
          <tr> 
            <td width="5%" valign="top">#auto_number#.</td>
            <td> 
                          <cfif #read_mortgage3.data1# NEQ "">
              Satisfaction and/or relase of Mortgage from #read_mortgage3.data2# 
              <cfif #read_mortgage3.data3# neq ""> and #read_mortgage3.data3#</cfif> securing #read_mortgage3.data1# in the original principal amount 
              of #read_mortgage3.data4#, as dated #DateFormat(read_mortgage3.data8, 
              "mm")#/#DateFormat(read_mortgage3.data8, "dd")#/#DateFormat(read_mortgage3.data8, 
              "yyyy")# and recorded on #DateFormat(read_mortgage3.data9, 
              "mm")#/#DateFormat(read_mortgage3.data9, "dd")#/#DateFormat(read_mortgage3.data9, 
              "yyyy")# among the Land Records of #Read_title.pcounty# 
              County, <cfif #read_mortgage3.data5# eq ""> in Book #read_mortgage3.data6# at Page #read_mortgage3.data7# <cfelse> in Document #read_mortgage3.data5# </cfif>
              <cfif #read_mortgage3.data13# neq "">  
              Assigned to #read_mortgage3.data13# recorded on #DateFormat(read_mortgage3.data17, 
              "mm")#/#DateFormat(read_mortgage3.data17, "dd")#/#DateFormat(read_mortgage3.data17, 
              "yyyy")#, <cfif #read_mortgage3.data14# eq ""> in Book #read_mortgage3.data15#, at Page #read_mortgage3.data16# <cfelse> in Document #read_mortgage3.data14# </cfif>
              </cfif>
              <cfif #read_mortgage3.data18# neq "">
              Assigned to #read_mortgage3.data18# recorded on #DateFormat(read_mortgage3.data22, 
              "mm")#/#DateFormat(read_mortgage3.data22, "dd")#/#DateFormat(read_mortgage3.data22, 
              "yyyy")#, <cfif #read_mortgage3.data19# eq "">in Book #read_mortgage3.data20#, at Page #read_mortgage3.data21# <cfelse> in Document #read_mortgage3.data19# </cfif>
              </cfif>
              <cfif #read_mortgage3.data23# neq "">
              Assigned to #read_mortgage3.data23# recorded on #DateFormat(read_mortgage3.data27, 
              "mm")#/#DateFormat(read_mortgage3.data27, "dd")#/#DateFormat(read_mortgage3.data27, 
              "yyyy")#, <cfif #read_mortgage3.data24# eq "">in Book #read_mortgage3.data25#, at Page #read_mortgage3.data26# <cfelse> in Document #read_mortgage3.data24# </cfif>
              </cfif>
              <cfif #read_mortgage3.data28# neq "">
              Assigned to #read_mortgage3.data28# recorded on #DateFormat(read_mortgage3.data32, 
              "mm")#/#DateFormat(read_mortgage3.data32, "dd")#/#DateFormat(read_mortgage3.data32, 
              "yyyy")#, <cfif #read_mortgage3.data29# eq ""> in Book #read_mortgage3.data30#, at Page #read_mortgage3.data31# <cfelse> in Document #read_mortgage3.data29# </cfif>
              </cfif>
               <cfif #read_mortgage3.data11# neq "">#read_mortgage3.data11#</cfif> <cfif #read_mortgage3.data12# neq "">#read_mortgage3.data12#</cfif></cfif><br>&nbsp;
            </td>
          </tr>
        </cfoutput> 
  

        <CFQUERY datasource="#request.dsn#" NAME="read_mortgage4">
        select * from title_ins_view WHERE title_id = #url.rec_ID# and selectedOrgs4 
        = 4 
        </cfquery>
        <cfoutput query = "read_mortgage4"> 
          <cfset auto_number = #auto_number# + 1>
          <tr> 
            <td width="5%" valign="top">#auto_number#.</td>
            <td> 
                          <cfif #read_mortgage4.data1# NEQ "">
              Satisfaction and/or relase of Mortgage from #read_mortgage4.data2# 
              <cfif #read_mortgage4.data3# neq ""> and #read_mortgage4.data3#</cfif> securing #read_mortgage4.data1# in the original principal amount 
              of #read_mortgage4.data4#, as dated #DateFormat(read_mortgage4.data8, 
              "mm")#/#DateFormat(read_mortgage4.data8, "dd")#/#DateFormat(read_mortgage4.data8, 
              "yyyy")# and recorded on #DateFormat(read_mortgage4.data9, 
              "mm")#/#DateFormat(read_mortgage4.data9, "dd")#/#DateFormat(read_mortgage4.data9, 
              "yyyy")# among the Land Records of #Read_title.pcounty# 
              County, <cfif #read_mortgage4.data5# eq ""> in Book #read_mortgage4.data6# at Page #read_mortgage4.data7# <cfelse> in Document #read_mortgage4.data5# </cfif>
              <cfif #read_mortgage4.data13# neq "">  
              Assigned to #read_mortgage4.data13# recorded on #DateFormat(read_mortgage4.data17, 
              "mm")#/#DateFormat(read_mortgage4.data17, "dd")#/#DateFormat(read_mortgage4.data17, 
              "yyyy")#, <cfif #read_mortgage4.data14# eq ""> in Book #read_mortgage4.data15#, at Page #read_mortgage4.data16# <cfelse> in Document #read_mortgage4.data14# </cfif>
              </cfif>
              <cfif #read_mortgage4.data18# neq "">
              Assigned to #read_mortgage4.data18# recorded on #DateFormat(read_mortgage4.data22, 
              "mm")#/#DateFormat(read_mortgage4.data22, "dd")#/#DateFormat(read_mortgage4.data22, 
              "yyyy")#, <cfif #read_mortgage4.data19# eq "">in Book #read_mortgage4.data20#, at Page #read_mortgage4.data21# <cfelse> in Document #read_mortgage4.data19# </cfif>
              </cfif>
              <cfif #read_mortgage4.data23# neq "">
              Assigned to #read_mortgage4.data23# recorded on #DateFormat(read_mortgage4.data27, 
              "mm")#/#DateFormat(read_mortgage4.data27, "dd")#/#DateFormat(read_mortgage4.data27, 
              "yyyy")#, <cfif #read_mortgage4.data24# eq "">in Book #read_mortgage4.data25#, at Page #read_mortgage4.data26# <cfelse> in Document #read_mortgage4.data24# </cfif>
              </cfif>
              <cfif #read_mortgage4.data28# neq "">
              Assigned to #read_mortgage4.data28# recorded on #DateFormat(read_mortgage4.data32, 
              "mm")#/#DateFormat(read_mortgage4.data32, "dd")#/#DateFormat(read_mortgage4.data32, 
              "yyyy")#, <cfif #read_mortgage4.data29# eq ""> in Book #read_mortgage4.data30#, at Page #read_mortgage4.data31# <cfelse> in Document #read_mortgage4.data29# </cfif>
              </cfif>
               <cfif #read_mortgage4.data11# neq "">#read_mortgage4.data11#</cfif> <cfif #read_mortgage4.data12# neq "">#read_mortgage4.data12#</cfif></cfif><br>&nbsp;
            </td>
          </tr>
        </cfoutput> 
       
	  
        <CFQUERY datasource="#request.dsn#" NAME="read_mortgage5">
        select * from title_ins_view WHERE title_id = #url.rec_ID# and selectedOrgs4 
        = 5 
        </cfquery>
        <cfoutput query = "read_mortgage5"> 
          <cfset auto_number = #auto_number# + 1>
          <tr> 
            <td width="5%" valign="top">#auto_number#.</td>
            <td> 
                           <cfif #read_mortgage5.data1# NEQ "">
              Satisfaction and/or relase of Mortgage from #read_mortgage5.data2# 
              <cfif #read_mortgage5.data3# neq ""> and #read_mortgage5.data3#</cfif> securing #read_mortgage5.data1# in the original principal amount 
              of #read_mortgage5.data4#, as dated #DateFormat(read_mortgage5.data8, 
              "mm")#/#DateFormat(read_mortgage5.data8, "dd")#/#DateFormat(read_mortgage5.data8, 
              "yyyy")# and recorded on #DateFormat(read_mortgage5.data9, 
              "mm")#/#DateFormat(read_mortgage5.data9, "dd")#/#DateFormat(read_mortgage5.data9, 
              "yyyy")# among the Land Records of #Read_title.pcounty# 
              County, <cfif #read_mortgage5.data5# eq ""> in Book #read_mortgage5.data6# at Page #read_mortgage5.data7# <cfelse> in Document #read_mortgage5.data5# </cfif>
              <cfif #read_mortgage5.data13# neq "">  
              Assigned to #read_mortgage5.data13# recorded on #DateFormat(read_mortgage5.data17, 
              "mm")#/#DateFormat(read_mortgage5.data17, "dd")#/#DateFormat(read_mortgage5.data17, 
              "yyyy")#, <cfif #read_mortgage5.data14# eq ""> in Book #read_mortgage5.data15#, at Page #read_mortgage5.data16# <cfelse> in Document #read_mortgage5.data14# </cfif>
              </cfif>
              <cfif #read_mortgage5.data18# neq "">
              Assigned to #read_mortgage5.data18# recorded on #DateFormat(read_mortgage5.data22, 
              "mm")#/#DateFormat(read_mortgage5.data22, "dd")#/#DateFormat(read_mortgage5.data22, 
              "yyyy")#, <cfif #read_mortgage5.data19# eq "">in Book #read_mortgage5.data20#, at Page #read_mortgage5.data21# <cfelse> in Document #read_mortgage5.data19# </cfif>
              </cfif>
              <cfif #read_mortgage5.data23# neq "">
              Assigned to #read_mortgage5.data23# recorded on #DateFormat(read_mortgage5.data27, 
              "mm")#/#DateFormat(read_mortgage5.data27, "dd")#/#DateFormat(read_mortgage5.data27, 
              "yyyy")#, <cfif #read_mortgage5.data24# eq "">in Book #read_mortgage5.data25#, at Page #read_mortgage5.data26# <cfelse> in Document #read_mortgage5.data24# </cfif>
              </cfif>
              <cfif #read_mortgage5.data28# neq "">
              Assigned to #read_mortgage5.data28# recorded on #DateFormat(read_mortgage5.data32, 
              "mm")#/#DateFormat(read_mortgage5.data32, "dd")#/#DateFormat(read_mortgage5.data32, 
              "yyyy")#, <cfif #read_mortgage5.data29# eq ""> in Book #read_mortgage5.data30#, at Page #read_mortgage5.data31# <cfelse> in Document #read_mortgage5.data29# </cfif>
              </cfif>
              </cfif><br>&nbsp;
            </td>
          </tr>
        </cfoutput> 
        
        <CFQUERY datasource="#request.dsn#" NAME="read_mortgage6">
        select * from title_ins_view WHERE title_id = #url.rec_ID# and selectedOrgs4 
        = 6 
        </cfquery>
        <cfoutput query = "read_mortgage6"> 
          <cfset auto_number = #auto_number# + 1>
          <tr> 
            <td width="5%" valign="top">#auto_number#.</td>
            <td> 
                           <cfif #read_mortgage6.data1# NEQ "">
              Satisfaction and/or relase of Mortgage from #read_mortgage6.data2# 
              <cfif #read_mortgage6.data3# neq ""> and #read_mortgage6.data3#</cfif> securing #read_mortgage6.data1# in the original principal amount 
              of #read_mortgage6.data4#, as dated #DateFormat(read_mortgage6.data8, 
              "mm")#/#DateFormat(read_mortgage6.data8, "dd")#/#DateFormat(read_mortgage6.data8, 
              "yyyy")# and recorded on #DateFormat(read_mortgage6.data9, 
              "mm")#/#DateFormat(read_mortgage6.data9, "dd")#/#DateFormat(read_mortgage6.data9, 
              "yyyy")# among the Land Records of #Read_title.pcounty# 
              County, <cfif #read_mortgage6.data5# eq ""> in Book #read_mortgage6.data6# at Page #read_mortgage6.data7# <cfelse> in Document #read_mortgage6.data5# </cfif>
              <cfif #read_mortgage6.data13# neq "">  
              Assigned to #read_mortgage6.data13# recorded on #DateFormat(read_mortgage6.data17, 
              "mm")#/#DateFormat(read_mortgage6.data17, "dd")#/#DateFormat(read_mortgage6.data17, 
              "yyyy")#, <cfif #read_mortgage6.data14# eq ""> in Book #read_mortgage6.data15#, at Page #read_mortgage6.data16# <cfelse> in Document #read_mortgage6.data14# </cfif>
              </cfif>
              <cfif #read_mortgage6.data18# neq "">
              Assigned to #read_mortgage6.data18# recorded on #DateFormat(read_mortgage6.data22, 
              "mm")#/#DateFormat(read_mortgage6.data22, "dd")#/#DateFormat(read_mortgage6.data22, 
              "yyyy")#, <cfif #read_mortgage6.data19# eq "">in Book #read_mortgage6.data20#, at Page #read_mortgage6.data21# <cfelse> in Document #read_mortgage6.data19# </cfif>
              </cfif>
              <cfif #read_mortgage6.data23# neq "">
              Assigned to #read_mortgage6.data23# recorded on #DateFormat(read_mortgage6.data27, 
              "mm")#/#DateFormat(read_mortgage6.data27, "dd")#/#DateFormat(read_mortgage6.data27, 
              "yyyy")#, <cfif #read_mortgage6.data24# eq "">in Book #read_mortgage6.data25#, at Page #read_mortgage6.data26# <cfelse> in Document #read_mortgage6.data24# </cfif>
              </cfif>
              <cfif #read_mortgage6.data28# neq "">
              Assigned to #read_mortgage6.data28# recorded on #DateFormat(read_mortgage6.data32, 
              "mm")#/#DateFormat(read_mortgage6.data32, "dd")#/#DateFormat(read_mortgage6.data32, 
              "yyyy")#, <cfif #read_mortgage6.data29# eq ""> in Book #read_mortgage6.data30#, at Page #read_mortgage6.data31# <cfelse> in Document #read_mortgage6.data29# </cfif>
              </cfif>
              </cfif><br>&nbsp;
            </td>
          </tr>
        </cfoutput> 
        
        <CFQUERY datasource="#request.dsn#" NAME="read_mortgage7">
        select * from title_ins_view WHERE title_id = #url.rec_ID# and selectedOrgs4 
        = 7 
        </cfquery>
        <cfoutput query = "read_mortgage7"> 
          <cfset auto_number = #auto_number# + 1>
          <tr> 
            <td width="5%" valign="top">#auto_number#.</td>
            <td> 
                          <cfif #read_mortgage7.data1# NEQ "">
              Satisfaction and/or relase of Mortgage from #read_mortgage7.data2# 
              <cfif #read_mortgage7.data3# neq ""> and #read_mortgage7.data3#</cfif> securing #read_mortgage7.data1# in the original principal amount 
              of #read_mortgage7.data4#, as dated #DateFormat(read_mortgage7.data8, 
              "mm")#/#DateFormat(read_mortgage7.data8, "dd")#/#DateFormat(read_mortgage7.data8, 
              "yyyy")# and recorded on #DateFormat(read_mortgage7.data9, 
              "mm")#/#DateFormat(read_mortgage7.data9, "dd")#/#DateFormat(read_mortgage7.data9, 
              "yyyy")# among the Land Records of #Read_title.pcounty# 
              County, <cfif #read_mortgage7.data5# eq ""> in Book #read_mortgage7.data6# at Page #read_mortgage7.data7# <cfelse> in Document #read_mortgage7.data5# </cfif>
              <cfif #read_mortgage7.data13# neq "">  
              Assigned to #read_mortgage7.data13# recorded on #DateFormat(read_mortgage7.data17, 
              "mm")#/#DateFormat(read_mortgage7.data17, "dd")#/#DateFormat(read_mortgage7.data17, 
              "yyyy")#, <cfif #read_mortgage7.data14# eq ""> in Book #read_mortgage7.data15#, at Page #read_mortgage7.data16# <cfelse> in Document #read_mortgage7.data14# </cfif>
              </cfif>
              <cfif #read_mortgage7.data18# neq "">
              Assigned to #read_mortgage7.data18# recorded on #DateFormat(read_mortgage7.data22, 
              "mm")#/#DateFormat(read_mortgage7.data22, "dd")#/#DateFormat(read_mortgage7.data22, 
              "yyyy")#, <cfif #read_mortgage7.data19# eq "">in Book #read_mortgage7.data20#, at Page #read_mortgage7.data21# <cfelse> in Document #read_mortgage7.data19# </cfif>
              </cfif>
              <cfif #read_mortgage7.data23# neq "">
              Assigned to #read_mortgage7.data23# recorded on #DateFormat(read_mortgage7.data27, 
              "mm")#/#DateFormat(read_mortgage7.data27, "dd")#/#DateFormat(read_mortgage7.data27, 
              "yyyy")#, <cfif #read_mortgage7.data24# eq "">in Book #read_mortgage7.data25#, at Page #read_mortgage7.data26# <cfelse> in Document #read_mortgage7.data24# </cfif>
              </cfif>
              <cfif #read_mortgage7.data28# neq "">
              Assigned to #read_mortgage7.data28# recorded on #DateFormat(read_mortgage7.data32, 
              "mm")#/#DateFormat(read_mortgage7.data32, "dd")#/#DateFormat(read_mortgage7.data32, 
              "yyyy")#, <cfif #read_mortgage7.data29# eq ""> in Book #read_mortgage7.data30#, at Page #read_mortgage7.data31# <cfelse> in Document #read_mortgage7.data29# </cfif>
              </cfif>
              </cfif><br>&nbsp;
            </td>
          </tr>
        </cfoutput> 
        
        <CFQUERY datasource="#request.dsn#" NAME="read_mortgage8">
        select * from title_ins_view WHERE title_id = #url.rec_ID# and selectedOrgs4 
        = 8 
        </cfquery>
        <cfoutput query = "read_mortgage8"> 
          <cfset auto_number = #auto_number# + 1>
          <tr> 
            <td width="5%" valign="top">#auto_number#.</td>
            <td> 
                          <cfif #read_mortgage8.data1# NEQ "">
              Satisfaction and/or relase of Mortgage from #read_mortgage8.data2# 
              <cfif #read_mortgage8.data3# neq ""> and #read_mortgage8.data3#</cfif> securing #read_mortgage8.data1# in the original principal amount 
              of #read_mortgage8.data4#, as dated #DateFormat(read_mortgage8.data8, 
              "mm")#/#DateFormat(read_mortgage8.data8, "dd")#/#DateFormat(read_mortgage8.data8, 
              "yyyy")# and recorded on #DateFormat(read_mortgage8.data9, 
              "mm")#/#DateFormat(read_mortgage8.data9, "dd")#/#DateFormat(read_mortgage8.data9, 
              "yyyy")# among the Land Records of #Read_title.pcounty# 
              County, <cfif #read_mortgage8.data5# eq ""> in Book #read_mortgage8.data6# at Page #read_mortgage8.data7# <cfelse> in Document #read_mortgage8.data5# </cfif>
              <cfif #read_mortgage8.data13# neq "">  
              Assigned to #read_mortgage8.data13# recorded on #DateFormat(read_mortgage8.data17, 
              "mm")#/#DateFormat(read_mortgage8.data17, "dd")#/#DateFormat(read_mortgage8.data17, 
              "yyyy")#, <cfif #read_mortgage8.data14# eq ""> in Book #read_mortgage8.data15#, at Page #read_mortgage8.data16# <cfelse> in Document #read_mortgage8.data14# </cfif>
              </cfif>
              <cfif #read_mortgage8.data18# neq "">
              Assigned to #read_mortgage8.data18# recorded on #DateFormat(read_mortgage8.data22, 
              "mm")#/#DateFormat(read_mortgage8.data22, "dd")#/#DateFormat(read_mortgage8.data22, 
              "yyyy")#, <cfif #read_mortgage8.data19# eq "">in Book #read_mortgage8.data20#, at Page #read_mortgage8.data21# <cfelse> in Document #read_mortgage8.data19# </cfif>
              </cfif>
              <cfif #read_mortgage8.data23# neq "">
              Assigned to #read_mortgage8.data23# recorded on #DateFormat(read_mortgage8.data27, 
              "mm")#/#DateFormat(read_mortgage8.data27, "dd")#/#DateFormat(read_mortgage8.data27, 
              "yyyy")#, <cfif #read_mortgage8.data24# eq "">in Book #read_mortgage8.data25#, at Page #read_mortgage8.data26# <cfelse> in Document #read_mortgage8.data24# </cfif>
              </cfif>
              <cfif #read_mortgage8.data28# neq "">
              Assigned to #read_mortgage8.data28# recorded on #DateFormat(read_mortgage8.data32, 
              "mm")#/#DateFormat(read_mortgage8.data32, "dd")#/#DateFormat(read_mortgage8.data32, 
              "yyyy")#, <cfif #read_mortgage8.data29# eq ""> in Book #read_mortgage8.data30#, at Page #read_mortgage8.data31# <cfelse> in Document #read_mortgage8.data29# </cfif>
              </cfif>
              </cfif><br>&nbsp;
            </td>
          </tr>
        </cfoutput> 
        
        <CFQUERY datasource="#request.dsn#" NAME="read_mortgage9">
        select * from title_ins_view WHERE title_id = #url.rec_ID# and selectedOrgs4 
        = 9 
        </cfquery>
        <cfoutput query = "read_mortgage9"> 
          <cfset auto_number = #auto_number# + 1>
          <tr> 
            <td width="5%" valign="top">#auto_number#.</td>
            <td> 
                          <cfif #read_mortgage9.data1# NEQ "">
              Satisfaction and/or relase of Mortgage from #read_mortgage9.data2# 
              <cfif #read_mortgage9.data3# neq ""> and #read_mortgage9.data3#</cfif> securing #read_mortgage9.data1# in the original principal amount 
              of #read_mortgage9.data4#, as dated #DateFormat(read_mortgage9.data8, 
              "mm")#/#DateFormat(read_mortgage9.data8, "dd")#/#DateFormat(read_mortgage9.data8, 
              "yyyy")# and recorded on #DateFormat(read_mortgage9.data9, 
              "mm")#/#DateFormat(read_mortgage9.data9, "dd")#/#DateFormat(read_mortgage9.data9, 
              "yyyy")# among the Land Records of #Read_title.pcounty# 
              County, <cfif #read_mortgage9.data5# eq ""> in Book #read_mortgage9.data6# at Page #read_mortgage9.data7# <cfelse> in Document #read_mortgage9.data5# </cfif>
              <cfif #read_mortgage9.data13# neq "">  
              Assigned to #read_mortgage9.data13# recorded on #DateFormat(read_mortgage9.data17, 
              "mm")#/#DateFormat(read_mortgage9.data17, "dd")#/#DateFormat(read_mortgage9.data17, 
              "yyyy")#, <cfif #read_mortgage9.data14# eq ""> in Book #read_mortgage9.data15#, at Page #read_mortgage9.data16# <cfelse> in Document #read_mortgage9.data14# </cfif>
              </cfif>
              <cfif #read_mortgage9.data18# neq "">
              Assigned to #read_mortgage9.data18# recorded on #DateFormat(read_mortgage9.data22, 
              "mm")#/#DateFormat(read_mortgage9.data22, "dd")#/#DateFormat(read_mortgage9.data22, 
              "yyyy")#, <cfif #read_mortgage9.data19# eq "">in Book #read_mortgage9.data20#, at Page #read_mortgage9.data21# <cfelse> in Document #read_mortgage9.data19# </cfif>
              </cfif>
              <cfif #read_mortgage9.data23# neq "">
              Assigned to #read_mortgage9.data23# recorded on #DateFormat(read_mortgage9.data27, 
              "mm")#/#DateFormat(read_mortgage9.data27, "dd")#/#DateFormat(read_mortgage9.data27, 
              "yyyy")#, <cfif #read_mortgage9.data24# eq "">in Book #read_mortgage9.data25#, at Page #read_mortgage9.data26# <cfelse> in Document #read_mortgage9.data24# </cfif>
              </cfif>
              <cfif #read_mortgage9.data28# neq "">
              Assigned to #read_mortgage9.data28# recorded on #DateFormat(read_mortgage9.data32, 
              "mm")#/#DateFormat(read_mortgage9.data32, "dd")#/#DateFormat(read_mortgage9.data32, 
              "yyyy")#, <cfif #read_mortgage9.data29# eq ""> in Book #read_mortgage9.data30#, at Page #read_mortgage9.data31# <cfelse> in Document #read_mortgage9.data29# </cfif>
              </cfif>
              </cfif><br>&nbsp;
            </td>
          </tr>
        </cfoutput> 
        
        <CFQUERY datasource="#request.dsn#" NAME="read_mortgage10">
        select * from title_ins_view WHERE title_id = #url.rec_ID# and selectedOrgs4 
        = 10 
        </cfquery>
        <cfoutput query = "read_mortgage10"> 
          <cfset auto_number = #auto_number# + 1>
          <tr> 
            <td width="5%" valign="top">#auto_number#.</td>
            <td> 
                            <cfif #read_mortgage10.data1# NEQ "">
              Satisfaction and/or relase of Mortgage from #read_mortgage10.data2# 
              <cfif #read_mortgage10.data3# neq ""> and #read_mortgage10.data3#</cfif> securing #read_mortgage10.data1# in the original principal amount 
              of #read_mortgage10.data4#, as dated #DateFormat(read_mortgage10.data8, 
              "mm")#/#DateFormat(read_mortgage10.data8, "dd")#/#DateFormat(read_mortgage10.data8, 
              "yyyy")# and recorded on #DateFormat(read_mortgage10.data9, 
              "mm")#/#DateFormat(read_mortgage10.data9, "dd")#/#DateFormat(read_mortgage10.data9, 
              "yyyy")# among the Land Records of #Read_title.pcounty# 
              County, <cfif #read_mortgage10.data5# eq ""> in Book #read_mortgage10.data6# at Page #read_mortgage10.data7# <cfelse> in Document #read_mortgage10.data5# </cfif>
              <cfif #read_mortgage10.data13# neq "">  
              Assigned to #read_mortgage10.data13# recorded on #DateFormat(read_mortgage10.data17, 
              "mm")#/#DateFormat(read_mortgage10.data17, "dd")#/#DateFormat(read_mortgage10.data17, 
              "yyyy")#, <cfif #read_mortgage10.data14# eq ""> in Book #read_mortgage10.data15#, at Page #read_mortgage10.data16# <cfelse> in Document #read_mortgage10.data14# </cfif>
              </cfif>
              <cfif #read_mortgage10.data18# neq "">
              Assigned to #read_mortgage10.data18# recorded on #DateFormat(read_mortgage10.data22, 
              "mm")#/#DateFormat(read_mortgage10.data22, "dd")#/#DateFormat(read_mortgage10.data22, 
              "yyyy")#, <cfif #read_mortgage10.data19# eq "">in Book #read_mortgage10.data20#, at Page #read_mortgage10.data21# <cfelse> in Document #read_mortgage10.data19# </cfif>
              </cfif>
              <cfif #read_mortgage10.data23# neq "">
              Assigned to #read_mortgage10.data23# recorded on #DateFormat(read_mortgage10.data27, 
              "mm")#/#DateFormat(read_mortgage10.data27, "dd")#/#DateFormat(read_mortgage10.data27, 
              "yyyy")#, <cfif #read_mortgage10.data24# eq "">in Book #read_mortgage10.data25#, at Page #read_mortgage10.data26# <cfelse> in Document #read_mortgage10.data24# </cfif>
              </cfif>
              <cfif #read_mortgage10.data28# neq "">
              Assigned to #read_mortgage10.data28# recorded on #DateFormat(read_mortgage10.data32, 
              "mm")#/#DateFormat(read_mortgage10.data32, "dd")#/#DateFormat(read_mortgage10.data32, 
              "yyyy")#, <cfif #read_mortgage10.data29# eq ""> in Book #read_mortgage10.data30#, at Page #read_mortgage10.data31# <cfelse> in Document #read_mortgage10.data29# </cfif>
              </cfif>
              </cfif><br>&nbsp;
            </td>
          </tr>
        </cfoutput> 
  
        <CFQUERY datasource="#request.dsn#" NAME="read_lien">
        select * from title_ins_view WHERE title_id = #url.rec_ID# and selectedOrgs3 
        = 1 
        </cfquery>
           <cfoutput query = "read_lien"> 
          <cfset auto_number = #auto_number# + 1>
          <tr> 
            <td width="5%" valign="top">#auto_number#.</td>
            <td> 
              <cfif #read_lien.data7# NEQ "">
             #read_lien.lienintro# Judgment against #read_lien.data7# 
              in favor of #read_lien.data6# in the amount of #read_lien.data5#, 
              dated #DateFormat(read_lien.data4, "mm")#/#DateFormat(read_lien.data4, 
              "dd")#/#DateFormat(read_lien.data4, "yyyy")# 
              and recorded #DateFormat(read_lien.data9, "mm")#/#DateFormat(read_lien.data9, 
              "dd")#/#DateFormat(read_lien.data9, "yyyy")#, <cfif #read_lien.data1# eq ""> in Book #read_lien.data2# at Page #read_lien.data3# <cfelse> in Document #read_lien.data1# </cfif> 
              #read_lien.data8# 
              </cfif><br>&nbsp;
            </td>
          </tr>
        </cfoutput> 
  
        <CFQUERY datasource="#request.dsn#" NAME="read_lien2">
        select * from title_ins_view WHERE title_id = #url.rec_ID# and selectedOrgs3 
        = 2 
        </cfquery>
        <cfoutput query = "read_lien2"> 
          <cfset auto_number = #auto_number# + 1>
          <tr> 
            <td width="5%" valign="top">#auto_number#.</td>
            <td> 
              <cfif #read_lien2.data7# NEQ "">
              #read_lien2.lienintro# Judgment against #read_lien2.data7# 
              in favor of #read_lien2.data6# in the amount of #read_lien2.data5#, 
              dated #DateFormat(read_lien2.data4, "mm")#/#DateFormat(read_lien2.data4, 
              "dd")#/#DateFormat(read_lien2.data4, "yyyy")# 
              and recorded #DateFormat(read_lien2.data9, "mm")#/#DateFormat(read_lien2.data9, 
              "dd")#/#DateFormat(read_lien2.data9, "yyyy")#, <cfif #read_lien2.data1# eq ""> in Book #read_lien2.data2# at Page #read_lien2.data3# <cfelse> in Document #read_lien2.data1# </cfif>  
              #read_lien2.data8# 
              </cfif><br>&nbsp;
            </td>
          </tr>
        </cfoutput> 
       		
		
        <CFQUERY datasource="#request.dsn#" NAME="read_lien3">
        select * from title_ins_view WHERE title_id = #url.rec_ID# and selectedOrgs3 
        = 3 
        </cfquery>
        <cfoutput query = "read_lien3"> 
          <cfset auto_number = #auto_number# + 1>
          <tr> 
            <td width="5%" valign="top">#auto_number#.</td>
            <td> 
              <cfif #read_lien3.data7# NEQ "">
              #read_lien3.lienintro# Judgment against #read_lien3.data7# 
              in favor of #read_lien3.data6# in the amount of #read_lien3.data5#, 
              dated #DateFormat(read_lien3.data4, "mm")#/#DateFormat(read_lien3.data4, 
              "dd")#/#DateFormat(read_lien3.data4, "yyyy")# 
              and recorded #DateFormat(read_lien3.data9, "mm")#/#DateFormat(read_lien3.data9, 
              "dd")#/#DateFormat(read_lien3.data9, "yyyy")#, <cfif #read_lien3.data1# eq ""> in Book #read_lien3.data2# at Page #read_lien3.data3# <cfelse> in Document #read_lien3.data1# </cfif>  
              #read_lien3.data8# 
              </cfif>
            </td>
          </tr>
        </cfoutput> 
        
        <CFQUERY datasource="#request.dsn#" NAME="read_lien4">
        select * from title_ins_view WHERE title_id = #url.rec_ID# and selectedOrgs3 
        = 4 
        </cfquery>
        <cfoutput query = "read_lien4"> 
          <cfset auto_number = #auto_number# + 1>
          <tr> 
            <td width="5%" valign="top">#auto_number#.</td>
            <td> 
              <cfif #read_lien4.data7# NEQ "">
              #read_lien4.lienintro# Judgment against #read_lien4.data7# 
              in favor of #read_lien4.data6# in the amount of #read_lien4.data5#, 
              dated #DateFormat(read_lien4.data4, "mm")#/#DateFormat(read_lien4.data4, 
              "dd")#/#DateFormat(read_lien4.data4, "yyyy")# 
               and recorded #DateFormat(read_lien4.data9, "mm")#/#DateFormat(read_lien4.data9, 
              "dd")#/#DateFormat(read_lien4.data9, "yyyy")#, <cfif #read_lien4.data1# eq ""> in Book #read_lien4.data2# at Page #read_lien4.data3# <cfelse> in Document #read_lien4.data1# </cfif>  
              #read_lien4.data8# 
              </cfif><br>&nbsp;
            </td>
          </tr>
        </cfoutput> 
        
        <CFQUERY datasource="#request.dsn#" NAME="read_lien5">
        select * from title_ins_view WHERE title_id = #url.rec_ID# and selectedOrgs3 
        = 5 
        </cfquery>
        <cfoutput query = "read_lien5"> 
          <cfset auto_number = #auto_number# + 1>
          <tr> 
            <td width="5%" valign="top">#auto_number#.</td>
            <td> 
              <cfif #read_lien5.data7# NEQ "">
              #read_lien5.lienintro# Judgment against #read_lien5.data7# 
              in favor of #read_lien5.data6# in the amount of #read_lien5.data5#, 
              dated #DateFormat(read_lien5.data4, "mm")#/#DateFormat(read_lien5.data4, 
              "dd")#/#DateFormat(read_lien5.data4, "yyyy")# 
               and recorded #DateFormat(read_lien5.data9, "mm")#/#DateFormat(read_lien5.data9, 
              "dd")#/#DateFormat(read_lien5.data9, "yyyy")#, <cfif #read_lien5.data1# eq ""> in Book #read_lien5.data2# at Page #read_lien5.data3# <cfelse> in Document #read_lien5.data1# </cfif>  
              #read_lien5.data8# 
              </cfif><br>&nbsp;
            </td>
          </tr>
        </cfoutput> 
        
        <CFQUERY datasource="#request.dsn#" NAME="read_lien6">
        select * from title_ins_view WHERE title_id = #url.rec_ID# and selectedOrgs3 
        = 6 
        </cfquery>
        <cfoutput query = "read_lien6"> 
          <cfset auto_number = #auto_number# + 1>
          <tr> 
            <td width="5%" valign="top">#auto_number#.</td>
            <td> 
              <cfif #read_lien6.data7# NEQ "">
              #read_lien6.lienintro# Judgment against #read_lien6.data7# 
              in favor of #read_lien6.data6# in the amount of #read_lien6.data5#, 
              dated #DateFormat(read_lien6.data4, "mm")#/#DateFormat(read_lien6.data4, 
              "dd")#/#DateFormat(read_lien6.data4, "yyyy")# 
               and recorded #DateFormat(read_lien6.data9, "mm")#/#DateFormat(read_lien6.data9, 
              "dd")#/#DateFormat(read_lien6.data9, "yyyy")#, <cfif #read_lien6.data1# eq ""> in Book #read_lien6.data2# at Page #read_lien6.data3# <cfelse> in Document #read_lien6.data1# </cfif>  
              #read_lien6.data8# 
              </cfif><br>&nbsp;
            </td>
          </tr>
        </cfoutput> 
        
        <CFQUERY datasource="#request.dsn#" NAME="read_lien7">
        select * from title_ins_view WHERE title_id = #url.rec_ID# and selectedOrgs3 
        = 7 
        </cfquery>
        <cfoutput query = "read_lien7"> 
          <cfset auto_number = #auto_number# + 1>
          <tr> 
            <td width="5%" valign="top">#auto_number#.</td>
            <td> 
              <cfif #read_lien7.data7# NEQ "">
             #read_lien7.lienintro# Judgment against #read_lien7.data7# 
              in favor of #read_lien7.data6# in the amount of #read_lien7.data5#, 
              dated #DateFormat(read_lien7.data4, "mm")#/#DateFormat(read_lien7.data4, 
              "dd")#/#DateFormat(read_lien7.data4, "yyyy")# 
               and recorded #DateFormat(read_lien7.data9, "mm")#/#DateFormat(read_lien7.data9, 
              "dd")#/#DateFormat(read_lien7.data9, "yyyy")#, <cfif #read_lien7.data1# eq ""> in Book #read_lien7.data2# at Page #read_lien7.data3# <cfelse> in Document #read_lien7.data1# </cfif>  
              #read_lien7.data8# 
              </cfif><br>&nbsp;
            </td>
          </tr>
        </cfoutput> 
        
        <CFQUERY datasource="#request.dsn#" NAME="read_lien8">
        select * from title_ins_view WHERE title_id = #url.rec_ID# and selectedOrgs3 
        = 8 
        </cfquery>
        <cfoutput query = "read_lien8"> 
          <cfset auto_number = #auto_number# + 1>
          <tr> 
            <td width="5%" valign="top">#auto_number#.</td>
            <td> 
              <cfif #read_lien8.data7# NEQ "">
              #read_lien8.lienintro# Judgment against #read_lien8.data7# 
              in favor of #read_lien8.data6# in the amount of #read_lien8.data5#, 
              dated #DateFormat(read_lien8.data4, "mm")#/#DateFormat(read_lien8.data4, 
              "dd")#/#DateFormat(read_lien8.data4, "yyyy")# 
              and recorded #DateFormat(read_lien8.data9, "mm")#/#DateFormat(read_lien8.data9, 
              "dd")#/#DateFormat(read_lien8.data9, "yyyy")#, <cfif #read_lien8.data1# eq ""> in Book #read_lien8.data2# at Page #read_lien8.data3# <cfelse> in Document #read_lien8.data1# </cfif>  
              #read_lien8.data8# 
              </cfif><br>&nbsp;
            </td>
          </tr>
        </cfoutput> 
        
        <CFQUERY datasource="#request.dsn#" NAME="read_lien9">
        select * from title_ins_view WHERE title_id = #url.rec_ID# and selectedOrgs3 
        = 9 
        </cfquery>
        <cfoutput query = "read_lien9"> 
          <cfset auto_number = #auto_number# + 1>
          <tr> 
            <td width="5%" valign="top">#auto_number#.</td>
            <td> 
              <cfif #read_lien9.data7# NEQ "">
              #read_lien9.lienintro# Judgment against #read_lien9.data7# 
              in favor of #read_lien9.data6# in the amount of #read_lien9.data5#, 
              dated #DateFormat(read_lien9.data4, "mm")#/#DateFormat(read_lien9.data4, 
              "dd")#/#DateFormat(read_lien9.data4, "yyyy")# 
               and recorded #DateFormat(read_lien9.data9, "mm")#/#DateFormat(read_lien9.data9, 
              "dd")#/#DateFormat(read_lien9.data9, "yyyy")#, <cfif #read_lien9.data1# eq ""> in Book #read_lien9.data2# at Page #read_lien9.data3# <cfelse> in Document #read_lien9.data1# </cfif>  
              #read_lien9.data8# 
              </cfif><br>&nbsp;
            </td>
          </tr>
        </cfoutput> 
        
        <CFQUERY datasource="#request.dsn#" NAME="read_lien10">
        select * from title_ins_view WHERE title_id = #url.rec_ID# and selectedOrgs3 
        = 10 
        </cfquery>
        <cfoutput query = "read_lien10"> 
          <cfset auto_number = #auto_number# + 1>
          <tr> 
            <td width="5%" valign="top">#auto_number#.</td>
            <td> 
              <cfif #read_lien10.data7# NEQ "">
              #read_lien10.lienintro# Judgment against #read_lien10.data7# 
              in favor of #read_lien10.data6# in the amount of #read_lien10.data5#, 
              dated #DateFormat(read_lien10.data4, "mm")#/#DateFormat(read_lien10.data4, 
              "dd")#/#DateFormat(read_lien10.data4, "yyyy")# 
               and recorded #DateFormat(read_lien10.data9, "mm")#/#DateFormat(read_lien10.data9, 
              "dd")#/#DateFormat(read_lien10.data9, "yyyy")#, <cfif #read_lien10.data1# eq ""> in Book #read_lien10.data2# at Page #read_lien10.data3# <cfelse> in Document #read_lien10.data1# </cfif>  
              #read_lien10.data8# 
              </cfif><br>&nbsp;
            </td>
          </tr>
        </cfoutput>  
<cfset auto_number = #auto_number# + 1>
        <tr> 
         <td width="5%" valign="top"><CFOUTPUT>#auto_number#.</CFOUTPUT></td>
		  <td >Evidence the Real Estate taxes have been or are to be 
            paid current</td>
        </tr>
        <tr> 
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr> 
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr> 
          <td colspan="2">&nbsp;</td>
        </tr>
       <!---  <tr align="right" valign="top"> 
          <td colspan="2"><img src="./images/logo-Stewart-title.gif"></td>
        </tr> --->
      </table>
	  </IE:DEVICERECT>
	  <cfif #read_title_data.addex# neq "">
<IE:DEVICERECT ID="page7" CLASS="masterstyle" MEDIA="print">
<table cellpadding=1 cellspacing=1 border=0 width="100%">
  <tr>
    <td align="center" valign="middle" bgcolor="black" height="30"><font color="white" size="3" face="Arial, Helvetica, sans-serif"><b>COMMITMENT - Schedule C Cont'd</b></font></td>
	</tr></table>
	<table cellpadding=1 cellspacing=1 border=0 width="93%">
	<tr><td>&nbsp;</td></tr>
<!-----C1 starts----->
<CFOUTPUT>
	<tr>
		<td>
		<table width="100%" align="center">
        <tr align="center" valign="top"> 
          <td width="18%"> Order No. <br>
				<font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>#read_Title.Title_ID#</b></font>
				</td>
				
            
          <td width="64%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
<B>#read_company.Company#</B><br>
#read_company.Addr1#&nbsp;&nbsp;<CFIF #read_company.Addr2# GT "" OR #read_company.Addr2# GT " ">#read_company.Addr2#<br>
</CFIF>&nbsp;&nbsp;&nbsp;#read_company.city#, #read_company.state#&nbsp;&nbsp;&nbsp;#read_company.zip_code# &nbsp;&nbsp;<CFIF READ_COMPANY.phone GT "">
Phone - #read_company.phone#</CFIF><CFIF #read_company.fax# GT "" OR #read_company.fax# GT " ">
&nbsp;&nbsp;Fax - #read_company.fax#</CFIF></font>
				</td>
				
          <td width="19%">Order No.<br>
<font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>#read_Title.Title_ID#</b></font></td>
			</tr>
		</table>
</td></tr></CFOUTPUT>
	   <tr> 
          <td ALIGN = "CENTER"><p><B>ADDITIONAL EXCEPTIONS</p></B><br><br></td>
        </tr>
        <tr> 
          <td align = "left"><p><B><cfoutput>
<cfif #read_title_data.addex# neq "">#read_title_data.addex#</cfif>
		</cfoutput>
		 </b><P></td>
        </tr>
        <tr> 
          <td colspan="2">&nbsp;</td>
        </tr>
     
      </table>				

</td></tr></table>
</IE:DEVICERECT>
</cfif>
<IE:DEVICERECT ID="page4" CLASS="masterstyle" MEDIA="print">
	  <table width="100%" cellpadding=0 cellspacing=0 border=0 >
        <tr>
		  <td colspan="2" align="center" valign="middle" bgcolor="000000" height="30"><B><font color="FFFFFF" size="4">Exhibit A
           </font></B></td>
	</tr>
	</table>
	   <table width="93%" cellpadding=0 cellspacing=0 border=0>
	         <tr> 
          <td width="33%">
             <cfoutput> 		
		
		<CFQUERY datasource="#request.dsn#" NAME="read_tax">
			SELECT *
			FROM tax_cert_title
			where title_id = #rec_id# 
		</CFQUERY>
            <NOBR>Order Number: <B>#read_Title.Title_ID#</B></NOBR></td>
            <td align="Center"><NOBR>Stewart Title Guaranty Company</NOBR></td> 
          <td align="right"><NOBR>Commitment Number: D-#read_Title.Title_ID#</NOBR></td>
        </tr>
	   <tr> 
          <td align = "center" COLSPAN = 3 ><p><b>LEGAL DESCRIPTION</b></p><br><br></td>
        </tr>
        <tr> 
          <td COLSPAN = 2 align = "left"><p>
		<b>
		
		<cfif #read_title_data.notes# neq "">#read_title_data.notes#</cfif>
		<cfif #read_title_data.data1# NEQ ""> Being the same property as transferred by #read_title_data.data5# on #DateFormat(read_title_data.data10, "mm")#/#DateFormat(read_title_data.data10, "dd")#/#DateFormat(read_title_data.data10, "yyyy")# and recorded #DateFormat(read_title_data.data11, "mm")#/#DateFormat(read_title_data.data11, "dd")#/#DateFormat(read_title_data.data11, "yyyy")# from #read_title_data.data1#
		<cfif #read_title_data.data2# NEQ ""> and #read_title_data.data2#</CFIF> to #read_title_data.data3# 
		<CFIF #read_title_data.data4# NEQ "">and #read_title_data.data4#</CFIF>, #read_title_data.data6#, recorded 
		<cfif #read_title_data.data7# eq "">
		<CFIF #read_title_data.data8# NEQ ""> in Book #read_title_data.data8#</cfif>
		<cfif #read_title_data.data9# neq ""> and Page #read_title_data.data9#</cfif>
		<cfelse> in Document Number #read_title_data.data7# </cfif>
		
		</cfif>
		<br><br>
			<p>
		<!--- <b><cfif #read_tax.data29# NEQ ""> Real Estate Taxes to #Read_tax.data35#, #Read_title.pcounty# County, #Read_title.pstate# for #read_tax.data29# were paid #DateFormat(read_tax.data39, "mm")#/#DateFormat(read_tax.data39, "dd")#/#DateFormat(read_tax.data39, "yyyy")# in the amount of #read_tax.data28#. <cfif #read_tax.data31# neq "">Tax Status: #read_tax.data31#</cfif> Actual due date is #read_tax.data30#. Taxes payable #read_tax.data37#. Taxes paid through #DateFormat(read_tax.data36, "mm")#/#DateFormat(read_tax.data36, "dd")#/#DateFormat(read_tax.data36, "yyyy")#. <cfif #read_tax.data32# neq ""> Delinquent Tax Amount #read_tax.data32# for year #read_tax.data33#</cfif>. <cfif #read_tax.data34# neq "">#read_tax.data34#</cfif> </b>
		<p><b>Tax Account Number: #read_tax.data19#</b></cfif> --->
		<b><cfif #read_tax.data29# NEQ ""> Real Estate Taxes for #Read_tax.data29# are #Read_tax.data31#. They are payable #Read_tax.data37#. The amount paid was $#Read_tax.data28#. #Read_tax.data34#. The due dates are #Read_tax.data30#. The parcel ID number is #Read_tax.data19#.</b></cfif>
			
		
		</cfoutput>
		  </p>
		 
		  </b>
		  </td>
        </tr>
        <tr> 
          <td colspan="2">&nbsp;</td>
        </tr>
     <!---    <tr align="right" valign="top"> 
          <td COLSPAN = 2><img src="./images/logo-Stewart-title.gif"></td>
        </tr> --->
      </table>
	   </IE:DEVICERECT>
<IE:DEVICERECT ID="page5" CLASS="masterstyle" MEDIA="print">
	    <table width="100%" cellpadding=0 cellspacing=0 border=0 >
            <tr>
		        <td colspan="2" align="center" valign="middle" bgcolor="000000" height="30">
                    <B><font color="FFFFFF" size="4">
                    Exhibit A
                    </font></B>
                </td>
	        </tr>
	    </table>
	    <table width="93%" cellpadding=0 cellspacing=0 border=0 >
	        <tr colspan = "3"> 
                <td width="33%">
<cfoutput>   
                    <!--- ===/ This is the Title_ID from the Title Table \=== --->
                    <NOBR>Order Number: <B>#read_Title.Title_ID#</B></NOBR>
                </td>
                <td align="Center">
                    <NOBR>Stewart Title Guaranty Company</NOBR>
                </td> 
                <td align="right">
                    <NOBR>Commitment Number: D-#read_Title.Title_ID#</NOBR>
</cfoutput>
                </td>
            </tr>
	        <tr> 
                <td COLSPAN = 3>
                    <p>&nbsp;</p>
                </td>
            </tr>
            <tr> 
                <td colspan = 3 align = "center">
                    <p>
		                <B><U>WIRING INFORMATION</U></B>
		                <br><br>
		                <!---CA and NV have completely different wiring instructions
                        than everyone else.  This info was given to me by Steve
                        Harry Travis 11 Kislev 5765
                        --->
                      
											
													 <cfif #read_title.comp_id# EQ "729">
		
		<cfif #read_title.pstate# NEQ "AZ">
		
		MERCANTILE BANK<br>
ABA # 052000618<br>
CREDIT TO <br>
MERCANTILE POTOMAC BANK<br>
ABA # 055001384<br>
FINAL CREDIT TO FIRST TITLE & ESCROW<br>
ACCOUNT # 6168752<br><br>
		
		</cfif>
		
		<cfelse>
											
											
													  <cfif #read_title.pstate# NEQ "CA">
		
		
		 FOR ALL PROPERTIES EXCEPT <br>
FLORIDA AND VIRGINIA<br><br>

MERCANTILE BANK<br>
Baltimore, MD<br><br>

ABA # 052000618<br>
ACCOUNT # 6168752<br><br>


FOR VIRGINIA PROPERTIES<br><br>

MERCANTILE BANK<br>
Baltimore, MD<br><br>

ABA # 052000618<br>
ACCOUNT # 6168779<br><br>

FOR FLORIDA PROPERTIES<br><br>

CITBANK<br>
Washington, DC<br><br>

ABA # 254070116<br>
ACCOUNT # 15158535<br><br>


		
		
			<CFELSE>
											
											
											  <!---<CFIF #read_title.pstate# eq "CA" or #read_title.pstate# eq "NV">--->
												<CFIF  #read_title.pstate# eq "NV">
                                  <br><br>
                                  <B>
                                  Bank One, N.A.<br>
                                  Dallas, TX<BR><BR>
                                  ABA # 111000614<br>
                                  ACCOUNT #  644076630 
                                  <br><br>
                                  For Credit to:  <BR>
                                  Electronic Closing Services, Inc.<BR>
                                  Fiduciary Account
                                  <br>
                                  Please include:  Borrower's Name and Loan Number<BR>
                                 </B>
																 <CFELSEIF #read_title.pstate# eq "CA">
												<b> FOR ALL PROPERTIES EXCEPT <br>
                                  FLORIDA AND VIRGINIA
                                  <br><br>
																	MERCANTILE BANK<br>
Baltimore, MD <br><br>

ABA # 052000618<br>
ACCOUNT # 6168752<br><br>
												
                        <CFELSE> 
		
												
                                  <b> FOR ALL PROPERTIES EXCEPT <br>
                                  FLORIDA AND VIRGINIA
                                  <br><br>
																	
																	<cfif #read_title.comp_id# eq "465">										
												 MERCANTILE BANK<br>
Baltimore, MD <br><br>

ABA # 052000618<br>
ACCOUNT # 6168833<br><br>


FOR VIRGINIA PROPERTIES<br><br>

MERCANTILE BANK<br>
Baltimore, MD<br><br>

ABA # 052000618<br>
ACCOUNT # 6168876<br><br>


FOR FLORIDA PROPERTIES<br><br>

CITBANK<br>
Washington, DC<br><br>

ABA # 254070116<br>
ACCOUNT # 15218198<br>
<cfelse>
																	
                                  CITIBANK<br>
                                  ABA # 254070116<br>
                                  ACCOUNT # <br>
                                  15218279
                                   <br><br>
                                  FOR VIRGINIA PROPERTIES
                                  <br><br>
                                  CITIBANK<br>
                                  ABA # 254070116<br>
                                  ACCOUNT #<br>
                                  15158551
                                  <br><br>
                                  FOR FLORIDA PROPERTIES
                                  <br><br>
                                  CITIBANK<br>
                                  ABA # 254070116<br>
                                  ACCOUNT #   <br>                               
                                    
                                      15158535<br>
                                  </cfif>
                                  
                        </CFIF>
                        </b>
                 
								 
								 </cfif> </cfif>
								 
								    </p>
		            <br><br><br> <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		        </td>
            </tr>
            <tr> 
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr align="right" valign="top"> 
                <td COLSPAN = 2>
                    <img src="./images/logo-Stewart-title.gif">
                </td>
        </tr>
    </table>
</IE:DEVICERECT>  
<!--- ====================================================================== --->
<!--- =================[ END OF SCHEDULE C         ]======================== --->
<!--- ====================================================================== --->	  
<!-----end body table
</td></tr></table><DIV ID="devicecontainer">
<!-- Pages created on the fly go here. -->
</DIV>--------->


</BODY>
</HTML>