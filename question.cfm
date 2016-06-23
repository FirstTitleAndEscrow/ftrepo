<CFPARAM NAME="a_flag" DEFAULT="0">
<CFSET r_count = "0">
<style>
TD {font-family:Arial, Helvetica, sans-serif;}
</style>
<script>
function validateForm()
{


	if (document.forms["frm"].elements["Question1"].selectedIndex==document.forms["frm"].elements["Question2"].selectedIndex)
	{
		 alert("Please select 3 different questions");
		 return false;
	}
	
	if (document.forms["frm"].elements["Question1"].selectedIndex==document.forms["frm"].elements["Question3"].selectedIndex)
	{
		 alert("Please select 3 different questions");
		 return false;
	}
	
	if (document.forms["frm"].elements["Question2"].selectedIndex==document.forms["frm"].elements["Question3"].selectedIndex)
	{
		 alert("Please select 3 different questions");
		 return false;
	}
	
	
	return true;
	
}

</script>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_question">
	Select QuestionId,QuestionName from questionmaster 
	ORDER BY QuestionId ASC
</CFQUERY>

 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
	<head>
		<title>1st Title & Escrow, Inc. </title>
</head>


<BODY BGCOLOR="white" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CFFORM NAME="frm" ACTION="client_acct_mgt.cfm?comp_id=#URL.comp_id#&user_id_1=0&lo_id=0" METHOD=POST onsubmit="javascript:return validateForm();">


<table width=780 border="0" cellpadding="0" cellspacing="0" background="./images/back_03.gif">
	<tr>
		<td align="center">
			<table width="770" height="110" border=0 cellpadding=0 cellspacing=0 background="/client/images/banner_black_wout_logo.jpg" valign=top>
				<tr><td rowspan="2" valign="top" align="right" width="220"><cfinclude template="logo_swap_include.cfm"></td></tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="center">
			<table width=675>
	<tr>	
		<td height="60">
			<FONT  size="3" color="black">
				<br>
<center><font size=+1><strong>NEW SECURITY PROCEDURES</strong></font></center><br>
<br>
In order to better protect our clients' accounts from unauthorized access, we have implemented new security procedures.<br>
<br>
Please select an image to be used as your site key. This image will appear on our site whenever you log in, to assure you have logged in to our site, and have not been redirected.
		</td>
	</tr>
	<tr>
		<td>			
			<table>
				<tr>
					<td>
						<img src="images/bird.gif" border="0">
						<!---<INPUT TYPE="image" src="images/bird.gif" border="0">--->									
					</td>
					<td>
						<img src="images/elephant.gif" border="0">
					</td>
					<td>
						<img src="./images/elk.gif" border="0">
					</td>
					<td>
						<img src="./images/fish.gif" border="0">									
					</td>
					<td>
						<img src="./images/flamingo.gif" border="0">									
					</td>
				</tr>
				
				<tr>
					<td align="middle">	
						<cfinput type="Radio" name="SiteKeyId" selected="True" checked="yes" value="1">									
					</td>
					<td align="middle">
						<cfinput type="Radio" name="SiteKeyId" value="2">
					</td>
					<td align="middle">
						<cfinput type="Radio" name="SiteKeyId" value="3">
					</td>
					<td align="middle">
						<cfinput type="Radio" name="SiteKeyId" value="4">									
					</td>
					<td align="middle">
						<cfinput type="Radio" name="SiteKeyId" value="5">									
					</td>
				</tr>
				
				
				<tr>
					<td align="middle">
						<img src="./images/fly.gif" border="0">
					</td>
					<td align="middle">
						<img src="./images/frog.gif" border="0">
					</td>
					<td align="middle">
						<img src="./images/panda.gif" border="0">
					</td>
					<td align="middle">
						<img src="./images/rooster.gif" border="0">									
					</td>
					<td align="middle">
						<img src="./images/snail.gif" border="0">									
					</td>
				</tr>		
				
				<tr>
					<td align="middle">
						<cfinput type="Radio" name="SiteKeyId" value="6">									
					</td>
					<td align="middle">
						<cfinput type="Radio" name="SiteKeyId" value="7">
					</td>
					<td align="middle">
						<cfinput type="Radio" name="SiteKeyId" value="8">
					</td>
					<td align="middle">
						<cfinput type="Radio" name="SiteKeyId" value="9">									
					</td>
					<td align="middle">
						<cfinput type="Radio" name="SiteKeyId" value="10">									
					</td>
				</tr>																																										
			</table>
		</td>
	</tr>
	
	<tr>	
		<td height=60>
			<FONT  size="4" color="black">
				Additionally, please select and answer three of the questions below. In the event your computer is not recognized, these questions will be used to verify your identity.
		</td>
	</tr>
	
	<tr>
		<td>
			<table width=300 cellpadding=2 cellspacing=1 border=0>
				<tr>
					<td width=50 align=left valign=top>
							<FONT  size="4" color="black">
							Question 
					</td>
					<td align=left valign=top>
							<FONT  size="4" color="black">
							Answer
					</td>		
				</tr>
				
				<tr>				
					<td>
						<SELECT NAME="Question1">
							<CFOUTPUT QUERY="read_question"><OPTION VALUE="#read_question.QuestionId#" <cfif read_question.QuestionId eq 1>selected</cfif>>#read_question.QuestionName#</OPTION></CFOUTPUT>
						</SELECT>
					</td>
					<td>
						<cfinput type="Text" name="Ans1" size="30" required="yes" message="Answer one cannot be left blank. Please enter the answer.">
					</td>
				</tr>
				
				<tr>
					<td width=100 align=left valign=top>
						<SELECT NAME="Question2">
							<CFOUTPUT QUERY="read_question"><OPTION VALUE="#read_question.QuestionId#" <cfif read_question.QuestionId eq 2>selected</cfif>>#read_question.QuestionName#</OPTION></CFOUTPUT>
						</SELECT>
					</td>
					<td width=100 align=left valign=top>
						<cfinput type="Text" name="Ans2" size="30" maxlength="50" required="yes" message="Answer two cannot be left blank. Please enter the answer.">
					</td>
				</tr>
					
				<tr>
					<td width=100 align=left valign=top>
						<SELECT NAME="Question3">
							<CFOUTPUT QUERY="read_question"><OPTION VALUE="#read_question.QuestionId#" <cfif read_question.QuestionId eq 3>selected</cfif>>#read_question.QuestionName#</OPTION></CFOUTPUT>
						</SELECT>
					</td>
					<td width=100 align=left valign=top>
						<cfinput type="Text" name="Ans3" size="30" maxlength="50" required="yes"  message="Answer three cannot be left blank. Please enter the answer.">
					</td>			
				</tr>
				<tr>
					<td height=50 align="left" colspan="2">
						<cfinput type="Checkbox" name="IsPrivate" >This is a private computer, keep me logged in.	
					</td>
				</tr>
						
				<tr>
					<td>
						<!---<INPUT TYPE="image" src="./images/button_submit.gif" border="0">--->
							<tr><td><input id="updAns" type="submit" value="Update" /></td>	
					</td>
				</tr>																																									
				
			</table>
				</td>
			</tr>
				
		 </table>		
		</td>
	</tr>
		<tr><td width=780 align=left valign=bottom><IMG src="./images/bottom.gif" width = "780"></td></tr>
	</table>																																		

							
</CFFORM>
<!--- ======================================================================== --->
