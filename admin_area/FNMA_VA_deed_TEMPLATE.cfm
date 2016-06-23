<CFPARAM NAME="a_trigger" DEFAULT="0"> 
<CFPARAM NAME="url.rec_id" type="integer" DEFAULT="0">
<cfif url.rec_id eq 0> <cfset url.rec_id = "51750"> </cfif>

<CFQUERY datasource="#request.dsn#" NAME="get_titleid">
	SELECT pcounty,purchase,title_id,a_insert_date,paddress,pcity,pstate,pzip,bfirstname1,bminame1,blastname1,bfirstname2,bminame2,blastname2,bfirstname3,bminame3,blastname3,bfirstname4,bminame4,blastname4
	FROM title
	WHERE Title_ID = #rec_id#
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="mods">
	SELECT prop_tax_id,assessed_value,poa_info
	FROM closing_form_mods
	WHERE Title_ID = #rec_id#
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_state">
	SELECT st_name
	FROM First_title_states
	WHERE st_abbrev = '#get_titleid.pstate#'
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_report">
	SELECT data5,data6,notes
	FROM title_ins_add
	where title_id = #url.rec_id# and type = 'DATA' AND seq_num = 1
</CFQUERY>
<cfset full_state_name = get_state.st_name>

<cfoutput>

<HTML>
<HEAD>
<title>Create Legal Forms Data</title>
<style type="text/css">
.data { font-family:"Lucida Console";color:004000;font-size:12px;background:bfffbf;font-weight:lighter;}
.report { font-family:"Lucida Console";color:400000;font-size:12px;background:ff8080;font-weight:lighter;}
.mods { font-family:"Lucida Console";color:804000;font-size:12px;background:ffff80;font-weight:lighter;}
</style>
</head>
<BODY>

<!---<cfif #a_trigger# neq 2>
	<CFFORM NAME="frm" ACTION="./FNMA_VA_deed_email.cfm?rec_id=#rec_id#" METHOD="POST">
		Click submit to send this page to processor. You may also enter an additional email here - 
		<INPUT NAME="email" SIZE=20 MAXLENGTH=40>  
 		<input type=image border=0 src="./images/button_submit.gif">
	</cfform>
<cfelse>
	<font color = blue><b>Closing Form email was sent</b></font>
</cfif>--->

Legend <br><br>

