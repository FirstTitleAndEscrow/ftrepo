<cfif action EQ 1>
<CFQUERY datasource="#request.dsn#" NAME="getclosings">
	select * from eventlist
	where c_day = '#dateformat(now(),"dd")#'
	AND c_month = '#dateformat(now(),"mm")#'
	AND c_year = '#dateformat(now(),"yyyy")#'
	AND cltext1 <> 1
</cfquery>
<cfoutput query="getclosings">
	<cfset cltime = createDateTime(dateformat(now(),"yyyy"),dateformat(now(),"mm"),dateformat(now(),"dd"),timeformat(c_time,"HH"),timeformat(c_time,"mm"),timeformat(c_time,"ss"))>
	<cfif DateDiff("h",now(),cltime) EQ 1 or title_id EQ 52555>
		
		<cfhttp url="http://machine1.firsttitleservices.com/client/closingscheduler.cfm?a=2&rec_id=#title_id#"/>
		<CFQUERY datasource="#request.dsn#" NAME="upclosings">
			update eventlist 
			set cltext1 = 1
			where title_id = #title_id#
		</cfquery>
	</cfif>
</cfoutput>
</cfif>
<cfif action EQ 2>
<CFQUERY datasource="#request.dsn#" NAME="getclosings">
	select * from eventlist
	where c_day = '#dateformat(now(),"dd")#'
	AND c_month = '#dateformat(now(),"mm")#'
	AND c_year = '#dateformat(now(),"yyyy")#'
	AND cltext2 <> 1
</cfquery>
<cfoutput query="getclosings">
	<cfset cltime = createDateTime(dateformat(now(),"yyyy"),dateformat(now(),"mm"),dateformat(now(),"dd"),timeformat(c_time,"HH"),timeformat(c_time,"mm"),timeformat(c_time,"ss"))>
	<cfif DateDiff("h",now(),cltime) EQ -1 or title_id EQ 52555>
		http://machine1.firsttitleservices.com/client/closingscheduler.cfm?a=3&rec_id=#title_id#
		<cfhttp url="http://machine1.firsttitleservices.com/client/closingscheduler.cfm?a=3&rec_id=#title_id#"/>
		<CFQUERY datasource="#request.dsn#" NAME="upclosings">
			update eventlist 
			set cltext2 = 1
			where title_id = #title_id#
		</cfquery>
	</cfif>
</cfoutput>
</cfif>