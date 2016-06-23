
<cfset uploadedTempFilePath = getTempDirectory()>
<cfset uploadedTempFileName = CreateUUID()>
<cfset uploadedFileDestinationPath = uploadedTempFilePath & "\" & uploadedTempFileName>

<cffile action="upload" destination="#uploadedFileDestinationPath#"   filefield="fileToBrowseName">
<cffile action="read" file="#getdirectoryFromPath(getbaseTemplatePath())#\FNMA_resLoanDataFileFormate.txt" variable="fileFormatContent">
   
<cfset loanFormatArray = ListToArray(fileFormatContent,"#chr(10)##chr(13)#")>
 
<cfset totalRows = arrayLen(loanFormatArray)>
<cfset resLoanDataFormatQry = QueryNew("AField,Sect,Data_Stream,Pos,Len,Seg_Occ,Field_Information","varchar,varchar,varchar,integer,varchar,varchar,varchar")>
<cfset newRow = QueryAddRow(resLoanDataFormatQry,totalRows )>

<cfset counter = 1>
<cfloop from="1" to="#totalRows#" index="i">
    <cfset rowData      = loanFormatArray[i]>
      <cfset rowDataArray = ListToArray(rowData,"#chr(9)#")>   
	    
	   
	   <cfif not rowData contains '!NA!'   >
		<!---   <br /><cfoutput> ******#rowData#*****</cfoutput><br /> --->
		<cfset rowDataArray = ListToArray(rowData,"#chr(9)#")>	
	    
		<cfset temp = QuerySetCell(resLoanDataFormatQry, "AField", rowDataArray[1], counter)>
		<cfset temp = QuerySetCell(resLoanDataFormatQry, "Sect",  rowDataArray[2], counter)>
		<cfset temp = QuerySetCell(resLoanDataFormatQry, "Data_Stream", rowDataArray[3], counter)>
		<cfset temp = QuerySetCell(resLoanDataFormatQry, "Pos", rowDataArray[4], counter)>
		<cfset temp = QuerySetCell(resLoanDataFormatQry, "Len", rowDataArray[5], counter)>
		<cfif ArrayLen(rowDataArray) GT 5><cfset temp = QuerySetCell(resLoanDataFormatQry, "Seg_Occ", rowDataArray[6], counter)></cfif>  
	  <cfelse>
	    <cfset temp = QuerySetCell(resLoanDataFormatQry, "AField", '~N/A~', counter)>	
	 </cfif>
  <cfset counter = counter +1>     
</cfloop>


<!---<cffile action="read" file="#URL.fileBrowsedPath#" variable="uploadFileFormatContent">--->
 <cffile action="read" file="#uploadedFileDestinationPath#" variable="uploadFileFormatContent">
<cfset uploadLoanFormatArray = ListToArray(uploadFileFormatContent,"#chr(10)##chr(13)#")>

<cfset formFieldStruct = structNew()>

<cfset formFieldArray = arrayNew(1)>

<cfloop from="1" to="#ArrayLen(uploadLoanFormatArray)#" index="i">   
   <cfset rowData = uploadLoanFormatArray[i]>
   <cfset fieldPart = trim(mid(rowData,1,3))>
  
   <cfquery name="getFormatRule" dbtype="query">
	  SELECT * FROM resLoanDataFormatQry
	  WHERE AField like '#fieldPart#-%'
   </cfquery>

   <cfif getFormatRule.RecordCount GT 0>   
	
	 
	<cfset formFieldStruct[fieldPart &'_'& i]['.RowData'] = rowData>
	<cfloop query="getFormatRule">	 
	 <cfset formFieldStruct[fieldPart &'_'& i][getFormatRule.AField] = StructNew()>	 
	 <cfset formFieldStruct[fieldPart &'_'& i][getFormatRule.AField]['Data_Stream'] = trim(getFormatRule.Data_Stream)>
	 <cfset formFieldStruct[fieldPart &'_'& i][getFormatRule.AField]['Data_Stream_Value'] = mid(rowData,getFormatRule.Pos,getFormatRule.Len)>
	</cfloop> 
	 	 
	
	 	 
   </cfif>
</cfloop>

<cffile action="delete" file="#uploadedFileDestinationPath#" > 

<cfinclude template="FNMA_populateFormFields.cfm">

