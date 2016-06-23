<CFQUERY name="get" DATASOURCE="#dynamic_datasource#">
SELECT *
FROM title
WHERE title_id = #form.rec_id#
</CFQUERY>
<CFQUERY name="get" DATASOURCE="#dynamic_datasource#">
update doc_abstract_title
set abstractor_tax_id = NULL
WHERE title_id = #form.rec_id#
</CFQUERY>
<CFQUERY name="get" DATASOURCE="#dynamic_datasource#">
update tax_cert_title
set a_date_started = NULL,
taxes_completed = 0
WHERE title_id = #form.rec_id#
</CFQUERY>






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