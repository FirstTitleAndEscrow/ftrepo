<!-- Template8.htm: Adjustable Margin UI
This last sample template demonstrates a user interface control that gives the
user visual control over the margin settings. It adds four marker images and a
fifth invisible marker for calibrating the pixel-to-inch ratio. It also adds
three mouse event handlers, and adds a button to the toolbar to hide and display
the margin markers. -->

<HTML XMLNS:IE>
<HEAD>
<?IMPORT NAMESPACE="ie" IMPLEMENTATION="#default">
<STYLE TYPE="text/css">
.lorstyle
{
    background:white;
    margin-top:1in;
    margin-left:1in;
    width:6in;
    height:8in;
    border:dashed 1 black;
}
.pagestyle
{
    background:white;
    border-left:1 solid black;
    border-top:1 solid black;
    border-right:4 solid black;
    border-bottom:4 solid black;
    width:8.5in;
    height:11in;
    margin:10px;
    overflow:hidden;
    left:-100in;
}
.headerstyle
{
    position:absolute;
    top:.25in;
    width:6in;
    left:1in;
}
.footerstyle
{
    position:absolute;
    top:10.5in;
    width:6in;
    left:1in;
}
#ui
{
    height:40px;
    background-color:#006699;
    margin:0px;
    padding;0px;
}
#zoomcontainer
{
    zoom:100%;
    width:100%;
    position:absolute;
}
#pagecontainer
{
   width:100%;
   overflow:auto;
   border:'thin threedhighlight inset';
   background:threedshadow;
}
.mmarker
{
    position:absolute;
    top:100;
    left:100;
}
</STYLE>
<SCRIPT LANGUAGE="JScript">
var iNextPageToCreate = 1;
var oPageStyleClass;
var oLorStyleClass;
var oHeaderStyleClass;
var oFooterStyleClass;
var oMMarkerClass;
var sSrcID = null
var iStartingX;
var iStartingY;
var bMoveMMarkerLeft = false;
var bMoveMMarkerRight = false;
var bMoveMMarkerTop = false;
var bMoveMMarkerBottom = false;
var iDeltaX = 0;
var iDeltaY = 0;
var fZoomNum = 1;
var iPixelToInchRatio;
var oPopup;
var oPopupBody;
var pprinter = new Object();

