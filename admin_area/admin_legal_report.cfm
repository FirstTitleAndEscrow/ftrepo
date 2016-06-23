<CFPARAM NAME="a_trigger" DEFAULT=0>

<cfquery name="get_adata" datasource="#request.dsn#">
    select * 
    from prop_ins_add 
    where prop_id = #url.rec_id#
</cfquery>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
    <html>
        <head>
            <title>1st Title & Escrow, Inc. </title>
        </head>
        <BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>
        <CENTER>
            <CENTER>
            <cfif #get_adata.recordcount# GT "0">
                <cfif #a_trigger# eq 1>
                    <CFIF IsDefined("form.selectedDeed") is True>
                        <cfif #form.selectedDeed# is 1>
                        <!---Typing is finished because the merge button has been clicked --->
	                        <CFQUERY datasource="#request.dsn#" >
		                        UPDATE tblUser_Roles
		                        SET Typing_End_Datetime = GetDate()
		                        WHERE  prop_id = #URL.rec_id#
	                        </CFQUERY> 
			
                            <CFQUERY datasource="#request.dsn#" >
		                        UPDATE prop_ins_view
			                    SET 
			                    selectedOrgs = null
			                    WHERE prop_id = #URL.rec_id# and type = 'DATA'
		                   </CFQUERY> 

                            <CFQUERY datasource="#request.dsn#" >
		                        UPDATE prop_ins_view
			                    SET selectedOrgs = 1
			                    WHERE prop_id = #URL.rec_id# 
                                and type = 'DATA' and seq_num = 1
		                    </CFQUERY> 
				
                            <CFQUERY datasource="#request.dsn#" name="get">
		                        Select * 
                                from Doc_Amer_Pioneer_Ins_ALL_Prop
	                            WHERE prop_id = #URL.rec_id#
		                    </CFQUERY>
			            
                        <cfif #get.recordcount# gt 0>
		                    <CFQUERY datasource="#request.dsn#" >
		                        UPDATE Doc_Amer_Pioneer_Ins_ALL_Prop
			                    SET deed_status = null
			                    WHERE prop_id = #URL.rec_id#
		                    </CFQUERY> 
		                </cfif>
                    </cfif>
                </cfif>
                <CFIF IsDefined("form.selectedDeed") is True>
                    <cfif #form.selectedDeed# is 2>
                        <CFQUERY datasource="#request.dsn#" >
		                    UPDATE prop_ins_view
			                SET 
			                selectedOrgs = null
			                WHERE prop_id = #URL.rec_id# and type = 'DATA'
		                </CFQUERY> 
 
                        <CFQUERY datasource="#request.dsn#" >
		                    UPDATE prop_ins_view
			                SET selectedOrgs = 2
			                WHERE prop_id = #URL.rec_id# and type = 'DATA' and seq_num = 2
		                </CFQUERY> 
		
                        <CFQUERY datasource="#request.dsn#" name="get">
		                    Select * 
                            from Doc_Amer_Pioneer_Ins_ALL_Prop
	                        WHERE prop_id = #URL.rec_id#
		                </CFQUERY>
			            
                        <cfif #get.recordcount# gt 0>
		                    <CFQUERY datasource="#request.dsn#" >
		                        UPDATE Doc_Amer_Pioneer_Ins_ALL_Prop
			                    SET deed_status = null
			                    WHERE prop_id = #URL.rec_id#
		                    </CFQUERY> 
		                </cfif>
                    </cfif>
                </cfif>
                <CFIF IsDefined("form.selectedDeed") is True>
                    <cfif #form.selectedDeed# is 3>
                        <CFQUERY datasource="#request.dsn#" >
		                    UPDATE prop_ins_view
			                SET 
			                selectedOrgs = null
			                WHERE prop_id = #URL.rec_id# 
                            and type = 'DATA'
		                </CFQUERY> 
 	
                        <CFQUERY datasource="#request.dsn#" >
		                    UPDATE prop_ins_view
			                SET selectedOrgs = 3
		                    WHERE prop_id = #URL.rec_id# 
                            and type = 'DATA' and seq_num = 3
		                </CFQUERY> 
		                
                        <CFQUERY datasource="#request.dsn#" name="get">
		                    Select * 
                            from Doc_Amer_Pioneer_Ins_ALL_Prop
	                        WHERE prop_id = #URL.rec_id#
		                </CFQUERY>
			 
                        <cfif #get.recordcount# gt 0>
		                    <CFQUERY datasource="#request.dsn#" >
		                        UPDATE Doc_Amer_Pioneer_Ins_ALL_Prop
			                    SET deed_status = null
			                    WHERE prop_id = #URL.rec_id#
		                    </CFQUERY> 
		                </cfif>
                    </cfif>
                </cfif>
                <CFIF IsDefined("form.selectedDeed") is True>
                    <cfif #form.selectedDeed# is 4>
                        <CFQUERY datasource="#request.dsn#" >
		                    UPDATE prop_ins_view
			                SET 
                            selectedOrgs = null
			                WHERE prop_id = #URL.rec_id# and type = 'DATA'
		                </CFQUERY> 
 
                        <CFQUERY datasource="#request.dsn#" >
		                    UPDATE prop_ins_view
			                SET selectedOrgs = 4
			                WHERE prop_id = #URL.rec_id# 
                            and type = 'DATA' and seq_num = 4
		                </CFQUERY> 
		
                        <CFQUERY datasource="#request.dsn#" name="get">
		                    Select * 
                            from Doc_Amer_Pioneer_Ins_ALL_Prop
	                        WHERE prop_id = #URL.rec_id#
		                </CFQUERY>
			            
                        <cfif #get.recordcount# gt 0>
		                    <CFQUERY datasource="#request.dsn#" >
		                        UPDATE Doc_Amer_Pioneer_Ins_ALL_Prop
			                    SET deed_status = null
			                    WHERE prop_id = #URL.rec_id#
                            </CFQUERY> 
		                </cfif>
                    </cfif>
                </cfif>
                <CFIF IsDefined("form.selectedDeed") is True>
                    <cfif #form.selectedDeed# is 5>
                        <CFQUERY datasource="#request.dsn#" >
		                    UPDATE prop_ins_view
			                SET 
			                selectedOrgs = null
			                WHERE prop_id = #URL.rec_id# 
                            and type = 'DATA'
		                </CFQUERY> 

                        <CFQUERY datasource="#request.dsn#" >
		                    UPDATE prop_ins_view
			                SET selectedOrgs = 5
			                WHERE prop_id = #URL.rec_id# 
                            and type = 'DATA' and seq_num = 5
		                </CFQUERY> 
		                
                        <CFQUERY datasource="#request.dsn#" name="get">
		                    Select * 
                            from Doc_Amer_Pioneer_Ins_ALL_Prop
	                        WHERE prop_id = #URL.rec_id#
		                </CFQUERY>
			            
                        <cfif #get.recordcount# gt 0>
		                    <CFQUERY datasource="#request.dsn#" >
		                        UPDATE Doc_Amer_Pioneer_Ins_ALL_Prop
			                    SET deed_status = null
			                    WHERE prop_id = #URL.rec_id#
		                    </CFQUERY> 
		                </cfif>
                    </cfif>
                </cfif>
                <CFIF IsDefined("form.selectedDeed") is True>
                    <cfif #form.selectedDeed# is 6>
                        <CFQUERY datasource="#request.dsn#" >
		                    UPDATE prop_ins_view
			                SET 
			                selectedOrgs = null
			                WHERE prop_id = #URL.rec_id# 
                            and type = 'DATA'
		                </CFQUERY> 
 
                        <CFQUERY datasource="#request.dsn#" >
		                    UPDATE prop_ins_view
		                    SET selectedOrgs = 6
		                    WHERE prop_id = #URL.rec_id# 
                            and type = 'DATA' and seq_num = 6
		                </CFQUERY> 
		                
                        <CFQUERY datasource="#request.dsn#" name="get">
		                    Select * 
                            from Doc_Amer_Pioneer_Ins_ALL_Prop
	                        WHERE prop_id = #URL.rec_id#
		                </CFQUERY>
			 
                        <cfif #get.recordcount# gt 0>
		                    <CFQUERY datasource="#request.dsn#" >
		                        UPDATE Doc_Amer_Pioneer_Ins_ALL_Prop
			                    SET deed_status = null
			                    WHERE prop_id = #URL.rec_id#
		                    </CFQUERY> 
		                </cfif>
                    </cfif>
                </cfif>
                <CFIF IsDefined("form.selectedDeed") is True>
                    <cfif #form.selectedDeed# is 7>
                        <CFQUERY datasource="#request.dsn#" >
		                    UPDATE prop_ins_view
			                SET 
			                selectedOrgs = null
			                WHERE prop_id = #URL.rec_id# and type = 'DATA'
		                </CFQUERY> 
 
                        <CFQUERY datasource="#request.dsn#" >
		                    UPDATE prop_ins_view
			                SET selectedOrgs = 7
			                WHERE prop_id = #URL.rec_id# and type = 'DATA' and seq_num = 7
		                </CFQUERY> 
		                
                        <CFQUERY datasource="#request.dsn#" name="get">
		                    Select * 
                            from Doc_Amer_Pioneer_Ins_ALL_Prop
	                        WHERE prop_id = #URL.rec_id#
		                </CFQUERY>
			            
                        <cfif #get.recordcount# gt 0>
		                    <CFQUERY datasource="#request.dsn#" >
		                        UPDATE Doc_Amer_Pioneer_Ins_ALL_Prop
			                    SET deed_status = null
			                    WHERE prop_id = #URL.rec_id#
		                    </CFQUERY> 
		                </cfif>
                    </cfif>
                </cfif> 
                <CFIF IsDefined("form.selectedDeed") is True>
                    <cfif #form.selectedDeed# is 8>
                        <CFQUERY datasource="#request.dsn#" >
		                    UPDATE prop_ins_view
			                SET 
			                selectedOrgs = null
			                WHERE prop_id = #URL.rec_id# 
                            and type = 'DATA'
		                </CFQUERY> 
 
                        <CFQUERY datasource="#request.dsn#" >
		                    UPDATE prop_ins_view
			                SET selectedOrgs = 8
			                WHERE prop_id = #URL.rec_id# 
                            and type = 'DATA' 
                            and seq_num = 8
		                </CFQUERY> 
		                
                        <CFQUERY datasource="#request.dsn#" name="get">
		                    Select * 
                            from Doc_Amer_Pioneer_Ins_ALL_Prop
	                        WHERE prop_id = #URL.rec_id#
		                </CFQUERY>
			            
                        <cfif #get.recordcount# gt 0>
		                    <CFQUERY datasource="#request.dsn#" >
		                        UPDATE Doc_Amer_Pioneer_Ins_ALL_Prop
			                    SET deed_status = null
			                    WHERE prop_id = #URL.rec_id#
		                    </CFQUERY> 
		                </cfif>
                    </cfif>
                </cfif> 
                <CFIF IsDefined("form.selectedDeed") is True>
                    <cfif #form.selectedDeed# is 9>
                        <CFQUERY datasource="#request.dsn#" >
		                    UPDATE prop_ins_view
			                SET 
			                selectedOrgs = null
			                WHERE prop_id = #URL.rec_id# and type = 'DATA'
		                </CFQUERY> 

                        <CFQUERY datasource="#request.dsn#" >
		                    UPDATE prop_ins_view
			                SET selectedOrgs = 9
			                WHERE prop_id = #URL.rec_id# 
                            and type = 'DATA' and seq_num = 9
		                </CFQUERY>
                         
		                <CFQUERY datasource="#request.dsn#" name="get">
		                    Select * 
                            from Doc_Amer_Pioneer_Ins_ALL_Prop
	                        WHERE prop_id = #URL.rec_id#
		                </CFQUERY>
			            
                        <cfif #get.recordcount# gt 0>
		                    <CFQUERY datasource="#request.dsn#" >
		                        UPDATE Doc_Amer_Pioneer_Ins_ALL_Prop
			                    SET deed_status = null
			                    WHERE prop_id = #URL.rec_id#
		                    </CFQUERY> 
		                </cfif>
                    </cfif>
                </cfif> 
                <CFIF IsDefined("form.selectedDeed") is True>
                    <cfif #form.selectedDeed# is 10>
                        <CFQUERY datasource="#request.dsn#" >
		                    UPDATE prop_ins_view
			                SET 
			                selectedOrgs = null
			                WHERE prop_id = #URL.rec_id# 
                            and type = 'DATA'
		                </CFQUERY> 
			
                        <CFQUERY datasource="#request.dsn#" >
		                    UPDATE prop_ins_view
			                SET selectedOrgs = 10
			                WHERE prop_id = #URL.rec_id# 
                            and type = 'DATA' and seq_num = 10
		                </CFQUERY> 
				        
                        <CFQUERY datasource="#request.dsn#" name="get">
		                    Select * 
                            from Doc_Amer_Pioneer_Ins_ALL_Prop
	                        WHERE prop_id = #URL.rec_id#
		                </CFQUERY>
		
		                <cfif #get.recordcount# gt 0>
		                    <CFQUERY datasource="#request.dsn#" >
		                        UPDATE Doc_Amer_Pioneer_Ins_ALL_Prop
			                    SET deed_status = null
			                    WHERE prop_id = #URL.rec_id#
		                    </CFQUERY> 
		                </cfif>
		            </cfif>
                </cfif> 
                <CFIF IsDefined("form.selectedLien") is True>
                    <cfif #form.selectedLien# is 1>
                        <CFQUERY datasource="#request.dsn#" >
		                    UPDATE prop_ins_view
			                SET 
			                selectedOrgs3 = 1
			                WHERE prop_id = #URL.rec_id# 
                            and type = 'Lien' and seq_num = 1
		                </CFQUERY> 
		                
                        <CFQUERY datasource="#request.dsn#" name="get">
		                    Select * 
                            from Doc_Amer_Pioneer_Ins_ALL_prop
	                        WHERE prop_id = #URL.rec_id#
		                </CFQUERY> 
                        
                        <cfif #get.recordcount# gt 0>
		                    <CFQUERY datasource="#request.dsn#" >
		                        UPDATE Doc_Amer_Pioneer_Ins_ALL_Prop
			                    SET status11 = null
			                    WHERE prop_id = #URL.rec_id#
		                    </CFQUERY> 
		                </cfif>
                    </cfif>
                </cfif>
                <CFIF IsDefined("form.selectedLien2") is True>
                    <cfif #form.selectedLien2# is 2>
                        <CFQUERY datasource="#request.dsn#" >
		                    UPDATE prop_ins_view
			                SET 
			                selectedOrgs3 = 2
			                WHERE prop_id = #URL.rec_id# 
                            and type = 'Lien' and seq_num = 2
		                </CFQUERY> 
		                
                        <CFQUERY datasource="#request.dsn#" name="get">
		                    Select * 
                            from Doc_Amer_Pioneer_Ins_ALL_Prop
	                        WHERE prop_id = #URL.rec_id#
		                </CFQUERY> 
                        
                        <cfif #get.recordcount# gt 0>
		                    <CFQUERY datasource="#request.dsn#" >
		                        UPDATE Doc_Amer_Pioneer_Ins_ALL_Prop
			                    SET status12 = null
			                    WHERE prop_id = #URL.rec_id#
		                    </CFQUERY> 
		                </cfif>
                    </cfif>
                </cfif>
                <CFIF IsDefined("form.selectedLien3") is True>
                    <cfif #form.selectedLien3# is 3>
                        <CFQUERY datasource="#request.dsn#" >
		                    UPDATE prop_ins_view
			                SET 
			                selectedOrgs3 = 3
			                WHERE prop_id = #URL.rec_id# and 
                            type = 'Lien' and seq_num = 3
		                </CFQUERY>
		                
                        <CFQUERY datasource="#request.dsn#" name="get">
		                    Select * 
                            from Doc_Amer_Pioneer_Ins_ALL_Prop
	                        WHERE prop_id = #URL.rec_id#
		                </CFQUERY> 
                        <cfif #get.recordcount# gt 0>
		                    <CFQUERY datasource="#request.dsn#" >
		                        UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			                    SET status13 = null
			                    WHERE prop_id = #URL.rec_id#
		                    </CFQUERY> 
		                </cfif> 
                    </cfif>
                </cfif>
                <CFIF IsDefined("form.selectedLien4") is True>
                    <cfif #form.selectedLien4# is 4>
                        <CFQUERY datasource="#request.dsn#" >
		                    UPDATE prop_ins_view
			                SET 
			                selectedOrgs3 = 4
			                WHERE prop_id = #URL.rec_id# 
                            and type = 'Lien' and seq_num = 4
		                </CFQUERY> 
		                
                        <CFQUERY datasource="#request.dsn#" name="get">
		                    Select * 
                            from Doc_Amer_Pioneer_Ins_ALL_prop
	                        WHERE  prop_id = #URL.rec_id#
		                </CFQUERY> 
                        
                        <cfif #get.recordcount# gt 0>
		                    <CFQUERY datasource="#request.dsn#" >
		                        UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			                    SET status14 = null
			                    WHERE  prop_id = #URL.rec_id#
		                    </CFQUERY> 
		                </cfif>
                    </cfif>
                </cfif>
                <CFIF IsDefined("form.selectedLien5") is True>
                    <cfif #form.selectedLien5# is 5>
                        <CFQUERY datasource="#request.dsn#" >
		                    UPDATE prop_ins_view
			                SET 
			                selectedOrgs3 = 5
			                WHERE  prop_id = #URL.rec_id# 
                            and type = 'Lien' and seq_num = 5
		                </CFQUERY> 
		                
                        <CFQUERY datasource="#request.dsn#" name="get">
		                    Select * 
                            from Doc_Amer_Pioneer_Ins_ALL_prop
	                        WHERE  prop_id = #URL.rec_id#
		                </CFQUERY> 
                        
                        <cfif #get.recordcount# gt 0>
		                    <CFQUERY datasource="#request.dsn#" >
		                        UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			                    SET status15 = null
			                    WHERE  prop_id = #URL.rec_id#
		                    </CFQUERY> 
		                </cfif>
                    </cfif>
                </cfif>
                <CFIF IsDefined("form.selectedLien6") is True>
                    <cfif #form.selectedLien6# is 6>
                        <CFQUERY datasource="#request.dsn#" >
		                    UPDATE prop_ins_view
			                SET 
			                selectedOrgs3 = 6
			                WHERE  prop_id = #URL.rec_id# 
                            and type = 'Lien' and seq_num = 6
		                </CFQUERY> 
		                
                        <CFQUERY datasource="#request.dsn#" name="get">
		                    Select * 
                            from Doc_Amer_Pioneer_Ins_ALL_prop
	                        WHERE  prop_id = #URL.rec_id#
		                </CFQUERY> 
                        
                        <cfif #get.recordcount# gt 0>
		                    <CFQUERY datasource="#request.dsn#" >
		                        UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			                    SET status16 = null
			                    WHERE  prop_id = #URL.rec_id#
		                    </CFQUERY> 
		                </cfif>
                    </cfif>
                </cfif>
                <CFIF IsDefined("form.selectedLien7") is True>
                    <cfif #form.selectedLien7# is 7>
                        <CFQUERY datasource="#request.dsn#" >
		                    UPDATE prop_ins_view
			                SET 
			                selectedOrgs3 = 7
			                WHERE  prop_id = #URL.rec_id# 
                            and type = 'Lien' and seq_num = 7
		                </CFQUERY>
		                
                        <CFQUERY datasource="#request.dsn#" name="get">
		                    Select * 
                            from Doc_Amer_Pioneer_Ins_ALL_prop
	                        WHERE  prop_id = #URL.rec_id#
		                </CFQUERY> 
                        
                        <cfif #get.recordcount# gt 0>
		                    <CFQUERY datasource="#request.dsn#" >
		                        UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			                    SET status17 = null
			                    WHERE  prop_id = #URL.rec_id#
		                    </CFQUERY> 
		                </cfif> 
                    </cfif>
                </cfif>
                <CFIF IsDefined("form.selectedLien8") is True>
                    <cfif #form.selectedLien8# is 8>
                        <CFQUERY datasource="#request.dsn#" >
		                    UPDATE prop_ins_view
			                SET 
			                selectedOrgs3 = 8
			                WHERE  prop_id = #URL.rec_id# 
                            and type = 'Lien' and seq_num = 8
                        </CFQUERY> 
		                
                        <CFQUERY datasource="#request.dsn#" name="get">
		                    Select * 
                            from Doc_Amer_Pioneer_Ins_ALL_prop
	                        WHERE  prop_id = #URL.rec_id#
                        </CFQUERY> 
                        
                        <cfif #get.recordcount# gt 0>
		                    <CFQUERY datasource="#request.dsn#" >
		                        UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			                    SET status18 = null
			                    WHERE  prop_id = #URL.rec_id#
		                    </CFQUERY> 
		                </cfif>
                    </cfif>
                </cfif>
                <CFIF IsDefined("form.selectedLien9") is True>
                    <cfif #form.selectedLien9# is 9>
                        <CFQUERY datasource="#request.dsn#" >
		                    UPDATE prop_ins_view
			                SET 
			                selectedOrgs3 = 9
			                WHERE  prop_id = #URL.rec_id# 
                            and type = 'Lien' and seq_num = 9
		                </CFQUERY>
		                
                        <CFQUERY datasource="#request.dsn#" name="get">
		                    Select * 
                            from Doc_Amer_Pioneer_Ins_ALL_prop
	                        WHERE  prop_id = #URL.rec_id#
		                </CFQUERY> 
                        
                        <cfif #get.recordcount# gt 0>
		                    <CFQUERY datasource="#request.dsn#" >
		                        UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
                    			SET status19 = null
			                    WHERE  prop_id = #URL.rec_id#
		                    </CFQUERY> 
		                </cfif> 
                    </cfif>
                </cfif>
                <CFIF IsDefined("form.selectedLien10") is True>
                    <cfif #form.selectedLien10# is 10>
                        <CFQUERY datasource="#request.dsn#" >
		                    UPDATE prop_ins_view
			                SET 
			                selectedOrgs3 = 10
			                WHERE  prop_id = #URL.rec_id# 
                            and type = 'Lien' and seq_num = 10
		                </CFQUERY> 
		                
                        <CFQUERY datasource="#request.dsn#" name="get">
		                    Select * 
                            from Doc_Amer_Pioneer_Ins_ALL_prop
	                        WHERE  prop_id = #URL.rec_id#
		                </CFQUERY> 
                        
                        <cfif #get.recordcount# gt 0>
		                    <CFQUERY datasource="#request.dsn#" >
		                        UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			                    SET status20 = null
			                    WHERE  prop_id = #URL.rec_id#
		                    </CFQUERY> 
		                </cfif>
                    </cfif>
                </cfif>
                <CFIF IsDefined("form.selectedMortgage") is True>
                    <cfif #form.selectedMortgage# is 1>
                        <CFQUERY datasource="#request.dsn#" >
		                    UPDATE prop_ins_view
			                SET 
			                selectedOrgs4 = 1
			                WHERE  prop_id = #URL.rec_id# and 
                            type = 'Mortgage' and seq_num = 1
		                </CFQUERY> 
		
		                <CFQUERY datasource="#request.dsn#" name="get">
		                    Select * 
                            from Doc_Amer_Pioneer_Ins_ALL_prop
	                        WHERE  prop_id = #URL.rec_id#
		                </CFQUERY> 
                        
                        <cfif #get.recordcount# gt 0>
		                    <CFQUERY datasource="#request.dsn#" >
		                        UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			                    SET status = null
			                    WHERE  prop_id = #URL.rec_id#
		                    </CFQUERY> 
		                </cfif>
		            </cfif>
                </cfif>
                <CFIF IsDefined("form.selectedMortgage2") is True>
                    <cfif #form.selectedMortgage2# is 2>
                        <CFQUERY datasource="#request.dsn#" >
		                    UPDATE prop_ins_view
			                SET 
			                selectedOrgs4 = 2
			                WHERE  prop_id = #URL.rec_id# and type = 'Mortgage' and seq_num = 2
		                </CFQUERY> 
                        
                        <CFQUERY datasource="#request.dsn#" name="get">
		                    Select * from 
                            Doc_Amer_Pioneer_Ins_ALL_prop
	                        WHERE  prop_id = #URL.rec_id#
		                </CFQUERY> 
                        
                        <cfif #get.recordcount# gt 0>
		                    <CFQUERY datasource="#request.dsn#" >
		                        UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			                    SET status2 = null
			                    WHERE  prop_id = #URL.rec_id#
		                    </CFQUERY> 
		                </cfif>
                    </cfif>
                </cfif>
                <CFIF IsDefined("form.selectedMortgage3") is True>
                    <cfif #form.selectedMortgage3# is 3>
                        <CFQUERY datasource="#request.dsn#" >
		                    UPDATE prop_ins_view
			                SET 
			                selectedOrgs4 = 3
			                WHERE  prop_id = #URL.rec_id# and type = 'Mortgage' and seq_num = 3
		                </CFQUERY> 
		
		                <CFQUERY datasource="#request.dsn#" name="get">
		                    Select * 
                            from Doc_Amer_Pioneer_Ins_ALL_prop
	                        WHERE  prop_id = #URL.rec_id#
		                </CFQUERY> 
                        
                        <cfif #get.recordcount# gt 0>
		                    <CFQUERY datasource="#request.dsn#" >
		                        UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			                    SET status3 = null
			                    WHERE  prop_id = #URL.rec_id#
		                    </CFQUERY> 
		                </cfif>
                    </cfif>
                </cfif>
                <CFIF IsDefined("form.selectedMortgage4") is True>
                    <cfif #form.selectedMortgage4# is 4>
                        <CFQUERY datasource="#request.dsn#" >
		                    UPDATE prop_ins_view
			                SET 
			                selectedOrgs4 = 4
			                WHERE prop_id = #URL.rec_id# 
                            and type = 'Mortgage' and seq_num = 4
		                </CFQUERY> 
		                
                        <CFQUERY datasource="#request.dsn#" name="get">
		                    Select * 
                            from Doc_Amer_Pioneer_Ins_ALL_prop
	                        WHERE prop_id = #URL.rec_id#
		                </CFQUERY> <cfif #get.recordcount# gt 0>
		                
                        <CFQUERY datasource="#request.dsn#" >
		                    UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			                SET status4 = null
			                WHERE  prop_id = #URL.rec_id#
		                </CFQUERY> 
		            </cfif>
                </cfif>
            </cfif>
            <CFIF IsDefined("form.selectedMortgage5") is True>
                <cfif #form.selectedMortgage5# is 5>
                    <CFQUERY datasource="#request.dsn#" >
		                UPDATE prop_ins_view
			            SET 
			            selectedOrgs4 = 5
			            WHERE  prop_id = #URL.rec_id# and type = 'Mortgage' and seq_num = 5
		            </CFQUERY> 
		            
                    <CFQUERY datasource="#request.dsn#" name="get">
		                Select * from Doc_Amer_Pioneer_Ins_ALL_prop
	                    WHERE  prop_id = #URL.rec_id#
		            </CFQUERY> 
                    
                    <cfif #get.recordcount# gt 0>
		                <CFQUERY datasource="#request.dsn#" >
		                    UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			                SET status5 = null
			                WHERE  prop_id = #URL.rec_id#
		                </CFQUERY> 
		            </cfif>
                </cfif>
            </cfif>
            <CFIF IsDefined("form.selectedMortgage6") is True>
                <cfif #form.selectedMortgage6# is 6>
                    <CFQUERY datasource="#request.dsn#" >
		                UPDATE prop_ins_view
			            SET 
			            selectedOrgs4 = 6
			            WHERE  prop_id = #URL.rec_id# 
                        and type = 'Mortgage' and seq_num = 6
		            </CFQUERY>
                    
		            <CFQUERY datasource="#request.dsn#" name="get">
		                Select * 
                        from Doc_Amer_Pioneer_Ins_ALL_prop
	                    WHERE  prop_id = #URL.rec_id#
		            </CFQUERY> 
                    
                    <cfif #get.recordcount# gt 0>
		                <CFQUERY datasource="#request.dsn#" >
		                    UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			                SET status6 = null
			                WHERE  prop_id = #URL.rec_id#
		                </CFQUERY> 
		            </cfif> 
                </cfif>
            </cfif>
            <CFIF IsDefined("form.selectedMortgage7") is True>
                <cfif #form.selectedMortgage7# is 7>
                    <CFQUERY datasource="#request.dsn#" >
		                UPDATE prop_ins_view
			            SET 
			            selectedOrgs4 = 7
			            WHERE  prop_id = #URL.rec_id# and type = 'Mortgage' and seq_num = 7
		            </CFQUERY> 
		            
                    <CFQUERY datasource="#request.dsn#" name="get">
		                Select * from Doc_Amer_Pioneer_Ins_ALL_prop
	                    WHERE  prop_id = #URL.rec_id#
		            </CFQUERY> 
                    <cfif #get.recordcount# gt 0>
		                <CFQUERY datasource="#request.dsn#" >
		                    UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			                SET status7 = null
			                WHERE  prop_id = #URL.rec_id#
		                </CFQUERY> 
		            </cfif>
                </cfif>
            </cfif>
            <CFIF IsDefined("form.selectedMortgage8") is True>
                <cfif #form.selectedMortgage8# is 8>
                    <CFQUERY datasource="#request.dsn#" >
		                UPDATE prop_ins_view
			            SET 
			            selectedOrgs4 = 8
			            WHERE  prop_id = #URL.rec_id# and type = 'Mortgage' and seq_num = 8
		            </CFQUERY> 
		            
                    <CFQUERY datasource="#request.dsn#" name="get">
		                Select * 
                        from Doc_Amer_Pioneer_Ins_ALL_prop
	                    WHERE  prop_id = #URL.rec_id#
		            </CFQUERY> 
                    
                    <cfif #get.recordcount# gt 0>
		                <CFQUERY datasource="#request.dsn#" >
		                    UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			                SET status8 = null
			                WHERE  prop_id = #URL.rec_id#
		                </CFQUERY> 
		            </cfif>
                </cfif>
            </cfif>
            <CFIF IsDefined("form.selectedMortgage9") is True>
                <cfif #form.selectedMortgage9# is 9>
                    <CFQUERY datasource="#request.dsn#" >
		                UPDATE prop_ins_view
			            SET 
			            selectedOrgs4 = 9
			            WHERE  prop_id = #URL.rec_id# and type = 'Mortgage' and seq_num = 9
		            </CFQUERY>
		
                    <CFQUERY datasource="#request.dsn#" name="get">
		                Select * 
                        from Doc_Amer_Pioneer_Ins_ALL_prop
	                    WHERE  prop_id = #URL.rec_id#
		            </CFQUERY> 
                    
                    <cfif #get.recordcount# gt 0>
		                <CFQUERY datasource="#request.dsn#" >
		                    UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			                SET status9 = null
			                WHERE  prop_id = #URL.rec_id#
		                </CFQUERY> 
		            </cfif> 
                </cfif>
            </cfif>
            <CFIF IsDefined("form.selectedMortgage10") is True>
                <cfif #form.selectedMortgage10# is 10>
                    <CFQUERY datasource="#request.dsn#" >
		                UPDATE prop_ins_view
			            SET 
			            selectedOrgs4 = 10
			            WHERE  prop_id = #URL.rec_id# and type = 'Mortgage' and seq_num = 10
		            </CFQUERY> 
		            
                    <CFQUERY datasource="#request.dsn#" name="get">
		                Select * 
                        from Doc_Amer_Pioneer_Ins_ALL_prop
	                    WHERE  prop_id = #URL.rec_id#
		            </CFQUERY> 
                    
                    <cfif #get.recordcount# gt 0>
		                <CFQUERY datasource="#request.dsn#" >
		                    UPDATE Doc_Amer_Pioneer_Ins_ALL_prop
			                SET status10 = null
			                WHERE  prop_id = #URL.rec_id#
		                </CFQUERY> 
		            </cfif>
                </cfif>
            </cfif>
        </cfif>
