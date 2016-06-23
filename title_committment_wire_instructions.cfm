<cfset date_to_check = "5/1/2013">
<CFQUERY datasource="#request.dsn#" NAME="check_if_richmond_office">
SELECT *
FROM First_admin where id = #read_FT_company.intSales#
</cfquery>			
	

	
<!--- ACCOUNT #: 013-638020
ROUTING OR ABA #: 122016066
BANK: City National Bank
One Centerpointe Dr., Ste. 160
La Palma, CA 90623
Escrow Number:
Borrower Name:
Escrow Officer?s Name: --->

<cfif read_ins_committments.insurance_co eq 30 and read_title.pstate eq 'CA'>
Comerica Bank Escrow Account<br>
2321 Rosecrans Ave., Ste 5000<br>
El Segundo, CA 90245<br>
ABA or Federal routing No.: 121137522<br>
Credit Account No.: 18941832175<br>
Creditr the Account of:<br>
North American Title Company, Inc.<br>
Order no.: <cfoutput>#read_title.title_id#</cfoutput><br>
County and Branch No.: 54803<br>

<cfelseif read_title.pstate eq 'AZ'>
Account #: 555142927<br>
ABA #: 122016066<br>
Bank: City National Bank<br>
One Centerpointe Drive, Suite 160<br>
La Palma, CA 90623<br>
National closing solutions <br>


<cfelseif read_title.pstate eq 'CO'>
Cardinal Bank
8270 Greensboro Dr.
McLean, VA 22102<br />
<br />
For credit to:
First Title & Escrow, Inc. Trust Account<br />
<br />

ACCOUNT #: 5060107462<BR>
ROUTING OR ABA #: 056008849<BR>
REF: CUSTOMER?S NAME OR ADDRESS<br>
<br>


<cfelseif read_title.pstate eq 'GA'>

<u><strong>Georgia IOLTA</strong></u><BR>
McDonnell and Associates,<BR>
PA, GA IOLTA<BR>
Citibank<br />
Boston, MA<BR />
Account #: 9250400594<BR>
ABA#: 254070116<BR>
***We do not accept ACH transactions***<BR>
<BR>

<cfelseif read_title.pstate eq 'TX'>
BANK OF AMERICA<br>
3260 Preston Rd <br>
Plano, TX 75093<br><br>


CREDIT TO:<br>
First Title & Escrow, Inc. dba Title & Escrow of Texas, Inc.<br>
2805 N. Dallas Pkwy, Ste. 220<br>
Plano, TX 75093<br><br>

ABA #: 026009593<br>
Account Number:  488046510383<br><br>


<cfelseif (read_FT_company.ID eq 7393 or read_FT_company.ID eq 7402) and (read_title.pstate eq 'MI' or read_title.pstate eq 'IN')>
JP MORGAN CHASE BANK NA<br>
3245 Elizabeth Lake Road<br>
Waterford, MI 48328<br>
CREDIT TO:<br>
<br>	
FIRST TITLE & ESCROW<br>
MICHIGAN TRUST ACCOUNT<br>
ABA  # 072000326 <br>
Account # 402085216<br>
Re: customers name, address or account #<br>


<cfelseif read_FT_company.ID eq 3722 or read_FT_company.ID eq 4752>
Sandy Spring Bank<br>
17801 Georgia Avenue<br>
Olney, MD 20832<br>
<br>
Credit to:<br>
First Title & Escrow Trust Account<br>
ABA          #055001096<br>
Account      #1494583001<br>


<cfelseif read_FT_company.ID eq 4702>
Eagle Bank<br>
12505 Park Potomac Ave<br>
Potomac, MD 20854<br><br>

For credit to<br>
FIRST TITLE & ESCROW INC<br>
TRUST ACCOUNT<br>
7361 Calhoun Place, Suite 200<br>
ROCKVILLE MD 20855<br>
ABA # 055003298<br>
ACCT # 0200100063<br>
REF: CUSTOMER'S  & NAME/ADDRESS<br><br>

