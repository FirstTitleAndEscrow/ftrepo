<CFPARAM NAME="a_trigger" DEFAULT="0">
<cfinclude template="vendorHeader.cfm">
<div class="container_16" id="main_content">
	
			<!---- body text starts ----->
		<div class="main_area">
		<div class="ctnt_left">
	
			<div class="login_area" >
				<img src="https://www.firsttitleservices.com/wp-content/themes/ft_responsive/images/login_top.gif" border="0" alt="">
				<div class="login_bg">
					<h1>CUSTOMER LOGIN <cfif a_trigger NEQ 0>ERROR!</cfif></h1>
					<p>Welcome to the gateway to First Title's automated web-based ordering and tracking system. To login, please type your username and password below. </p>
					<form action="https://machine1.firsttitleservices.com/client_login_submit.cfm" method="post">

						<p><label>Username</label> <input name="user_name" type="text" class="loginbox"></p>
						<p><label>Password</label> <input name="password" type="password" class="loginbox"></p>

					<div style="padding-left:100px;"><input type="image" src="https://www.firsttitleservices.com/wp-content/themes/ft_responsive/images/btn_submit.gif" border="0" alt=""></div>
					<p>Having trouble logging in? Click one of the links below for help.</p>
					</form>
				</div>

				<div class="login_btm">
				
					<!---
				  <a onclick="window.open('','retpassword','width=420,height=200,status=0,resizable=0,scrollbars=0')" target="retpassword" href="https://machine1.firsttitleservices.com/client/retpassword.cfm?a_flag=1">Forgot your password?</a>
				  --->
				  <a href="https://www.firsttitleservices.com/index.php/sign-up">Don't Have An Account ?</a>
				</div>
			</div>
		
		</div>
		<div class="ctnt_right">
			<div class="right_list_area">
				<img src="http://www.firsttitleservices.com/wp-content/themes/ft_responsive/images/right_list_top.gif" border="0" alt="">
				<div class="right_list">
					<ul>
						<li><a href="http://www.firsttitleservices.com/login">Customer Login</a></li>
						<li><a href="http://www.firsttitleservices.com/loginv">Vendor Login</a></li>
						<li><a href="http://www.firsttitleservices.com/logint">Third Party Login</a></li>
						<li><a href="http://www.firsttitleservices.com/logina">Admin Login</a></li>
						<li><a href="http://www.firsttitleservices.com/sign-up">New Customer Signup</a></li>
						<li class="last"><a href="http://machine1.firsttitleservices.com/client/vendor_new2.cfm">New Vendor Signup</a></li>
					</ul>
				</div>
				<img src="http://www.firsttitleservices.com/wp-content/themes/ft_responsive/images/right_list_btm.gif" border="0" alt="">
			</div>
		</div>
		<div class="clear"></div>
	</div>
		</div><br><br><br><br><br><br><br><br><br>
</div>
			<!---- body text ends ----->
		<cfinclude template="vendorFooter.cfm">