<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=elelel>
	<tr>
		<td width=790 align=center valign=top>
		    <CFINCLUDE TEMPLATE="./includes/prop_top_nav.cfm">
            <table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	            <tr>
			        <td width=790 align=left valign=top bgcolor=green>
				        <FONT FACE=ARIAL SIZE=2 color="white">
				        <CENTER><B>Abstractor Data Information</B></CENTER>
			        </TD>
		        </TR>
	            <tr>
		            <td width=790 align=center valign=top bgcolor=e1e1e1>
<CFFORM name = "frm" METHOD=POST ACTION="./admin_legal_report.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#url.rec_id#&a_trigger=1&company_id=0">
    <CFQUERY datasource="#request.dsn#" NAME="read_DEED">		
	    SELECT *
		FROM prop_ins_add
		Where prop_id = #URL.rec_id# and type = 'DATA'
    </CFQUERY>
    
    <!---
    <cfif #read_deed.recordcount# GT 0>
        <CFQUERY datasource="#request.dsn#" NAME="read_seq_num1">		
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'DATA' and seq_num = 1
        </CFQUERY>

        <cfif #read_seq_num1.recordcount# GT 0>
            <CFOUTPUT QUERY="read_seq_num1">
                <table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		            <tr>
			            <td width=255 align=left valign=top bgcolor=e1e1e1>
                            <table width=255 cellpadding=1 cellspacing=1 border=0 >
				                <tr>
						            <td width=65 align=center valign=middle bgcolor=d1d1d1>
						                <font face=verdana size=1 color=blue>
						                <b>#insert_Date#</b>				
					                </td>
					                <td width=65 align=center valign=middle bgcolor=d1d1d1>
						                <font face=verdana size=1 color=blue>
						                <b>#insert_Time#</b>				
					                </td>
				                <tr>
			                </table>
		                            <td width=140 align=left valign=top bgcolor=e1e1e1>
                            <cfif #status# EQ "U">
		                        <a href="./prop_abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Deed 1</font></a>	
			                <cfelse>
			                    <a href="./prop_abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Deed 1</font></a>	
		                    </cfif>
			            </td>		
	                    <td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=1> 
 		                    <FONT FACE=verdana SIZE=1 color="black">   Select to merge DEED 1<br>
		                </td>
	                </tr>
                </table>
		</CFOUTPUT> 	
    </cfif>
	