<cfelseif read_FT_company.ID eq 4398>
CREDIT TO:<BR>
FIRST TITLE AND ESCROW INC<br>
TRUST ACCOUNT <br>
CARDINAL BANK<br>
8270 GREENSBORO DR<br>
MCLEAN, VA 22102<br>
ABA/Trnsit # 056008849<br>
ACCOUNT # 5060107462<br><br>

REF: CUSTOMER?S NAME OR ADDRESS<BR><BR>



<cfelseif read_FT_company.ID eq 3943 or read_FT_company.id eq 4043 or read_FT_company.id eq 4042>
Funds should be wired to:<br>
<br>
SANDY SPRING BANK<br>
17801 GEORGIA AVE<br>
OLNEY MD 20832<br>
<br>
CREDIT TO:<br>
FIRST TITLE & ESCROW<br>
VILLAGES- TRUST ACCOUNT<br>
ABA 		# 055001096<br>
ACCOUNT 	#1538923101<br>
<br>
<cfelseif read_FT_company.ID eq 2632 or read_FT_company.master_co_id eq 2632>
Funds should be wired to:<br>
<br>
Sandy Spring Bank<br>
17801 Georgia Avenue<br>
Olney, MD 20832<br>
<br>
CREDIT TO:
AMERICAN TITLE, LLC<br>
T/A AXIOM TITLE AND ESCROW, LLC<br>
ABA# 055001096<br>
Client's Acct. Number<br>
<cfif read_title.pstate eq 'VA'>
1497738101<br>
<cfelseif read_title.pstate eq 'MD'>
1494583001<br>
<cfelseif read_title.pstate eq 'DC'>
1497740201<br>
</cfif>

<cfelseif read_FT_company.ID eq 2368 or read_FT_company.master_co_id eq 2368 or read_ft_company.streamline_client eq 'True'>


Funds should be wired to:<br>
<br>

Sandy Spring Bank<br>
17801 Georgia Avenue<br>
Olney, MD 20832<br>
<br>
CREDIT TO:
<cfif read_title.pstate eq 'VA'>
STREAMLINE TITLE & ESCROW<br>
CRESPA TRUST ACCOUNT<br>
ABA# 055001096<br>
ACCOUNT #1494588102<br>
<cfelseif read_title.pstate eq 'MD'>
CREDIT TO:<br>
STREAMLINE  TITLE & ESCROW<br>
TRUST ACCOUNT<br>
ABA 		#055001096<br>
ACCOUNT 	#1494590201<br>
<br>
<cfelse>
STREAMLINE TITLE & ESCROW<br>
TRUST ACCOUNT<br>
ABA# 055001096<br>
ACCOUNT #1494588101<br>
</cfif>
			
<cfelseif check_if_richmond_office.va_employee eq 'True' or  check_if_richmond_office.va_employee eq 1>



<cfif read_title.pstate eq 'MD'>
SANDY SPRING BANK<BR>
17801 GEORGIA AVE<BR>
OLNEY MD 20832<BR><BR>

CREDIT TO:<BR>
FIRST TITLES & ESCROW-RICHMOND<BR>
MAHT ACCOUNT<BR>
ABA 		# 055001096<BR>
ACCOUNT 	#1562947701<BR>
REF: CUSTOMER?S NAME OR ADDRESS<BR>
		<cfelseif read_title.pstate eq 'VA'>
SANDY SPRING BANK<BR>
17801 GEORGIA AVE<BR>
OLNEY MD 20832<BR><BR>

CREDIT TO:<BR>
FIRST TITLE & ESCROW-RICHMOND<BR>
CRESPA-TRUST ACCOUNT<BR>
ABA 		# 055001096<BR>
ACCOUNT 	#1562950601<BR>
REF: CUSTOMER?S NAME OR ADDRESS<BR><BR>
<cfelseif read_title.pstate eq 'FL'>
PNC BANK<br>
702 RUSSELL AVE <br>
GAITHERSBURG MD <br>
301-963-7697<br>
<br>

