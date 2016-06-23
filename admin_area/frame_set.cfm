
<CFPARAM NAME="a_fname" DEFAULT="">
<CFPARAM NAME="a_lname" DEFAULT="">
<CFPARAM NAME="a_user" DEFAULT="">
<CFPARAM NAME="a_date" DEFAULT="">
<CFPARAM NAME="a_time" DEFAULT="">
<CFPARAM NAME="a_ip" DEFAULT="">
	<!---<CFQUERY datasource="#request.dsn#" NAME="read_user">

			select * from login_history
			 where a_fname = '#a_fname#'
			 and a_lname = '#a_lname#' and a_user = '#a_user#' and a_date = '#DateFormat(Now(), "mm/dd/yyyy")#' and a_time = '#TimeFormat(Now(), "HH:mm:ss")#' and a_ip = '#CGI.remote_addr#'

	</CFQUERY>--->


<HTML>
<HEAD>
<TITLE>First Title Services - Admin Frame Set</TITLE>
<style> 
ul { margin-left: 467px;
			margin-right: 150px; 
			margin-top: 10px;
}

</style>
</HEAD>


<CFOUTPUT>

<FRAMESET FRAMEBORDER="0" FRAMESPACING="0" BORDER="0" cols="*,840,*" name="top_frame">
<ul> 
		<!--- New Reports Menu --->
       <cfinclude template="/admin_area/met/ricks_page.cfm">
	</ul>

    <FRAME SRC="https://#CGI.SERVER_NAME#/admin_area/blank.htm" NAME="one" border=0 frameborder=0 MARGINHEIGHT="0" MARGINWIDTH="0" SCROLLING="no">

	<FRAME SRC="https://#CGI.SERVER_NAME#/admin_area/frame_set_admin.cfm?uid=#uid#&al=#al#" NAME="two" border=0 frameborder=0 MARGINHEIGHT="0" MARGINWIDTH="0" SCROLLING="no">

	<FRAME SRC="https://#CGI.SERVER_NAME#/admin_area/blank.htm" NAME="content" border=0 frameborder=0 MARGINHEIGHT="0" MARGINWIDTH="0" SCROLLING="auto">


</FRAMESET><noframes></noframes>

</CFOUTPUT>

<BODY BGCOLOR="#FFFFFF" TEXT="#000000" topmargin="0" leftmargin="0" MARGINHEIGHT="0" MARGINWIDTH="0">

<basefont face=arial>

</BODY>
</HTML>
