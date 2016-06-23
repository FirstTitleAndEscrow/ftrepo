<HTML XMLNS:IE>
<HEAD>
<?IMPORT NAMESPACE="IE" IMPLEMENTATION="#default">
STYLE TYPE="text/css">
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

function addFirstPage() {
  newHTML  = "<IE:DEVICERECT ID='devicerect1' MEDIA='print' CLASS='masterstyle'>";
  newHTML += "<IE:LAYOUTRECT ID='layoutrect1' CONTENTSRC='document' ONLAYOUTCOMPLETE='onPageComplete()' NEXTRECT='layoutrect2' CLASS='contentstyle'/>";
  newHTML += "</IE:DEVICERECT>";

  devicecontainer.insertAdjacentHTML("afterBegin", newHTML);

  myheaderfooter.textHead = printer.header;
  myheaderfooter.textFoot = printer.footer;
  myheaderfooter.url = dialogArguments.__IE_BrowseDocument.URL;
  myheaderfooter.title = dialogArguments.__IE_BrowseDocument.title;
  myheaderfooter.page = 1;
  addHeaderAndFooterToPage(1);
}

function onPageComplete() {
  if (event.contentOverflow == true) {
    addNewPage();
  }
  else {
    myheaderfooter.pageTotal = document.all.tags("DEVICERECT").length;
    for (i = 1; i <= myheaderfooter.pageTotal; i++) {
      addPageTotalToPages(i);
    }
  }
}

function addNewPage() {
  document.all("layoutrect" + lastPage).onlayoutcomplete = null;
  myheaderfooter.page = lastPage + 1;
    
  newHTML  = "<IE:DEVICERECT ID='devicerect" + (lastPage + 1) +  "' MEDIA='print' CLASS='masterstyle'>";
  newHTML += "<IE:LAYOUTRECT ID='layoutrect" + (lastPage + 1) + "' ONLAYOUTCOMPLETE='onPageComplete()' NEXTRECT='layoutrect" + (lastPage + 2) + "'  CLASS='contentstyle'/>";
  newHTML += "</IE:DEVICERECT>";

  devicecontainer.insertAdjacentHTML("beforeEnd", newHTML);
  addHeaderAndFooterToPage(lastPage + 1);
  lastPage++;
}

function addHeaderAndFooterToPage(pageNum) {
  newHeader = "<DIV CLASS='headerstyle'>" + myheaderfooter.htmlHead + "</DIV>";
  newFooter = "<DIV CLASS='footerstyle'>" + myheaderfooter.htmlFoot + "</DIV>";
    
  document.all("devicerect" + pageNum).insertAdjacentHTML("afterBegin", newHeader); 
  document.all("devicerect" + pageNum).insertAdjacentHTML("beforeEnd", newFooter);
}

function addPageTotalToPages() {
  oSpanCollection = document.all.tags("span");
  for (i = 0; i < oSpanCollection.length; i++) {
    if (oSpanCollection[i].className == "hfPageTotal") {
      oSpanCollection[i].innerText = myheaderfooter.pageTotal;
	}
  }
}
// -->
</SCRIPT>
</HEAD>

<BODY ONLOAD="addFirstPage()">

<IE:TEMPLATEPRINTER ID="printer"/>
<IE:HEADERFOOTER ID="myheaderfooter"/>

<DIV ID="devicecontainer">
<!-- Dynamically created pages go here. -->
</DIV>

</BODY>
</HTML>

 