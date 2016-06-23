<cfset debug="false">
<CFPARAM NAME="url.deed_id" type="integer" DEFAULT="0">
<cfparam name="form.deed_id" type="integer" default="#url.deed_id#">
<CFPARAM NAME="url.rec_id" type="integer" DEFAULT="0">
<cfparam name="form.rec_id" type="integer" default="#url.rec_id#">

<CFQUERY datasource="#request.dsn#" NAME="get_deed_list">
	SELECT deed_id,deed_title,deed_state
	FROM deed
	ORDER BY deed_title
</cfquery>

<CFQUERY datasource="#request.dsn#" NAME="get_titleid">
	SELECT pcounty,purchase,title_id,a_insert_date,paddress,pcity,pstate,pzip,bfirstname1,bminame1,blastname1,bfirstname2,bminame2,blastname2,bfirstname3,bminame3,blastname3,bfirstname4,bminame4,blastname4
	FROM title
	WHERE Title_ID = #form.rec_id#
</CFQUERY>
<cfif not isDefined('get_titleid.recordcount') or get_titleid.recordcount LT 1>
	Selected Binder Not Found - add "<strong>?rec_id=51750</strong>"
	 to the URL and replace "<strong>51750</strong>" with your binder/title number.
	 <cfabort>	
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="mods">
	SELECT assessed_value,poa_info,title_insurer
	FROM closing_form_mods
	WHERE Title_ID = #form.rec_id#
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="get_state">
	SELECT st_name
	FROM First_title_states
	WHERE st_abbrev = '#get_titleid.pstate#'
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_report">
	SELECT data5,data6,notes
	FROM title_ins_add
	where title_id = #form.rec_id# and type = 'DATA' AND seq_num = 1
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_tax">
	SELECT acctnum
	FROM tax_cert_title
	WHERE title_id = #form.rec_id#
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="get_notary_list">
	SELECT deed_notary_id, NOTARY_NAME, NOTARY_EXPIRES
	FROM deed_notary
	ORDER BY NOTARY_NAME
</CFQUERY>


<cfset get_signature_list = "Steven E. Sacks|Patrick Daly|Heidi Kelly|No Signature|Julie Ann Evasco">



<cfscript>
	/* DATA MASSAGE */
	variables.errortext = "<em class='error'>No Data Found</em>";
	variables.grantee = '';
	variables.title_insurer = '';
	variables.full_state_name = get_state.st_name;
	variables.property_address = "#get_titleid.paddress#, #get_titleid.pcity#, #get_titleid.pstate# #get_titleid.pzip#";
	  	
	/* State text formatting */
  	if(UCase(variables.full_state_name) EQ "VIRGINIA")
		{ variables.full_state_name = "COMMONWEALTH OF #variables.full_state_name#"; }
	else
		{ variables.full_state_name = "STATE OF #variables.full_state_name#"; }
		
	/* Date formatting */	
  	if(isDate(get_titleid.a_insert_date))
	{
		// thisday = Day(get_titleid.a_insert_date) & datesuffix(Day(get_titleid.a_insert_date));
		thismonth = #UCase(MonthAsString(Month(get_titleid.a_insert_date)))#;
		thisyear = #Year(get_titleid.a_insert_date)#;
		variables.closing_date_long = "____ day of " & thismonth & " " & thisyear;
	}
	else
		{ variables.closing_date_long = get_titleid.a_insert_date; }	
	
	/* Grantee names formatting */
	for(i=1; i LT 5; i=i+1)
	{
		thisname_f = Evaluate('get_titleid.bfirstname#i#');
		thisname_m = Evaluate('get_titleid.bminame#i#');
		if(Len(Trim(thisname_m)) eq 1)
		{ thisname_m = "#thisname_m#."; }
		thisname_l = Evaluate('get_titleid.blastname#i#');	
		thisname = "#thisname_f# #thisname_m# #thisname_l#";
		thisname = Replace(thisname,",","");
		if(Len(Trim(thisname)))
		{
			if(i gt 1)
			{ grantee = ListAppend(grantee," #thisname#"); }
			else
			{ grantee = ListAppend(grantee,thisname); }
		}	
	}
	
	/* Grantee descriptions formatting */
	if(listLen(grantee) gt 1)
	{
		members = ListLen(grantee);
		grantee = ListInsertAt(grantee,members," #ListGetAt(grantee,members-1)# and #ListGetAt(grantee,members)#");
		grantee = ListDeleteAt(grantee,members+1);
		grantee = ListDeleteAt(grantee,members-1);
		grantee_text="Grantees";	
		party_text="parties";
	}
	else
	{ 
		grantee_text="Grantee"; 
		party_text="party";
	}
