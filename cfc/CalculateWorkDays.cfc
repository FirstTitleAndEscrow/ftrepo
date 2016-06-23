<cfcomponent hint="Calculate the work days for a given date range" output="false">
	<cfset Refer_startTime = TimeFormat(ParseDateTime('01/01/2000 09:00 AM'), 'HH:mm') >
	<cfset Refer_endTime = TimeFormat(ParseDateTime('01/01/2000 06:00 PM'), 'HH:mm')>
	<cfset SetDefault_starttime= "09:00 AM">	
	<cfset SetDefault_endtime= "06:00 PM">
	<cfset FedHolidaysList="">
	
	<cffunction name="ElapsedTime" displayname="Time Elapsed between On Hold and On Hold removed on a work day" access="public" output="false" returntype="Struct">
		<cfargument name="Startdate_time" type="date" required="true" />
		<cfargument name="Enddate_time" type="date" required="true" />
		<cfargument name="rec_id" type="numeric" required="true" />
			<!--- TODO: Implement Method --->
			<cfif DateCompare(arguments.Startdate_time,arguments.Enddate_time,"d") neq 1>
					<cfset TotalWorkInMins=0>
					<cfset TotalHoldMins =0>
					<cfset EffectiveWorkmins=0>
					<cfset WorkingDates=StructNew()>
					
						<!--- Returns liat of dates of Federal Holidays for a given Start and Ends dates --->
					<cfquery datasource="#request.dsn#" name="FedHolidayDates">							
							Select * from FedholidayDates where FHDate between <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.Startdate_time#"> and <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.Enddate_time#"> order by FHDate asc
					</cfquery>
					
					<cfset FedHolidaysList = ValueList(FedHolidayDates.FHDate,",")>	
					
					<cfset StartWorkDay= NextWorkDay(arguments.Startdate_time, arguments.Enddate_time)>
																				
					<cfset EndWorkDay=PreviousWorkDay(arguments.Startdate_time, arguments.Enddate_time)>										
							
						<cfif datecompare(StartWorkDay,EndWorkDay,"d") lte 0>																					
						<cfset act_startdate= StartWorkDay>
						<cfset act_enddate= EndWorkDay>
						
							<!--- Calulating the Total Working Minutes --->
						<cfset TotalWorkInMins= CalcWorkMins(StartWorkDay,EndWorkDay) >	
						
						<cfset ListOfOnHolds= GetListOfOnHolds(ParseDateTime(DateFormat(Startdate_time,"mm-dd-yyyy")),ParseDateTime(DateFormat(Enddate_time,"mm-dd-yyyy")),rec_id)>								
						<!---<cfdump var="#ListOfOnHolds#">
						 <cfabort> --->
						<cfif isQuery(ListOfOnHolds)>
							<cfloop query="ListOfOnHolds">
								<cfquery datasource="#request.dsn#" name="ListOfOnHoldRemoved">
									select top 1 Note_ID, N_Date + N_Time as OnHoldRemovedTime from Title_Notes where Order_ID=<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.rec_id#">
									and N_Note like 'On Hold Removed%' and Note_ID > <cfqueryparam cfsqltype="cf_sql_integer" value="#ListOfOnHolds.Note_ID#"> order by Note_ID
								</cfquery>	
												<!--- Calculating the Total Elapsed Time --->				
										<cfif ListOfOnHoldRemoved.recordCount eq 0>
											<cfset OnHolddate= NextWorkDay(ListOfOnHolds.OnHoldTime,arguments.Enddate_time)>
											<cfset OnHoldRemovedDate=PreviousWorkDay(ListOfOnHolds.OnHoldTime,arguments.Enddate_time)>												
										<cfelse>
											<cfset OnHolddate= NextWorkDay(ListOfOnHolds.OnHoldTime,ListOfOnHoldRemoved.OnHoldRemovedTime)>
											<cfset OnHoldRemovedDate=PreviousWorkDay(ListOfOnHolds.OnHoldTime,ListOfOnHoldRemoved.OnHoldRemovedTime)>
											
											<!---<cfset ListOfOnHolds.OnHoldTime= Enddate_time,"mm-dd-yyyy"))>--->
											<!---<cfset ListOfOnHoldRemoved.OnHoldRemovedTime =arguments.Enddate_time>--->
											<!---<cfdump var="#ListOfOnHolds#" >
											<cfabort>--->
										</cfif>
										
									
										
										<cfif OnHolddate lte OnHoldRemovedDate >
											<cfset TotalHoldMins = TotalHoldMins + CalcWorkMins(OnHolddate,OnHoldRemovedDate)>
										</cfif>									
							</cfloop>
						</cfif>
									<cfset EffectiveWorkmins=TotalWorkInMins - TotalHoldMins>
						<!--- <cfabort /> --->
						</cfif>	
						
					</cfif>
