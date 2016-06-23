<CFPARAM NAME="sales" DEFAULT="InHouse">

<CFQUERY datasource="#request.dsn#" NAME="Read_CustomerService">
	Select * from companies
	where company = '#company#'
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_isales">
	SELECT username, ID, fname + ' ' + lname AS Name
	FROM   First_Admin
	WHERE  (role_id = 15)
	ORDER BY fname + ' ' + lname
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_osales">
	SELECT username, ID, fname + ' ' + lname AS Name
	FROM   First_Admin
	WHERE  (role_id = 24)
	ORDER BY fname + ' ' + lname
</CFQUERY>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>
						<table>
<CFFORM METHOD=POST ACTION="https://#cgi.server_name#/admin_area/client_add_submit.cfm?uid=#URL.uid#&al=#URL.al#&company=#company#">
										<tr>
											<td width=498 colspan=2 align=left valign=top bgcolor=e6e6e6>
												<font size=2 color=blue face=verdana>
												Client Origination -
											</td>
											<td width=498 colspan=2 align=left valign=top bgcolor=e6e6e6>
												<Input type="radio" Name="Sales" Value="InHouse" <CFIF #Sales# eq "InHouse">
																							Checked
																								</CFIF>
												onClick="submit()"
												>In House
												<Input type="radio" Name="Sales" Value="OutsideSales" <CFIF #Sales# eq "OutsideSales">
																								Checked
																							</CFIF>
												onClick="submit()"
												>Outside Sales
											</td>
										</tr>
										<CFIF #Sales# eq "InHouse">
									<CFSELECT Name="NewName2"
										QUERY="read_isales"
										Value="username"
										Display="Name">
									</CFSELECT>
									</CFIF>
									<CFIF #Sales# eq "OutsideSales">
									<CFSELECT Name="NewName3"
										QUERY="read_osales"
										Value="username"
										Display="Name">
									</CFSELECT>
									</CFIF>
								</td>
							</tr>

</CFFORM>

								</table>


</BODY>
</HTML>
