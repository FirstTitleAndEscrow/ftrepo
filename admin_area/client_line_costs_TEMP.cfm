<!---<cfquery datasource="#request.dsn#" name="out" maxrows="100">
SELECT [Billing_ID]
      ,[company_ID]
      ,[a_801]
      ,[a_802]
      ,[a_803]
      ,[a_804]
      ,[a_805]
      ,[a_806]
      ,[a_807]
      ,[a_808]
      ,[a_809]
      ,[a_810]
      ,[a_811]
      ,[a_812]
      ,[a_813]
      ,[a_814]
      ,[a_815]
      ,[a_816]
      ,[a_1101]
      ,[a_1102]
      ,[a_1103]
      ,[a_1104]
      ,[a_1105]
      ,[a_1106]
      ,[a_1107]
      ,[a_1111]
      ,[a_1112]
      ,[a_1113]
      ,[a_1205]
      ,[a_1303]
      ,[a_1304]
      ,[a_1305]
      ,[a_states]
      ,[b_date]
      ,[b_time]
      ,[title_ft_agency_name]
      ,[a_801_text]
      ,[a_802_text]
      ,[a_803_text]
      ,[a_804_text]
      ,[a_805_text]
      ,[a_806_text]
      ,[a_807_text]
      ,[a_808_text]
      ,[a_809_text]
      ,[a_810_text]
      ,[a_811_text]
      ,[a_812_text]
      ,[a_813_text]
      ,[a_814_text]
      ,[a_815_text]
      ,[a_816_text]
      ,[a_1111_text]
      ,[a_1113_text]
      ,[a_1205_text]
      ,[a_1303_text]
      ,[a_1304_text]
      ,[a_1305_text]
      ,[a_1112_text]
      ,[a_1114]
      ,[a_1114_text]
      ,[a_801b]
      ,[a_802b]
      ,[a_803b]
      ,[a_804b]
      ,[a_805b]
      ,[a_806b]
      ,[a_807b]
      ,[a_808b]
      ,[a_809b]
      ,[a_810b]
      ,[a_811b]
      ,[a_812b]
      ,[a_813b]
      ,[a_814b]
      ,[a_815b]
      ,[a_816b]
      ,[a_801_textb]
      ,[a_802_textb]
      ,[a_803_textb]
      ,[a_804_textb]
      ,[a_805_textb]
      ,[a_806_textb]
      ,[a_807_textb]
      ,[a_808_textb]
      ,[a_809_textb]
      ,[a_810_textb]
      ,[a_811_textb]
      ,[a_812_textb]
      ,[a_813_textb]
      ,[a_814_textb]
      ,[a_815_textb]
      ,[a_816_textb]
      ,[a_1101b]
      ,[a_1111b]
      ,[a_1111_textb]
      ,[a_1102b]
      ,[a_1112b]
      ,[a_1112_textb]
      ,[a_1103b]
      ,[a_1113b]
      ,[a_1113_textb]
      ,[a_1104b]
      ,[a_1205b]
      ,[a_1205_textb]
      ,[a_1105b]
      ,[a_1303b]
      ,[a_1303_textb]
      ,[a_1106b]
      ,[a_1304b]
      ,[a_1304_textb]
      ,[a_1107b]
      ,[a_1305b]
      ,[a_1305_textb]
      ,[a_801c]
      ,[a_802c]
      ,[a_803c]
      ,[a_804c]
      ,[a_805c]
      ,[a_806c]
      ,[a_807c]
      ,[a_808c]
      ,[a_809c]
      ,[a_810c]
      ,[a_811c]
      ,[a_812c]
      ,[a_813c]
      ,[a_814c]
      ,[a_815c]
      ,[a_816c]
      ,[a_801_textc]
      ,[a_802_textc]
      ,[a_803_textc]
      ,[a_804_textc]
      ,[a_805_textc]
      ,[a_806_textc]
      ,[a_807_textc]
      ,[a_808_textc]
      ,[a_809_textc]
      ,[a_810_textc]
      ,[a_811_textc]
      ,[a_812_textc]
      ,[a_813_textc]
      ,[a_814_textc]
      ,[a_815_textc]
      ,[a_816_textc]
      ,[a_1101c]
      ,[a_1111c]
      ,[a_1111_textc]
      ,[a_1102c]
      ,[a_1112c]
      ,[a_1112_textc]
      ,[a_1103c]
      ,[a_1113c]
      ,[a_1113_textc]
      ,[a_1104c]
      ,[a_1205c]
      ,[a_1205_textc]
      ,[a_1105c]
      ,[a_1303c]
      ,[a_1303_textc]
      ,[a_1106c]
      ,[a_1304c]
      ,[a_1304_textc]
      ,[a_1107c]
      ,[a_1305c]
      ,[a_1305_textc]
      ,[a_801d]
      ,[a_802d]
      ,[a_803d]
      ,[a_804d]
      ,[a_805d]
      ,[a_806d]
      ,[a_807d]
      ,[a_808d]
      ,[a_809d]
      ,[a_810d]
      ,[a_811d]
      ,[a_812d]
      ,[a_813d]
      ,[a_814d]
      ,[a_815d]
      ,[a_816d]
      ,[a_801_textd]
      ,[a_802_textd]
      ,[a_803_textd]
      ,[a_804_textd]
      ,[a_805_textd]
      ,[a_806_textd]
      ,[a_807_textd]
      ,[a_808_textd]
      ,[a_809_textd]
      ,[a_810_textd]
      ,[a_811_textd]
      ,[a_812_textd]
      ,[a_813_textd]
      ,[a_814_textd]
      ,[a_815_textd]
      ,[a_816_textd]
      ,[a_1101d]
      ,[a_1111d]
      ,[a_1111_textd]
      ,[a_1102d]
      ,[a_1112d]
      ,[a_1112_textd]
      ,[a_1103d]
      ,[a_1113d]
      ,[a_1113_textd]
      ,[a_1104d]
      ,[a_1205d]
      ,[a_1205_textd]
      ,[a_1105d]
      ,[a_1303d]
      ,[a_1303_textd]
      ,[a_1106d]
      ,[a_1304d]
      ,[a_1304_textd]
      ,[a_1107d]
      ,[a_1305d]
      ,[a_1305_textd]
      ,[a_801f]
      ,[a_802f]
      ,[a_803f]
      ,[a_804f]
      ,[a_805f]
      ,[a_806f]
      ,[a_807f]
      ,[a_808f]
      ,[a_809f]
      ,[a_810f]
      ,[a_811f]
      ,[a_812f]
      ,[a_813f]
      ,[a_814f]
      ,[a_815f]
      ,[a_816f]
      ,[a_801_textf]
      ,[a_802_textf]
      ,[a_803_textf]
      ,[a_804_textf]
      ,[a_805_textf]
      ,[a_806_textf]
      ,[a_807_textf]
      ,[a_808_textf]
      ,[a_809_textf]
      ,[a_810_textf]
      ,[a_811_textf]
      ,[a_812_textf]
      ,[a_813_textf]
      ,[a_814_textf]
      ,[a_815_textf]
      ,[a_816_textf]
      ,[a_1101f]
      ,[a_1111f]
      ,[a_1111_textf]
      ,[a_1102f]
      ,[a_1112f]
      ,[a_1112_textf]
      ,[a_1103f]
      ,[a_1113f]
      ,[a_1113_textf]
      ,[a_1104f]
      ,[a_1205f]
      ,[a_1205_textf]
      ,[a_1105f]
      ,[a_1303f]
      ,[a_1303_textf]
      ,[a_1106f]
      ,[a_1304f]
      ,[a_1304_textf]
      ,[a_1107f]
      ,[a_1305f]
      ,[a_1305_textf]
      ,[trig]
      ,[prior_billing_id]
      ,[updated]
  FROM [First_Title_Services].[dbo].[Company_Billing_Values]
  WHERE [a_1113] <> [a_1113b]
  OR [a_1113b] <> [a_1113c]
