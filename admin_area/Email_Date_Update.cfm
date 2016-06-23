<CFQUERY datasource="#request.dsn#" NAME="update_email_date">
				Update Title 
				set email_date = #Now()#
				FROM         Title LEFT OUTER JOIN
                      Companies ON Title.comp_id = Companies.ID LEFT OUTER JOIN
                      Doc_Closer_Title ON Title.Title_ID = Doc_Closer_Title.TITLE_ID LEFT OUTER JOIN
                      EventList ON Title.Title_ID = EventList.Title_id
				WHERE     (EventList.YearMonth >= CONVERT(DATETIME, '2004-05-12 00:00:00', 102)) AND (Doc_Closer_Title.closing_instructions IS NOT NULL) AND 
                      (Doc_Closer_Title.final_HUD IS NULL) AND (Title.email_date IS NULL)
</CFQUERY>

