<CFPARAM NAME="a_flag" DEFAULT="0">
<CFSET r_count = "0">

<!---Included a new cfm file with enhanced query performance. This cfm file is used to populate the client multiselect box--->
<CFINCLUDE TEMPLATE="./includes/companies.cfm">

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_states" cachedwithin="#CreateTimeSpan(0,0,5,0)#">

			SELECT *
			FROM first_title_states
			ORDER BY st_abbrev ASC

</CFQUERY>

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_vendor_list">
	SELECT distinct *
	FROM Abstractors
	ORDER BY company ASC
</CFQUERY>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0in Transitional//EN">

<html>
	<head>
		<title>1st Title & Escrow, Inc. </title>


		<script type="text/javascript">
			function monthresult() {
			var frm;
			frm = document.frm;
			
			
			if (frm.confirm_mon.value != 'Month') 
				{
				
				  frm.confirm_mon_to.value = frm.confirm_mon.options[frm.confirm_mon.selectedIndex].value;
				
				}
		}

</script> 
 
<style >
	
	.comboBoxStyle
	{
		
		font-size: 9;
		font-family: verdana;
		font-style: normal;
		color: blue;
		background-color: e1e1e1;
		border-color: e1e1e1;
		border-left-width: thin;
		border-right-width: thin;
		border-top-width: thin;
		border-bottom-width: thin;
		border-width: thin;
		border-style: bar;
		clear: none;
		float: none;
		
	}
	
	.inputBoxStyle
	{
		
		font-size: 9;
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
		clear: none;
				
	}
	
	.MultipleDropBoxStyle
	{
		size=5;
		font-size: 9;
		font-family: verdana;
		font-style: normal;
		color: blue;
		background-color: e1e1e1;
		border-color: e1e1e1;
		border-left-width: thin;
		border-right-width: thin;
		border-top-width: thin;
		border-bottom-width: thin;
		border-width: thin;
		border-style: bar;
		clear: none;
		float: none;
	}

	
</style>  

<script type="text/javascript">
var browserType;

	if (document.layers) {browserType = "nn4"}
	if (document.all) {browserType = "ie"}
	if (window.navigator.userAgent.toLowerCase().match("gecko")) 
	{
 		browserType= "gecko"
	}

	function hide(whichelement) {
  		if (browserType == "gecko" )
     		document.poppedLayer =
         	eval('document.getElementById(whichelement)');
  		else if (browserType == "ie")
     		document.poppedLayer =
       		eval('document.getElementById(whichelement)');
		else
			document.poppedLayer =
			eval('document.layers[whichelement]');
			document.poppedLayer.style.display = "none";
}

function show(whichelement) {
	if (browserType == "gecko" )
    	document.poppedLayer =
        eval('document.getElementById(whichelement)');
 	else if (browserType == "ie")
		document.poppedLayer =
		eval('document.getElementById(whichelement)');
  	else
		document.poppedLayer =
		eval('document.layers[whichelement]');
  		document.poppedLayer.style.display = "inline";
}


/*
	Toggling the table rows based on product selection.
*/
function doHideShow(ProductId){
	
		var SelectedProductId= (ProductId - 1);
		
		for(var a=1;a<=9;a++){
		if(a==ProductId){
			show("div"+a);
			
			show("trtxt"+a);
			
			show("trSort"+a);
			if (a==2) {
				show("divabstract");
			}
			
			if (a==1){
				show("trNote");
			}
			else
			{
				hide("trNote");
			}
			
		}else{
			hide("div"+a);
			hide("trSort"+a);
			
			hide("trtxt"+a);

			if (a==2) {
				hide("divabstract");
			}
		}
	}
	
	ResetControls();
	
	HeaderMessage(SelectedProductId);	
}

/*
	Resets all the dropdowns with their default values on every product selection changed event
*/
function ResetControls()
{

	document.getElementById("title_id").value="";
	document.getElementById("prop_id").value="";
	document.getElementById("app_id").value="";
	document.getElementById("anc_id").value="";
	document.getElementById("cr_id").value="";
	document.getElementById("avm_id").value="";
	document.getElementById("sn_id").value="";
	document.getElementById("Clos_id").value="";
	document.getElementById("loan_number").value="";
	document.getElementById("buyer_fname").value="";
	document.getElementById("buyer_lname").value="";
	
	var elements = document.getElementsByTagName("SELECT");
	
	for (var i=0; i< elements.length; i++ ) 
	{
		
		var element=elements[i];
		
		if (element.name == "PRODUCTCHOICECBX")
		{
			/*
				do nothing
				*/
		}
		else
		{
			element.selectedIndex=0;
		}
	}	
		
}

function HeaderMessage(MessageId)
{
	switch (MessageId)
	{
		case 1:
		document.getElementById("Header1").innerHTML="<B>Statistics Search Engine for Title</B>";
		document.getElementById("tdColor").bgColor="Green";
		break;
		
		case 2:
		document.getElementById("Header1").innerHTML="<B>Statistics Search Engine for Property</B>";
		document.getElementById("tdColor").bgColor="Purple";
		break;
		
		case 3:
		document.getElementById("Header1").innerHTML="<B>Statistics Search Engine for Appraisal</B>";
		document.getElementById("tdColor").bgColor="Navy";
		break;
		
		case 4:
		document.getElementById("Header1").innerHTML="<B>Statistics Search Engine for Flood</B>";
		document.getElementById("tdColor").bgColor="Black";
		break;
		
		case 5:
		document.getElementById("Header1").innerHTML="<B>Statistics Search Engine for Credit</B>";
		document.getElementById("tdColor").bgColor="Brown";
		break;
		
		case 6:
		document.getElementById("Header1").innerHTML="<B>Statistics Search Engine for AVM</B>";
		document.getElementById("tdColor").bgColor="Red";
		break;
		
		case 7:
		document.getElementById("Header1").innerHTML="<B>Statistics Search Engine for Signing</B>";
		document.getElementById("tdColor").bgColor="Orange";
		break;
		
		case 8:
		document.getElementById("Header1").innerHTML="<B>Statistics Search Engine for Closing</B>";	
		document.getElementById("tdColor").bgColor="Blue";	
		break;
		
		default:
		document.getElementById("Header1").innerHTML="<B>Statistics Search Engine for ALL products</B>";
		document.getElementById("tdColor").bgColor="Gray";
		
		
	}
}

function InputValidation(txtInputobj,helperMsg)
{
		/* 
		 * We wanted to see if the input's string was all numbers so we made a regular expression to check for numbers [0-9] and 
		 * stored it as numericExpression. We then used the match function with our regular expression. 
		 * If it is numeric then match will return true, making our if statement pass the test and our function InputValidation
		 * will also return true. However, if the expression fails because there is a letter or other character in our input's string
		 * then we'll display our helperMsg and return false.
		*/
		var numericExpression = /^[0-9]+$/;
		
		if (txtInputobj.value != "") {
			if (txtInputobj.value.match(numericExpression)) {
				return true;
			}
			else {
				alert(helperMsg);
				txtInputobj.focus();
				return false;
			}
		}
}

</script>

<script type="text/javascript">
function dayresult() 
{
	var frm;
	frm = document.frm;
	if (frm.comfirm_day.value != 'Day') 
	{
	 	frm.comfirm_day_to.value = frm.comfirm_day.options[frm.comfirm_day.selectedIndex].value;
	}
}
</script>
<script type="text/javascript">
function yearresult() 
{
	var frm;
	frm = document.frm;
	if (frm.confirm_year.value != 'Year') {
	
	frm.confirm_year_to.value = frm.confirm_year.options[frm.confirm_year.selectedIndex].value;
	}
}

</script>
<script type="text/javascript">
function stateSelect() 
{
	var frm;
	frm = document.frm;
	frm.state.options[0].selected = false;
}

</script>
</head>

 


<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>