</cfquery>


<cfquery datasource="#request.dsn#" name="out" maxrows="100">
SELECT 
      [a_1111_text]
      ,[a_1113_text]
      ,[a_1205_text]
      ,[a_1303_text]
      ,[a_1304_text]
      ,[a_1305_text]
      ,[a_1112_text]    
      ,[a_1114_text]     
      ,[a_1111_textb]     
      ,[a_1112_textb]    
      ,[a_1113_textb]    
      ,[a_1205_textb]     
      ,[a_1303_textb]    
      ,[a_1304_textb]     
      ,[a_1305_textb]     
      ,[a_1111_textc]    
      ,[a_1112_textc]    
      ,[a_1113_textc]   
      ,[a_1205_textc]   
      ,[a_1303_textc]   
      ,[a_1304_textc]  
      ,[a_1305_textc]    
      ,[a_1111_textd]    
      ,[a_1112_textd] 
      ,[a_1113_textd]   
      ,[a_1205_textd]   
      ,[a_1303_textd]     
      ,[a_1304_textd]     
      ,[a_1305_textd]  
      ,[a_1111_textf]    
      ,[a_1112_textf]    
      ,[a_1113_textf]     
      ,[a_1205_textf]    
      ,[a_1303_textf]    
      ,[a_1304_textf]    
      ,[a_1305_textf]    
  FROM [First_Title_Services].[dbo].[Company_Billing_Values]
