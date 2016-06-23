

		<CFQUERY datasource="#request.dsn#" NAME="read_for_indicator">

			SELECT *
			FROM Tax_Cert_Title
			WHERE title_ID = #rec_ID#


		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_abstract">

			SELECT *
			FROM Doc_Abstract_Title
			WHERE title_ID = #rec_ID#


		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_current_Commitment_Clauses">
			SELECT *
			FROM Doc_Title_Insurance_Title
			WHERE Title_ID = #rec_ID#
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="read_title_order">

			SELECT *
			FROM Title
			WHERE title_ID = #rec_ID#


		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="Read_Title_Order_Req">
				SELECT *
				FROM Title_Closing_Order_Request
				Where Title_Id = #rec_id#
			</CFQUERY>
			<CFQUERY datasource="#request.dsn#" NAME="Read_Title_Order_info">
				SELECT *
				FROM eventlist
				Where Title_Id = #rec_id#
			</CFQUERY>
			<CFQUERY datasource="#request.dsn#" NAME="Read_Title_Order_shipping">
				SELECT *
				FROM Shipping_info
				Where Id = #rec_id#
			</CFQUERY>
					<CFIF #Read_Title_Order_Req.a_sent_by# GT 0 AND #Read_Title_Order_Req.a_filled_out_by# GT 0>
						<CFSET A_Update_DB_Flag = 3>
					<CFELSE>
						<CFSET A_Update_DB_Flag = 0>
					</CFIF>


<CFQUERY datasource="#request.dsn#" NAME="read_appraisal">

			SELECT *
			FROM Appraisal_Doc_Title
			WHERE title_ID = #rec_ID#


		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="read_payoff_info_1">
			SELECT *
			FROM Pay_Off_Lender_1_Title
			WHERE Title_ID = #rec_ID#
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_payoff_info_2">
			SELECT *
			FROM Pay_Off_Lender_2_Title
			WHERE Title_ID = #rec_ID#
		</CFQUERY>



		<CFQUERY datasource="#request.dsn#" NAME="read_current_Commitment_Clauses">
			SELECT *
			FROM Doc_Title_Insurance_Title
			WHERE Title_ID = #rec_ID#
		</CFQUERY>


		<CFQUERY datasource="#request.dsn#" NAME="read_title">

			SELECT *
			FROM Title
			WHERE title_ID = #rec_ID#


		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_sel_company">

			SELECT *
			FROM companies
			WHERE ID = #read_title.comp_ID#

		</CFQUERY>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>