<CFQUERY datasource="#request.dsn#" NAME="read_seq_num2">		
    SELECT *
	FROM prop_ins_add
	Where prop_id = #URL.rec_id# 
    and type = 'DATA' and seq_num = 2
</CFQUERY>

<cfif #read_seq_num2.recordcount# GT 0>
    <CFOUTPUT QUERY="read_seq_num2">
    <table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>
                <table width=255 cellpadding=1 cellspacing=1 border=0 >
				    <tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						    <font face=verdana size=1 color=blue>
						    <b>#insert_Date#</b>				
					    </td>
					    <td width=65 align=center valign=middle bgcolor=d1d1d1>
						    <font face=verdana size=1 color=blue>
						    <b>#insert_Time#</b>				
					    </td>
				    <tr>
			    </table>
		    <td width=140 align=left valign=top bgcolor=e1e1e1>
                <cfif #status# EQ "U">
		            <a href="./prop_abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Deed 2</font></a>	
			    <cfelse>
			        <a href="./prop_abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Deed 2</font></a>	
		        </cfif>
			</td>		
	        <td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=2> 
 		        <FONT FACE=verdana SIZE=1 color="black">   Select to merge DEED 2<br>
		    </td>
	    </tr>
</table>
</CFOUTPUT> 	
</cfif>
	
