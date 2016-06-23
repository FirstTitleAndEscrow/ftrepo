<!---Misc Uploads
<cfquery name="misc_docs" datasource="#request.dsn#">
    SELECT     TOP 100 PERCENT *
    FROM       upload_many
    WHERE     (CAST(filedate AS smalldatetime) BETWEEN CONVERT(DATETIME, '2004-02-01 00:00:00', 102) AND CONVERT(DATETIME, '2004-04-30 00:00:00', 102))
    
</CFQUERY>
 --->
<!---Closing Forms
<cfquery name="misc_docs" datasource="#request.dsn#">
    SELECT     TOP 100 PERCENT Title_Notes.N_Note, EventList.mortrec, EventList.Title_id, Title_Notes.N_Date
    FROM         Title_Notes LEFT OUTER JOIN
                      EventList ON Title_Notes.Order_ID = EventList.Title_id
    WHERE     (Title_Notes.N_Note LIKE 'Mortgage Recorded AND Imaged to system') AND (Title_Notes.N_Date BETWEEN CONVERT(DATETIME, 
                      '2004-02-01 00:00:00', 102) AND CONVERT(DATETIME, '2004-04-30 00:00:00', 102))
    ORDER BY Title_Notes.N_Date

</CFQUERY>
--->
<!---Final HUDS --->
<cfquery name="misc_docs" datasource="#request.dsn#">
SELECT     TITLE_ID, final_HUD, hud_dateandtime
FROM         Doc_Closer_Title
WHERE     (final_HUD IS NOT NULL) AND (hud_dateandtime BETWEEN CONVERT(DATETIME, '2004-02-01 00:00:00', 102) AND CONVERT(DATETIME, 
                      '2004-04-30 00:00:00', 102))
</CFQUERY>                      

<CFLOOP QUERY="misc_docs"> 
<CFSET DocName = "c:\uploads\">
<CFOUTPUT>
<CFSET DocName = #DocName# & #misc_docs.final_hud#>
</CFOUTPUT>
<!---This is the DocName <CFOUTPUT>#DocName#</CFOUTPUT><BR>---> 
<CFIF FileExists(#DocName#)>
    <CFFILE
        Action = "Move"
        DESTINATION="c:\uploads\finalhud\"
        Source = "#DocName#">
</CFIF>        
   
</CFLOOP>
     