function MouseDownHandler()
{
    if (event.button != 1) return;

    sZoomNum = zoomcontainer.style.zoom;
    sZoomNum = sZoomNum.substring(0, sZoomNum.length - 1);
    iZoomNum = sZoomNum.valueOf(sZoomNum, 10);
    fZoomNum = iZoomNum/100
    sSrcID = event.srcElement.id;
    iPixelToInchRatio = ratiomarker.offsetLeft;

    if (sSrcID == "mmarkerLeft")
    {
        bMoveMMarkerLeft = true;
        iStartingX = event.x;
        iDeltaX = (mmarkerLeft.offsetLeft - event.x);
        iDeltaY = 0;

        oPopup = window.createPopup();
        oPopupBody = oPopup.document.body;
        theText = Math.round((100 * (mmarkerLeft.offsetLeft - 5))/iPixelToInchRatio)/100;
        oPopupBody.innerHTML = theText + " in";
        oPopupBody.style.backgroundColor = "#ffff66";
        oPopupBody.style.border = "1 solid black";
        oPopupBody.style.fontSize = "12px";
        oPopupBody.style.fontFamily = "Courier New";
        oPopup.show(fZoomNum * (mmarkerLeft.offsetLeft + 5), fZoomNum * (mmarkerLeft.offsetTop - 20), 60, 16, zoomcontainer);

        return;
    }
    if (sSrcID == "mmarkerRight")
    {
        bMoveMMarkerRight = true;
        iStartingX = event.x;
        iDeltaX = (mmarkerRight.offsetLeft - event.x);
        iDeltaY = 0;

        oPopup = window.createPopup();
        oPopupBody = oPopup.document.body;
        theText = Math.round((100 * (mmarkerRight.offsetLeft - 5))/iPixelToInchRatio)/100;
        oPopupBody.innerHTML = theText + " in";
        oPopupBody.style.backgroundColor = "#ffff66";
        oPopupBody.style.border = "1 solid black";
        oPopupBody.style.fontSize = "12px";
        oPopupBody.style.fontFamily = "Courier New";
        oPopup.show(fZoomNum * (mmarkerRight.offsetLeft + 5) - 60, fZoomNum * (mmarkerRight.offsetTop - 20), 60, 16, zoomcontainer);

        return;
    }
    if (sSrcID == "mmarkerTop")
    {
        bMoveMMarkerTop = true;
        iStartingY = event.y;
        iDeltaX = 0;
        iDeltaY = (mmarkerTop.offsetTop - event.y);

        oPopup = window.createPopup();
        oPopupBody = oPopup.document.body;
        theText = Math.round((100 * (mmarkerLeft.offsetTop - 5))/iPixelToInchRatio)/100;
        oPopupBody.innerHTML = theText + " in";
        oPopupBody.style.backgroundColor = "#ffff66";
        oPopupBody.style.border = "1 solid black";
        oPopupBody.style.fontSize = "12px";
        oPopupBody.style.fontFamily = "Courier New";
        oPopup.show(fZoomNum * (mmarkerTop.offsetLeft + 5) - 70, fZoomNum * (mmarkerTop.offsetTop + 5), 60, 16, zoomcontainer);

        return;
    }
    if (sSrcID == "mmarkerBottom")
    {
        bMoveMMarkerBottom = true;
        iStartingY = event.y;
        iDeltaX = 0;
        iDeltaY = (mmarkerBottom.offsetTop - event.y);

        oPopup = window.createPopup();
        oPopupBody = oPopup.document.body;
        theText = Math.round((100 * (mmarkerBottom.offsetTop - 5))/iPixelToInchRatio)/100;
        oPopupBody.innerHTML = theText + " in";
        oPopupBody.style.backgroundColor = "#ffff66";
        oPopupBody.style.border = "1 solid black";
        oPopupBody.style.fontSize = "12px";
        oPopupBody.style.fontFamily = "Courier New";
        oPopup.show(fZoomNum * (mmarkerTop.offsetLeft + 5) - 70, fZoomNum * (mmarkerBottom.offsetTop) - 10, 60, 16, zoomcontainer);

        return;
    }

    sSrcID = null;
}

function MouseMoveHandler()
{
    iPixelToInchRatio = ratiomarker.offsetLeft;
    fZoomCompensationX = (event.x - iStartingX)*(1/fZoomNum - 1);
    fZoomCompensationY = (event.y - iStartingY)*(1/fZoomNum - 1);

    if (bMoveMMarkerLeft)
    {
        if (event.x + iDeltaX + fZoomCompensationX >= mmarkerRight.offsetLeft - 10) return false;
        if (event.x + iDeltaX + fZoomCompensationX <= iPixelToInchRatio * pprinter.unprintableLeft/100 + 5) return false;
        mmarkerLeft.style.left = event.x + iDeltaX + fZoomCompensationX;
        theText = Math.round((100 * (mmarkerLeft.offsetLeft - 5))/iPixelToInchRatio)/100;
        oPopupBody.innerHTML = theText + " in";
    }
    else if (bMoveMMarkerRight)
    {
        if (event.x + iDeltaX + fZoomCompensationX >=  iPixelToInchRatio * (printer.pageWidth - pprinter.unprintableRight)/100 + 5) return false;
        if (event.x + iDeltaX + fZoomCompensationX <= mmarkerLeft.offsetLeft + 10) return false;
        mmarkerRight.style.pixelLeft = event.x + iDeltaX + fZoomCompensationX;
        theText = Math.round((printer.pageWidth - (100 * (mmarkerRight.offsetLeft - 5))/iPixelToInchRatio))/100;
        oPopupBody.innerHTML = theText + " in";
    }
    else if (bMoveMMarkerTop)
    {
        if (event.y + iDeltaY + fZoomCompensationY >= mmarkerBottom.offsetTop - 10) return false;
        if (event.y + iDeltaY + fZoomCompensationY <= iPixelToInchRatio * pprinter.unprintableTop/100 + 5) return false;
        mmarkerTop.style.pixelTop = event.y + iDeltaY + fZoomCompensationY;
        theText = Math.round((100 * (mmarkerTop.offsetTop - 5))/iPixelToInchRatio)/100;
        oPopupBody.innerHTML = theText + " in";
    }
    else if (bMoveMMarkerBottom)
    {
        if (event.y + iDeltaY + fZoomCompensationY >=  iPixelToInchRatio * (printer.pageHeight - pprinter.unprintableBottom)/100 + 5) return false;
        if (event.y + iDeltaY + fZoomCompensationY <= mmarkerTop.offsetTop + 10) return false;
        mmarkerBottom.style.pixelTop = event.y + iDeltaY + fZoomCompensationY;
        theText = Math.round((printer.pageHeight - (100 * (mmarkerBottom.offsetTop - 5))/iPixelToInchRatio))/100;
        oPopupBody.innerHTML = theText + " in";
    }

    return false;
}

