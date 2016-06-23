<cfparam name="url.action" default="">



<cfif url.action eq 'd'>
<CFQUERY datasource="#request.dsn#" NAME="get_vendor">
delete  from vendor_routing_table
where ID = #url.ID#
</CFQUERY>
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="get_vendor">
select * from vendor_routing_table
order by state, county
</CFQUERY>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css" media="screen">
body, TD {
font: 10px verdana, arial, sans-serif;
}
input {
font: 9px verdana, arial, sans-serif;
}
select, option {
font: 9px verdana, arial, sans-serif;
}
.header {
font: 14px verdana, arial, sans-serif;
}
</style>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Untitled Document</title>

<body>
<div align="left">
<form action="vendor_routing_upload.cfm" method="post" enctype="multipart/form-data" name="abstractor_form">
<table with="300" cellpadding="2" cellspacing="1" border=1>
<tr>
<Td align="left" valign="top"><a href="/vendor_pricing/vendor_pricing_export.cfm" target="_new">Export Current Routing Table</a><br>
</Td>
</tr>
<tr>
<Td align="left" valign="top">Upload New Routing Table Excel File<br>
<input type="file" name="routing_upload" style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: white;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none; width: 250px;">
</Td>
</tr>
<tr>
<Td align="left" valign="top"><input name="submit" type="submit" style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: white;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" value="Upload">

</Td>
</tr>
</table>
</form>
</div>
<br>
<br>

CURRENT ROUTING TABLE
<td><table bgcolor=000000 cellspacing=1 width=930>
<tr>
<td bgcolor=ffffff width=30>State</td>
<td bgcolor=ffffff width=75>County</td>
<td bgcolor=ffffff width=75>C/O 1st Tier</td>
<td bgcolor=ffffff width=75>C/O 1st Tier Email</td>
<td bgcolor=ffffff width=75>C/O 2nd Tier</td>
<td bgcolor=ffffff width=75>C/O 2nd Tier Email</td>
<td bgcolor=ffffff width=75>2/O 1st Tier</td>
<td bgcolor=ffffff width=75>2/O 1st Tier Email</td>
<td bgcolor=ffffff width=75>2/O 2nd Tier</td>
<td bgcolor=ffffff width=75>2/O 2nd Tier Email</td>
<td bgcolor=ffffff width=75>Full Search</td>
<td bgcolor=ffffff width=75>Full Search Email</td>
<td bgcolor=ffffff width=75>&nbsp;</td>
</tr>
<cfoutput query="get_vendor">
<tr>
<td bgcolor=ffffff>#get_vendor.state#</td>
<td bgcolor=ffffff>#get_vendor.County#</td>
<td bgcolor=ffffff>#get_vendor.Current_Owner_1st_Tier#</td>
<td bgcolor=ffffff>#get_vendor.Current_Owner_1st_Tier_Email#</td>
<td bgcolor=ffffff>#get_vendor.Current_Owner_2nd_Tier#</td>
<td bgcolor=ffffff>#get_vendor.Current_Owner_2nd_Tier_Email#</td>
<td bgcolor=ffffff>#get_vendor.Two_Owner_1st_Tier#</td>
<td bgcolor=ffffff>#get_vendor.Two_Owner_1st_Tier_Email#</td>
<td bgcolor=ffffff>#get_vendor.Two_Owner_2nd_Tier#</td>
<td bgcolor=ffffff>#get_vendor.Two_Owner_2nd_Tier_Email#</td>
<td bgcolor=ffffff>#get_vendor.Full_Search#</td>
<td bgcolor=ffffff>#get_vendor.Full_Search_Email#</td>
<td bgcolor=ffffff><A HREF="vendor_routing_table.cfm?action=m&id=#get_vendor.ID#"><img border=0 src="./images/button_m.gif" ALT="Modify this entry"></a>&nbsp;&nbsp;<A HREF="vendor_routing_table.cfm?action=d&id=#get_vendor.ID#" onclick="return confirm('Sure?');"><img border=0 src="./images/button_d.gif" ALT="Delete this entry"></a></td>
</tr>
</cfoutput>
</table>
<script type="text/javascript">



  var _gaq = _gaq || [];

  _gaq.push(['_setAccount', 'UA-195021-17']);

  _gaq.push(['_trackPageview']);



  (function() {

    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;

    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'https://www') + '.google-analytics.com/ga.js';

    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);

  })();



</script>

</body>
</html>
