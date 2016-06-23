<cfimport prefix="lh" taglib="../Lighthouse/Tags">


<cfset pg_title = "Vendor Services">

<html>
<head>
<script type="text/javascript" src="../Lighthouse/dojo/dojo.js"></script>
<script type="text/javascript" src="../Lighthouse/Resources/js/lighthouse_all.js"></script>
<link rel=stylesheet href="../Lighthouse/Resources/css/MSStandard.css" type="text/css">
</head>
<body>


<lh:MS_Table
	table="vendor_service"
	title="#pg_title#"
	dsn="#request.dsn#"
	resourcesDir="../Lighthouse/Resources"
	defaultaction="View"
	
	>

<lh:MS_TableColumn
		ColName="vendor_service_ID"
		DispName="ID"
		type="integer"
		PrimaryKey="true"
		Identity="true" />	

	
	
		
<lh:MS_TableColumn
		ColName="vendor_service_name"
		DispName="Name"
		type="text"
		Length="200"
		view="Yes"
		required="yes"
		
		 />
		
<lh:MS_TableColumn
		ColName="vendor_service_dbname"
		DispName="Database Name(no spaces allowed)"
		type="text"
		Length="200"
		view="Yes"
		required="yes"
		
		 />

</lh:MS_Table>

</body>
</html>
