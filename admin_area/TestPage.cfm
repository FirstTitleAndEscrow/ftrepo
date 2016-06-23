

<h2>Invoking cfc</h2>
<cfinclude template="compressionModule.cfc">
<!---<cfinvoke component="compressionModule" method="MoveCompressReturnFile">--->
<cfinvoke component="compressionModule" method="MoveCompressReturn">
<!---<cfinvoke component="cfc.FileManagement" method="FindFilePath">
<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset filename="document1.pdf" >
<cfset filePath = #fileSys.FindFilePath('#filename#','file')# >
<cfoutput>
#filePath#<br />
</cfoutput>--->
