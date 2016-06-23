<CFPARAM NAME="Order_Number" DEFAULT="">

<CFINCLUDE TEMPLATE="./includes/preprocessing2.cfm">

<!---Make sure the Order Number is valid---->
<CFQUERY datasource="#request.dsn#" NAME="Read_Title_Role">
    Select title_ID
    from tblUser_Roles
    where Title_ID = #order_number#
</CFQUERY>

<CFIF #Read_Title_Role.recordcount# eq "1">
    <CFQUERY datasource="#request.dsn#" >
    update tblUser_Roles
    set Preprocessor_ID = #preprocessing#,
    Preprocessor_Start_Datetime = getdate(),
    Preprocessor_End_Datetime = null
    where Title_ID = #Order_Number#
    </CFQUERY>
</CFIF>

<CFIF #Read_Title_Role.recordcount# eq "0">
    <!---First make sure that this order even exists--->
    <CFQUERY datasource="#request.dsn#" NAME="Read_Title">
        Select title_ID
        from Title
        where Title_ID = #order_number#
    </CFQUERY>

    <CFIF #Read_Title.recordcount# eq "1">
    <CFQUERY datasource="#request.dsn#" >
    Insert into tblUser_Roles
        (Title_ID,Preprocessor_ID,Preprocessor_Start_Datetime,Preprocessor_End_Datetime)
    Values(#order_number#,#preprocessing#,getdate(),null)
    </CFQUERY>
    </CFIF>
</CFIF>

<CFLOCATION URL="https://#cgi.server_name#/admin_area/menu_processing_all.cfm?uid=#URL.uid#&al=#URL.al#&role_mgr=1">





