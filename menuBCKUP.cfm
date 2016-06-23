<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE><cfoutput>#session.site.short_name#</cfoutput> Admin</TITLE>
</HEAD>
<BODY BGCOLOR=e1e1e1 TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>
<CENTER>
<table width=826 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=826 align=center valign=top>
<table width=825 cellpadding=0 cellspacing=0 border=0 bgcolor=DAD7DA >
	<tr>
		<td width=825  align=left valign=top bgcolor=e3e3e3>


						<cfif #url.al# eq 1>

			<table width=824 cellpadding=0 cellspacing=0 border=0  background="./images/back_top_buttons.gif">



			<tr><td width=92 align=center valign=top><img src="./images/title_client.gif"></td><td width=92 align=center valign=top><img src="./images/title_users.gif"></td><td width=92 align=center valign=top><img src="./images/title_closers.gif"></td><!--- <td width=92 align=center valign=top><img src="./images/title_examiners.gif"></td> ---><td width=92 align=center valign=top><img src="./images/title_appraisers.gif"></td><td width=92 align=center valign=top><img src="./images/title_abstractors.gif"></td><td width=92 align=center valign=top><img src="./images/title_tp.gif"></td><td width=92 align=center valign=top><img src="./images/title_lenders.gif"></td><td width=92 align=center valign=top><img src="./images/title_FT_Agencies.gif"></td><td width=92 align=center valign=top><img src="./images/title_title_ins_co.gif"></td></tr>


<CFOUTPUT>	<tr><td width=92 align=center valign=top><NOBR><img src="./images/clear.gif" height=19 width=1><a href="./client_add.cfm?uid=#URL.uid#&al=#URL.al#" target=work><img src="./images/button_add-2.gif" border=0 ALT="Add a new Client to the database"></a><a href="./client_modify.cfm?uid=#URL.uid#&al=#URL.al#" target=work><img src="./images/button_mod-2.gif" border=0 ALT="Modify an existing Client"></NOBR></td><td width=92 align=center valign=top><NOBR><a href="./user_add.cfm?uid=#URL.uid#&al=#URL.al#" target=work><img src="./images/button_add-2.gif" border=0 ALT="Add a new User to the database"></a><a href="./user_modify.cfm?uid=#URL.uid#&al=#URL.al#" target=work><img src="./images/button_mod-2.gif" border=0 ALT="Modify an existing User"></a></NOBR></td><td width=92 align=center valign=top><NOBR><a href="./closer_add.cfm?uid=#URL.uid#&al=#URL.al#" target=work><img src="./images/button_add-2.gif" border=0 ALT="Add a new Closer to the database"></a><a href="./closer_modify.cfm?uid=#URL.uid#&al=#URL.al#" target=work><img src="./images/button_mod-2.gif" border=0 ALT="Modify an existing Closer"></a></NOBR></td><td width=92 align=center valign=top><NOBR><a href="https://#cgi.server_name#/admin_area/appraisers_add.cfm?uid=#URL.uid#&al=#URL.al#" target=work><img src="./images/button_add-2.gif" border=0 ALT="Add an Appraiser to the database"></a><a href="https://#cgi.server_name#/admin_area/appraisers_modify.cfm?uid=#URL.uid#&al=#URL.al#" target=work><img src="./images/button_mod-2.gif" border=0 ALT="Modify an existing Appraiser"></a></NOBR></td><td width=92 align=center valign=top><NOBR><a href="https://#cgi.server_name#/admin_area/abstractors_add.cfm?uid=#URL.uid#&al=#URL.al#" target=work><img src="./images/button_add-2.gif" border=0 ALT="Add an Abstractor to the database"></a><a href="https://#cgi.server_name#/admin_area/abstractors_modify.cfm?uid=#URL.uid#&al=#URL.al#" target=work><img src="./images/button_mod-2.gif" border=0 ALT="Modify an existing Abstractor"></a></NOBR></td>
<td width=92 align=center valign=top><NOBR><a href="./tp_add.cfm?uid=#URL.uid#&al=#URL.al#" target=work><img src="./images/button_add-2.gif" border=0 ALT="Add a new Third Party to the database"></a><a href="./tp_modify.cfm?uid=#URL.uid#&al=#URL.al#" target=work><img src="./images/button_mod-2.gif" border=0 ALT="Modify an existing Third Party"></a></NOBR></td>

