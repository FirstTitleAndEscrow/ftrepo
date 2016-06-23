<%@ language=javascript %>
<% 
Response.Expires = -1000;
var result = Server.CreateObject("MSXML2.DOMDocument")
var OutputString="";
var customHeader = Request.ServerVariables("HTTP_lastCached");
OutputString+="<Name>" +Request.Form('Name') +"</Name>"
OutputString+="<TelNo>" +Request.Form('TelNo') +"</TelNo>"
// Get milliseconds between now and when "LastCached" header was created
var timeDiff = new Date(customHeader);
timeDiff = new Date()-timeDiff;
var resTime="<TimeDiff>" +timeDiff + "</TimeDiff>";
OutputString+=resTime;
if(customHeader != "")
	{
	result.loadXML("<result>" + OutputString +" </result>");
	var pi = result.createProcessingInstruction("xml", "version='1.0'");
	result.insertBefore( pi, result.firstChild);
	result.save(Response);   
	result.erase;
	}
else
	{
	Response.Write("<P><B>" + OutputString+" </B></P>");
	}
%>