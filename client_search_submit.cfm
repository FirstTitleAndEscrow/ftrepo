<CFPARAM NAME="state" DEFAULT="">
<CFPARAM NAME="county" DEFAULT="">
<CFPARAM NAME="zip" DEFAULT="">
<CFPARAM NAME="city" DEFAULT="">
<CFPARAM NAME="address" DEFAULT="">
<CFPARAM NAME="lname" DEFAULT="">
<CFPARAM NAME="fname" DEFAULT="">
<CFPARAM NAME="sparcelnum" DEFAULT="0">
<CFPARAM NAME="eparcelnum" DEFAULT="0">
<CFPARAM NAME="addtype" DEFAULT="">
<cfoutput>
State = #State#<br>
County = #County#<br>
zip = #Zip#<br>
address = #Address#<br>
city = #city#<br>
First Name = #fname#
Last Name = #lname#<br>
Starting Parcel Number = #sparcelnum#<br>
Ending Parcel Number = #eparcelnum#<br>
Type of Address to search form = #addtype#<br>
<cfset username="5htest22">
<cfset password="TITLE">
<cfset state=#state#>
These are the values that will shoot out to Data Quick.
state = #state#
</cfoutput>


<!--- Create a Datasource for the search options--->
<CF_XMLDatasource name="People" Type="Text">
<DataQuick>
	<Login>
		<Account>#username#</Account>
		<Password>#password#</Password>
	</Login>
	<SearchParameters>
		<Address AddressType='both'/>
		<OwnerName>
			<FirstName>#fname#</FirstName>
			<LastName>#lname#</LastName>
		</OwnerName>
		<APN>
			<StartingParcel>#sparcelnum#</StartingParcel>
			<EndingParcel>#eparcelnum#</EndingParcel>
		</APN>
		<Geography>
			<Cities>
				<City>
					<CityName>#city#</CityName>
					<StateName>#State#</StateName>
				</City>
			</Cities>
			<States>
				<StateName>#State#</StateName>
			</States>
			<ZIPCodes>
				<ZIPCode>#Zip#</ZIPCode>
			</ZIPCodes>
			<Counties>
				<County>
					<CountyName>#county#</CountyName>
					<StateName>#state#</StateName>
				</County>
			</Counties>
		</Geography>
		<StartingRecordID/>
	</SearchParameters>
	<OutputParameters>
		<NumberOfRecords>100</NumberOfRecords>
	</OutputParameters>
</DataQuick>

</CF_XMLDatasource> 
<!--- Convert it to an xml structure --->
<CF_XMLDatasource2Struct Datasource="People" r_Struct="stPeople">

<!--- Display the datasource as it is at the moment.  This is for testing and should be removed later --->
<CF_XMLDump Datasource="People">
<!---saves XML as XML file on web server --->
<CF_XMLFileOutput Datasource="People" Filename="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\FindTargetBlank.xml">
<!---Attempted Parsing --->
<cfset xml="<?xml version='1.0'?>
<root>
	<person id='007'>
		<firstname>James</firstname>
		<lastname>Bond</lastname>
	</person>
</root>
">

<CFX_XMLParser xml="#xml#" output="wddx"> 
<cfwddx action="WDDX2CFML" input="#wddx#" output="root"> 
<cfoutput>Agent #root.root.person.id# is #root.root.person.firstname.INNER_TEXT# #root.root.person.lastname.INNER_TEXT#</cfoutput> 