<td width=92 align=center valign=top><NOBR><a href="https://#cgi.server_name#/admin_area/lenders_add.cfm?uid=#URL.uid#&al=#URL.al#" target=work><img src="./images/button_add-2.gif" border=0 ALT="Add a New Lender to the Database"></a><a href="https://#cgi.server_name#/admin_area/lenders_modify_select.cfm?uid=#URL.uid#&al=#URL.al#" target=work><img src="./images/button_mod-2.gif" border=0 ALT="Modify an existing Lender"></a></NOBR></td><td width=92 align=center valign=top><NOBR><a href="https://#cgi.server_name#/admin_area/title_FT_Agency_add.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=0&company_id=0" target="work" ><img src="./images/button_add-2.gif" border=0 ALT="Add a New FT Agency"></a><a href="https://#cgi.server_name#/admin_area/Title_FT_Agency_Modify_Select.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=0&company_id=0" target="work" ><img src="./images/button_mod-2.gif" border=0 ALT="Modify a FT Agency"></a></NOBR></td><td width=92 align=center valign=top><NOBR><a href="https://#cgi.server_name#/admin_area/Title_Ins_Co_Add.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=0&company_id=0" target="work" ><img src="./images/button_add-2.gif" border=0 ALT="Add a New Title Ins. Company"></a><a href="https://#cgi.server_name#/admin_area/Title_Ins_Co_Modify_Select.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=0&company_id=0" target="work" ><img src="./images/button_mod-2.gif" border=0 ALT="Modify a Title Ins.  Company"></a></NOBR></td></tr><tr><td bgcolor=gray width=823 colspan=9 align=center valign=top><img src="./images/clear.gif" height=1 width=819></td></tr>
		</table>
		</td>
	</tr></table>
      <table width=825 cellpadding=0 cellspacing=0 border=0 background="./images/logo_menu_1.gif">
        <tr>
          <td width=234 align=center valign=top ></td>
		  <td width=154 align=center valign=top ><img src="./images/clear.gif" height=2 width=153><br>
       <td width=464 align=left valign=top >
            <table width=435 cellpadding=0 cellspacing=0 border=0 >
              <tr>
                <td colspan=2  align=left valign=top >
                  <nobr><img src="./images/title_reports.gif"></nobr></td>
                <td colspan=3 align=left valign=bottom><nobr>
                 <img src="./images/title_support_db.gif"></nobr></td>
              </tr>


			  <tr>

				 <td width=537 colspan=7 align=right valign=top >
				 <nobr>


				 <a href="https://#cgi.server_name#/admin_area/title_rep_view.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="work"><img src="./images/button_ft_orders.gif" border=0 ALT="View the existing Product Reports"></a>
				 &nbsp;&nbsp;&nbsp;&nbsp;<a href="https://#cgi.server_name#/admin_area/vendor_coverage.cfm?uid=#URL.uid#&al=#URL.al#" target="work"><img src="./images/button_vendor_cov.gif" border=0 ALT="Coverage Areas of vendors"></a>
              <a href="https://#cgi.server_name#/admin_area/First_title_states_served_modify.cfm?uid=#URL.uid#&al=#URL.al#" target="work" ><img src="./images/button_states_served.gif" border=0 ALT="Manage the States Served by First Title Services"></a>
               <a href="https://#cgi.server_name#/admin_area/rec_fees_view.cfm?uid=#URL.uid#&al=#URL.al#" target="work"><img src="./images/button_rec_fees.gif" border=0 ALT="View Recording Fees Schedule"></a>
               <a href="https://#cgi.server_name#/admin_area/ins_fees_choose.cfm?uid=#URL.uid#&al=#URL.al#" target="work"><img src="./images/button_ins_fees.gif" border=0 ALT="Review the Insurance Fees Schedule for each State"></a>
             <a href="https://#cgi.server_name#/admin_area/calculator.cfm?uid=#URL.uid#&al=#URL.al#" target="work"><img src="./images/button_ins_calc.gif" border=0 ALT="Check title Insurance Fees"></a></nobr></td>

			  </tr>
          <tr>
                <td colspan=3 align=center valign=bottom>
			&nbsp;&nbsp;&nbsp;<img src="./images/title_reports-events.gif" border=0 ALT=""></td>
              </td><td colspan=2 align=right valign=bottom></td>
						  </tr>
              <tr>
                <td colspan=3 align=right valign=top > <NOBR>
<a href="https://www.#cgi.server_name#/admin_area/Calendar_company.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=0&company_id=0" target="work"><img src="./images/button_calendar.gif" border=0 ALT="View the Calendar of Event Dates"></a><a href="https://#cgi.server_name#/admin_area/statistics_select.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="work"><img src="./images/button_statistics.gif" border=0 ALT="View the various report statistics"></a>
			<a href="https://#cgi.server_name#/admin_area/weblinks_search.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=0&company_id=0" target="work"><img src="./images/button_web_link.gif" border=0 ALT="Search for public records links"></a>
<cfif #url.uid# neq "92" and #url.uid# neq "93" and #url.uid# neq "167" and #url.uid# neq "185">
				<a href="./monitor_user.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="work"><img border=0 src="./images/button_user_monitor.gif"></a> </cfif>
 </td><td colspan=2 align=right valign=top > <NOBR>
 <cfFORM NAME="Search" METHOD="post" ACTION="./title_REP_display_single.cfm?uid=#URL.uid#&al=#URL.al#" >
  <FONT FACE=ARIAL SIZE=2 color="gray">Quick Search</font><input type=text name="number" size=10 maxlength=15
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
								><input type="image" src="https://#cgi.server_name#/admin_area/images/button_search.gif" border=0 alt="Quick file search">
</cfFORM></NOBR>
</td>
              </tr>
            </table>
			</CFOUTPUT>
		<!--- user_monitor --->
		<cfelseif #url.al# eq 0>


					<table width=824 cellpadding=0 cellspacing=0 border=0  background="./images/back_top_buttons.gif">



			<tr><td width=92 align=center valign=top><img src="./images/title_client.gif"></td><td width=92 align=center valign=top><img src="./images/title_users.gif"></td><td width=92 align=center valign=top><img src="./images/title_closers.gif"></td><td width=92 align=center valign=top><img src="./images/title_appraisers.gif"></td><td width=92 align=center valign=top><img src="./images/title_abstractors.gif"></td><td width=92 align=center valign=top><img src="./images/title_tp.gif"></td><td width=92 align=center valign=top><img src="./images/title_lenders.gif"></td><td width=92 align=center valign=top><img src="./images/title_FT_Agencies.gif"></td><td width=92 align=center valign=top><img src="./images/title_title_ins_co.gif"></td></tr>