CREDIT TO:<br>
FIRST TITLE & ESCROW<br>
FLORIDA TRUST ACCTS<br>
7361 CALHOUN PLACE, SUITE 200<br>
ROCKVILLE MD 20855<br>
ABA #  031000053<br>
ACCT #   5308129727<br>
REF: CUSTOMER?S NAME OR ADDRESS<br>
<br>
<cfelseif read_title.pstate eq 'OH'>
PNC BANK<br>
702 RUSSELL AVE <br>
GAITHERSBURG MD <br>
301-963-7697<br>

<br>
CREDIT TO:<br>
FIRST TITLE & ESCROW<br>
7361 CALHOUN PLACE, SUITE 200<br>
ROCKVILLE MD 20855<br>
OHIO TRUST ACCOUNT<br>
ABA #  031000053<br>
ACCT #   5308129743<br>
REF: CUSTOMER?S NAME OR ADDRESS<br>
<br>

<cfelseif read_title.pstate eq 'AL'>
PNC BANK<br>
702 RUSSELL AVE <br>
GAITHERSBURG MD <br>
301-963-7697<br>

<br>
CREDIT TO:<br>
ALABAMA FIRST SETTLEMENT & ESCROW <br>
1701 Main Avenue SW, Suite 5<br>
Cullman, AL 35055<br>
ALABAMA TRUST ACCOUNT <br>
ABA # 031000053 <br>
ACCT # 5515186126 <br>
REF: CUSTOMER’S NAME/ADDRESS <br>


<cfelseif read_title.pstate eq 'DE'>
<table border=0 cellpadding=2 cellspacing=2>
<tr>
<td width="120" align="left" valign="top">Bank name:</td>
<td width="350" align="left" valign="top">Wells Fargo Bank, NA<br>
420 Montgomery Street<br>
San Francisco, CA 94104<br>
</td>
</tr>
<tr>
<td width="120" align="left" valign="top">Bank routing number:</td>
<td width="350" align="left" valign="top">121000248<br>
</td>
</tr>
<tr>
<td width="120" align="left" valign="top">Account number:</td>
<td width="350" align="left" valign="top">6454176055<br>
PC Law Associates<BR />
DE Rule 1.15A Attorney Escrow Account<br>
</td>
</tr>
<tr>
<td colspan="2" align="left" valign="top">Please reference borrower name and file number</td>
</tr>
</table>
FOR SAME DAY FUNDING: All required disbursement documents and wires must be received by PCN by 3:00pm EST to guarantee same day funding. If the information is sent after 3:00pm EST, we will make our best effort to fund the file in a timely manner.
<br /><br />
NOTE: Any wires received that cannot easily be matched to one of our scheduled disbursements will be returned promptly as unidentifiable.
<br /><br />
<cfelseif read_title.pstate eq 'WV'>


MCCORMICK LAW OFFICE<br>

REAL ESTATE TRUST ACCT<br>

The Huntington National Bank<br>

Columbus, OH<br>

TRUST ACCT # 01221242028<br>

ROUTING OR ABA 044000024<br>

PLEASE REFERENCE CUSTOMER?S NAME<br>



<cfelseif read_title.pstate eq 'GA'>

Wachovia, N.A., Atlanta, Georgia	<br>
ABA# 121000248<br>
Acct# 2000045313789<br>
Acct Name: OM Smith, Attorney at Law, PC<br>
Real Estate IOLTA<br>

<cfelseif read_title.pstate eq 'MA'>
Citibank, N.A.<br />
100 Citibank Drive, Bld. 1, Flr. 1<br />
San Antonio, TX 78245-9966<br />
Account Name: PC Law Associates LLC MA IOLTA Attorney Special<br />
Routing:  221172610<br />
IOLTA Account<br />
#1255627635<br />
Please reference borrower name and file number.<br />


<!---Bridgewater Savings Bank	<br>
6 Main Street<br>
Lakeville, MA 02347-1605<br>
Tel: #508-946-5050<br>
ABA #211372828 for further deposit to the account of<br>
Robert J. Mather & Associates<br>
IOLTA Account<br>
#342004352<br>--->

