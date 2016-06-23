<cfset id_to_use = 0>
<cfif (IsDefined("session.comp_id") and session.comp_id neq 0)>
<cfset id_to_use = session.comp_id>
<cfelseif (IsDefined("url.comp_id") and url.comp_id neq 0)>
<cfset id_to_use = url.comp_id>
</cfif>

<cfif id_to_use neq 0>
<CFQUERY datasource="#request.dsn#" NAME="check_streamline">
    SELECT streamline_client
    FROM companies
    WHERE ID = '#id_to_use#'
    ORDER BY company ASC
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="check_JVI">
    SELECT company
    FROM companies
    WHERE ID = '#id_to_use#'
</CFQUERY>




<cfif check_streamline.streamline_client eq 'True'>
<cfset session.site.long_name = 'Streamline Title & Escrow'>
<cfset session.site.short_name = 'Streamline Title'>
<cfset session.site.site_initials = 'ST'>
<cfset session.site.url = 'www.streamline-title.com'>
<cfelse>
<cfset session.site.long_name = 'First Title & Escrow'>
<cfset session.site.short_name = 'First Title'>
<cfset session.site.site_initials = 'FT'>
<cfset session.site.url = 'www.firsttitleservices.com'>
</cfif>
</cfif>

<cfif check_JVI.company contains 'Bryn Mawr' or Mid(check_JVI.company, 1, 3) eq 'BMA'>
<cfset session.site.long_name = 'Bryn Mawr Abstract'>
<cfset session.site.short_name = 'Bryn Mawr Abstract'>
<cfset session.site.site_initials = 'BMA'>
<cfset session.site.url = 'www.firsttitleservices.com'>
</cfif>






<cfif IsDefined("session.comp_id") and IsDefined("session.master_co_id")>

<cfif session.comp_id eq 5765 or session.master_co_id eq 5765>
<a href="./"><img src="../client/images/FT_JVI_header_logo.jpg" border="0" alt="First Title Services Homepage" height="110" width="220"></a>
<cfelseif session.site.site_initials eq 'BMA'>
<!---<a href="./"><img src="../client/images/FT_BMA_header_logo.jpg" border="0" alt="First Title Services / Bryn Mawr Abstract Homepage" height="110" width="220"></a>--->
<a href="./"><img src="../client/images/FT_header_logo.jpg" border="0" alt="First Title Services / Bryn Mawr Abstract Homepage" height="110" width="220"></a>
<cfelseif session.comp_id eq 2786 or session.master_co_id eq 2786 or session.site.site_initials eq 'ST'>
<a href="./"><img src="../client/images/streamline_header_logo.jpg" border="0" alt="Streamline Title Homepage" height="110" width="220"></a>
<cfelse>
<a href="./"><img src="../client/images/FT_header_logo.jpg" border="0" alt="First Title Services Homepage" height="110" width="220"></a>
</cfif>
<cfelse>
<cfif session.site.site_initials eq 'ST'>
<a href="./"><img src="../client/images/streamline_header_logo.jpg" border="0" alt="Streamline Title Homepage" height="110" width="220"></a>
<cfelseif session.site.site_initials eq 'BMA'>
<!---<a href="./"><img src="../client/images/FT_BMA_header_logo.jpg" border="0" alt="First Title Services / Bryn Mawr Abstract Homepage" height="110" width="220"></a>--->
<a href="./"><img src="../client/images/FT_header_logo.jpg" border="0" alt="First Title Services / Bryn Mawr Abstract Homepage" height="110" width="220"></a>
<cfelse>
<a href="./"><img src="../client/images/FT_header_logo.jpg" border="0" alt="First Title Services Homepage" height="110" width="220"></a>
</cfif>


</cfif>