<CFOUTPUT>	<tr><td width=92 align=center valign=top><NOBR><img src="./images/clear.gif" height=19 width=1><a href="./client_add.cfm?uid=#URL.uid#&al=#URL.al#" target=work><img src="./images/button_add-2.gif" border=0 ALT="Add a new Client to the database"></a><a href="./client_modify.cfm?uid=#URL.uid#&al=#URL.al#" target=work><img src="./images/button_mod-2.gif" border=0 ALT="Modify an existing Client"></NOBR></td><td width=92 align=center valign=top><NOBR><a href="./user_add.cfm?uid=#URL.uid#&al=#URL.al#" target=work><img src="./images/button_add-2.gif" border=0 ALT="Add a new User to the database"></a><img src="./images/button_mod-2.gif" border=0 ALT="Modify an existing User"></a></NOBR></td><td width=92 align=center valign=top><NOBR><a href="./closer_add.cfm?uid=#URL.uid#&al=#URL.al#" target=work><img src="./images/button_add-2.gif" border=0 ALT="Add a new Closer to the database"></a><img src="./images/button_mod-2.gif" border=0 ALT="Modify an existing Closer"></a></NOBR></td><td width=92 align=center valign=top><NOBR><a href="https://#cgi.server_name#/admin_area/appraisers_add.cfm?uid=#URL.uid#&al=#URL.al#" target=work><img src="./images/button_add-2.gif" border=0 ALT="Add an Appraiser to the database"></a><img src="./images/button_mod-2.gif" border=0 ALT="Modify an existing Appraiser"></a></NOBR></td><td width=92 align=center valign=top><NOBR><a href="https://#cgi.server_name#/admin_area/abstractors_add.cfm?uid=#URL.uid#&al=#URL.al#" target=work><img src="./images/button_add-2.gif" border=0 ALT="Add an Abstractor to the database"></a><img src="./images/button_mod-2.gif" border=0 ALT="Modify an existing Abstractor"></a></NOBR></td>
<td width=92 align=center valign=top><NOBR><a href="./tp_add.cfm?uid=#URL.uid#&al=#URL.al#" target=work><img src="./images/button_add-2.gif" border=0 ALT="Add a new Third Party to the database"></a><img src="./images/button_mod-2.gif" border=0 ALT="Modify an existing Third Party"></a></NOBR></td>


<td width=92 align=center valign=top><NOBR><a href="https://#cgi.server_name#/admin_area/lenders_add.cfm?uid=#URL.uid#&al=#URL.al#" target=work><img src="./images/button_add-2.gif" border=0 ALT="Add a New Lender to the Database"></a><img src="./images/button_mod-2.gif" border=0 ALT="Modify an existing Lender"></a></NOBR></td><td width=92 align=center valign=top><NOBR><a href="https://#cgi.server_name#/admin_area/title_FT_Agency_add.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=0&company_id=0" target="work" ><img src="./images/button_add-2.gif" border=0 ALT="Add a New FT Agency"></a><img src="./images/button_mod-2.gif" border=0 ALT="Modify a FT Agency"></a></NOBR></td><td width=92 align=center valign=top><NOBR><a href="https://#cgi.server_name#/admin_area/Title_Ins_Co_Add.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=0&company_id=0" target="work" ><img src="./images/button_add-2.gif" border=0 ALT="Add a New Title Ins. Company"></a><img src="./images/button_mod-2.gif" border=0 ALT="Modify a Title Ins.  Company"></a></NOBR></td></tr><tr><td bgcolor=gray width=823 colspan=9 align=center valign=top><img src="./images/clear.gif" height=1 width=819></td></tr>
		</table>
		</td>
	</tr></table>
      <table width=825 cellpadding=0 cellspacing=0 border=0 background="./images/logo_menu_1.gif">
        <tr>
          <td width=234 align=center valign=top ></td>
		  <td width=154 align=center valign=top ><td width=464 align=left valign=top >
            <table width=435 cellpadding=0 cellspacing=0 border=0 >
              <tr>
                <td colspan=3  align=center valign=top >
                  <nobr><img src="./images/title_reports.gif"></nobr></td>
                <td colspan=3 align=left valign=bottom><nobr>
                 <img src="./images/title_support_db.gif"></nobr></td>
              </tr>
              <tr>

				 <td width=537 colspan=7 align=right valign=top >
				 <nobr><a href="https://#cgi.server_name#/admin_area/title_rep_view.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="work"><img src="./images/button_ft_orders.gif" border=0 ALT="View the existing Product Reports"></a>
				 &nbsp;&nbsp;&nbsp;&nbsp;<a href="https://#cgi.server_name#/admin_area/vendor_coverage.cfm?uid=#URL.uid#&al=#URL.al#" target="work"><img src="./images/button_vendor_cov.gif" border=0 ALT="Coverage Areas of vendors"></a>
           <img src="./images/button_states_served.gif" border=0 ALT="Manage the States Served by First Title Services"></a>
               <a href="https://#cgi.server_name#/admin_area/rec_fees_view.cfm?uid=#URL.uid#&al=#URL.al#" target="work"><img src="./images/button_rec_fees.gif" border=0 ALT="View Recording Fees Schedule"></a>
               <a href="https://#cgi.server_name#/admin_area/ins_fees_choose.cfm?uid=#URL.uid#&al=#URL.al#" target="work"><img src="./images/button_ins_fees.gif" border=0 ALT="Review the Insurance Fees Schedule for each State"></a>
              <a href="https://#cgi.server_name#/admin_area/calculator.cfm?uid=#URL.uid#&al=#URL.al#" target="work"><img src="./images/button_ins_calc.gif" border=0 ALT="Check title Insurance Fees"></a></nobr></td>

			  </tr>
          <tr>
                <td colspan=3 align=center valign=bottom>
			&nbsp;&nbsp;&nbsp;<img src="./images/title_reports-events.gif" border=0 ALT=""></td>
              </td><td colspan=2 align=right valign=bottom></td>
						  </tr>
              <tr>
                <td colspan=3 align=right valign=top > <NOBR>
