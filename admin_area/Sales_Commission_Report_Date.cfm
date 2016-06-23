<CFPARAM NAME="a_trigger" DEFAULT="0">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head><script language="JavaScript" src="calendar2.js"></script>
<title>Page title</title>
</head>
<body>
<CFFORM NAME="frm" ACTION="./Sales_Commission_Report_Result2.cfm?uid=#url.uid#" METHOD=POST>
    <table width="75%" Border="0">


        <TR>
            <td colspan="2">
                <B><Center>Sales Commission Report</center></B>
            </td>     
        </TR>
        <CFIF #a_trigger# eq "1">
        <TR>
            <td  colspan="2">
                <FONT FACE=verdana SIZE=3 color="red">
                <Center>You did not enter a start or end date.</center>
                </font>
            </td>     
        </TR>
        </CFIF>
        <CFIF #a_trigger# eq "2">
        <TR>
            <td  colspan="2">
                <FONT FACE=verdana SIZE=3 color="red">
                <Center>You did not enter a valid start or a valid end date.</center>
                </font>
            </td>     
        </TR>
        </CFIF>
        <TR>
            <td  colspan="2">
                <FONT FACE=verdana SIZE=2 color="red">
                <Center>Please enter your start and end dates by Clicking on each Calendar</center>
                </font>
            </td>     
        </TR>
        <tr colspan = "2">
		    <td>
			    <b>FROM:  </b><input type="Text" name="startdate" value="">
				<a href="javascript:cal5.popup();"><img src="images/cal.gif" width="16" height="16" border="0" alt="Click Here to Pick the start date"></a>
            </td>
            <td Align="Right">                	
				<b>TO:  </b><input type="Text" name="enddate" value="">
				<a href="javascript:cal6.popup();"><img src="images/cal.gif" width="16" height="16" border="0" alt="Click Here to Pick the end date"></a>
		    </td>
	    </tr>
        <tr>
            <td colspan="2"><BR><BR></TD>
        </tr>
	    <tr >
		    <td colspan="2" align=center valign=top>
			   <input type="checkbox" name="text_only" value="1"> Check this box for "text only" results <INPUT TYPE=image src="./images/button_proceed.gif" border=0> 	
		    </td>
	    </tr>
    </table>    
</CFFORM>
<script language="JavaScript">
			<!-- // create calendar object(s) just after form tag closed
				 // specify form element as the only parameter (document.forms['formname'].elements['inputname']);
				 // note: you can have as many calendar objects as you need for your application
				
				var cal5 = new calendar2(document.forms['frm'].elements['startdate']);
				cal5.year_scroll = true;
				cal5.time_comp = false;
				
				var cal6 = new calendar2(document.forms['frm'].elements['enddate']);
				cal6.year_scroll = true;
				cal6.time_comp = false;
				
			//-->
</script>	
</body>
</html>