<cfparam name="totalworkinmins" default="0">					
<cfparam name="TotalHoldMins" default="0">					
<cfparam name="StartWorkDay" default="0">					
<cfparam name="EndWorkDay" default="0">					
<cfparam name="EffectiveWorkmins" default="0">					
					<cfset WorkingDates.TotalWorkInMins=TotalWorkInMins >
							<cfset WorkingDates.TotalHoldRemovedMins=TotalHoldMins >
							<cfset WorkingDates.StartWorkDay=StartWorkDay >
							<cfset WorkingDates.EndWorkDay=EndWorkDay >
							<cfset WorkingDates.EffectiveWorkmins=EffectiveWorkmins>
			
			<cfreturn WorkingDates />
	</cffunction>

	<cffunction name="CalcWorkMins" displayname="Return actual working hours in mins" access="private" output="false" returntype="numeric">
                                <cfargument name="Startdate_time" type="date" required="true" />
                                <cfargument name="Enddate_time" type="date" required="true" />
                                <!--- TODO: Implement Method --->
                                <cfset act_startdate= ParseDateTime(DateFormat(Startdate_time,"mm-dd-yyyy"))>
                                <cfset act_enddate= ParseDateTime(DateFormat(Enddate_time,"mm-dd-yyyy"))>
                                <cfset act_starttime= TimeFormat(Startdate_time,"HH:mm")>
                                <cfset act_endtime= TimeFormat(Enddate_time, "HH:mm")>                   
                                 <!--- <CFdump var="#act_starttime#">
								 <cfdump var="#act_endtime#"> --->
								                
                                <cfset MinutesOfWork= 0>
                                                                
                                <cfloop from = #act_startdate# to = #act_enddate# index="DtIndex" step="1">
                                                                
                                      <cfif DayOfWeek(Parsedatetime(DateFormat(DtIndex,"mm-dd-yyyy"))) eq 1 OR DayOfWeek(Parsedatetime(DateFormat(DtIndex,"mm-dd-yyyy"))) eq 7>                                                                           
                                                           <!-- Do Nothing --->  														                                      
                                      <cfelseif Listfind(FedHolidaysList,DateFormat(DtIndex,"yyyy-mm-dd")) >                                                                                            
                                                           <!-- Do Nothing --->  												
                                      <cfelse>
											<cfif act_startdate eq act_enddate>
																						
												<cfset MinutesOfWork= DateDiff("n",act_starttime,act_endtime)>
											 	<cfreturn MinutesOfWork > 
											<cfelse>
												<cfif DateFormat(DtIndex,"mm-dd-yyyy") eq act_startdate>
													<cfset MinutesOfWork= MinutesOfWork + DateDiff("n",act_starttime,Refer_endTime)>
												<cfelseif DateFormat(DtIndex,"mm-dd-yyyy") eq act_enddate>
													<cfset MinutesOfWork= MinutesOfWork + DateDiff("n",Refer_startTime,act_endTime)>
												<cfelse>
													<cfset MinutesOfWork= MinutesOfWork + (9* 60)>
												</cfif>										
													
											</cfif>
                                                                                                                        
                                      </cfif>                                                      
                                      	
                           			</cfloop>
                               
                                <cfreturn MinutesOfWork >                       
                </cffunction>

	
	<cffunction name="FedHolidaydates" displayname="Returns an array of dates of Federal Holidays for a given year" access="private" output="false" returntype="date">
		<cfargument name="startdate" type="date" required="true" />
		<cfargument name="enddate" type="date" required="true" />
				
		<cfquery datasource="#request.dsn#" name="FedHolidayDates">							
				Select * from FedholidayDates where FHDate between <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.startdate#"> and <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.enddate#"> order by FHDate asc
		</cfquery>
		
		<cfset FedHolidaysList = ValueList(FedHolidayDates.FHDate,",")>
		<!--- <cfset FedHolidays= ListToArray(FedHolidaysList)> --->		
		<cfreturn FedHolidaysList >
		
	</cffunction>
	
	<cffunction name="NextWorkDay" access="private" output="false" returntype="date">
		<cfargument name="sdate" type="date" default="">
		<cfargument name="edate" type="date" default="">
		<cfset startdate=DateFormat(sdate, "mm-dd-yyyy")>
		<cfset startTime=TimeFormat(sdate, "HH:mm")>
		<cfset enddate= DateFormat(edate, "mm-dd-yyyy")>
		
			<cfloop index = "count" from = "#startdate#" to = "#enddate#" step="1"> 
								
									<!--- Check to see if the start time falls before 9 AM --->  
							<cfif startTime lt Refer_startTime>
                                  <cfset startTime= TimeFormat(SetDefault_starttime,"HH:mm")> 
								<!--- Check to see if the start time is after 6 pm  --->        
                           <cfelseif startTime gt Refer_endTime>                                              
                                  <cfset startdate =ParseDateTime(DateFormat(DateAdd("d",1,ParseDateTime(startdate)),"mm-dd-yyyy"))>
                                  <cfset startTime= TimeFormat(SetDefault_starttime,"HH:mm")>
                           </cfif>
                           	
								<!--- This condition will check if the startdate falls on any weekend --->
                           <cfif DayOfWeek(startdate) eq 1 OR DayOfWeek(startdate) eq 7> 
                                  <cfset startdate = ParseDateTime(DateFormat(DateAdd("d",1,ParseDateTime(startdate)),"mm-dd-yyyy"))>
                                  <cfset startdate= ParseDateTime(DateFormat(startdate,"mm-dd-yyyy") & " " & SetDefault_starttime)>
								<!--- This condition will check if the Federal Holiday falls on a weekend/weekday and return the next working day for a given start date --->
                           <cfelseif ListFind(FedHolidaysList, DateFormat(startdate,"yyyy-mm-dd"))>
                                  <cfset startdate = ParseDateTime(DateFormat(DateAdd("d",1,ParseDateTime(startdate)),"mm-dd-yyyy"))>
                                  <cfset startdate= ParseDateTime(DateFormat(startdate,"mm-dd-yyyy") & " " & SetDefault_starttime)>
								
                           <cfelse>
                                  <cfset startdate= ParseDateTime(startdate & " " & startTime)> <!--- a) startdate is a working day and starttime is between 9am and 6pm ---> 
                                      
                                  <cfbreak/>
                           </cfif> 						
							<!--- <cfset startdate=DateFormat(DateAdd("d",1,ParseDateTime(startdate)),"mm-dd-yyyy")> --->
					</cfloop>					
						
		<cfreturn startdate>
				
	</cffunction>
	
	<cffunction name="PreviousWorkDay" access="private" output="false" returntype="date">
		<cfargument name="sdate" type="date" default="">
		<cfargument name="edate" type="date" default="">
		
		<cfset enddate=ParseDateTime(DateFormat(edate,"mm-dd-yyyy"))>
		<cfset endTime=TimeFormat(edate,"HH:mm")>
		<cfset startdate=ParseDateTime(DateFormat(sdate,"mm-dd-yyyy"))>
							 
					<cfloop index = "Count" from = "#enddate#" to = "#startdate#" step="-1">
													
						 <cfif endTime lt TimeFormat(ParseDateTime(Refer_startTime), 'HH:mm')>
                                  <cfset enddate = ParseDateTime(DateFormat(DateAdd("d",-1,#enddate#),"mm-dd-yyyy"))>
                                  <cfset endTime= TimeFormat(SetDefault_endtime,"HH:mm")>  

                           <cfelseif endTime gt TimeFormat(ParseDateTime(Refer_endTime), 'HH:mm')>                                                
                                  <cfset endTime=TimeFormat(SetDefault_endtime,"HH:mm")>
						   </cfif>
                            
                           <cfif DayOfWeek(enddate) eq 1 OR DayOfWeek(enddate) eq 7>     
                                  <cfset enddate = ParseDateTime(DateFormat(DateAdd("d",-1,#enddate#),"mm-dd-yyyy"))>
                                  <cfset endTime=TimeFormat(SetDefault_endtime,"HH:mm")>							
                           <cfelseif ListFind(FedHolidaysList, DateFormat(enddate,"yyyy-mm-dd"))>
                                  <cfset enddate = DateFormat(DateAdd("d",-1,#enddate#),"mm-dd-yyyy")>
                                  <cfset endTime=TimeFormat(SetDefault_endtime,"HH:mm")>							
                           <cfelse>
								<cfset enddate= ParseDateTime(DateFormat(enddate,"mm-dd-yyyy") & " " & endTime)>
                                 <cfbreak/>    
                           </cfif>             									
								
					</cfloop>					
						
		<cfreturn enddate>
				
	</cffunction>	

	<cffunction name="testfunction" access="public" returntype="any">
		<cfargument name="Startdate_time" type="date" required="true" />
		<cfargument name="Enddate_time" type="date" required="true" />
		<cfargument name="rec_id" type="numeric" required="true" />
		
			<cfset Dates=StructNew()>
			
			<cfset StartWorkDay= NextWorkDay(ParseDateTime(arguments.Startdate_time),ParseDateTime(arguments.Enddate_time))>
			<cfset EndWorkDay=	PreviousWorkDay(ParseDateTime(arguments.Startdate_time),ParseDateTime(arguments.Enddate_time))>
			
			<cfset Dates.Startdate=StartWorkDay>
			<cfset Dates.Enddate=EndWorkDay>
			
		
		
		<cfreturn Dates>
			
	</cffunction>

	<cffunction name="GetListOfOnHolds" access="private" returntype="any">
		<cfargument name="act_startdate" type="date" required="true" />
		<cfargument name="act_enddate" type="date" required="true" />
		<cfargument name="rec_id" type="numeric" required="true" />
		
				<!--- Create a new three-column query, specifying the column data types ---> 
	<cfset myQuery = QueryNew("Note_ID, OnHoldTime, N_Note", "Integer, Date, VarChar")>   

	<cfquery datasource="#request.dsn#" name="ListOfHoldUnHold">
		select Note_ID, N_Date + N_Time as OnHoldTime, N_Note from Title_Notes where N_date >= <cfqueryparam cfsqltype="cf_sql_date" value="#ParseDateTime(DateFormat(act_startdate,'mm-dd/yyyy'))#"> 
		and N_date <= <cfqueryparam cfsqltype="cf_sql_date" value="#ParseDateTime(DateFormat(act_enddate,'mm-dd/yyyy'))#"> and Order_ID=<cfqueryparam cfsqltype="cf_sql_integer" value="#rec_id#"> 
		and N_Note like 'On Hold%' order by Note_ID ASC
	</cfquery>	
	
	<cfset IsOnHold=0>
	<cfset rowCount=0>
		
		<cfloop query="ListOfHoldUnHold">
			<cfif IsOnHold eq 0>
				<cfif NOT FindNoCase('On Hold Removed',ListOfHoldUnHold.N_Note,1)>
				<!--- <cfif ListOfHoldUnHold.N_Note eq 'On Hold'> --->	
					<cfset rowCount=rowCount+1>
					<!--- Set the values of the cells in the query --->
					<cfset QueryAddRow(MyQuery,1)>
					
					<cfset QuerySetCell(myQuery, "Note_ID",ListOfHoldUnHold.Note_ID , rowCount)> 
					<cfset QuerySetCell(myQuery, "OnHoldTime", ListOfHoldUnHold.OnHoldTime, rowCount)> 
					<cfset QuerySetCell(myQuery, "N_Note", ListOfHoldUnHold.N_Note, rowCount)>
					<cfset IsOnHold=1>		
				</cfif>
			<cfelse>
				<!--- <cfif ListOfHoldUnHold.N_Note eq 'On Hold Removed'> --->
				<cfif FindNoCase('On Hold Removed',ListOfHoldUnHold.N_Note,1)>
					
					<!--- <cfset ListofHolds=ListAppend(ListofHolds,ListOfHoldUnHold.Note_ID)> --->
					<!--- Make two rows in the query ---> 
					<!--- <cfset rowCount=rowCount+1> --->
					<!--- Set the values of the cells in the query --->
					<!--- <cfset QueryAddRow(MyQuery,1)>
					<cfset QuerySetCell(myQuery, "Note_ID",ListOfHoldUnHold.Note_ID , rowCount)> 
					<cfset QuerySetCell(myQuery, "OnHoldTime", ListOfHoldUnHold.OnHoldTime, rowCount)> 
					<cfset QuerySetCell(myQuery, "N_Note", ListOfHoldUnHold.N_Note, rowCount)> --->
					<cfset IsOnHold=0>
				</cfif>
			</cfif>
		</cfloop>
	<cfif ListOfHoldUnHold.recordCount gt 0>
		<cfreturn MyQuery>
	<cfelse>
		<cfreturn 0>
	</cfif>
</cffunction>
</cfcomponent>