<a href="https://#cgi.server_name#/admin_area/Calendar_company.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=0&company_id=0" target="work"><img src="./images/button_calendar.gif" border=0 ALT="View the Calendar of Event Dates"></a><a href="https://#cgi.server_name#/admin_area/statistics_select.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="work"><img src="./images/button_statistics.gif" border=0 ALT="View the various report statistics"></a>
			<a href="https://#cgi.server_name#/admin_area/weblinks_search.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=0&company_id=0" target="work"><img src="./images/button_web_link.gif" border=0 ALT="Search for public records links"></a>
				<cfif #url.uid# neq "92" and #url.uid# neq "93" and #url.uid# neq "167" and #url.uid# neq "185">
				<a href="./monitor_user.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="work"><img border=0 src="./images/button_user_monitor.gif"></a>
</cfif>
 </td><td colspan=2 align=right valign=top > <NOBR>
 <cfFORM NAME="Search" METHOD="post" ACTION="./title_REP_display_single.cfm?uid=#URL.uid#&al=#URL.al#" >
  <FONT FACE=ARIAL SIZE=2 color="gray">Quick Search</font><input type=text name="number" size=10 maxlength=15
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
								><input type="image" src="https://#cgi.server_name#/admin_area/images/button_search.gif" border=0 alt="Quick file search">
</cfFORM></NOBR>
</td>
              </tr>
            </table>
			</CFOUTPUT>
			<cfelse>


					<table width=824 cellpadding=0 cellspacing=0 border=0  background="./images/back_top_buttons.gif">



			<tr><td width=92 align=center valign=top><img src="./images/title_client.gif"></td><td width=92 align=center valign=top><img src="./images/title_users.gif"></td>
			<td width=92 align=center valign=top></td><td width=92 align=center valign=top></td><td width=92 align=center valign=top><nobr>
				</td><td width=92 align=center valign=top></td><td width=92 align=center valign=top>
          </td><td width=92 align=center valign=top></td><td width=92 align=center valign=top></td>
			</tr>


<CFOUTPUT>	<tr><td width=92 align=center valign=top><NOBR><img src="./images/clear.gif" height=19 width=1><a href="./client_add.cfm?uid=#URL.uid#&al=#URL.al#" target=work><img src="./images/button_add-2.gif" border=0 ALT="Add a new Client to the database"></a><a href="./client_modify.cfm?uid=#URL.uid#&al=#URL.al#" target=work><img src="./images/button_mod-2.gif" border=0 ALT="Modify an existing Client"></NOBR></td><td width=92 align=center valign=top><NOBR><a href="./user_add.cfm?uid=#URL.uid#&al=#URL.al#" target=work><img src="./images/button_add-2.gif" border=0 ALT="Add a new User to the database"></a> <a href="./user_modify.cfm?uid=#URL.uid#&al=#URL.al#" target=work><img src="./images/button_mod-2.gif" border=0 ALT="Modify an existing User"></a></NOBR></td><td width=92 align=center valign=top><NOBR><td width=92 align=center valign=top><NOBR></a></NOBR></td><td width=92 align=center valign=top><NOBR><a href="https://#cgi.server_name#/admin_area/title_rep_view.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="work"><img src="./images/button_ft_orders.gif" border=0 ALT="View the existing Product Reports"></a>

</NOBR></td>
<td width=92 align=center valign=top><NOBR><a href="https://#cgi.server_name#/admin_area/calculator.cfm?uid=#URL.uid#&al=#URL.al#" target="work"> <img src="./images/button_ins_calc.gif" border=0 ALT="Check title Insurance Fees"></a>
<a href="https://#cgi.server_name#/admin_area/ins_fees_choose.cfm?uid=#URL.uid#&al=#URL.al#" target="work"> <img src="./images/button_ins_fees.gif" border=0 ALT="Review the Insurance Fees Schedule for each State"></a>
 <img src="./images/button_vendor_cov.gif" border=0 ALT="Coverage Areas of vendors">
</NOBR></td>


<td width=92 align=center valign=top><NOBR></NOBR></td><td width=92 align=center valign=top><NOBR></a></NOBR></td><td width=92 align=center valign=top><NOBR></NOBR></td></tr><tr><td bgcolor=gray width=823 colspan=9 align=center valign=top><img src="./images/clear.gif" height=1 width=819></td></tr>
		</table>
		</td>
	</tr></table>
      <table width=825 cellpadding=0 cellspacing=0 border=0 background="./images/logo_menu_1.gif">
        <tr>
          <td width=234 align=center valign=top ></td>
		  <td width=154 align=center valign=top >
			<td width=464 align=left valign=top >
            <table width=435 cellpadding=0 cellspacing=0 border=0 >

                  <nobr></nobr></td>
                <td colspan=3 align=left valign=bottom><nobr>
               </nobr></td>
              </tr>

          <tr>
                <td colspan=2 align=center valign=bottom>
			&nbsp;&nbsp;&nbsp;<img src="./images/title_reports-events.gif" border=0 ALT=""></td>
              </td><td colspan=2 align=right valign=bottom></td>
						  </tr>
              <tr>
                <td colspan=2 align=center valign=top > <NOBR>
&nbsp;&nbsp;&nbsp;&nbsp;<a href="https://#cgi.server_name#/admin_area/Calendar_company.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=0&company_id=0" target="work"><img src="./images/button_calendar.gif" border=0 ALT="View the Calendar of Event Dates"></a><a href="https://#cgi.server_name#/admin_area/statistics_select.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="work"><img src="./images/button_statistics.gif" border=0 ALT="View the various report statistics"></a>
		<img src="./images/button_web_link.gif" border=0 ALT="Search for public records links"></a>


 </td><td colspan=2 align=center valign=top >  <NOBR>
 <cfFORM NAME="Search" METHOD="post" ACTION="./title_REP_display_single.cfm?uid=#URL.uid#&al=#URL.al#" >
  <FONT FACE=ARIAL SIZE=2 color="gray">Quick Search</font><input type=text name="number" size=10 maxlength=15
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
								><input type="image" src="https://#cgi.server_name#/admin_area/images/button_search.gif" border=0 alt="Quick file search">
