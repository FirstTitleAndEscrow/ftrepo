<cfif IsDefined("form.FEESREQUEST")>
<cfset dataBinary = toBinary(Form.FEESREQUEST)>
<cfset dataString = ToString(dataBinary)>
<CFSET MyXml = XmlParse(Replace(Replace(dataString, "xmlns=", "xmlns:xsd=",  "ALL"), "_", "",  "ALL"))>

<cfset myxmldoc = XmlSearch(MyXml, "/FEESREQUEST")>
<cfset pstate = MyXml.FEESREQUEST.State.XMLText>
<cfset pcounty = MyXml.FEESREQUEST.County.XMLText>
<cfset pcity = MyXml.FEESREQUEST.City.XMLText>
<cfset type = MyXml.FEESREQUEST.LOANTYPE.XMLText>
<cfset loan_amount = MyXml.FEESREQUEST.LOANAMOUNT.XMLText>
<cfset purchase_price = MyXml.FEESREQUEST.PURCHASEPRICE.XMLText>
<cfset comp_id = MyXml.FEESREQUEST.CompanyID.XMLText>

<cfoutput>pstate:  #pstate#<BR>
pcounty = #pcounty#<BR>
pcity = #pcity#<BR>
type = #type#<BR>
loan_amount = #loan_amount#<BR>
purchase_price = #purchase_price#<BR>
comp_id = #comp_id#<BR></cfoutput>



<CFLOCATION URL="https://#cgi.server_name#/calculator.cfm?emp=0&comp_id=#comp_id#&user_id_1=0&lo_id=0&loc=4&a_trigger=17&searchtype=#type#&pstate=#pstate#&pcnt=#pcounty#&pcty=#pcity#&loanamt_float=#purchase_price#&loanamt_float4=#loan_amount#">

<cfelse>
No XML file sent<br>
</cfif>