<style><!--
body,td,div,.p,a{font-family:arial,sans-serif }
div,td{color:#000}
.f,.fl:link{color:#6f6f6f}
a:link,.w,a.w:link,.w a:link{color:#00c}
a:visited,.fl:visited{color:#551a8b}
a:active,.fl:active{color:#f00}
.t a:link,.t a:active,.t a:visited,.t{color:#ffffff}
.t{background-color:#3366cc}
.h{color:#3366cc;font-size:14px}
.i,.i:link{color:#a90a08}
.a,.a:link{color:#008000}
.z{display:none}
div.n {margin-top: 1ex}
.n a{font-size:10pt; color:#000}
.n .i{font-size:10pt; font-weight:bold}
.q a:visited,.q a:link,.q a:active,.q {text-decoration: none; color: #00c;}
.b{font-size: 12pt; color:#00c; font-weight:bold}
.ch{cursor:pointer;cursor:hand}
.e{margin-top: .75em; margin-bottom: .75em}
.g{margin-top: 1em; margin-bottom: 1em}
//-->
</style>

</head>

<BODY BGCOLOR="#ffffff" TEXT="#000000" LINK="#ff0000" VLINK="#800000" ALINK="#ff00ff" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth="0" MarginHeight="0">

<CENTER>
<CENTER>
<table width=830 cellpadding=1 cellspacing=1 border=0 bgcolor="gray">
	<tr>
		<td width=830 align=middle valign=top>

<table width=830 cellpadding=1 cellspacing=1 border=0 bgcolor="white">
	<tr>
		<td width=830 align=middle valign=top bgcolor="e1e1el">
			<IMG src="./images/logo_title_reports.gif">

		</td>
	</tr>



	<tr>
		<td width=830 align=middle valign=top bgcolor=e1e1el>




	<!--- <CFINCLUDE TEMPLATE="./includes/title_top_navu.cfm"> --->
	<cfoutput>

<p align="center"><a href="https://#cgi.server_name#/endorse_modify.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_title_order.title_id#&a_trigger=1&company_id=#read_title_order.comp_ID#"><br><img src="images2/but_auto_endorse.jpg" alt="Auto-Endorse" border="0"></a></p>


</cfoutput>
<table border=0 cellpadding=0 cellspacing=0>
<tr>
<td id=t0 bgcolor=#3366cc width=90 nowrap><center><font size=-1 color=#ffffff><b>&nbsp;View Order&nbsp;</b></font></center></td>
<td width=1 bgcolor=#808080><img width=1 height=1 alt=""></td>
<td width=1 bgcolor=#ffffff><img width=1 height=1 alt=""></td>
<td id=t1 onClick="c('https://images.google.com/images','wi',event);" style=cursor:pointer;cursor:hand; class=q bgcolor=#efefef width=60 nowrap><center><font size=-1><a id=t1a class=q href=https://images.google.com/images?q=5845&hl=en&lr=&ie=UTF-8&oe=UTF-8&sa=N&tab=wi onClick="return b('https://images.google.com/images','wi',event);">&nbsp;Upload File&nbsp;</a></font></center></td>
<td width=1 bgcolor=#808080><img width=1 height=1 alt=""></td>
<td width=1 bgcolor=#ffffff><img width=1 height=1 alt=""></td>
<td id=t2 onClick="c('https://groups.google.com/groups','wg',event);" style=cursor:pointer;cursor:hand; class=q bgcolor=#efefef width=60 nowrap><center><font size=-1><a id=t2a class=q href=https://groups.google.com/groups?q=5845&hl=en&lr=&ie=UTF-8&oe=UTF-8&sa=N&tab=wg onClick="return b('https://groups.google.com/groups','wg',event);">&nbsp;Payoff-1&nbsp;</a></font></center></td>
<td width=1 bgcolor=#808080><img width=1 height=1 alt=""></td>
<td width=1 bgcolor=#ffffff><img width=1 height=1 alt=""></td>
<td id=t3 onClick="c('https://www.google.com/search','wd',event);" style=cursor:pointer;cursor:hand; class=q bgcolor=#efefef width=60 nowrap><center><font size=-1><a id=t3a class=q href=https://www.google.com/search?q=5845&hl=en&lr=&ie=UTF-8&oe=UTF-8&cat=gwd/Top&sa=N&tab=wd onClick="return b('https://www.google.com/search','wd',event);">&nbsp;Payoff-2&nbsp;</a></font></center></td>
<td width=1 bgcolor=#808080><img width=1 height=1 alt=""></td>
<td width=1 bgcolor=#ffffff><img width=1 height=1 alt=""></td>
<td id=t4 onClick="c('https://news.google.com/news','wn',event);" style=cursor:pointer;cursor:hand; class=q bgcolor=#efefef width=60 nowrap><center><font size=-1><a id=t4a class=q href=https://news.google.com/news?q=5845&hl=en&lr=&ie=UTF-8&oe=UTF-8&a=N&tab=wn onClick="return b('https://news.google.com/news','wn',event);">&nbsp;Title Insurance&nbsp;</a></font></center></td>
<td width=1 bgcolor=#808080><img width=1 height=1 alt=""></td>
<td id=t5 onClick="c('https://news.google.com/news','wn',event);" style=cursor:pointer;cursor:hand; class=q bgcolor=#efefef width=60 nowrap><center><font size=-1><a id=t4a class=q href=https://news.google.com/news?q=5845&hl=en&lr=&ie=UTF-8&oe=UTF-8&a=N&tab=wn onClick="return b('https://news.google.com/news','wn',event);">&nbsp;Pre HUD-1&nbsp;</a></font></center></td>
<td width=1 bgcolor=#808080><img width=1 height=1 alt=""></td>
<td id=t6 onClick="c('https://news.google.com/news','wn',event);" style=cursor:pointer;cursor:hand; class=q bgcolor=#efefef width=60 nowrap><center><font size=-1><a id=t4a class=q href=https://news.google.com/news?q=5845&hl=en&lr=&ie=UTF-8&oe=UTF-8&a=N&tab=wn onClick="return b('https://news.google.com/news','wn',event);">&nbsp;Loan Amount&nbsp;</a></font></center></td>
<td width=1 bgcolor=#808080><img width=1 height=1 alt=""></td>
<td id=t7 onClick="c('https://news.google.com/news','wn',event);" style=cursor:pointer;cursor:hand; class=q bgcolor=#efefef width=60 nowrap><center><font size=-1><a id=t4a class=q href=https://news.google.com/news?q=5845&hl=en&lr=&ie=UTF-8&oe=UTF-8&a=N&tab=wn onClick="return b('https://news.google.com/news','wn',event);">&nbsp;Proposed Insured&nbsp;</a></font></center></td>
<td width=1 bgcolor=#808080><img width=1 height=1 alt=""></td>
<td id=t8 onClick="c('https://news.google.com/news','wn',event);" style=cursor:pointer;cursor:hand; class=q bgcolor=#efefef width=60 nowrap><center><font size=-1><a id=t4a class=q href=https://news.google.com/news?q=5845&hl=en&lr=&ie=UTF-8&oe=UTF-8&a=N&tab=wn onClick="return b('https://news.google.com/news','wn',event);">&nbsp;Am-ICL&nbsp;</a></font></center></td>
<td width=1 bgcolor=#808080><img width=1 height=1 alt=""></td>
<td id=t9 onClick="c('https://news.google.com/news','wn',event);" style=cursor:pointer;cursor:hand; class=q bgcolor=#efefef width=60 nowrap><center><font size=-1><a id=t4a class=q href=https://news.google.com/news?q=5845&hl=en&lr=&ie=UTF-8&oe=UTF-8&a=N&tab=wn onClick="return b('https://news.google.com/news','wn',event);">&nbsp;Chi-ICL&nbsp;</a></font></center></td>
<td width=1 bgcolor=#808080><img width=1 height=1 alt=""></td>
<td id=t10 onClick="c('https://news.google.com/news','wn',event);" style=cursor:pointer;cursor:hand; class=q bgcolor=#efefef width=60 nowrap><center><font size=-1><a id=t4a class=q href=https://news.google.com/news?q=5845&hl=en&lr=&ie=UTF-8&oe=UTF-8&a=N&tab=wn onClick="return b('https://news.google.com/news','wn',event);">&nbsp;View Closing&nbsp;</a></font></center></td>
<td width=1 bgcolor=#808080><img width=1 height=1 alt=""></td>
<td id=t7 onClick="c('https://news.google.com/news','wn',event);" style=cursor:pointer;cursor:hand; class=q bgcolor=#efefef width=60 nowrap><center><font size=-1><a id=t4a class=q href=https://news.google.com/news?q=5845&hl=en&lr=&ie=UTF-8&oe=UTF-8&a=N&tab=wn onClick="return b('https://news.google.com/news','wn',event);">&nbsp;View Shipping&nbsp;</a></font></center></td>
<td width=1 bgcolor=#808080><img width=1 height=1 alt=""></td>
</tr>
</table>
<table width=100% border=0 cellpadding=1 cellspacing=0 bgcolor=#3366cc>
<tr>
<td bgcolor=#3366cc nowrap>
<table width=100% border=0 cellpadding=1 cellspacing=0 bgcolor=#3366cc>
<tr>
<td bgcolor=#3366cc nowrap><font size=-1 color=#ffffff>Searched the web for <b>5845</b>.&nbsp; </font>
</td>
<td bgcolor=#3366cc align=right nowrap><font size=-1 color=#ffffff>Results <b>1</b> - <b>10</b> of about <b>108,000</b>.   Search took <b>0.19</b> seconds.</font>
</td>
</tr>
</table>




	</td>
	</tr>



		</TD>
	</TR>


		</td>
	</tr><!--- ====================================================================== ---><!--- ====================================================================== ---><!--- ====================================================================== --->


	<tr>
		<td width=830 align=left valign=top bgcolor=e1e1el>
		<!--- <nobr><A href="javascript:window.close();"><IMG src="./images/button_close.gif" border=0></a></nobr>
 --->


			</td>


		</tr>



	</table>


			</td>
		</tr>

	</table></CENTER></CENTER>

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





