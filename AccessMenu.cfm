<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>jQuery UI Menu - Default functionality</title>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
<!---<link rel="stylesheet" href="/resources/demos/style.css" />--->
<script>
$(function() {
$("#menu" ).menu();
});


$(function() {
$(document ).tooltip();

});

function Refresh() {
child.location.reload(true);
}
</script>
<style>
	a{
		font-family:Arial;			
	}
	
#MainMenu
{
	background-color:"#58B0EB";
}
.ui-menu { width: 270px;
			font: Arial;
			font-size: small; 	
			display: inline-table;
			}
 
 .ui-tooltip {
 	background-image: none;
	background-color: #f7f792; 
    display: inline-block;
	font: Verdana;
	font-size:x-small;	
  }
  ul li:nth-child(2n) {
    background-color: #BCBCBC;
}

ul li:nth-child(2n+1) {
    background-color: #DEDEDE;
}

</style>
</head>
<body>

<cfset User_Id=session.ft_user_id>	
<cfinvoke component="cfc.MainMenu" method="GetMenuHead" returnvariable="GetMenuHeadRet"> 
	<cfinvokeargument name="User_Id" value="#User_Id#"/>
</cfinvoke>
	
<ul id="menu">
	<li>			
		<a id="MainMenu" href="#">Reports and tools</a>
		<ul>
		<cfloop query="GetMenuHeadRet">
			<cfif GetMenuHeadRet.recordcount gt 0>
			<li style="background-color:#E6E6E6;">
				<cfoutput><a href="##">#Description#</a></cfoutput>
				<cfinvoke component="cfc.MainMenu"  method="GetMenuItem" returnvariable="GetMenuItemRet">
					<cfinvokeargument name="menukey" value="#ID#"/>
					<cfinvokeargument name="User_Id" value="#User_Id#"/>
				</cfinvoke>
				
				<ul>
					<cfif GetMenuItemRet.recordcount gt 0>
						<cfloop query="GetMenuItemRet">													
								<cfoutput><li><a title="#report_Desc#" onClick="Refresh();" href="#URL#?uid=#session.ft_user_id#&al=0#url_vars#" target="#Report_Name#">#Report_Name#</a></li></cfoutput>
						</cfloop>
					</cfif>
				</ul>
			</li>
			</cfif>
		</cfloop>
	  </ul>
	</li>
</ul>
</body>
</html>