<CFQUERY datasource="#request.dsn#" NAME="read_seq_num3">		
    SELECT *
	FROM prop_ins_add
	Where prop_id = #URL.rec_id# and type = 'DATA' and seq_num = 3
</CFQUERY>

<cfif #read_seq_num3.recordcount# GT 0>
    <CFOUTPUT QUERY="read_seq_num3">
        <table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		    <tr>
			    <td width=255 align=left valign=top bgcolor=e1e1e1>
                    <table width=255 cellpadding=1 cellspacing=1 border=0 >
				        <tr>
						    <td width=65 align=center valign=middle bgcolor=d1d1d1>
						        <font face=verdana size=1 color=blue>
						        <b>#insert_Date#</b>				
					        </td>
					        <td width=65 align=center valign=middle bgcolor=d1d1d1>
						        <font face=verdana size=1 color=blue>
						        <b>#insert_Time#</b>				
					        </td>
				        <tr>
			        </table>
		        <td width=140 align=left valign=top bgcolor=e1e1e1>
                    <cfif #status# EQ "U">
		                <a href="./prop_abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Deed 3</font></a>	
			        <cfelse>
			            <a href="./prop_abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Deed 3</font></a>	
		            </cfif>
			</td>		
	        <td width=290 align=left valign=top bgcolor=e1e1e1> 
                <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=3> 
 		        <FONT FACE=verdana SIZE=1 color="black">   
                Select to merge DEED 3<br>
		    </td>
	    </tr>
    </table>
    </CFOUTPUT> 	
</cfif>
	
<CFQUERY datasource="#request.dsn#" NAME="read_seq_num4">		
    SELECT *
	FROM prop_ins_add
	Where prop_id = #URL.rec_id# and type = 'DATA' and seq_num = 4
</CFQUERY>

<cfif #read_seq_num4.recordcount# GT 0>
    <CFOUTPUT QUERY="read_seq_num4">
    <table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>
                <table width=255 cellpadding=1 cellspacing=1 border=0 >
				    <tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						    <font face=verdana size=1 color=blue>
						    <b>#insert_Date#</b>				
					    </td>
					    <td width=65 align=center valign=middle bgcolor=d1d1d1>
						    <font face=verdana size=1 color=blue>
						    <b>#insert_Time#</b>				
					    </td>
                    <tr>
			    </table>
		    <td width=140 align=left valign=top bgcolor=e1e1e1>
		        <cfif #status# EQ "U">
		            <a href="./prop_abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Deed 4</font></a>	
			    <cfelse>
			        <a href="./prop_abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Deed 4</font></a>	
		        </cfif>
			</td>		
	        <td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=4> 
 		        <FONT FACE=verdana SIZE=1 color="black">   Select to merge DEED 4<br>
	    	</td>
	    </tr>
    </table>
</CFOUTPUT> 	
</cfif>
	
<CFQUERY datasource="#request.dsn#" NAME="read_seq_num5">		
	SELECT *
	FROM prop_ins_add
	Where prop_id = #URL.rec_id# and type = 'DATA' and seq_num = 5
</CFQUERY>

<cfif #read_seq_num5.recordcount# GT 0>
    <CFOUTPUT QUERY="read_seq_num5">
        <table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		    <tr>
			    <td width=255 align=left valign=top bgcolor=e1e1e1>
                    <table width=255 cellpadding=1 cellspacing=1 border=0 >
				        <tr>
						    <td width=65 align=center valign=middle bgcolor=d1d1d1>
						        <font face=verdana size=1 color=blue>
						        <b>#insert_Date#</b>				
					        </td>
					        <td width=65 align=center valign=middle bgcolor=d1d1d1>
						        <font face=verdana size=1 color=blue>
						        <b>#insert_Time#</b>				
					        </td>
				        <tr>
			        </table>
                <td width=140 align=left valign=top bgcolor=e1e1e1>
                    <cfif #status# EQ "U">
		                <a href="./prop_abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Deed 5</font></a>	
			        <cfelse>
			            <a href="./prop_abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Deed 5</font></a>	
		            </cfif>
			    </td>		
	            <td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=5> 
 		            <FONT FACE=verdana SIZE=1 color="black">   Select to merge DEED 5<br>
		        </td>
	        </tr>
        </table>
    </CFOUTPUT> 	
</cfif>
	
<CFQUERY datasource="#request.dsn#" NAME="read_seq_num6">		
    SELECT *
	FROM prop_ins_add
	Where prop_id = #URL.rec_id# and type = 'DATA' and seq_num = 6
</CFQUERY>

<cfif #read_seq_num6.recordcount# GT 0>
    <CFOUTPUT QUERY="read_seq_num6">
    <table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>
                <table width=255 cellpadding=1 cellspacing=1 border=0 >
				    <tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						    <font face=verdana size=1 color=blue>
						    <b>#insert_Date#</b>				
					    </td>
					    <td width=65 align=center valign=middle bgcolor=d1d1d1>
						    <font face=verdana size=1 color=blue>
						    <b>#insert_Time#</b>				
					    </td>
				    <tr>
			    </table>
		    <td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #status# EQ "U">
		<a href="./prop_abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Deed 6</font></a>	
			<cfelse>
			<a href="./prop_abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Deed 6</font></a>	
		</cfif>
			</td>		
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=6> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge DEED 6<br>
		</td>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
		</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num7">		
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'DATA' and seq_num = 7
				
</CFQUERY>
<cfif #read_seq_num7.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num7">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #status# EQ "U">
		<a href="./prop_abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Deed 7</font></a>	
			<cfelse>
			<a href="./prop_abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Deed 7</font></a>	
		</cfif>
			</td>		
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=7> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge DEED 7<br>
		</td>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
		</cfif> 
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num8">		
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'DATA' and seq_num = 8
				
</CFQUERY>

<cfif #read_seq_num8.recordcount# GT 0>
<CFOUTPUT QUERY="read_seq_num8">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #status# EQ "U">
		<a href="./prop_abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Deed 8</font></a>	
			<cfelse>
			<a href="./prop_abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Deed 8</font></a>	
		</cfif>
			</td>		
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=8> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge DEED 8<br>
		</td>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
		</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num9">		
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'DATA' and seq_num = 9
				
</CFQUERY>

<cfif #read_seq_num9.recordcount# GT 0>
<CFOUTPUT QUERY="read_seq_num9">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #status# EQ "U">
		<a href="./prop_abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Deed 9</font></a>	
			<cfelse>
			<a href="./prop_abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Deed 9</font></a>	
		</cfif>
			</td>		
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=9> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge DEED 9<br>
		</td>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
		</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num10">		
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'DATA' and seq_num = 10
				
