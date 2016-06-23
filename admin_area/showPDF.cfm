<cfheader name="Content-disposition" value="inline;filename=#url.file#">

<CFCONTENT TYPE="application/pdf" FILE="c:\huds\#url.file#" DELETEFILE="No">
