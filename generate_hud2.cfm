<cfhttp url="https://machine1.firsttitleservices.com/" method="get" >

</cfhttp>
<cfoutput>hihi#cfhttp.filecontent#</cfoutput><cfabort>


<cfhttp url="https://machine1.firsttitleservices.com/HUD1_2010_PDF.cfm?rec_id=#title_id#&bypass=1" method="get" >
<cfhttpparam type="header" name="accept-encoding" value="deflate;q=0">
<cfhttpparam type="header" name="te" value="deflate;q=0">
</cfhttp>


<cfdocument format="PDF" pagetype="custom" pageheight="14" pagewidth="8.5" margintop=".25" marginbottom=".25" marginleft=".25" marginright=".25" filename="c:\huds\HUD_#title_id#.pdf" overwrite="yes"> <cfoutput>#cfhttp.filecontent#</cfoutput> </cfdocument>


<cfheader name="Content-Disposition" value="inline; filename=HUD1.pdf">
<cfcontent type="application/unknown" file="c:\huds\HUD_#title_id#.pdf" >
