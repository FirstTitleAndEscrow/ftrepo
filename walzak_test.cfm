<cffile action="READ" file="C:\inetpub\wwwroot\clients\firsttitleservices.com\www\walzak_test.xml" variable="M1">

<!--- this part posts the document, via https, to our server, just as Calyx should --->
<cfhttp url="http://www.firsttitleservices.com/walzcak/FTCustomerGateway.cfm" method="post" resolveurl="no">
<cfhttpparam type="body" name="test" value="#M1#" encoded="no">
</cfhttp>

<!--- this part displays whatever is returned by the post --->

<cfoutput>#cfhttp.filecontent#</cfoutput>