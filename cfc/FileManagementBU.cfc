<cfcomponent>

<cffunction name="GetCompressReturnPDF" returntype="void" >
<cfargument name="filename" default="">

<cfset filePath = #fileSys.FindFilePath('#filename#','file')# >
<cffile action="copy" destination="C:\compressionBin" source="#filePath#">
<cfexecute name="C:\Program Files (x86)\neeviaPDF.com\PDFcompress\cmdLine\CLcompr.exe"
arguments="C:\compressionBin\#filename# C:\compressionBin\#filename# -co -ci jpg -cq 10 -gi jpg -gq 10 -mi jbig2 -mq 1"
outputfile="C:\compressionBin\output.txt"
timeout="250">
</cfexecute>
<cfset sleep(5000)>
<!---Lets Return the file now--->
<!---Back to where you came from! :D--->
<cffile action="copy" destination="#filePath#" 
source="C:\compressionBin\#filename#" >

</cffunction>



<cffunction name="IsFileOnNAS" output="true" returntype="string" >
<cfargument name="filename" default="">
<cfargument name="site" default="FT">

<cfset good_list = "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,1,2,3,4,5,6,7,8,9,0">

<cfif arguments.filename neq '' and arguments.filename neq ' '>
<cfif Len(ListGetAt(arguments.filename, 1, ".")) eq 1 or ListFindNoCase(good_list, Mid(arguments.filename, 2, 1),",") eq 0 >
<cfset directory_name = UCase(Mid(arguments.filename, 1, 1)) & '0\'>
<cfelse>
<cfset directory_name = UCase(Mid(arguments.filename, 1, 1)) & UCase(Mid(arguments.filename, 2, 1))& '\'>
</cfif>



<!--- new file system --->
<cfset filename = #arguments.filename#>
<cfset directory_name1 = "">
<cfset full_directory_name_max_count = 26>