</cfscript>

<cfoutput>
<HTML>
<HEAD>
<title>Deed Creator</title>
<style type="text/css">
* {	margin: 0; padding: 0; }
body { font-family: "Trebuchet MS", Arial, Helvetica, sans-serif; font-size: 12px; color: black; }
input, textarea { padding: 2px 5px; border: 1px solid EBEBEB; font: bold 12px "Trebuchet MS", Arial, Helvetica, sans-serif; color: black; }
table { font-family: "Trebuchet MS", Arial, Helvetica, sans-serif; font-size: 12px; color: black; }
input.text { width:380px; }
input.text_empty { width:380px; }
input.text_non_savable { width:380px; }
.page_container { text-align:center; }
.content { width:800px;  background-color:white; margin: 0 auto; border:10px solid white; }
.rowhead { border-bottom:1px solid ##7979ff; border-right:1px solid ##4848ff; padding-right:10px; height:25px; text-align:right; background-color:aaaaff; color:black; font-weight:bold; }
.rowdata { background-color:d7d7ff; border-bottom:1px solid ##aaaaff; padding-left:10px; }
.error { color:red; }
</style>
</head>
<body>

<div class="page_container">
<div class="content">

<form action="deed_creator_action.cfm" method="post" name="dc_form" id="dc_form">

<input type="hidden" name="rec_id" value="#form.rec_id#">
<br />
<h1>Deed Creator 1.1</h1>
<br />
<input type="submit" name="submit" value="Create Deed">
<input type="submit" name="update" value="Save Modifiable Fields">
<input type="submit" name="dl_original" value="View Template">
<cfif isDefined('url.save')>
	<br /> <em style="color:004000;">Modifiable fields were saved.</em> 
</cfif>
<br /><br />

<table width="100%"  border="0" cellpadding="0" cellspacing="0" summary="Data Fields">

<tr>

<td class="rowhead">CHOOSE A DEED <em style="background-color: FF99FF; color: 990000;">[New Location]</em></td>
<td class="rowdata">
 <select name="deed_id">
<cfloop query="get_deed_list">
	<option value="#get_deed_list.deed_id#" <cfif form.deed_id EQ get_deed_list.deed_id>SELECTED</cfif>>#get_deed_list.deed_title#</option> 	
</cfloop>
</select>

</td>
</tr>

<tr>

<td class="rowhead">Consideration</td>
<td class="rowdata">

	<input class="text" type="text" name="purchase" value="#get_titleid.purchase#"> <em>Do not format (no $).</em>

</td>
</tr>
<!---<tr>
<td class="rowhead" nowrap><em>120% of Consideration</em></td>
<td class="rowdata">	
	<input class="text" type="text" name="purchase120" value="#variables.purchase120#">	
</td>
</tr><tr>
<td class="rowhead" nowrap><em>Consideration Verbose</em></td>
<td class="rowdata">	
	<input class="text" type="text" name="purchase_long" value="#variables.purchase_long#">
</td>
</tr>--->
<tr>
<td class="rowhead">Tax ID</td>
<td class="rowdata">	
	<input class="text" type="text" name="tax_id" value="#read_tax.acctnum#">
</td>
</tr><tr>
<td class="rowhead">File Number</td>
<td class="rowdata">	
T-#get_titleid.title_id#
	<input type="hidden" name="title_id" value="T-#get_titleid.title_id#">
</td>
</tr><tr>
<td class="rowhead">Assessed Value <em style="background-color:ffff80;color:CC6600;">[Modifiable]</em></td>
<td class="rowdata">
	
	<input type="text" class="text" name="assessed_value" value="#mods.assessed_value#">
</td>
</tr><tr>
<td class="rowhead">Title Insurer <em style="background-color:ffff80;color:CC6600;">[Modifiable]</em></td>
<td class="rowdata">	
	<input type="text" class="text" name="title_insurer" value="#mods.title_insurer#">
</td>
</tr><tr>
<td class="rowhead">Dates</td>
<td class="rowdata">
	<input type="text" class="text" name="closingdate_long" value="#closing_date_long#">
</td>
</tr><tr>

<td class="rowhead" valign="top">Grantee(s)</td>
<td class="rowdata">
	<cfif len(grantee)>
		#grantee# (#grantee_text#/#party_text#)
	<cfelse>
		#variables.errortext#
	</cfif>		
	<input type="hidden" name="grantee" value="#grantee#">
	<input type="hidden" name="grantee_text" value="#grantee_text#">
	<input type="hidden" name="party_text" value="#party_text#">
</td>
</tr><tr>
<td class="rowhead">Property Address</td>
<td class="rowdata">	
	<input class="text" type="text" name="property_address" value="#property_address#">
</td>
</tr>
<!---
This is hard coded1	
<tr>
<td class="rowhead">Tenancy In</td>
<td class="rowdata">
	
<cfif len(read_report.data5)>
		#read_report.data5#
	<cfelse>
		#variables.errortext#
	</cfif>	
	<input type="radio" name="tenancy_in" value="#read_report.data5#">
</td>
</tr>--->
<tr>
<td class="rowhead">Tenancy (Sole Owner, etc.)</td>
<td class="rowdata">
	<cfif len(read_report.data6)>
		<input type="text" class="text_non_savable" name="tenancy_as" value="#read_report.data6#">
	<cfelse>
		<input type="text" class="text_non_savable" name="tenancy_as" value="">
	</cfif>	
	
</td>
</tr><tr>
<td class="rowhead">Power of Attorney <em style="background-color:ffff80;color:CC6600;">[Modifiable]</em></td>
<td class="rowdata">
	<cfif len(mods.poa_info)> 
		<cfset thisclass = "text">	
	<cfelse>
		<cfset thisclass = "text_empty">
	</cfif>
	...recorded <input size="70" type="text" class="#thisclass#" name="poa_info" value="#mods.poa_info#"> among...
</td>
</tr><tr>
<td class="rowhead">Land Records City/County</td>
<td class="rowdata">
	<input type="radio" name="landrecs" value="COUNTY OF #UCase(get_titleid.pcounty)#" checked>COUNTY OF #UCase(get_titleid.pcounty)# <br />
	<input type="radio" name="landrecs" value="CITY OF #UCase(get_titleid.pcity)#">CITY OF #UCase(get_titleid.pcity)# <br />
	<input type="radio" name="landrecs" value="">
	<input type="text" class="text_non_savable" name="user_landrecs" />
</td>
</tr><tr>
<td class="rowhead">Land Records State</td>
<td class="rowdata">
	<cfif len(variables.full_state_name)>		
		<input type="text" class="text_non_savable" name="state_uc" value="#UCase(variables.full_state_name)#">
	<cfelse>
		<input type="text" class="text_non_savable" name="state_uc" value="">
	</cfif>	
</td>
</tr>

<tr>
<td class="rowhead" valign="top">Notary <em style="background-color: FF99FF; color: 990000;">[New]</em></td>
<td class="rowdata">	
  <select name="deed_notary_id">
  	<cfloop query="get_notary_list">  
	  	<option value="#get_notary_list.deed_notary_id#">#get_notary_list.NOTARY_NAME# (#DateFormat(get_notary_list.NOTARY_EXPIRES,'mm-dd-yyyy')#)</option>
	</cfloop>	
    </select>
</td>
</tr>

<tr>
<td class="rowhead" valign="top">Signature <em style="background-color:ffff80;color:CC6600;">[Modifiable]</em></td>
<td class="rowdata">	
  <select name="signature">
  	<cfloop index="j" list="#get_signature_list#" delimiters="|">
	<cfif j eq 'No Signature'>
	<option value="__________________">#j#</option>
	<cfelse>
	<option value="#j#">#j#</option>
	</cfif>  
	  	
	</cfloop>	
    </select>
</td>
</tr>

<tr>
<td class="rowhead" valign="top">Legal (and being...)<br /><br />
	<em>HTML line breaks "&lt;BR&gt;" will be preserved!</em></td>
<td class="rowdata">	
	<textarea name="andbeing" cols="80" rows="4">AND BEING the same property conveyed to the Grantors by Trustee's Deed dated __________ and recorded __________ in instrument ##______________ from ______________________________, substitute trustee, Grantor to ______________________________, Grantee.</textarea>	
</td>
</tr><tr>
<td class="rowhead" valign="top">Legal<br /><br />
	<em>HTML line breaks "&lt;BR&gt;" will be preserved!</em></td>
<td class="rowdata">	
		<textarea name="legal" cols="80" rows="20">#read_report.notes#</textarea>		
</td>
</tr>
</table>
</form>

</div>
</div>

</body>
</html>
</cfoutput>

<cfscript>
/* Returns a number converted into a string (i.e. 1 becomes "One"). */
function NumberAsString(number)
{
   VAR Result="";          // Generated result
   VAR Str1="";            // Temp string
   VAR Str2="";            // Temp string
   VAR n=number;           // Working copy
   VAR Billions=0;
   VAR Millions=0;
   VAR Thousands=0;
   VAR Hundreds=0;
   VAR Tens=0;
   VAR Ones=0;
   VAR Point=0;
   VAR HaveValue=0;        // Flag needed to know if to process "0"

   // Initialize strings
   // Strings are "externalized" to simplify
   // changing text or translating
   if (NOT IsDefined("REQUEST.Strs"))
   {
      REQUEST.Strs=StructNew();
      REQUEST.Strs.space=" ";
      REQUEST.Strs.and="and";
      REQUEST.Strs.point="Point";
      REQUEST.Strs.n0="Zero";
      REQUEST.Strs.n1="One";
      REQUEST.Strs.n2="Two";
      REQUEST.Strs.n3="Three";
      REQUEST.Strs.n4="Four";
      REQUEST.Strs.n5="Five";
      REQUEST.Strs.n6="Six";
      REQUEST.Strs.n7="Seven";
      REQUEST.Strs.n8="Eight";
      REQUEST.Strs.n9="Nine";
      REQUEST.Strs.n10="Ten";
      REQUEST.Strs.n11="Eleven";
      REQUEST.Strs.n12="Twelve";
      REQUEST.Strs.n13="Thirteen";
      REQUEST.Strs.n14="Fourteen";
      REQUEST.Strs.n15="Fifteen";
      REQUEST.Strs.n16="Sixteen";
      REQUEST.Strs.n17="Seventeen";
      REQUEST.Strs.n18="Eighteen";
      REQUEST.Strs.n19="Nineteen";
      REQUEST.Strs.n20="Twenty";
      REQUEST.Strs.n30="Thirty";
      REQUEST.Strs.n40="Forty";
      REQUEST.Strs.n50="Fifty";
      REQUEST.Strs.n60="Sixty";
      REQUEST.Strs.n70="Seventy";
      REQUEST.Strs.n80="Eighty";
      REQUEST.Strs.n90="Ninety";
      REQUEST.Strs.n100="Hundred";
      REQUEST.Strs.nK="Thousand";
      REQUEST.Strs.nM="Million";
      REQUEST.Strs.nB="Billion";
   }
   
   // Save strings to an array once to improve performance
   if (NOT IsDefined("REQUEST.StrsA"))
   {
      // Arrays start at 1, to 1 contains 0
      // 2 contains 1, and so on
      REQUEST.StrsA=ArrayNew(1);
      ArrayResize(REQUEST.StrsA, 91);
      REQUEST.StrsA[1]=REQUEST.Strs.n0;
      REQUEST.StrsA[2]=REQUEST.Strs.n1;
      REQUEST.StrsA[3]=REQUEST.Strs.n2;
      REQUEST.StrsA[4]=REQUEST.Strs.n3;
      REQUEST.StrsA[5]=REQUEST.Strs.n4;
      REQUEST.StrsA[6]=REQUEST.Strs.n5;
      REQUEST.StrsA[7]=REQUEST.Strs.n6;
      REQUEST.StrsA[8]=REQUEST.Strs.n7;
      REQUEST.StrsA[9]=REQUEST.Strs.n8;
      REQUEST.StrsA[10]=REQUEST.Strs.n9;
      REQUEST.StrsA[11]=REQUEST.Strs.n10;
      REQUEST.StrsA[12]=REQUEST.Strs.n11;
      REQUEST.StrsA[13]=REQUEST.Strs.n12;
      REQUEST.StrsA[14]=REQUEST.Strs.n13;
      REQUEST.StrsA[15]=REQUEST.Strs.n14;
      REQUEST.StrsA[16]=REQUEST.Strs.n15;
      REQUEST.StrsA[17]=REQUEST.Strs.n16;
      REQUEST.StrsA[18]=REQUEST.Strs.n17;
      REQUEST.StrsA[19]=REQUEST.Strs.n18;
      REQUEST.StrsA[20]=REQUEST.Strs.n19;
      REQUEST.StrsA[21]=REQUEST.Strs.n20;
      REQUEST.StrsA[31]=REQUEST.Strs.n30;
      REQUEST.StrsA[41]=REQUEST.Strs.n40;
      REQUEST.StrsA[51]=REQUEST.Strs.n50;
      REQUEST.StrsA[61]=REQUEST.Strs.n60;
      REQUEST.StrsA[71]=REQUEST.Strs.n70;
      REQUEST.StrsA[81]=REQUEST.Strs.n80;
      REQUEST.StrsA[91]=REQUEST.Strs.n90;
   }

   //zero shortcut
   if(number is 0) return "Zero";

   // How many billions?
   // Note: This is US billion (10^9) and not
   // UK billion (10^12), the latter is greater
   // than the maximum value of a CF integer and
   // cannot be supported.
   Billions=n\1000000000;
   if (Billions)
   {
      n=n-(1000000000*Billions);
      Str1=NumberAsString(Billions)&REQUEST.Strs.space&REQUEST.Strs.nB;
      if (Len(Result))
         Result=Result&REQUEST.Strs.space;
      Result=Result&Str1;
      Str1="";
      HaveValue=1;
   }

   // How many millions?
   Millions=n\1000000;
   if (Millions)
   {
      n=n-(1000000*Millions);
      Str1=NumberAsString(Millions)&REQUEST.Strs.space&REQUEST.Strs.nM;
      if (Len(Result))
         Result=Result&REQUEST.Strs.space;
      Result=Result&Str1;
      Str1="";
      HaveValue=1;
   }

   // How many thousands?
   Thousands=n\1000;
   if (Thousands)
   {
      n=n-(1000*Thousands);
      Str1=NumberAsString(Thousands)&REQUEST.Strs.space&REQUEST.Strs.nK;
      if (Len(Result))
         Result=Result&REQUEST.Strs.space;
      Result=Result&Str1;
      Str1="";
      HaveValue=1;
   }

   // How many hundreds?
   Hundreds=n\100;
   if (Hundreds)
   {
      n=n-(100*Hundreds);
      Str1=NumberAsString(Hundreds)&REQUEST.Strs.space&REQUEST.Strs.n100;
      if (Len(Result))
         Result=Result&REQUEST.Strs.space;
      Result=Result&Str1;
      Str1="";
      HaveValue=1;
   }   

   // How many tens?
   Tens=n\10;
   if (Tens)
      n=n-(10*Tens);
    
   // How many ones?
   Ones=n\1;
   if (Ones)
      n=n-(Ones);
   
   // Anything after the decimal point?
   if (Find(".", number))
      Point=Val(ListLast(number, "."));
   
   // If 1-9
   Str1="";
   if (Tens IS 0)
   {
      if (Ones IS 0)
      {
         if (NOT HaveValue)
            Str1=REQUEST.StrsA[0];
      }
      else
         // 1 is in 2, 2 is in 3, etc
         Str1=REQUEST.StrsA[Ones+1];
   }
   else if (Tens IS 1)
   // If 10-19
   {
      // 10 is in 11, 11 is in 12, etc
      Str1=REQUEST.StrsA[Ones+11];
   }
   else
   {
      // 20 is in 21, 30 is in 31, etc
      Str1=REQUEST.StrsA[(Tens*10)+1];
      
      // Get "ones" portion
      if (Ones)
         Str2=NumberAsString(Ones);
      Str1=Str1&REQUEST.Strs.space&Str2;
   }
   
   // Build result   
   if (Len(Str1))
   {
      if (Len(Result))
         Result=Result&REQUEST.Strs.space&REQUEST.Strs.space;
      Result=Result&Str1;
   }

   // Is there a decimal point to get?
   if (Point)
   {
      Str2=NumberAsString(Point);
      Result=Result&REQUEST.Strs.space&REQUEST.Strs.point&REQUEST.Strs.space&Str2;
   }
    
   return Result;
}
</cfscript>

<!---
<cffunction name="datesuffix">
  <cfargument name="date" type="Numeric">
  <cfswitch expression="#date#">
		<cfcase value="1"><cfreturn "st"></cfcase>
		<cfcase value="2"><cfreturn "nd"></cfcase>
		<cfcase value="3"><cfreturn "rd"></cfcase>
		<cfcase value="21"><cfreturn "st"></cfcase>
		<cfcase value="22"><cfreturn "nd"></cfcase>
		<cfcase value="23"><cfreturn "rd"></cfcase>		
		<cfcase value="31"><cfreturn "st"></cfcase>
		<cfdefaultcase><cfreturn "th"></cfdefaultcase>
  </cfswitch>
</cffunction>
--->