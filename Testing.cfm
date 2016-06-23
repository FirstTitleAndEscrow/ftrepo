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