</cfFORM></NOBR>
</td>
              </tr>
            </table>
			</CFOUTPUT>


		</td>
	</tr>
	</cfif>
</table>

		</td>
	</tr>
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
</HTML>


<!---worked --->


<!---<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE><cfoutput>#session.site.short_name#</cfoutput> Admin</TITLE>
</HEAD>
<BODY BGCOLOR=e1e1e1 TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>
<CENTER>
<table width=826 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=826 align=center valign=top>
<table width=825 cellpadding=0 cellspacing=0 border=0 bgcolor=DAD7DA >
	<tr>
		<td width=825  align=left valign=top bgcolor=e3e3e3>


						<cfif #url.al# eq 1>

			<table width=824 cellpadding=0 cellspacing=0 border=0  background="./images/back_top_buttons.gif">



			<tr><td width=92 align=center valign=top><img src="./images/title_client.gif"></td><td width=92 align=center valign=top><img src="./images/title_users.gif"></td><td width=92 align=center valign=top><img src="./images/title_closers.gif"></td><!--- <td width=92 align=center valign=top><img src="./images/title_examiners.gif"></td> ---><td width=92 align=center valign=top><img src="./images/title_appraisers.gif"></td><td width=92 align=center valign=top><img src="./images/title_abstractors.gif"></td><td width=92 align=center valign=top><img src="./images/title_tp.gif"></td><td width=92 align=center valign=top><img src="./images/title_lenders.gif"></td><td width=92 align=center valign=top><img src="./images/title_FT_Agencies.gif"></td><td width=92 align=center valign=top><img src="./images/title_title_ins_co.gif"></td></tr>


<CFOUTPUT>	<tr><td width=92 align=center valign=top><NOBR><img src="./images/clear.gif" height=19 width=1><a href="./client_add.cfm?uid=#URL.uid#&al=#URL.al#" ><img src="./images/button_add-2.gif" border=0 ALT="Add a new Client to the database"></a><a href="./client_modify.cfm?uid=#URL.uid#&al=#URL.al#" ><img src="./images/button_mod-2.gif" border=0 ALT="Modify an existing Client"></NOBR></td><td width=92 align=center valign=top><NOBR><a href="./user_add.cfm?uid=#URL.uid#&al=#URL.al#" ><img src="./images/button_add-2.gif" border=0 ALT="Add a new User to the database"></a><a href="./user_modify.cfm?uid=#URL.uid#&al=#URL.al#" ><img src="./images/button_mod-2.gif" border=0 ALT="Modify an existing User"></a></NOBR></td><td width=92 align=center valign=top><NOBR><a href="./closer_add.cfm?uid=#URL.uid#&al=#URL.al#" ><img src="./images/button_add-2.gif" border=0 ALT="Add a new Closer to the database"></a><a href="./closer_modify.cfm?uid=#URL.uid#&al=#URL.al#" ><img src="./images/button_mod-2.gif" border=0 ALT="Modify an existing Closer"></a></NOBR></td><td width=92 align=center valign=top><NOBR><a href="https://#cgi.server_name#/admin_area/appraisers_add.cfm?uid=#URL.uid#&al=#URL.al#" ><img src="./images/button_add-2.gif" border=0 ALT="Add an Appraiser to the database"></a><a href="https://#cgi.server_name#/admin_area/appraisers_modify.cfm?uid=#URL.uid#&al=#URL.al#" ><img src="./images/button_mod-2.gif" border=0 ALT="Modify an existing Appraiser"></a></NOBR></td><td width=92 align=center valign=top><NOBR><a href="https://#cgi.server_name#/admin_area/abstractors_add.cfm?uid=#URL.uid#&al=#URL.al#" ><img src="./images/button_add-2.gif" border=0 ALT="Add an Abstractor to the database"></a><a href="https://#cgi.server_name#/admin_area/abstractors_modify.cfm?uid=#URL.uid#&al=#URL.al#" ><img src="./images/button_mod-2.gif" border=0 ALT="Modify an existing Abstractor"></a></NOBR></td>
<td width=92 align=center valign=top><NOBR><a href="./tp_add.cfm?uid=#URL.uid#&al=#URL.al#" ><img src="./images/button_add-2.gif" border=0 ALT="Add a new Third Party to the database"></a><a href="./tp_modify.cfm?uid=#URL.uid#&al=#URL.al#" ><img src="./images/button_mod-2.gif" border=0 ALT="Modify an existing Third Party"></a></NOBR></td>

