<HTML XMLNS:IE>
<HEAD>
<?IMPORT NAMESPACE="IE" IMPLEMENTATION="#default">
<STYLE TYPE="text/css">
.contentstyle
{
  width:5.5in;
  height:8in;
  margin:1in;
  background:white;
  border:1 dashed gray;
}
.masterstyle
{
  background:#FFFF99;
  border-left:1 solid black;
  border-top:1 solid black;
  border-right:4 solid black;
  border-bottom:4 solid black;
  width:8.5in;
  height:11in;
  margin:10px;
  overflow:hidden;
}
.headerstyle
{
  position:absolute;
  top:.25in;
  width:5.5in;
  left:1in;
}
.footerstyle
{
  position:absolute;
  top:10.5in;
  width:5.5in;
  left:1in;
}
</STYLE>
<SCRIPT LANGUAGE="JavaScript">
<!--

var lastPage = 1;
var headersFootersAdded = false;

function addFirstPage() {
  newHTML  = "<IE:DEVICERECT ID='devicerect1' MEDIA='print' CLASS='masterstyle'>";
  newHTML += "<IE:LAYOUTRECT ID='layoutrect1' CONTENTSRC='document' ONLAYOUTCOMPLETE='onPageComplete()' NEXTRECT='layoutrect2' CLASS='contentstyle'/>";
  newHTML += "</IE:DEVICERECT>";

  devicecontainer.insertAdjacentHTML("afterBegin", newHTML);
}

function onPageComplete() {
  if (event.contentOverflow == true) {
    addNewPage();
  }
  else if (headersFootersAdded == false) {
    myheaderfooter.textHead = '';
    myheaderfooter.textFoot = '';
    myheaderfooter.url = '';
    myheaderfooter.title = '';
    myheaderfooter.pageTotal = '';

    for (i = 1; i <= myheaderfooter.pageTotal; i++) {
      myheaderfooter.page = i;
      addHeaderAndFooterToPage(i);
    }

    headersFootersAdded = true;
  }
}

function addNewPage() {
  document.all("layoutrect" + lastPage).onlayoutcomplete = null;

  newHTML  = "<IE:DEVICERECT ID='devicerect" + (lastPage + 1) +  "' MEDIA='print' CLASS='masterstyle'>";
  newHTML += "<IE:LAYOUTRECT ID='layoutrect" + (lastPage + 1) + "' ONLAYOUTCOMPLETE='onPageComplete()' NEXTRECT='layoutrect" + (lastPage + 2) + "'  CLASS='contentstyle'/>";
  newHTML += "</IE:DEVICERECT>";

  devicecontainer.insertAdjacentHTML("beforeEnd", newHTML);
  lastPage++;
}

function addHeaderAndFooterToPage(pageNum) {
  newHeader = "";
  newFooter = "";

  document.all("DEVICERECT" + pageNum).insertAdjacentHTML("afterBegin", newHeader);
  document.all("DEVICERECT" + pageNum).insertAdjacentHTML("beforeEnd", newFooter);
}
// -->
</SCRIPT>
<HEAD>

<BODY ONLOAD="addFirstPage()">

<IE:TEMPLATEPRINTER ID="printer"/>
<IE:HEADERFOOTER ID="myheaderfooter"/>

<DIV ID="devicecontainer">
98uoiuoiuoiukljlkj
</DIV>

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
