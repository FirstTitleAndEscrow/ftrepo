<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>jQuery UI Menu - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script>
  $(function() {
    $( "#menu" ).menu();
  });
  </script>
  <style>
  .ui-menu { width: 300px; }
  </style>
</head>
<body>
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
								<cfoutput><li><a title="#report_Desc#" onClick="Refresh();" href="#URL#?uid="#User_Id# target="#Report_Name#">#Report_Name#</a></li></cfoutput>
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
</body>
</html>