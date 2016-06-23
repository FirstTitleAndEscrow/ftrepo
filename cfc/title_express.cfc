<cfcomponent>
<!---<cffunction name="getSpreadsheetData" access="remote" output="false">      
    <cfquery name="excelRpt" datasource="TitleExpressDB">                      
       SELECT  TOP 65000 * FROM TestTable ORDER BY OrderNumber
    </cfquery> 
    
     <cfreturn excelRpt>
</cffunction>--->

<cffunction name="getRecords" access="public" returntype="Query" >
		<cfargument name="Company" type="string" required="true">
		<cfargument name="StartDate" type="string" required="true">
		<cfargument name="EndDate" type="string" required="true">
		<cfargument name="DB_Name" type="string" required="true">
		
		<cfif DB_Name eq 1>
			
				<cfquery name="qryRecords" datasource=TitleExpress1>
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF001 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF002 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF003 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION   ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF004 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION   ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF005 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION   ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF006 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION   ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF007 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF008 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF009 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF010 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF011 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF012 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF013 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF014 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF015 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF016 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF017 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF018 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF019 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF020 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF021 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF022 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF023 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF024 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF025 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF026 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF027 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF028 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF029 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF030 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF031 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF032 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF033 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF034 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF035 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF036 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF037 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF038 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF039 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF040 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF041 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF042 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF043 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF044 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF045 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF046 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF047 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF048 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF049 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF050 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF051 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF052 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF053 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF054 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF055 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF056 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF057 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF058 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF059 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF060 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF061 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF062 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF063 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF064 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF065 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF066 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF067 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF068 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF069 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF070 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF071 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF072 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF073 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF074 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF075 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF076 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF077 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF078 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF079 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF080 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF081 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF082 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF083 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF084 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF085 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF086 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF087 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF088 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF089 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF090 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF091 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF092 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF093 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF094 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF095 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	        </cfquery> 

		<cfelse>
			<cfquery name="qryRecords" datasource=TitleExpress2>
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF001 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF002 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION  ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF003 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 
	            UNION   ALL
	            SELECT t.OrderNumber, t.Name, 
	                   SUM(CASE t._Type
	                          WHEN 'D' THEN t.Amount
	                          WHEN 'K' THEN -1 * t.Amount
	                          END) as PayeeTotal
	            FROM TWEF004 as t
	            Where _Date BETWEEN '#arguments.StartDate#' AND  '#arguments.EndDate#' and  Company_ID=#arguments.Company#
	            GROUP BY t.OrderNumber, t.Name 

			</cfquery>
		</cfif>
	<cfreturn qryRecords>
</cffunction> 
</cfcomponent>
