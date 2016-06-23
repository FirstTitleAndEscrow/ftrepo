<HTML>
<HEAD>
    <TITLE>upload File</TITLE>
</HEAD>

<body>
<H2>upload File</H2>

<CFFILE ACTION="upload"
        DESTINATION="C:\Inetpub\wwwroot\Clients\firsttitleservices.com\www\uploaded_files\Dynatek\"
        NAMECONFLICT="Overwrite"
        FILEFIELD="C:\DynatekExport\FirstTitleExport.txt\">


<CFOUTPUT>
You uploaded the file #File.ClientFileName#.#File.ClientFileExt#
successfully to
#File.ServerDirectory#\#File.ServerFileName#.#File.ServerFileExt#.
</CFOUTPUT>

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