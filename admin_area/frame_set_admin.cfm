


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

<FRAMESET FRAMEBORDER="0" FRAMESPACING="0" BORDER="0" rows="108,*">


      <FRAME SRC="https://#CGI.SERVER_NAME#/admin_area/menu.cfm?uid=#uid#&al=#al#" NAME="top_nav" border=0 frameborder=0 MARGINHEIGHT="0" MARGINWIDTH="0" SCROLLING="no">


        <FRAME SRC="https://#CGI.SERVER_NAME#/admin_area/blank.cfm?uid=#uid#&al=#al#" NAME="work" border=0 frameborder=0 MARGINHEIGHT="0" MARGINWIDTH="0" SCROLLING="auto">


</FRAMESET><noframes></noframes>


</CFOUTPUT>

<BODY BGCOLOR="#FFFFFF" TEXT="#000000" topmargin="0" leftmargin="0" MARGINHEIGHT="0" MARGINWIDTH="0">
	<ul> 
		<!--- New Reports Menu --->
       <cfinclude template="/admin_area/met/ricks_page.cfm">
	</ul>

<basefont face=arial>

</BODY>
</HTML>


