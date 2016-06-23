<!--To put this html into an existing HTML document, you must copy the JavaScript and-->
<!--paste it in a specific location within the destination HTML document. You must then copy-->
<!--and paste the table in a different location.-->

<!---At this time this is to limit Heidi's Access.  She is uid 214.
     In the future this can be changed to incorporate the Roles.
Harry 12/14/2004
--->
 <cfquery datasource="#request.dsn#" Name="Read_Name">
    Select ID
    from First_Admin where id = #uid#
  </CFquery>
<html>
<head>
<title>header1.cfm.gif</title>
<meta http-equiv="Content-Type" content="text/html;">
<meta name="description" content="FW MX Generic HTML">
<!--Fireworks MX Generic target.    Created Wed Sep 08 15:28:47 GMT-0400 (Eastern Daylight Time) 2004-->

<!--================== BEGIN COPYING THE JAVASCRIPT SECTION HERE =================-->
<script language="JavaScript">
<!-- hide
function mmLoadMenus() {
  if (window.mm_menu_0908113053_0) return;
  window.mm_menu_0908113053_0 = new Menu("root",100,16,"Verdana, Arial, Helvetica, sans-serif",10,"#000000","#ffffff","#cccccc","#0033cc","left","middle",3,0,1000,-5,7,true,true,true,0,false,true);
    mm_menu_0908113053_0.addMenuItem("Add","window.open('./client_add.cfm?uid=<cfoutput>#URL.uid#</cfoutput>&al=<cfoutput>#URL.al#</cfoutput>', '_blank');");
  mm_menu_0908113053_0.addMenuItem("Modify","window.open('./client_modify.cfm?uid=<cfoutput>#URL.uid#</cfoutput>&al=<cfoutput>#URL.al#</cfoutput>', '_blank');");
  mm_menu_0908113053_0.addMenuItem("LogIn As","window.open('./login_as_client.cfm?uid=<cfoutput>#URL.uid#&al=#URL.al#</cfoutput>', '_blank');");
   mm_menu_0908113053_0.hideOnMouseOut=true;
   mm_menu_0908113053_0.menuBorder=1;
   mm_menu_0908113053_0.menuLiteBgColor='#ffffff';
   mm_menu_0908113053_0.menuBorderBgColor='#555555';
   mm_menu_0908113053_0.bgColor='#555555';
  window.mm_menu_0908113245_1 = new Menu("root",100,16,"Verdana, Arial, Helvetica, sans-serif",10,"#000000","#ffffff","#cccccc","#0033cc","left","middle",3,0,1000,-5,7,true,true,true,0,false,true);
  mm_menu_0908113245_1.addMenuItem("Add","window.open('./user_add.cfm?uid=<cfoutput>#URL.uid#</cfoutput>&al=<cfoutput>#URL.al#</cfoutput>', '_blank');");
  mm_menu_0908113245_1.addMenuItem("Modify","window.open('./user_modify.cfm?uid=<cfoutput>#URL.uid#</cfoutput>&al=<cfoutput>#URL.al#</cfoutput>', '_blank');");
   mm_menu_0908113245_1.hideOnMouseOut=true;
   mm_menu_0908113245_1.menuBorder=1;
   mm_menu_0908113245_1.menuLiteBgColor='#ffffff';
   mm_menu_0908113245_1.menuBorderBgColor='#555555';
   mm_menu_0908113245_1.bgColor='#555555';
  window.mm_menu_0908113345_2 = new Menu("root",100,16,"Verdana, Arial, Helvetica, sans-serif",10,"#000000","#ffffff","#cccccc","#0033cc","left","middle",3,0,1000,-5,7,true,true,true,0,false,true);
  mm_menu_0908113345_2.addMenuItem("Add","window.open('./vendor_add2.cfm?uid=<cfoutput>#URL.uid#</cfoutput>&al=<cfoutput>#URL.al#</cfoutput>', '_blank');");
  mm_menu_0908113345_2.addMenuItem("Modify","window.open('./vendor_modify2.cfm?uid=<cfoutput>#URL.uid#</cfoutput>&al=<cfoutput>#URL.al#</cfoutput>', '_blank');");
   mm_menu_0908113345_2.hideOnMouseOut=true;
   mm_menu_0908113345_2.menuBorder=1;
   mm_menu_0908113345_2.menuLiteBgColor='#ffffff';
   mm_menu_0908113345_2.menuBorderBgColor='#555555';
   mm_menu_0908113345_2.bgColor='#555555';

  window.mm_menu_0908113345_3 = new Menu("root",100,16,"Verdana, Arial, Helvetica, sans-serif",10,"#000000","#ffffff","#cccccc","#0033cc","left","middle",3,0,1000,-5,7,true,true,true,0,false,true);
  mm_menu_0908113345_3.addMenuItem("Add","window.open('./vendor_add.cfm?uid=<cfoutput>#URL.uid#</cfoutput>&al=<cfoutput>#URL.al#</cfoutput>', '_blank');");
  mm_menu_0908113345_3.addMenuItem("Modify","window.open('./vendor_modify.cfm?uid=<cfoutput>#URL.uid#</cfoutput>&al=<cfoutput>#URL.al#</cfoutput>', '_blank');");
   mm_menu_0908113345_3.hideOnMouseOut=true;
   mm_menu_0908113345_3.menuBorder=1;
   mm_menu_0908113345_3.menuLiteBgColor='#ffffff';
   mm_menu_0908113345_3.menuBorderBgColor='#555555';
   mm_menu_0908113345_3.bgColor='#555555';


  window.mm_menu_0908113705_5 = new Menu("root",100,16,"Verdana, Arial, Helvetica, sans-serif",10,"#000000","#ffffff","#cccccc","#0033cc","left","middle",3,0,1000,-5,7,true,true,true,0,false,true);
  mm_menu_0908113705_5.addMenuItem("Add","window.open('./tp_add.cfm?uid=<cfoutput>#URL.uid#</cfoutput>&al=<cfoutput>#URL.al#</cfoutput>', '_blank');");
  mm_menu_0908113705_5.addMenuItem("Modify","window.open('./tp_modify.cfm?uid=<cfoutput>#URL.uid#</cfoutput>&al=<cfoutput>#URL.al#</cfoutput>', '_blank');");
   mm_menu_0908113705_5.hideOnMouseOut=true;
   mm_menu_0908113705_5.menuBorder=1;
   mm_menu_0908113705_5.menuLiteBgColor='#ffffff';
   mm_menu_0908113705_5.menuBorderBgColor='#555555';
   mm_menu_0908113705_5.bgColor='#555555';
  window.mm_menu_0908113728_6 = new Menu("root",100,16,"Verdana, Arial, Helvetica, sans-serif",10,"#000000","#ffffff","#cccccc","#0033cc","left","middle",3,0,1000,-5,7,true,true,true,0,false,true);
  <CFIF #read_name.id# neq "214">mm_menu_0908113728_6.addMenuItem("Add","window.open('./lenders_add.cfm?uid=<cfoutput>#URL.uid#</cfoutput>&al=<cfoutput>#URL.al#</cfoutput>', '_blank');");</CFIF>
  <CFIF #read_name.id# neq "214">mm_menu_0908113728_6.addMenuItem("Modify","window.open('./lenders_modify_select.cfm?uid=<cfoutput>#URL.uid#</cfoutput>&al=<cfoutput>#URL.al#</cfoutput>', '_blank');");</CFIF>
   mm_menu_0908113728_6.hideOnMouseOut=true;
   mm_menu_0908113728_6.menuBorder=1;
   mm_menu_0908113728_6.menuLiteBgColor='#ffffff';
   mm_menu_0908113728_6.menuBorderBgColor='#555555';
   mm_menu_0908113728_6.bgColor='#555555';
  window.mm_menu_0908113751_7 = new Menu("root",100,16,"Verdana, Arial, Helvetica, sans-serif",10,"#000000","#ffffff","#cccccc","#0033cc","left","middle",3,0,1000,-5,7,true,true,true,0,false,true);
  <CFIF #read_name.id# neq "214">mm_menu_0908113751_7.addMenuItem("Add","window.open('./Title_FT_Agency_add.cfm?uid=<cfoutput>#URL.uid#</cfoutput>&al=<cfoutput>#URL.al#</cfoutput>', '_blank');");</CFIF>
  <CFIF #read_name.id# neq "214">mm_menu_0908113751_7.addMenuItem("Modify","window.open('./Title_FT_Agency_modify_select.cfm?uid=<cfoutput>#URL.uid#</cfoutput>&al=<cfoutput>#URL.al#</cfoutput>', '_blank');");</CFIF>
   mm_menu_0908113751_7.hideOnMouseOut=true;
   mm_menu_0908113751_7.menuBorder=1;
   mm_menu_0908113751_7.menuLiteBgColor='#ffffff';
   mm_menu_0908113751_7.menuBorderBgColor='#555555';
   mm_menu_0908113751_7.bgColor='#555555';
  window.mm_menu_0908113813_8 = new Menu("root",100,16,"Verdana, Arial, Helvetica, sans-serif",10,"#000000","#ffffff","#cccccc","#0033cc","left","middle",3,0,1000,-5,7,true,true,true,0,false,true);
  <CFIF #read_name.id# neq "214">mm_menu_0908113813_8.addMenuItem("Add","window.open('./Title_Ins_Co_Add.cfm?uid=<cfoutput>#URL.uid#</cfoutput>&al=<cfoutput>#URL.al#</cfoutput>', '_blank');");</CFIF>
  <CFIF #read_name.id# neq "214">mm_menu_0908113813_8.addMenuItem("Modify","window.open('./Title_Ins_Co_Modify_Select.cfm?uid=<cfoutput>#URL.uid#</cfoutput>&al=<cfoutput>#URL.al#</cfoutput>', '_blank');");</CFIF>
   mm_menu_0908113813_8.hideOnMouseOut=true;
   mm_menu_0908113813_8.menuBorder=1;
   mm_menu_0908113813_8.menuLiteBgColor='#ffffff';
   mm_menu_0908113813_8.menuBorderBgColor='#555555';
   mm_menu_0908113813_8.bgColor='#555555';
  window.mm_menu_0908113836_9 = new Menu("root",126,16,"Verdana, Arial, Helvetica, sans-serif",10,"#000000","#ffffff","#cccccc","#0033cc","left","middle",3,0,1000,-5,7,true,true,true,0,false,true);
  mm_menu_0908113836_9.addMenuItem("Clear&nbsp;To&nbsp;Close","window.open('./menu_Cleartoclose.cfm?uid=<cfoutput>#URL.uid#</cfoutput>&al=<cfoutput>#URL.al#</cfoutput>', '_blank');");
  mm_menu_0908113836_9.addMenuItem("Customer&nbsp;Service","window.open('./menu_CustomerService_mgrreview.cfm?uid=<cfoutput>#URL.uid#</cfoutput>&role_mgr=1&al=<cfoutput>#URL.al#</cfoutput>', '_blank');");
    mm_menu_0908113836_9.addMenuItem("Preprocessing/Processing","window.open('./menu_processing_all.cfm?uid=<cfoutput>#URL.uid#</cfoutput>&role_mgr=1&al=<cfoutput>#URL.al#</cfoutput>', '_blank');");
  mm_menu_0908113836_9.addMenuItem("Vendor&nbsp;Management","window.open('./menu_Vendor_Management.cfm?uid=<cfoutput>#URL.uid#</cfoutput>&role_mgr=1&al=<cfoutput>#URL.al#</cfoutput>', '_blank');");
  mm_menu_0908113836_9.hideOnMouseOut=true;
   mm_menu_0908113836_9.menuBorder=1;
   mm_menu_0908113836_9.menuLiteBgColor='#ffffff';
   mm_menu_0908113836_9.menuBorderBgColor='#555555';
   mm_menu_0908113836_9.bgColor='#555555';
  window.mm_menu_0908114100_10 = new Menu("root",124,16,"Verdana, Arial, Helvetica, sans-serif",10,"#000000","#ffffff","#cccccc","#0033cc","left","middle",3,0,1000,-5,7,true,true,true,0,false,true);
  mm_menu_0908114100_10.addMenuItem("Orders","window.open('./title_rep_view.cfm?uid=<cfoutput>#URL.uid#</cfoutput>&al=<cfoutput>#URL.al#</cfoutput>&a_trigger=6&company_id=0', '_blank');");
  mm_menu_0908114100_10.addMenuItem("Vendor&nbsp;Cov","window.open('./vendor_coverage.cfm?uid=<cfoutput>#URL.uid#</cfoutput>&al=<cfoutput>#URL.al#</cfoutput>', '_blank');");
  mm_menu_0908114100_10.addMenuItem("States&nbsp;Served","window.open('./First_title_states_served_modify.cfm?uid=<cfoutput>#URL.uid#</cfoutput>&al=<cfoutput>#URL.al#</cfoutput>', '_blank');");
  mm_menu_0908114100_10.addMenuItem("Recording&nbsp;Fees","window.open('./rec_fees_view.cfm?uid=<cfoutput>#URL.uid#</cfoutput>&al=<cfoutput>#URL.al#</cfoutput>', '_blank');");
  mm_menu_0908114100_10.addMenuItem("Insurance&nbsp;Fees","window.open('./ins_fees_choose.cfm?uid=<cfoutput>#URL.uid#</cfoutput>&al=<cfoutput>#URL.al#</cfoutput>', '_blank');");
  mm_menu_0908114100_10.addMenuItem("Insurance&nbsp;Calculator","window.open('./calculator.cfm?uid=<cfoutput>#URL.uid#</cfoutput>&al=<cfoutput>#URL.al#</cfoutput>', '_blank');");
   mm_menu_0908114100_10.hideOnMouseOut=true;
   mm_menu_0908114100_10.menuBorder=1;
   mm_menu_0908114100_10.menuLiteBgColor='#ffffff';
   mm_menu_0908114100_10.menuBorderBgColor='#555555';
   mm_menu_0908114100_10.bgColor='#555555';
  window.mm_menu_0908114249_11 = new Menu("root",100,16,"Verdana, Arial, Helvetica, sans-serif",10,"#000000","#ffffff","#cccccc","#0033cc","left","middle",3,0,1000,-5,7,true,true,true,0,false,true);
  mm_menu_0908114249_11.addMenuItem("Procing.&nbsp;Calendar&nbsp;","window.open('./Calendar_choose.cfm?uid=<cfoutput>#URL.uid#</cfoutput>&al=<cfoutput>#URL.al#</cfoutput>&trigger=0', '_blank');");
  mm_menu_0908114249_11.addMenuItem("Scheding.&nbsp;Calendar&nbsp;","window.open('./Calendar_choose.cfm?uid=<cfoutput>#URL.uid#</cfoutput>&al=<cfoutput>#URL.al#</cfoutput>&trigger=1', '_blank');");
  mm_menu_0908114249_11.addMenuItem("Web&nbsp;Links","window.open('./weblinks_search.cfm?uid=<cfoutput>#URL.uid#</cfoutput>&al=<cfoutput>#URL.al#</cfoutput>&a_trigger=0&company_id=0', '_blank');");
  mm_menu_0908114249_11.addMenuItem("Statistics","window.open('./statistics_select.cfm?uid=<cfoutput>#URL.uid#</cfoutput>&al=<cfoutput>#URL.al#</cfoutput>&a_trigger=6&company_id=0', '_blank');");
  mm_menu_0908114249_11.addMenuItem("User&nbsp;Monitor","window.open('./monitor_user.cfm?uid=<cfoutput>#URL.uid#</cfoutput>&al=<cfoutput>#URL.al#</cfoutput>&a_trigger=1', '_blank');");
  mm_menu_0908114249_11.addMenuItem("Cancelled","window.open('./cancelled_view.cfm?uid=<cfoutput>#URL.uid#</cfoutput>&al=<cfoutput>#URL.al#</cfoutput>&a_trigger=1', '_blank');");
  mm_menu_0908114249_11.addMenuItem("Sales&nbsp;Commission","window.open('./Sales_Commission_Report_Date.cfm?uid=<cfoutput>#URL.uid#</cfoutput>', '_blank');");
  mm_menu_0908114249_11.addMenuItem("Client&nbsp;Services","window.open('./CustomerService_List.cfm?uid=<cfoutput>#URL.uid#</cfoutput>&al=<cfoutput>#URL.al#</cfoutput>', '_blank');");
  mm_menu_0908114249_11.addMenuItem("Accts&nbsp;Receivable","window.open('./payments.cfm?uid=<cfoutput>#URL.uid#</cfoutput>&ar=1', '_blank');");
  mm_menu_0908114249_11.addMenuItem("Accts&nbsp;Payable","window.open('./payments.cfm?uid=<cfoutput>#URL.uid#</cfoutput>&ar=0', '_blank');");
  mm_menu_0908114249_11.addMenuItem("Invoices","window.open('./invoice.cfm?uid=<cfoutput>#URL.uid#</cfoutput>&ar=0', '_blank');");
  mm_menu_0908114249_11.hideOnMouseOut=true;
  mm_menu_0908114249_11.menuBorder=1;
  mm_menu_0908114249_11.menuLiteBgColor='#ffffff';
  mm_menu_0908114249_11.menuBorderBgColor='#555555';
  mm_menu_0908114249_11.bgColor='#555555';

  mm_menu_0908114249_11.writeMenus();
} // mmLoadMenus()