<cfelseif read_title.pstate neq 'OH' and read_title.pstate neq 'AL' and read_title.pstate neq 'MD' and read_title.pstate neq 'TX' and read_title.pstate neq 'VA' and read_title.pstate neq 'FL' and read_title.pstate neq 'GA' and read_title.pstate neq 'DE' and read_title.pstate neq 'MA' and read_title.pstate neq 'WV'>
SANDY SPRING BANK<BR>
17801 GEORGIA AVE<BR>
OLNEY MD 20832<BR><BR>

CREDIT TO:<BR>
FIRST TITLE & ESCROW-RICHMOND<BR>
TRUST ACCOUNT<BR>
ABA 		# 055001096<BR>
ACCOUNT 	#1562871401<BR>
REF: CUSTOMER?S NAME OR ADDRESS<BR><BR>
<cfelse>
SANDY SPRING BANK<br>
17801 GEORGIA AVE.<br>
OLNEY, MD 20832<br>
<br>
CREDIT TO:<br>
FIRST TITLE & ESCROW<br>
TRUST ACCOUNT<br>
ABA #055001096<br>
ACCOUNT #1494583001<br>
<br>
		</cfif>



<cfelseif (read_FT_company.company contains "Suntrust Bank") and read_title.pstate eq 'VA'>


FIRST TITLE AND ESCROW INC<br>
CRESPA TRUST ACCOUNT <br>
SUNTRUST BANK<br>
3051 WALDORF MARKET PLACE<br>
WALDORF MD 20603<br>
ABA 061000104<br>
ACCT 42566115<br><br>






<cfelseif (read_FT_company.company contains "Suntrust Bank") and read_title.pstate eq 'MD'>

FIRST TITLE AND ESCROW INC<br>
MAHT TRUST ACCOUNT <br>
SUNTRUST BANK<br>
3051 WALDORF MARKET PLACE<br>
WALDORF MD 20603<br>
ABA # 061000104<br>
ACCT 1000142566123<br><br>


<cfelseif (read_FT_company.company contains "Suntrust Bank") and read_title.pstate eq 'FL'>

FIRST TITLE AND ESCROW INC<br>
FLORIDA T TRUST ACCOUNT <br>
SUNTRUST BANK<br>
3051 WALDORF MARKET PLACE<br>
WALDORF MD 20603<br>
ABA # 061000104<br>
ACCT 1000136069092<br><br>



			
<cfelseif (read_FT_company.company contains "Suntrust Bank") and read_title.pstate neq 'MD' and read_title.pstate neq 'VA' and read_title.pstate neq 'FL' and read_title.pstate neq 'OH' and read_title.pstate neq 'AL' and read_title.pstate neq 'WV' and read_title.pstate neq 'GA' and read_title.pstate neq 'MA'>
			
FIRST TITLE AND ESCROW INC<br>
TRUST ACCOUNT <br>
SUNTRUST BANK<br>
3051 WALDORF MARKET PLACE<br>
WALDORF MD 20603<br>
ABA # 061000104<br>
ACCT 1000136069084<br><br>
REF: CUSTOMER?S NAME OR ADDRESS<BR>

<cfelseif (read_FT_company.company contains "Suntrust Bank") and (read_title.pstate eq 'AK' or read_title.pstate eq 'CO' or read_title.pstate eq 'DC' or read_title.pstate eq 'HI' or read_title.pstate eq 'ID' or read_title.pstate eq 'IA' or read_title.pstate eq 'KY' or read_title.pstate eq 'ME' or read_title.pstate eq 'NM' or read_title.pstate eq 'MN' or read_title.pstate eq 'NE' or read_title.pstate eq 'NY' or read_title.pstate eq 'NC' or read_title.pstate eq 'ND' or read_title.pstate eq 'OK' or read_title.pstate eq 'RI' or read_title.pstate eq 'SC' or read_title.pstate eq 'SD' or read_title.pstate eq 'VT' or read_title.pstate eq 'WY')>