function MouseUpHandler()
{
    if (!sSrcID) return;

    iPixelToInchRatio = ratiomarker.offsetLeft;

    switch (sSrcID)
    {
        case "mmarkerLeft":
        printer.marginLeft = 100 * (mmarkerLeft.offsetLeft - 5)/iPixelToInchRatio;
        oPopup.hide();
        break;

        case "mmarkerRight":
        printer.marginRight = printer.pageWidth - (100 * (mmarkerRight.offsetLeft - 5)/iPixelToInchRatio);
        oPopup.hide();
        break;

        case "mmarkerTop":
        printer.marginTop = 100 * (mmarkerTop.offsetTop - 5)/iPixelToInchRatio;
        oPopup.hide();
        break;

        case "mmarkerBottom":
        printer.marginBottom = printer.pageHeight - (100 * (mmarkerBottom.offsetTop - 5)/iPixelToInchRatio);
        oPopup.hide();
        break;
    }

    InitClasses();
    InitMMarkers();
    iDeltaX = 0;
    iDeltaY = 0;
    bMoveMMarkerLeft = false;
    bMoveMMarkerRight = false;
    bMoveMMarkerTop = false;
    bMoveMMarkerBottom = false;

    sSrcID = null;
}

function FindStyleRule(styleName)
{
    for (i = 0; i < document.styleSheets.length; i++)
    {
        for (j = 0; j < document.styleSheets(i).rules.length; j++)
        {
            if (document.styleSheets(i).rules(j).selectorText == styleName)
                return document.styleSheets(i).rules(j);
        }
    }
}

function InitClasses()
{
    oPageStyleClass.style.width = printer.pageWidth/100 + "in";
    oPageStyleClass.style.height = printer.pageHeight/100 + "in";
    oLorStyleClass.style.marginTop = printer.marginTop/100 + "in";
    oLorStyleClass.style.marginLeft = printer.marginLeft/100 + "in";
    oLorStyleClass.style.width = (printer.pageWidth - (printer.marginLeft + printer.marginRight))/100 + "in";
    oLorStyleClass.style.height = (printer.pageHeight - (printer.marginTop + printer.marginBottom))/100 + "in";
    oHeaderStyleClass.style.left = printer.marginLeft/100 + "in";
    oHeaderStyleClass.style.top = printer.unprintableTop/100 + "in";
    oHeaderStyleClass.style.width = oLorStyleClass.style.width;
    oFooterStyleClass.style.left = printer.marginLeft/100 + "in";
    oFooterStyleClass.style.width = oLorStyleClass.style.width;
    oFooterStyleClass.style.top = null;
    oFooterStyleClass.style.bottom = printer.unprintableBottom/100 + "in";
}

function Init()
{
    document.attachEvent("onmousedown", MouseDownHandler);
    document.attachEvent("onmouseup", MouseUpHandler);
    document.attachEvent("onmousemove", MouseMoveHandler);
    mmarkerLeft.attachEvent("onmousemove", MouseMoveHandler);
    mmarkerRight.attachEvent("onmousemove", MouseMoveHandler);
    mmarkerTop.attachEvent("onmousemove", MouseMoveHandler);

    AddFirstPage();

    zoomcontainer.style.zoom = "83%";
    ui.style.width = document.body.clientWidth;
    ui.style.height = "40px";
    pagecontainer.style.height = document.body.clientHeight - ui.style.pixelHeight;

    oPageStyleClass = FindStyleRule(".pagestyle");
    oLorStyleClass = FindStyleRule(".lorstyle");
    oHeaderStyleClass = FindStyleRule(".headerstyle");
    oFooterStyleClass = FindStyleRule(".footerstyle");
    oMMarkerClass = FindStyleRule(".mmarker");

    InitClasses();
    InitMMarkers();
}

