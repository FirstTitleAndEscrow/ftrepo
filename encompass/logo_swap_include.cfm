<cfif IsDefined("session.comp_id") and IsDefined("session.master_co_id")>
<cfif session.comp_id eq 2786 or session.master_co_id eq 2786>
<a href="./"><img src="../client/images/streamline_header_logo.jpg" border="0" alt="Streamline Title Homepage" height="110" width="220"></a>
<cfelse>
<a href="./"><img src="../client/images/FT_header_logo.jpg" border="0" alt="First Title Services Homepage" height="110" width="220"></a>
</cfif>
<cfelse>
<a href="./"><img src="../client/images/FT_header_logo.jpg" border="0" alt="First Title Services Homepage" height="110" width="220"></a>
</cfif>