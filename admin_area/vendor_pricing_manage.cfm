<cfimport prefix="lh" taglib="../Lighthouse/Tags">


<cfset pg_title = "Vendor Pricing">

<html>
<head>
<script type="text/javascript" src="../Lighthouse/dojo/dojo.js"></script>
<script type="text/javascript" src="../Lighthouse/Resources/js/lighthouse_all.js"></script>
<link rel=stylesheet href="../Lighthouse/Resources/css/MSStandard.css" type="text/css">
</head>
<body>


<lh:MS_Table
	table="vendor_pricing"
	title="#pg_title#"
	dsn="#request.dsn#"
	resourcesDir="../Lighthouse/Resources"
	defaultaction="Search"
	
	>

<lh:MS_TableColumn
		ColName="billing_id"
		DispName="ID"
		type="integer"
		PrimaryKey="true"
		Identity="true" />	

	
<lh:MS_TableColumn
		ColName="vendor_id"
		DispName="Vendor"
		Type="select"
		FKTable="vendors_stacie"
		FKDescr="company +' '+ fname + ' ' + lname"
		FKColName="vendor_id"
		View="Yes"
		Editable="No"
		Search="Yes"
		required="yes"
		SelectQuery="select distinct(vendor_id) as selectValue, company as selectText from vendors_stacie where company <> '' order by company"
		/>
		
<lh:MS_TableColumn
		ColName="service_type"
		DispName="Service Type"
		Type="text"
		FKTable="vendor_service"
		FKDescr="vendor_service_dbname"
		FKColName="vendor_service_dbname"
		View="Yes"
		Search="Yes"
		required="yes"
		
		/>	
		
<lh:MS_TableColumn
		ColName="state"
		DispName="State"
		type="text"
		Length="100"
		view="Yes"
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
		ColName="full_search"
		DispName="Full Search"
		type="integer"
		view="No"
		required="no"
		search="no"
		 />
		 
<lh:MS_TableColumn
		ColName="current_owner"
		DispName="Current Owner"
		type="integer"
		view="No"
		required="no"
		search="no"
		 />
		 
<lh:MS_TableColumn
		ColName="doc_retrieval"
		DispName="Doc Retrieval"
		type="integer"
		view="No"
		required="no"
		search="no"
		 />
		 
<lh:MS_TableColumn
		ColName="two_owner"
		DispName="Two Owner"
		type="integer"
		view="No"
		required="no"
		search="no"
		 />
		 
<lh:MS_TableColumn
		ColName="reo_fee"
		DispName="REO Fee"
		type="integer"
		view="No"
		required="no"
		search="no"
		 />
		 
<lh:MS_TableColumn
		ColName="orderentry_fee"
		DispName="Order Entry Fee"
		type="integer"
		view="No"
		required="no"
		search="no"
		 />
		 
<lh:MS_TableColumn
		ColName="recording_fee"
		DispName="Recording Fee"
		type="integer"
		view="No"
		required="no"
		search="no"
		 />
		

</lh:MS_Table>

</body>
</html>
