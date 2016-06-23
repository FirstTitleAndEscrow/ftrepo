<CFQUERY datasource="#request.dsn#" NAME="read_isales">
	SELECT ID, fname + ' ' + lname AS Name
	FROM   First_Admin
	WHERE  (role_id IN(15,25,26)) 
	ORDER BY fname + ' ' + lname
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_osales">
	SELECT ID, fname + ' ' + lname AS Name
	FROM   First_Admin
	WHERE  (role_id = 24)
	ORDER BY fname + ' ' + lname
</CFQUERY>

<CFSET Sales = "InHouse">

<CFIF #sales# eq "InHouse">
     <CFSET rowcount1 = #read_isales.RecordCount#>										     
     <CFSET myarray1=ArrayNew(2)>
			

     <CFLOOP QUERY="read_isales">
          <CFSET myarray1[CurrentRow][1]=read_isales.id[CurrentRow]>
	        <CFSET myarray1[CurrentRow][2]=read_isales.NAME[CurrentRow]>
     </CFLoop>
			
<CFELSE>
    <CFSET rowcount1 = #read_osales.RecordCount#>										    
    <CFSET myarray1=ArrayNew(2)>
1
     <CFLOOP QUERY="read_osales">
          <CFSET myarray1[CurrentRow][1]=read_osales.id[CurrentRow]>
	  <CFSET myarray1[CurrentRow][2]=read_osales.NAME[CurrentRow]>
     </CFLoop>
</CFIF>
	
<HTML>
<head>
</head>
<BODY>


	
<CFLOOP INDEX="Counter" FROM=1 TO="#rowcount1#">	

"#MyArray1[Counter][1]#" #MyArray1[Counter][2]#

</CFLOOP>
</BODY>															
</html>	