<td width=92 align=center valign=top><NOBR><a href="https://#cgi.server_name#/admin_area/lenders_add.cfm?uid=#URL.uid#&al=#URL.al#"><img src="./images/button_add-2.gif" border=0 ALT="Add a New Lender to the Database"></a><a href="https://#cgi.server_name#/admin_area/lenders_modify_select.cfm?uid=#URL.uid#&al=#URL.al#" ><img src="./images/button_mod-2.gif" border=0 ALT="Modify an existing Lender"></a></NOBR></td><td width=92 align=center valign=top><NOBR><a href="https://#cgi.server_name#/admin_area/title_FT_Agency_add.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=0&company_id=0" ><img src="./images/button_add-2.gif" border=0 ALT="Add a New FT Agency"></a><a href="https://#cgi.server_name#/admin_area/Title_FT_Agency_Modify_Select.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=0&company_id=0" ><img src="./images/button_mod-2.gif" border=0 ALT="Modify a FT Agency"></a></NOBR></td><td width=92 align=center valign=top><NOBR><a href="https://#cgi.server_name#/admin_area/Title_Ins_Co_Add.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=0&company_id=0"  ><img src="./images/button_add-2.gif" border=0 ALT="Add a New Title Ins. Company"></a><a href="https://#cgi.server_name#/admin_area/Title_Ins_Co_Modify_Select.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=0&company_id=0"  ><img src="./images/button_mod-2.gif" border=0 ALT="Modify a Title Ins.  Company"></a></NOBR></td></tr><tr><td bgcolor=gray width=823 colspan=9 align=center valign=top><img src="./images/clear.gif" height=1 width=819></td></tr>
		</table>
		</td>
	</tr></table>
      <table width=825 cellpadding=0 cellspacing=0 border=0 background="./images/logo_menu_1.gif">
        <tr>
          <td width=234 align=center valign=top ></td>
		  <td width=154 align=center valign=top ><img src="./images/clear.gif" height=2 width=153><br>
       <td width=464 align=left valign=top >
            <table width=435 cellpadding=0 cellspacing=0 border=0 >
              <tr>
                <td colspan=2  align=left valign=top >
                  <nobr><img src="./images/title_reports.gif"></nobr></td>
                <td colspan=3 align=left valign=bottom><nobr>
                 <img src="./images/title_support_db.gif"></nobr></td>
              </tr>


			  <tr>

				 <td width=537 colspan=7 align=right valign=top >
				 <nobr>


				 <a href="https://#cgi.server_name#/admin_area/title_rep_view.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" ><img src="./images/button_ft_orders.gif" border=0 ALT="View the existing Product Reports"></a>
				 &nbsp;&nbsp;&nbsp;&nbsp;<a href="https://#cgi.server_name#/admin_area/vendor_coverage.cfm?uid=#URL.uid#&al=#URL.al#" ><img src="./images/button_vendor_cov.gif" border=0 ALT="Coverage Areas of vendors"></a>
              <a href="https://#cgi.server_name#/admin_area/First_title_states_served_modify.cfm?uid=#URL.uid#&al=#URL.al#" ><img src="./images/button_states_served.gif" border=0 ALT="Manage the States Served by First Title Services"></a>
               <a href="https://#cgi.server_name#/admin_area/rec_fees_view.cfm?uid=#URL.uid#&al=#URL.al#" ><img src="./images/button_rec_fees.gif" border=0 ALT="View Recording Fees Schedule"></a>
               <a href="https://#cgi.server_name#/admin_area/ins_fees_choose.cfm?uid=#URL.uid#&al=#URL.al#" target=><img src="./images/button_ins_fees.gif" border=0 ALT="Review the Insurance Fees Schedule for each State"></a>
             <a href="https://#cgi.server_name#/admin_area/calculator.cfm?uid=#URL.uid#&al=#URL.al#" ><img src="./images/button_ins_calc.gif" border=0 ALT="Check title Insurance Fees"></a></nobr></td>

			  </tr>
          <tr>
                <td colspan=3 align=center valign=bottom>
			&nbsp;&nbsp;&nbsp;<img src="./images/title_reports-events.gif" border=0 ALT=""></td>
              </td><td colspan=2 align=right valign=bottom></td>
						  </tr>
              <tr>
                <td colspan=3 align=right valign=top > <NOBR>
<a href="https://www.#cgi.server_name#/admin_area/Calendar_company.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=0&company_id=0" ><img src="./images/button_calendar.gif" border=0 ALT="View the Calendar of Event Dates"></a><a href="https://#cgi.server_name#/admin_area/statistics_select.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" ><img src="./images/button_statistics.gif" border=0 ALT="View the various report statistics"></a>
			<a href="https://#cgi.server_name#/admin_area/weblinks_search.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=0&company_id=0" ><img src="./images/button_web_link.gif" border=0 ALT="Search for public records links"></a>
<cfif #url.uid# neq "92" and #url.uid# neq "93" and #url.uid# neq "167" and #url.uid# neq "185">
				<a href="./monitor_user.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" ><img border=0 src="./images/button_user_monitor.gif"></a> </cfif>
 </td><td colspan=2 align=right valign=top > <NOBR>
 <cfFORM NAME="Search" METHOD="post" ACTION="./title_REP_display_single.cfm?uid=#URL.uid#&al=#URL.al#" >
  <FONT FACE=ARIAL SIZE=2 color="gray">Quick Search</font><input type=text name="number" size=10 maxlength=15
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
								><input type="image" src="https://#cgi.server_name#/admin_area/images/button_search.gif" border=0 alt="Quick file search">
</cfFORM></NOBR>
</td>
              </tr>
            </table>
			</CFOUTPUT>
		<!--- user_monitor --->
		<cfelseif #url.al# eq 0>


					<table width=824 cellpadding=0 cellspacing=0 border=0  background="./images/back_top_buttons.gif">



			<tr><td width=92 align=center valign=top><img src="./images/title_client.gif"></td><td width=92 align=center valign=top><img src="./images/title_users.gif"></td><td width=92 align=center valign=top><img src="./images/title_closers.gif"></td><td width=92 align=center valign=top><img src="./images/title_appraisers.gif"></td><td width=92 align=center valign=top><img src="./images/title_abstractors.gif"></td><td width=92 align=center valign=top><img src="./images/title_tp.gif"></td><td width=92 align=center valign=top><img src="./images/title_lenders.gif"></td><td width=92 align=center valign=top><img src="./images/title_FT_Agencies.gif"></td><td width=92 align=center valign=top><img src="./images/title_title_ins_co.gif"></td></tr>