</cfquery>


<cfset fieldlist = "[a_1111_text]
      ,[a_1113_text]
      ,[a_1205_text]
      ,[a_1303_text]
      ,[a_1304_text]
      ,[a_1305_text]
      ,[a_1112_text]    
      ,[a_1114_text]     
      ,[a_1111_textb]     
      ,[a_1112_textb]    
      ,[a_1113_textb]    
      ,[a_1205_textb]     
      ,[a_1303_textb]    
      ,[a_1304_textb]     
      ,[a_1305_textb]     
      ,[a_1111_textc]    
      ,[a_1112_textc]    
      ,[a_1113_textc]   
      ,[a_1205_textc]   
      ,[a_1303_textc]   
      ,[a_1304_textc]  
      ,[a_1305_textc]    
      ,[a_1111_textd]    
      ,[a_1112_textd] 
      ,[a_1113_textd]   
      ,[a_1205_textd]   
      ,[a_1303_textd]     
      ,[a_1304_textd]     
      ,[a_1305_textd]  
      ,[a_1111_textf]    
      ,[a_1112_textf]    
      ,[a_1113_textf]     
      ,[a_1205_textf]    
      ,[a_1303_textf]    
      ,[a_1304_textf]    
      ,[a_1305_textf]">

<cfset masterlist = queryNew('description')>
<cfset counter = 0>
<cfloop list="#fieldlist#" index="i">
	<cfquery datasource="#request.dsn#" name="out#ListFind(fieldlist,i)#">
 		SELECT DISTINCT #i# AS [description]
  		FROM [First_Title_Services].[dbo].[Company_Billing_Values]
	</cfquery>
	<cfdump var="#evaluate('out' & ListFind(fieldlist,i))#" expand="false" label="#i#">
	<cfloop query="out#ListFind(fieldlist,i)#">
		<cfset newrow = queryaddrow(masterlist)>
		<cfset temp = querySetCell(masterlist, 'description', #description#)>
		<cfset counter = counter + 1>
	</cfloop>	
</cfloop>
<cfoutput>#counter# total descriptions</cfoutput>
<cfdump var="#masterlist#" expand="false" label="masterlist">
<cfquery dbtype="query" name="report_viewer_query">
	SELECT DISTINCT description FROM masterlist ORDER BY description
</cfquery>
<cfdump var="#out#" expand="false" label="Unique Descriptions">

--->

<!---
<cfsetting enablecfoutputonly="true">

<cfset fieldlist = "[a_1111_text]
      ,[a_1113_text]
      ,[a_1205_text]
      ,[a_1303_text]
      ,[a_1304_text]
      ,[a_1305_text]
      ,[a_1112_text]    
      ,[a_1114_text]     
      ,[a_1111_textb]     
      ,[a_1112_textb]    
      ,[a_1113_textb]    
      ,[a_1205_textb]     
      ,[a_1303_textb]    
      ,[a_1304_textb]     
      ,[a_1305_textb]     
      ,[a_1111_textc]    
      ,[a_1112_textc]    
      ,[a_1113_textc]   
      ,[a_1205_textc]   
      ,[a_1303_textc]   
      ,[a_1304_textc]  
      ,[a_1305_textc]    
      ,[a_1111_textd]    
      ,[a_1112_textd] 
      ,[a_1113_textd]   
      ,[a_1205_textd]   
      ,[a_1303_textd]     
      ,[a_1304_textd]     
      ,[a_1305_textd]  
      ,[a_1111_textf]    
      ,[a_1112_textf]    
      ,[a_1113_textf]     
      ,[a_1205_textf]    
      ,[a_1303_textf]    
      ,[a_1304_textf]    
      ,[a_1305_textf]">

<cfset masterlist = queryNew('description')>
<cfset counter = 0>
<cfloop list="#fieldlist#" index="i">
	<cfquery datasource="#request.dsn#" name="out#ListFind(fieldlist,i)#">
 		SELECT DISTINCT #i# AS [description]
  		FROM [First_Title_Services].[dbo].[Company_Billing_Values]
	</cfquery>
	<!---<cfdump var="#evaluate('out' & ListFind(fieldlist,i))#" expand="false" label="#i#">--->
	<cfloop query="out#ListFind(fieldlist,i)#">
		<cfset newrow = queryaddrow(masterlist)>
		<cfset temp = querySetCell(masterlist, 'description', #description#)>
		<cfset counter = counter + 1>
	</cfloop>	
</cfloop>
<!---<cfoutput>#counter# total descriptions</cfoutput>--->
<!---<cfdump var="#masterlist#" expand="false" label="masterlist">--->
<cfquery dbtype="query" name="report_viewer_query">
	SELECT DISTINCT description FROM masterlist ORDER BY description
</cfquery>
<!---<cfdump var="#report_viewer_query#"> <cfabort>--->
<cfcontent type="application/msexcel">
<cfheader name="Content-Disposition" value="attachment; filename=Descs.csv">
		<cfloop list="#report_viewer_query.columnlist#" index="i">
			<cfoutput>#i#,</cfoutput>			
		</cfloop>
		<cfoutput>#chr(13)#</cfoutput>
		<cfloop query="report_viewer_query">			
			<cfloop list="#report_viewer_query.columnlist#" index="i">
				<cfoutput>#Evaluate(i)#,</cfoutput>
			</cfloop>
			<cfoutput>#chr(13)#</cfoutput>
		</cfloop>	
<cfabort>
--->

<!---
<cfset pathToCSV =  GetDirectoryFromPath(GetCurrentTemplatePath()) & "CLCTX.csv">    
<cffile action="read" file="#pathToCSV#" variable="csvfile"> 
<cfloop index="index" list="#csvfile#" delimiters="#chr(10)##chr(13)#"> 
   <cfquery name="importcsv" datasource="#request.dsn#"> 
         INSERT INTO Company_Billing_XFORM ([desc],[linenum],[desc_new],[payee],[outside]) 
         VALUES 
                  ('#listgetAt('#index#',1, ',')#', 
                   '#listgetAt('#index#',2, ',')#', 
                   '#listgetAt('#index#',3, ',')#', 
                   '#listgetAt('#index#',4, ',')#', 
				   '#listgetAt('#index#',5)#'
                  ) 
   </cfquery>
</cfloop> 
<cfquery name="test" datasource="#request.dsn#"> 
         SELECT * FROM Company_Billing_XFORM 
</cfquery> 
<cfdump var="#test#"> 
--->