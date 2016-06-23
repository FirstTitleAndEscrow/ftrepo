<table with=800 align=left>


<tr>
<cfif NOT DateDiff("d", Now(), "1/30/2012")>
<td align=Center>First Title & Escrow, Inc.<br>
30 W. Gude Drive, 4th Floor<br>
Rockville, MD 20850<br>
301-279-0303<br><br><br></td>
<cfelse>
<td align=Center>First Title & Escrow, Inc.<br>
7361 Calhoun Place, Suite 200<br>
Rockville, MD 20855<br>
301-279-0303<br><br><br></td>
</cfif>
</tr>

<tr>
<td align=left>FILE NO: $$file_number$$</td>
<td align=right>ORIG BY: $$abstractor$$ $$abstractor_file_number$$<br></td>
</tr>

<tr>
<td align=left>TYPE OF SEARCH REQUESTED: $$search_type$$<br><br></td>
</tr>


<tr>
<td align=left>EFFECTIVE DATE: $$search_type$$<br><br></td>
</tr>

<tr>
<td align=left>PRESENT OWNER: $$owners$$<br><br></td>
</tr>

<tr>
<td align=left>AND BEING: $$db_number$$<br><br></td>
</tr>



<tr>
<td align=left>PROPERTY DESCRIPTION: $$prop_description$$<br><br></td>
</tr>


<tr>
<td align=left>TRUSTS: $$trust_count$$<br><br></td>
</tr>

<tr>
<td align=left>First Trust Info goes here<br><br></td>
</tr>

<tr>
<td align=left>SECOND TRUST:  $$2nd_trust_db_number$$<br><br></td>
</tr>


<tr>
<td align=left>Second Trust Info goes here<br><br></td>
</tr>

<tr>
<td align=left>Property Address: $$prop_address$$<br><br></td>
</tr>


<tr>
<td align=left>TAX ID NO:<BR>
TAX YEAR:<br>
AMOUT OF: $$tax_anount$$  $$tax_frequency$$<br>
LAND:<br>
IMPRV:<br>
TOTAL:<br>
TAX INFO STATUS: PAID THRU $$paid_thru_date$$<br>
STORM FEES:<br>
OTHER FEES:<br>
TAX STATUS PROVIDED FOR INFORMATIONAL PURPOSES ONLY<br>
CONTACT TREASURER PRIOR TO SALE<br>
COMMENTS: $$comments_go_here$$<br>
</td>
</tr>











</table>















