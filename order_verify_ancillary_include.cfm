<cfif #title# eq 1>
	<CFQUERY datasource="#request.dsn#" NAME="get_id">
	    SELECT * FROM TITLE WHERE a_insert_date = '#a_insert_date#' AND a_insert_time = '#a_insert_time#'
    </CFQUERY>
<cfelseif #appraisal# eq 1>
	<CFQUERY datasource="#request.dsn#" NAME="get_id">
	    SELECT * FROM appraisal WHERE a_insert_date = '#a_insert_date#' AND a_insert_time = '#a_insert_time#'
    </CFQUERY>
<cfelse>
	<CFQUERY datasource="#request.dsn#" NAME="get_id">
	    SELECT * FROM property WHERE a_insert_date = '#a_insert_date#' AND a_insert_time = '#a_insert_time#'
    </CFQUERY>
</cfif>

<input type="hidden" name="prop_use_type" value="<cfoutput>#prop_use_type#</cfoutput>">
			<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
					<tr>
						<td width=519 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=2 color="black">
							<CENTER><B>ANCILLARY PRODUCT CHOICES:</B></CENTER>
						</TD>
					</TR>
					
					<TR>
						<TD width=519 align=center valign=top bgcolor=d3d3d3>
			
							<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
								<tr>
								<td width=200 bgcolor="f1f1f1" align=right valign=top>
										<FONT FACE=ARIAL SIZE=1 color="gray">
								Flood
									</td>
							
									<td width=219 bgcolor="f1f1f1" align=left valign=top>
				<select name="flood" 
											size="1" 
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: 003F1E; 
											background-color: E4E3E3; 
											border-color: white; 
											border-left-width: thin; 
											border-right-width: thin; 
											border-top-width: thin; 
											border-bottom-width: thin; 
											border-width: thin; 
											border-style: bar; 
											clear: none; 
											float: none;" 
											rows="3" 
											cols="45" 
											>
											<OPTION VALUE="" SELECTED>Select</OPTION>
											<OPTION VALUE="Basic">Basic Certification</OPTION>
											<OPTION VALUE="Census">Basic Certification with Census Information</OPTION>
											<OPTION VALUE="Life">Life of Loan Certification</OPTION>
											<OPTION VALUE="LifeCensus">Life of Loan Certification with Census Information</OPTION>
											
										</select>    
				</td></tr>
				<CFQUERY datasource="#request.dsn#" NAME="read_product">
                SELECT realECclientID,avmproduct
                FROM companies
                WHERE ID = '#comp_id#'
                
            </CFQUERY>
				<tr>
									<td width=200 bgcolor="f1f1f1" align=right valign=top>
										<FONT FACE=ARIAL SIZE=1 color="gray">
								AVM
									</td>
			
									<td width=219 bgcolor="f1f1f1" align=left valign=top>
				<select name="avm" onchange="AVMSelect()"
											size="1" 
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: 003F1E; 
											background-color: E4E3E3; 
											border-color: white; 
											border-left-width: thin; 
											border-right-width: thin; 
											border-top-width: thin; 
											border-bottom-width: thin; 
											border-width: thin; 
											border-style: bar; 
											clear: none; 
											float: none;" 
											rows="3" 
											cols="45" 
											>
											<OPTION VALUE="">Select</OPTION>
								<cfif #read_product.avmproduct# is "First">
									<OPTION VALUE="First" >AVM Upgrade</OPTION>
								<cfelseif #read_product.avmproduct# is "CASA">
									<OPTION VALUE="CASA" >CASA (Case Schiller Weiss AVM)</OPTION>
								<cfelseif #read_product.avmproduct# is "HPA">
									<OPTION VALUE="HPA" >HPA (Basis 100 - Home Price Analyzer)</OPTION>
								<cfelseif #read_product.avmproduct# is "Home">	
									<OPTION VALUE="Home" >Home Value Explorer (Freddie Mac AVM)</OPTION>
								<cfelseif #read_product.avmproduct# is "ValueLogix">
									<OPTION VALUE="ValueLogix" >ValueLogix (customized AVM)</OPTION>
								</cfif>	
							</select> 
											<!--- <OPTION VALUE="">Select</OPTION>
											<OPTION VALUE="First" >AVM Upgrade</OPTION>
											<OPTION VALUE="CASA" >CASA (Case Schiller Weiss AVM)</OPTION>
											<OPTION VALUE="HPA" >HPA (Basis 100 - Home Price Analyzer)</OPTION>
											<OPTION VALUE="Home" >Home Value Explorer (Freddie Mac AVM)</OPTION>
											<OPTION VALUE="ValueLogix" >ValueLogix (customized AVM)</OPTION> 
			
										</select> --->
				</td></tr>
			
			
									<tr>
									<td width=200 bgcolor="f1f1f1" align=right valign=top>
										<FONT FACE=ARIAL SIZE=1 color="gray">
								Credit
									</td>
			
									<td width=519 bgcolor="f1f1f1" align=left valign=top>
				<select name="credit" onchange="credSelect()"
											size="1" 
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: 003F1E; 
											background-color: E4E3E3; 
											border-color: white; 
											border-left-width: thin; 
											border-right-width: thin; 
											border-top-width: thin; 
											border-bottom-width: thin; 
											border-width: thin; 
											border-style: bar; 
											clear: none; 
											float: none;" 
											rows="3" 
											cols="45" 
											>
												<OPTION VALUE="">Select</OPTION>
										<OPTION VALUE="infile">Infile Report </OPTION>
										<OPTION VALUE="reissue">Re-Issue</OPTION>
										<!--- <OPTION VALUE="singleagency">Single-in-file-Agency Select</OPTION>
										<OPTION VALUE="twoagency">Two-in-file-merge-Agency Select</OPTION> --->
										<OPTION VALUE="safe">SAFE (1 Bureau In File)</OPTION>
											
										</select>  
				</td></tr>
			
								<tr>
									<td width=200 bgcolor="f1f1f1" align=right valign=top>
										<FONT FACE=ARIAL SIZE=1 color="gray">
						Signing
									</td>
			<!--  window.location=('form_title_request.cfm?comp_id=<cfoutput>#comp_id#</cfoutput>&user_id_1=<cfoutput>#USER_ID_1#</cfoutput>&lo_id=<cfoutput>#lo_id#</cfoutput>&zip_id=<cfoutput>#zip_id#</cfoutput>&title=<cfoutput>#title#</cfoutput>&property=<cfoutput>#property#</cfoutput>&appraisal=<cfoutput>#appraisal#</cfoutput>&other=<cfoutput>#other#</cfoutput>&a_trig='+this.options[this.selectedIndex].value)-->
									<td width=519 bgcolor="f1f1f1" align=left valign=top>
				<select name="signing" onchange="prodSelect()"
											size="1" 
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: 003F1E; 
											background-color: E4E3E3; 
											border-color: white; 
											border-left-width: thin; 
											border-right-width: thin; 
											border-top-width: thin; 
											border-bottom-width: thin; 
											border-width: thin; 
											border-style: bar; 
											clear: none; 
											float: none;" 
											rows="3" 
											cols="45" 
											>
											<OPTION VALUE="">Select</OPTION>											
											<OPTION VALUE="Attorney/Title Agent">Attorney/Title Agent</OPTION>
											<OPTION VALUE="Notary" >Notary</OPTION>
											<OPTION VALUE="Phone Closing" >Phone Closing</OPTION>
											<OPTION VALUE="Platinium Closing (Phone close w/notary)" >Platinium Closing (Phone close w/notary)</OPTION>
										</select>  
				</td></tr>	
				
							</table>
						</td>
					</tr>
			<!--	
			
				-->
				<TR id="tbl2" style="display:none">
						<TD width=519 align=center valign=top bgcolor=d3d3d3>
			
							<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
									<TR>
						<TD width=519 colspan=2 align=center valign=top bgcolor=f1f1f1>
				<center><b><font face=verdana size=1 color=red> PLEASE ENTER CLOSING DATA BELOW FOR THIS SIGNING</font></b></center>
			
				</TD></TR>
				<tr>
								<td width=200 bgcolor="f1f1f1" align=right valign=top>
										<FONT FACE=ARIAL SIZE=1 color="gray">
								Closing Date Request
									</td>
				
			
									<td width=219 bgcolor="f1f1f1" align=left valign=top>
			<cfINPUT TYPE="Text" NAME="input_date" size=12 maxlength=20 
												value = "" 
											style="font-size: 9; 
												font-family: verdana; 
												font-style: normal; 
												color: 003F1E; 
												background-color: E4E3E3; 
												border-color: white; 
												border-left-width: thin; 
												border-right-width: thin; 
												border-top-width: thin; 
												border-bottom-width: thin; 
												border-width: thin; 
												border-style: bar; 
												clear: none;" >  
										 <font face=verdana size=2 color=black> <A href="javascript:ShowCalendar(document.all('calpic'),document.all('input_date'),document.all('null'),'09/1/2004', '12/31/2009')" onclick="event.cancelBubble=true;"><img src="/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic" style="POSITION: relative"></A> 
			 
				</td></tr>
				<tr>
									<td width=200 bgcolor="f1f1f1" align=right valign=top>
										<FONT FACE=ARIAL SIZE=1 color="gray">
								Closing Time Request
									</td>
			
									<td width=219 bgcolor="f1f1f1" align=left valign=top>
				<SELECT name="a_req_closing_time"
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
											cols="45">
			
			<option value="08:00 am">8:00 am
			<option value="08:30 am">8:30 am
			<option value="09:00 am">9:00 am
			<option value="09:30 am">9:30 am
			<option value="10:00 am">10:00 am
			<option value="10:30 am">10:30 am
			<option value="11:00 am">11:00 am
			<option value="11:30 am">11:30 am
			<option value="12:00 am">12:00 pm
			<option value="12:30 am">12:30 pm
			<option value="1:00 pm">1:00 pm
			<option value="1:30 pm">1:30 pm
			<option value="2:00 pm">2:00 pm
			<option value="2:30 pm">2:30 pm
			<option value="3:00 pm">3:00 pm
			<option value="3:30 pm">3:30 pm
			<option value="4:00 pm">4:00 pm
			<option value="4:30 pm">4:30 pm
			<option value="5:00 pm">5:00 pm
			<option value="5:30 pm">5:30 pm
			<option value="6:00 pm">6:00 pm
			<option value="6:30 pm">6:30 pm
			<option value="7:00 pm">7:00 pm
			<option value="7:30 pm">7:30 pm
			<option value="8:00 pm">8:00 pm
			<option value="8:30 pm">8:30 pm
			<option value="9:00 pm">9:00 pm
			<option value="9:30 pm">9:30 pm
			<option value="10:30 pm">10:30 pm
			<option value="11:00 pm">11:00 pm
			</SELECT>
			
				</td></tr>
			<CFQUERY datasource="#request.dsn#" NAME="read_zip_code">
					
						SELECT *
						FROM zip_info
						WHERE zip_id = #zip_id#
					
					</CFQUERY>
								
			
									<tr>
									<td width=200 bgcolor="f1f1f1" align=right valign=top>
										<FONT FACE=ARIAL SIZE=1 color="gray">
								Location for Closing
									</td>
			
									<td width=519 bgcolor="f1f1f1" align=left valign=top>
					<select name="A_Settle_Location"
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
											cols="45">
				 	
					<option value="address">Property Address</option>
					<option value="other">Other</option>
					<cfif #read_zip_code.state# eq "DE" OR #read_zip_code.state# eq "GA" OR #read_zip_code.state# eq "MA" OR #read_zip_code.state# eq "SC">
					<option value="ATTORNEY">Attorney Closing</option>
					</cfif>
				
											
										</select>  
				</td></tr>
			
								<tr>
									<td width=200 bgcolor="f1f1f1" align=right valign=top>
										<FONT FACE=ARIAL SIZE=1 color="gray">
						How will package be shipped
									</td>
			
									<td width=519 bgcolor="f1f1f1" align=left valign=top>
					<select name="A_How_Will_Be_Shipped"
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
											cols="45">
				
					<option value="email">Email</option>
					<option value="internet">Internet</option>
					<option value="Overnight">Overnight</option>
					<option value="other">Other</option>
				</td></tr>	
				
							</table>
							<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
									<TR>
						<TD width=519  align=center valign=top bgcolor=f1f1f1>
							<p>		<font face=verdana size=2 color=blue>			
							Special Instructions :<br> 
							<TEXTAREA name="A_Special_Inst"  COLS=90 ROWS=5
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
								clear: none;"></TEXTAREA>
								<p>
								</table>
							
							
							
						</td>
					</tr>
				
			</table>
			
			<!--- ======================================================================== --->
			<!--- Credit Product Listing --->
			<table width=520 id="credittable" cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF  style="display:none">
					<tr>
						<td width=519 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=2 color="black">
							<CENTER><B>CREDIT PRODUCT INFORMATION</B></CENTER>
							
						</TD>
					</TR>
			
					<TR>
						<TD width=519 align=center valign=top bgcolor=d3d3d3>
							
							 <table width=519 cellpadding=0 cellspacing=0 border=0 bgcolor=f1f1f1>
								
								<tr>
										<td width=170 bgcolor="f1f1f1" align=right valign="middle">
										<FONT FACE=ARIAL SIZE=1 color="gray">
										Report Type
										</td>
										<td width=174 bgcolor="f1f1f1" align=left valign="middle">
											<FONT FACE=ARIAL SIZE=1 color="gray">
											&nbsp;<INPUT TYPE="RADIO" NAME="report_type" VALUE="Individual" checked>Individual
										</td>
										<td width=175 bgcolor="f1f1f1" align=left valign="middle" colspan=3>	
											<FONT FACE=ARIAL SIZE=1 color="gray">
											<INPUT TYPE="RADIO"  NAME="report_type" VALUE="Joint">Joint  
										</td>
								</tr>
								 <!--- <tr height=1>
										<td bgcolor="f1f1f1" colspan=5 height=1>&nbsp;</td>
								</tr>  --->
								<tr>
										<td width=160 bgcolor="f1f1f1" align=right valign="middle"  height="30" >
										<FONT FACE=ARIAL SIZE=1 color="gray">
											&nbsp;&nbsp;Product Type
										</td>
										<td width=359 bgcolor="f1f1f1" align=left valign="middle" colspan=3 height="30">
											&nbsp;&nbsp;<select name="product_type" 
												size="1" 
												style="font-size: 9; 
												font-family: verdana; 
												font-style: normal; 
												color: 003F1E; 
												background-color: E4E3E3; 
												border-color: white; 
												border-left-width: thin; 
												border-right-width: thin; 
												border-top-width: thin; 
												border-bottom-width: thin; 
												border-width: thin; 
												border-style: bar; 
												clear: none; 
												float: none;" 
												rows="3" 
												cols="45" 
												>
													<OPTION VALUE="" SELECTED>Select</OPTION>
													<OPTION VALUE="Single-in-file" >Single-in-file</OPTION>
													<OPTION Value="Two-in-file-merge" >Two-in-file-merge</OPTION>
													<OPTION VALUE="Three-in-file-merge" >Three-in-file-merge</OPTION>
													<OPTION VALUE="2-Bureau Infile+RMCR" >2-Bureau Infile+RMCR</OPTION>
													<OPTION Value="2-Bureau RMCR" >2-Bureau RMCR</OPTION>
													<OPTION Value="3-Bureau Infile+RMCR" >3-Bureau Infile+RMCR</OPTION>
													<OPTION Value="3-Bureau RMCR" >3-Bureau RMCR</OPTION>
											</select>  
										</td>
								</tr>
								 <!--- <tr height=1>
										<td bgcolor="f1f1f1" colspan=5 height=1>&nbsp;</td>
								</tr> --->  
								<tr>
									<td width=160 bgcolor="f1f1f1" align=right valign="middle">
										<FONT FACE=ARIAL SIZE=1 color="gray">
										Repositories
									</td>
									<td width=89 bgcolor="f1f1f1" align=center valign="middle" >
										<FONT FACE=ARIAL SIZE=1 color="gray">
										Agency Select<br>
										<INPUT TYPE="Checkbox" NAME="rep1" value="Agency Select"
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: 003F1E; 
											background-color: E4E3E3; 
											border-color: white; 
											border-left-width: thin; 
											border-right-width: thin; 
											border-top-width: thin; 
											border-bottom-width: thin; 
											border-width: thin; 
											border-style: bar; 
											clear: none;">
									</td>
									<td width=89 bgcolor="f1f1f1" align=left valign="middle" >
										<FONT FACE=ARIAL SIZE=1 color="gray">
										Equifax<br>
										<INPUT TYPE="Checkbox" NAME="rep2" value="Equifax"
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: 003F1E; 
											background-color: E4E3E3; 
											border-color: white; 
											border-left-width: thin; 
											border-right-width: thin; 
											border-top-width: thin; 
											border-bottom-width: thin; 
											border-width: thin; 
											border-style: bar; 
											clear: none;">
									</td>
									<td width=89 bgcolor="f1f1f1" align=center valign="middle" >
										<FONT FACE=ARIAL SIZE=1 color="gray">
										Experian<br>
										<INPUT TYPE="Checkbox" NAME="rep3" value="Experian"
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: 003F1E; 
											background-color: E4E3E3; 
											border-color: white; 
											border-left-width: thin; 
											border-right-width: thin; 
											border-top-width: thin; 
											border-bottom-width: thin; 
											border-width: thin; 
											border-style: bar; 
											clear: none;">
									</td>
									<td width=89 bgcolor="f1f1f1" align=center valign="middle">
										<FONT FACE=ARIAL SIZE=1 color="gray">
										TransUnion<br>
										<INPUT TYPE="Checkbox" NAME="rep4" value="TransUnion"
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: 003F1E; 
											background-color: E4E3E3; 
											border-color: white; 
											border-left-width: thin; 
											border-right-width: thin; 
											border-top-width: thin; 
											border-bottom-width: thin; 
											border-width: thin; 
											border-style: bar; 
											clear: none;">
									</td>
								</tr> 
							</table> 
						</TD>
					</TR>
				</table>			
			<!--- =================================== --->
					<!--- ===/ Applicant Primary Residence Address for Credit Product \=== --->
					<!--- =================================== --->
			<cfif #trim(get_id.prop_use_type)# eq "Investment/Other">
			<!--- <table>
				<tr><td>are we here</td></tr>
			</table> --->
			
			<table id="crdprmadd" width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF style="display:none">
					<tr>
						<td width=519 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=2 color="black">
							<CENTER><B>PRIMARY ADDRESS FOR CREDIT</B></CENTER>
							
						</TD>
					</TR>
			
					<TR>
						<TD width=519 align=center valign=top bgcolor=d3d3d3>
						
						<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
			
						<tr>
									<td width=25 bgcolor="f1f1f1" align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="gray">
										<p>
										<br>
										1.>>
									</td>
									<td width=150 bgcolor="f1f1f1" align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="gray">
										Address<br>
										<INPUT TYPE="Text" NAME="crdprmaddress1" SIZE=30 MAXLENGTH=100 
												style="font-size: 9; 
												font-family: verdana; 
												font-style: normal; 
												color: 003F1E; 
												background-color: E4E3E3; 
												border-color: white; 
												border-left-width: thin; 
												border-right-width: thin; 
												border-top-width: thin; 
												border-bottom-width: thin; 
												border-width: thin; 
												border-style: bar; 
												clear: none;" >  
									</td>
									
									
									<td width=100 bgcolor="f1f1f1" align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="gray">
										City<br>
										<INPUT TYPE="Text" NAME="crdprmcity1" SIZE=20 MAXLENGTH=100 
												style="font-size: 9; 
												font-family: verdana; 
												font-style: normal; 
												color: 003F1E; 
												background-color: E4E3E3; 
												border-color: white; 
												border-left-width: thin; 
												border-right-width: thin; 
												border-top-width: thin; 
												border-bottom-width: thin; 
												border-width: thin; 
												border-style: bar; 
												clear: none;" >  
									</td>
									
									<CFQUERY datasource="#request.dsn#" NAME="read_state_list">
										SELECT *
										FROM first_title_states
										ORDER BY st_abbrev ASC
									</CFQUERY>
									<td width=100 bgcolor="f1f1f1" align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="gray">
										State<br>
										<select name="crdprmstate1" 
											size="1" 
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: 003F1E; 
											background-color: E4E3E3; 
											border-color: white; 
											border-left-width: thin; 
											border-right-width: thin; 
											border-top-width: thin; 
											border-bottom-width: thin; 
											border-width: thin; 
											border-style: bar; 
											clear: none; 
											float: none;" 
											rows="3" 
											cols="25" 
											>
											<option value="" selected>Select State</option>
			                  		<CFOUTPUT QUERY="read_state_list">
										<option value="#st_abbrev#">#st_abbrev#</option>
									</CFOUTPUT>	
								</select>
			
			              </td>
									<td width=100 bgcolor="f1f1f1" align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="gray">
										Zip Code<br>
										<INPUT TYPE="Text" NAME="crdprmzip1" SIZE=10 MAXLENGTH=10 
												style="font-size: 9; 
												font-family: verdana; 
												font-style: normal; 
												color: 003F1E; 
												background-color: E4E3E3; 
												border-color: white; 
												border-left-width: thin; 
												border-right-width: thin; 
												border-top-width: thin; 
												border-bottom-width: thin; 
												border-width: thin; 
												border-style: bar; 
												clear: none;" >  
									</td>
								</tr>
			         <tr>
									<td width=25 bgcolor="f1f1f1" align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="gray">
										<p>
										<br>
										2.>>
									</td>
									<td width=150 bgcolor="f1f1f1" align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="gray">
										Address<br>
										<INPUT TYPE="Text" NAME="crdprmaddress2" SIZE=30 MAXLENGTH=100 
												style="font-size: 9; 
												font-family: verdana; 
												font-style: normal; 
												color: 003F1E; 
												background-color: E4E3E3; 
												border-color: white; 
												border-left-width: thin; 
												border-right-width: thin; 
												border-top-width: thin; 
												border-bottom-width: thin; 
												border-width: thin; 
												border-style: bar; 
												clear: none;" >  
									</td>
									
									
									<td width=100 bgcolor="f1f1f1" align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="gray">
										City<br>
										<INPUT TYPE="Text" NAME="crdprmcity2" SIZE=20 MAXLENGTH=100 
												style="font-size: 9; 
												font-family: verdana; 
												font-style: normal; 
												color: 003F1E; 
												background-color: E4E3E3; 
												border-color: white; 
												border-left-width: thin; 
												border-right-width: thin; 
												border-top-width: thin; 
												border-bottom-width: thin; 
												border-width: thin; 
												border-style: bar; 
												clear: none;" >  
									</td>
									
									<td width=100 bgcolor="f1f1f1" align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="gray">
										State<br>
										<select name="crdprmstate2" 
											size="1" 
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: 003F1E; 
											background-color: E4E3E3; 
											border-color: white; 
											border-left-width: thin; 
											border-right-width: thin; 
											border-top-width: thin; 
											border-bottom-width: thin; 
											border-width: thin; 
											border-style: bar; 
											clear: none; 
											float: none;" 
											rows="3" 
											cols="45" 
											>
											<option value="" selected>Select State</option>
									<CFOUTPUT QUERY="read_state_list">
										<option value="#st_abbrev#">#st_abbrev#</option>
									</CFOUTPUT>	
								</select>		
			                      </td>
									<td width=100 bgcolor="f1f1f1" align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="gray">
										Zip Code<br>
										<INPUT TYPE="Text" NAME="crdprmzip2" SIZE=10 MAXLENGTH=10 
												style="font-size: 9; 
												font-family: verdana; 
												font-style: normal; 
												color: 003F1E; 
												background-color: E4E3E3; 
												border-color: white; 
												border-left-width: thin; 
												border-right-width: thin; 
												border-top-width: thin; 
												border-bottom-width: thin; 
												border-width: thin; 
												border-style: bar; 
												clear: none;" >  
									</td>
								</tr>
			 
			
			</table>
			</table>
			</cfif>
			<!--- ======================================================================== --->
			<!--- Property Structure for AVM Products --->
			<table width=520 id="avmtable" cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF  style="display:none">
					<tr>
						<td width=519 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=2 color="black">
							<CENTER><B>PROPERTY STRUCTURE FOR AVM PRODUCTS</B></CENTER>
							
						</TD>
					</TR>
			
					<TR>
						<TD width=519 align=center valign=top bgcolor=d3d3d3>
						
							<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
								
								<tr>
									
									
									<td width=100 bgcolor="f1f1f1" align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="gray">
										Bedrooms<br></b>
										<INPUT TYPE="Text" NAME="bedroom" SIZE=7 MAXLENGTH=5 
												style="font-size: 9; 
												font-family: verdana; 
												font-style: normal; 
												color: 003F1E; 
												background-color: E4E3E3; 
												border-color: white; 
												border-left-width: thin; 
												border-right-width: thin; 
												border-top-width: thin; 
												border-bottom-width: thin; 
												border-width: thin; 
												border-style: bar; 
												clear: none;"> 
									</td>
			
										<td width=100 bgcolor="f1f1f1" align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="gray">
										Bathrooms<br></b>
										<INPUT TYPE="Text" NAME="bathroom" SIZE=7 MAXLENGTH=15 
												style="font-size: 9; 
												font-family: verdana; 
												font-style: normal; 
												color: 003F1E; 
												background-color: E4E3E3; 
												border-color: white; 
												border-left-width: thin; 
												border-right-width: thin; 
												border-top-width: thin; 
												border-bottom-width: thin; 
												border-width: thin; 
												border-style: bar; 
												clear: none;" >  
									</td>
			
									<td width=100 bgcolor="f1f1f1" align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="gray">
										Rooms<br>
										<INPUT TYPE="Text" NAME="room" SIZE=7 MAXLENGTH=1 
												style="font-size: 9; 
												font-family: verdana; 
												font-style: normal; 
												color: 003F1E; 
												background-color: E4E3E3; 
												border-color: white; 
												border-left-width: thin; 
												border-right-width: thin; 
												border-top-width: thin; 
												border-bottom-width: thin; 
												border-width: thin; 
												border-style: bar; 
												clear: none;" > 
									</td>
			
									<td width=100 bgcolor="f1f1f1" align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="gray">
										<b>Stories<br></b>
										<INPUT TYPE="Text" NAME="stories" SIZE=7 MAXLENGTH=11 
												style="font-size: 9; 
												font-family: verdana; 
												font-style: normal; 
												color: 003F1E; 
												background-color: E4E3E3; 
												border-color: white; 
												border-left-width: thin; 
												border-right-width: thin; 
												border-top-width: thin; 
												border-bottom-width: thin; 
												border-width: thin; 
												border-style: bar; 
												clear: none;" >  
									</td>
								
									<td width=100 bgcolor="f1f1f1" align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="gray">
										Fire Places<br>
										<INPUT TYPE="Text" NAME="fireplace" SIZE=7 MAXLENGTH=15 
												style="font-size: 9; 
												font-family: verdana; 
												font-style: normal; 
												color: 003F1E; 
												background-color: E4E3E3; 
												border-color: white; 
												border-left-width: thin; 
												border-right-width: thin; 
												border-top-width: thin; 
												border-bottom-width: thin; 
												border-width: thin; 
												border-style: bar; 
												clear: none;" >  
									</td>
									
									</tr>	
								<tr>						
									<td width=100 bgcolor="f1f1f1" align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="gray">
										Living Area<br>
										<INPUT TYPE="Text" NAME="livingarea" SIZE=7 MAXLENGTH=5 
												style="font-size: 9; 
												font-family: verdana; 
												font-style: normal; 
												color: 003F1E; 
												background-color: E4E3E3; 
												border-color: white; 
												border-left-width: thin; 
												border-right-width: thin; 
												border-top-width: thin; 
												border-bottom-width: thin; 
												border-width: thin; 
												border-style: bar; 
												clear: none;" >  
									</td>
									<td width=100 bgcolor="f1f1f1" align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="gray">
										Garage Spaces<br></b>
										<INPUT TYPE="Text" NAME="garagespace" SIZE=7 MAXLENGTH=5 
												style="font-size: 9; 
												font-family: verdana; 
												font-style: normal; 
												color: 003F1E; 
												background-color: E4E3E3; 
												border-color: white; 
												border-left-width: thin; 
												border-right-width: thin; 
												border-top-width: thin; 
												border-bottom-width: thin; 
												border-width: thin; 
												border-style: bar; 
												clear: none;"> 
									</td>
									
									<td width=100 bgcolor="f1f1f1" align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="gray">
										Lot Size<br>
										<INPUT TYPE="Text" NAME="lotsize" SIZE=7 MAXLENGTH=5 
												style="font-size: 9; 
												font-family: verdana; 
												font-style: normal; 
												color: 003F1E; 
												background-color: E4E3E3; 
												border-color: white; 
												border-left-width: thin; 
												border-right-width: thin; 
												border-top-width: thin; 
												border-bottom-width: thin; 
												border-width: thin; 
												border-style: bar; 
												clear: none;" > 
									</td>
			
									<td width=100 bgcolor="f1f1f1" align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="gray">
										Lot Size Units<br>
										<select name="lotsizeunits" 
											size="1" 
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: 003F1E; 
											background-color: E4E3E3; 
											border-color: white; 
											border-left-width: thin; 
											border-right-width: thin; 
											border-top-width: thin; 
											border-bottom-width: thin; 
											border-width: thin; 
											border-style: bar; 
											clear: none; 
											float: none;" 
											rows="3" 
											cols="45" 
											>
												<OPTION VALUE="" SELECTED>Select</OPTION>
												<OPTION VALUE="ACRE" >Acres</OPTION>
												<OPTION Value="SQFT" >Square Feet</OPTION>
										</select>  
										
									</td>
									
									<td width=100 bgcolor="f1f1f1" align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="gray">
										Year Built<br>
										<INPUT TYPE="Text" NAME="yearbuilt" SIZE=7 MAXLENGTH=15 
												style="font-size: 9; 
												font-family: verdana; 
												font-style: normal; 
												color: 003F1E; 
												background-color: E4E3E3; 
												border-color: white; 
												border-left-width: thin; 
												border-right-width: thin; 
												border-top-width: thin; 
												border-bottom-width: thin; 
												border-width: thin; 
												border-style: bar; 
												clear: none;" > 
										
									</td>
									
									</tr>
									<tr>
									<td width=100 bgcolor="f1f1f1" align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="gray">
										Purchase Year <br>
										<INPUT TYPE="Text" NAME="purchaseyear" SIZE=7 MAXLENGTH=5 
												style="font-size: 9; 
												font-family: verdana; 
												font-style: normal; 
												color: 003F1E; 
												background-color: E4E3E3; 
												border-color: white; 
												border-left-width: thin; 
												border-right-width: thin; 
												border-top-width: thin; 
												border-bottom-width: thin; 
												border-width: thin; 
												border-style: bar; 
												clear: none;" > 
										
									</td>
									<td width=100 bgcolor="f1f1f1" align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="gray">
										Purchase Month<br>
										<INPUT TYPE="Text" NAME="purchasemonth" SIZE=7 MAXLENGTH=5 
												style="font-size: 9; 
												font-family: verdana; 
												font-style: normal; 
												color: 003F1E; 
												background-color: E4E3E3; 
												border-color: white; 
												border-left-width: thin; 
												border-right-width: thin; 
												border-top-width: thin; 
												border-bottom-width: thin; 
												border-width: thin; 
												border-style: bar; 
												clear: none;" >  
									</td>
									
			
									<td width=100 bgcolor="f1f1f1" align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="gray">
										<b>Est Value<br></b>
										<INPUT TYPE="Text" NAME="estvalue" SIZE=7 MAXLENGTH=11 
												style="font-size: 9; 
												font-family: verdana; 
												font-style: normal; 
												color: 003F1E; 
												background-color: E4E3E3; 
												border-color: white; 
												border-left-width: thin; 
												border-right-width: thin; 
												border-top-width: thin; 
												border-bottom-width: thin; 
												border-width: thin; 
												border-style: bar; 
												clear: none;" >  
									</td>
									<td width=100 bgcolor="f1f1f1" align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="gray">
										Prev Est Value<br></b>
										<INPUT TYPE="Text" NAME="preestvalue" SIZE=7 MAXLENGTH=11
												style="font-size: 9; 
												font-family: verdana; 
												font-style: normal; 
												color: 003F1E; 
												background-color: E4E3E3; 
												border-color: white; 
												border-left-width: thin; 
												border-right-width: thin; 
												border-top-width: thin; 
												border-bottom-width: thin; 
												border-width: thin; 
												border-style: bar; 
												clear: none;"> 
									</td>
								<CFQUERY datasource="#request.dsn#" NAME="prevestvalsrc">
										SELECT *
										FROM prevestvalsrc
										ORDER BY constant ASC
								</CFQUERY>
									
									<td  width=125 colspan=5bgcolor="f1f1f1" align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="gray">
										Prev Est Value Source<br></b>
										<select name="preestvaluesrc" 
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: 003F1E; 
											background-color: E4E3E3; 
											border-color: white; 
											border-left-width: thin; 
											border-right-width: thin; 
											border-top-width: thin; 
											border-bottom-width: thin; 
											border-width: thin; 
											border-style: bar; 
											clear: none;" >  
														
			         						<OPTION VALUE="" SELECTED>Select</OPTION>
											<cfoutput query="prevestvalsrc">
											<OPTION VALUE="#Constant#" >#Description#</OPTION>
											</cfoutput>
													</select>   
									</td>
									
										
									</tr>
			
									
									<tr>
									
									<td width=100 bgcolor="f1f1f1" align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="gray">
										Garage<br>
										<INPUT TYPE="Checkbox" NAME="garage" value=1
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: 003F1E; 
											background-color: E4E3E3; 
											border-color: white; 
											border-left-width: thin; 
											border-right-width: thin; 
											border-top-width: thin; 
											border-bottom-width: thin; 
											border-width: thin; 
											border-style: bar; 
											clear: none;">
									</td>
										
									<td width=100 bgcolor="f1f1f1" align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="gray">
										Attached Garage<br>
										<INPUT TYPE="Checkbox" NAME="attgarage" value=1
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: 003F1E; 
											background-color: E4E3E3; 
											border-color: white; 
											border-left-width: thin; 
											border-right-width: thin; 
											border-top-width: thin; 
											border-bottom-width: thin; 
											border-width: thin; 
											border-style: bar; 
											clear: none;">
										
									</td>
									
									<td width=100 bgcolor="f1f1f1" align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="gray">
										Spa<br>
										<INPUT TYPE="Checkbox" NAME="spa" value=1
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: 003F1E; 
											background-color: E4E3E3; 
											border-color: white; 
											border-left-width: thin; 
											border-right-width: thin; 
											border-top-width: thin; 
											border-bottom-width: thin; 
											border-width: thin; 
											border-style: bar; 
											clear: none;">
										
									</td>
										
									
									<td width=100 bgcolor="f1f1f1" align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="gray">
										Pool<br>
										<INPUT TYPE="Checkbox" NAME="pool" value=1
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: 003F1E; 
											background-color: E4E3E3; 
											border-color: white; 
											border-left-width: thin; 
											border-right-width: thin; 
											border-top-width: thin; 
											border-bottom-width: thin; 
											border-width: thin; 
											border-style: bar; 
											clear: none;">
										
									</td>
									<td width=100 bgcolor="f1f1f1" align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="gray">
										<b>Central AC<br></b>
										<INPUT TYPE="Checkbox" NAME="centralac" value=1
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: 003F1E; 
											background-color: E4E3E3; 
											border-color: white; 
											border-left-width: thin; 
											border-right-width: thin; 
											border-top-width: thin; 
											border-bottom-width: thin; 
											border-width: thin; 
											border-style: bar; 
											clear: none;">
									</td>
			
									
								</tr>
								<tr>
								<td width=100 bgcolor="f1f1f1" align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="gray">
										Basement<br>
										<INPUT TYPE="Checkbox" NAME="basement" value=1
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: 003F1E; 
											background-color: E4E3E3; 
											border-color: white; 
											border-left-width: thin; 
											border-right-width: thin; 
											border-top-width: thin; 
											border-bottom-width: thin; 
											border-width: thin; 
											border-style: bar; 
											clear: none;">
										
								</td>
								<td width=100 bgcolor="f1f1f1" align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="gray">
										Detached Building<br></b>
										<INPUT TYPE="Checkbox" NAME="detachedbldg" value=1
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: 003F1E; 
											background-color: E4E3E3; 
											border-color: white; 
											border-left-width: thin; 
											border-right-width: thin; 
											border-top-width: thin; 
											border-bottom-width: thin; 
											border-width: thin; 
											border-style: bar; 
											clear: none;">
										</td>
								
									<td width=100 bgcolor="f1f1f1" align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="gray">
										Crawl Space<br></b>
										<INPUT TYPE="Checkbox" NAME="crawl" value=1
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: 003F1E; 
											background-color: E4E3E3; 
											border-color: white; 
											border-left-width: thin; 
											border-right-width: thin; 
											border-top-width: thin; 
											border-bottom-width: thin; 
											border-width: thin; 
											border-style: bar; 
											clear: none;">
										</td>
										<td></td>
										<td></td>
										
										</tr>
														
							</table>
			
			
			</table>
			<!--- Property Contact Name --->
			
			
			<table id="avmcontact" width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF style="display:none">
					<tr>
						<td width=519 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=2 color="black">
							<CENTER><B>PROPERTY CONTACT NAME</B></CENTER>
							
						</TD>
					</TR>
			
					<TR>
						<TD width=519 align=center valign=top bgcolor=d3d3d3>
						
							
						
						
							<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
			
					<!--- =================================== --->
					<!--- ===/ Property contact name for AVM Products \=== --->
					<!--- =================================== --->
								<tr>
									
									
									<td width=90 bgcolor="yellow" align=center valign=top>
										<b><FONT FACE=ARIAL SIZE=1 color="black">
										Last Name<br></b>
										<CFINPUT TYPE="Text" NAME="lastname" 
												SIZE=11 MAXLENGTH=25 
												style="font-size: 9; 
												font-family: verdana; 
												font-style: normal; 
												color: 003F1E; 
												background-color: white; 
												border-color: white; 
												border-left-width: thin; 
												border-right-width: thin; 
												border-top-width: thin; 
												border-bottom-width: thin; 
												border-width: thin; 
												border-style: bar; 
												clear: none;" > 
									</td>
			
										<td width=90 bgcolor="yellow" align=center valign=top>
										<b><FONT FACE=ARIAL SIZE=1 color="black">
										First Name<br></b>
										<CFINPUT TYPE="Text" NAME="firstname" 
												SIZE=11 MAXLENGTH=15 
												style="font-size: 9; 
												font-family: verdana; 
												font-style: normal; 
												color: 003F1E; 
												background-color: white; 
												border-color: white; 
												border-left-width: thin; 
												border-right-width: thin; 
												border-top-width: thin; 
												border-bottom-width: thin; 
												border-width: thin; 
												border-style: bar; 
												clear: none;" >  
									</td>
			
									<td width=30 bgcolor="f1f1f1" align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="gray">
										MI.<br>
										<INPUT TYPE="Text" NAME="miname" SIZE=1 MAXLENGTH=1 
												style="font-size: 9; 
												font-family: verdana; 
												font-style: normal; 
												color: 003F1E; 
												background-color: E4E3E3; 
												border-color: white; 
												border-left-width: thin; 
												border-right-width: thin; 
												border-top-width: thin; 
												border-bottom-width: thin; 
												border-width: thin; 
												border-style: bar; 
												clear: none;" > 
									</td>
			
									
			
									<td width=90 bgcolor="f1f1f1" align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="gray">
										Home Ph.<br>
										<INPUT TYPE="Text" NAME="hphone" SIZE=12 MAXLENGTH=15 
												style="font-size: 9; 
												font-family: verdana; 
												font-style: normal; 
												color: 003F1E; 
												background-color: E4E3E3; 
												border-color: white; 
												border-left-width: thin; 
												border-right-width: thin; 
												border-top-width: thin; 
												border-bottom-width: thin; 
												border-width: thin; 
												border-style: bar; 
												clear: none;" >  
									</td>
			
									<td width=90 bgcolor="f1f1f1" align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="gray">
										Work Ph.<br>
										<INPUT TYPE="Text" NAME="wphone" SIZE=12 MAXLENGTH=15 
												style="font-size: 9; 
												font-family: verdana; 
												font-style: normal; 
												color: 003F1E; 
												background-color: E4E3E3; 
												border-color: white; 
												border-left-width: thin; 
												border-right-width: thin; 
												border-top-width: thin; 
												border-bottom-width: thin; 
												border-width: thin; 
												border-style: bar; 
												clear: none;" > 
										
									</td>
									
									<td width=40 bgcolor="f1f1f1" align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="gray">
										Ext.<br>
										<INPUT TYPE="Text" NAME="ext" SIZE=4 MAXLENGTH=5 
												style="font-size: 9; 
												font-family: verdana; 
												font-style: normal; 
												color: 003F1E; 
												background-color: E4E3E3; 
												border-color: white; 
												border-left-width: thin; 
												border-right-width: thin; 
												border-top-width: thin; 
												border-bottom-width: thin; 
												border-width: thin; 
												border-style: bar; 
												clear: none;" >  
									</td>
			
								</tr>
			
			
			</table>
			</table>
			
			<table id="crdtbl"  width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1 style="display:none">
			
			
			
					<TR>
						<TD width=519 align=center valign=top bgcolor=d3d3d3>
						
						<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
			
						<tr>
									
									<td width=205 bgcolor="yellow" align=right valign=top>
										<b><FONT FACE=ARIAL SIZE=1 color="black">
										Previous Credit Reference <br>
									</td>
									<td COLSPAN=3 width=314 bgcolor="yellow" align=left valign=top>
										<INPUT TYPE="Text" NAME="prevcrdref" 
												
												style="font-size: 9; 
												font-family: verdana; 
												font-style: normal; 
												color: 003F1E; 
												background-color: white; 
												border-color: white; 
												border-left-width: thin; 
												border-right-width: thin; 
												border-top-width: thin; 
												border-bottom-width: thin; 
												border-width: thin; 
												border-style: bar; 
												clear: none;" >  
									</td>
						</tr>
				
				</table>
				</td></tr>
				</table>
			
						<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>	
						<tr><td width=607 align=right colspan = 2 valign=bottom>
						
						<NOBR><input type=image border=0 src="./images/button_submit_title.gif"> &nbsp;&nbsp;&nbsp;&nbsp;</NOBR></td></tr>
			</table>
				<tr>				
							
						</TD>
				</TR>
			</TABLE>	
					</TD>
				</TR>
			</TABLE>
						
			
					<tr><td width=780 align=left valign=bottom><IMG src="./images/bottom.gif" width = "780"></td></tr></TBODY></TABLE>