function InitMMarkers()
{
    mmarkerLeft.style.top = oLorStyleClass.style.marginTop;
    mmarkerRight.style.top = oLorStyleClass.style.marginTop;
    mmarkerLeft.style.left = oLorStyleClass.style.marginLeft;
    mmarkerRight.style.left = (printer.pageWidth - printer.marginRight)/100 + "in";
    mmarkerTop.style.top = oLorStyleClass.style.marginTop;
    mmarkerBottom.style.top = (printer.pageHeight - printer.marginBottom)/100 + "in";
    mmarkerTop.style.left = oLorStyleClass.style.marginLeft;
    mmarkerBottom.style.left = oLorStyleClass.style.marginLeft;

    mmarkerLeft.style.pixelTop -= 2;
    mmarkerLeft.style.pixelLeft += 6;
    mmarkerRight.style.pixelTop -= 2;
    mmarkerRight.style.pixelLeft += 5;
    mmarkerTop.style.pixelTop += 6;
    mmarkerTop.style.pixelLeft -= 2;
    mmarkerBottom.style.pixelTop += 5;
    mmarkerBottom.style.pixelLeft -= 2;
}

function CheckPrint()
{
    switch (dialogArguments.__IE_PrintType)
    {
        case "Prompt":
            if (printer.showPrintDialog())
                PrintPrep();
            break;
        case "NoPrompt":
            PrintPrep();
            break;
        case "Preview":
        default:
            break;
    }
}

function PrintPrep()
{
    if (oLorStyleClass.style.border = "dashed 1 black") reset = true;
    oLorStyleClass.style.border = "dashed 1 white";

    if (layoutrect1.contentDocument.readyState == "complete")
    {
        // This block will be called when printing with user prompt
        // because the Print dialog box gives time for the content
        // document to complete loading
        PrintNow();
    }
    else
    {
        // This block will usually be called when printing w/o user prompt
        // and sets an event handler that listens for the loading of the content
        // document before printing. Sometimes, however, the content document
        // will be loaded in time for the previous block to execute
        layoutrect1.contentDocument.onreadystatechange = PrintWhenContentDocComplete;
    }

    if (reset) oLorStyleClass.style.border = "dashed 1 black";
}

function PrintWhenContentDocComplete()
{
    if (layoutrect1.contentDocument.readyState == "complete")
    {
        layoutrect1.contentDocument.onreadystatechange = null;
        PrintNow();
    }
}

function PrintNow()
{
    var startPage;
    var endPage;
    var oDeviceRectCollection = document.all.tags("DEVICERECT");

    if (dialogArguments.__IE_PrintType == "NoPrompt" ||
        printer.selectedPages == false)
    {
        startPage = 1;
        endPage = oDeviceRectCollection.length;
    }
    else if (printer.currentPage == true)
    {
        // Determine current page, if necessary.
        // Normally, the print current page option is disabled because a print
        // template has no way of determining which section of a document is displayed
        // in the browser and cannot calculate a current page. In print preview,
        // a print template can enable the print current page option because the
        // template can determine which page is currently showing in the print
        // preview dialog. The print preview window would need a user interface
        // with a print button so that the user could print from the print preview
        // window. See template7.htm for an example showing how to add a user
        // interface to a print preview template.
    }
    else
    {
        startPage = printer.pageFrom;
        endPage = printer.pageTo;
        if (startPage > endPage)
        {
            alert("Error: Start page greater than end page");
            return;
        }
        if (startPage > oDeviceRectCollection.length)
        {
            alert("Error: Start page greater than number of pages in print job.");
            return;
        }
        if (endPage > oDeviceRectCollection.length)
        {
            alert("Warning: End page greater than number of pages in print job. Continuing Print Job.");
            endPage = oDeviceRectCollection.length;
        }
    }

    printer.startDoc("Printing from Tmplt6.htm");

    for (i = startPage - 1; i < endPage; i++)
        printer.printPage(oDeviceRectCollection[i]);

    printer.stopDoc();
}