<cfif DateDiff("d", date_to_check, DateFormat(Now(), 'm/d/yyyy')) GTE 0>
FIRST TITLE AND ESCROW INC<br>
TRUST ACCOUNT <br>
CARDINAL BANK<br>
8270 GREENSBORO DR<br>
MCLEAN, VA 22102<br>
ABA/Trnsit # 056008849<br>
ACCOUNT # 5060107462<br>
REF: CUSTOMER?S NAME OR ADDRESS<br><br>
<cfelse>
FIRST TITLE AND ESCROW INC<br>
TRUST ACCOUNT <br>
SUNTRUST BANK<br>
3051 WALDORF MARKET PLACE<br>
WALDORF MD 20603<br>
ABA # 061000104<br>
ACCT 1000136069084<br><br>
REF: CUSTOMER?S NAME OR ADDRESS<BR>
</cfif>
	
  
<cfelseif (read_title.pstate eq 'MO')>
EAGLE BANK<br>
12505 PARK Potomac Ave.<br>
POTOMOAC. MD 20854<br>
FOR CREDIT TO
FIRST TITLE AND ESCROW INC<br>
TRUST ACCOUNT <br>
ABA/Trnsit # 055003298<br>
ACCOUNT # 0200100063<br>
REF: CUSTOMER'S NAME OR ADDRESS<br><br>

   
		
<cfelseif read_FT_company.streamline_client NEQ True and (read_title.pstate eq 'CA' or read_title.pstate eq 'CT' or read_title.pstate eq 'IN' or read_title.pstate eq 'IL' or read_title.pstate eq 'KS' or read_title.pstate eq 'LA' or read_title.pstate eq 'MI' or read_title.pstate eq 'MS' or read_title.pstate eq 'MT' or read_title.pstate eq 'NV' or read_title.pstate eq 'NH' or read_title.pstate eq 'NJ' or read_title.pstate eq 'OR' or read_title.pstate eq 'PA' or read_title.pstate eq 'TN' or read_title.pstate eq 'UT' or read_title.pstate eq 'WI')>

Eagle Bank<BR>
12505 Park Potomac Ave<BR>
Potomac, MD 20854<BR><BR>
For credit to<BR>
FIRST TITLE & ESCROW INC<BR>
TRUST ACCOUNT<BR>
7361 Calhoun Place, Suite 200<BR>
ROCKVILLE MD 20855<BR>
ABA # 055003298<BR>
ACCT # 0200100063<BR>
REF: CUSTOMER?S NAME/ADDRESS<BR><BR>


<cfelseif read_title.pstate eq 'AL'>
PNC BANK<br>
702 RUSSELL AVE <br>
GAITHERSBURG MD <br>
301-963-7697<br>

<br>
CREDIT TO:<br>
ALABAMA FIRST SETTLEMENT & ESCROW <br>
1701 Main Avenue SW, Suite 5<br>
Cullman, AL 35055<br>
ALABAMA TRUST ACCOUNT  <br>
ABA # 031000053  <br>
ACCT # 5515186126  <br>
REF: CUSTOMER’S NAME/ADDRESS  <br>

<cfelseif read_title.pstate eq 'DE'>

<table border=0 cellpadding=2 cellspacing=2>
<tr>
<td width="120" align="left" valign="top">Bank name:</td>
<td width="350" align="left" valign="top">Wells Fargo Bank, NA<br>
420 Montgomery Street<br>
San Francisco, CA 94104<br>
</td>
</tr>
<tr>
<td width="120" align="left" valign="top">Bank routing number:</td>
<td width="350" align="left" valign="top">121000248<br>
</td>
</tr>
<tr>
<td width="120" align="left" valign="top">Account number:</td>
<td width="350" align="left" valign="top">6454176055<br>
PC Law Associates<BR />
DE Rule 1.15A Attorney Escrow Account<br>
</td>
</tr>
<tr>
<td width="120" colspan="2" align="left" valign="top">Please reference borrower name and file number<br>
</td>
</tr>
</table>
FOR SAME DAY FUNDING: All required disbursement documents and wires must be received by PCN by 3:00pm EST to guarantee same day funding. If the information is sent after 3:00pm EST, we will make our best effort to fund the file in a timely manner.
<br /><br />
NOTE: Any wires received that cannot easily be matched to one of our scheduled disbursements will be returned promptly as unidentifiable.<br>
<br>




<cfelseif (read_FT_company.company contains "Eagle Bank" or read_FT_company.company contains "EagleBank") and read_title.pstate eq 'VA'>

