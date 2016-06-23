						<CFSET a_temp_item_counter_1 = "1">
						<CFSET rec_id = 37>
						<CFQUERY datasource="#request.dsn#">		
							INSERT INTO Title_Committment_Clauses_Selected_Title(Title_ID, Committment_Item, Committment_Name, a_section_code, Committment_Item_Order)
							VALUES(#rec_id#, 'The estate or interest in the land described or referred to in the committment and covered herein is [ Pick One -> Fee Simple - Leasehold - Life Estate - Term for Years ] <p>Deed in proper form from [ SELLER 1 ], [ SELLER 2 ] vesting fee simple title in [ BUYER 1 ], [ BUYER 2 ].', 'aa_default', 'A2', 2)
						</CFQUERY>
							<!--- ================================================================= --->
						<CFQUERY datasource="#request.dsn#">		
							INSERT INTO Title_Committment_Clauses_Selected_Title(Title_ID, 		Committment_Item, Committment_Name, a_section_code, Committment_Item_Order)
							VALUES(#rec_id#, 'Instrument(s) creating the estate or interest to be insured must be approved, executed and filed for record, to wit:', 'aa_default', 'B1', 1)
						</CFQUERY>
							<!--- ================================================================= --->
						<CFQUERY datasource="#request.dsn#">		
							INSERT INTO Title_Committment_Clauses_Selected_Title(Title_ID, 		Committment_Item, Committment_Name, a_section_code, Committment_Item_Order)
							VALUES(#rec_id#, 'Indenture of Mortgage from [ BUYER 1 ], [ BUYER 2 ] to [ PAYOFF LENDER 1 ], [ PAYOFF LENDER 2 ] securing repayment of the original principal amount of  $ [ LOAN AMOUNT ]', 'aa_default', 'B11', 1)
						</CFQUERY>
							<!--- ================================================================= --->
						<CFQUERY datasource="#request.dsn#">		
							INSERT INTO Title_Committment_Clauses_Selected_Title(Title_ID, 		Committment_Item, Committment_Name, a_section_code, Committment_Item_Order)
							VALUES(#rec_id#, 'Payment of the full consideration to, or for the account of, the grantors or mortgagors.', 'aa_default', 'B1', 2)
						</CFQUERY>
							<!--- ================================================================= --->
						<CFQUERY datasource="#request.dsn#">		
							INSERT INTO Title_Committment_Clauses_Selected_Title(Title_ID, 		Committment_Item, Committment_Name, a_section_code, Committment_Item_Order)
							VALUES(#rec_id#, 'Payment of all taxes, charges, assessments, levied and assessed against subject premises, which are due and payable.', 'aa_default', 'B1', 3)
						</CFQUERY>
							<!--- ================================================================= --->
						<CFQUERY datasource="#request.dsn#">		
							INSERT INTO Title_Committment_Clauses_Selected_Title(Title_ID, 		Committment_Item, Committment_Name, a_section_code, Committment_Item_Order)
							VALUES(#rec_id#, 'Satisfactory evidence should be had that improvements and/or repairs or alterations thereto are completed; that contractor, subcontractors, labor and materialmen are all paid.', 'aa_default', 'B1', 4)
						</CFQUERY>
							<!--- ================================================================= --->
						<CFQUERY datasource="#request.dsn#">		
							INSERT INTO Title_Committment_Clauses_Selected_Title(Title_ID, 		Committment_Item, Committment_Name, a_section_code, Committment_Item_Order)
							VALUES(#rec_id#, 'Exceptions 3 and 4 of Schedule B - Section 2 of this committment may be amended in, or deleted from the policy to be issued if a survey, satisfactory to the company, is furnished to the company.', 'aa_default', 'B1', 5)
						</CFQUERY>
							<!--- ================================================================= --->
						<CFQUERY datasource="#request.dsn#">		
							INSERT INTO Title_Committment_Clauses_Selected_Title(Title_ID, 		Committment_Item, Committment_Name, a_section_code, Committment_Item_Order)
							VALUES(#rec_id#, 'Defects, liens, encumbrances, adverse claims or other matters, if any, created, first appearing in the public records or attaching subsequent to the effective date hereof but prior to the date the proposed Insured acquires for value of record the estate or interest or mortgage thereon covered by this committment.', 'aa_default', 'B2', 1)
						</CFQUERY>
							<!--- ================================================================= --->
						<CFQUERY datasource="#request.dsn#">		
							INSERT INTO Title_Committment_Clauses_Selected_Title(Title_ID, 		Committment_Item, Committment_Name, a_section_code, Committment_Item_Order)
							VALUES(#rec_id#, 'Rights or claims of parties in possession not shown by the public records. ', 'aa_default', 'B2', 2)
						</CFQUERY>
							<!--- ================================================================= --->
						<CFQUERY datasource="#request.dsn#">		
							INSERT INTO Title_Committment_Clauses_Selected_Title(Title_ID, 		Committment_Item, Committment_Name, a_section_code, Committment_Item_Order)
							VALUES(#rec_id#, 'Encroachments, overlaps, boundary line disputes, and other matters which would be disclosed by an accurate survey and inspection of the premises.', 'aa_default', 'B2', 3)
						</CFQUERY>
							<!--- ================================================================= --->
						<CFQUERY datasource="#request.dsn#">		
							INSERT INTO Title_Committment_Clauses_Selected_Title(Title_ID, 		Committment_Item, Committment_Name, a_section_code, Committment_Item_Order)
							VALUES(#rec_id#, 'Easements or claims of easements not shown by the public records.', 'aa_default', 'B2', 4)
						</CFQUERY>
							<!--- ================================================================= --->
						<CFQUERY datasource="#request.dsn#">		
							INSERT INTO Title_Committment_Clauses_Selected_Title(Title_ID, 		Committment_Item, Committment_Name, a_section_code, Committment_Item_Order)
							VALUES(#rec_id#, 'Taxes or special assessments which are not shown as existing liens by the public records.', 'aa_default', 'B2', 5)
						</CFQUERY>
							<!--- ================================================================= --->
						<CFQUERY datasource="#request.dsn#">		
							INSERT INTO Title_Committment_Clauses_Selected_Title(Title_ID, 		Committment_Item, Committment_Name, a_section_code, Committment_Item_Order)
							VALUES(#rec_id#, 'Taxes and assessments for the year [ ENTER YEAR ], and subsequent years, which are not yet due and payable.', 'aa_default', 'B2', 6)
						</CFQUERY>
							<!--- ================================================================= --->