<cfloop index="i" from="1" to="#Len(filename)#">
<cfif ListContainsNoCase(good_list, Mid(filename,#i#,1), ",")>
<cfset directory_name1 = directory_name1 & "" & Mid(filename,#i#,1) & "" & "/">
</cfif>
</cfloop>
<cfset directory_name1 = Mid(directory_name1,1,full_directory_name_max_count)>
<!--- end new file system --->


<cfset target_path4 = "\\10.11.233.6\FirstTitle\" & directory_name1 & arguments.filename>
<cfset move_path = "\\10.11.233.6\FirstTitle\" & directory_name1>



<cfif arguments.site eq 'ST'>
<cfset target_path4_url = "http://www.streamline-title.com/admin_area/new_uploads_folder4/" & directory_name1 & arguments.filename>
<cfelse>
<cfset target_path4_url = "http://#cgi.server_name#/admin_area/new_uploads_folder4/" & directory_name1 & arguments.filename>
</cfif>


<cfif FileExists(target_path4)>
  <cfset result = "Yes">
  <cfelse>
  <cfset result = "No">
  </cfif>
</cfif>

  <cfreturn result>


</cffunction>






<cffunction access="remote" name="GetNewFileName" returntype="string" >
<cfargument name="file2" type="any">

<cfset gotName = 0>
<cfset uploaded_file = arguments.file2>

<cfloop condition="gotName less than 1">
<cfset final_file_name = #FindFilePath(uploaded_file, 'file')#>
<cfif IsDefined("final_file_name") and final_file_name does not contain 'c:\uploads'>
  <cfset newfilePart = dateformat(now(),'dd_mmm_yyyy')& timeformat(now(),'hh_mm_ss_L')>       
  <cfset current_filename = listinsertat(uploaded_file,(listlen(uploaded_file,".")),newfilePart,".") >
  <cfset destination_path = 'C:\uploads\' &  #current_filename#>
  <cfset source_path = 'C:\uploads\' &  #uploaded_file#>
  <cfset final_file_name = current_filename>
  <cffile action="move" NAMECONFLICT="makeunique" destination="#destination_path#" source="#source_path#">
<cfelse>
  <cfset gotName = 1>
  <cfset final_file_name = uploaded_file>
</cfif>
</cfloop>

<cfreturn final_file_name>

</cffunction>





<cffunction access="remote" name="PDFcompressAndMove" returntype="void" >

<cfargument name="file2" type="any">
<cfargument name="filepath" type="any">

<cfexecute name="C:\Program Files (x86)\neeviaPDF.com\PDFcompress\cmdLine\CLcompr.exe"

arguments='"#filepath##arguments.file2#" "#filepath##arguments.file2#" -co -ci jpg -cq 10 -gi jpg -gq 10 -mi jbig2 -mq 1'

outputfile="C:\uploads\output.txt"

timeout="120000">

</cfexecute>

<cfscript>
MoveFromUploadsOverwrite("#arguments.file2#");
</cfscript>

</cffunction>





<cffunction name="PDFcompress" access="remote" >

<cfargument name="file2" type="any">
<cfargument name="filepath" type="any">

<cfexecute name="C:\Program Files (x86)\neeviaPDF.com\PDFcompress\cmdLine\CLcompr.exe"

arguments="#filepath##arguments.file2# #filepath##arguments.file2# -co -ci jpg -cq 10 -gi jpg -gq 10 -mi jbig2 -mq 1"

outputfile="C:\uploads\output.txt"

timeout="250">

</cfexecute>

</cffunction>




<cffunction name="IsNewClient" output="false">
<cfargument name="comp_id" type="string" default="">


<CFQUERY datasource="#request.dsn#" NAME="get_client_total_orders">	
Select * from title 
where comp_ID = '#arguments.comp_ID#'
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_client_date">	
Select a_date, sign_up_date from companies
where ID = '#arguments.comp_ID#'
</CFQUERY>


<cfif get_client_total_orders.recordcount lte 5 and DateDiff("d", get_client_date.a_date, Now()) lt 180>
<cfset New_Client = 'True'>
<cfelse>
<cfset New_Client = 'False'>
</cfif>

<cfreturn New_Client>

</cffunction>

<cffunction name="AddNewQueryItem" output="false">
<cfargument name="line_number" type="string" default="">
<cfargument name="Description" type="string" default="">
<cfargument name="amount" type="string" default="">
<cfargument name="payer" type="string" default="">			
<cfargument name="outside" type="numeric" default="0">			
<cfargument name="payto" type="string" default="">			
<cfset temp = QueryAddRow(get_fee_query)>
<cfset temp = QuerySetCell(get_fee_query, "Line_Number", arguments.line_number)>
<cfset temp = QuerySetCell(get_fee_query, "Description", arguments.description)>


			<cftry>
<cfif IsNumeric(arguments.amount)>
<cfset temp = QuerySetCell(get_fee_query, "Amount", arguments.amount)>
<cfelse>
<cfset temp = QuerySetCell(get_fee_query, "Amount", arguments.amount)>
</cfif>
			<cfcatch type="any">
			</cfcatch>
			</cftry>


<cfset temp = QuerySetCell(get_fee_query, "Payer", arguments.payer)>			
<cfset temp = QuerySetCell(get_fee_query, "Payto", arguments.payto)>			
<cfset temp = QuerySetCell(get_fee_query, "Outside", arguments.outside)>		
</cffunction>































<cffunction name="FindFilePath" output="true" returntype="string" >
<cfargument name="filename" default="">
<cfargument name="find_type" default="file">
<cfargument name="site" default="FT">

<cfset good_list = "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,1,2,3,4,5,6,7,8,9,0">

<cfif arguments.filename neq '' and arguments.filename neq ' '>
<cfif Len(ListGetAt(arguments.filename, 1, ".")) eq 1 or ListFindNoCase(good_list, Mid(arguments.filename, 2, 1),",") eq 0 >
<cfset directory_name = UCase(Mid(arguments.filename, 1, 1)) & '0\'>
<cfelse>
<cfset directory_name = UCase(Mid(arguments.filename, 1, 1)) & UCase(Mid(arguments.filename, 2, 1))& '\'>
</cfif>



<!--- new file system --->
<cfset filename = #arguments.filename#>
<cfset directory_name1 = "">
<cfset full_directory_name_max_count = 26>

<cfloop index="i" from="1" to="#Len(filename)#">
<cfif ListContainsNoCase(good_list, Mid(filename,#i#,1), ",")>
<cfset directory_name1 = directory_name1 & "" & Mid(filename,#i#,1) & "" & "/">
</cfif>
</cfloop>
<cfset directory_name1 = Mid(directory_name1,1,full_directory_name_max_count)>
<!--- end new file system --->


<cfset target_path1 = "c:\uploads\" & arguments.filename>
<cfset target_path2 = "c:\new_uploads_folder2\" & ReplaceNoCase(directory_name, "/","\", "ALL") & arguments.filename>
<cfset target_path3 = "c:\new_uploads_folder3\" & ReplaceNoCase(directory_name1, "/","\", "ALL") & arguments.filename>
<cfset target_path4 = "\\10.11.233.6\FirstTitle\" & ReplaceNoCase(directory_name1, "/","\", "ALL") & arguments.filename>
<cfset move_path = "\\10.11.233.6\FirstTitle\" & ReplaceNoCase(directory_name1, "/","\", "ALL")>



<cfif arguments.site eq 'ST'>
<cfset target_path1_url = "http://www.streamline-title.com/admin_area/uploads/" & arguments.filename>
<cfset target_path2_url = "http://www.streamline-title.com/admin_area/new_uploads_folder2/" & directory_name & arguments.filename>
<cfset target_path3_url = "http://www.streamline-title.com/admin_area/new_uploads_folder3/" & directory_name1 & arguments.filename>
<cfset target_path4_url = "http://www.streamline-title.com/admin_area/new_uploads_folder4/" & directory_name1 & arguments.filename>
<cfelse>
<cfset target_path1_url = "http://#cgi.server_name#/admin_area/uploads/" & arguments.filename>
<cfset target_path2_url = "http://#cgi.server_name#/admin_area/new_uploads_folder2/" & directory_name & arguments.filename>
<cfset target_path3_url = "http://#cgi.server_name#/admin_area/new_uploads_folder3/" & directory_name1 & arguments.filename>
<cfset target_path4_url = "http://#cgi.server_name#/admin_area/new_uploads_folder4/" & directory_name1 & arguments.filename>
</cfif>


<cfif FileExists(target_path4)>
  <cfif arguments.find_type eq 'file'>
  <cfreturn target_path4>
  <cfelse>
  <cfreturn target_path4_url>
  </cfif>
<cfelseif FileExists(target_path3)>
  <cfif arguments.find_type eq 'file'>
  <cfreturn target_path3>
  <cfelse>
  <cfreturn target_path3_url>
  </cfif>
<cfelseif FileExists(target_path2)>
<!--- if the file is in the old system, but not in the new system, let's move it to the new one and return that url --->
<cftry><cfdirectory directory="#move_path#" action="create"><cfcatch type="any"></cfcatch></cftry>
<cftry>
<cffile action="move" source="#target_path2#" destination="#target_path4#">
<cfmail to="rick@jermain.com" from="rjermain@firsttitleservices.com" subject="**CALL TO OLD FIlE SYSTEM**">
Filename: #arguments.filename# was not found in new system, but was found in old system (#target_path2#), and was successfully moved to:
#target_path4_url#
</cfmail>
  <cfif arguments.find_type eq 'file'>
  <cfreturn target_path4>
  <cfelse>
  <cfreturn target_path4_url>
  </cfif>
<cfcatch type="any">
  <cfif arguments.find_type eq 'file'>
  <cfreturn target_path2>
  <cfelse>
  <cfreturn target_path2_url>
  </cfif>
</cfcatch>
</cftry>
<!--- END if the file is in the old system, but not in the new system, let's move it to the new one and return that url --->

<cfelseif FileExists(target_path1)>
  <cfif arguments.find_type eq 'file'>
  <cfreturn target_path1>
  <cfelse>
  <cfreturn target_path1_url>
  </cfif>
</cfif>

</cfif>

</cffunction>




<cffunction name="MoveFromUploads" output="true" returntype="string" >
<cfargument name="filename">
<cfset new_file_name = arguments.filename>
<cfset good_list = "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,1,2,3,4,5,6,7,8,9,0">



<!--- <cfif Len(ListGetAt(arguments.filename, 1, ".")) eq 1 or ListFindNoCase(good_list, Mid(arguments.filename, 2, 1),",") eq 0 >
<cfset translated_path = 'c:\new_uploads_folder2\' & UCase(Mid(arguments.filename, 1, 1)) & '0\'>
<cfelse>
<cfset translated_path = 'c:\new_uploads_folder2\' & UCase(Mid(arguments.filename, 1, 1)) & UCase(Mid(arguments.filename, 2, 1)) & '\'>
</cfif>

<cfif DirectoryExists(translated_path) eq 0>
<cfdirectory action="Create" directory="#translated_path#">
</cfif>
<cfset current_filename = #arguments.filename#>
<cfdirectory action="list" directory="#translated_path#" filter="#arguments.filename#" name="check_directory">
<cfif check_directory.recordcount gte 1>
<cfset count = 0>
<cfset stop_loop = 0>
<cfloop condition="stop_loop eq 0">
<cfset count = count + 1>
<cfset current_filename = ListGetAt(arguments.filename, 1, ".") & count & ReplaceNoCase(arguments.filename, ListGetAt(arguments.filename, 1, ".") , '', 'ALL')>
<cfdirectory action="list" directory="#translated_path#" filter="#current_filename#" name="check_directory_again">
<cfif check_directory_again.recordcount gte 1>
<cfelse>
<cfset stop_loop = 1>
</cfif>
</cfloop>
</cfif>

<cfset current_filename = ReplaceNoCase(current_filename, "##", "", "All")>
<cffile action="move" NAMECONFLICT="makeunique" destination="#translated_path#\#current_filename#" source="c:\uploads\#arguments.filename#">
<!--- <cfif current_filename neq arguments.filename>
<!--- update the slot --->
<cfquery name="update_file_name" datasource="#request.dsn#">
update #arguments.table_to_update#
set #arguments.field_to_update# = '#cffile.serverFile#'
where #arguments.field_to_update# = '#arguments.filename#'
and #arguments.id_name# = #arguments.file_id#
</cfquery>

</cfif>
 --->
<cfreturn current_filename> --->

<cftry>
<cfset filename = #new_file_name#>
<cfset directory_path = "\\10.11.233.6\FirstTitle\">
<cfset full_directory_name_max_count = Len(directory_path) + 26>

<cfloop index="i" from="1" to="#Len(filename)#">
<cfif ListContainsNoCase(good_list, Mid(filename,#i#,1), ",")>
<cfset directory_path = directory_path & "" & Mid(filename,#i#,1) & "" & "\">
</cfif>
</cfloop>
<cfset directory_path = Mid(directory_path,1,full_directory_name_max_count)>
<cftry>
<cfset DirectoryCreate(directory_path)>
<cfcatch type="any">
</cfcatch>
</cftry>

<cfset destination_path = #directory_path# &  #filename#>
<cfset source_path = "c:\uploads\" & #filename#>
<cfset current_filename = #filename#>

<cfset current_filename = ReplaceNoCase(current_filename, "##", "", "All")>
<!--- <cfif FileExists(destination_path)> 
                     <cfset newfilePart = dateformat(now(),'dd_mmm_yyyy')& timeformat(now(),'hh_mm_ss_L')>       
                        <cfset current_filename = listinsertat(current_filename,(listlen(current_filename,".")),newfilePart,".") >
<cfset destination_path = #directory_path# &  #current_filename#>
                </cfif> --->
				
<cffile action="move" NAMECONFLICT="makeunique" destination="#destination_path#" source="#source_path#">

<cfreturn current_filename>

<cfcatch type="any">
<cfmail to="rick@jermain.com" from="rjermain@firsttitleservices.com" subject="FILE UPLOAD ERROR">
<cfoutput>
#cfcatch.Detail#<br>
#cfcatch.Message#<br>
#cfcatch.Type#<br>
<br>
</cfoutput>
</cfmail>
</cfcatch>
</cftry>



</cffunction>




<cffunction name="MoveFromUploadsOverwrite" output="true" returntype="string" >
<cfargument name="filename">
<cfset new_file_name = arguments.filename>
<cfset good_list = "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,1,2,3,4,5,6,7,8,9,0">



<!--- <cfif Len(ListGetAt(arguments.filename, 1, ".")) eq 1 or ListFindNoCase(good_list, Mid(arguments.filename, 2, 1),",") eq 0 >
<cfset translated_path = 'c:\new_uploads_folder2\' & UCase(Mid(arguments.filename, 1, 1)) & '0\'>
<cfelse>
<cfset translated_path = 'c:\new_uploads_folder2\' & UCase(Mid(arguments.filename, 1, 1)) & UCase(Mid(arguments.filename, 2, 1)) & '\'>
</cfif>

<cfif DirectoryExists(translated_path) eq 0>
<cfdirectory action="Create" directory="#translated_path#">
</cfif>
<cfset current_filename = #arguments.filename#>
<cfdirectory action="list" directory="#translated_path#" filter="#arguments.filename#" name="check_directory">
<cfif check_directory.recordcount gte 1>
<cfset count = 0>
<cfset stop_loop = 0>
<cfloop condition="stop_loop eq 0">
<cfset count = count + 1>
<cfset current_filename = ListGetAt(arguments.filename, 1, ".") & count & ReplaceNoCase(arguments.filename, ListGetAt(arguments.filename, 1, ".") , '', 'ALL')>
<cfdirectory action="list" directory="#translated_path#" filter="#current_filename#" name="check_directory_again">
<cfif check_directory_again.recordcount gte 1>
<cfelse>
<cfset stop_loop = 1>
</cfif>
</cfloop>
</cfif>

<cfset current_filename = ReplaceNoCase(current_filename, "##", "", "All")>
<cffile action="move" NAMECONFLICT="makeunique" destination="#translated_path#\#current_filename#" source="c:\uploads\#arguments.filename#">
<!--- <cfif current_filename neq arguments.filename>
<!--- update the slot --->
<cfquery name="update_file_name" datasource="#request.dsn#">
update #arguments.table_to_update#
set #arguments.field_to_update# = '#cffile.serverFile#'
where #arguments.field_to_update# = '#arguments.filename#'
and #arguments.id_name# = #arguments.file_id#
</cfquery>

</cfif>
 --->
<cfreturn current_filename> --->

<cftry>
<cfset filename = #new_file_name#>
<cfset directory_path = "\\10.11.233.6\FirstTitle\">
<cfset full_directory_name_max_count = Len(directory_path) + 26>

<cfloop index="i" from="1" to="#Len(filename)#">
<cfif ListContainsNoCase(good_list, Mid(filename,#i#,1), ",")>
<cfset directory_path = directory_path & "" & Mid(filename,#i#,1) & "" & "\">
</cfif>
</cfloop>
<cfset directory_path = Mid(directory_path,1,full_directory_name_max_count)>
<cftry>
<cfset DirectoryCreate(directory_path)>
<cfcatch type="any">
</cfcatch>
</cftry>

<cfset destination_path = #directory_path# &  #filename#>
<cfset source_path = "c:\uploads\" & #filename#>
<cfset current_filename = #filename#>

<cfset current_filename = ReplaceNoCase(current_filename, "##", "", "All")>
<!--- <cfif FileExists(destination_path)> 
                     <cfset newfilePart = dateformat(now(),'dd_mmm_yyyy')& timeformat(now(),'hh_mm_ss_L')>       
                        <cfset current_filename = listinsertat(current_filename,(listlen(current_filename,".")),newfilePart,".") >
<cfset destination_path = #directory_path# &  #current_filename#>
                </cfif> --->
				
<cffile action="move" NAMECONFLICT="overwrite" destination="#destination_path#" source="#source_path#">

<cfreturn current_filename>

<cfcatch type="any">
<cfmail to="rick@jermain.com" from="rjermain@firsttitleservices.com" subject="FILE UPLOAD ERROR">
<cfoutput>
#cfcatch.Detail#<br>
#cfcatch.Message#<br>
#cfcatch.Type#<br>
<br>
</cfoutput>
</cfmail>
</cfcatch>
</cftry> 



</cffunction>

























































</cfcomponent>