<cfsavecontent variable="soapBody" >
    <cfoutput>
      <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <Request>
<Version>2</Version>
<Authentication>
<UserID>frsttitlet</UserID>
<Password>TE16273</Password>
</Authentication>
<TransactionDate>12/21/2015</TransactionDate>
<ClientTransactionID>9970001629-00010</ClientTransactionID>
<ErnstRequest>
<Version>1</Version>
<TransactionCode>100</TransactionCode>
<Property>
<Page>NY056</Page>
<City>shelter island</City>
<County></County>
<State></State>
<EstimatedValue>1500,000</EstimatedValue>
<MortgageAmount>800000.00</MortgageAmount>
<OriginalDebtAmount/>
<UnpaidPrincipalBalance/>
<OriginalMortgageDate/>
<StateQuestions>
<Q1>0</Q1>
<Q2>0</Q2>
<Q3>0</Q3>
<Q4>0</Q4>
<Q5>0</Q5>
<Q6>0</Q6>
<Q7>0</Q7>
<Q8>0</Q8>
<Q9>0</Q9>
<Q10>0</Q10>
<Q11>0</Q11>
<Q12>0</Q12>
<Q13>0</Q13>
<Q14>0</Q14>
<Q15>0</Q15>
<Q16>0</Q16>
<Q17>0</Q17>
<Q18>0</Q18>
<Q19>0</Q19>
<Q20>0</Q20>
<Q21>0</Q21>
<V1/>
<V2/>
<V3/>
<V4/>
<V5/>
<V6/>
<V7/>
<V8/>
<V9/>
<V10/>
<V11/>
<V12/>
<V13/>
<V14/>
<V15/>
<V16/>
<V17/>
<V18/>
<V19/>
<V20/>
<V21/>
<V22/>
<V23/>
<V24/>
<V25/>
<V26/>
<V27/>
<V28/>
<V29/>
<V30/>
<V31/>
<V32/>
<V33/>
<V34/>
<V35/>
<V36/>
<V37/>
<V38/>
<V39/>
<V40/>
<V41/>
<V42/>
<V43/>
<V44/>
<V45/>
<V46/>
<V47/>
<V48/>
<V49/>
<V50/>
</StateQuestions>
</Property>
<NumberOfPages>
<Mortgage>14</Mortgage>
<Deed>3</Deed>
</NumberOfPages>
<Mortgage>
<Index>
<NumberOfGrantors>2</NumberOfGrantors>
<NumberOfGrantees>2</NumberOfGrantees>
<NumberOfSurnames>2</NumberOfSurnames>
<NumberOfSignatures>2</NumberOfSignatures>
</Index>
</Mortgage>
<Deed>
<Index>
<NumberOfGrantors>2</NumberOfGrantors>
<NumberOfGrantees>2</NumberOfGrantees>
<NumberOfSurnames>2</NumberOfSurnames>
<NumberOfSignatures>2</NumberOfSignatures>
</Index></Deed>
<Assignment>
<Pages>1</Pages>
<NumberOfAssignments>1</NumberOfAssignments>
<Index>
<NumberOfGrantors>0</NumberOfGrantors>
<NumberOfGrantees>0</NumberOfGrantees>
<NumberOfSurnames>0</NumberOfSurnames>
<NumberOfSignatures>0</NumberOfSignatures>
</Index>
</Assignment>
<Release>
<Pages>1</Pages>
<NumberOfReleases>1</NumberOfReleases>
<Index><NumberOfGrantors>2</NumberOfGrantors>
<NumberOfGrantees>2</NumberOfGrantees>
<NumberOfSurnames>2</NumberOfSurnames>
<NumberOfSignatures>2</NumberOfSignatures>
</Index>
</Release>
<POA>
<Pages>1</Pages>
</POA>
</ErnstRequest>
<TitleRequest>
<Version>1</Version>
<Property>
<City></City>
<County>Suffolk</County>
<State>NY</State>
<Zip></Zip>
<LoanType>sale</LoanType>
<ClosingDate>2015-12-21</ClosingDate>
</Property>
<PolicyType>New</PolicyType>
<UseCommonEndorsements>1</UseCommonEndorsements>
<UseSimultaneousRates>0</UseSimultaneousRates>
<LendersPolicy>
<Requested>1</Requested>
<PolicyAmount>800000.00</PolicyAmount>
<YearsSinceLastPolicy>0</YearsSinceLastPolicy>
<PriorPolicyAmount>0</PriorPolicyAmount>
</LendersPolicy>
</TitleRequest>
</Request>
  </soap:Body>
</soap:Envelope>
    </cfoutput>
 </cfsavecontent>
 <!--- Post the Ernst Request to Ernst Web Service --->
 <cfhttp
 url="https://api.ernstpublishing.com/xml_webservice/processxml.asmx/Request"
 method="Post"
 result="httpResponse" >
 <!--- End of Web Service Request Service to Ernst --->
 
 <!--- Define SOAP Header --->
 <cfhttpparam type="header" 
 name="Request" 
 value="https://api.ernstpublishing.com/xml_webservice/processxml.asmx/Request" />
 
 <!--- Define No-Compression Header --->
 <cfhttpparam type="header"
 name="accept-encoding"
 value="no-compression" />
 
 <!--- Trim XML --->
 <cfhttpparam type="xml"
 value="#trim( soapBody )#" />
 
 </cfhttp>
 
 <!--- Handle XML Response --->
 
 <cfif find( "200", httpResponse.statusCode )>
    
    <!--- Parse the XML Soap Response --->
    <cfset soapResponse = xmlParse(httpResponse.fileContent) />
</cfif>
 <cfdump var="#httpResponse.fileContent#" >

