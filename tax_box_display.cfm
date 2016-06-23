
<cfhttp url="http://#cgi.server_name#/tax_page.cfm?rec_id=#rec_id#" method="get" resolveURL="true">


 <cftry>
 <cffile action="delete" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\tax_page_pdfs\TAX_PAGE_#rec_id#.pdf">
 <cfcatch type="any"></cfcatch>
 </cftry>
        <cfdocument format="PDF" pagetype="custom" pageheight="14" pagewidth="8.5" margintop=".25" marginbottom=".25" marginleft=".25" marginright=".25" filename="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\tax_page_pdfs\TAX_PAGE_#rec_id#.pdf" overwrite="yes" > <cfoutput>#cfhttp.filecontent#</cfoutput> </cfdocument>



<script language="javascript">
window.location.assign("tax_page_pdfs/TAX_PAGE_<cfoutput>#rec_id#</cfoutput>.pdf")
</script>