<CFOUTPUT>	<tr><td width=92 align=center valign=top><NOBR><img src="./images/clear.gif" height=19 width=1><a href="./client_add.cfm?uid=#URL.uid#&al=#URL.al#" ><img src="./images/button_add-2.gif" border=0 ALT="Add a new Client to the database"></a><a href="./client_modify.cfm?uid=#URL.uid#&al=#URL.al#"><img src="./images/button_mod-2.gif" border=0 ALT="Modify an existing Client"></NOBR></td><td width=92 align=center valign=top><NOBR><a href="./user_add.cfm?uid=#URL.uid#&al=#URL.al#" ><img src="./images/button_add-2.gif" border=0 ALT="Add a new User to the database"></a><img src="./images/button_mod-2.gif" border=0 ALT="Modify an existing User"></a></NOBR></td><td width=92 align=center valign=top><NOBR><a href="./closer_add.cfm?uid=#URL.uid#&al=#URL.al#" ><img src="./images/button_add-2.gif" border=0 ALT="Add a new Closer to the database"></a><img src="./images/button_mod-2.gif" border=0 ALT="Modify an existing Closer"></a></NOBR></td><td width=92 align=center valign=top><NOBR><a href="https://#cgi.server_name#/admin_area/appraisers_add.cfm?uid=#URL.uid#&al=#URL.al#" ><img src="./images/button_add-2.gif" border=0 ALT="Add an Appraiser to the database"></a><img src="./images/button_mod-2.gif" border=0 ALT="Modify an existing Appraiser"></a></NOBR></td><td width=92 align=center valign=top><NOBR><a href="https://#cgi.server_name#/admin_area/abstractors_add.cfm?uid=#URL.uid#&al=#URL.al#" ><img src="./images/button_add-2.gif" border=0 ALT="Add an Abstractor to the database"></a><img src="./images/button_mod-2.gif" border=0 ALT="Modify an existing Abstractor"></a></NOBR></td>
<td width=92 align=center valign=top><NOBR><a href="./tp_add.cfm?uid=#URL.uid#&al=#URL.al#" ><img src="./images/button_add-2.gif" border=0 ALT="Add a new Third Party to the database"></a><img src="./images/button_mod-2.gif" border=0 ALT="Modify an existing Third Party"></a></NOBR></td>


<td width=92 align=center valign=top><NOBR><a href="https://#cgi.server_name#/admin_area/lenders_add.cfm?uid=#URL.uid#&al=#URL.al#" ><img src="./images/button_add-2.gif" border=0 ALT="Add a New Lender to the Database"></a><img src="./images/button_mod-2.gif" border=0 ALT="Modify an existing Lender"></a></NOBR></td><td width=92 align=center valign=top><NOBR><a href="https://#cgi.server_name#/admin_area/title_FT_Agency_add.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=0&company_id=0" ><img src="./images/button_add-2.gif" border=0 ALT="Add a New FT Agency"></a><img src="./images/button_mod-2.gif" border=0 ALT="Modify a FT Agency"></a></NOBR></td><td width=92 align=center valign=top><NOBR><a href="https://#cgi.server_name#/admin_area/Title_Ins_Co_Add.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=0&company_id=0"  ><img src="./images/button_add-2.gif" border=0 ALT="Add a New Title Ins. Company"></a><img src="./images/button_mod-2.gif" border=0 ALT="Modify a Title Ins.  Company"></a></NOBR></td></tr><tr><td bgcolor=gray width=823 colspan=9 align=center valign=top><img src="./images/clear.gif" height=1 width=819></td></tr>
		</table>
		</td>
	</tr></table>
      <table width=825 cellpadding=0 cellspacing=0 border=0 background="./images/logo_menu_1.gif">
        <tr>
          <td width=234 align=center valign=top ></td>
		  <td width=154 align=center valign=top ><td width=464 align=left valign=top >
            <table width=435 cellpadding=0 cellspacing=0 border=0 >
              <tr>
                <td colspan=3  align=center valign=top >
                  <nobr><img src="./images/title_reports.gif"></nobr></td>
                <td colspan=3 align=left valign=bottom><nobr>
                 <img src="./images/title_support_db.gif"></nobr></td>
              </tr>
              <tr>

				 <td width=537 colspan=7 align=right valign=top >
				 <nobr><a href="https://#cgi.server_name#/admin_area/title_rep_view.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" ><img src="./images/button_ft_orders.gif" border=0 ALT="View the existing Product Reports"></a>
				 &nbsp;&nbsp;&nbsp;&nbsp;<a href="https://#cgi.server_name#/admin_area/vendor_coverage.cfm?uid=#URL.uid#&al=#URL.al#" ><img src="./images/button_vendor_cov.gif" border=0 ALT="Coverage Areas of vendors"></a>
           <img src="./images/button_states_served.gif" border=0 ALT="Manage the States Served by First Title Services"></a>
               <a href="https://#cgi.server_name#/admin_area/rec_fees_view.cfm?uid=#URL.uid#&al=#URL.al#" ><img src="./images/button_rec_fees.gif" border=0 ALT="View Recording Fees Schedule"></a>
               <a href="https://#cgi.server_name#/admin_area/ins_fees_choose.cfm?uid=#URL.uid#&al=#URL.al#" ><img src="./images/button_ins_fees.gif" border=0 ALT="Review the Insurance Fees Schedule for each State"></a>
              <a href="https://#cgi.server_name#/admin_area/calculator.cfm?uid=#URL.uid#&al=#URL.al#" ><img src="./images/button_ins_calc.gif" border=0 ALT="Check title Insurance Fees"></a></nobr></td>

			  </tr>
          <tr>
                <td colspan=3 align=center valign=bottom>
			&nbsp;&nbsp;&nbsp;<img src="./images/title_reports-events.gif" border=0 ALT=""></td>
              </td><td colspan=2 align=right valign=bottom></td>
						  </tr>
              <tr>
                <td colspan=3 align=right valign=top > <NOBR>
<a href="https://#cgi.server_name#/admin_area/Calendar_company.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=0&company_id=0" ><img src="./images/button_calendar.gif" border=0 ALT="View the Calendar of Event Dates"></a><a href="https://#cgi.server_name#/admin_area/statistics_select.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" ><img src="./images/button_statistics.gif" border=0 ALT="View the various report statistics"></a>
			<a href="https://#cgi.server_name#/admin_area/weblinks_search.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=0&company_id=0" ><img src="./images/button_web_link.gif" border=0 ALT="Search for public records links"></a>
				<cfif #url.uid# neq "92" and #url.uid# neq "93" and #url.uid# neq "167" and #url.uid# neq "185">
				<a href="./monitor_user.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" ><img border=0 src="./images/button_user_monitor.gif"></a>