function AddFirstPage()
{
    newHTML  = "<IE:DEVICERECT ID='page1' MEDIA='print' CLASS='pagestyle'>";
    newHTML += "<IE:LAYOUTRECT ID='layoutrect1' CONTENTSRC='document' ONLAYOUTCOMPLETE='OnRectComplete()' NEXTRECT='layoutrect2' CLASS='lorstyle'/>";
    newHTML += "</IE:DEVICERECT>";

    zoomcontainer.insertAdjacentHTML("afterBegin", newHTML);

    headfoot.textHead = printer.header;
    headfoot.textFoot = printer.footer;
    headfoot.url = dialogArguments.__IE_BrowseDocument.URL;
    headfoot.title = dialogArguments.__IE_BrowseDocument.title;
    headfoot.page = 1;
    AddHeaderAndFooterToPage(1);

    iNextPageToCreate = 2;
}

function OnRectComplete()
{
    if (event.contentOverflow == true)
        AddNewPage();
    else
    {
        headfoot.pageTotal = document.all.tags("DEVICERECT").length;

        for (i = 1; i <= headfoot.pageTotal; i++)
            AddPageTotalToPages(i);

        setTimeout("CheckPrint();", 100);
    }
}

function OnRectCompleteSimple()
{
    if (event.contentOverflow == true) return;
    headfoot.pageTotal = parseInt(event.srcElement.parentElement.id.substring(4), 10);

    AddPageTotalToPages();

    ShowFilledPagesAndHideExcessPages();
}

function ShowFilledPagesAndHideExcessPages()
{
    for (i = 1; i <= headfoot.pageTotal; i++)
        document.all("page" + i).style.position = "static";

    var i = headfoot.pageTotal + 1;

    while (document.all("page" + i))
    {
        document.all("page" + i).style.position = "absolute";
        i++;
    }
}

function AddHeaderAndFooterToPage(pageNum)
{
    newHeader = "<DIV CLASS='headerstyle'>" + headfoot.htmlHead + "</DIV>";
    newFooter = "<DIV CLASS='footerstyle'>" +headfoot.htmlFoot + "</DIV>";

    document.all("page" + pageNum).insertAdjacentHTML("afterBegin", newHeader);
    document.all("page" + pageNum).insertAdjacentHTML("beforeEnd", newFooter);
}

function AddNewPage()
{
    document.all("layoutrect" + (iNextPageToCreate - 1)).onlayoutcomplete = OnRectCompleteSimple;
    headfoot.page = iNextPageToCreate;

    newHTML  = "<IE:DEVICERECT ID='page" + iNextPageToCreate +  "' MEDIA='print' CLASS='pagestyle'>";
    newHTML += "<IE:LAYOUTRECT ID='layoutrect" + iNextPageToCreate + "' ONLAYOUTCOMPLETE='OnRectComplete()' NEXTRECT='layoutrect" + (iNextPageToCreate + 1) + "'  CLASS='lorstyle'/>";
    newHTML += "</IE:DEVICERECT>";

    zoomcontainer.insertAdjacentHTML("beforeEnd", newHTML);
    AddHeaderAndFooterToPage(iNextPageToCreate);
    headfoot.pageTotal = iNextPageToCreate;
    iNextPageToCreate++;
}

function AddPageTotalToPages()
{
    oSpanCollection = document.all.tags("span");
    for (i = 0; i < oSpanCollection.length; i++)
    {
        if (oSpanCollection[i].className == "hfPageTotal")
            oSpanCollection[i].innerText = headfoot.pageTotal;
    }
}

function ResizeApp()
{
    ui.style.width = document.body.clientWidth;
    pagecontainer.style.height = document.body.clientHeight - ui.style.pixelHeight;
}