<CENTER>
						<!---Clubbed all 8 forms into one single form to enhance page loading --->
						<CFFORM NAME="frm" ACTION="./title_statistics_display.cfm?uid=#URL.uid#&al=#URL.al#" METHOD=POST>
												
						<INPUT type="hidden" name="update" value="no"><INPUT type="hidden" name="uid" value="URL.uid">
						<INPUT type="hidden" name="al" value="URL.al">
						
						
						<input type="hidden" value="-1" id="productTypeHdnValue"> 
				             <table width="100"% cellpadding="1" cellspacing="1" border="0" bgcolor="gray" >
				                <tr>
				                  <td width="780" align="center" valign="top">
				
				                    <table width="780" cellpadding="1" cellspacing="1" border="0" bgcolor="white">
				                      <tr>
				                        <td width="780" align="center" valign="top" bgcolor=e1e1e1>
				
				                          <table width="780" cellpadding="1" cellspacing="1" border="0" bgcolor="d3d3d3"> 
				                            <tr>
				                              <td id="tdColor" width="780" align="left" valign="top" bgcolor="gray">
				                                <FONT FACE="ARIAL" SIZE="2" color="white">
				                                  <CENTER id="Header1">
				                                   <B> Statistics Search Engine for ALL products</B>
				                                  </CENTER>
				                                  </td>
				                                  </tr>

                                  <tr>
                                    <td width="780" align="center" valign="top" bgcolor="d3d3d3">
                                      <table width="780" cellpadding="1" cellspacing="1" border="0">


                                        <table width="350" cellpadding="1" cellspacing="1" border="0">
                                          <tr>
                                            <td bgcolor="d3d3d3" width="350" align="center" valign="top">
                                              <br>
                                                <FONT FACE="verdana" SIZE="1" color="blUE">
                                                  <B>
                                                    SELECT A PRODUCT</b>
                                                  </td>
                                          </tr>
                                          <td bgcolor="d3d3d3" width="350" align="center" valign="top">

                                            <select id="productCbxId" class="comboBoxStyle" name="PRODUCTCHOICECBX" onChange="doHideShow(this.selectedIndex+1);">
                                              <OPTION VALUE="1" selected="">All</OPTION>
                                              <OPTION VALUE="2">Title</OPTION>
                                              <OPTION VALUE="3">Property</OPTION>
                                              <OPTION VALUE="4">Appraisal</OPTION>
                                              <OPTION VALUE="5">Flood</OPTION>
                                              <OPTION VALUE="6">Credit</OPTION>
                                              <OPTION VALUE="7">AVM</OPTION>
                                              <OPTION VALUE="8">Signing</OPTION>
                                              <OPTION VALUE="9">Closing</OPTION>
                                            </select>
                                          </td>
                                        </tr>
                                </table>





                          <table width="600" cellpadding="1" cellspacing="1" border="0">
                            <tr>
                           
                                <td bgcolor="d3d3d3" width="600" align="center" valign="top">
                                  <br>
                                    <FONT FACE="verdana" SIZE="1" color="black">
                                      <B>FROM</B>
                                      <select name="confirm_mon" onChange="monthresult()"
                                        class="comboBoxStyle"
                                        rows="3"
                                        cols="45"
											>
                                        <option value="Month">Month</option>
                                        <option value="01">January</option>
                                        <option value="02">February</option>
                                        <option value="03">March</option>
                                        <option value="04">April</option>
                                        <option value="05">May</option>
                                        <option value="06">June</option>
                                        <option value="07">July</option>
                                        <option value="08">August</option>
                                        <option value="09">September</option>
                                        <option value="10">October</option>
                                        <option value="11">November</option>
                                        <option value="12">December</option>
                                      </select>

                                      <select name="comfirm_day" onChange="dayresult()"
                                                        class="comboBoxStyle"
                                                        rows="3"
                                                        cols="45"
																			>
                                        <OPTION VALUE="Day">Day</OPTION>

                                        <OPTION VALUE="01">01</OPTION>
                                        <OPTION VALUE="02">02</OPTION>
                                        <OPTION VALUE="03">03</OPTION>
                                        <OPTION VALUE="04">04</OPTION>
                                        <OPTION VALUE="05">05</OPTION>
                                        <OPTION VALUE="06">06</OPTION>
                                        <OPTION VALUE="07">07</OPTION>
                                        <OPTION VALUE="08">08</OPTION>
                                        <OPTION VALUE="09">09</OPTION>
                                        <OPTION VALUE="10">10</OPTION>
                                        <OPTION VALUE="11">11</OPTION>
                                        <OPTION VALUE="12">12</OPTION>
                                        <OPTION VALUE="13">13</OPTION>
                                        <OPTION VALUE="14">14</OPTION>
                                        <OPTION VALUE="15">15</OPTION>
                                        <OPTION VALUE="16">16</OPTION>
                                        <OPTION VALUE="17">17</OPTION>
                                        <OPTION VALUE="18">18</OPTION>
                                        <OPTION VALUE="19">19</OPTION>
                                        <OPTION VALUE="20">20</OPTION>
                                        <OPTION VALUE="21">21</OPTION>
                                        <OPTION VALUE="22">22</OPTION>
                                        <OPTION VALUE="23">23</OPTION>
                                        <OPTION VALUE="24">24</OPTION>
                                        <OPTION VALUE="25">25</OPTION>
                                        <OPTION VALUE="26">26</OPTION>
                                        <OPTION VALUE="27">27</OPTION>
                                        <OPTION VALUE="28">28</OPTION>
                                        <OPTION VALUE="29">29</OPTION>
                                        <OPTION VALUE="30">30</OPTION>
                                        <OPTION VALUE="31">31</OPTION>
                                      </select>

                                      <select name="confirm_year" onChange="yearresult()"
                                                         class="comboBoxStyle"
                                                          rows="3"
                                                          cols="45"
																			>
                                        <option value="Year">Year</option>
                                        <option value="2000">2000</option>
                                        <option value="2001">2001</option>
                                        <option value="2002">2002</option>
                                        <option value="2003">2003</option>
                                        <option value="2004">2004</option>
                                        <option value="2005">2005</option>
                                        <option value="2006">2006</option>
                                        <option value="2007">2007</option>
                                        <option value="2008">2008</option>
                                        <option value="2009">2009</option>
                                        <option value="2010">2010</option>
                                        <option value="2011">2011</option>
                                        <option value="2012">2012</option>
                                        <option value="2013">2013</option>
                                        <option value="2014">2014</option>
                                        <option value="2015">2015</option>
<option value="2016">2016</option>
<option value="2017">2017</option>
<option value="2018">2018</option>
<option value="2019">2019</option>
<option value="2020">2020</option>
                                      </select>
                                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <B>TO</B>

                                      <select name="confirm_mon_to"
                                       class="comboBoxStyle"
                                                          rows="3"
                                                          cols="45"
																			>

                                        <option value="Month">Month</option>
                                        <option value="01">January</option>
                                        <option value="02">February</option>
                                        <option value="03">March</option>
                                        <option value="04">April</option>
                                        <option value="05">May</option>
                                        <option value="06">June</option>
                                        <option value="07">July</option>
                                        <option value="08">August</option>
                                        <option value="09">September</option>
                                        <option value="10">October</option>
                                        <option value="11">November</option>
                                        <option value="12">December</option>
                                      </select>

                                      <select name="comfirm_day_to"
                                                          class="comboBoxStyle"
                                                          rows="3"
                                                          cols="45"
																			>
                                        <OPTION VALUE="Day">Day</OPTION>
                                        <OPTION VALUE="01">01</OPTION>
                                        <OPTION VALUE="02">02</OPTION>
                                        <OPTION VALUE="03">03</OPTION>
                                        <OPTION VALUE="04">04</OPTION>
                                        <OPTION VALUE="05">05</OPTION>
                                        <OPTION VALUE="06">06</OPTION>
                                        <OPTION VALUE="07">07</OPTION>
                                        <OPTION VALUE="08">08</OPTION>
                                        <OPTION VALUE="09">09</OPTION>
                                        <OPTION VALUE="10">10</OPTION>
                                        <OPTION VALUE="11">11</OPTION>
                                        <OPTION VALUE="12">12</OPTION>
                                        <OPTION VALUE="13">13</OPTION>
                                        <OPTION VALUE="14">14</OPTION>
                                        <OPTION VALUE="15">15</OPTION>
                                        <OPTION VALUE="16">16</OPTION>
                                        <OPTION VALUE="17">17</OPTION>
                                        <OPTION VALUE="18">18</OPTION>
                                        <OPTION VALUE="19">19</OPTION>
                                        <OPTION VALUE="20">20</OPTION>
                                        <OPTION VALUE="21">21</OPTION>
                                        <OPTION VALUE="22">22</OPTION>
                                        <OPTION VALUE="23">23</OPTION>
                                        <OPTION VALUE="24">24</OPTION>
                                        <OPTION VALUE="25">25</OPTION>
                                        <OPTION VALUE="26">26</OPTION>
                                        <OPTION VALUE="27">27</OPTION>
                                        <OPTION VALUE="28">28</OPTION>
                                        <OPTION VALUE="29">29</OPTION>
                                        <OPTION VALUE="30">30</OPTION>
                                        <OPTION VALUE="31">31</OPTION>
                                      </select>

                                      <select name="confirm_year_to"
                                                         class="comboBoxStyle"
                                                          rows="3"
                                                          cols="45">
                                                          																				>
                                        <option value="Year">Year</option>
                                        <option value="2000">2000</option>
                                        <option value="2001">2001</option>
                                        <option value="2002">2002</option>
                                        <option value="2003">2003</option>
                                        <option value="2004">2004</option>
                                        <option value="2005">2005</option>
                                        <option value="2006">2006</option>
                                        <option value="2007">2007</option>
                                        <option value="2008">2008</option>
                                        <option value="2009">2009</option>
                                        <option value="2010">2010</option>
                                        <option value="2011">2011</option>
                                        <option value="2012">2012</option>
                                        <option value="2013">2013</option>
                                        <option value="2014">2014</option>
                                        <option value="2015">2015</option>
 <option value="2016">2016</option>