</CFQUERY>
<cfif #read_seq_num10.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num10">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #status# EQ "U">
		<a href="./prop_abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Deed 10</font></a>	
			<cfelse>
			<a href="./prop_abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Deed 10</font></a>	
		</cfif>
			</td>		
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=10> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge DEED 10<br>
		</td>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	

</cfif>
</cfif>--->
<CFQUERY datasource="#request.dsn#" NAME="read_mortgage">		
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'MORTGAGE'
				
</CFQUERY>

<!---
<cfif #read_mortgage.recordcount# GT 0>



<CFQUERY datasource="#request.dsn#" NAME="read_seq_num1">		
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'MORTGAGE' and seq_num = 1
				
</CFQUERY>

<cfif #read_seq_num1.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num1">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_mortgage.status# EQ "U">
		<a href="./prop_abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Mortgage 1</font></a>	
			<cfelse>
			<a href="./prop_abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Mortgage 1</font></a>	
		</cfif>
			</td>		
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage" VALUE=1> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 1<br>
		</td>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
	</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num2">		
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'MORTGAGE' and seq_num = 2
				
</CFQUERY>

<cfif #read_seq_num2.recordcount# GT 0>
<CFOUTPUT QUERY="read_seq_num2">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_mortgage.status# EQ "U">
		<a href="./prop_abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Mortgage 2</font></a>	
			<cfelse>
			<a href="./prop_abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Mortgage 2</font></a>	
		</cfif>
			</td>		
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage2" VALUE=2> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 2<br>
		</td>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num3">		
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'MORTGAGE' and seq_num = 3
				
</CFQUERY>

<cfif #read_seq_num3.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num3">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_mortgage.status# EQ "U">
		<a href="./prop_abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Mortgage 3</font></a>	
			<cfelse>
			<a href="./prop_abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Mortgage 3</font></a>	
		</cfif>
			</td>		
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage3" VALUE=3> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 3<br>
		</td>
	</tr>
</table>
		
		
		
		</CFOUTPUT> 	
	
		</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num4">		
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'MORTGAGE' and seq_num = 4
				
</CFQUERY>
<cfif #read_seq_num4.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num4">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_mortgage.status# EQ "U">
		<a href="./prop_abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Mortgage 4</font></a>	
			<cfelse>
			<a href="./prop_abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Mortgage 4</font></a>	
		</cfif>
			</td>		
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage4" VALUE=4> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 4<br>
		</td>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
		</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num5">		
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'MORTGAGE' and seq_num = 5
				
</CFQUERY>
<cfif #read_seq_num5.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num5">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_mortgage.status# EQ "U">
		<a href="./prop_abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Mortgage 5</font></a>	
			<cfelse>
			<a href="./prop_abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Mortgage 5</font></a>	
		</cfif>
			</td>		
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage5" VALUE=5> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 5<br>
		</td>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
		</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num6">		
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'MORTGAGE' and seq_num = 6
				
</CFQUERY>
<cfif #read_seq_num6.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num6">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_mortgage.status# EQ "U">
		<a href="./prop_abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Mortgage 6</font></a>	
			<cfelse>
			<a href="./prop_abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Mortgage 6</font></a>	
		</cfif>
			</td>		
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage6" VALUE=6> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 6<br>
		</td>
	</tr>
</table>
		
		</CFOUTPUT> 	
		</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num7">		
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'MORTGAGE' and seq_num = 7
				
</CFQUERY>
<cfif #read_seq_num7.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num7">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_mortgage.status# EQ "U">
		<a href="./prop_abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Mortgage 7</font></a>	
			<cfelse>
			<a href="./prop_abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Mortgage 7</font></a>	
		</cfif>
			</td>		
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage7" VALUE=7> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 7<br>
		</td>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
		</cfif>
	

 <CFQUERY datasource="#request.dsn#" NAME="read_seq_num8">		
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'MORTGAGE' and seq_num = 8
				
</CFQUERY>

<cfif #read_seq_num8.recordcount# GT 0>
<CFOUTPUT QUERY="read_seq_num8">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_mortgage.status# EQ "U">
		<a href="./prop_abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Mortgage 8</font></a>	
			<cfelse>
			<a href="./prop_abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Mortgage 8</font></a>	
		</cfif>
			</td>		
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage8" VALUE=8> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 8<br>
		</td>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
		</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num9">		
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'MORTGAGE' and seq_num = 9
				
</CFQUERY>

<cfif #read_seq_num9.recordcount# GT 0>
<CFOUTPUT QUERY="read_seq_num9">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_mortgage.status# EQ "U">
		<a href="./prop_abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Mortgage 9</font></a>	
			<cfelse>
			<a href="./prop_abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Mortgage 9</font></a>	
		</cfif>
			</td>		
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage9" VALUE=9> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 9<br>
		</td>
	</tr>
</table>
		
		</CFOUTPUT> 	
	
		</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num10">		
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'MORTGAGE' and seq_num = 10
				
</CFQUERY>
<cfif #read_seq_num10.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num10">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_mortgage.status# EQ "U">
		<a href="./prop_abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Mortgage 10</font></a>	
			<cfelse>
			<a href="./prop_abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Mortgage 10</font></a>	
		</cfif>
			</td>		
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage10" VALUE=10> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 10<br>
		</td>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
	
	
	</cfif>
	

</cfif>

--->
<CFQUERY datasource="#request.dsn#" NAME="read_LIEN">		
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN'
				
</CFQUERY>

<!---
<cfif #read_LIEN.recordcount# GT 0>



<CFQUERY datasource="#request.dsn#" NAME="read_seq_num1">		
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 1
				
</CFQUERY>

<cfif #read_seq_num1.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num1">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="./prop_abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 1</font></a>	
			<cfelse>
			<a href="./prop_abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 1</font></a>	
		</cfif>
			</td>		
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien" VALUE=1> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 1<br>
		</td>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
	</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num2">		
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 2
				
</CFQUERY>

<cfif #read_seq_num2.recordcount# GT 0>
<CFOUTPUT QUERY="read_seq_num2">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="./prop_abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 2</font></a>	
			<cfelse>
			<a href="./prop_abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 2</font></a>	
		</cfif>
			</td>		
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien2" VALUE=2> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 2<br>
		</td>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num3">		
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 3
				
</CFQUERY>

<cfif #read_seq_num3.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num3">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="./prop_abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 3</font></a>	
			<cfelse>
			<a href="./prop_abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 3</font></a>	
		</cfif>
			</td>		
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien3" VALUE=3> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 3<br>
		</td>
	</tr>
</table>
		
		
		
		</CFOUTPUT> 	
	
		</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num4">		
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 4
				
</CFQUERY>
<cfif #read_seq_num4.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num4">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="./prop_abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 4</font></a>	
			<cfelse>
			<a href="./prop_abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 4</font></a>	
		</cfif>
			</td>		
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien4" VALUE=4> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 4<br>
		</td>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
		</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num5">		
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 5
				
</CFQUERY>
<cfif #read_seq_num5.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num5">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="./prop_abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 5</font></a>	
			<cfelse>
			<a href="./prop_abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 5</font></a>	
		</cfif>
			</td>		
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien5" VALUE=5> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 5<br>
		</td>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
		</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num6">		
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 6
				
</CFQUERY>
<cfif #read_seq_num6.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num6">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="./prop_abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 6</font></a>	
			<cfelse>
			<a href="./prop_abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 6</font></a>	
		</cfif>
			</td>		
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien6" VALUE=6> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 6<br>
		</td>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
		</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num7">		
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 7
				
</CFQUERY>
<cfif #read_seq_num7.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num7">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="./prop_abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 7</font></a>	
			<cfelse>
			<a href="./prop_abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 7</font></a>	
		</cfif>
			</td>		
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien7" VALUE=7> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 7<br>
		</td>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
		</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num8">		
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 8
				
</CFQUERY>

<cfif #read_seq_num8.recordcount# GT 0>
<CFOUTPUT QUERY="read_seq_num8">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="./prop_abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 8</font></a>	
			<cfelse>
			<a href="./prop_abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 8</font></a>	
		</cfif>
			</td>		
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien8" VALUE=8> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 8<br>
		</td>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
		</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num9">		
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 9
				
</CFQUERY>

<cfif #read_seq_num9.recordcount# GT 0>
<CFOUTPUT QUERY="read_seq_num9">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="./prop_abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 9</font></a>	
			<cfelse>
			<a href="./prop_abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 9</font></a>	
		</cfif>
			</td>		
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien9" VALUE=9> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 9<br>
		</td>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
		</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num10">		
				SELECT *
				FROM prop_ins_add
				Where prop_id = #URL.rec_id# and type = 'LIEN' and seq_num = 10
				
</CFQUERY>
<cfif #read_seq_num10.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num10">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="./prop_abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 10</font></a>	
			<cfelse>
			<a href="./prop_abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 10</font></a>	
		</cfif>
			</td>		
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien10" VALUE=10> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 10<br>
		</td>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
	
	
	</cfif>


</cfif>

--->

			</td>
		</tr>		
</table>


<br>
<!---
Click this button to merge <INPUT TYPE=IMAGE SRC="./images/button_merge.gif" border=0>
--->  
</cfform>

<cfif #a_trigger# eq 1>

<CFSET c_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET c_date = #DateFormat(Now(), "mm/dd/yyyy")#>
		
		 <CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_add
			SET 
			insert_date = '#c_date#',
			insert_time = '#c_time#',
			complete = 1
			WHERE  title_id = #URL.rec_id#		
		</CFQUERY>
		 <CFQUERY datasource="#request.dsn#" >
		
			UPDATE Doc_Title_Insurance_Title
			SET 
			merge_date = '#c_date#',
			merge_time = '#c_time#'
			WHERE  title_id = #URL.rec_id#		
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="read_user">
		
			select * from first_admin
			WHERE ID = #session.ft_user_id#
		
		</CFQUERY>
		
		<CFQUERY datasource="#request.dsn#" NAME="read_em">
		
			select * from Doc_Title_Insurance_prop
			WHERE prop_id = #URL.rec_id# and merge_date is null
		
		</CFQUERY>
		<cfif #read_em.recordcount# GT 0>
		<CFMAIL
TO="titlereview@firsttitleservices.com"
FROM="binders@firsttitleservices.com" Subject="File #rec_id# -- Ready for property review"
TIMEOUT="600"
type="HTML"
>

File #rec_id# -- Ready for property review
              
First Title staff
</cfmail>
	</cfif>	

<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
    <tr>
	    <!---
        <td width=699 align=center valign=top bgcolor=e1e1e1>
            <b><font face=verdana size=2 color=blue>
            All selected item(s) were successfully merged to Legal Vesting Report!
            </font></b><br>
        </td>
        --->
    </tr>