</cfif>
 </td><td colspan=2 align=right valign=top > <NOBR>
 <cfFORM NAME="Search" METHOD="post" ACTION="./title_REP_display_single.cfm?uid=#URL.uid#&al=#URL.al#">
  <FONT FACE=ARIAL SIZE=2 color="gray">Quick Search</font><input type=text name="number" size=10 maxlength=15
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
								><input type="image" src="https://#cgi.server_name#/admin_area/images/button_search.gif" border=0 alt="Quick file search">
</cfFORM></NOBR>
</td>
              </tr>
            </table>
			</CFOUTPUT>
			<cfelse>


					<table width=824 cellpadding=0 cellspacing=0 border=0  background="./images/back_top_buttons.gif">



			<tr><td width=92 align=center valign=top><img src="./images/title_client.gif"></td><td width=92 align=center valign=top><img src="./images/title_users.gif"></td>
			<td width=92 align=center valign=top></td><td width=92 align=center valign=top></td><td width=92 align=center valign=top><nobr>
				</td><td width=92 align=center valign=top></td><td width=92 align=center valign=top>
          </td><td width=92 align=center valign=top></td><td width=92 align=center valign=top></td>
			</tr>


<CFOUTPUT>	<tr><td width=92 align=center valign=top><NOBR><img src="./images/clear.gif" height=19 width=1><a href="./client_add.cfm?uid=#URL.uid#&al=#URL.al#" ><img src="./images/button_add-2.gif" border=0 ALT="Add a new Client to the database"></a><a href="./client_modify.cfm?uid=#URL.uid#&al=#URL.al#" ><img src="./images/button_mod-2.gif" border=0 ALT="Modify an existing Client"></NOBR></td><td width=92 align=center valign=top><NOBR><a href="./user_add.cfm?uid=#URL.uid#&al=#URL.al#" ><img src="./images/button_add-2.gif" border=0 ALT="Add a new User to the database"></a> <a href="./user_modify.cfm?uid=#URL.uid#&al=#URL.al#" ><img src="./images/button_mod-2.gif" border=0 ALT="Modify an existing User"></a></NOBR></td><td width=92 align=center valign=top><NOBR><td width=92 align=center valign=top><NOBR></a></NOBR></td><td width=92 align=center valign=top><NOBR><a href="https://#cgi.server_name#/admin_area/title_rep_view.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" ><img src="./images/button_ft_orders.gif" border=0 ALT="View the existing Product Reports"></a>

</NOBR></td>
<td width=92 align=center valign=top><NOBR><a href="https://#cgi.server_name#/admin_area/calculator.cfm?uid=#URL.uid#&al=#URL.al#" > <img src="./images/button_ins_calc.gif" border=0 ALT="Check title Insurance Fees"></a>
<a href="https://#cgi.server_name#/admin_area/ins_fees_choose.cfm?uid=#URL.uid#&al=#URL.al#" > <img src="./images/button_ins_fees.gif" border=0 ALT="Review the Insurance Fees Schedule for each State"></a>
 <img src="./images/button_vendor_cov.gif" border=0 ALT="Coverage Areas of vendors">
</NOBR></td>


<td width=92 align=center valign=top><NOBR></NOBR></td><td width=92 align=center valign=top><NOBR></a></NOBR></td><td width=92 align=center valign=top><NOBR></NOBR></td></tr><tr><td bgcolor=gray width=823 colspan=9 align=center valign=top><img src="./images/clear.gif" height=1 width=819></td></tr>
		</table>
		</td>
	</tr></table>
      <table width=825 cellpadding=0 cellspacing=0 border=0 background="./images/logo_menu_1.gif">
        <tr>
          <td width=234 align=center valign=top ></td>
		  <td width=154 align=center valign=top >
			<td width=464 align=left valign=top >
            <table width=435 cellpadding=0 cellspacing=0 border=0 >

                  <nobr></nobr></td>
                <td colspan=3 align=left valign=bottom><nobr>
               </nobr></td>
              </tr>

          <tr>
                <td colspan=2 align=center valign=bottom>
			&nbsp;&nbsp;&nbsp;<img src="./images/title_reports-events.gif" border=0 ALT=""></td>
              </td><td colspan=2 align=right valign=bottom></td>
						  </tr>
              <tr>
                <td colspan=2 align=center valign=top > <NOBR>
&nbsp;&nbsp;&nbsp;&nbsp;<a href="https://#cgi.server_name#/admin_area/Calendar_company.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=0&company_id=0" ><img src="./images/button_calendar.gif" border=0 ALT="View the Calendar of Event Dates"></a><a href="https://#cgi.server_name#/admin_area/statistics_select.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" ><img src="./images/button_statistics.gif" border=0 ALT="View the various report statistics"></a>
		<img src="./images/button_web_link.gif" border=0 ALT="Search for public records links"></a>


 </td><td colspan=2 align=center valign=top >  <NOBR>
 <cfFORM NAME="Search" METHOD="post" ACTION="./title_REP_display_single.cfm?uid=#URL.uid#&al=#URL.al#" >
  <FONT FACE=ARIAL SIZE=2 color="gray">Quick Search</font><input type=text name="number" size=10 maxlength=15
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
								><input type="image" src="https://#cgi.server_name#/admin_area/images/button_search.gif" border=0 alt="Quick file search">
</cfFORM></NOBR>
</td>
              </tr>



            </table>
			</CFOUTPUT>


		</td>
	</tr>
	</cfif>
</table>

		</td>
	</tr>
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
</HTML>
--->