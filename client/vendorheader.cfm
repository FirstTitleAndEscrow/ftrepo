
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7 " lang="en"> <![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8 ie7" lang="en"> <![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9 ie8" lang="en"> <![endif]-->
<!--[if gt IE 8]> <html class="no-js ie9" lang="en"> <![endif]-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="google-site-verification" content="AFNx2CVtxG8BHg7JfWquIZt_Qisr6PrJBiOaNArqb6w" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>  </title>
<link rel="shortcut icon" href="favicon.ico"/>
<link href='https://fonts.googleapis.com/css?family=Roboto:400,500,700,700italic' rel='stylesheet' type='text/css'>
<link href="https://www.firsttitleservices.com/wp-content/themes/ft_responsive/includes/style.css" rel="stylesheet" type="text/css" />
<link href="https://www.firsttitleservices.com/wp-content/themes/ft_responsive/includes/responsive.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://www.firsttitleservices.com/wp-content/themes/ft_responsive/style.css" type="text/css" media="screen" />
<link rel="stylesheet" href="https://www.firsttitleservices.com/wp-content/themes/ft_responsive/includes/menu_style.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="https://www.firsttitleservices.com/wp-content/themes/ft_responsive/includes/dcjq-mega-menu.css" media="screen" />

<!--menu js -->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript" src="https://www.firsttitleservices.com/wp-content/themes/ft_responsive/includes/jqueryslidemenu.js"></script>
<!--slider starts-->
<script type="text/javascript" src="https://www.firsttitleservices.com/wp-content/themes/ft_responsive/includes/responsiveslides.js"></script>
<script type="text/javascript" src="https://www.firsttitleservices.com/wp-content/themes/ft_responsive/includes/jquery.ui.min.js"></script>
<script src="https://www.firsttitleservices.com/wp-content/themes/ft_responsive/includes/responsiveslides.min.js"></script>
<!--slider end-->
<script>
	$( document ).ready(function() {
		$("#submit").click(function(){
			
			var datastring = "firstname="+$('#rounded').find('input[name="qcfname1"]').val()+"&lastname="+$('#rounded').find('input[name="qcfname8"]').val()+"&email="+$('#rounded').find('input[name="qcfname2"]').val()+"&phone="+$('#rounded').find('input[name="qcfname3"]').val()+"&discuss="+$('#rounded').find('textarea[name="qcfname4"]').val();

				$.ajax(
		           {
					type:"POST",
		               url:"http://wp.firsttitleservices.com/cfc/FormManager.cfc?method=QuickContact&returnformat=plain",
		               data:datastring,
		               success: function(response)
		               {
						var resp = jQuery.trim(response);
						
						//$("#County").html(resp);
		                }





		           });
				
		});
	});
	
</script>

<script type='text/javascript' src='https://www.firsttitleservices.com/wp-content/plugins/responsive-menu-data/js/responsive-menu-1.js?ver=1.0'></script>
<script type='text/javascript' src='https://www.firsttitleservices.com/wp-content/plugins/responsive-menu/public/js/touch.js?ver=4.1.4'></script>
<link rel='stylesheet' id='responsive-menu-css'  href='http://wp.firsttitleservices.com/wp-content/plugins/responsive-menu-data/css/responsive-menu-1.css?ver=1.0' type='text/css' media='all' />



<!-- This site is optimized with the Yoast WordPress SEO plugin v1.4.19 - http://yoast.com/wordpress/seo/ -->
<link rel="canonical" href="https://www.firsttitleservices.com/login/" />
<link rel="author" href="https://plus.google.com/u/0/115143092784969448684/"/>
<meta name="twitter:card" content="summary"/>
<meta name="twitter:site" content="@firsttitle"/>
<meta name="twitter:domain" content="First Title"/>
<meta name="twitter:creator" content="@firsttitle"/>
<meta name="twitter:title" content="Login - First Title"/>
<meta name="twitter:url" content="http://wp.firsttitleservices.com/login/"/>
<!-- / Yoast WordPress SEO plugin. -->

<link rel="alternate" type="application/rss+xml" title="First Title &raquo; Login Comments Feed" href="http://wp.firsttitleservices.com/login/feed/" />
		<script type="text/javascript">
			window._wpemojiSettings = {"baseUrl":"http:\/\/s.w.org\/images\/core\/emoji\/72x72\/","ext":".png","source":{"concatemoji":"http:\/\/wp.firsttitleservices.com\/wp-includes\/js\/wp-emoji-release.min.js?ver=4.2.2"}};
			!function(a,b,c){function d(a){var c=b.createElement("canvas"),d=c.getContext&&c.getContext("2d");return d&&d.fillText?(d.textBaseline="top",d.font="600 32px Arial","flag"===a?(d.fillText(String.fromCharCode(55356,56812,55356,56807),0,0),c.toDataURL().length>3e3):(d.fillText(String.fromCharCode(55357,56835),0,0),0!==d.getImageData(16,16,1,1).data[0])):!1}function e(a){var c=b.createElement("script");c.src=a,c.type="text/javascript",b.getElementsByTagName("head")[0].appendChild(c)}var f,g;c.supports={simple:d("simple"),flag:d("flag")},c.DOMReady=!1,c.readyCallback=function(){c.DOMReady=!0},c.supports.simple&&c.supports.flag||(g=function(){c.readyCallback()},b.addEventListener?(b.addEventListener("DOMContentLoaded",g,!1),a.addEventListener("load",g,!1)):(a.attachEvent("onload",g),b.attachEvent("onreadystatechange",function(){"complete"===b.readyState&&c.readyCallback()})),f=c.source||{},f.concatemoji?e(f.concatemoji):f.wpemoji&&f.twemoji&&(e(f.twemoji),e(f.wpemoji)))}(window,document,window._wpemojiSettings);
		</script>
		<style type="text/css">
img.wp-smiley,
img.emoji {
	display: inline !important;
	border: none !important;
	box-shadow: none !important;
	height: 1em !important;
	width: 1em !important;
	margin: 0 .07em !important;
	vertical-align: -0.1em !important;
	background: none !important;
	padding: 0 !important;
}
</style>
<link rel='stylesheet' id='qcf_style-css'  href='http://wp.firsttitleservices.com/wp-content/plugins/quick-contact-form/quick-contact-form-style.css?ver=4.2.2' type='text/css' media='all' />
<link rel='stylesheet' id='qcf_custom-css'  href='http://wp.firsttitleservices.com/wp-content/plugins/quick-contact-form/quick-contact-form-custom.css?ver=4.2.2' type='text/css' media='all' />
<link rel='stylesheet' id='jquery-style-css'  href='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.2/themes/smoothness/jquery-ui.css?ver=4.2.2' type='text/css' media='all' />
<link rel='stylesheet' id='acx-si-style-css'  href='http://wp.firsttitleservices.com/wp-content/plugins/floating-social-media-icon/style.css?ver=4.2.2' type='text/css' media='all' />
<!-- This site uses the Yoast Google Analytics plugin v5.2.8 - Universal disabled - https://yoast.com/wordpress/plugins/google-analytics/ -->
<script type="text/javascript">

	var _gaq = _gaq || [];
	_gaq.push(['_setAccount', 'UA-54202524-1']);
	_gaq.push(['_gat._forceSSL']);
	_gaq.push(['_trackPageview']);

	(function () {
		var ga = document.createElement('script');
		ga.type = 'text/javascript';
		ga.async = true;
		ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
		var s = document.getElementsByTagName('script')[0];
		s.parentNode.insertBefore(ga, s);
	})();

</script>
<!-- / Yoast Google Analytics -->
<script type='text/javascript' src='http://wp.firsttitleservices.com/wp-content/plugins/quick-contact-form/quick-contact-form-javascript.js?ver=4.2.2'></script>
<script type='text/javascript' src='http://wp.firsttitleservices.com/wp-includes/js/jquery/jquery.js?ver=1.11.2'></script>
<script type='text/javascript' src='http://wp.firsttitleservices.com/wp-includes/js/jquery/jquery-migrate.min.js?ver=1.2.1'></script>
<script type='text/javascript' src='http://wp.firsttitleservices.com/wp-content/plugins/responsive-menu/public/js/touch.js?ver=4.2.2'></script>
<link rel="EditURI" type="application/rsd+xml" title="RSD" href="http://wp.firsttitleservices.com/xmlrpc.php?rsd" />
<link rel="wlwmanifest" type="application/wlwmanifest+xml" href="http://wp.firsttitleservices.com/wp-includes/wlwmanifest.xml" /> 
<meta name="generator" content="WordPress 4.2.2" />
<link rel='shortlink' href='http://wp.firsttitleservices.com/?p=462' />



<!-- Starting Styles For Social Media Icon From Acurax International www.acurax.com -->
<style type='text/css'>
#divBottomRight img 
{
width: 32px; 
}
#divBottomRight 
{
min-width:0px; 
position: static; 
}
</style>
<!-- Ending Styles For Social Media Icon From Acurax International www.acurax.com -->



<style>#responsive-menu .appendLink, #responsive-menu .responsive-menu li a, #responsive-menu #responsive-menu-title a,#responsive-menu .responsive-menu, #responsive-menu div, #responsive-menu .responsive-menu li, #responsive-menu{box-sizing: content-box !important;-moz-box-sizing: content-box !important;-webkit-box-sizing: content-box !important;-o-box-sizing: content-box !important}.RMPushOpen{width: 100% !important;overflow-x: hidden !important;height: 100% !important}.RMPushSlide{position: relative;left: 75%}#responsive-menu{position: fixed;overflow-y: auto;bottom: 0px;width: 75%;left: -75%;top: 0px;background: #43494C;z-index: 9999;box-shadow: 0px 1px 8px #333333;font-size: 13px !important;max-width: 999px;display: none}#responsive-menu.admin-bar-showing{padding-top: 32px}#click-menu.admin-bar-showing{margin-top: 32px}#responsive-menu #rm-additional-content{padding: 10px 5% !important;width: 90% !important;color: #FFFFFF}#responsive-menu .appendLink{right: 0px !important;position: absolute !important;border: 1px solid #3C3C3C !important;padding: 12px 10px !important;color: #FFFFFF !important;background: #43494C !important;height: 20px !important;line-height: 20px !important;border-right: 0px !important}#responsive-menu .appendLink:hover{cursor: pointer;background: #3C3C3C !important;color: #FFFFFF !important}#responsive-menu .responsive-menu, #responsive-menu div, #responsive-menu .responsive-menu li,#responsive-menu{text-align: left !important}#responsive-menu .RMImage{vertical-align: middle;margin-right: 10px;display: inline-block}#responsive-menu.RMOpened{}#responsive-menu,#responsive-menu input{}#responsive-menu #responsive-menu-title{width: 95% !important;font-size: 14px !important;padding: 20px 0px 20px 5% !important;margin-left: 0px !important;background: #43494C !important;white-space: nowrap !important}#responsive-menu #responsive-menu-title,#responsive-menu #responsive-menu-title a{color: #FFFFFF !important;text-decoration: none !important;overflow: hidden !important}#responsive-menu #responsive-menu-title a:hover{color: #FFFFFF !important;text-decoration: none !important}#responsive-menu .appendLink,#responsive-menu .responsive-menu li a,#responsive-menu #responsive-menu-title a{transition: 1s all;-webkit-transition: 1s all;-moz-transition: 1s all;-o-transition: 1s all}#responsive-menu .responsive-menu{width: 100% !important;list-style-type: none !important;margin: 0px !important}#responsive-menu .responsive-menu li.current-menu-item > a,#responsive-menu .responsive-menu li.current-menu-item > .appendLink,#responsive-menu .responsive-menu li.current_page_item > a,#responsive-menu .responsive-menu li.current_page_item > .appendLink{background: #43494C !important;color: #FFFFFF !important}#responsive-menu .responsive-menu li.current-menu-item > a:hover,#responsive-menu .responsive-menu li.current-menu-item > .appendLink:hover,#responsive-menu .responsive-menu li.current_page_item > a:hover,#responsive-menu .responsive-menu li.current_page_item > .appendLink:hover{background: #43494C !important;color: #FFFFFF !important}#responsive-menu.responsive-menu ul{margin-left: 0px !important}#responsive-menu .responsive-menu li{list-style-type: none !important;position: relative !important}#responsive-menu .responsive-menu ul li:last-child{padding-bottom: 0px !important}#responsive-menu .responsive-menu li a{padding: 12px 0px 12px 5% !important;width: 95% !important;display: block !important;height: 20px !important;line-height: 20px !important;overflow: hidden !important;white-space: nowrap !important;color: #FFFFFF !important;border-top: 1px solid #3C3C3C !important;text-decoration: none !important}#click-menu{text-align: center;cursor: pointer;font-size: 13px !important;display: none;position: fixed;right: 5%;top: 10px;color: #FFFFFF;background: #000000;padding: 5px;z-index: 9999}#responsive-menu #responsiveSearch{display: block !important;width: 95% !important;padding-left: 5% !important;border-top: 1px solid #3C3C3C !important;clear: both !important;padding-top: 10px !important;padding-bottom: 10px !important;height: 40px !important;line-height: 40px !important}#responsive-menu #responsiveSearchSubmit{display: none !important}#responsive-menu #responsiveSearchInput{width: 91% !important;padding: 5px 0px 5px 3% !important;-webkit-appearance: none !important;border-radius: 2px !important;border: 1px solid #3C3C3C !important}#responsive-menu .responsive-menu,#responsive-menu div,#responsive-menu .responsive-menu li{width: 100% !important;margin-left: 0px !important;padding-left: 0px !important}#responsive-menu .responsive-menu li li a{padding-left: 10% !important;width: 90% !important;overflow: hidden !important}#responsive-menu .responsive-menu li li li a{padding-left: 15% !important;width: 85% !important;overflow: hidden !important}#responsive-menu .responsive-menu li li li li a{padding-left: 20% !important;width: 80% !important;overflow: hidden !important}#responsive-menu .responsive-menu li li li li li a{padding-left: 25% !important;width: 75% !important;overflow: hidden !important}#responsive-menu .responsive-menu li a:hover{background: #3C3C3C !important;color: #FFFFFF !important;list-style-type: none !important;text-decoration: none !important}#click-menu #RMX{display: none;font-size: 24px;line-height: 27px !important;height: 27px !important;color: #FFFFFF !important}#click-menu .threeLines{width: 33px !important;height: 27px !important;margin: auto !important}#click-menu .threeLines .line{height: 5px !important;margin-bottom: 6px !important;background: #FFFFFF !important;width: 100% !important}#click-menu .threeLines .line.last{margin-bottom: 0px !important}@media only screen and ( min-width : 0px ) and ( max-width : 800px ){#click-menu{display: block}#responsive-menu .responsive-menu li li .appendLink,#responsive-menu .responsive-menu li li li{display: none !important}}</style>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','_gaTracker');

  _gaTracker('create', 'UA-54202524-1', 'auto');
  _gaTracker('send', 'pageview');

</script>

</head>
<body>
<!--header starts-->
<div class="header_bg">
	<div class="wrapper">
		<div class="logo"><a href="/"><img src="http://www.firsttitleservices.com/images/logo.jpg" width="460" height="110" title="First Title" alt="First Title"  border="0"/></a></div>
		<div class="header_right">
			<div class="header_right_top"> <img src="http://www.firsttitleservices.com/images/header_img.jpg" width="113" height="80" alt="" border="0" /><span>CALL US AT 866-484-8537 / <a href="http://www.firsttitleservices.com/login">SIGN IN</a> / <a href="http://www.firsttitleservices.com/sign-up">REGISTER</a></span> </div>
			<div class="clear"></div>
			<!--menu starts-->
			<div id="Main_menu">
				<div class="menu" style="width:900px">
					<ul>
						<li><a href="http://www.firsttitleservices.com/" class="active">Home</a></li>
						<li><a href="http://www.firsttitleservices.com/about">ABOUT</a>
							<ul>
								
								<li><a href="http://www.firsttitleservices.com/about/capabilities">First Title Capabilities</a></li>
								<li><a href="http://www.firsttitleservices.com/about/message-from-the-president">Message from the President</a></li>
								<li><a href="http://www.firsttitleservices.com/about/our-people">Title Professionals</a></li>
								<li><a href="http://www.firsttitleservices.com/about/company-history">First Title History</a></li>
							
							</ul>
						</li>
						<li><a href="http://www.firsttitleservices.com//services">SERVICES</a>
							<ul>
								<li><a href="http://www.firsttitleservices.com/services/overview/">Title Services and Products</a></li>
								<li><a href="http://www.firsttitleservices.com/services/commercial/">National Commercial Title Division</a></li>
								<li><a href="http://www.firsttitleservices.com/services/refinance/">The Refinance Transaction</a></li>
								<li><a href="http://www.firsttitleservices.com/services/purchase/">The Purchase Transaction</a></li>
								<li><a href="http://www.firsttitleservices.com/services/reverse/">The Reverse Mortgage Transaction</a></li>
								<li><a href="http://www.firsttitleservices.com/services/reodefault/">The REO/Default Transaction</a></li>
								<li><a href="http://www.firsttitleservices.com/services/appraisal-management/">Appraisal Management Services</a></li>
								<li><a href="http://www.firsttitleservices.com/services/property-reports/">Property Reports</a></li>
								<li><a href="http://www.firsttitleservices.com/services/flood-and-credit-services/">Flood and Credit Services</a></li>
								<li><a href="http://www.firsttitleservices.com/services/agency-services/">Agency Services</a></li>
												
							</ul>
						</li>
						<li><a href="/our-advantage/why-first-title">OUR ADVANTAGE</a> 
							<ul>
								<li><a href="http://www.firsttitleservices.com/our-advantage/traditional-title-v-first-title/">Traditional Title v. First Title</a></li>
								<li><a href="http://www.firsttitleservices.com/our-advantage/why-first-title/">Why First Title?</a></li>
								<li><a href="http://www.firsttitleservices.com/resources/compliance/">First Title Compliance Solutions</a></li>
								<li><a href="http://www.firsttitleservices.com/resources/our-technology/">First Title Technology</a></li>
								<li><a href="http://www.firsttitleservices.com/our-advantage/our-process/">The First Title Way</a></li>
								<li><a href="http://www.firsttitleservices.com/our-advantage/consulting/">Title Consulting Solutions</a></li>
							</ul>
						</li>
						<li><a href="/resources">RESOURCES</a> 
							<ul>
							<li><a href="http://www.firsttitleservices.com/resources/blog/">Blog</a></li>
							<li><a href="http://www.firsttitleservices.com/resources/titleknowledge/">Title Knowledge</a>
							<ul>
								<li><a href="http://www.firsttitleservices.com/resources/titleknowledge/titleinsurance/">Title Insurance</a></li>
							</ul>
						</li>
							<li><a href="http://www.firsttitleservices.com/resources/news-and-events/">News and Events</a></li>
							<li><a href="http://www.firsttitleservices.com/resources/brochure-download/">Brochure Downloads</a></li>
							<li><a href="http://www.firsttitleservices.com/privacy-policy/">Privacy Policy</a></li>
						</ul>
							
						</li>
						<li><a href="/contact">CONTACT</a></li>
					</ul>
				</div>
			</div>
			<!--header end-->
		</div>
		<div class="clear"></div>
	</div>
</div>