Eagle Bank<br>
12505 Park Potomac Ave<br>
Potomac MD 20854<br>
<br>
For credit to<br>
FIRST TITLE & ESCROW INC<br>
CRESPA  ACCOUNT<br>
7361 CALHOUN PLACE, SUITE 200<br>
ROCKVILLE MD 20855<br>
ABA # 055003298<br>
ACCT # 0200100055<br>
<br>





<cfelseif (read_FT_company.company contains "Eagle Bank" or read_FT_company.company contains "EagleBank") and read_title.pstate eq 'MD'>

Eagle Bank<BR>
12505 Park Potomac Ave<BR>
Potomac MD 2085<BR>
<br>
For credit to<BR>
FIRST TITLE & ESCROW INC<BR>
MAHT ACCOUNT<BR>
7361 CALHOUN PLACE, SUITE 200<br>
ROCKVILLE MD 20855<br>
ABA # 055003298<BR>
ACCT 1200009635<br>
<br>

			
<cfelseif (read_FT_company.company contains "Eagle Bank" or read_FT_company.company contains "EagleBank") and read_title.pstate neq 'MD' and read_title.pstate neq 'VA' and read_title.pstate neq 'FL' and read_title.pstate neq 'OH' and read_title.pstate neq 'AL' and read_title.pstate neq 'WV' and read_title.pstate neq 'GA' and read_title.pstate neq 'MA' and read_title.pstate neq 'DE' and read_title.pstate neq 'TX'>

 

			
Eagle Bank<BR>
12505 Park Potomac Ave<BR>
Potomac MD 20854<BR>
<br>
For credit to<BR>
FIRST TITLE & ESCROW INC<BR>
TRUST ACCOUNT<BR>
7361 CALHOUN PLACE, SUITE 200<br>
ROCKVILLE MD 20855<br>
ABA # 055003298<BR>
ACCT # 0200100063<br>
REF: CUSTOMER?S NAME/ADDRESS<br>
<br>

<cfelseif (read_FT_company.company contains "Eagle Bank" or read_FT_company.company contains "EagleBank") and (read_title.pstate  eq 'CA' or read_title.pstate eq 'CO' or read_title.pstate eq 'IN' or read_title.pstate eq 'IL' or read_title.pstate eq 'KS' or read_title.pstate eq 'LA' or read_title.pstate eq 'MI' or read_title.pstate eq 'MS' or read_title.pstate eq 'MT' or read_title.pstate eq 'NV')>

Eagle Bank<BR>
12505 Park Potomac Ave<BR>
Potomac MD 20854<BR>
<br>
For credit to<BR>
FIRST TITLE & ESCROW INC<BR>
TRUST ACCOUNT<BR>
7361 CALHOUN PLACE, SUITE 200<br>
ROCKVILLE MD 20855<br>
ABA # 055003298<BR>
ACCT # 0200100063<br>
REF: CUSTOMER?S NAME/ADDRESS<br>


			







<cfelse>

<cfif read_title.pstate eq 'VA'>
SANDY SPRING BANK<br>
17801 GEORGIA AVE.<br>
OLNEY, MD 20832<br>
<br>
CREDITED TO:<br>
FIRST TITLE & ESCROW<br>
TRUST ACCOUNT<br>
ABA #055001096<br>
ACCOUNT #1494584901<br>
<br>

<cfelseif read_title.pstate eq 'MD'>
SANDY SPRING BANK<br>
17801 GEORGIA AVE.<br>
OLNEY, MD 20832<br>
<br>
CREDITED TO:<br>
FIRST TITLE & ESCROW<br>
TRUST ACCOUNT<br>
ABA #055001096<br>
ACCOUNT #1513994501<br>
<br>

<cfelseif read_title.pstate eq 'FL'>
PNC BANK<br>
702 RUSSELL AVE <br>
GAITHERSBURG MD <br>
301-963-7697<br>
<br>