</table>
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_sent">		
				SELECT *
				FROM prop_ins_view
				Where prop_id = #URL.rec_id# and type = 'DATA' and selectedOrgs is not null
				
</CFQUERY>
<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
    <tr>
	    <!----
        <td width=699 align=center valign=top bgcolor=e1e1e1>
            <b><font face=verdana size=2 color=black>Merged data is shown below (if any).</b><br>
        </td>
        --->
    </tr>

<cfif #read_sent.recordcount# GT 0>
    <CFOUTPUT QUERY="read_sent">
        <table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		    <tr>
			    <td width=255 align=left valign=top bgcolor=e1e1e1>
                    <table width=255 cellpadding=1 cellspacing=1 border=0 >
				        <tr>
						    <td width=65 align=center valign=middle bgcolor=d1d1d1>
						        <font face=verdana size=1 color=blue>
						        <b>#insert_Date#</b>				
					        </td>
					        <td width=65 align=center valign=middle bgcolor=d1d1d1>
						        <font face=verdana size=1 color=blue>
						        <b>#insert_Time#</b>				
					        </td>
				        </tr>
                        <tr>
			        </table>
                </td>                    
				<td width=140 align=left valign=top bgcolor=e1e1e1>
	                <a href="./prop_abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Deed submitted</font></a>	
			    </td>		
	            <td width=290 align=left valign=top bgcolor=e1e1e1> 
	                <a href="./prop_abstractor_admin_deed_modify2.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>	
	                &nbsp;&nbsp;
	                <a href="./prop_abstractor_add_deed_delete.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=red face=verdana><b>Delete</b></font></a>	
		        </td>
	        </tr>
        </table>
    </CFOUTPUT> 	
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_sent_mortgage">
    select * 
    from prop_ins_view
	Where prop_id = #url.rec_ID# and selectedOrgs4 = 1
</cfquery> 
		
<cfif #read_sent_mortgage.recordcount# GT 0>
    <CFOUTPUT QUERY="read_sent_mortgage">
        <table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		    <tr>
			    <td width=255 align=left valign=top bgcolor=e1e1e1>
                    <table width=255 cellpadding=1 cellspacing=1 border=0 >
				        <tr>
						    <td width=65 align=center valign=middle bgcolor=d1d1d1>
						        <font face=verdana size=1 color=blue>
						        <b>#insert_Date#</b>				
					        </td>
					        <td width=65 align=center valign=middle bgcolor=d1d1d1>
						    <font face=verdana size=1 color=blue>
						        <b>#insert_Time#</b>				
					        </td>
				        <tr>
			        </table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
	                <a href="./prop_abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Mortgage 1 submitted</font></a>	
			    </td>		
	            <td width=290 align=left valign=top bgcolor=e1e1e1> 
		            <a href="./prop_abstractor_admin_mortgage_modify2.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>	
	                &nbsp;&nbsp;
		            <a href="./prop_abstractor_add_mortgage_delete.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&company_id=0"><font size=1 color=red face=verdana><b>Delete</b></font></a>	
		        </td>
	        </tr>
        </table>
    </CFOUTPUT> 	
</cfif>
		
<CFQUERY datasource="#request.dsn#" NAME="read_sent_mortgage2">
    select * 
    from prop_ins_view
	Where prop_id = #url.rec_ID# and selectedOrgs4 = 2
</cfquery> 
		
<cfif #read_sent_mortgage2.recordcount# GT 0>
    <CFOUTPUT QUERY="read_sent_mortgage2">
        <table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		    <tr>
			    <td width=255 align=left valign=top bgcolor=e1e1e1>
                    <table width=255 cellpadding=1 cellspacing=1 border=0 >
				        <tr>
						    <td width=65 align=center valign=middle bgcolor=d1d1d1>
						        <font face=verdana size=1 color=blue>
						        <b>#insert_Date#</b>				
					        </td>
					        <td width=65 align=center valign=middle bgcolor=d1d1d1>
						        <font face=verdana size=1 color=blue>
						        <b>#insert_Time#</b>				
					        </td>
				        <tr>
			        </table>
	            <td width=140 align=left valign=top bgcolor=e1e1e1>
	                <a href="./prop_abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Mortgage 2 submitted</font></a>	
			    </td>		
	            <td width=290 align=left valign=top bgcolor=e1e1e1> 
		            <a href="./prop_abstractor_admin_mortgage_modify2.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>	
	                &nbsp;&nbsp;
		            <a href="./prop_abstractor_add_mortgage_delete.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&company_id=0"><font size=1 color=red face=verdana><b>Delete</b></font></a>	
		        </td>
	        </tr>
        </table>
    </CFOUTPUT> 	
</cfif>			

<CFQUERY datasource="#request.dsn#" NAME="read_sent_mortgage3">
    select * 
    from prop_ins_view
	Where prop_id = #url.rec_ID# and selectedOrgs4 = 3
</cfquery> 
		
<cfif #read_sent_mortgage3.recordcount# GT 0>
    <CFOUTPUT QUERY="read_sent_mortgage3">
        <table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		    <tr>
			    <td width=255 align=left valign=top bgcolor=e1e1e1>
                    <table width=255 cellpadding=1 cellspacing=1 border=0 >
				        <tr>
						    <td width=65 align=center valign=middle bgcolor=d1d1d1>
						        <font face=verdana size=1 color=blue>
						        <b>#insert_Date#</b>				
					        </td>
					        <td width=65 align=center valign=middle bgcolor=d1d1d1>
						        <font face=verdana size=1 color=blue>
						        <b>#insert_Time#</b>				
					        </td>
				        <tr>
			        </table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
	                <a href="./prop_abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Mortgage 3 submitted</font></a>	
			    </td>		
	            <td width=290 align=left valign=top bgcolor=e1e1e1> 
		            <a href="./prop_abstractor_admin_mortgage_modify2.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>	
	                &nbsp;&nbsp;
		            <a href="./prop_abstractor_add_mortgage_delete.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&company_id=0"><font size=1 color=red face=verdana><b>Delete</b></font></a>	
		        </td>
	        </tr>
        </table>
    </CFOUTPUT> 	
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_sent_mortgage4">
    select * 
    from prop_ins_view
	Where prop_id = #url.rec_ID# and selectedOrgs4 = 4
</cfquery> 
		
<cfif #read_sent_mortgage4.recordcount# GT 0>

<CFOUTPUT QUERY="read_sent_mortgage4">
    <table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>
                <table width=255 cellpadding=1 cellspacing=1 border=0 >
				    <tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						    <font face=verdana size=1 color=blue>
						    <b>#insert_Date#</b>				
					    </td>
					    <td width=65 align=center valign=middle bgcolor=d1d1d1>
						    <font face=verdana size=1 color=blue>
						    <b>#insert_Time#</b>				
					    </td>
				    </tr>
                    <tr>
			    </table>
		    <td width=140 align=left valign=top bgcolor=e1e1e1>
	            <a href="./prop_abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Mortgage 4 submitted</font></a>	
			</td>		
	        <td width=290 align=left valign=top bgcolor=e1e1e1> 
		        <a href="./prop_abstractor_admin_mortgage_modify2.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>	
	            &nbsp;&nbsp;
		        <a href="./prop_abstractor_add_mortgage_delete.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&company_id=0"><font size=1 color=red face=verdana><b><b>Delete</b></b></font></a>	
		    </td>
	    </tr>
    </table>
    </CFOUTPUT> 	
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_sent_mortgage5">
    select * 
    from prop_ins_view
	Where prop_id = #url.rec_ID# and selectedOrgs4 = 5
</cfquery> 
		
<cfif #read_sent_mortgage5.recordcount# GT 0>
    <CFOUTPUT QUERY="read_sent_mortgage5">
        <table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		    <tr>
			    <td width=255 align=left valign=top bgcolor=e1e1e1>
                    <table width=255 cellpadding=1 cellspacing=1 border=0 >
				        <tr>
						    <td width=65 align=center valign=middle bgcolor=d1d1d1>
						        <font face=verdana size=1 color=blue>
						        <b>#insert_Date#</b>				
					        </td>
					        <td width=65 align=center valign=middle bgcolor=d1d1d1>
						        <font face=verdana size=1 color=blue>
						        <b>#insert_Time#</b>				
					        </td>
				        <tr>
			        </table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
	                <a href="./prop_abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Mortgage 5 submitted</font></a>	
			    </td>		
	            <td width=290 align=left valign=top bgcolor=e1e1e1> 
		            <a href="./prop_abstractor_admin_mortgage_modify2.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>	
	                &nbsp;&nbsp;
		            <a href="./prop_abstractor_add_mortgage_delete.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&company_id=0"><font size=1 color=red face=verdana><b>Delete</b></font></a>	
		        </td>
	        </tr>
        </table>
    </CFOUTPUT> 	
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_sent_mortgage6">
    select * 
    from prop_ins_view
	Where prop_id = #url.rec_ID# and selectedOrgs4 = 6
</cfquery> 
		
<cfif #read_sent_mortgage6.recordcount# GT 0>
    <CFOUTPUT QUERY="read_sent_mortgage6">
        <table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		    <tr>
			    <td width=255 align=left valign=top bgcolor=e1e1e1>
                    <table width=255 cellpadding=1 cellspacing=1 border=0 >
				        <tr>
						    <td width=65 align=center valign=middle bgcolor=d1d1d1>
						        <font face=verdana size=1 color=blue>
						        <b>#insert_Date#</b>				
					        </td>
					        <td width=65 align=center valign=middle bgcolor=d1d1d1>
						        <font face=verdana size=1 color=blue>
						        <b>#insert_Time#</b>				
					        </td>
				        <tr>
			        </table>
		        <td width=140 align=left valign=top bgcolor=e1e1e1>
	                <a href="./prop_abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Mortgage 6 submitted</font></a>	
			    </td>		
	            <td width=290 align=left valign=top bgcolor=e1e1e1> 
		            <a href="./prop_abstractor_admin_mortgage_modify2.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>	
	                &nbsp;&nbsp;
		            <a href="./prop_abstractor_add_mortgage_delete.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&company_id=0"><font size=1 color=red face=verdana><b>Delete</b></font></a>	
	    	    </td>
	        </tr>
        </table>
    </CFOUTPUT> 	
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_sent_mortgage7">
    select * 
    from prop_ins_view
	Where prop_id = #url.rec_ID# and selectedOrgs4 = 7
</cfquery> 
		
