<cfparam name="ATTRIBUTES.dbtype" default="ODBC">
<cfparam name="ATTRIBUTES.username" default="">
<cfparam name="ATTRIBUTES.password" default="">
<cfparam name="ATTRIBUTES.dbserver" default="">
<cfparam name="ATTRIBUTES.dbname" default="">
<cfparam name="ATTRIBUTES.provider" default="">
<cfparam name="ATTRIBUTES.providerdsn" default="">
<cfparam name="ATTRIBUTES.datasource" default="First_Title_Main_Admin">
<cfparam name="FORM.tableID" default="-1">

<cfquery name="qryGetTables" datasource="#ATTRIBUTES.datasource#">
	SELECT id,name
	FROM sysobjects
	WHERE type = 'U'
	ORDER BY name
</cfquery>

<cfif FORM.tableID IS NOT -1>
<cfquery name="qryGetDBData" datasource="#ATTRIBUTES.datasource#">
	SELECT PK =
			case
				when col.name = index_col (obj.name, ind.indid, 1) then col.name
				when col.name = index_col (obj.name, ind.indid, 2) then col.name
				when col.name = index_col (obj.name, ind.indid, 3) then col.name
				when col.name = index_col (obj.name, ind.indid, 4) then col.name
				when col.name = index_col (obj.name, ind.indid, 5) then col.name
				when col.name = index_col (obj.name, ind.indid, 6) then col.name
				when col.name = index_col (obj.name, ind.indid, 7) then col.name
				when col.name = index_col (obj.name, ind.indid, 8) then col.name
				when col.name = index_col (obj.name, ind.indid, 9) then col.name
				when col.name = index_col (obj.name, ind.indid, 10) then col.name
				when col.name = index_col (obj.name, ind.indid, 11) then col.name
				when col.name = index_col (obj.name, ind.indid, 12) then col.name
				when col.name = index_col (obj.name, ind.indid, 13) then col.name
				when col.name = index_col (obj.name, ind.indid, 14) then col.name
				when col.name = index_col (obj.name, ind.indid, 15) then col.name
				when col.name = index_col (obj.name, ind.indid, 16) then col.name
			end,
			obj.id,
			obj.name AS 'tableName',
			col.name AS 'columnName',
			type.name AS 'dataType',
			col.length,
			col.xprec AS 'precision',
			col.xscale AS 'scale',
			col.isnullable,
			com.text AS 'defaultValue',
			col.status,
			identitySeed =
				case
					when COLUMNPROPERTY(obj.id,col.name,'IsIdentity') = 1 then ident_seed(obj.name)
				end,
			identityIncrement =
				case
					when COLUMNPROPERTY(obj.id,col.name,'IsIdentity') = 1 then ident_incr(obj.name)
				end,
			COLUMNPROPERTY(obj.id,col.name,'IsRowGuidCol') AS 'rowGUID',
			rk.name+'.'+col_name(rk.id,fk2.rkey) AS 'rkey'
		FROM (((sysobjects obj JOIN
			syscolumns col ON obj.id = col.id JOIN
			systypes type ON col.xtype = type.xtype) LEFT JOIN
			(sysobjects def JOIN
			syscomments com ON def.id = com.id) ON def.id = col.cdefault) LEFT JOIN
			(sysobjects pk JOIN
			sysindexes ind ON pk.name = ind.name) ON pk.parent_obj = obj.id AND pk.xtype = 'PK') LEFT JOIN
			(sysobjects fk JOIN
			sysforeignkeys fk2 ON fk.id = fk2.fkeyid JOIN
			sysobjects rk ON rk.id = fk2.rkeyid) ON fk.id = obj.id AND col.colid = fk2.fkey
		WHERE obj.type = 'U' AND obj.id IN (#FORM.tableID#)
		ORDER BY obj.name, col.colorder
	</cfquery>
</cfif>

<html>
<head>
<cfoutput>
<meta name="Author" value="M. Shawn Smith, II">
<meta name="Copyright" value="Copyright #CHR(169)# 2000 Integrated Store Solutions, LLC">
<meta http-equiv="Last-Modified" content="Mon, 21 Feb 2000 12:22:07 CST">
</cfoutput>
<title>DB Report</title>

<style type="text/css">

BODY {
	color: #000000;
	font-family: geneva, verdana, arial, helvetica;
	font-style: normal;
	font-weight: normal;
	font-size: 12px;
	text-decoration: none;
	background-color: #FFFFFF;
	scrollbar-face-color: #9A9575;
	scrollbar-arrow-color:  #1F3273;
	scrollbar-track-color: #CEC89E;
}

TD {
	font-size: 12px;
}

A {
	color: #1F3273;
	text-decoration:underline;
}

A.navItem {
	color: #CEC89E;
	font-size: 11px;
	font-weight: bold;
}

A.function {
	font-size: 10px;
}

A.navItem:hover {
	color: #FFFFFF;
}

A.function:hover {
	color: #FF0000;
}

.small {
	font-size: 11px;
}

.light {
	background: #CEC89E;
}

.med {
	background: #9A9575;
}

.header {
	color: #1F3273;
	font-family: geneva, helvetica, arial, sans serif;
	font-size: 14px;
	font-style: normal;
	font-weight: bold;
	text-decoration: none;
	}

.colHead {
	color: #1F3273;
	font-family: geneva, helvetica, arial, sans serif;
	font-size: 11px;
	font-style: normal;
	font-weight: bold;
	text-decoration: none;
	}

.select {
	color:#000000;
	font-family: verdana, arial, helvetica;
	font-style: normal;
	font-weight: normal;
	font-size: 11px;
	text-decoration: none;
	}

.formbutton {
	font-family : verdana, arial, helvetica;
	font-size : 11px;
	font-weight: bold;
	font-variant: small-caps;
	color : #1F3273;
	background:#CEC89E;
	border-style: solid;
	border-width: 1px;
	border-color: #736F57;
	cursor: hand;
}

</style>

</head>
<body>
	<table cellpadding="3" cellspacing="0" border="0">
		<cfoutput>
		<form action="#CGI.SCRIPT_NAME#" method="post">
		</cfoutput>
			<tr>
				<td colspan="13" class="small">
					<p style="padding-left:10;">
					Select Table(s) to Display
					<p>
					<select name="tableID" size="10" multiple class="select">
						<cfoutput query="qryGetTables">
							<option value="#qryGetTables.id#">#qryGetTables.name#
						</cfoutput>
					</select>
					<p style="padding-left: 40;">
					<input type="Submit" value="Submit" class="formbutton">
				</td>
			</tr>
		</form>
		<cfif FORM.tableID IS NOT -1>
		<cfoutput query="qryGetDBData" group="tableName">
			<tr>
				<td colspan="13">&nbsp;

				</td>
			</tr>
			<tr class="med">
				<td colspan="13" align="center" class="header" style="border-width: 1px; border-color: ##736F57; border-style: solid solid solid solid;">
					#tableName#
				</td>
			</tr>
			<tr class="med">
				<td class="colHead" style="border-width: 1px; border-color: ##736F57; border-style: none solid solid solid;">&nbsp;

				</td>
				<td class="colHead" style="border-width: 1px; border-color: ##736F57; border-style: none solid solid none;">
					Column Name
				</td>
				<td class="colHead" style="border-width: 1px; border-color: ##736F57; border-style: none solid solid none;">
					Datatype
				</td>
				<td class="colHead" style="border-width: 1px; border-color: ##736F57; border-style: none solid solid none;">
					Length
				</td>
				<td class="colHead" style="border-width: 1px; border-color: ##736F57; border-style: none solid solid none;">
					Precision
				</td>
				<td class="colHead" style="border-width: 1px; border-color: ##736F57; border-style: none solid solid none;">
					Scale
				</td>
				<td class="colHead" style="border-width: 1px; border-color: ##736F57; border-style: none solid solid none;">
					Allow Nulls
				</td>
				<td class="colHead" style="border-width: 1px; border-color: ##736F57; border-style: none solid solid none;">
					Default Value
				</td>
				<td class="colHead" style="border-width: 1px; border-color: ##736F57; border-style: none solid solid none;">
					Identity
				</td>
				<td class="colHead" style="border-width: 1px; border-color: ##736F57; border-style: none solid solid none;">
					Identity Seed
				</td>
				<td class="colHead" style="border-width: 1px; border-color: ##736F57; border-style: none solid solid none;">
					Identity Increment
				</td>
				<td class="colHead" style="border-width: 1px; border-color: ##736F57; border-style: none solid solid none;">
					Is RowGuid
				</td>
				<td class="colHead" style="border-width: 1px; border-color: ##736F57; border-style: none solid solid none;">
					Foreign Key
				</td>
			</tr>
			<cfoutput>
				<tr class="light">
					<td class="small" style="border-width: 1px; border-color: ##736F57; border-style: none solid solid solid;">
						<cfif LEN(PK) IS NOT 0 AND PK IS columnName>
							<img src="images/pk.gif" width="19" height="19" alt="PK" border="0">
						<cfelse>
							&nbsp;
						</cfif>
					</td>
					<td class="small" style="border-width: 1px; border-color: ##736F57; border-style: none solid solid none;">
						#columnName#
					</td>
					<td class="small" style="border-width: 1px; border-color: ##736F57; border-style: none solid solid none;">
						#dataType#
					</td>
					<td class="small" style="border-width: 1px; border-color: ##736F57; border-style: none solid solid none;">
						#length#
					</td>
					<td class="small" style="border-width: 1px; border-color: ##736F57; border-style: none solid solid none;">
						#precision#
					</td>
					<td class="small" style="border-width: 1px; border-color: ##736F57; border-style: none solid solid none;">
						#scale#
					</td>
					<td align="center" class="small" style="border-width: 1px; border-color: ##736F57; border-style: none solid solid none;">
						<cfif isnullable>
							<img src="images/checked.gif" width="19" height="19" alt="yes" border="0">
						<cfelse>
							<img src="images/unchecked.gif" width="19" height="19" alt="no" border="0">
						</cfif>
					</td>
					<td class="small" style="border-width: 1px; border-color: ##736F57; border-style: none solid solid none;">
						<cfif LEN(defaultValue) IS NOT 0>
							#defaultValue#
						<cfelse>
							&nbsp;
						</cfif>
					</td>
					<td align="center" class="small" style="border-width: 1px; border-color: ##736F57; border-style: none solid solid none;">
						<cfif status IS 128>
							<img src="images/checked.gif" width="19" height="19" alt="yes" border="0">
						<cfelse>
							<img src="images/unchecked.gif" width="19" height="19" alt="no" border="0">
						</cfif>
					</td>
					<td class="small" style="border-width: 1px; border-color: ##736F57; border-style: none solid solid none;">
						<cfif LEN(identitySeed) IS NOT 0>
							#identitySeed#
						<cfelse>
							&nbsp;
						</cfif>
					</td>
					<td class="small" style="border-width: 1px; border-color: ##736F57; border-style: none solid solid none;">
						<cfif LEN(identityIncrement) IS NOT 0>
							#identityIncrement#
						<cfelse>
							&nbsp;
						</cfif>
					</td>
					<td align="center" class="small" style="border-width: 1px; border-color: ##736F57; border-style: none solid solid none;">
						<cfif rowGuid IS 1>
							<img src="images/checked.gif" width="19" height="19" alt="yes" border="0">
						<cfelse>
							<img src="images/unchecked.gif" width="19" height="19" alt="no" border="0">
						</cfif>
					</td>
					<td class="small" style="border-width: 1px; border-color: ##736F57; border-style: none solid solid none;">
						<cfif LEN(rkey) IS NOT 0>
							ref: #rkey#
						<cfelse>
							&nbsp;
						</cfif>
					</td>
				</tr>
			</cfoutput>
			<tr>
				<td colspan="13">&nbsp;

				</td>
			</tr>
		</cfoutput>
		</cfif>
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