CREDIT TO:<br>
FIRST TITLE & ESCROW<br>
FLORIDA TRUST ACCTS<br>
7361 CALHOUN PLACE, SUITE 200<br>
ROCKVILLE MD 20855<br>
ABA #  031000053<br>
ACCT #   5308129727<br>
REF: CUSTOMER?S NAME OR ADDRESS<br>
<br>
<cfelseif read_title.pstate eq 'OH'>
PNC BANK<br>
702 RUSSELL AVE <br>
GAITHERSBURG MD <br>
301-963-7697<br>

<br>
CREDIT TO:<br>
FIRST TITLE & ESCROW<br>
7361 CALHOUN PLACE, SUITE 200<br>
ROCKVILLE MD 20855<br>
OHIO TRUST ACCOUNT<br>
ABA #  031000053<br>
ACCT #   5308129743<br>
REF: CUSTOMER?S NAME OR ADDRESS<br>
<br>






<cfelseif read_title.pstate eq 'WV'>
MCCORMICK LAW OFFICE<br>

REAL ESTATE TRUST ACCT<br>

The Huntington National Bank<br>

Columbus, OH<br>

TRUST ACCT # 01221242028<br>

ROUTING OR ABA 044000024<br>

PLEASE REFERENCE CUSTOMER?S NAME<br>


<cfelseif read_title.pstate eq 'GA'>

Wachovia, N.A., Atlanta, Georgia	<br>
ABA# 121000248<br>
Acct# 2000045313789<br>
Acct Name: OM Smith, Attorney at Law, PC<br>
Real Estate IOLTA<br>

<cfelseif read_title.pstate eq 'MA'>
Citibank, N.A.<br />
100 Citibank Drive, Bld. 1, Flr. 1<br />
San Antonio, TX 78245-9966<br />
Account Name: PC Law Associates LLC MA IOLTA Attorney Special<br />
Routing:  221172610<br />
IOLTA Account<br />
#1255627635<br />
Please reference borrower name and file number.<br />


<!---Bridgewater Savings Bank	<br>
6 Main Street<br>
Lakeville, MA 02347-1605<br>
Tel: #508-946-5050<br>
ABA #211372828 for further deposit to the account of<br>
Robert J. Mather & Associates<br>
IOLTA Account<br>
#342004352<br>--->




<cfelseif (read_FT_company.company contains "Eagle Bank" or read_FT_company.company contains "EagleBank") or read_title.pstate  eq 'CA' or read_title.pstate eq 'CO' or read_title.pstate eq 'IN' or read_title.pstate eq 'IL' or read_title.pstate eq 'KS' or read_title.pstate eq 'LA' or read_title.pstate eq 'MI' or read_title.pstate eq 'MS' or read_title.pstate eq 'MT' or read_title.pstate eq 'NV'>

			
Eagle Bank<BR>
12505 Park Potomac Ave<BR>
Potomac MD 20854<BR>
<br>
For credit to<BR>
FIRST TITLE & ESCROW INC<BR>
TRUST ACCOUNT<BR>
7361 CALHOUN PLACE, SUITE 200<br>
ROCKVILLE MD 20855<br>
ABA # 055003298<BR>
ACCT # 0200100063<br>
REF: CUSTOMER?S NAME/ADDRESS<br>

<cfelseif (read_FT_company.company contains "Suntrust Bank") or read_title.pstate eq 'AK' or read_title.pstate eq 'CO' or read_title.pstate eq 'DC' or read_title.pstate eq 'HI' or read_title.pstate eq 'ID' or read_title.pstate eq 'IA' or read_title.pstate eq 'KY' or read_title.pstate eq 'ME' or read_title.pstate eq 'NM' or read_title.pstate eq 'MN' or read_title.pstate eq 'NE' or read_title.pstate eq 'NY' or read_title.pstate eq 'NC' or read_title.pstate eq 'ND' or read_title.pstate eq 'OK' or read_title.pstate eq 'RI' or read_title.pstate eq 'SC' or read_title.pstate eq 'SD' or read_title.pstate eq 'VT' or read_title.pstate eq 'WY'>

