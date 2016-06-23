This page has been commented out to prevent it from running again. It's only purpose was to add clients to the Companies database

--Rick Jermain

<!--- <CFQUERY NAME="test" DataSource="excelfile">
SELECT * FROM `Sheet1$`
</CFQUERY>

<cfset inserted_record_count = 0>
<cfoutput query="test">
<cfif BranchNum eq "" or Email eq "Delete" or Email eq "DELETE">
<cfelse>
<cfset ran1 = RandRange(0,9)>
<cfset ran2 = RandRange(0,9)>
<cfset ran3 = RandRange(0,9)>
<cfif CityStateZip NEQ "">
<cfset zipfield = ListLen(CityStateZip, " ")>
<cfset statefield = ListLen(CityStateZip, " ") - 1>
<cfset zip = Trim(ReplaceNoCase(Ucase(ListGetAt(ReplaceNoCase(CityStateZip, ".", ","), zipfield, " ")), ",", "", "ALL"))>
<cfset state = Trim(ReplaceNoCase(ListGetAt(ReplaceNoCase(CityStateZip, ".", ","), statefield, " "), ",", "", "ALL"))>
<cfset city = Replace(CityStateZip, state, "", "ALL")>
<cfset city = Replace(city, zip, "", "ALL")>
<cfset city = Replace(city, ",", "", "ALL")>
<cfset city = Replace(city, " .", "", "ALL")>
<cfelse>
<cfset zip = "">
<cfset state = "">
<cfset city = "">
</cfif>
<cfset inserted_record_count = inserted_record_count + 1>
<CFQUERY datasource="#request.dsn#" NAME="insert_companies">
Insert Into Companies (company,a_date,a_time,phone,fax,addr1,zip_code,email,city,state,a_user,a_pass,status,master_co_id, Companies_Switch)
values('#Trim(BranchNum)#-#Trim(BranchName)#', '#DateFormat(Now(), "mm/dd/yyyy")#','#TimeFormat(Now(), "hh:mm:ss")#', '#Trim(phone)#', '#Trim(fax)#', '#Trim(address)#', '#Trim(zip)#', '#Trim(email)#','#Trim(city)#', '#Trim(UCase(Replace(state, ".", "", "ALL")))#','#Trim(BranchNum)#','#Trim(BranchNum)#-#ran1##ran2##ran3#', 1, 1052, 0)
</CFQUERY>
</cfif>
</cfoutput>


<CFQUERY NAME="get_new" datasource="#request.dsn#">
SELECT * FROM Companies
Where master_co_id = 1052
</CFQUERY>

<cfoutput>
Inserted Records Should Be: #inserted_record_count#<br>
Actual Number Inserted is: #get_new.RecordCount#<br>
</cfoutput>

<cfdump var="#get_new#">

 --->