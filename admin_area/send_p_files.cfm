<!--- <cfset id_list = ",,"> --->



<cfset id_list = "13-237139,13-237045,13-236650,13-237706,13-237305,13-236500,13-237087,13-237117,13-236967,13-237288,13-237344,13-237236,13-237286,13-237324,13-237400,13-237036,13-236567,13-237110,13-237182,13-237131">



<cfset session.ft_user_id = 248>


<cfloop index="this_id" list="#id_list#" delimiters=",">

<CFQUERY datasource="#request.dsn#" NAME="get_pfile">
SELECT     Prop_ID
FROM         Property
WHERE     (loan_number = '#this_id#')
</CFQUERY>

<cfhttp url="https://machine1.firsttitleservices.com/admin_area/prop_report_sb_submit.cfm?uid=248&al=1&rec_id=#get_pfile.prop_id#&a_trigger=7&company_id=6415" method="post">
<cfhttpparam name="test_field"  type="formfield" value="whatever" >
</cfhttp>
</cfloop>

done!