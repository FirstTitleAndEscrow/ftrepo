<cfimport prefix="lh" taglib="../Lighthouse/Tags">


<cfset pg_title = "Vendor Routing Table">

<html>
<head>
<script type="text/javascript" src="../Lighthouse/dojo/dojo.js"></script>
<script type="text/javascript" src="../Lighthouse/Resources/js/lighthouse_all.js"></script>
<link rel=stylesheet href="../Lighthouse/Resources/css/MSStandard.css" type="text/css">
</head>
<body>


<lh:MS_Table
	table="vendor_routing_table_companies"
	title="#pg_title#"
	dsn="#request.dsn#"
	resourcesDir="../Lighthouse/Resources"
	defaultaction="View"
	
	>

<lh:MS_TableColumn
		ColName="ID"
		DispName="ID"
		type="integer"
		PrimaryKey="true"
		Identity="true" />	

	
<lh:MS_TableColumn
		ColName="State"
		DispName="State"
		Type="select"
		FKTable="first_title_states_all"
		FKDescr="st_abbrev"
		FKColName="st_id"
		View="Yes"
		Search="Yes"
		required="yes"
		
		/>	
		
<lh:MS_TableColumn
		ColName="county"
		DispName="County"
		type="text"
		Length="100"
		view="Yes"
		required="yes"
		
		 />
		 
<lh:MS_TableColumn
		ColName="Comp_ID"
		DispName="Company"
		Type="select"
		FKTable="vendors_stacie"
		FKDescr="company"
		FKColName="vendor_id"
		View="Yes"
		Search="Yes"
		SelectQuery="select distinct(id) as selectValue, company as selectText from companies where company <> '' order by company"
		
		/>	
		
<lh:MS_TableColumn
		ColName="Current_Owner_1st_Tier_ID"
		DispName="Current Owner 1st Tier"
		Type="select"
		FKTable="vendors_stacie"
		FKDescr="company"
		FKColName="vendor_id"
		View="Yes"
		Search="Yes"
		SelectQuery="select distinct(vendor_id) as selectValue, company as selectText from vendors_stacie where company <> '' AND service_type LIKE 'Abstract' order by company"
		
		/>	
		
<lh:MS_TableColumn
		ColName="Current_Owner_2nd_Tier_ID"
		DispName="Current Owner Second Tier"
		Type="select"
		FKTable="vendors_stacie"
		FKDescr="company"
		FKColName="vendor_id"
		View="Yes"
		Search="Yes"
		SelectQuery="select distinct(vendor_id) as selectValue, company as selectText from vendors_stacie where company <> '' AND service_type LIKE 'Abstract' order by company"
		
		/>	
		
<lh:MS_TableColumn
		ColName="Two_Owner_1st_Tier_ID"
		DispName="Two Owner 1st Tier"
		Type="select"
		FKTable="vendors_stacie"
		FKDescr="company"
		FKColName="vendor_id"
		View="Yes"
		Search="Yes"
		SelectQuery="select distinct(vendor_id) as selectValue, company as selectText from vendors_stacie where company <> '' AND service_type LIKE 'Abstract' order by company"
		
		/>

<lh:MS_TableColumn
		ColName="Two_Owner_2nd_Tier_ID"
		DispName="Two Owner 2nd Tier"
		Type="select"
		FKTable="vendors_stacie"
		FKDescr="company"
		FKColName="vendor_id"
		View="Yes"
		Search="Yes"
		SelectQuery="select distinct(vendor_id) as selectValue, company as selectText from vendors_stacie where company <> '' AND service_type LIKE 'Abstract' order by company"
		
		/>

<lh:MS_TableColumn
		ColName="Full_Search_1st_Tier_ID"
		DispName="Full Search 1st Tier"
		Type="select"
		FKTable="vendors_stacie"
		FKDescr="company"
		FKColName="vendor_id"
		View="Yes"
		Search="Yes"
		SelectQuery="select distinct(vendor_id) as selectValue, company as selectText from vendors_stacie where company <> '' AND service_type LIKE 'Abstract' order by company"
		
		/>
		