<cfif #read_sent_mortgage7.recordcount# GT 0>
    <CFOUTPUT QUERY="read_sent_mortgage7">
        <table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		    <tr>
			    <td width=255 align=left valign=top bgcolor=e1e1e1>
                    <table width=255 cellpadding=1 cellspacing=1 border=0 >
				        <tr>
						    <td width=65 align=center valign=middle bgcolor=d1d1d1>
						        <font face=verdana size=1 color=blue>
						        <b>#insert_Date#</b>				
					        </td>
					        <td width=65 align=center valign=middle bgcolor=d1d1d1>
						        <font face=verdana size=1 color=blue>
						        <b>#insert_Time#</b>				
					        </td>
				        <tr>
			        </table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
	                <a href="./prop_abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Mortgage 7 submitted</font></a>	
			    </td>		
	            <td width=290 align=left valign=top bgcolor=e1e1e1> 
		            <a href="./prop_abstractor_admin_mortgage_modify2.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>	
	                &nbsp;&nbsp;
		            <a href="./prop_abstractor_add_mortgage_delete.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&company_id=0"><font size=1 color=red face=verdana><b>Delete</b></font></a>	
		        </td>
	        </tr>
        </table>
    </CFOUTPUT> 	
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_sent_mortgage8">
    select * 
    from prop_ins_view
	Where prop_id = #url.rec_ID# and selectedOrgs4 = 8
</cfquery> 
		
<cfif #read_sent_mortgage8.recordcount# GT 0>
    <CFOUTPUT QUERY="read_sent_mortgage8">
        <table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		    <tr>
			    <td width=255 align=left valign=top bgcolor=e1e1e1>
                    <table width=255 cellpadding=1 cellspacing=1 border=0 >
				        <tr>
						    <td width=65 align=center valign=middle bgcolor=d1d1d1>
						        <font face=verdana size=1 color=blue>
						        <b>#insert_Date#</b>				
					        </td>
					        <td width=65 align=center valign=middle bgcolor=d1d1d1>
						        <font face=verdana size=1 color=blue>
						        <b>#insert_Time#</b>				
        					</td>
				        <tr>
			        </table>
			    <td width=140 align=left valign=top bgcolor=e1e1e1>
	                <a href="./prop_abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Mortgage 8 submitted</font></a>	
			    </td>		
	            <td width=290 align=left valign=top bgcolor=e1e1e1> 
		            <a href="./prop_abstractor_admin_mortgage_modify2.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>	
	                &nbsp;&nbsp;
		            <a href="./prop_abstractor_add_mortgage_delete.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&company_id=0"><font size=1 color=red face=verdana><b>Delete</b></font></a>	
		        </td>
	       </tr>
        </table>
    </CFOUTPUT> 	
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_sent_mortgage9">
    select * 
    from prop_ins_view
	Where prop_id = #url.rec_ID# and selectedOrgs4 = 9
</cfquery> 
		
<cfif #read_sent_mortgage9.recordcount# GT 0>
    <CFOUTPUT QUERY="read_sent_mortgage9">
        <table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		    <tr>
			    <td width=255 align=left valign=top bgcolor=e1e1e1>
                    <table width=255 cellpadding=1 cellspacing=1 border=0 >
				        <tr>
						    <td width=65 align=center valign=middle bgcolor=d1d1d1>
						        <font face=verdana size=1 color=blue>
						        <b>#insert_Date#</b>				
					        </td>
					        <td width=65 align=center valign=middle bgcolor=d1d1d1>
						        <font face=verdana size=1 color=blue>
						        <b>#insert_Time#</b>				
	        				</td>
				        <tr>
			        </table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
	                <a href="./prop_abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Mortgage 9 submitted</font></a>	
			    </td>		
	            <td width=290 align=left valign=top bgcolor=e1e1e1> 
		            <a href="./prop_abstractor_admin_mortgage_modify2.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>	
	                &nbsp;&nbsp;
		            <a href="./prop_abstractor_add_mortgage_delete.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&company_id=0"><font size=1 color=red face=verdana><b>Delete</b></font></a>	
		        </td>
	        </tr>
        </table>
    </CFOUTPUT> 	
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_sent_mortgage10">
    select * 
    from prop_ins_view
	Where prop_id = #url.rec_ID# 
    and selectedOrgs4 = 10
</cfquery> 
		
<cfif #read_sent_mortgage10.recordcount# GT 0>
    <CFOUTPUT QUERY="read_sent_mortgage10">
        <table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		    <tr>
			    <td width=255 align=left valign=top bgcolor=e1e1e1>
                    <table width=255 cellpadding=1 cellspacing=1 border=0 >
				        <tr>
						    <td width=65 align=center valign=middle bgcolor=d1d1d1>
						        <font face=verdana size=1 color=blue>
						        <b>#insert_Date#</b>				
					        </td>
					        <td width=65 align=center valign=middle bgcolor=d1d1d1>
						        <font face=verdana size=1 color=blue>
						        <b>#insert_Time#</b>				
					        </td>
				        <tr>
			        </table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
	                <a href="./prop_abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Mortgage 10 submitted</font></a>	
			    </td>		
	            <td width=290 align=left valign=top bgcolor=e1e1e1> 
		            <a href="./prop_abstractor_admin_mortgage_modify2.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>	
	                &nbsp;&nbsp;
		            <a href="./prop_abstractor_add_mortgage_delete.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&company_id=0"><font size=1 color=red face=verdana><b>Delete</b></font></a>	
		        </td>
	        </tr>
        </table>
    </CFOUTPUT> 	
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_sent_lien">
    select * 
    from prop_ins_view
	Where prop_id = #url.rec_ID# and selectedOrgs3 = 1
</cfquery> 
	
<cfif #read_sent_lien.recordcount# GT 0>
    <CFOUTPUT QUERY="read_sent_lien">
        <table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		    <tr>
			    <td width=255 align=left valign=top bgcolor=e1e1e1>
                    <table width=255 cellpadding=1 cellspacing=1 border=0 >
				        <tr>
						    <td width=65 align=center valign=middle bgcolor=d1d1d1>
						        <font face=verdana size=1 color=blue>
						        <b>#insert_Date#</b>				
					        </td>
					        <td width=65 align=center valign=middle bgcolor=d1d1d1>
						        <font face=verdana size=1 color=blue>
						        <b>#insert_Time#</b>				
					        </td>
				        <tr>
			        </table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
	                <a href="./prop_abstractor_add_lien_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Lien 1 submitted</font></a>	
			    </td>		
	            <td width=290 align=left valign=top bgcolor=e1e1e1> 
		            <a href="./prop_abstractor_admin_lien_modify2.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>	
	                &nbsp;&nbsp;
		            <a href="./prop_abstractor_add_lien_delete.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&company_id=0"><font size=1 color=red face=verdana><b>Delete</b></font></a>	
		        </td>
	        </tr>
        </table>
    </CFOUTPUT> 	
</cfif>
		
<CFQUERY datasource="#request.dsn#" NAME="read_sent_lien2">
    select * 
    from prop_ins_view
	Where prop_id = #url.rec_ID# 
    and selectedOrgs3 = 2
</cfquery> 
		
<cfif #read_sent_lien2.recordcount# GT 0>
    <CFOUTPUT QUERY="read_sent_lien2">
        <table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		    <tr>
			    <td width=255 align=left valign=top bgcolor=e1e1e1>
                    <table width=255 cellpadding=1 cellspacing=1 border=0 >
				        <tr>
						    <td width=65 align=center valign=middle bgcolor=d1d1d1>
						        <font face=verdana size=1 color=blue>
						        <b>#insert_Date#</b>				
					        </td>
					        <td width=65 align=center valign=middle bgcolor=d1d1d1>
						        <font face=verdana size=1 color=blue>
						        <b>#insert_Time#</b>				
					        </td>
				        <tr>
			        </table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
	                <a href="./prop_abstractor_add_lien_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Lien 2 submitted</font></a>	
			    </td>		
	            <td width=290 align=left valign=top bgcolor=e1e1e1> 
		            <a href="./prop_abstractor_admin_lien_modify2.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>	
	                &nbsp;&nbsp;
		            <a href="./prop_abstractor_add_lien_delete.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&company_id=0"><font size=1 color=red face=verdana><b>Delete</b></font></a>	
		        </td>
	        </tr>
        </table>
    </CFOUTPUT> 	
</cfif>
		
<CFQUERY datasource="#request.dsn#" NAME="read_sent_lien3">
    select * 
    from prop_ins_view
	Where prop_id = #url.rec_ID# 
    and selectedOrgs3 = 3
</cfquery> 
		
<cfif #read_sent_lien3.recordcount# GT 0>
    <CFOUTPUT QUERY="read_sent_lien3">
        <table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		    <tr>
			    <td width=255 align=left valign=top bgcolor=e1e1e1>
                    <table width=255 cellpadding=1 cellspacing=1 border=0 >
				        <tr>
						    <td width=65 align=center valign=middle bgcolor=d1d1d1>
						        <font face=verdana size=1 color=blue>
						        <b>#insert_Date#</b>				
					        </td>
					        <td width=65 align=center valign=middle bgcolor=d1d1d1>
						        <font face=verdana size=1 color=blue>
						        <b>#insert_Time#</b>				
					        </td>
				        <tr>
			        </table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
	                <a href="./prop_abstractor_add_lien_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Lien 3 submitted</font></a>	
			    </td>		
	            <td width=290 align=left valign=top bgcolor=e1e1e1> 
		            <a href="./prop_abstractor_admin_lien_modify2.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>	
	                &nbsp;&nbsp;
		            <a href="./prop_abstractor_add_lien_delete.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&company_id=0"><font size=1 color=red face=verdana><b>Delete</b></font></a>	
	    	    </td>
	        </tr>
        </table>
    </CFOUTPUT> 	
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_sent_lien4">
    select * 
    from prop_ins_view
	Where prop_id = #url.rec_ID# 
    and selectedOrgs3 = 4
</cfquery> 
		
<cfif #read_sent_lien4.recordcount# GT 0>
    <CFOUTPUT QUERY="read_sent_lien4">
        <table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		    <tr>
			    <td width=255 align=left valign=top bgcolor=e1e1e1>
                    <table width=255 cellpadding=1 cellspacing=1 border=0 >
				        <tr>
						    <td width=65 align=center valign=middle bgcolor=d1d1d1>
						        <font face=verdana size=1 color=blue>
						        <b>#insert_Date#</b>				
					        </td>
					        <td width=65 align=center valign=middle bgcolor=d1d1d1>
						        <font face=verdana size=1 color=blue>
						        <b>#insert_Time#</b>				
					        </td>
				        <tr>
			        </table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
	                <a href="./prop_abstractor_add_lien_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Lien 4 submitted</font></a>	
			    </td>		
	            <td width=290 align=left valign=top bgcolor=e1e1e1> 
		            <a href="./prop_abstractor_admin_lien_modify2.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>	
	                &nbsp;&nbsp;
		            <a href="./prop_abstractor_add_lien_delete.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&company_id=0"><font size=1 color=red face=verdana><b>Delete</b></font></a>	
		        </td>
	        </tr>
        </table>
    </CFOUTPUT> 	
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_sent_lien5">
    select * 
    from prop_ins_view
	Where prop_id = #url.rec_ID# and selectedOrgs3 = 5
