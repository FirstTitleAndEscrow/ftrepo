<CFSET c_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET c_date = #DateFormat(Now(), "mm/dd/yyyy")#>
<cfparam name="form.B_LOANTYPE" default="">
<cfparam name="form.B_6_FILENUMBER" default="">
<cfparam name="form.B_7_LOANNUMBER" default="">
<cfparam name="form.B_8_CASENUMBER" default="">
<cfparam name="form.D_BORROWERNAMEADDRESS" default="">
<cfparam name="form.E_SELLERNAMEADDRESS" default="">
<cfparam name="form.F_LENDERNAMEADDRESS" default="">
<cfparam name="form.PADDRESS" default="">
<cfparam name="form.PCITY" default="">
<cfparam name="form.PCOUNTY" default="">
<cfparam name="form.PSTATE" default="">
<cfparam name="form.PZIP" default="">
<cfparam name="form.H_SETTLEMENTAGENT" default="">
<cfparam name="form.I_1_SETTLEMENTDATE" default="">
<cfparam name="form.I_2_SETTLEMENTADDRESS" default="">
<cfparam name="form.A_0101_CONTRACTSALESPRICE" default="">
<cfparam name="form.A_0401_CONTRACTSALESPRICE" default="">
<cfparam name="form.A_0102_PERSONALPROPERTY" default="">
<cfparam name="form.A_0402_PERSONALPROPERTY" default="">
<cfparam name="form.A_0103_SETTLEMENTCHARGESTOBORROWER" default="">
<cfparam name="form.A_0403_USERDESC" default="">
<cfparam name="form.A_0403_USERAMOUNT" default="">
<cfparam name="form.A_0104_USERDESC" default="">
<cfparam name="form.A_0104_USERAMOUNT" default="">
<cfparam name="form.A_0404_USERDESC" default="">
<cfparam name="form.A_0404_USERAMOUNT" default="">
<cfparam name="form.A_0105_USERDESC" default="">
<cfparam name="form.A_0105_USERAMOUNT" default="">
<cfparam name="form.A_0405_USERDESC" default="">
<cfparam name="form.A_0405_USERAMOUNT" default="">
<cfparam name="form.A_0106_CITYTOWNTAXESDATEFROM" default="">
<cfparam name="form.A_0106_CITYTOWNTAXESDATETO" default="">
<cfparam name="form.A_0106_CITYTOWNTAXESAMOUNT" default="">
<cfparam name="form.A_0406_CITYTOWNTAXESDATEFROM" default="">
<cfparam name="form.A_0406_CITYTOWNTAXESDATETO" default="">
<cfparam name="form.A_0406_CITYTOWNTAXESAMOUNT" default="">
<cfparam name="form.A_0107_COUNTYTAXESDATEFROM" default="">
<cfparam name="form.A_0107_COUNTYTAXESDATETO" default="">
<cfparam name="form.A_0107_COUNTYTAXESAMOUNT" default="">
<cfparam name="form.A_0407_COUNTYTAXESDATEFROM" default="">
<cfparam name="form.A_0407_COUNTYTAXESDATETO" default="">
<cfparam name="form.A_0407_COUNTYTAXESAMOUNT" default="">
<cfparam name="form.A_0108_ASSESSMENTSDATEFROM" default="">
<cfparam name="form.A_0108_ASSESSMENTSDATETO" default="">
<cfparam name="form.A_0108_ASSESSMENTSAMOUNT" default="">
<cfparam name="form.A_0408_ASSESSMENTSDATEFROM" default="">
<cfparam name="form.A_0408_ASSESSMENTSDATETO" default="">
<cfparam name="form.A_0408_ASSESSMENTSAMOUNT" default="">
<cfparam name="form.A_0109_USERDESC" default="">
<cfparam name="form.A_0109_USERPAYTO" default="">
<cfparam name="form.A_0109_USERAMOUNT" default="">
<cfparam name="form.A_0409_USERDESC" default="">
<cfparam name="form.A_0409_USERPAYTO" default="">
<cfparam name="form.A_0409_USERAMOUNT" default="">
<cfparam name="form.A_0110_USERDESC" default="">
<cfparam name="form.A_0110_USERPAYTO" default="">
<cfparam name="form.A_0110_USERAMOUNT" default="">
<cfparam name="form.A_0410_USERDESC" default="">
<cfparam name="form.A_0410_USERPAYTO" default="">
<cfparam name="form.A_0410_USERAMOUNT" default="">
<cfparam name="form.A_0111_USERDESC" default="">
<cfparam name="form.A_0111_USERPAYTO" default="">
<cfparam name="form.A_0111_USERAMOUNT" default="">
<cfparam name="form.A_0411_USERDESC" default="">
<cfparam name="form.A_0411_USERPAYTO" default="">
<cfparam name="form.A_0411_USERAMOUNT" default="">
<cfparam name="form.A_0112_USERDESC" default="">
<cfparam name="form.A_0112_USERPAYTO" default="">
<cfparam name="form.A_0112_USERAMOUNT" default="">
<cfparam name="form.A_0412_USERDESC" default="">
<cfparam name="form.A_0412_USERPAYTO" default="">
<cfparam name="form.A_0412_USERAMOUNT" default="">
<cfparam name="form.A_0201_EARNESTMONEYAMOUNT" default="">
<cfparam name="form.A_0501_EXCESSDEPOSITAMOUNT" default="">
<cfparam name="form.A_0202_PRINCIPALNEWLOANAMOUNT" default="">
<cfparam name="form.A_0502_SETTLEMENTCHARGESTOSELLERAMOUNT" default="">
<cfparam name="form.A_0203_EXISTINGLOANSAMOUNT" default="">
<cfparam name="form.A_0503_EXISTINGLOANSAMOUNT" default="">
<cfparam name="form.A_0204_USERDESC" default="">
<cfparam name="form.A_0204_USERAMOUNT" default="">
<cfparam name="form.A_0504_PAYOFFFIRSTMORTGAGEAMOUNT" default="">
<cfparam name="form.A_0205_USERDESC" default="">
<cfparam name="form.A_0205_USERAMOUNT" default="">
<cfparam name="form.A_0505_PAYOFFSECONDMORTGAGEAMOUNT" default="">
<cfparam name="form.A_0206_USERDESC" default="">
<cfparam name="form.A_0206_USERAMOUNT" default="">
<cfparam name="form.A_0506_USERDESC" default="">
<cfparam name="form.A_0506_USERAMOUNT" default="">
<cfparam name="form.A_0207_USERDESC" default="">
<cfparam name="form.A_0207_USERAMOUNT" default="">
<cfparam name="form.A_0507_USERDESC" default="">
<cfparam name="form.A_0507_USERAMOUNT" default="">
<cfparam name="form.A_0208_USERDESC" default="">
<cfparam name="form.A_0208_USERAMOUNT" default="">
<cfparam name="form.A_0508_USERDESC" default="">
<cfparam name="form.A_0508_USERAMOUNT" default="">
<cfparam name="form.A_0209_USERDESC" default="">
<cfparam name="form.A_0209_USERAMOUNT" default="">
<cfparam name="form.A_0509_USERDESC" default="">
<cfparam name="form.A_0509_USERAMOUNT" default="">
<cfparam name="form.A_0210_CITYTOWNTAXESDATEFROM" default="">
<cfparam name="form.A_0210_CITYTOWNTAXESDATETO" default="">
<cfparam name="form.A_0210_CITYTOWNTAXESAMOUNT" default="">
<cfparam name="form.A_0510_CITYTOWNTAXESDATEFROM" default="">
<cfparam name="form.A_0510_CITYTOWNTAXESDATETO" default="">
<cfparam name="form.A_0510_CITYTOWNTAXESAMOUNT" default="">
<cfparam name="form.A_0211_COUNTYTAXESDATEFROM" default="">
<cfparam name="form.A_0211_COUNTYTAXESDATETO" default="">
<cfparam name="form.A_0211_COUNTYTAXESAMOUNT" default="">
<cfparam name="form.A_0511_COUNTYTAXESDATEFROM" default="">
<cfparam name="form.A_0511_COUNTYTAXESDATETO" default="">
<cfparam name="form.A_0511_COUNTYTAXESAMOUNT" default="">
<cfparam name="form.A_0212_ASSESSMENTSDATEFROM" default="">
<cfparam name="form.A_0212_ASSESSMENTSDATETO" default="">
<cfparam name="form.A_0212_ASSESSMENTSAMOUNT" default="">
<cfparam name="form.A_0512_ASSESSMENTSDATEFROM" default="">
<cfparam name="form.A_0512_ASSESSMENTSDATETO" default="">
<cfparam name="form.A_0512_ASSESSMENTSAMOUNT" default="">
<cfparam name="form.A_0213_USERDESC" default="">
<cfparam name="form.A_0213_USERPAYTO" default="">
<cfparam name="form.A_0213_USERAMOUNT" default="">
<cfparam name="form.A_0513_USERDESC" default="">
<cfparam name="form.A_0513_USERPAYTO" default="">
<cfparam name="form.A_0513_USERAMOUNT" default="">
<cfparam name="form.A_0214_USERDESC" default="">
<cfparam name="form.A_0214_USERPAYTO" default="">
<cfparam name="form.A_0214_USERAMOUNT" default="">
<cfparam name="form.A_0514_USERDESC" default="">
<cfparam name="form.A_0514_USERPAYTO" default="">
<cfparam name="form.A_0514_USERAMOUNT" default="">
<cfparam name="form.A_0215_USERDESC" default="">
<cfparam name="form.A_0215_USERPAYTO" default="">
<cfparam name="form.A_0215_USERAMOUNT" default="">
<cfparam name="form.A_0515_USERDESC" default="">
<cfparam name="form.A_0515_USERPAYTO" default="">
<cfparam name="form.A_0515_USERAMOUNT" default="">
<cfparam name="form.A_0216_USERDESC" default="">
<cfparam name="form.A_0216_USERPAYTO" default="">
<cfparam name="form.A_0216_USERAMOUNT" default="">
<cfparam name="form.A_0516_USERDESC" default="">
<cfparam name="form.A_0516_USERPAYTO" default="">
<cfparam name="form.A_0516_USERAMOUNT" default="">
<cfparam name="form.A_0217_USERDESC" default="">
<cfparam name="form.A_0217_USERPAYTO" default="">
<cfparam name="form.A_0217_USERAMOUNT" default="">
<cfparam name="form.A_0517_USERDESC" default="">
<cfparam name="form.A_0517_USERPAYTO" default="">
<cfparam name="form.A_0517_USERAMOUNT" default="">
<cfparam name="form.A_0218_USERDESC" default="">
<cfparam name="form.A_0218_USERPAYTO" default="">
<cfparam name="form.A_0218_USERAMOUNT" default="">
<cfparam name="form.A_0518_USERDESC" default="">
<cfparam name="form.A_0518_USERPAYTO" default="">
<cfparam name="form.A_0518_USERAMOUNT" default="">
<cfparam name="form.A_0219_USERDESC" default="">
<cfparam name="form.A_0219_USERPAYTO" default="">
<cfparam name="form.A_0219_USERAMOUNT" default="">
<cfparam name="form.A_0519_USERDESC" default="">
<cfparam name="form.A_0519_USERPAYTO" default="">
<cfparam name="form.A_0519_USERAMOUNT" default="">
<cfparam name="form.A_0220_TOTALPAIDBYSELLERAMOUNT" default="">
<cfparam name="form.A_0520_REDUCTIONDUESELLERAMOUNT" default="">
<cfparam name="form.A_0301_GROSSDUEFROMBORROWERAMOUNT" default="">
<cfparam name="form.A_0601_GROSSDUETOSELLERAMOUNT" default="">
<cfparam name="form.A_0302_LESSPAIDBYBORROWERAMOUNT" default="">
<cfparam name="form.A_0602_LESSREDUCTIONSDUESELLERAMOUNT" default="">
<cfparam name="form.A_0303_CASHTOFROM" default="">
<cfparam name="form.A_0303_CASHAMOUNT" default="">
<cfparam name="form.A_0603_CASHTOFROM" default="">
<cfparam name="form.A_0603_CASHAMOUNT" default="">
<cfparam name="form.A_0701_COMMISSIONAMOUNT" default="">
<cfparam name="form.A_0701_COMMISSIONPAYTO" default="">
<cfparam name="form.A_0702_COMMISSIONAMOUNT" default="">
<cfparam name="form.A_0702_COMMISSIONPAYTO" default="">
<cfparam name="form.A_0703_BORROWER_COMMISSIONAMOUNT" default="">
<cfparam name="form.A_0703_SELLER_COMMISSIONAMOUNT" default="">
<cfparam name="form.A_0704_USERDESC" default="">
<cfparam name="form.A_0704_USERPAYTO" default="">
<cfparam name="form.A_0704_BORROWER_USERAMOUNT" default="">
<cfparam name="form.A_0704_SELLER_USERAMOUNT" default="">
<cfparam name="form.A_0705_USERDESC" default="">
<cfparam name="form.A_0705_USERPAYTO" default="">
<cfparam name="form.A_0705_BORROWER_USERAMOUNT" default="">
<cfparam name="form.A_0705_SELLER_USERAMOUNT" default="">
<cfparam name="form.A_0706_USERDESC" default="">
<cfparam name="form.A_0706_USERPAYTO" default="">
<cfparam name="form.A_0706_BORROWER_USERAMOUNT" default="">
<cfparam name="form.A_0706_SELLER_USERAMOUNT" default="">
<cfparam name="form.A_0801_OUTSIDE_ORIGINATIONCHARGE" default="">
<cfparam name="form.A_0801_BORROWER_ORIGINATIONCHARGE" default="">
<cfparam name="form.A_0801_SELLER_ORIGINATIONCHARGE" default="">
<cfparam name="form.A_0802_OUTSIDE_POINTS" default="">
<cfparam name="form.A_0802_BORROWER_POINTS" default="">
<cfparam name="form.A_0802_SELLER_POINTS" default="">
<cfparam name="form.A_0803_BORROWER_ADJORIGINATIONCHARGE" default="">
<cfparam name="form.A_0803_SELLER_ADJORIGINATIONCHARGE" default="">
<cfparam name="form.A_0804_APPRAISALFEEPAYTO" default="">
<cfparam name="form.A_0804_BORROWER_APPRAISALFEE" default="">
<cfparam name="form.A_0804_APPRAISALFEE_OUTSIDE_AMOUNT" default="">
<cfparam name="form.A_0804_SELLER_APPRAISALFEE" default="">
<cfparam name="form.A_0805_CREDITREPORTPAYTO" default="">
<cfparam name="form.A_0805_BORROWER_CREDITREPORT" default="">
<cfparam name="form.A_0805_SELLER_CREDITREPORT" default="">
<cfparam name="form.A_0806_TAXSERVICEPAYTO" default="">
<cfparam name="form.A_0806_BORROWER_TAXSERVICE" default="">
<cfparam name="form.A_0806_SELLER_TAXSERVICE" default="">
<cfparam name="form.A_0807_FLOODCERTPAYTO" default="">
<cfparam name="form.A_0807_BORROWER_FLOODCERT" default="">
<cfparam name="form.A_0807_SELLER_FLOODCERT" default="">
<cfparam name="form.A_0808_USERDESC" default="">
<cfparam name="form.A_0808_USERPAYTO" default="">
<cfparam name="form.A_0808_BORROWER_USERAMOUNT" default="">
<cfparam name="form.A_0808_SELLER_USERAMOUNT" default="">
<cfparam name="form.A_0809_USERDESC" default="">
<cfparam name="form.A_0809_USERPAYTO" default="">
<cfparam name="form.A_0809_BORROWER_USERAMOUNT" default="">
<cfparam name="form.A_0809_SELLER_USERAMOUNT" default="">
<cfparam name="form.A_0810_USERDESC" default="">
<cfparam name="form.A_0810_USERPAYTO" default="">
<cfparam name="form.A_0810_BORROWER_USERAMOUNT" default="">
<cfparam name="form.A_0810_SELLER_USERAMOUNT" default="">
<cfparam name="form.A_0811_USERDESC" default="">
<cfparam name="form.A_0811_USERPAYTO" default="">
<cfparam name="form.A_0811_BORROWER_USERAMOUNT" default="">
<cfparam name="form.A_0811_SELLER_USERAMOUNT" default="">
<cfparam name="form.A_0812_USERDESC" default="">
<cfparam name="form.A_0812_USERPAYTO" default="">
<cfparam name="form.A_0812_BORROWER_USERAMOUNT" default="">
<cfparam name="form.A_0812_SELLER_USERAMOUNT" default="">
<cfparam name="form.A_0901_DAILYINTERESTDATEFROM" default="">
<cfparam name="form.A_0901_DAILYINTERESTDATETO" default="">
<cfparam name="form.A_0901_OUTSIDE_DAILYINTERESTPERDAY" default="">
<cfparam name="form.A_0901_BORROWER_DAILYINTEREST" default="">
<cfparam name="form.A_0901_SELLER_DAILYINTEREST" default="">
<cfparam name="form.A_0902_MORTGAGEINSMONTHS" default="">
<cfparam name="form.A_0902_MORTGAGEINSPAYTO" default="">
<cfparam name="form.A_0902_BORROWER_MORTGAGEINS" default="">
<cfparam name="form.A_0902_SELLER_MORTGAGEINS" default="">
<cfparam name="form.A_0903_HOMEOWNERSINSMONTHS" default="">
<cfparam name="form.A_0903_HOMEOWNERSINSPAYTO" default="">
<cfparam name="form.A_0903_BORROWER_HOMEOWNERSINS" default="">
<cfparam name="form.A_0903_SELLER_HOMEOWNERSINS" default="">
<cfparam name="form.A_0904_USERDESC" default="">
<cfparam name="form.A_0904_BORROWER_USERAMOUNT" default="">
<cfparam name="form.A_0904_SELLER_USERAMOUNT" default="">
<cfparam name="form.A_1001_BORROWER_INITIALESCROWDEPOSIT" default="">
<cfparam name="form.A_1001_SELLER_INITIALESCROWDEPOSIT" default="">
<cfparam name="form.A_1002_HOMEOWNERSINSMONTHS" default="">
<cfparam name="form.A_1002_HOMEOWNERSINSPERMONTH" default="">
<cfparam name="form.A_1002_OUTSIDE_HOMEOWNERSINS" default="">
<cfparam name="form.A_1002_BORROWER_HOMEOWNERSINS" default="">
<cfparam name="form.A_1002_SELLER_HOMEOWNERSINS" default="">
<cfparam name="form.A_1003_MORTGAGEINSMONTHS" default="">
<cfparam name="form.A_1003_MORTGAGEINSPERMONTH" default="">
<cfparam name="form.A_1003_OUTSIDE_MORTGAGEINS" default="">
<cfparam name="form.A_1003_BORROWER_MORTGAGEINS" default="">
<cfparam name="form.A_1003_SELLER_MORTGAGEINS" default="">
<cfparam name="form.A_1004_CITYPROPTAXMONTHS" default="">
<cfparam name="form.A_1004_CITYPROPTAXPERMONTH" default="">
<cfparam name="form.A_1004_OUTSIDE_CITYPROPTAX" default="">
<cfparam name="form.A_1004_BORROWER_CITYPROPTAX" default="">
<cfparam name="form.A_1004_SELLER_CITYPROPTAX" default="">
<cfparam name="form.A_1005_COUNTYPROPTAXMONTHS" default="">
<cfparam name="form.A_1005_COUNTYPROPTAXPERMONTH" default="">
<cfparam name="form.A_1005_OUTSIDE_COUNTYPROPTAX" default="">
<cfparam name="form.A_1005_BORROWER_COUNTYPROPTAX" default="">
<cfparam name="form.A_1005_SELLER_COUNTYPROPTAX" default="">
<cfparam name="form.A_1006_ASSESSMENTSMONTHS" default="">
<cfparam name="form.A_1006_ASSESSMENTSPERMONTH" default="">
<cfparam name="form.A_1006_OUTSIDE_ASSESSMENTS" default="">
<cfparam name="form.A_1006_BORROWER_ASSESSMENTS" default="">
<cfparam name="form.A_1006_SELLER_ASSESSMENTS" default="">
<cfparam name="form.A_1007_OUTSIDE_AGGREGATEADJUSTMENT" default="">
<cfparam name="form.A_1007_BORROWER_AGGREGATEADJUSTMENT" default="">
<cfparam name="form.A_1007_SELLER_AGGREGATEADJUSTMENT" default="">
<cfparam name="form.A_1101_BORROWER_TITLESERVICES" default="">
<cfparam name="form.A_1101_SELLER_TITLESERVICES" default="">
<cfparam name="form.A_1102_CLOSINGFEEPAYTO" default="">
<cfparam name="form.A_1102_OUTSIDE_CLOSINGFEE" default="">
<cfparam name="form.A_1102_BORROWER_CLOSINGFEE" default="">
<cfparam name="form.A_1102_SELLER_CLOSINGFEE" default="">
<cfparam name="form.A_1103_OWNERSTITLEINSPAYTO" default="">
<cfparam name="form.A_1103_OUTSIDE_OWNERSTITLEINS" default="">
<cfparam name="form.A_1103_BORROWER_OWNERSTITLEINS" default="">
<cfparam name="form.A_1103_SELLER_OWNERSTITLEINS" default="">
<cfparam name="form.A_1104_LENDERSTITLEINSPAYTO" default="">
<cfparam name="form.A_1104_OUTSIDE_LENDERSTITLEINS" default="">
<cfparam name="form.A_1104_BORROWER_LENDERSTITLEINS" default="">
<cfparam name="form.A_1104_SELLER_LENDERSTITLEINS" default="">
<cfparam name="form.A_1105_LENDERSTITLEPOLICYLIMIT" default="">
<cfparam name="form.A_1106_OWNERSTITLEPOLICYLIMIT" default="">
<cfparam name="form.A_1107_AGENTPREMIUMPORTION" default="">
<cfparam name="form.A_1108_UNDERWRITERPREMIUMPORTION" default="">
<cfparam name="form.A_1109_USERDESC" default="">
<cfparam name="form.A_1109_USERPAYTO" default="">
<cfparam name="form.A_1109_OUTSIDE_USERAMOUNT" default="">
<cfparam name="form.A_1109_BORROWER_USERAMOUNT" default="">
<cfparam name="form.A_1109_SELLER_USERAMOUNT" default="">
<cfparam name="form.A_1110_USERDESC" default="">
<cfparam name="form.A_1110_USERPAYTO" default="">
<cfparam name="form.A_1110_OUTSIDE_USERAMOUNT" default="">
<cfparam name="form.A_1110_BORROWER_USERAMOUNT" default="">
<cfparam name="form.A_1110_SELLER_USERAMOUNT" default="">
<cfparam name="form.A_1111_USERDESC" default="">
<cfparam name="form.A_1111_USERPAYTO" default="">
<cfparam name="form.A_1111_OUTSIDE_USERAMOUNT" default="">
<cfparam name="form.A_1111_BORROWER_USERAMOUNT" default="">
<cfparam name="form.A_1111_SELLER_USERAMOUNT" default="">
<cfparam name="form.A_1112_USERDESC" default="">
<cfparam name="form.A_1112_USERPAYTO" default="">
<cfparam name="form.A_1112_OUTSIDE_USERAMOUNT" default="">
<cfparam name="form.A_1112_BORROWER_USERAMOUNT" default="">
<cfparam name="form.A_1112_SELLER_USERAMOUNT" default="">
<cfparam name="form.A_1113_USERDESC" default="">
<cfparam name="form.A_1113_USERPAYTO" default="">
<cfparam name="form.A_1113_OUTSIDE_USERAMOUNT" default="">
<cfparam name="form.A_1113_BORROWER_USERAMOUNT" default="">
<cfparam name="form.A_1113_SELLER_USERAMOUNT" default="">
<cfparam name="form.A_1201_BORROWER_GOVTRECORDINGCHARGES" default="">
<cfparam name="form.A_1201_SELLER_GOVTRECORDINGCHARGES" default="">
<cfparam name="form.A_1202_DEED" default="">
<cfparam name="form.A_1202_DEEDMORTGAGE" default="">
<cfparam name="form.A_1202_DEEDRELEASES" default="">
<cfparam name="form.A_1202_BORROWER_DEED" default="">
<cfparam name="form.A_1202_SELLER_DEED" default="">
<cfparam name="form.A_1203_BORROWER_TRANSFERTAXES" default="">
<cfparam name="form.A_1203_SELLER_TRANSFERTAXES" default="">
<cfparam name="form.A_1204_CITYCOUNTYTAXDEED" default="">
<cfparam name="form.A_1204_CITYCOUNTYTAXMORTGAGE" default="">
<cfparam name="form.A_1204_BORROWER_CITYCOUNTYTAX" default="">
<cfparam name="form.A_1204_SELLER_CITYCOUNTYTAX" default="">
<cfparam name="form.A_1205_STATETRANSTAXDEED" default="">
<cfparam name="form.A_1205_STATETRANSTAXMORTGAGE" default="">
<cfparam name="form.A_1205_BORROWER_STATETRANSTAX" default="">
<cfparam name="form.A_1205_SELLER_STATETRANSTAX" default="">
<cfparam name="form.A_1206_USERDESC" default="">
<cfparam name="form.A_1206_USERPAYTO" default="">
<cfparam name="form.A_1206_OUTSIDE_USERAMOUNT" default="">
<cfparam name="form.A_1206_BORROWER_USERAMOUNT" default="">
<cfparam name="form.A_1206_SELLER_USERAMOUNT" default="">
<cfparam name="form.A_1207_USERDESC" default="">
<cfparam name="form.A_1207_USERPAYTO" default="">
<cfparam name="form.A_1207_OUTSIDE_USERAMOUNT" default="">
<cfparam name="form.A_1207_BORROWER_USERAMOUNT" default="">
<cfparam name="form.A_1207_SELLER_USERAMOUNT" default="">
<cfparam name="form.A_1301_BORROWER_SERVICESYOUCANSHOPFOR" default="">
<cfparam name="form.A_1301_SELLER_SERVICESYOUCANSHOPFOR" default="">
<cfparam name="form.A_1302_USERDESC" default="">
<cfparam name="form.A_1302_USERPAYTO" default="">
<cfparam name="form.A_1302_OUTSIDE_USERAMOUNT" default="">
<cfparam name="form.A_1302_BORROWER_USERAMOUNT" default="">
<cfparam name="form.A_1302_SELLER_USERAMOUNT" default="">
<cfparam name="form.A_1303_USERDESC" default="">
<cfparam name="form.A_1303_USERPAYTO" default="">
<cfparam name="form.A_1303_OUTSIDE_USERAMOUNT" default="">
<cfparam name="form.A_1303_BORROWER_USERAMOUNT" default="">
<cfparam name="form.A_1303_SELLER_USERAMOUNT" default="">
<cfparam name="form.A_1304_USERDESC" default="">
<cfparam name="form.A_1304_USERPAYTO" default="">
<cfparam name="form.A_1304_OUTSIDE_USERAMOUNT" default="">
<cfparam name="form.A_1304_BORROWER_USERAMOUNT" default="">
<cfparam name="form.A_1304_SELLER_USERAMOUNT" default="">
<cfparam name="form.A_1305_USERDESC" default="">
<cfparam name="form.A_1305_USERPAYTO" default="">
<cfparam name="form.A_1305_OUTSIDE_USERAMOUNT" default="">
<cfparam name="form.A_1305_BORROWER_USERAMOUNT" default="">
<cfparam name="form.A_1305_SELLER_USERAMOUNT" default="">
<cfparam name="form.A_1306_USERDESC" default="">
<cfparam name="form.A_1306_USERPAYTO" default="">
<cfparam name="form.A_1306_OUTSIDE_USERAMOUNT" default="">
<cfparam name="form.A_1306_BORROWER_USERAMOUNT" default="">
<cfparam name="form.A_1306_SELLER_USERAMOUNT" default="">
<cfparam name="form.A_1307_USERDESC" default="">
<cfparam name="form.A_1307_USERPAYTO" default="">
<cfparam name="form.A_1307_OUTSIDE_USERAMOUNT" default="">
<cfparam name="form.A_1307_BORROWER_USERAMOUNT" default="">
<cfparam name="form.A_1307_SELLER_USERAMOUNT" default="">
<cfparam name="form.A_1308_USERDESC" default="">
<cfparam name="form.A_1308_USERPAYTO" default="">
<cfparam name="form.A_1308_OUTSIDE_USERAMOUNT" default="">
<cfparam name="form.A_1308_BORROWER_USERAMOUNT" default="">
<cfparam name="form.A_1308_SELLER_USERAMOUNT" default="">
<cfparam name="form.A_1400_BORROWER_TOTALSETTLEMENTCHARGES" default="">
<cfparam name="form.A_1400_SELLER_TOTALSETTLEMENTCHARGES" default="">
<cfparam name="form.COMPARE_01_GFE_ORIGINCHARGE" default="">
<cfparam name="form.COMPARE_01_HUD_ORIGINCHARGE" default="">
<cfparam name="form.COMPARE_02_GFE_POINTS" default="">
<cfparam name="form.COMPARE_02_HUD_POINTS" default="">
<cfparam name="form.COMPARE_03_GFE_ADJORIGINCHARGE" default="">
<cfparam name="form.COMPARE_03_HUD_ADJORIGINCHARGE" default="">
<cfparam name="form.COMPARE_04_GFE_TRANSFERTAX" default="">
<cfparam name="form.COMPARE_04_HUD_TRANSFERTAX" default="">
<cfparam name="form.COMPARE_05_GFE_GOVTRECCHARGE" default="">
<cfparam name="form.COMPARE_05_HUD_GOVTRECCHARGE" default="">
<cfparam name="form.COMPARE_06_USERHUDDESC" default="">
<cfparam name="form.COMPARE_06_USERHUDLINE" default="">
<cfparam name="form.COMPARE_06_GFE_USERAMOUNT" default="">
<cfparam name="form.COMPARE_06_HUD_USERAMOUNT" default="">
<cfparam name="form.COMPARE_07_USERHUDDESC" default="">
<cfparam name="form.COMPARE_07_USERHUDLINE" default="">
<cfparam name="form.COMPARE_07_GFE_USERAMOUNT" default="">
<cfparam name="form.COMPARE_07_HUD_USERAMOUNT" default="">
<cfparam name="form.COMPARE_08_USERHUDDESC" default="">
<cfparam name="form.COMPARE_08_USERHUDLINE" default="">
<cfparam name="form.COMPARE_08_GFE_USERAMOUNT" default="">
<cfparam name="form.COMPARE_08_HUD_USERAMOUNT" default="">
<cfparam name="form.COMPARE_09_USERHUDDESC" default="">
<cfparam name="form.COMPARE_09_USERHUDLINE" default="">
<cfparam name="form.COMPARE_09_GFE_USERAMOUNT" default="">
<cfparam name="form.COMPARE_09_HUD_USERAMOUNT" default="">
<cfparam name="form.COMPARE_10_USERHUDDESC" default="">
<cfparam name="form.COMPARE_10_USERHUDLINE" default="">
<cfparam name="form.COMPARE_10_GFE_USERAMOUNT" default="">
<cfparam name="form.COMPARE_10_HUD_USERAMOUNT" default="">
<cfparam name="form.COMPARE_11_USERHUDDESC" default="">
<cfparam name="form.COMPARE_11_USERHUDLINE" default="">
<cfparam name="form.COMPARE_11_GFE_USERAMOUNT" default="">
<cfparam name="form.COMPARE_11_HUD_USERAMOUNT" default="">
<cfparam name="form.COMPARE_12_USERHUDDESC" default="">
<cfparam name="form.COMPARE_12_USERHUDLINE" default="">
<cfparam name="form.COMPARE_12_GFE_USERAMOUNT" default="">
<cfparam name="form.COMPARE_12_HUD_USERAMOUNT" default="">
<cfparam name="form.COMPARE_13_GFE_ESCROWDEPOSIT" default="">
<cfparam name="form.COMPARE_13_HUD_ESCROWDEPOSIT" default="">
<cfparam name="form.COMPARE_14_INTERESTCHARGESPERDAY" default="">
<cfparam name="form.COMPARE_14_GFE_INTERESTCHARGES" default="">
<cfparam name="form.COMPARE_14_HUD_INTERESTCHARGES" default="">
<cfparam name="form.COMPARE_15_GFE_HOMEOWNERSINS" default="">
<cfparam name="form.COMPARE_15_HUD_HOMEOWNERSINS" default="">
<cfparam name="form.COMPARE_16_USERDESC" default="">
<cfparam name="form.COMPARE_16_USERHUDLINE" default="">
<cfparam name="form.COMPARE_16_USERAMOUNT" default="">
<cfparam name="form.COMPARE_16_GFE_USERAMOUNT" default="">
<cfparam name="form.COMPARE_16_HUD_USERAMOUNT" default="">
<cfparam name="form.COMPARE_17_USERDESC" default="">
<cfparam name="form.COMPARE_17_USERHUDLINE" default="">
<cfparam name="form.COMPARE_17_USERAMOUNT" default="">
<cfparam name="form.COMPARE_17_GFE_USERAMOUNT" default="">
<cfparam name="form.COMPARE_17_HUD_USERAMOUNT" default="">
<cfparam name="form.COMPARE_18_USERDESC" default="">
<cfparam name="form.COMPARE_18_USERHUDLINE" default="">
<cfparam name="form.COMPARE_18_USERAMOUNT" default="">
<cfparam name="form.COMPARE_18_GFE_USERAMOUNT" default="">
<cfparam name="form.COMPARE_18_HUD_USERAMOUNT" default="">
<cfparam name="form.TERMS_01_INITIALLOANAMOUNT" default="">
<cfparam name="form.TERMS_02_LOANTERM" default="">
<cfparam name="form.TERMS_03_INTERESTRATE" default="">
<cfparam name="form.TERMS_04_MONTHLYAMOUNT" default="">
<cfparam name="form.TERMS_04_INCLUDESPRINCIPAL" default="">
<cfparam name="form.TERMS_04_INCLUDESINTEREST" default="">
<cfparam name="form.TERMS_04_INCLUDESMORTGAGEINS" default="">
<cfparam name="form.TERMS_05_CANINTERESTRISE" default="">
<cfparam name="form.TERMS_05_MAXINTEREST" default="">
<cfparam name="form.TERMS_05_FIRSTCHANGEDATE" default="">
<cfparam name="form.TERMS_05_CHANGEYEARS" default="">
<cfparam name="form.TERMS_05_AFTERDATE" default="">
<cfparam name="form.TERMS_05_CHANGEPERCENT" default="">
<cfparam name="form.TERMS_05_LOWESTINTEREST" default="">
<cfparam name="form.TERMS_05_HIGHESTINTEREST" default="">
<cfparam name="form.TERMS_06_CANBALANCERISE" default="">
<cfparam name="form.TERMS_06_MAXBALANCE" default="">
<cfparam name="form.TERMS_07_CANMONTHLYRISE" default="">
<cfparam name="form.TERMS_07_FIRSTRISEDATE" default="">
<cfparam name="form.TERMS_07_FIRSTRISEAMOUNT" default="">
<cfparam name="form.TERMS_07_MAXRISEAMOUNT" default="">
<cfparam name="form.TERMS_08_PREPAYMENTPENALTY" default="">
<cfparam name="form.TERMS_08_MAXPREPAYMENTPENALTY" default="">
<cfparam name="form.TERMS_09_BALLOONPAYMENT" default="">
<cfparam name="form.TERMS_09_BALLOONPAYMENTAMOUNT" default="">
<cfparam name="form.TERMS_09_BALLOONPAYMENTDUEYEARS" default="">
<cfparam name="form.TERMS_09_BALLOONPAYMENTDUEDATE" default="">
<cfparam name="form.TERMS_10_TOTALESCROW" default="">
<cfparam name="form.TERMS_10_ADDTIONALPAYMENT" default="">
<cfparam name="form.TERMS_10_MONTHLYPAYMENT" default="">
<cfparam name="form.TERMS_10_PROPERTYTAX" default="">
<cfparam name="form.TERMS_10_HOMEOWNERSINS" default="">
<cfparam name="form.TERMS_10_FLOODINS" default="">
<cfparam name="form.TERMS_10_USERITEM1" default="">
<cfparam name="form.TERMS_10_USERITEM1_DESC" default="">
<cfparam name="form.TERMS_10_USERITEM2" default="">
<cfparam name="form.TERMS_10_USERITEM2_DESC" default="">
<cfparam name="form.TERMS_10_USERITEM3" default="">
<cfparam name="form.TERMS_10_USERITEM3_DESC" default="">