function Zoomer(string)
{
    if (string == "in")
    {
        currZoom = zoomcontainer.style.zoom;
        currZoom = currZoom.substring(0, currZoom.length - 1);
        currZoom = parseInt(currZoom, 10);
        newZoom = currZoom + 1;

        if (newZoom > 10000) return;

        zoomcontainer.style.zoom = newZoom + "%";
        zoomnumber.value = newZoom;
    }
    else if (string == "out")
    {
        currZoom = zoomcontainer.style.zoom;
        currZoom = currZoom.substring(0, currZoom.length - 1);
        currZoom = parseInt(currZoom, 10);
        newZoom = currZoom - 1;

        if (newZoom < 1) return;

        zoomcontainer.style.zoom = newZoom + "%";
        zoomnumber.value = newZoom;
    }
    else
    {
        if (event.srcElement.id != "zoomnumber") return;
        if (event.keyCode != 13) return;

        var newZoom = zoomnumber.value;
        numValue = parseInt(newZoom, 10);

        if (numValue != newZoom) return;
        if (newZoom > 10000) return;
        if (newZoom < 1) return;

        zoomcontainer.style.zoom = newZoom + "%";
    }
}

function DoPageSetup()
{
    printer.showPageSetupDialog();
    InitClasses();
    InitMMarkers();
}

function DoPrintFromPreview()
{
    if (printer.showPrintDialog())
        PrintPrep();
}

function ShowHideMargins()
{
    if (marginbutton.value == "Show Margins")
    {
        oMMarkerClass.style.display = "block";
        oLorStyleClass.style.border = "dashed 1 black";
        marginbutton.value = "Hide Margins";
    }
    else
    {
        oMMarkerClass.style.display = "none";
        oLorStyleClass.style.border = "dashed 1 white";
        marginbutton.value = "Show Margins";
    }
}
</SCRIPT>
<HEAD>
<BODY ONLOAD="Init()" ONRESIZE="ResizeApp()" SCROLL="no">

    <IE:TEMPLATEPRINTER ID="printer"/>
    <IE:HEADERFOOTER ID="headfoot"/>

    <DIV ID="ui">
        <BR style="font-size:7">
        &nbsp;&nbsp;
        <INPUT TYPE="BUTTON" VALUE="Page Setup..." ONMOUSEUP="DoPageSetup()">
        &nbsp;&nbsp;&nbsp;&nbsp;
        <INPUT TYPE="BUTTON" VALUE="Zoom In" ONMOUSEUP="Zoomer('in')">
        &nbsp;
        <INPUT ID="zoomnumber" TYPE="TEXT" VALUE="50" SIZE="3" MAXLENGTH="4" ONKEYUP="Zoomer('amount')">&nbsp;<span style="color:white;">%</span>
        &nbsp;
        <INPUT TYPE="BUTTON" VALUE="Zoom Out" ONMOUSEUP="Zoomer('out')">
        &nbsp;&nbsp;&nbsp;&nbsp;
        <INPUT TYPE="BUTTON" VALUE="Print..." ONMOUSEUP="DoPrintFromPreview()">
        &nbsp;&nbsp;&nbsp;&nbsp;
        <INPUT ID="marginbutton" TYPE="BUTTON" VALUE="Hide Margins" ONMOUSEUP="ShowHideMargins()">
    </DIV>

    <DIV ID="pagecontainer">
        <DIV ID="zoomcontainer">
        <!-- Dynamically created pages go here. -->
        <IMG ID="mmarkerLeft" CLASS="mmarker" SRC="res://printtemplates.exe/MarginLR.gif" WIDTH="10" HEIGHT="10" BORDER="0">
        <IMG ID="mmarkerRight" CLASS="mmarker" SRC="res://printtemplates.exe/MarginLR.gif" WIDTH="10" HEIGHT="10" BORDER="0">
        <IMG ID="mmarkerTop" CLASS="mmarker" SRC="res://printtemplates.exe/MarginTB.gif" WIDTH="10" HEIGHT="10" BORDER="0">
        <IMG ID="mmarkerBottom" CLASS="mmarker" SRC="res://printtemplates.exe/MarginTB.gif" WIDTH="10" HEIGHT="10" BORDER="0">
        <IMG ID="ratiomarker" CLASS="mmarker" STYLE="visibility:hidden;left:1in;top:1in" SRC="res://printtemplates.exe/MarginTB.gif" WIDTH="10" HEIGHT="10" BORDER="0">
        </DIV>
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