</cfquery> 
		
<cfif #read_sent_lien5.recordcount# GT 0>
    <CFOUTPUT QUERY="read_sent_lien5">
        <table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		    <tr>
			    <td width=255 align=left valign=top bgcolor=e1e1e1>
                    <table width=255 cellpadding=1 cellspacing=1 border=0 >
				        <tr>
						    <td width=65 align=center valign=middle bgcolor=d1d1d1>
						        <font face=verdana size=1 color=blue>
						        <b>#insert_Date#</b>				
					        </td>
					        <td width=65 align=center valign=middle bgcolor=d1d1d1>
						        <font face=verdana size=1 color=blue>
						        <b>#insert_Time#</b>				
					        </td>
				        <tr>
			        </table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
	                <a href="./prop_abstractor_add_lien_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Lien 5 submitted</font></a>	
			    </td>		
	            <td width=290 align=left valign=top bgcolor=e1e1e1> 
		            <a href="./prop_abstractor_admin_lien_modify2.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>	
	                &nbsp;&nbsp;
		            <a href="./prop_abstractor_add_lien_delete.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&company_id=0"><font size=1 color=red face=verdana><b>Delete</b></font></a>	
		        </td>
	        </tr>
        </table>
    </CFOUTPUT> 	
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_sent_lien6">
    select * 
    from prop_ins_view
	Where prop_id = #url.rec_ID# and selectedOrgs3 = 6
</cfquery> 
		
<cfif #read_sent_lien6.recordcount# GT 0>
    <CFOUTPUT QUERY="read_sent_lien6">
        <table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		    <tr>
			    <td width=255 align=left valign=top bgcolor=e1e1e1>
                    <table width=255 cellpadding=1 cellspacing=1 border=0 >
			    	    <tr>
						    <td width=65 align=center valign=middle bgcolor=d1d1d1>
						        <font face=verdana size=1 color=blue>
						        <b>#insert_Date#</b>				
					        </td>
					        <td width=65 align=center valign=middle bgcolor=d1d1d1>
						        <font face=verdana size=1 color=blue>
						        <b>#insert_Time#</b>				
					        </td>
				        <tr>
			        </table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
	                <a href="./prop_abstractor_add_lien_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Lien 6 submitted</font></a>	
			    </td>		
	            <td width=290 align=left valign=top bgcolor=e1e1e1> 
		            <a href="./prop_abstractor_admin_lien_modify2.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>	
	                &nbsp;&nbsp;
		            <a href="./prop_abstractor_add_lien_delete.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&company_id=0"><font size=1 color=red face=verdana><b>Delete</b></font></a>	
		        </td>
	        </tr>
        </table>
    </CFOUTPUT>  	
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_sent_lien7">
	select * 
    from prop_ins_view
	Where prop_id = #url.rec_ID# and selectedOrgs3 = 7
</cfquery> 
		
<cfif #read_sent_lien7.recordcount# GT 0>
    <CFOUTPUT QUERY="read_sent_lien7">
        <table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		    <tr>
			    <td width=255 align=left valign=top bgcolor=e1e1e1>
                    <table width=255 cellpadding=1 cellspacing=1 border=0 >
				        <tr>
						    <td width=65 align=center valign=middle bgcolor=d1d1d1>
						        <font face=verdana size=1 color=blue>
						        <b>#insert_Date#</b>				
	        				</td>
			        		<td width=65 align=center valign=middle bgcolor=d1d1d1>
					        	<font face=verdana size=1 color=blue>
						        <b>#insert_Time#</b>				
					        </td>
				        <tr>
			        </table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
	                <a href="./prop_abstractor_add_lien_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Lien 7 submitted</font></a>	
			    </td>		
	            <td width=290 align=left valign=top bgcolor=e1e1e1> 
		            <a href="./prop_abstractor_admin_lien_modify2.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>	
	                &nbsp;&nbsp;
		            <a href="./prop_abstractor_add_lien_delete.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&company_id=0"><font size=1 color=red face=verdana><b>Delete</b> </font></a>	
		        </td>
	        </tr>
        </table>
    </CFOUTPUT> 	
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_sent_lien8">
    select * 
    from prop_ins_view
	Where prop_id = #url.rec_ID# 
    and selectedOrgs3 = 8
</cfquery> 
	
<cfif #read_sent_lien8.recordcount# GT 0>
    <CFOUTPUT QUERY="read_sent_lien8">
        <table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		    <tr>
			    <td width=255 align=left valign=top bgcolor=e1e1e1>
                    <table width=255 cellpadding=1 cellspacing=1 border=0 >
				        <tr>
						    <td width=65 align=center valign=middle bgcolor=d1d1d1>
						        <font face=verdana size=1 color=blue>
						        <b>#insert_Date#</b>				
					        </td>
					        <td width=65 align=center valign=middle bgcolor=d1d1d1>
						        <font face=verdana size=1 color=blue>
						        <b>#insert_Time#</b>				
					        </td>
				        <tr>
			        </table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
	                <a href="./prop_abstractor_add_lien_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Lien 8 submitted</font></a>	
			    </td>		
	            <td width=290 align=left valign=top bgcolor=e1e1e1> 
		            <a href="./prop_abstractor_admin_lien_modify2.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>	
	                &nbsp;&nbsp;
		            <a href="./prop_abstractor_add_lien_delete.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&company_id=0"><font size=1 color=red face=verdana><b>Delete</b></font></a>	
		        </td>
	        </tr>
        </table>
    </CFOUTPUT> 	
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_sent_lien9">
    select * 
    from prop_ins_view
	Where prop_id = #url.rec_ID# 
    and selectedOrgs3 = 9
</cfquery> 

<cfif #read_sent_lien9.recordcount# GT 0>
    <CFOUTPUT QUERY="read_sent_lien9">
        <table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		    <tr>
			    <td width=255 align=left valign=top bgcolor=e1e1e1>
                    <table width=255 cellpadding=1 cellspacing=1 border=0 >
				        <tr>
						    <td width=65 align=center valign=middle bgcolor=d1d1d1>
						        <font face=verdana size=1 color=blue>
						        <b>#insert_Date#</b>				
					        </td>
					        <td width=65 align=center valign=middle bgcolor=d1d1d1>
						        <font face=verdana size=1 color=blue>
						        <b>#insert_Time#</b>				
					        </td>
				        <tr>
			        </table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
	                <a href="./prop_abstractor_add_lien_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Lien 9 submitted</font></a>	
			    </td>		
	            <td width=290 align=left valign=top bgcolor=e1e1e1> 
		           <a href="./prop_abstractor_admin_lien_modify2.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>	
	                &nbsp;&nbsp;
		            <a href="./prop_abstractor_add_lien_delete.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&company_id=0"><font size=1 color=red face=verdana><b>Delete</b></font></a>	
		        </td>
	        </tr>
        </table>
    </CFOUTPUT> 	
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_sent_lien10">
    select * from prop_ins_view
	Where prop_id = #url.rec_ID# and selectedOrgs3 = 10
</cfquery> 
		
<cfif #read_sent_lien10.recordcount# GT 0>
    <CFOUTPUT QUERY="read_sent_lien10">
        <table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		    <tr>
			    <td width=255 align=left valign=top bgcolor=e1e1e1>
                    <table width=255 cellpadding=1 cellspacing=1 border=0 >
				        <tr>
						    <td width=65 align=center valign=middle bgcolor=d1d1d1>
						        <font face=verdana size=1 color=blue>
						        <b>#insert_Date#</b>				
					        </td>
					        <td width=65 align=center valign=middle bgcolor=d1d1d1>
						        <font face=verdana size=1 color=blue>
						        <b>#insert_Time#</b>				
					        </td>
				        <tr>
			        </table>
			    <td width=140 align=left valign=top bgcolor=e1e1e1>
	                <a href="./prop_abstractor_add_lien_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Lien 10 submitted</font></a>	
			    </td>		
	            <td width=290 align=left valign=top bgcolor=e1e1e1> 
		            <a href="./prop_abstractor_admin_lien_modify2.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>	
	                &nbsp;&nbsp;
		            <a href="./prop_abstractor_add_lien_delete.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>	
		        </td>
	        </tr>
        </table>
    </CFOUTPUT> 	
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_com">
    select * 
    from Doc_Title_Insurance_prop
	Where prop_id = #url.rec_ID#
</cfquery>

<CFQUERY datasource="#request.dsn#" NAME="read_user">
    select * 
    from first_admin
	WHERE id = '#read_com.a_recieved_by#'
</cfquery>

    <table width="99%" cellpadding=1 cellspacing=1 border=0 >
	    <tr>
		    <td width="98%" align=center valign=middle bgcolor=d1d1d1>
			    <br>
                <br>
				<b><font face=verdana size=2 color=black>View/Mark as sent <cfoutput><a href="./legal_vesting_report_submit.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&company_id=0"><font size=1 color=blue face=verdana>Legal Vesting Report</font></a> </cfoutput></font></b>
	        </td>
	    </tr>
		<tr>
		    <td width="98%" align=center valign=middle bgcolor=d1d1d1>
			    <br>
				<cfif #read_com.s_status# eq 1>
				    <b><font face=verdana size=2 color=red>Legal Vesting Report is marked as sent </b></font><cfoutput><b><font face=verdana size=2 color=blue>#DateFormat(read_com.a_recieved_date, "mm-dd-yyyy")# at #TimeFormat(read_com.a_recieved_time, "hh:mm tt")# by #read_user.fname# #read_user.lname#<font></b></cfoutput> 
				<cfelse>
                    <b><font face=verdana size=2 color=blue>Legal Vesting Report is NOT YET marked as sent</font></b>
                </cfif>
	        </td>
		</tr>
    </table>
<cfelse>
    <table width="99%" cellpadding=1 cellspacing=1 border=0 >
	    <tr>
		    <td width="98%" align=center valign=middle bgcolor=d1d1d1>
			    <p><br>
				<font face=verdana size=2 color=red>
				<b>Legal Vesting Report for this order has not yet been prepared. To do so you first need to upload an abstract file under "abstract" button and then go to the view area of that file where the "Legal Vesting Form" is located </b><br></p>		
		    </td>
        </tr>
    </table>
</cfif>
</td>
</tr>
</table>
</TD>
</TR>
</table>
</BODY>
</HTML>