// stop hiding -->
</script>
<script language="JavaScript1.2" src="mm_menu.js"></script>
<!--======================== STOP COPYING THE JAVASCRIPT HERE ========================-->
</head>
<body bgcolor="#ffffff">
<!--The following section is an image or HTML table which reassembles the sliced image in a browser.-->
<!--Copy the table section including the opening and closing table tags, and paste the data where-->
<!--you want the reassembled image to appear in the destination document. -->

<!--======================== BEGIN COPYING THE HTML ==========================-->
<script language="JavaScript1.2">mmLoadMenus();</script>
<table border="0" cellpadding="0" cellspacing="0" width="826">
<!-- fwtable fwsrc="Header1.png" fwbase="header1.cfm.gif" fwstyle="Generic" fwdocid = "742308039" fwnested="0" -->
  <tr>
<!-- Shim row, height 1. -->
   <td><img src="spacer.gif" width="74" height="1" border="0" alt=""></td>
   <td><img src="spacer.gif" width="68" height="1" border="0" alt=""></td>
   <td><img src="spacer.gif" width="6" height="1" border="0" alt=""></td>
   <td><img src="spacer.gif" width="68" height="1" border="0" alt=""></td>
   <td><img src="spacer.gif" width="6" height="1" border="0" alt=""></td>
   <td><img src="spacer.gif" width="74" height="1" border="0" alt=""></td>
   <td><img src="spacer.gif" width="74" height="1" border="0" alt=""></td>
   <td><img src="spacer.gif" width="74" height="1" border="0" alt=""></td>
   <td><img src="spacer.gif" width="74" height="1" border="0" alt=""></td>
   <td><img src="spacer.gif" width="74" height="1" border="0" alt=""></td>
   <td><img src="spacer.gif" width="74" height="1" border="0" alt=""></td>
   <td><img src="spacer.gif" width="74" height="1" border="0" alt=""></td>
   <td><img src="spacer.gif" width="74" height="1" border="0" alt=""></td>
   <td><img src="spacer.gif" width="74" height="1" border="0" alt=""></td>
   <td><img src="spacer.gif" width="5" height="1" border="0" alt=""></td>
   <td><img src="spacer.gif" width="1" height="1" border="0" alt=""></td>
  </tr>

  <tr><!-- row 1 -->
   <td colspan="15"><img name="header1cfm_r1_c1" src="header1.cfm_r1_c1.gif" width="893" height="90" border="0" alt=""></td>
   <td><img src="spacer.gif" width="1" height="90" border="0" alt=""></td>
  </tr>
  <tr><!-- row 2 -->
   <td><a href="#" onMouseOut="MM_startTimeout();" onMouseOver="MM_showMenu(window.mm_menu_0908113053_0,0,20,null,'header1cfm_r2_c1');"><img name="header1cfm_r2_c1" src="header1.cfm_r2_c1.gif" width="74" height="20" border="0" alt=""></a></td>
   <td><a href="#" onMouseOut="MM_startTimeout();" onMouseOver="MM_showMenu(window.mm_menu_0908113245_1,0,20,null,'header1cfm_r2_c2');"><img name="header1cfm_r2_c2" src="header1.cfm_r2_c2.gif" width="68" height="20" border="0" alt=""></a></td>
   <td colspan="2"><a href="#" onMouseOut="MM_startTimeout();" onMouseOver="MM_showMenu(window.mm_menu_0908113345_2,0,20,null,'header1cfm_r2_c3');"><img name="header1cfm_r2_c3" src="header1.cfm_r2_c16.gif" width="74" height="20" border="0" alt=""></a></td>
   <td><img name="header1cfm_r2_c5" src="header1.cfm_r2_c5.gif" width="6" height="20" border="0" alt=""></td>

	   <td><a href="#" onMouseOut="MM_startTimeout();" onMouseOver="MM_showMenu(window.mm_menu_0908113705_5,0,20,null,'header1cfm_r2_c8');"><img name="header1cfm_r2_c8" src="header1.cfm_r2_c8.gif" width="74" height="20" border="0" alt=""></a></td>
   <td><a href="#" onMouseOut="MM_startTimeout();" onMouseOver="MM_showMenu(window.mm_menu_0908113728_6,0,20,null,'header1cfm_r2_c9');"><img name="header1cfm_r2_c9" src="header1.cfm_r2_c9.gif" width="74" height="20" border="0" alt=""></a></td>
   <td><a href="#" onMouseOut="MM_startTimeout();" onMouseOver="MM_showMenu(window.mm_menu_0908113751_7,0,20,null,'header1cfm_r2_c10');"><img name="header1cfm_r2_c10" src="header1.cfm_r2_c10.gif" width="74" height="20" border="0" alt=""></a></td>
   <td><a href="#" onMouseOut="MM_startTimeout();" onMouseOver="MM_showMenu(window.mm_menu_0908113813_8,0,20,null,'header1cfm_r2_c11');"><img name="header1cfm_r2_c11" src="header1.cfm_r2_c11.gif" width="74" height="20" border="0" alt=""></a></td>
   <td><a href="#" onMouseOut="MM_startTimeout();" onMouseOver="MM_showMenu(window.mm_menu_0908113836_9,0,20,null,'header1cfm_r2_c12');"><img name="header1cfm_r2_c12" src="header1.cfm_r2_c12.gif" width="74" height="20" border="0" alt=""></a></td>
   <td><a href="#" onMouseOut="MM_startTimeout();" onMouseOver="MM_showMenu(window.mm_menu_0908114100_10,0,20,null,'header1cfm_r2_c13');"><img name="header1cfm_r2_c13" src="header1.cfm_r2_c13.gif" width="74" height="20" border="0" alt=""></a></td>
   <td><a href="#" onMouseOut="MM_startTimeout();" onMouseOver="MM_showMenu(window.mm_menu_0908114249_11,0,20,null,'header1cfm_r2_c14');"><img name="header1cfm_r2_c14" src="header1.cfm_r2_c14.gif" width="74" height="20" border="0" alt=""></a></td>
   <td><img name="header1cfm_r2_c15" src="header1.cfm_r2_c15.gif" width="5" height="20" border="0" alt=""></td>
   <td><img src="spacer.gif" width="1" height="20" border="0" alt=""></td>
  </tr>
<!--   This HTML was automatically created with Macromedia Fireworks   -->
<!--   https://www.macromedia.com   -->
</table>
<!--========================= STOP COPYING THE HTML HERE =========================-->
</body>
</html>