<CFQUERY datasource="#request.dsn#" NAME="check_for_HUD">
select * from HUD2010_TITLE_DATA
where title_id = #rec_id#
</CFQUERY>
<cfif check_for_HUD.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="insert_HUD">
Insert into HUD2010_TITLE_DATA (title_id)
values (#rec_id#)
</CFQUERY>
</cfif>
<CFQUERY datasource="#request.dsn#" NAME="check_for_HUD_b">
select * from HUD2010_TITLE_DATA_B
where title_id = #rec_id#
</CFQUERY>
<cfif check_for_HUD_b.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="insert_HUD">
Insert into HUD2010_TITLE_DATA_B (title_id)
values (#rec_id#)
</CFQUERY>
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="check_sequence" maxrows="1">
select sequence from HUD2010_TITLE_DATA_MODS where title_id = #rec_id#
order by sequence DESC
</CFQUERY>
<cfif check_sequence.recordcount>
<cfset new_sequence = check_sequence.sequence + 1>
<cfelse>
<cfset new_sequence =  1>
</cfif>


<cfset hud_data_fields = "B_LOANTYPE,B_6_FILENUMBER,B_7_LOANNUMBER,B_8_CASENUMBER,D_BORROWERNAMEADDRESS,E_SELLERNAMEADDRESS,F_LENDERNAMEADDRESS,H_SETTLEMENTAGENT,I_1_SETTLEMENTDATE,I_2_SETTLEMENTADDRESS,A_0101_CONTRACTSALESPRICE,A_0401_CONTRACTSALESPRICE,A_0102_PERSONALPROPERTY,A_0402_PERSONALPROPERTY,A_0103_SETTLEMENTCHARGESTOBORROWER,A_0403_USERDESC,A_0403_USERAMOUNT,A_0104_USERDESC,A_0104_USERAMOUNT,A_0404_USERDESC,A_0404_USERAMOUNT,A_0105_USERDESC,A_0105_USERAMOUNT,A_0405_USERDESC,A_0405_USERAMOUNT,A_0106_CITYTOWNTAXESDATEFROM,A_0106_CITYTOWNTAXESDATETO,A_0106_CITYTOWNTAXESAMOUNT,A_0406_CITYTOWNTAXESDATEFROM,A_0406_CITYTOWNTAXESDATETO,A_0406_CITYTOWNTAXESAMOUNT,A_0107_COUNTYTAXESDATEFROM,A_0107_COUNTYTAXESDATETO,A_0107_COUNTYTAXESAMOUNT,A_0407_COUNTYTAXESDATEFROM,A_0407_COUNTYTAXESDATETO,A_0407_COUNTYTAXESAMOUNT,A_0108_ASSESSMENTSDATEFROM,A_0108_ASSESSMENTSDATETO,A_0108_ASSESSMENTSAMOUNT,A_0408_ASSESSMENTSDATEFROM,A_0408_ASSESSMENTSDATETO,A_0408_ASSESSMENTSAMOUNT,A_0109_USERDESC,A_0109_USERPAYTO,A_0109_USERAMOUNT,A_0409_USERDESC,A_0409_USERPAYTO,A_0409_USERAMOUNT,A_0110_USERDESC,A_0110_USERPAYTO,A_0110_USERAMOUNT,A_0410_USERDESC,A_0410_USERPAYTO,A_0410_USERAMOUNT,A_0111_USERDESC,A_0111_USERPAYTO,A_0111_USERAMOUNT,A_0411_USERDESC,A_0411_USERPAYTO,A_0411_USERAMOUNT,A_0112_USERDESC,A_0112_USERPAYTO,A_0112_USERAMOUNT,A_0412_USERDESC,A_0412_USERPAYTO,A_0412_USERAMOUNT,A_0201_EARNESTMONEYAMOUNT,A_0501_EXCESSDEPOSITAMOUNT,A_0202_PRINCIPALNEWLOANAMOUNT,A_0502_SETTLEMENTCHARGESTOSELLERAMOUNT,A_0203_EXISTINGLOANSAMOUNT,A_0503_EXISTINGLOANSAMOUNT,A_0204_USERDESC,A_0204_USERAMOUNT,A_0504_PAYOFFFIRSTMORTGAGEAMOUNT,A_0205_USERDESC,A_0205_USERAMOUNT,A_0505_PAYOFFSECONDMORTGAGEAMOUNT,A_0206_USERDESC,A_0206_USERAMOUNT,A_0506_USERDESC,A_0506_USERAMOUNT,A_0207_USERDESC,A_0207_USERAMOUNT,A_0507_USERDESC,A_0507_USERAMOUNT,A_0208_USERDESC,A_0208_USERAMOUNT,A_0508_USERDESC,A_0508_USERAMOUNT,A_0209_USERDESC,A_0209_USERAMOUNT,A_0509_USERDESC,A_0509_USERAMOUNT,A_0210_CITYTOWNTAXESDATEFROM,A_0210_CITYTOWNTAXESDATETO,A_0210_CITYTOWNTAXESAMOUNT,A_0510_CITYTOWNTAXESDATEFROM,A_0510_CITYTOWNTAXESDATETO,A_0510_CITYTOWNTAXESAMOUNT,A_0211_COUNTYTAXESDATEFROM,A_0211_COUNTYTAXESDATETO,A_0211_COUNTYTAXESAMOUNT,A_0511_COUNTYTAXESDATEFROM,A_0511_COUNTYTAXESDATETO,A_0511_COUNTYTAXESAMOUNT,A_0212_ASSESSMENTSDATEFROM,A_0212_ASSESSMENTSDATETO,A_0212_ASSESSMENTSAMOUNT,A_0512_ASSESSMENTSDATEFROM,A_0512_ASSESSMENTSDATETO,A_0512_ASSESSMENTSAMOUNT,A_0213_USERDESC,A_0213_USERPAYTO,A_0213_USERAMOUNT,A_0513_USERDESC,A_0513_USERPAYTO,A_0513_USERAMOUNT,A_0214_USERDESC,A_0214_USERPAYTO,A_0214_USERAMOUNT,A_0514_USERDESC,A_0514_USERPAYTO,A_0514_USERAMOUNT,A_0215_USERDESC,A_0215_USERPAYTO,A_0215_USERAMOUNT,A_0515_USERDESC,A_0515_USERPAYTO,A_0515_USERAMOUNT,A_0216_USERDESC,A_0216_USERPAYTO,A_0216_USERAMOUNT,A_0516_USERDESC,A_0516_USERPAYTO,A_0516_USERAMOUNT,A_0217_USERDESC,A_0217_USERPAYTO,A_0217_USERAMOUNT,A_0517_USERDESC,A_0517_USERPAYTO,A_0517_USERAMOUNT,A_0218_USERDESC,A_0218_USERPAYTO,A_0218_USERAMOUNT,A_0518_USERDESC,A_0518_USERPAYTO,A_0518_USERAMOUNT,A_0219_USERDESC,A_0219_USERPAYTO,A_0219_USERAMOUNT,A_0519_USERDESC,A_0519_USERPAYTO,A_0519_USERAMOUNT,A_0220_TOTALPAIDBYSELLERAMOUNT,A_0520_REDUCTIONDUESELLERAMOUNT,A_0301_GROSSDUEFROMBORROWERAMOUNT,A_0601_GROSSDUETOSELLERAMOUNT,A_0302_LESSPAIDBYBORROWERAMOUNT,A_0602_LESSREDUCTIONSDUESELLERAMOUNT,A_0303_CASHTOFROM,A_0303_CASHAMOUNT,A_0603_CASHTOFROM,A_0603_CASHAMOUNT,A_0701_COMMISSIONAMOUNT,A_0701_COMMISSIONPAYTO,A_0702_COMMISSIONAMOUNT,A_0702_COMMISSIONPAYTO,A_0703_BORROWER_COMMISSIONAMOUNT,A_0703_SELLER_COMMISSIONAMOUNT,A_0704_USERDESC,A_0704_USERPAYTO,A_0704_BORROWER_USERAMOUNT,A_0704_SELLER_USERAMOUNT,A_0705_USERDESC,A_0705_USERPAYTO,A_0705_BORROWER_USERAMOUNT,A_0705_SELLER_USERAMOUNT,A_0706_USERDESC,A_0706_USERPAYTO,A_0706_BORROWER_USERAMOUNT,A_0706_SELLER_USERAMOUNT,A_0801_OUTSIDE_ORIGINATIONCHARGE,A_0801_BORROWER_ORIGINATIONCHARGE,A_0801_SELLER_ORIGINATIONCHARGE,A_0802_OUTSIDE_POINTS,A_0802_BORROWER_POINTS,A_0802_SELLER_POINTS,A_0803_BORROWER_ADJORIGINATIONCHARGE,A_0803_SELLER_ADJORIGINATIONCHARGE,A_0804_APPRAISALFEEPAYTO,A_0804_BORROWER_APPRAISALFEE,A_0804_APPRAISALFEE_OUTSIDE_AMOUNT,A_0804_SELLER_APPRAISALFEE,A_0805_CREDITREPORTPAYTO,A_0805_BORROWER_CREDITREPORT,A_0805_SELLER_CREDITREPORT,A_0806_TAXSERVICEPAYTO,A_0806_BORROWER_TAXSERVICE,A_0806_SELLER_TAXSERVICE,A_0807_FLOODCERTPAYTO,A_0807_BORROWER_FLOODCERT,A_0807_SELLER_FLOODCERT,A_0808_USERDESC,A_0808_USERPAYTO,A_0808_BORROWER_USERAMOUNT,A_0808_SELLER_USERAMOUNT,A_0809_USERDESC,A_0809_USERPAYTO,A_0809_BORROWER_USERAMOUNT,A_0809_SELLER_USERAMOUNT,A_0810_USERDESC,A_0810_USERPAYTO,A_0810_BORROWER_USERAMOUNT,A_0810_SELLER_USERAMOUNT,A_0811_USERDESC,A_0811_USERPAYTO,A_0811_BORROWER_USERAMOUNT,A_0811_SELLER_USERAMOUNT,A_0812_USERDESC,A_0812_USERPAYTO,A_0812_BORROWER_USERAMOUNT,A_0812_SELLER_USERAMOUNT,A_0901_DAILYINTERESTDATEFROM,A_0901_DAILYINTERESTDATETO,A_0901_OUTSIDE_DAILYINTERESTPERDAY,A_0901_BORROWER_DAILYINTEREST,A_0901_SELLER_DAILYINTEREST,A_0902_MORTGAGEINSMONTHS,A_0902_MORTGAGEINSPAYTO,A_0902_BORROWER_MORTGAGEINS,A_0902_SELLER_MORTGAGEINS,A_0903_HOMEOWNERSINSMONTHS,A_0903_HOMEOWNERSINSPAYTO,A_0903_BORROWER_HOMEOWNERSINS,A_0903_SELLER_HOMEOWNERSINS,A_0904_USERDESC,A_0904_BORROWER_USERAMOUNT,A_0904_SELLER_USERAMOUNT,A_1001_BORROWER_INITIALESCROWDEPOSIT,A_1001_SELLER_INITIALESCROWDEPOSIT,A_1002_HOMEOWNERSINSMONTHS,A_1002_HOMEOWNERSINSPERMONTH,A_1002_OUTSIDE_HOMEOWNERSINS,A_1002_BORROWER_HOMEOWNERSINS,A_1002_SELLER_HOMEOWNERSINS,A_1003_MORTGAGEINSMONTHS,A_1003_MORTGAGEINSPERMONTH,A_1003_OUTSIDE_MORTGAGEINS,A_1003_BORROWER_MORTGAGEINS,A_1003_SELLER_MORTGAGEINS,A_1004_CITYPROPTAXMONTHS,A_1004_CITYPROPTAXPERMONTH,A_1004_OUTSIDE_CITYPROPTAX,A_1004_BORROWER_CITYPROPTAX,A_1004_SELLER_CITYPROPTAX,A_1005_COUNTYPROPTAXMONTHS,A_1005_COUNTYPROPTAXPERMONTH,A_1005_OUTSIDE_COUNTYPROPTAX,A_1005_BORROWER_COUNTYPROPTAX,A_1005_SELLER_COUNTYPROPTAX,A_1006_ASSESSMENTSMONTHS,A_1006_ASSESSMENTSPERMONTH,A_1006_OUTSIDE_ASSESSMENTS,A_1006_BORROWER_ASSESSMENTS,A_1006_SELLER_ASSESSMENTS,A_1007_OUTSIDE_AGGREGATEADJUSTMENT,A_1007_BORROWER_AGGREGATEADJUSTMENT,A_1007_SELLER_AGGREGATEADJUSTMENT,A_1101_BORROWER_TITLESERVICES,A_1101_SELLER_TITLESERVICES,A_1102_CLOSINGFEEPAYTO,A_1102_OUTSIDE_CLOSINGFEE,A_1102_BORROWER_CLOSINGFEE,A_1102_SELLER_CLOSINGFEE,A_1103_OWNERSTITLEINSPAYTO,A_1103_OUTSIDE_OWNERSTITLEINS,A_1103_BORROWER_OWNERSTITLEINS,A_1103_SELLER_OWNERSTITLEINS,A_1104_LENDERSTITLEINSPAYTO,A_1104_OUTSIDE_LENDERSTITLEINS,A_1104_BORROWER_LENDERSTITLEINS,A_1104_SELLER_LENDERSTITLEINS,A_1105_LENDERSTITLEPOLICYLIMIT,A_1106_OWNERSTITLEPOLICYLIMIT,A_1107_AGENTPREMIUMPORTION,A_1108_UNDERWRITERPREMIUMPORTION,A_1109_USERDESC,A_1109_USERPAYTO,A_1109_OUTSIDE_USERAMOUNT,A_1109_BORROWER_USERAMOUNT,A_1109_SELLER_USERAMOUNT,A_1110_USERDESC,A_1110_USERPAYTO,A_1110_OUTSIDE_USERAMOUNT,A_1110_BORROWER_USERAMOUNT,A_1110_SELLER_USERAMOUNT,A_1111_USERDESC,A_1111_USERPAYTO,A_1111_OUTSIDE_USERAMOUNT,A_1111_BORROWER_USERAMOUNT,A_1111_SELLER_USERAMOUNT,A_1112_USERDESC,A_1112_USERPAYTO,A_1112_OUTSIDE_USERAMOUNT,A_1112_BORROWER_USERAMOUNT,A_1112_SELLER_USERAMOUNT,A_1113_USERDESC,A_1113_USERPAYTO,A_1113_OUTSIDE_USERAMOUNT,A_1113_BORROWER_USERAMOUNT,A_1113_SELLER_USERAMOUNT">
<CFQUERY datasource="#request.dsn#" NAME="update_hud_data">
Update HUD2010_TITLE_DATA set
<cfloop index="i" list="#hud_data_fields#" delimiters=","><cfif #i# contains 'DATE'>
<cfif Trim(Evaluate(#i#)) eq ''>
#i# = NULL,
<cfelse>
#i# = '#Trim(ReplaceNoCase(Evaluate("#i#"), "'", "", "ALL"))#',
</cfif>
<cfelse>#i# = '#Trim(ReplaceNoCase(Evaluate("#i#"), "'", "", "ALL"))#',</cfif></cfloop>
title_id = '#rec_id#'
Where title_id = #rec_id#
</cfquery>
<cfset save_mods = 0>


<cfif check_for_hud.recordcount>
<cfloop index="i" list="#hud_data_fields#" delimiters=",">
<cfif Evaluate("check_for_hud.#i#") neq  Evaluate("form.#i#")>
<cfset save_mods = 1>
<cfquery datasource="#request.dsn#">
INSERT INTO 
HUD2010_TITLE_MODS (title_id, field_num, previous_value, current_value, c_date, c_time, user_id)
VALUES (#rec_id#, '#i#', '#Evaluate("check_for_hud.#i#")#', '#Evaluate("form.#i#")#', '#c_date#', '#c_time#', '#session.ft_user_id#')
</cfquery>
</cfif>
</cfloop>
</cfif>

<cfif save_mods eq 1>
<CFQUERY datasource="#request.dsn#" NAME="insert_HUD">
Insert into HUD2010_TITLE_DATA_MODS (title_id, sequence)
values (#rec_id#, #new_sequence#)
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="update_hud_data">
Update HUD2010_TITLE_DATA_MODS set
<cfloop index="i" list="#hud_data_fields#" delimiters=","><cfif #i# contains 'DATE'>
<cfif Trim(Evaluate(#i#)) eq ''>
#i# = NULL,
<cfelse>
#i# = '#Trim(ReplaceNoCase(Evaluate("#i#"), "'", "", "ALL"))#',
</cfif>
<cfelse>#i# = '#Trim(ReplaceNoCase(Evaluate("#i#"), "'", "", "ALL"))#',</cfif></cfloop>
title_id = '#rec_id#'
Where title_id = #rec_id# and sequence = #new_sequence#
</cfquery>
</cfif>



<cfset hud_data_fields_b = "A_1201_BORROWER_GOVTRECORDINGCHARGES,A_1201_SELLER_GOVTRECORDINGCHARGES,A_1202_DEED,A_1202_DEEDMORTGAGE,A_1202_DEEDRELEASES,A_1202_BORROWER_DEED,A_1202_SELLER_DEED,A_1203_BORROWER_TRANSFERTAXES,A_1203_SELLER_TRANSFERTAXES,A_1204_CITYCOUNTYTAXDEED,A_1204_CITYCOUNTYTAXMORTGAGE,A_1204_BORROWER_CITYCOUNTYTAX,A_1204_SELLER_CITYCOUNTYTAX,A_1205_STATETRANSTAXDEED,A_1205_STATETRANSTAXMORTGAGE,A_1205_BORROWER_STATETRANSTAX,A_1205_SELLER_STATETRANSTAX,A_1206_USERDESC,A_1206_USERPAYTO,A_1206_OUTSIDE_USERAMOUNT,A_1206_BORROWER_USERAMOUNT,A_1207_USERDESC,A_1207_USERPAYTO,A_1207_OUTSIDE_USERAMOUNT,A_1207_BORROWER_USERAMOUNT,A_1207_SELLER_USERAMOUNT,A_1301_BORROWER_SERVICESYOUCANSHOPFOR,A_1301_SELLER_SERVICESYOUCANSHOPFOR,A_1302_USERDESC,A_1302_USERPAYTO,A_1302_OUTSIDE_USERAMOUNT,A_1302_BORROWER_USERAMOUNT,A_1302_SELLER_USERAMOUNT,A_1303_USERDESC,A_1303_USERPAYTO,A_1303_OUTSIDE_USERAMOUNT,A_1303_BORROWER_USERAMOUNT,A_1303_SELLER_USERAMOUNT,A_1304_USERDESC,A_1304_USERPAYTO,A_1304_OUTSIDE_USERAMOUNT,A_1304_BORROWER_USERAMOUNT,A_1304_SELLER_USERAMOUNT,A_1305_USERDESC,A_1305_USERPAYTO,A_1305_OUTSIDE_USERAMOUNT,A_1305_BORROWER_USERAMOUNT,A_1305_SELLER_USERAMOUNT,A_1306_USERDESC,A_1306_USERPAYTO,A_1306_OUTSIDE_USERAMOUNT,A_1306_BORROWER_USERAMOUNT,A_1306_SELLER_USERAMOUNT,A_1307_USERDESC,A_1307_USERPAYTO,A_1307_OUTSIDE_USERAMOUNT,A_1307_BORROWER_USERAMOUNT,A_1307_SELLER_USERAMOUNT,A_1308_USERDESC,A_1308_USERPAYTO,A_1308_OUTSIDE_USERAMOUNT,A_1308_BORROWER_USERAMOUNT,A_1308_SELLER_USERAMOUNT,A_1400_BORROWER_TOTALSETTLEMENTCHARGES,A_1400_SELLER_TOTALSETTLEMENTCHARGES,COMPARE_01_GFE_ORIGINCHARGE,COMPARE_01_HUD_ORIGINCHARGE,COMPARE_02_GFE_POINTS,COMPARE_02_HUD_POINTS,COMPARE_03_GFE_ADJORIGINCHARGE,COMPARE_03_HUD_ADJORIGINCHARGE,COMPARE_04_GFE_TRANSFERTAX,COMPARE_04_HUD_TRANSFERTAX,COMPARE_05_GFE_GOVTRECCHARGE,COMPARE_05_HUD_GOVTRECCHARGE,COMPARE_06_USERHUDDESC,COMPARE_06_USERHUDLINE,COMPARE_06_GFE_USERAMOUNT,COMPARE_06_HUD_USERAMOUNT,COMPARE_07_USERHUDDESC,COMPARE_07_USERHUDLINE,COMPARE_07_GFE_USERAMOUNT,COMPARE_07_HUD_USERAMOUNT,COMPARE_08_USERHUDDESC,COMPARE_08_USERHUDLINE,COMPARE_08_GFE_USERAMOUNT,COMPARE_08_HUD_USERAMOUNT,COMPARE_09_USERHUDDESC,COMPARE_09_USERHUDLINE,COMPARE_09_GFE_USERAMOUNT,COMPARE_09_HUD_USERAMOUNT,COMPARE_10_USERHUDDESC,COMPARE_10_USERHUDLINE,COMPARE_10_GFE_USERAMOUNT,COMPARE_10_HUD_USERAMOUNT,COMPARE_11_USERHUDDESC,COMPARE_11_USERHUDLINE,COMPARE_11_GFE_USERAMOUNT,COMPARE_11_HUD_USERAMOUNT,COMPARE_12_USERHUDDESC,COMPARE_12_USERHUDLINE,COMPARE_12_GFE_USERAMOUNT,COMPARE_12_HUD_USERAMOUNT,COMPARE_13_GFE_ESCROWDEPOSIT,COMPARE_13_HUD_ESCROWDEPOSIT,COMPARE_14_INTERESTCHARGESPERDAY,COMPARE_14_GFE_INTERESTCHARGES,COMPARE_14_HUD_INTERESTCHARGES,COMPARE_15_GFE_HOMEOWNERSINS,COMPARE_15_HUD_HOMEOWNERSINS,COMPARE_16_USERDESC,COMPARE_16_USERHUDLINE,COMPARE_16_USERAMOUNT,COMPARE_16_GFE_USERAMOUNT,COMPARE_16_HUD_USERAMOUNT,COMPARE_17_USERDESC,COMPARE_17_USERHUDLINE,COMPARE_17_USERAMOUNT,COMPARE_17_GFE_USERAMOUNT,COMPARE_17_HUD_USERAMOUNT,COMPARE_18_USERDESC,COMPARE_18_USERHUDLINE,COMPARE_18_USERAMOUNT,COMPARE_18_GFE_USERAMOUNT,COMPARE_18_HUD_USERAMOUNT,TERMS_01_INITIALLOANAMOUNT,TERMS_02_LOANTERM,TERMS_03_INTERESTRATE,TERMS_04_MONTHLYAMOUNT,TERMS_04_INCLUDESPRINCIPAL,TERMS_04_INCLUDESINTEREST,TERMS_04_INCLUDESMORTGAGEINS,TERMS_05_CANINTERESTRISE,TERMS_05_MAXINTEREST,TERMS_05_FIRSTCHANGEDATE,TERMS_05_CHANGEYEARS,TERMS_05_AFTERDATE,TERMS_05_CHANGEPERCENT,TERMS_05_LOWESTINTEREST,TERMS_05_HIGHESTINTEREST,TERMS_06_CANBALANCERISE,TERMS_06_MAXBALANCE,TERMS_07_CANMONTHLYRISE,TERMS_07_FIRSTRISEDATE,TERMS_07_FIRSTRISEAMOUNT,TERMS_07_MAXRISEAMOUNT,TERMS_08_PREPAYMENTPENALTY,TERMS_08_MAXPREPAYMENTPENALTY,TERMS_09_BALLOONPAYMENT,TERMS_09_BALLOONPAYMENTAMOUNT,TERMS_09_BALLOONPAYMENTDUEYEARS,TERMS_09_BALLOONPAYMENTDUEDATE,TERMS_10_TOTALESCROW,TERMS_10_ADDTIONALPAYMENT,TERMS_10_MONTHLYPAYMENT,TERMS_10_PROPERTYTAX,TERMS_10_HOMEOWNERSINS,TERMS_10_FLOODINS,TERMS_10_USERITEM1,TERMS_10_USERITEM1_DESC,TERMS_10_USERITEM2,TERMS_10_USERITEM2_DESC,TERMS_10_USERITEM3,TERMS_10_USERITEM3_DESC">
<CFQUERY datasource="#request.dsn#" NAME="update_hud_data_b">
Update HUD2010_TITLE_DATA_b set
<cfloop index="i" list="#hud_data_fields_b#" delimiters=","><cfif #i# contains 'DATE'>
<cfif Trim(Evaluate(#i#)) eq ''>
#i# = NULL,
<cfelse>
#i# = '#Trim(ReplaceNoCase(Evaluate("#i#"), "'", "", "ALL"))#',
</cfif>
<cfelse>#i# = '#Trim(ReplaceNoCase(Evaluate("#i#"), "'", "", "ALL"))#',</cfif></cfloop>
title_id = '#rec_id#'
Where title_id = #rec_id#
</cfquery>


<cfif check_for_hud.recordcount>
<cfloop index="i" list="#hud_data_fields_b#" delimiters=",">
<cfif Evaluate("check_for_hud_b.#i#") neq  Evaluate("form.#i#")>
<cfset save_mods = 1>
<cfquery datasource="#request.dsn#">
INSERT INTO 
HUD2010_TITLE_MODS (title_id, field_num, previous_value, current_value, c_date, c_time, user_id)
VALUES (#rec_id#, '#i#', '#ReplaceNoCase(Evaluate("check_for_hud_b.#i#"), "'", "''", "ALL")#', '#ReplaceNoCase(Evaluate("form.#i#"), "'", "''", "ALL")#', '#c_date#', '#c_time#', '#session.ft_user_id#')
</cfquery>
</cfif>
</cfloop>
</cfif>

<cfif save_mods eq 1>
<CFQUERY datasource="#request.dsn#" NAME="insert_HUD">
Insert into HUD2010_TITLE_DATA_B_MODS (title_id, sequence)
values (#rec_id#, #new_sequence#)
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="update_hud_data_b">
Update HUD2010_TITLE_DATA_B_MODS set
<cfloop index="i" list="#hud_data_fields_b#" delimiters=","><cfif #i# contains 'DATE'>
<cfif Trim(Evaluate(#i#)) eq ''>
#i# = NULL,
<cfelse>
#i# = '#Trim(ReplaceNoCase(Evaluate("#i#"), "'", "", "ALL"))#',
</cfif>
<cfelse>#i# = '#Trim(ReplaceNoCase(Evaluate("#i#"), "'", "", "ALL"))#',</cfif></cfloop>
title_id = '#rec_id#'
Where title_id = #rec_id# and sequence = #new_sequence#
</cfquery>
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="update_title_data">
Update title set
PADDRESS = '#PADDRESS#',
PCITY = '#PCITY#',
PCOUNTY = '#PCOUNTY#',
PSTATE = '#PSTATE#',
PZIP = '#PZIP#',
LOAN_NUMBER = '#B_7_LOANNUMBER#'
where title_id = #rec_id#
</cfquery>

<cfset update_this_title_id = #rec_id#>
<cfinclude template="rick_tests/recalculate_hud_2010.cfm">


<cflocation url="HUD1_2010_modify.cfm?rec_id=#rec_id#">