<cfif DateDiff("d", date_to_check, DateFormat(Now(), 'm/d/yyyy')) GTE 0>
FIRST TITLE AND ESCROW INC<br>
TRUST ACCOUNT <br>
CARDINAL BANK<br>
8270 GREENSBORO DR<br>
MCLEAN, VA 22102<br>
ABA/Trnsit # 056008849<br>
ACCOUNT # 5060107462<br>
REF: CUSTOMER?S NAME OR ADDRESS<br><br>
<cfelse>
FIRST TITLE AND ESCROW INC<br>
TRUST ACCOUNT <br>
SUNTRUST BANK<br>
3051 WALDORF MARKET PLACE<br>
WALDORF MD 20603<br>
ABA # 061000104<br>
ACCT 1000136069084<br><br>
REF: CUSTOMER?S NAME OR ADDRESS<BR>
</cfif>


<cfelseif (read_title.pstate eq 'MO')>
EAGLE BANK<br>
12505 PARK Potomac Ave.<br>
POTOMOAC. MD 20854<br>
FOR CREDIT TO
FIRST TITLE AND ESCROW INC<br>
TRUST ACCOUNT <br>
ABA/Trnsit # 055003298<br>
ACCOUNT # 0200100063<br>
REF: CUSTOMER'S NAME OR ADDRESS<br><br>


<cfelse>
SANDY SPRING BANK<br>
17801 GEORGIA AVE.<br>
OLNEY, MD 20832<br>
<br>
CREDIT TO:<br>
FIRST TITLE & ESCROW<br>
TRUST ACCOUNT<br>
ABA #055001096<br>
ACCOUNT #1494583001<br>
<br>
</cfif>

</cfif>
<br>
<CFQUERY datasource="#request.dsn#" NAME="read_comp">		
				SELECT *
				FROM Companies
				Where ID = #read_title.comp_id#
			</CFQUERY>	
<cfset this_email = 'loandocs@firsttitleservices.com'>
<cfif check_if_richmond_office.va_employee eq 'True'>
<cfset this_email = 'richmond@firsttitleservices.com'>
<cfelseif read_comp.streamline_client eq 'True'>
<cfset this_email = 'loandocs@streamline-title.com'>
<cfelseif read_comp.company contains 'Chase/RealEC'>
<cfset this_email = 'ChaseTeam@firsttitleservices.com'>
<cfelseif read_comp.company contains 'Chase'>
<cfset this_email = 'chase@firsttitleservices.com'>
<cfelseif read_comp.company contains 'Flagstar'>
<cfset this_email = 'flagstar@firsttitleservices.com'>
<cfelseif read_comp.ID eq 3943 or read_comp.ID eq 4042 or read_comp.ID eq 4043>
<cfset this_email = 'vdocs@firsttitleservices.com'>
</cfif> 
Please email all Loan Packages to <cfoutput>#this_email#</cfoutput><br>
<br>
<!--- Edit (Start) Added by Synechron Development for ticket# 295 --->
<cfif read_comp.streamline_client eq '1'>
<img src="http://machine1.firsttitleservices.com/client/images/ST_LOGO.jpg" border="0" alt="Streamline Title">

<cfelseif read_title.pstate eq 'TX'>

<img src="http://machine1.firsttitleservices.com/client/images/Logo2.png" border="0" alt="Title of Texas">
<cfelseif read_title.pstate eq 'AL'>
<h2>Alabama First Settlement & Escrow, Inc.</h2>
<cfelse>
<img src="http://machine1.firsttitleservices.com/client/images/FT_LOGO.jpg" border="0" alt="First Title Services">
</cfif>
<br>
<br>
<cfif read_title.pstate eq 'TX' or check_if_richmond_office.tx_employee eq 'True'>
2805 N. Dallas Pkwy<br />
Suite 220<br>
Plano, TX 75093<br><br>
Phone 972.665.9969<br>
Fax 972.692.3209<br>

<br>
<cfelseif read_title.pstate eq 'AL'>
1701 Main Avenue SW, Suite 5<br>
Cullman, AL 35055<br>
Phone 252.775.3900<br>

<br>
<cfelse>
7361 Calhoun Place, Ste 200<br>
Rockville, MD 20855<br>
301-279-0303 - 866-4TITLES<br>
<!--- Edit (End) Added by Synechron Development for ticket# 295 --->
</cfif>


