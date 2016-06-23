<cfFORM NAME="Search" METHOD="post" ACTION="./title_committment_view_first_american.cfm?rec_id=#rec_id#&a_trigger=22">
  <FONT FACE=ARIAL SIZE=2 color="black">Enter email to send </font><input type=text name="email" size=20 maxlength=100
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;"
								> <cfoutput><input type="image" src="https://#cgi.server_name#/admin_area/images/button_submit.gif" border=0 alt="send email"></cfoutput>
</cfFORM>
<cfif #a_trigger# eq 22>
    <FONT FACE=ARIAL SIZE=2 color="blue">Email sent
</cfif>
</NOBR>

 <hr size="1" color="dimgray">

</div>

<cfinclude template="title_commitment_templates/first_american_web.cfm">