<span class="data">GENERIC TITLE-WIDE DATA</span><br><br>
get_titleid.title_id = <span class="data">[#get_titleid.title_id#]</span> <br />
get_titleid.purchase = <span class="data">[#get_titleid.purchase#]</span> <br />
get_titleid.a_insert_date = <span class="data">[#get_titleid.a_insert_date#]</span> <br />
get_titleid.paddress = <span class="data">[#get_titleid.paddress#]</span>  <br />
get_titleid.pcity = <span class="data">[#get_titleid.pcity#]</span> <br />
get_titleid.pstate = <span class="data">[#get_titleid.pstate#]</span>  <br />
get_titleid.pzip = <span class="data">[#get_titleid.pzip#]</span> <br />
get_titleid.pcounty = <span class="data">[#get_titleid.pcounty#]</span> <br />
get_titleid.bfirstname,bminame,blastname1 = <span class="data"> [#get_titleid.bfirstname1#] [#get_titleid.bminame1#] [#get_titleid.blastname1#]</span> <br />
get_titleid.bfirstname,bminame,blastname2 = <span class="data"> [#get_titleid.bfirstname2#] [#get_titleid.bminame2#] [#get_titleid.blastname2#]</span> <br />
get_titleid.bfirstname,bminame,blastname3 = <span class="data"> [#get_titleid.bfirstname3#] [#get_titleid.bminame3#] [#get_titleid.blastname3#]</span> <br />
get_titleid.bfirstname,bminame,blastname4 = <span class="data"> [#get_titleid.bfirstname4#] [#get_titleid.bminame4#] [#get_titleid.blastname4#]</span> <br />
<br /> <br />
<span class="mods">FORM SPECIFIC MODIFICATIONS</span> <br />
mods.prop_tax_id = <span class="mods">[#mods.prop_tax_id#]</span> <br />
mods.assessed_value = <span class="mods">[#mods.assessed_value#]</span> <br />
mods.poa_info = <span class="mods">[#mods.poa_info#]</span> <br />
<br /> <br />
<span class="report">BINDER PREPARATION FORM</span> <br />
read_report.data5 = <span class="report">[#read_report.data5#] </span> <br />
read_report.data6 = <span class="report">[#read_report.data6#] </span> <br />
read_report.notes = <span class="report">[#read_report.notes#]</span> <br />

<hr>
<table width="98%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>
<table border="0" cellspacing="2" cellpadding="2">
<tr>
    <td>Considertaion: 
	<cfif get_titleid.recordcount and Len(get_titleid.purchase)>
		<cfset thisval=dollarformat(get_titleid.purchase)>
	<cfelse>
		<cfset thisval="">
	</cfif>	
	<span class="data"><!---get_titleid.purchase = --->[#thisval#] </span>
	
	</td>
  </tr>
  <tr>
    <td>G-PIN/MAP/TAX ACCOUNT: 	
	<cfif mods.recordcount and Len(mods.prop_tax_id)>
		<cfset thisval=mods.prop_tax_id>
	<cfelse>
		<cfset thisval="">
	</cfif>
	<span class="mods"><!--- mods.prop_tax_id= --->[#thisval#]</span>
	<!--- <INPUT NAME="prop_tax_id" SIZE=20 MAXLENGTH=20 value="#thisval#"> --->									
	</td>
</tr>
<tr>
	<td>File: T-<span class="data"><!---get_titleid.title_id = --->[#get_titleid.title_id#]</span></td></tr>
<tr>
    <td>Assessed Value: 
	<cfif mods.recordcount and Len(mods.assessed_value)>
		<cfset thisval=mods.assessed_value>
	<cfelse>
		<cfset thisval="">
	</cfif>
	<span class="mods"><!---mods.assessed_value= --->[#thisval#]</span>
	<!---<INPUT NAME="assessed_value" SIZE=20 MAXLENGTH=20 value="#mods.assessed_value#">--->
	</td>
</tr>
  <tr>
    <td>EXEMPT FROM TRANSFER TAXES PER 12 U.S. CODE SECTION 1452(e)</td></tr>
  <tr>
    <td>Title Insurer: Stewart Title</td></tr>
</table>



<br>
<center><B><u>SPECIAL WARRANTY DEED</u></B></center><br><br>


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<strong>THIS DEED, made this <span class="data"><!--- get_titleid.a_insert_date = --->__<u>
[#dateFormat(get_titleid.a_insert_date, "d")#] day 
of [#UCase(dateFormat(get_titleid.a_insert_date, "mmmm"))#], 
[#dateFormat(get_titleid.a_insert_date, "yyyy")#]
</u>__</span>, by 
and between FANNIE MAE, A/K/A FEDERAL NATIONAL MORTGAGE ASSOCIATION, 
a federal chartered corporation organized and existing under the laws 
of the United States of America, Grantor, Purchaser(s), Grantees, purchasing
 property known 
 as <span class="data"> 
<!---get_titleid.paddress = --->[#get_titleid.paddress#], 
<!---get_titleid.pcity = --->[#get_titleid.pcity#], 
<!---get_titleid.pstate = --->[#get_titleid.pstate#] 
<!---get_titleid.pzip = --->[#get_titleid.pzip#] </span>
 </strong><br>
<br>


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
WITNESSETH, that in consideration of the sum of 
__________________________________________ (<span class="data"><!--- get_titleid.purchase = --->[#DollarFormat(get_titleid.purchase)#]</span>) 
<br>
cash in hand paid and other good and valuable consideration, the receipt 
and sufficiency of which is herby acknowledged, the Grantor does grant and convey unto
<span class="data"><!--- get_titleid.* = --->
[[#get_titleid.bfirstname1#] 
<cfif Len(get_titleid.bminame1)>[#get_titleid.bminame1#.]</cfif>
[#get_titleid.blastname1#]]

<cfif Len(get_titleid.blastname2)>, [[#get_titleid.bfirstname2#]
	<cfif Len(get_titleid.bminame2)>[#get_titleid.bminame2#].</cfif>
	#get_titleid.blastname2#]]
</cfif>

<cfif Len(get_titleid.blastname3)>, [[#get_titleid.bfirstname3#] 
	<cfif Len(get_titleid.bminame3)>#get_titleid.bminame3#.]</cfif>
	#get_titleid.blastname3#]]
</cfif>

<cfif Len(get_titleid.blastname4)>, [[#get_titleid.bfirstname4#] 
	<cfif Len(get_titleid.bminame4)>#get_titleid.bminame4#.]</cfif>
	#get_titleid.blastname4#]]
</cfif>, 
</span>
the Grantee(s), his/her/their successors and assigns, in 
<span class="report"><!---read_report.data5 = --->[#read_report.data5#] </span>, Tenancy being taken by Purchaser(s) AS 
<span class="report"><!---read_report.data6 = --->[#UCase(read_report.data6)#] </span>, any and all right, title and 
interest it may possess in and to all of
that certain lot, piece or parcel of real property, together with all rights of way, easements,
improvements, buildings and appurtenances, thereunto belonging, lying and being in the 
COUNTY OF 
<span class="data">
<!---get_titleid.pcounty = --->[#Ucase(get_titleid.pcounty)#]
</span>, 
COMMONWEALTH OF <span class="data"><!---full_state_name = --->[#Ucase(full_state_name)#]</span>, 
described as follows to wit:<br>
<br>

		<strong><blockquote>Legal Description: 
		<span class="report"><!---read_report.notes = --->[#read_report.notes#]</span><BR><BR>

Also known as:  <span class="data"><!---get_titleid.* = --->[#get_titleid.paddress#], [#get_titleid.pcity#], [#get_titleid.pstate#] [#get_titleid.pzip#] </span><BR>

This conveyance is made expressly subject to all restrictions, conditions, rights-of-way and
 easements, if any, contained in the instruments constituting the chain of title to the property
  herein conveyed.</blockquote></strong>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
The Grantor covenants that it will warranty specially the property hereby conveyed;
 and that it will execute such further assurances of said land as may be requisite.<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;IN WITNESS WHEREOF, the Grantor,
 <strong>FEDERAL NATIONAL MORTGAGE ASSOCIATION</strong> 
 
 has on this <span class="data"><!---get_titleid.a_insert_date = --->__<u>[#dateFormat(get_titleid.a_insert_date, "d")#] 
 day of [#UCase(dateFormat(get_titleid.a_insert_date, "mmmm"))#], 
 [#dateFormat(get_titleid.a_insert_date, "yyyy")#]</u>__ </span>
 
 caused these presents to be signed by SHAPIRO & BURSON, LLP, its Attorney in Fact, 
 pursuant to that certain Power of Attorney recorded 
 
 <cfif mods.recordcount and Len(mods.poa_info)>
	<cfset thisval=mods.poa_info>
	<cfelse>
		<cfset thisval="">
	</cfif>
	<span class="mods"><!---mods.poa_info = --->[#thisval#]</span>
<!---<INPUT NAME="poa_info" SIZE=70 MAXLENGTH=70 value="#mods.poa_info#">--->
									
 among the Land Records of County: 
<span class="data"><!---get_titleid.pcounty = --->[#Ucase(get_titleid.pcounty)#],
 <!---get_titleid.pstate = --->[#Ucase(full_state_name)#]. </span>
 The undersigned Attorney in Fact has no actual knowledge or notice of the revocation 
 or termination of the aforementioned Power of Attorney.<br>
<br>

<center>
<strong>FEDERAL NATIONAL MORTGAGE ASSOCIATION</strong><BR>
BY: SHAPIRO & BURSON, LLP, ATTORNEY-IN-FACT
</center><br>
<br>
<table width="800" border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td width=400 align="right">BY:</td>
    <td>____________________________________________</td>
  </tr>
  <tr>
    <td width=400 align="right">Name:</td>
    <td>Steve E. Sacks</td>
  </tr>
  <tr>
    <td width=400 align="right">Title:</td>
    <td>Authorized Agent</td>
  </tr>
</table>
<br>
<br>


STATE OF <span class="data"><!---full_state_name = --->[#Ucase(full_state_name)#]</span><BR>
COUNTY OF <span class="data"><!---get_titleid.pcounty = --->[#UCase(get_titleid.pcounty)#]</span><br>
<br>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;I, Tina L. Taylor, a 
Notary Public in and for the jurisdiction aforesaid, do hereby certify 
that Steve E. Sacks, authorized agent on behalf of Shapiro & Burson, LLP, 
attorney-in-fact for FEDERAL NATIONAL MORTGAGE ASSOCIATION, who is personally 
well known to me as the person named in capacity to execute the foregoing and 
annexed deed, bearing date on the 

<span class="data"><!---get_titleid.a_insert_date = --->__<u>[#dateFormat(get_titleid.a_insert_date, "d")#] 
day of [#UCase(dateFormat(get_titleid.a_insert_date, "mmmm"))#], 
[#dateFormat(get_titleid.a_insert_date, "yyyy")#]</u>__</span>, 
personally appeared before me in the said jurisdiction and by 
virtue of the power vested in him/her acknowledged the same to be
 the act and deed of FEDERAL NATIONAL MORTGAGE ASSOCIATION.
<br>
<table width="800" border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td width=400 align="right">&nbsp;</td>
    <td>____________________________________________</td>
  </tr>
  <tr>
    <td width=400 align="right">&nbsp;</td>
    <td>Notary Public: Tina L. Taylor</td>
  </tr>
  <tr>
    <td width=400 align="right">&nbsp;</td>
    <td>My Commission Expires: 01-11-2010</td>
  </tr>
</table><br>
<br>

<strong>GRANTEE ADDRESS:  <span class="data">
<!---get_titleid.paddress = --->[#get_titleid.paddress#], [#get_titleid.pcity#], [#get_titleid.pstate#] [#get_titleid.pzip#]</span><br>
<br>


<cfif NOT DateDiff("d", Now(), "1/30/2012")>
Prepared by:<br>
Steven E. Sacks<br>
30 W. Gude Drive, Suite 450<br>
Rockville, Maryland 20850<br><br>


RETURN TO:<br>
Streamline Title & Escrow<br>
30 W. Gude Drive<br>
Suite 450<br>
Rockville, Maryland 20850<br>
<cfelse>
Prepared by:<br>
Steven E. Sacks<br>
7361 Calhoun Place, Suite 200<br>
Rockville, Maryland 20855<br><br>


RETURN TO:<br>
Streamline Title & Escrow<br>
7361 Calhoun Place<br>
Suite 200<br>
Rockville, Maryland 20855<br>
</cfif>
T-#get_titleid.title_id#<br></strong>

</td>
	</tr>
</table>

<hr>
<span class="data">GENERIC TITLE-WIDE DATA</span>
<pre>NAME="get_titleid" 	SELECT FROM title 	WHERE Title_ID = #rec_id#</pre>
get_titleid.datafeilds: #ListLen(get_titleid.columnlist)# <br>
<cfdump var="#get_titleid#" label="get_titleid" expand="false">
<CFQUERY datasource="#request.dsn#" NAME="get_fulltitleid">
	SELECT *
	FROM title
	WHERE Title_ID = #rec_id#
</CFQUERY>
<cfset ALL_TITLE=structNew()>
<cfloop list="#get_fulltitleid.columnlist#" index="fn">
	<cfif Evaluate('get_fulltitleid.' & fn) neq "">
		<cfset temp=StructInsert(ALL_TITLE,"get_fulltitleid.#fn#",Evaluate('get_fulltitleid.' & fn))>
	</cfif>
</cfloop>
get_fulltitleid.datafeilds: #ListLen(get_fulltitleid.columnlist)#
<cfdump var="#get_fulltitleid#" label="get_fulltitleid" expand="false">
ALL_TITLE.structcount: #structcount(ALL_TITLE)#
<cfdump var="#ALL_TITLE#" label="Non-NULL Title Fields" expand="false">
<hr>
<span class="mods">FORM SPECIFIC MODIFICATIONS</span>
<pre>NAME="mods" 	SELECT FROM closing_form_mods 	WHERE Title_ID = #rec_id#</pre>
These data are currently stored only as a result of saving the form.
<cfdump var="#mods#" label="mods" expand="false">
<hr>
<span class="report">BINDER PREPARATION FORM</span>
<pre>NAME="read_report"     SELECT FROM title_ins_add	where title_id = #url.rec_id# and type = 'DATA' AND seq_num = 1</pre>
Form: To get there, go into any order, after clicking the details button you're 
on the main page for that order. Now click the blue box next to the red "Abstract" button.
 On that page you'll see a link to "Binder Preparation Form", that link will take you to 
/admin_area/vendor_admin_data_form.cfm
<br><br>
<cfdump var="#read_report#" label="read_report" expand="false">
<hr>
Other Table Information For TITLE: #url.rec_id#
<CFQUERY datasource="#request.dsn#" NAME="read_seq_num1">
	SELECT *
	FROM title_ins_add
	where title_id = #url.rec_id# and type = 'DATA' AND seq_num = 1
</CFQUERY>
<cfdump var="#read_seq_num1#" label="read_seq_num1" expand="false">
<CFQUERY datasource="#request.dsn#" NAME="read_seq_num2">		
	SELECT *
	FROM title_ins_add
	Where title_Id = #URL.rec_id# and type = 'DATA' and seq_num = 2				
</CFQUERY>
<cfdump var="#read_seq_num2#" label="read_seq_num2" expand="false">
<CFQUERY datasource="#request.dsn#" NAME="read_DEED">		
	SELECT *
	FROM title_ins_add
	Where title_Id = #URL.rec_id# and type = 'DATA'				
</CFQUERY>
<cfdump var="#read_DEED#" label="read_DEED" expand="false">
<hr>
Titles with all the relevant data - add "?rec_id=12345" to the URL, where 12345 is a title ID (the table below has some of these)
<CFQUERY datasource="#request.dsn#" NAME="findgoodtitles">		
	SELECT DISTINCT a.title_Id
	FROM title_ins_add a, closing_form_mods c
	Where a.title_Id = c.Title_ID
	AND c.prop_tax_id is not null
	AND c.assessed_value is not null
	AND c.poa_info is not null			
</CFQUERY>
<cfdump var="#findgoodtitles#" label="findgoodtitles" expand="false">
<hr>

</body>
</html>
</cfoutput>