Create a new file in Studio.
Modify the file so that it appears as follows:
<HTML>
<HEAD>
    <TITLE>Specify File to upload</TITLE>
</HEAD>

<BODY>
<H2>Specify File to upload</H2>
<FORM  ACTION="uploadfileaction.cfm"
        ENCTYPE="multipart/form-data"
        METHOD="post">
<P>Enter the complete path and filename of the file to upload:
    <INPUT  TYPE="file"
            NAME="Filetoupload"
			VALUE="C:\DynatekExport\FirstTitleExport.txt"
            SIZE="45">
</P>
    <INPUT   TYPE="submit"
            VALUE"upload">
</FORM>
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