<option value="2017">2017</option>
<option value="2018">2018</option>
<option value="2019">2019</option>
<option value="2020">2020</option>
                                     </select>
                                      </td>
                                      </tr>                                     
                                     </table>                                    

                                      <table width="600" cellpadding="1" cellspacing="1" border="0">                                       
									   
									    <!---All--->		
										<!---User would type the correct number while performing search instead off selecting from dropdown--->
										<tr id="trtxt1" style="display:none">
										
										</tr>
										
										<!---Title---> 
										<tr id="trtxt2" style="display:none">                                       
                                                <td bgcolor="d3d3d3" width="250" align="right" valign="top">
                                                  <FONT FACE="verdana" SIZE="1" color="black">
														Title Number
										         </td>

                                                <td bgcolor="d3d3d3" width="400" align="left" valign="top">
                                                  <input type="text" name="title_id" onfocusout="InputValidation(this,'Numbers only please');" class="inputBoxStyle"  size="25" maxlength="25">
												</td>
                                      </tr>                                                
                                      <tr id="trtxt3" style="display:none">         
											  	<td bgcolor="d3d3d3" width="250" align="right" valign="top">
                                                  <FONT FACE="verdana" SIZE="1" color="black">
													Property Number
												</td>

                                                <td bgcolor="d3d3d3" width="400" align="left" valign="top">
                                                  <input type="text" name="prop_id" onfocusout="InputValidation(this,'Numbers only please');"  size="25" maxlength="25" class="inputBoxStyle">
												</td>
                                     </tr>
									 <tr id="trtxt4" style="display:none">      
                                                <td bgcolor="d3d3d3" width="250" align="right" valign="top">
                                                  <FONT FACE="verdana" SIZE="1" color="black">
													Appraisal Number
												</td>

                                                <td bgcolor="d3d3d3" width="400" align="left" valign="top">
                                                  <input type="text" name="app_id" onfocusout="InputValidation(this,'Numbers only please');"  size="25" maxlength="25" class="inputBoxStyle">
												</td>
                                     </tr> 
									 <tr id="trtxt5" style="display:none">
                                                <td bgcolor="d3d3d3" width="250" align="right" valign="top">
                                                  <FONT FACE="verdana" SIZE="1" color="black">
													Flood Number
												</td>

                                                <td bgcolor="d3d3d3" width="400" align="left" valign="top">
                                                  <input type="text" name="anc_id" onfocusout="InputValidation(this,'Numbers only please');"  size="25" maxlength="25"  class="inputBoxStyle">
												</td>
                                     </tr> 
									 <tr id="trtxt6" style="display:none">        
                                                <td bgcolor="d3d3d3" width="250" align="right" valign="top">
                                                  <FONT FACE="verdana" SIZE="1" color="black">
													Credit Number
												</td>

                                                <td bgcolor="d3d3d3" width="400" align="left" valign="top">
                                                  <input type="text" name="cr_id" onfocusout="InputValidation(this,'Numbers only please');"  size="25" maxlength="25" Title="" Number="" class="inputBoxStyle">
												</td>
                                     </tr> 
									 <tr id="trtxt7" style="display:none">
                                                <td bgcolor="d3d3d3" width="250" align="right" valign="top">
                                                  <FONT FACE="verdana" SIZE="1" color="black">
													AVM Number
												</td>

                                                <td bgcolor="d3d3d3" width="400" align="left" valign="top">
                                                  <input type="text" name="avm_id" onfocusout="InputValidation(this,'Numbers only please');"  size="25" maxlength="25" Title="" Number="" class="inputBoxStyle">
												</td>
                                  	</tr> 
									 <tr id="trtxt8" style="display:none">            
                                                <td bgcolor="d3d3d3" width="250" align="right" valign="top">
                                                  <FONT FACE="verdana" SIZE="1" color="black">
													Signing Number
												</td>

                                                <td bgcolor="d3d3d3" width="400" align="left" valign="top">
                                                  <input type="text" name="sn_id" onfocusout="InputValidation(this,'Numbers only please');"  size="25" maxlength="25" Title="" Number="" class="inputBoxStyle">
												</td>
                                      </tr> 
									 <tr id="trtxt9" style="display:none">
                                                <td bgcolor="d3d3d3" width="250" align="right" valign="top">
                                                  <FONT FACE="verdana" SIZE="1" color="black">
											         Closing Number
										        </td>

                                                <td bgcolor="d3d3d3" width="400" align="left" valign="top">
                                                  <input type="text" name="Clos_id" onfocusout="InputValidation(this,'Numbers only please');"  size="25" maxlength="25" class="inputBoxStyle">
												</td>
	                                      </tr>
									   
									    <br>

                                          <tr>
                                            <td bgcolor="d3d3d3" width="250" align="right" valign="top">
                                              <FONT FACE="verdana" SIZE="1" color="black">
													Loan Number -
											</td>

                                            <td bgcolor="d3d3d3" width="400" align="left" valign="top">
                                              <input type="text" name="loan_number" onfocusout="InputValidation(this,'Numbers only please');" size="15" maxlength="15"
                                                
                                                class="inputBoxStyle"
										>
                                              </td>
                                          </tr>

                                          <tr>
                                            <td bgcolor="d3d3d3" width="250" align="right" valign="top">
                                              <FONT FACE="verdana" SIZE="1" color="black">
												Clients
											</td>
                                            <td bgcolor="d3d3d3" width="400" align="left" valign="top">
                                              <SELECT NAME="company_id"	multiple class="MultipleDropBoxStyle" >

                                                <OPTION VALUE="NONE" selected="">N/A</OPTION>
                                                <CFOUTPUT QUERY="get_all_comps">
                                                  <OPTION VALUE="#get_all_comps.ID#">#get_all_comps.Company#</OPTION>
                                                </CFOUTPUT>
                                              </SELECT>
                                            </td>
                                          </tr>

                                          <tr id="divabstract" style="display: none">
                                            <td bgcolor="d3d3d3" width="250px" align="right" valign="top">
                                              <font FACE="verdana" size="1" color="black">
												Abstractor
											</td>

                                            <td>
                                              <SELECT NAME="Abstractor" class="comboBoxStyle">
                                                <OPTION VALUE="NONE">N/A</OPTION>
                                                <cfoutput query="read_vendor_list">
                                                  <option value="#abstractor_id#" style="thin">
                                                    #company#</OPTION>
                                                  </cfoutput>
                                              </SELECT>                                              
                                            </td>
                                          </tr>

                                          <tr>
                                            <!--- ================================================== --->
                                            <td bgcolor="d3d3d3" width="250" align="right" valign="top">
                                              <FONT FACE="verdana" SIZE="1" color="black">
									Status
								</td>

                                            <td bgcolor="d3d3d3" width="400" align="left" valign="top">
                                              <SELECT NAME="Appraisal_status"
                                                size="1"
                                                class="comboBoxStyle"
                                                rows="5"
                                                cols="45"
										>
                                                <OPTION VALUE="NONE">N/A</OPTION>
                                                <option value="In Process" style="thin">
                                                  In Process</OPTION>
                                                  <option value="In Typing">
                                                    In Typing</OPTION>
                                                    <option value="Report E-mailed" style="thin">
                                                      Report E-mailed</OPTION>
                                                      <option value="Report Faxed" style="thin" >
                                                        Report Faxed</OPTION>
                                                      </SELECT>
                                            </td>
                                          </tr>
                                          <tr>
                                            <td bgcolor="d3d3d3" width="250" align="right" valign="top">
                                              <FONT FACE="verdana" SIZE="1" color="black">
									Comments
								</td>

                                            <td bgcolor="d3d3d3" width="400" align="left" valign="top">
                                              <SELECT NAME="comments"
                                                size="1"
                                                class="comboBoxStyle"
                                                rows="5"
                                                cols="45">
                                                <OPTION VALUE="NONE">N/A</OPTION>
                                                <option value="Call for Detail">
                                                  Call for Detail</OPTION>
                                                  <option value="Cancelled per client" style="thin">
                                                    Cancelled per client</OPTION>
                                                    <option value="Clear to Close">
                                                      Clear to Close</OPTION>
                                                      <option value="Court House Closed">
                                                        Court House Closed</OPTION>
                                                        <option value="FT Shipped Pack" style="thin">
                                                          FT Shipped Pack</OPTION>
                                                          <option value="Funds Not Received" style="thin">
                                                            Funds Not Received</OPTION>
                                                            <option value="Judgments Exist">
                                                              Judgments Exist</OPTION>
                                                              <option value="Mortgage Rejected">
                                                                Mortgage Rejected</OPTION>
                                                                <option value="Mortgage Rejection Satisfied">
                                                                  Mortgage Rejection Satisfied</OPTION>
                                                                  <option value="Name/Address found not matching order">
                                                                    Name/Address found not matching order</OPTION>
                                                                    <option value="Not Clear to Close">
                                                                      Not Clear to Close</OPTION>
                                                                      <option value="OK to fund" style="thin">
                                                                        OK to fund</OPTION>
                                                                        <option value="Order Reinstated" style="thin">
                                                                          Order Reinstated</OPTION>
                                                                          <option value="Package Received" style="thin">
                                                                            Package Received</OPTION>
                                                                            <option value="Package Due/Unrec." style="thin">
                                                                              Package Due/Unrec.</OPTION>
                                                                              <option value="Pre-Funding Completed" style="thin">
                                                                                Pre-Funding Completed</OPTION>
                                                                                <option value="Pre-Funding Problem" style="thin">
                                                                                  Pre-Funding Problem</OPTION>
                                                                                  <option value="Subordination Needed">
                                                                                    Subordination Needed</OPTION>
                                                                                    <option value="Subordination Received">
                                                                                      Subordination Received</OPTION>
                                                                                      <option value="Supervisor Notification" style="thin">
                                                                                        Supervisor Notification</OPTION>
                                                                                        <option value="Unreleased Mortgages Exists">
                                                                                          Unreleased Mortgages Exists</OPTION>
                                                                                          <option value="Vesting Issue">
                                                                                            Vesting Issue</OPTION>
                                                                                            <option value="Waiting on Judgment Info">
                                                                                              Waiting on Judgment Info</OPTION>
                                                                                              <option value="Waiting on Tax Info.">
                                                                                                Waiting on Tax Info.</OPTION>
                                                                                              </SELECT>
                                            </td>
                                          </tr>

                                          <tr>
                                            <td bgcolor="d3d3d3" width="250" align="right" valign="top">
                                              <FONT FACE="verdana" SIZE="1" color="black">
									Buyer First Name -
								</td>

                                            <td bgcolor="d3d3d3" width="400" align="left" valign="top">
                                              <input type="text" name="buyer_fname" size="25" maxlength="15"
										
                                               class="inputBoxStyle" >
                                              </td>
                                          </tr>
                                          <!--- ================================================== --->
                                          <tr>
                                            <td bgcolor="d3d3d3" width="250" align="right" valign="top">
                                              <FONT FACE="verdana" SIZE="1" color="black">
									Buyer Last Name -
								</td>

                                            <td bgcolor="d3d3d3" width="400" align="left" valign="top">
                                              <input type="text" name="buyer_lname"  size="25" maxlength="25"
										
                                               class="inputBoxStyle" >
                                              </td>
                                          </tr>
                                          <tr>
                                            <td bgcolor="d3d3d3" width="250" align="right" valign="top">
                                              <FONT FACE="verdana" SIZE="1" color="black">
									State
								</td>

                                            <td bgcolor="d3d3d3" width="400" align="left" valign="top">
                                              <SELECT NAME="state" multiple class="MultipleDropBoxStyle" >
                                                <OPTION VALUE="none" selected="">ALL</OPTION>
                                                <CFLOOP FROM="1" TO="#ArrayLen(a_list_of_all_states_1)#" INDEX="NNN">
                                                  <CFOUTPUT>
                                                    <option value="#a_list_of_all_states_1[NNN]#">#a_list_of_all_states_1[NNN]#</option>
                                                  </CFOUTPUT>
                                                </CFLOOP>

                                              </SELECT>
                                              <FONT FACE="verdana" SIZE="1" color="black">(ALL should not be selected if you select state(s))
                             			 </td>
                                          </tr>
                                          <tr id="trSort1">
                                            <td bgcolor="d3d3d3" width="250" align="right" valign="top">
                                              <FONT FACE="verdana" SIZE="1" color="black">
												Sort By
											</td>

                                            <td bgcolor="d3d3d3" width="400" align="left" valign="top">
                                                <SELECT NAME="sortorder" class="comboBoxStyle">
                                                  <OPTION VALUE="NONE">N/A</OPTION>
                                                  <OPTION VALUE="comments">Comments</OPTION>
                                                  <OPTION VALUE="appraisal_status">Status</OPTION>
                                                </SELECT>
											</td>
                                          </tr>
										
                                              <!---Title--->
                                              <tr id="trSort2"  style="display:none">
												 <td bgcolor="d3d3d3" width="250" align="right" valign="top">
                                             		 <FONT FACE="verdana" SIZE="1" color="black">
														Sort By
												</td>

	                                            <td bgcolor="d3d3d3" width="400" align="left" valign="top">
	                                                <SELECT NAME="sortorder" class="comboBoxStyle">
	                                                  <OPTION VALUE="NONE">N/A</OPTION>
	                                                  <OPTION VALUE="a.check_date">Date Ordered</OPTION>
	                                                  <OPTION VALUE="a.title_id">Order Number</OPTION>
	                                                  <OPTION VALUE="appraisal_status">Status</OPTION>
	                                                  <OPTION VALUE="f.company">Abstractor</OPTION>
	                                                </SELECT>
												</td>
                                             </tr>
											 <tr id="trSort3"  style="display:none">
                                              <!---Property--->
                                              
                                               <td bgcolor="d3d3d3" width="250" align="right" valign="top">
                                             	 <FONT FACE="verdana" SIZE="1" color="black">
													Sort By
												</td>

	                                            <td bgcolor="d3d3d3" width="400" align="left" valign="top">
	                                                <SELECT NAME="sortorder" class="comboBoxStyle">
	                                                  <OPTION VALUE="NONE">N/A</OPTION>
	                                                  <OPTION VALUE="a.prop_id">Order Number</OPTION>
	                                                  <OPTION VALUE="comments">Comments</OPTION>
	                                                  <OPTION VALUE="appraisal_status">Status</OPTION>
	                                                </SELECT>
												</td>
                                             </tr>
											 <tr id="trSort4"  style="display:none">

                                              <!---Appraisal --->
                                              
                                               <td bgcolor="d3d3d3" width="250" align="right" valign="top">
                                              		<FONT FACE="verdana" SIZE="1" color="black">
													Sort By
												</td>

                                           		 <td bgcolor="d3d3d3" width="400" align="left" valign="top">
	                                                <SELECT NAME="sortorder" class="comboBoxStyle">
	                                                  <OPTION VALUE="NONE">N/A</OPTION>
	                                                  <OPTION VALUE="a.app_id">Order Number</OPTION>
	                                                  <OPTION VALUE="comments">Comments</OPTION>
	                                                  <OPTION VALUE="appraisal_status">Status</OPTION>
                                                	</SELECT>
												</td>
                                             </tr>
											 <tr id="trSort5"  style="display:none">
                                              <!---Flood --->
                                             	 <td bgcolor="d3d3d3" width="250" align="right" valign="top">
                                             		 <FONT FACE="verdana" SIZE="1" color="black">
													Sort By
												</td>

                                            	<td bgcolor="d3d3d3" width="400" align="left" valign="top">
	                                                <SELECT NAME="sortorder" class="comboBoxStyle">
	                                                  <OPTION VALUE="NONE">N/A</OPTION>
	                                                  <OPTION VALUE="a.anc_id">Order Number</OPTION>
	                                                  <OPTION VALUE="comments">Comments</OPTION>
	                                                  <OPTION VALUE="appraisal_status">Status</OPTION>
	                                                </SELECT>
												</td>
                                             </tr>
											 <tr id="trSort6"  style="display:none">
                                              <!---Credit--->
                                             	 <td bgcolor="d3d3d3" width="250" align="right" valign="top">
                                              		<FONT FACE="verdana" SIZE="1" color="black">
													Sort By
												</td>

	                                            <td bgcolor="d3d3d3" width="400" align="left" valign="top">
	                                                <SELECT NAME="sortorder" class="comboBoxStyle">
	                                                  <OPTION VALUE="NONE">N/A</OPTION>
	                                                  <OPTION VALUE="a.anc_id">Order Number</OPTION>
	                                                  <OPTION VALUE="comments">Comments</OPTION>
	                                                  <OPTION VALUE="appraisal_status">Status</OPTION>
	                                                </SELECT>
												</td>
                                             </tr>
											 <tr id="trSort7"  style="display:none">
                                              <!---AVM--->
	                                              <td bgcolor="d3d3d3" width="250" align="right" valign="top">
	                                             	 <FONT FACE="verdana" SIZE="1" color="black">
														Sort By
												  </td>

                                           		 <td bgcolor="d3d3d3" width="400" align="left" valign="top">
                                             
	                                             <SELECT NAME="sortorder" class="comboBoxStyle">
	                                                  <OPTION VALUE="NONE">N/A</OPTION>
	                                                  <OPTION VALUE="a.anc_id">Order Number</OPTION>
	                                                  <OPTION VALUE="comments">Comments</OPTION>
	                                                  <OPTION VALUE="appraisal_status">Status</OPTION>
	                                                </SELECT>
												</td>
                                             </tr>
											 <tr id="trSort8"  style="display:none">
                                              <!---Signing--->
	                                              <td bgcolor="d3d3d3" width="250" align="right" valign="top">
	                                              	<FONT FACE="verdana" SIZE="1" color="black">
														Sort By
												  </td>

		                                           <td bgcolor="d3d3d3" width="400" align="left" valign="top">
		                                                <SELECT NAME="sortorder" class="comboBoxStyle">
		                                                  <OPTION VALUE="NONE">N/A</OPTION>
		                                                  <OPTION VALUE="a.anc_id">Order Number</OPTION>
		                                                  <OPTION VALUE="comments">Comments</OPTION>
		                                                  <OPTION VALUE="appraisal_status">Status</OPTION>
		                                                </SELECT>
												   </td>
                                          	 </tr>
											 <tr id="trSort9"  style="display:none">
                                              <!---Closing--->
	                                            <td bgcolor="d3d3d3" width="250" align="right" valign="top">
	                                              <FONT FACE="verdana" SIZE="1" color="black">
													Sort By
												</td>

	                                            <td bgcolor="d3d3d3" width="400" align="left" valign="top">
	                                                <SELECT NAME="sortorder" class="comboBoxStyle">
	                                                  <OPTION VALUE="NONE">N/A</OPTION>
	                                                  <OPTION VALUE="f.request_date">Order date</OPTION>
	                                                  <OPTION VALUE="a.Title_id">Order Number</OPTION>
	                                                </SELECT>
												</td>
                                             </tr>											 
                                            </td>
                                          </tr>											 									  	
										 </table>
				                        </td>										
				                       </tr>
									   <td>
									   		 <tr>
                  <td >
                    <div id="div1" style="display: none; border-width: 1px; border-style: none;">


                    </div>


                    <div id="div2" style="display: none; border-width: 1px; border-style: none;">
                      <table width="800" cellpadding="1" cellspacing="1" border="0" bgcolor="d3d3d3"> 
 
						<input type="hidden" name="TitleEventsHdn" value="event1,event2,datamerged,event3,event4,event5,event7,event8,event9,event10,event11,event12,event13,event14,event16,event17,event20,event21,datanotmerged,clear_close">

                         <!---<br bgcolor="d3d3d3">--->
						 	 
						 		<!---<tr bgcolor="d3d3d3">
						 			<td>  </td>
						 		</tr>--->
							<br/>	 

                          <tr>
                            <td bgcolor="d3d3d3" width="75" align="right" valign="top">
                              <FONT FACE="verdana" SIZE="1" color="black">
                                <b>Fulfilled</b> Events
                            </td>
                            <td bgcolor="d3d3d3" width="370" align="left" valign="top">
                              <SELECT NAME="event1" class="comboBoxStyle">
                                <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                <OPTION VALUE="Abstracts Assigned">Abstracts Assigned</OPTION>

                              </SELECT>
                              <FONT FACE="verdana" SIZE="1" color="black">
                                Abstracts Assigned<br>

                                  <SELECT NAME="event2" class="comboBoxStyle"	>
                                    <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                    <OPTION VALUE="Abstracts Received">Abstracts Received</OPTION>

                                  </SELECT>
                                  <FONT FACE="verdana" SIZE="1" color="black">
                                    Abstracts Received<br>
                                      <SELECT NAME="datamerged" 	class="comboBoxStyle">
                                        <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                        <OPTION VALUE="Data Merged">Data Merged</OPTION>

                                      </SELECT>
                                      <FONT FACE="verdana" SIZE="1" color="black">
                                        Binder Data Merged<br>
                                          <SELECT NAME="event3" class="comboBoxStyle"	>
                                            <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                            <OPTION VALUE="Payoffs Ordered">Payoffs Ordered</OPTION>

                                          </SELECT>
                                          <FONT FACE="verdana" SIZE="1" color="black">
                                            Payoffs Ordered<br>
                                              <SELECT NAME="event4" class="comboBoxStyle"	>
                                                <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                                <OPTION VALUE="Payoffs Received">Payoffs Received</OPTION>

                                              </SELECT>
                                              <FONT FACE="verdana" SIZE="1" color="black">
                                                Payoffs Received<br>

                                                  <SELECT NAME="event5"
                                                  class="comboBoxStyle"
								>
                                                    <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                                    <OPTION VALUE="Title Ins completed">Title Ins completed</OPTION>

                                                  </SELECT>
                                                  <FONT FACE="verdana" SIZE="1" color="black">
                                                    Title Ins completed<br>

                                                      <SELECT NAME="event7"
                                                      class="comboBoxStyle"
								>
                                                        <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                                        <OPTION VALUE="Tax Data Completed">Tax Data Completed</OPTION>

                                                      </SELECT>
                                                      <FONT FACE="verdana" SIZE="1" color="black">
                                                        Tax Data Completed<br>

                                                          <SELECT NAME="event8"
                                                          class="comboBoxStyle"
								>
                                                            <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                                            <OPTION VALUE="Orders with abstract data">Abstract sent data</OPTION>

                                                          </SELECT>
                                                          <FONT FACE="verdana" SIZE="1" color="black">
                                                            Abstract sent data<br>

                                                              <SELECT NAME="event9"
                                                              class="comboBoxStyle"
								>
                                                                <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                                                <OPTION VALUE="Orders with abstract files">Abstract sent files</OPTION>

                                                              </SELECT>
                                                              <FONT FACE="verdana" SIZE="1" color="black">
                                                                Abstract sent files


                                                                <SELECT NAME="event17"
                                                                class="comboBoxStyle"
								>
                                                                  <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                                                  <OPTION VALUE="Vendor note added">Vendor note added</OPTION>

                                                                </SELECT><FONT FACE="verdana" SIZE="1" color="black">
                                                                  Vendor note added


                                                                  <SELECT NAME="event20"
                                                                    class="comboBoxStyle"
								>
                                                                    <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                                                    <OPTION VALUE="Sales Call - Full Closing">Sales Call - Full Closing</OPTION>

                                                                  </SELECT><FONT FACE="verdana" SIZE="1" color="black">
                                                                    Sales Call - Full Closing

                                                                    <SELECT NAME="event21"
                                                                  class="comboBoxStyle"
								>
                                                                      <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                                                      <OPTION VALUE="Sales Call - Seller Rep Only">Sales Call - Seller Rep Only</OPTION>

                                                                    </SELECT><FONT FACE="verdana" SIZE="1" color="black">Sales Call - Seller Rep Only

							
                            </td>
                            <td bgcolor="d3d3d3" width="75" align="right" valign="top">
                              <FONT FACE="verdana" SIZE="1" color="black">
                                <b>Unfulfilled</b> Events
                            </td>
                            <td bgcolor="d3d3d3" width="370" align="left" valign="top">
                              <SELECT NAME="event10"
                                class="comboBoxStyle"
								>
                                <OPTION VALUE="NONE" selected="">N/A</OPTION>
                                <OPTION VALUE="Abstracts Not Assigned">Abstracts Unassigned</OPTION>
                              </SELECT>
                              <FONT FACE="verdana" SIZE="1" color="black">
                                Abstracts Unassigned<br>
                                  <SELECT NAME="event11"
                                    size="1"
                                    style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
                                    rows="5"
                                    cols="45"
								>
                                    <OPTION VALUE="NONE" selected="">N/A</OPTION>
                                    <OPTION VALUE="Abstracts Not Received">Abstracts Unreceived</OPTION>
                                  </SELECT>
                                  <FONT FACE="verdana" SIZE="1" color="black">
                                    Abstracts Unreceived<br>

                                      <SELECT NAME="datanotmerged"
                                        class="comboBoxStyle"
								>
                                        <OPTION VALUE="NONE" selected="">N/A</OPTION>
                                        <OPTION VALUE="Data Not Merged">Data Not Merged</OPTION>
                                      </SELECT>
                                      <FONT FACE="verdana" SIZE="1" color="black">
                                        Data Not Merged<br>

                                          <SELECT NAME="event12"
                                            class="comboBoxStyle"
								>
                                            <OPTION VALUE="NONE" selected="">N/A</OPTION>
                                            <OPTION VALUE="Payoffs Not Ordered">Payoffs Not Ordered</OPTION>
                                          </SELECT>
                                          <FONT FACE="verdana" SIZE="1" color="black">
                                            Payoffs Not Ordered<br>

                                              <SELECT NAME="event13"
                                              class="comboBoxStyle"
								>
                                                <OPTION VALUE="NONE" selected="">N/A</OPTION>
                                                <OPTION VALUE="Payoffs Not Received">Payoffs Not Received</OPTION>
                                              </SELECT>
                                              <FONT FACE="verdana" SIZE="1" color="black">
                                                Payoffs Not Received<br>

                                                  <SELECT NAME="event14"
                                                  class="comboBoxStyle"
								>
                                                    <OPTION VALUE="NONE" selected="">N/A</OPTION>
                                                    <OPTION VALUE="Title Ins Uncompleted">Title Ins Uncompleted</OPTION>
                                                  </SELECT>
                                                  <FONT FACE="verdana" SIZE="1" color="black">
                                                    Title Ins Uncompleted<br>

                                                      <SELECT NAME="event16"
                                                    class="comboBoxStyle"
								>
                                                        <OPTION VALUE="NONE" selected="">N/A</OPTION>
                                                        <OPTION VALUE="Tax Data Not Completed">Tax Data Uncompl</OPTION>
                                                      </SELECT>
                                                      <FONT FACE="verdana" SIZE="1" color="black">
                                                        Tax Data Uncompleted<br>
                                                          <SELECT NAME="clear_close"
                                                          class="comboBoxStyle"
								>
                                                            <OPTION VALUE="NONE" selected="">N/A</OPTION>
                                                            <OPTION VALUE="Not Clear to Close">Unclear to close</OPTION>
                                                          </SELECT>
                                                          <FONT FACE="verdana" SIZE="1" color="black">
                                                            Not Clear to Close<br>
                                                              <SELECT NAME="event17"
                                                              class="comboBoxStyle"
								>
                                                                <OPTION VALUE="NONE" selected="">N/A</OPTION>
                                                                <OPTION VALUE="Uncompleted ICL orders">Uncompleted ICLs</OPTION>

                                                              </SELECT>
                                                              <FONT FACE="verdana" SIZE="1" color="black">Uncompleted ICL orders</font> 

						
                            </td>
                          </tr>
		                         
                          </table>
                        </div>

                    <div id="div3" style="display: none; border-width: 1px; border-style: none;">

                      <table width="700" cellpadding="1" cellspacing="1" border="0">

						<input type="hidden" name="PropertyEventsHdn" value="event1,event2,event5,event7,event8,event9,event10,event11,event14,event16,event17,event20,event21,propdatamerge,propdatanotmerge">

                        <br>

                          <tr>
                            <td bgcolor="d3d3d3" width="75" align="right" valign="top">
                              <FONT FACE="verdana" SIZE="1" color="black">
                                <b>Fulfilled</b> Events
                              </td>
                            <td bgcolor="d3d3d3" width="250" align="left" valign="top">
                              <SELECT NAME="event1"
                                class="comboBoxStyle"
								>
                                <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                <OPTION VALUE="Abstracts Assigned">Abstracts Assigned</OPTION>

                              </SELECT>
                              <FONT FACE="verdana" SIZE="1" color="black">
                                Abstracts Assigned<br>

                                  <SELECT NAME="event2"
                                    class="comboBoxStyle"
								>
                                    <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                    <OPTION VALUE="Abstracts Received">Abstracts Received</OPTION>

                                  </SELECT>
                                  <FONT FACE="verdana" SIZE="1" color="black">
                                    Abstracts Received<br>



                                      <SELECT NAME="event5"
                                      class="comboBoxStyle"
								>
                                        <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                        <OPTION VALUE="Report completed">Report completed</OPTION>

                                      </SELECT>
                                      <FONT FACE="verdana" SIZE="1" color="black">
                                        Report completed<br>

                                          <SELECT NAME="event7"
                                          class="comboBoxStyle"
								>
                                            <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                            <OPTION VALUE="Tax Data Completed">Tax Data Completed</OPTION>

                                          </SELECT>
                                          <FONT FACE="verdana" SIZE="1" color="black">
                                            Tax Data Completed<br>

                                              <SELECT NAME="event8"
                                              class="comboBoxStyle"
								>
                                                <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                                <OPTION VALUE="Orders with abstract data">Abstract sent data</OPTION>

                                              </SELECT>
                                              <FONT FACE="verdana" SIZE="1" color="black">
                                                Abstract sent data <br>

                                                  <SELECT NAME="propdatamerge"
                                                  class="comboBoxStyle"
								>
                                                    <OPTION VALUE="NONE" selected="">N/A</OPTION>
                                                    <OPTION VALUE="Property Report Data Merged">Property Report Data Merged</OPTION>
                                                  </SELECT>
                                                  <FONT FACE="verdana" SIZE="1" color="black">
                                                    Property Report Data Merged<br>

                                                      <SELECT NAME="event9"
                                                      class="comboBoxStyle"
								>
                                                        <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                                        <OPTION VALUE="Orders with abstract files">Abstract sent files</OPTION>

                                                      </SELECT>
                                                      <FONT FACE="verdana" SIZE="1" color="black">
                                                        Abstract sent files



                                                        <SELECT NAME="event17"
                                                        class="comboBoxStyle"
								>
                                                          <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                                          <OPTION VALUE="Vendor note added">Vendor note added</OPTION>

                                                        </SELECT><FONT FACE="verdana" SIZE="1" color="black">
                                                          Vendor note added

                                                          <SELECT NAME="event20"
                                                            class="comboBoxStyle"
								>
                                                            <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                                            <OPTION VALUE="Sales Call - Full Closing">Sales Call - Full Closing</OPTION>

                                                          </SELECT><FONT FACE="verdana" SIZE="1" color="black">
                                                            Sales Call - Full Closing


                                                            <SELECT NAME="event21"
                                                              class="comboBoxStyle"
								>
                                                              <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                                              <OPTION VALUE="Sales Call - Seller Rep Only">Sales Call - Seller Rep Only</OPTION>

                                                            </SELECT><FONT FACE="verdana" SIZE="1" color="black">Sales Call - Seller Rep Only

							
                            </td>
                            <td bgcolor="d3d3d3" width="75" align="right" valign="top">
                              <FONT FACE="verdana" SIZE="1" color="black">
                                <b>Unfulfilled</b> Events
                              </td>
                            <td bgcolor="d3d3d3" width="350" align="left" valign="top">
                              <SELECT NAME="event10"
                                class="comboBoxStyle"
								>
                                <OPTION VALUE="NONE" selected="">N/A</OPTION>
                                <OPTION VALUE="Abstracts Not Assigned">Abstracts Unassigned</OPTION>
                              </SELECT>
                              <FONT FACE="verdana" SIZE="1" color="black">
                                Abstracts Unassigned<br>
                                  <SELECT NAME="event11"
                                    class="comboBoxStyle"
								>
                                    <OPTION VALUE="NONE" selected="">N/A</OPTION>
                                    <OPTION VALUE="Abstracts Not Received">Abstracts Unreceived</OPTION>
                                  </SELECT>
                                  <FONT FACE="verdana" SIZE="1" color="black">
                                    Abstracts Unreceived<br>



                                      <SELECT NAME="event14"
                                      class="comboBoxStyle"
								>
                                        <OPTION VALUE="NONE" selected="">N/A</OPTION>
                                        <OPTION VALUE="Report Uncompleted">Report Uncompleted</OPTION>
                                      </SELECT>
                                      <FONT FACE="verdana" SIZE="1" color="black">
                                        Report Uncompleted<br>
                                          <SELECT NAME="propdatanotmerge"
                                          class="comboBoxStyle"
								>
                                            <OPTION VALUE="NONE" selected="">N/A</OPTION>
                                            <OPTION VALUE="Property Report Data Not Merged">Property Report Data Not Merged</OPTION>
                                          </SELECT>
                                          <FONT FACE="verdana" SIZE="1" color="black">
                                            Property Report Data Not Merged


                                            <SELECT NAME="event16"
                                            class="comboBoxStyle"
								>
                                              <OPTION VALUE="NONE" selected="">N/A</OPTION>
                                              <OPTION VALUE="Tax Data Not Completed">Tax Data Unompleted</OPTION>
                                            </SELECT><FONT FACE="verdana" SIZE="1" color="black">Tax Data Uncompleted

						
                            </td>
                          </tr>
                         
                          </table>

                        </div>

                    <div id="div4" style="display: none; border-width: 1px; border-style: none;">

                      <input type="hidden" name="AppraisalEventsHdn" value="event1,event2,event8,event9,event17,event20,event21,event10,event11">
					  
					  <table width="700" cellpadding="1" cellspacing="1" border="0">

                        <br>

                          <tr>
                            <td bgcolor="d3d3d3" width="75" align="right" valign="top">
                              <FONT FACE="verdana" SIZE="1" color="black">
                                <b>Fulfilled</b> Events
                              </td>
                            <td bgcolor="d3d3d3" width="250" align="left" valign="top">
                              <SELECT NAME="event1"
                                class="comboBoxStyle"
								>
                                <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                <OPTION VALUE="Abstracts Assigned">Abstracts Assigned</OPTION>

                              </SELECT>
                              <FONT FACE="verdana" SIZE="1" color="black">
                                Abstracts Assigned<br>

                                  <SELECT NAME="event2"
                                    class="comboBoxStyle"
								>
                                    <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                    <OPTION VALUE="Abstracts Received">Abstracts Received</OPTION>

                                  </SELECT>
                                  <FONT FACE="verdana" SIZE="1" color="black">
                                    Abstracts Received<br>



                                      <SELECT NAME="event8"
                                      class="comboBoxStyle"
								>
                                        <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                        <OPTION VALUE="Orders with abstract data">Abstract sent data</OPTION>

                                      </SELECT>
                                      <FONT FACE="verdana" SIZE="1" color="black">
                                        Abstract sent data <br>

                                          <SELECT NAME="event9"
                                          class="comboBoxStyle"
								>
                                            <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                            <OPTION VALUE="Orders with abstract files">Abstract sent files</OPTION>

                                          </SELECT>
                                          <FONT FACE="verdana" SIZE="1" color="black">
                                            Abstract sent files



                                            <SELECT NAME="event17"
                                            class="comboBoxStyle"
								>
                                              <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                              <OPTION VALUE="Vendor note added">Vendor note added</OPTION>

                                            </SELECT><FONT FACE="verdana" SIZE="1" color="black">
                                              Vendor note added



                                              <SELECT NAME="event20"
                                                class="comboBoxStyle"
								>
                                                <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                                <OPTION VALUE="Sales Call - Full Closing">Sales Call - Full Closing</OPTION>

                                              </SELECT><FONT FACE="verdana" SIZE="1" color="black">
                                                Sales Call - Full Closing


                                                <SELECT NAME="event21"
                                                  class="comboBoxStyle"
								>
                                                  <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                                  <OPTION VALUE="Sales Call - Seller Rep Only">Sales Call - Seller Rep Only</OPTION>

                                                </SELECT><FONT FACE="verdana" SIZE="1" color="black">Sales Call - Seller Rep Only

							
                            </td>
                            <td bgcolor="d3d3d3" width="75" align="right" valign="top">
                              <FONT FACE="verdana" SIZE="1" color="black">
                                <b>Unfulfilled</b> Events
                              </td>
                            <td bgcolor="d3d3d3" width="350" align="left" valign="top">
                              <SELECT NAME="event10"
                                class="comboBoxStyle"
								>
                                <OPTION VALUE="NONE" selected="">N/A</OPTION>
                                <OPTION VALUE="Abstracts Not Assigned">Abstracts Unassigned</OPTION>
                              </SELECT>
                              <FONT FACE="verdana" SIZE="1" color="black">
                                Abstracts Unassigned<br>
                                  <SELECT NAME="event11"
                                    class="comboBoxStyle"
								>
                                    <OPTION VALUE="NONE" selected="">N/A</OPTION>
                                    <OPTION VALUE="Abstracts Not Received">Abstracts Unreceived</OPTION>
                                  </SELECT>
                                  <FONT FACE="verdana" SIZE="1" color="black">
                                    Abstracts Unreceived<br>

						</td>

                            </table>
                          </div>

                    <div id="div5" style="display: none; border-width: 1px; border-style: none; border">

                      <input type="hidden" name="FloodEventsHdn" value="event8,event9,event17,event20,event21">

                      <table>
                        <tr>
                          <td bgcolor="d3d3d3" colspan = "2" width="499" align="center" valign="top">
                            <FONT FACE="verdana" SIZE="1" color="black">
                              <b>Fulfilled</b> Events
                            </td>
                        </tr>
                        <tr>
                          <td bgcolor="d3d3d3" width="250" align="right" valign="top">

                            <FONT FACE="verdana" SIZE="1" color="black">Abstract sent data
								</td>
                          <td bgcolor="d3d3d3" width="400" align="left" valign="top">
                            <SELECT NAME="event8"
                              class="comboBoxStyle"
								>
                              <OPTION VALUE="NONE"selected="">N/A</OPTION>
                              <OPTION VALUE="Orders with abstract data">Abstract sent data</OPTION>

                            </SELECT>
                          </td>
                        </tr>
                        <tr>
                          <td bgcolor="d3d3d3" width="250" align="right" valign="top">
                            <FONT FACE="verdana" SIZE="1" color="black">Abstract sent files
					</td>
                          <td bgcolor="d3d3d3" width="400" align="left" valign="top">
                            <SELECT NAME="event9"
                              class="comboBoxStyle"
								>
                              <OPTION VALUE="NONE"selected="">N/A</OPTION>
                              <OPTION VALUE="Orders with abstract files">Abstract sent files</OPTION>

                            </SELECT>

                          </td>
                        </tr>
                        <tr>
                          <td bgcolor="d3d3d3" width="250" align="right" valign="top">
                            <FONT FACE="verdana" SIZE="1" color="black">Vendor note added
							</td>
                          <td bgcolor="d3d3d3" width="400" align="left" valign="top">

                            <SELECT NAME="event17"
                              class="comboBoxStyle"
								>
                              <OPTION VALUE="NONE"selected="">N/A</OPTION>
                              <OPTION VALUE="Vendor note added">Vendor note added</OPTION>

                            </SELECT>



                            <SELECT NAME="event20"
                              class="comboBoxStyle"
								>
                              <OPTION VALUE="NONE"selected="">N/A</OPTION>
                              <OPTION VALUE="Sales Call - Full Closing">Sales Call - Full Closing</OPTION>

                            </SELECT>
                            <FONT FACE="verdana" SIZE="1" color="black">
                              Sales Call - Full Closing


                              <SELECT NAME="event21"
                                class="comboBoxStyle"
								>
                                <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                <OPTION VALUE="Sales Call - Seller Rep Only">Sales Call - Seller Rep Only</OPTION>

                              </SELECT><FONT FACE="verdana" SIZE="1" color="black">Sales Call - Seller Rep Only
						
                          </td>
                        </tr>

                      </table>

                      <table width="600" cellpadding="1" cellspacing="1" border="0">
                      
                      </table>

                    </div>

                    <div id="div6" style="display: none; border-width: 1px; border-style: none;">

						<input type="hidden" name="CreditEventsHdn" value="event8,event9,event17,event20,event21">

                      <table>
                        <tr>
                          <td bgcolor="d3d3d3" colspan = "2" width="499" align="center" valign="top">
                            <FONT FACE="verdana" SIZE="1" color="black">
                              <b>Fulfilled</b> Events
                            </td>
                        </tr>
                        <tr>
                          <td bgcolor="d3d3d3" width="250" align="right" valign="top">

                            <FONT FACE="verdana" SIZE="1" color="black">Abstract sent data
								</td>
                          <td bgcolor="d3d3d3" width="400" align="left" valign="top">
                            <SELECT NAME="event8"
                              class="comboBoxStyle"
								>
                              <OPTION VALUE="NONE"selected="">N/A</OPTION>
                              <OPTION VALUE="Orders with abstract data">Abstract sent data</OPTION>

                            </SELECT>
                          </td>
                        </tr>
                        <tr>
                          <td bgcolor="d3d3d3" width="250" align="right" valign="top">
                            <FONT FACE="verdana" SIZE="1" color="black">Abstract sent files
					</td>
                          <td bgcolor="d3d3d3" width="400" align="left" valign="top">
                            <SELECT NAME="event9"
                              class="comboBoxStyle"
								>
                              <OPTION VALUE="NONE"selected="">N/A</OPTION>
                              <OPTION VALUE="Orders with abstract files">Abstract sent files</OPTION>

                            </SELECT>

                          </td>
                        </tr>
                        <tr>
                          <td bgcolor="d3d3d3" width="250" align="right" valign="top">
                            <FONT FACE="verdana" SIZE="1" color="black">Vendor note added
							</td>
                          <td bgcolor="d3d3d3" width="400" align="left" valign="top">

                            <SELECT NAME="event17"
                              class="comboBoxStyle"
								>
                              <OPTION VALUE="NONE"selected="">N/A</OPTION>
                              <OPTION VALUE="Vendor note added">Vendor note added</OPTION>

                            </SELECT>


                            <SELECT NAME="event20"
                              class="comboBoxStyle"
								>
                              <OPTION VALUE="NONE"selected="">N/A</OPTION>
                              <OPTION VALUE="Sales Call - Full Closing">Sales Call - Full Closing</OPTION>

                            </SELECT>
                            <FONT FACE="verdana" SIZE="1" color="black">
                              Sales Call - Full Closing


                              <SELECT NAME="event21"
                                class="comboBoxStyle"
								>
                                <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                <OPTION VALUE="Sales Call - Seller Rep Only">Sales Call - Seller Rep Only</OPTION>

                              </SELECT><FONT FACE="verdana" SIZE="1" color="black">Sales Call - Seller Rep Only

							
                          </td>
                        </tr>

                      </table>



                      <table width="600" cellpadding="1" cellspacing="1" border="0">                      

                      </table>

                    </div>

                    <div id="div7" style="display: none; border-width: 1px; border-style: none;">
					
                      <input type="hidden" name="AVMEventsHdn" value="event8,event9,event17,event20,event21">
					  
                      <table>
                        <tr>
                          <td bgcolor="d3d3d3" colspan = "2" width="499" align="center" valign="top">
                            <FONT FACE="verdana" SIZE="1" color="black">
                              <b>Fulfilled</b> Events
                            </td>
                        </tr>
                        <tr>
                          <td bgcolor="d3d3d3" width="250" align="right" valign="top">

                            <FONT FACE="verdana" SIZE="1" color="black">Abstract sent data
								</td>
                          <td bgcolor="d3d3d3" width="400" align="left" valign="top">
                            <SELECT NAME="event8"
                              class="comboBoxStyle"
								>
                              <OPTION VALUE="NONE"selected="">N/A</OPTION>
                              <OPTION VALUE="Orders with abstract data">Abstract sent data</OPTION>

                            </SELECT>
                          </td>
                        </tr>
                        <tr>
                          <td bgcolor="d3d3d3" width="250" align="right" valign="top">
                            <FONT FACE="verdana" SIZE="1" color="black">Abstract sent files
					</td>
                          <td bgcolor="d3d3d3" width="400" align="left" valign="top">
                            <SELECT NAME="event9"
                              class="comboBoxStyle"
								>
                              <OPTION VALUE="NONE"selected="">N/A</OPTION>
                              <OPTION VALUE="Orders with abstract files">Abstract sent files</OPTION>

                            </SELECT>

                          </td>
                        </tr>
                        <tr>
                          <td bgcolor="d3d3d3" width="250" align="right" valign="top">
                            <FONT FACE="verdana" SIZE="1" color="black">Vendor note added
							</td>
                          <td bgcolor="d3d3d3" width="400" align="left" valign="top">

                            <SELECT NAME="event17"
                              class="comboBoxStyle"
								>
                              <OPTION VALUE="NONE"selected="">N/A</OPTION>
                              <OPTION VALUE="Vendor note added">Vendor note added</OPTION>

                            </SELECT>


                            <SELECT NAME="event20"
                              class="comboBoxStyle"
								>
                              <OPTION VALUE="NONE"selected="">N/A</OPTION>
                              <OPTION VALUE="Sales Call - Full Closing">Sales Call - Full Closing</OPTION>

                            </SELECT>
                            <FONT FACE="verdana" SIZE="1" color="black">
                              Sales Call - Full Closing


                              <SELECT NAME="event21"
                                class="comboBoxStyle"
								>
                                <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                <OPTION VALUE="Sales Call - Seller Rep Only">Sales Call - Seller Rep Only</OPTION>

                              </SELECT><FONT FACE="verdana" SIZE="1" color="black">Sales Call - Seller Rep Only

							
                          </td>
                        </tr>

                      </table>



                      <table width="600" cellpadding="1" cellspacing="1" border="0">
                       
                        </table>


                      </div>

                    <div id="div8" style="display: none; border-width: 1px; border-style: none;">
					
						<input type="hidden" name="SigningEventsHdn" value="event8,event9,event17,event20,event21">
					
                      <table>
                        <tr>
                          <td bgcolor="d3d3d3" colspan = "2" width="499" align="center" valign="top">
                            <FONT FACE="verdana" SIZE="1" color="black">
                              <b>Fulfilled</b> Events
                            </td>
                        </tr>
                        <tr>
                          <td bgcolor="d3d3d3" width="250" align="right" valign="top">

                            <FONT FACE="verdana" SIZE="1" color="black">Abstract sent data
								</td>
                          <td bgcolor="d3d3d3" width="400" align="left" valign="top">
                            <SELECT NAME="event8"
                              class="comboBoxStyle"
								>
                              <OPTION VALUE="NONE"selected="">N/A</OPTION>
                              <OPTION VALUE="Orders with abstract data">Abstract sent data</OPTION>

                            </SELECT>
                          </td>
                        </tr>
                        <tr>
                          <td bgcolor="d3d3d3" width="250" align="right" valign="top">
                            <FONT FACE="verdana" SIZE="1" color="black">Abstract sent files
					</td>
                          <td bgcolor="d3d3d3" width="400" align="left" valign="top">
                            <SELECT NAME="event9"
                              class="comboBoxStyle"
								>
                              <OPTION VALUE="NONE"selected="">N/A</OPTION>
                              <OPTION VALUE="Orders with abstract files">Abstract sent files</OPTION>

                            </SELECT>

                          </td>
                        </tr>
                        <tr>
                          <td bgcolor="d3d3d3" width="250" align="right" valign="top">
                            <FONT FACE="verdana" SIZE="1" color="black">Vendor note added
							</td>
                          <td bgcolor="d3d3d3" width="400" align="left" valign="top">

                            <SELECT NAME="event17"
                              class="comboBoxStyle"
								>
                              <OPTION VALUE="NONE"selected="">N/A</OPTION>
                              <OPTION VALUE="Vendor note added">Vendor note added</OPTION>

                            </SELECT>


                            <SELECT NAME="event20"
                              class="comboBoxStyle"
								>
                              <OPTION VALUE="NONE"selected="">N/A</OPTION>
                              <OPTION VALUE="Sales Call - Full Closing">Sales Call - Full Closing</OPTION>

                            </SELECT>
                            <FONT FACE="verdana" SIZE="1" color="black">
                              Sales Call - Full Closing


                              <SELECT NAME="event21"
                                class="comboBoxStyle"
								>
                                <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                <OPTION VALUE="Sales Call - Seller Rep Only">Sales Call - Seller Rep Only</OPTION>

                              </SELECT><FONT FACE="verdana" SIZE="1" color="black">Sales Call - Seller Rep Only

							
                          </td>
                        </tr>

                      </table>



                      <table width="600" cellpadding="1" cellspacing="1" border="0">
                     
                        </table>

                      </div>

                    <div id="div9" style="display: none; border-width: 1px; border-style: none;">
					
						<input type="hidden" name="ClosingEventsHdn" value="event2,event3,event4,event7,event8,event5,event6,event19">

                      <table width="700" cellpadding="1" cellspacing="1" border="0">
                      	
                        <br>

                          <tr>
                            <td bgcolor="d3d3d3" width="75" align="right" valign="top">
                              <FONT FACE="verdana" SIZE="1" color="black">
                                <b>Fulfilled</b> Events
                              </td>
                            <td bgcolor="d3d3d3" width="350" align="left" valign="top">


                              <SELECT NAME="event7"
                                class="comboBoxStyle"
								>
                                <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                <OPTION VALUE="Closer Assigned">Closer Assigned</OPTION>

                              </SELECT>
                              <FONT FACE="verdana" SIZE="1" color="black">
                                Closer Assigned<br>

                                  <SELECT NAME="event2"
                                    class="comboBoxStyle"
								>
                                    <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                    <OPTION VALUE="Closing Info Submitted">Closing Info Submitted</OPTION>

                                  </SELECT>
                                  <FONT FACE="verdana" SIZE="1" color="black">
                                    Closing Info Submitted<br>
                                      <SELECT NAME="instructions_received"
                          class="comboBoxStyle"
								>
                                        <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                        <OPTION VALUE="Instructions Received">Instructions Received</OPTION>

                                      </SELECT>
                                      <FONT FACE="verdana" SIZE="1" color="black">
                                        Instructions Received<br>

                                          <SELECT NAME="Final_HUD_Complete"
                            class="comboBoxStyle"
								>
                                            <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                            <OPTION VALUE="Final HUD Complete">Final HUD Complete</OPTION>
                                          </SELECT>
                                          <FONT FACE="verdana" SIZE="1" color="black">
                                            Final HUD Complete<br>
                                              <SELECT NAME="event3"
                                              class="comboBoxStyle"
								>
                                                <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                                <OPTION VALUE="Orders with closer files">Closer sent files</OPTION>

                                              </SELECT>
                                              <FONT FACE="verdana" SIZE="1" color="black">
                                                Closer sent files<br>

                                                  <SELECT NAME="event4"
                                                    class="comboBoxStyle"
								>
                                                    <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                                    <OPTION VALUE="Orders with closer data">Closer sent data</OPTION>

                                                  </SELECT>
                                                  <FONT FACE="verdana" SIZE="1" color="black">
                                                    Closer sent data<br>

                                                      <SELECT NAME="event8"
                                                        class="comboBoxStyle"
								>
                                                        <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                                        <OPTION VALUE="Loan Closed">Loan Closed</OPTION>

                                                      </SELECT>
                                                      <FONT FACE="verdana" SIZE="1" color="black">
                                                        Loan Closed<br>



                                                          <SELECT NAME="sellerreploanclosed"
                                                            class="comboBoxStyle"
								>
                                                            <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                                            <OPTION VALUE="Seller Rep - Loan Closed">Seller Rep - Loan Closed</OPTION>

                                                          </SELECT>
                                                          <FONT FACE="verdana" SIZE="1" color="black">
                                                            Seller Rep - Loan Closed<br>

                                                              <SELECT NAME="loanfun"
                                                                class="comboBoxStyle"
								>
                                                                <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                                                <OPTION VALUE="Loan Funded">Loan Funded</OPTION>

                                                              </SELECT>
                                                              <FONT FACE="verdana" SIZE="1" color="black">
                                                                Loan Funded<br>

                                                                  <SELECT NAME="loancloseorfun"
                                                                    class="comboBoxStyle"
								>
                                                                    <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                                                    <OPTION VALUE="Loan Closed OR Funded">Loan Closed OR Funded</OPTION>

                                                                  </SELECT>
                                                                  <FONT FACE="verdana" SIZE="1" color="black">
                                                                    Loan Closed OR Funded<br>


                                                                      <SELECT NAME="mortrec"
                                                                        class="comboBoxStyle"
								>
                                                                        <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                                                        <OPTION VALUE="Mortgage Recorded">Mortgage Recorded</OPTION>

                                                                      </SELECT>
                                                                      <FONT FACE="verdana" SIZE="1" color="black">
                                                                        Mortgage Recorded
                                                                        <SELECT NAME="titlepol"
                                                                          class="comboBoxStyle"
								>
                                                                          <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                                                          <OPTION VALUE="Title Policy Completed">Title Policy Completed</OPTION>

                                                                        </SELECT> <FONT FACE="verdana" SIZE="1" color="black">
                                                                          Title Policy Completed

                                                                          <SELECT NAME="prefunding"
                                                                                          class="comboBoxStyle"
								>
                                                                            <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                                                            <OPTION VALUE="Pre-Funding Completed">Pre-Funding Completed</OPTION>

                                                                          </SELECT><FONT FACE="verdana" SIZE="1" color="black">Pre-Funding Completed


                            </td>
                            <td bgcolor="d3d3d3" width="75" align="right" valign="top">
                              <FONT FACE="verdana" SIZE="1" color="black">
                                <b>Unfulfilled</b> Events
                              </td>
                            <td bgcolor="d3d3d3" width="550" align="left" valign="top">

                              <SELECT NAME="event5"
                              class="comboBoxStyle"
								>
                                <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                <OPTION VALUE="Closing Info Not Submitted">Closing Info Unsubmitted</OPTION>

                              </SELECT>
                              <FONT FACE="verdana" SIZE="1" color="black">
                                Closing Info Unsubmitted<br>
                                  <SELECT NAME="event6"
                                    class="comboBoxStyle"
								>
                                    <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                    <OPTION VALUE="Closer Not Assigned">Closer Not Assigned</OPTION>

                                  </SELECT>
                                  <FONT FACE="verdana" SIZE="1" color="black">
                                    Closer Not Assigned<br>
                                      <SELECT NAME="Instructions_Unreceived"
                          class="comboBoxStyle"
								>
                                        <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                        <OPTION VALUE="Instructions Unreceived">Instructions Unreceived</OPTION>

                                      </SELECT>
                                      <FONT FACE="verdana" SIZE="1" color="black">
                                        Instructions Unreceived<br>
                                          <SELECT NAME="Final_HUD_Uncomplete"
                            class="comboBoxStyle"
								>
                                            <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                            <OPTION VALUE="Final HUD Uncomplete">Final HUD Uncomplete</OPTION>

                                          </SELECT>
                                          <FONT FACE="verdana" SIZE="1" color="black">
                                            Final HUD Uncomplete<br>
                                              <SELECT NAME="event19"
                                                class="comboBoxStyle"
								>
                                                <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                                <OPTION VALUE="Loan Not Closed">Loan Not Closed</OPTION>

                                              </SELECT>
                                              <FONT FACE="verdana" SIZE="1" color="black">
                                                Loan Not Closed<br>

                                                  <SELECT NAME="loannotfun"
                                                    class="comboBoxStyle"
								>
                                                    <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                                    <OPTION VALUE="Loan Not Funded">Loan Not Funded</OPTION>

                                                  </SELECT>
                                                  <FONT FACE="verdana" SIZE="1" color="black">
                                                    Loan Not Funded<br>
                                                      <SELECT NAME="mortnotrec"
                                                        class="comboBoxStyle"
								>
                                                        <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                                        <OPTION VALUE="Mortgage Not Recorded">Mortgage Not Recorded</OPTION>

                                                      </SELECT>
                                                      <FONT FACE="verdana" SIZE="1" color="black">
                                                        Mortgage Not Recorded
                                                        <SELECT NAME="titlenotpol"
                                                          class="comboBoxStyle"
								>
                                                          <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                                          <OPTION VALUE="Title Policy Uncompleted">Title Policy Uncompleted</OPTION>

                                                        </SELECT> <FONT FACE="verdana" SIZE="1" color="black">
                                                          Title Policy Uncompleted


                                                          <SELECT NAME="prenotfunding"
                                                                          class="comboBoxStyle"
								>
                                                            <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                                            <OPTION VALUE="Pre-Funding Not Completed">Pre-Funding Not Completed</OPTION>

                                                          </SELECT><FONT FACE="verdana" SIZE="1" color="black">
                                                            Pre-Funding Not Completed<br>

                                                              <SELECT NAME="packagenotreceived"
                                                                              class="comboBoxStyle"
								>
                                                                <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                                                <OPTION VALUE="Package Not Received">Package Not Received</OPTION>

                                                              </SELECT>
                                                              <FONT FACE="verdana" SIZE="1" color="black">
                                                                Package Not Received<br>

                                                                  <SELECT NAME="closingnotinvoiced"
                                                                                  class="comboBoxStyle"
								>
                                                                    <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                                                    <OPTION VALUE="Closing Not Invoiced">Closing Not Invoiced</OPTION>

                                                                  </SELECT>
                                                                  <FONT FACE="verdana" SIZE="1" color="black">
                                                                    Closing Not Invoiced<br>
                                                                      <SELECT NAME="srclosingnotpaid"
                                                                                      class="comboBoxStyle"
								>
                                                                        <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                                                        <OPTION VALUE="Seller-Rep Closing Not Paid">Seller-Rep Closing Not Paid</OPTION>

                                                                      </SELECT>
                                                                      <FONT FACE="verdana" SIZE="1" color="black">
                                                                        Seller-Rep Closing Not Paid<br>

                                                                          <SELECT NAME="mortgagerecordingissue"
                                                                                          class="comboBoxStyle"
								>
                                                                            <OPTION VALUE="NONE"selected="">N/A</OPTION>
                                                                            <OPTION VALUE="Mortgage Recording Issue">Mortgage Recording Issue</OPTION>

                                                                          </SELECT>
                                                                          <FONT FACE="verdana" SIZE="1" color="black">Mortgage Recording Issue						
											                            </td>
											                          </tr>                         
											                          </table>
											                        </div>
											                  </td>
											                </tr>
														<tr>
								      						<td bgcolor="d3d3d3" colspan="2" width="700" align="right" valign="top">
								                              <INPUT TYPE="image" src="./images/button_search.gif" border="0">
									  						</td>
							   						</tr>	
									   				<tr id="trNote"><td bgcolor=d3d3d3 colspan=2 width=800 align=center valign=top>
									       		<FONT FACE=verdana SIZE=1 color="blue"><b>NOTE* For more detailed reports such as 'Fulfilled/Unfulfilled events, select a product from above</b></td>										    	
											</tr>																					
									   </td>
									 <tr>									  																						 								
				              	</table>																 
					          </td>								  					 
					         </tr>							 						  
				            </table>
					        </td>
					     </tr>              			 
				      </table>
    
      
	<script language="JavaScript">
	
		var  productObj = document.getElementById("Product");
	
		var  gblProductTypeSelected = productObj[productObj.selectedIndex].value;
			//alert("gblProductTypeSelected = " + gblProductTypeSelected);
			//doHideShow(gblProductTypeSelected);
	</script>
	
</cfform>