<lh:MS_TableColumn
		ColName="Full_search_2nd_Tier_ID"
		DispName="Full Search 2nd Tier"
		Type="select"
		FKTable="vendors_stacie"
		FKDescr="company"
		FKColName="vendor_id"
		View="Yes"
		Search="Yes"
		SelectQuery="select distinct(vendor_id) as selectValue, company as selectText from vendors_stacie where company <> '' AND service_type LIKE 'Abstract' order by company"
		
		/>
		
<lh:MS_TableColumn
		ColName="Taxes_1st_Tier_ID"
		DispName="Taxes 1st Tier"
		Type="select"
		FKTable="vendors_stacie"
		FKDescr="company"
		FKColName="vendor_id"
		View="Yes"
		Search="Yes"
		SelectQuery="select distinct(vendor_id) as selectValue, company as selectText from vendors_stacie where company <> '' AND service_type LIKE 'Taxprep' order by company"
		
		/>
		
<lh:MS_TableColumn
		ColName="Taxes_2nd_Tier_ID"
		DispName="Taxes 2nd Tier"
		Type="select"
		FKTable="vendors_stacie"
		FKDescr="company"
		FKColName="vendor_id"
		View="Yes"
		Search="Yes"
		SelectQuery="select distinct(vendor_id) as selectValue, company as selectText from vendors_stacie where company <> '' AND service_type LIKE 'Taxprep' order by company"
		
		/>
		
<lh:MS_TableColumn
		ColName="Typing_1st_Tier_ID"
		DispName="Typing 1st Tier"
		Type="select"
		FKTable="vendors_stacie"
		FKDescr="company"
		FKColName="vendor_id"
		View="Yes"
		Search="Yes"
		SelectQuery="select distinct(vendor_id) as selectValue, company as selectText from vendors_stacie where company <> '' AND service_type LIKE 'Typing' order by company"
		
		/>
		
<lh:MS_TableColumn
		ColName="Typing_2nd_Tier_ID"
		DispName="Typing 2nd Tier"
		Type="select"
		FKTable="vendors_stacie"
		FKDescr="company"
		FKColName="vendor_id"
		View="Yes"
		Search="Yes"
		SelectQuery="select distinct(vendor_id) as selectValue, company as selectText from vendors_stacie where company <> '' AND service_type LIKE 'Typing' order by company"
		
		/>
		
<lh:MS_TableColumn
		ColName="ICL_1st_Tier_ID"
		DispName="ICL 1st Tier"
		Type="select"
		FKTable="vendors_stacie"
		FKDescr="company"
		FKColName="vendor_id"
		View="Yes"
		Search="Yes"
		SelectQuery="select distinct(vendor_id) as selectValue, company as selectText from vendors_stacie where company <> '' AND service_type LIKE 'ICL' order by company"
		
		/>
		
<lh:MS_TableColumn
		ColName="ICL_2nd_Tier_ID"
		DispName="ICL 2nd Tier"
		Type="select"
		FKTable="vendors_stacie"
		FKDescr="company"
		FKColName="vendor_id"
		View="Yes"
		Search="Yes"
		SelectQuery="select distinct(vendor_id) as selectValue, company as selectText from vendors_stacie where company <> '' AND service_type LIKE 'ICL' order by company"
		
		/>
		
<lh:MS_TableColumn
			ColName="MaxPerDay"
			DispName="Max Per Day"
			Type="Integer"
			View="Yes"
			Required="No"
			 />

		<lh:MS_TableColumn
			ColName="UseRoundRobin"
			DispName="Use Round Robin?"
			Type="CheckBox"
			View="No"
			Required="No"
			onvalue="1"
			offValue="0" />

</lh:MS_Table>

</body>
</html>
