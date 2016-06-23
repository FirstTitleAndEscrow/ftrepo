<cfparam name="a_trigger" default="0">
<cfparam name="uid" default="">
<cfparam name="lo_id" default="">

<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script type="text/javascript" language="JavaScript">
function roundit(Num, Places) {
   if (Places > 0) {
      if ((Num.toString().length - Num.toString().lastIndexOf('.')) > (Places + 1)) {
         var Rounder = Math.pow(10, Places);
         return Math.round(Num * Rounder) / Rounder;
      }
      else return Num;
   }
   else return Math.round(Num);
}





var dtCh= "/";
var minYear=1900;
var maxYear=2100;

function isInteger(s){
	var i;
    for (i = 0; i < s.length; i++){
        // Check that current character is number.
        var c = s.charAt(i);
        if (((c < "0") || (c > "9"))) return false;
    }
    // All characters are numbers.
    return true;
}

function stripCharsInBag(s, bag){
	var i;
    var returnString = "";
    // Search through string's characters one by one.
    // If character is not in bag, append to returnString.
    for (i = 0; i < s.length; i++){
        var c = s.charAt(i);
        if (bag.indexOf(c) == -1) returnString += c;
    }
    return returnString;
}

function daysInFebruary (year){
	// February has 29 days in any year evenly divisible by four,
    // EXCEPT for centurial years which are not also divisible by 400.
    return (((year % 4 == 0) && ( (!(year % 100 == 0)) || (year % 400 == 0))) ? 29 : 28 );
}
function DaysArray(n) {
	for (var i = 1; i <= n; i++) {
		this[i] = 31
		if (i==4 || i==6 || i==9 || i==11) {this[i] = 30}
		if (i==2) {this[i] = 29}
   }
   return this
}

function isDate(dtStr){
	var daysInMonth = DaysArray(12)
	var pos1=dtStr.indexOf(dtCh)
	var pos2=dtStr.indexOf(dtCh,pos1+1)
	var strMonth=dtStr.substring(0,pos1)
	var strDay=dtStr.substring(pos1+1,pos2)
	var strYear=dtStr.substring(pos2+1)
	strYr=strYear
	if (strDay.charAt(0)=="0" && strDay.length>1) strDay=strDay.substring(1)
	if (strMonth.charAt(0)=="0" && strMonth.length>1) strMonth=strMonth.substring(1)
	for (var i = 1; i <= 3; i++) {
		if (strYr.charAt(0)=="0" && strYr.length>1) strYr=strYr.substring(1)
	}
	month=parseInt(strMonth)
	day=parseInt(strDay)
	year=parseInt(strYr)
	if (pos1==-1 || pos2==-1){
		alert("The date format should be : mm/dd/yyyy")
		return false
	}
	if (strMonth.length<1 || month<1 || month>12){
		alert("Please enter a valid month")
		return false
	}
	if (strDay.length<1 || day<1 || day>31 || (month==2 && day>daysInFebruary(year)) || day > daysInMonth[month]){
		alert("Please enter a valid day")
		return false
	}
	if (strYear.length != 4 || year==0 || year<minYear || year>maxYear){
		alert("Please enter a valid 4 digit year between "+minYear+" and "+maxYear)
		return false
	}
	if (dtStr.indexOf(dtCh,pos2+1)!=-1 || isInteger(stripCharsInBag(dtStr, dtCh))==false){
		alert("Please enter a valid date")
		return false
	}
return true
}



function cant_edit(box)
{
  alert("You can't edit text in this field.");
  box.blur();
  return true;
}


function locate(){
         var name = prompt("Type your full name below", "");
	if (name != '' && name != null){
		document.frm.user_id_1.value = name;
		return true
		}else{
		alert ("Comment was NOT added")
return false;
  }
return true;
}



function IsNumeric(str)
// returns true if str is numeric
// that is it contains only the digits 0-9
// returns false otherwise
// returns false if empty
{
  var len= str.length;
  if (len==0)
    return false;
  //else
  var p=0;
  var ok= true;
  var ch= "";
  while (ok && p<len)
  {
    ch= str.charAt(p);
    if ('0'<=ch && ch<='9' || ch=='.' || ch=='-')
      p++;
    else
      ok= false;
  }
  return ok;
}


function AddUp() {
<!--- 1500 series BUYER --->
document.frm.a_1520.value = 0;
if (IsNumeric(document.frm.a_1501_b.value) &&  document.frm.a_1501_b.value != 0) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1501_b.value), 2);
}
if (IsNumeric(document.frm.a_1502_b.value) &&  document.frm.a_1502_b.value != 0) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1502_b.value), 2);
}
if (IsNumeric(document.frm.a_1503_b.value) &&  document.frm.a_1503_b.value != 0) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1503_b.value), 2);
}
if (IsNumeric(document.frm.a_1504_b.value) &&  document.frm.a_1504_b.value != 0) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1504_b.value), 2);
}
if (IsNumeric(document.frm.a_1505_b.value) &&  document.frm.a_1505_b.value != 0) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1505_b.value), 2);
}
if (IsNumeric(document.frm.a_1506_b.value) &&  document.frm.a_1506_b.value != 0) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1506_b.value), 2);
}
if (IsNumeric(document.frm.a_1507_b.value) &&  document.frm.a_1507_b.value != 0) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1507_b.value), 2);
}
if (IsNumeric(document.frm.a_1508_b.value) &&  document.frm.a_1508_b.value != 0) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1508_b.value), 2);
}
if (IsNumeric(document.frm.a_1509_b.value) &&  document.frm.a_1509_b.value != 0) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1509_b.value), 2);
}
if (IsNumeric(document.frm.a_1510_b.value) &&  document.frm.a_1510_b.value != 0) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1510_b.value), 2);
}
if (IsNumeric(document.frm.a_1511_b.value) &&  document.frm.a_1511_b.value != 0) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1511_b.value), 2);
}
if (IsNumeric(document.frm.a_1512_b.value) &&  document.frm.a_1512_b.value != 0) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1512_b.value), 2);
}
if (IsNumeric(document.frm.a_1513_b.value) &&  document.frm.a_1513_b.value != 0) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1513_b.value), 2);
}
if (IsNumeric(document.frm.a_1514_b.value) &&  document.frm.a_1514_b.value != 0) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1514_b.value), 2);
}
if (IsNumeric(document.frm.a_1515_b.value) &&  document.frm.a_1515_b.value != 0) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1515_b.value), 2);
}
if (IsNumeric(document.frm.a_1516_b.value) &&  document.frm.a_1516_b.value != 0) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1516_b.value), 2);
}
if (IsNumeric(document.frm.a_1517_b.value) &&  document.frm.a_1517_b.value != 0) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1517_b.value), 2);
}
if (IsNumeric(document.frm.a_1518_b.value) &&  document.frm.a_1518_b.value != 0) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1518_b.value), 2);
}
if (IsNumeric(document.frm.a_1519_b.value) &&  document.frm.a_1519_b.value != 0) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1519_b.value), 2);
}
document.frm.a_1308_b.value = document.frm.a_1520.value;
<!--- END 1500 series BUYER --->


<!--- 1500 Series Seller --->
document.frm.a_1520_b.value = 0;
if (IsNumeric(document.frm.a_1501_c.value) &&  document.frm.a_1501_c.value != 0) {
document.frm.a_1520_b.value = roundit(parseFloat(document.frm.a_1520_b.value) + parseFloat(document.frm.a_1501_c.value), 2);
}
if (IsNumeric(document.frm.a_1502_c.value) &&  document.frm.a_1502_c.value != 0) {
document.frm.a_1520_b.value = roundit(parseFloat(document.frm.a_1520_b.value) + parseFloat(document.frm.a_1502_c.value), 2);
}
if (IsNumeric(document.frm.a_1503_c.value) &&  document.frm.a_1503_c.value != 0) {
document.frm.a_1520_b.value = roundit(parseFloat(document.frm.a_1520_b.value) + parseFloat(document.frm.a_1503_c.value), 2);
}
if (IsNumeric(document.frm.a_1504_c.value) &&  document.frm.a_1504_c.value != 0) {
document.frm.a_1520_b.value = roundit(parseFloat(document.frm.a_1520_b.value) + parseFloat(document.frm.a_1504_c.value), 2);
}
if (IsNumeric(document.frm.a_1505_c.value) &&  document.frm.a_1505_c.value != 0) {
document.frm.a_1520_b.value = roundit(parseFloat(document.frm.a_1520_b.value) + parseFloat(document.frm.a_1505_c.value), 2);
}
if (IsNumeric(document.frm.a_1506_c.value) &&  document.frm.a_1506_c.value != 0) {
document.frm.a_1520_b.value = roundit(parseFloat(document.frm.a_1520_b.value) + parseFloat(document.frm.a_1506_c.value), 2);
}
if (IsNumeric(document.frm.a_1507_c.value) &&  document.frm.a_1507_c.value != 0) {
document.frm.a_1520_b.value = roundit(parseFloat(document.frm.a_1520_b.value) + parseFloat(document.frm.a_1507_c.value), 2);
}
if (IsNumeric(document.frm.a_1508_c.value) &&  document.frm.a_1508_c.value != 0) {
document.frm.a_1520_b.value = roundit(parseFloat(document.frm.a_1520_b.value) + parseFloat(document.frm.a_1508_c.value), 2);
}
if (IsNumeric(document.frm.a_1509_c.value) &&  document.frm.a_1509_c.value != 0) {
document.frm.a_1520_b.value = roundit(parseFloat(document.frm.a_1520_b.value) + parseFloat(document.frm.a_1509_c.value), 2);
}
if (IsNumeric(document.frm.a_1510_c.value) &&  document.frm.a_1510_c.value != 0) {
document.frm.a_1520_b.value = roundit(parseFloat(document.frm.a_1520_b.value) + parseFloat(document.frm.a_1510_c.value), 2);
}
if (IsNumeric(document.frm.a_1511_c.value) &&  document.frm.a_1511_c.value != 0) {
document.frm.a_1520_b.value = roundit(parseFloat(document.frm.a_1520_b.value) + parseFloat(document.frm.a_1511_c.value), 2);
}
if (IsNumeric(document.frm.a_1512_c.value) &&  document.frm.a_1512_c.value != 0) {
document.frm.a_1520_b.value = roundit(parseFloat(document.frm.a_1520_b.value) + parseFloat(document.frm.a_1512_c.value), 2);
}
if (IsNumeric(document.frm.a_1513_c.value) &&  document.frm.a_1513_c.value != 0) {
document.frm.a_1520_b.value = roundit(parseFloat(document.frm.a_1520_b.value) + parseFloat(document.frm.a_1513_c.value), 2);
}
if (IsNumeric(document.frm.a_1514_c.value) &&  document.frm.a_1514_c.value != 0) {
document.frm.a_1520_b.value = roundit(parseFloat(document.frm.a_1520_b.value) + parseFloat(document.frm.a_1514_c.value), 2);
}
if (IsNumeric(document.frm.a_1515_c.value) &&  document.frm.a_1515_c.value != 0) {
document.frm.a_1520_b.value = roundit(parseFloat(document.frm.a_1520_b.value) + parseFloat(document.frm.a_1515_c.value), 2);
}
if (IsNumeric(document.frm.a_1516_c.value) &&  document.frm.a_1516_c.value != 0) {
document.frm.a_1520_b.value = roundit(parseFloat(document.frm.a_1520_b.value) + parseFloat(document.frm.a_1516_c.value), 2);
}
if (IsNumeric(document.frm.a_1517_c.value) &&  document.frm.a_1517_c.value != 0) {
document.frm.a_1520_b.value = roundit(parseFloat(document.frm.a_1520_b.value) + parseFloat(document.frm.a_1517_c.value), 2);
}
if (IsNumeric(document.frm.a_1518_c.value) &&  document.frm.a_1518_c.value != 0) {
document.frm.a_1520_b.value = roundit(parseFloat(document.frm.a_1520_b.value) + parseFloat(document.frm.a_1518_c.value), 2);
}
if (IsNumeric(document.frm.a_1519_c.value) &&  document.frm.a_1519_c.value != 0) {
document.frm.a_1520_b.value = roundit(parseFloat(document.frm.a_1520_b.value) + parseFloat(document.frm.a_1519_c.value), 2);
}
document.frm.a_1308_c.value = document.frm.a_1520_b.value;
<!--- END 1500 series SELLER --->

document.frm.a_1400_a.value = 0;
document.frm.a_1400_b.value = 0;

<!--- 700 series --->
document.frm.a_700_a.value = 0
document.frm.a_703_a.value = 0
if (IsNumeric(document.frm.a_701_a.value) &&  document.frm.a_701_a.value != 0 && IsNumeric(document.frm.a_702_a.value) &&  document.frm.a_702_a.value != 0) {
document.frm.a_700_a.value = roundit(parseFloat(document.frm.a_701_a.value) + parseFloat(document.frm.a_702_a.value), 2);
document.frm.a_703_a.value = roundit(parseFloat(document.frm.a_700_a.value), 2);
} else if (IsNumeric(document.frm.a_701_a.value) &&  document.frm.a_701_a.value != 0 && document.frm.a_702_a.value == '') {
document.frm.a_700_a.value = roundit(parseFloat(document.frm.a_701_a.value), 2);
document.frm.a_703_a.value = roundit(parseFloat(document.frm.a_701_a.value), 2);
} else if (IsNumeric(document.frm.a_702_a.value) &&  document.frm.a_702_a.value != 0 && document.frm.a_701_a.value == '') {
document.frm.a_700_a.value = roundit(parseFloat(document.frm.a_702_a.value), 2);
document.frm.a_703_a.value = roundit(parseFloat(document.frm.a_702_a.value), 2);
}

if (IsNumeric(document.frm.a_703_a.value) &&  document.frm.a_703_a.value != 0) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_703_a.value), 2);
}


if (IsNumeric(document.frm.a_703_b.value) &&  document.frm.a_703_b.value != 0) {
document.frm.a_1400_b.value = roundit(parseFloat(document.frm.a_1400_b.value) + parseFloat(document.frm.a_703_b.value), 2);
}



<!--- END of 700 series --->



<!--- 800 series BUYERS--->
document.frm.a_801_b.value = 0;
if (IsNumeric(document.frm.a_801_g.value) && document.frm.a_801_g.value != '') {
document.frm.a_801_b.value = document.frm.a_801_g.value;
document.frm.a_801_a.value = '';
} else {
if (IsNumeric(document.frm.a_801_a.value) && document.frm.a_801_a.value != '') {
document.frm.a_801_g.value = '';
document.frm.a_801_b.value = roundit((parseFloat(document.frm.a_801_a.value) * parseFloat(document.frm.a_202.value)/100), 2);
}
}

document.frm.a_802_b.value = 0;
if (document.frm.a_802_g.value != '') {
document.frm.a_802_b.value = document.frm.a_802_g.value;
document.frm.a_802_a.value = '';
} else {
if (document.frm.a_802_a.value != '') {
document.frm.a_802_g.value = '';
document.frm.a_802_b.value = roundit((parseFloat(document.frm.a_802_a.value) * parseFloat(document.frm.a_202.value)/100), 2);
}
}


if (IsNumeric(document.frm.a_801_b.value) &&  document.frm.a_801_b.value != 0) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_801_b.value), 2);
}
if (IsNumeric(document.frm.a_802_b.value) &&  document.frm.a_802_b.value != 0) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_802_b.value), 2);
}
if (IsNumeric(document.frm.a_803_b.value) &&  document.frm.a_803_b.value != 0) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_803_b.value), 2);
}
if (IsNumeric(document.frm.a_804_b.value) &&  document.frm.a_804_b.value != 0) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_804_b.value), 2);
}
if (IsNumeric(document.frm.a_805_b.value) &&  document.frm.a_805_b.value != 0) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_805_b.value), 2);
}
if (IsNumeric(document.frm.a_806_b.value) &&  document.frm.a_806_b.value != 0) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_806_b.value), 2);
}
if (IsNumeric(document.frm.a_807_b.value) &&  document.frm.a_807_b.value != 0) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_807_b.value), 2);
}
if (IsNumeric(document.frm.a_808_b.value) &&  document.frm.a_808_b.value != 0) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_808_b.value), 2);
}
if (IsNumeric(document.frm.a_809_b.value) &&  document.frm.a_809_b.value != 0) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_809_b.value), 2);
}
if (IsNumeric(document.frm.a_810_b.value) &&  document.frm.a_810_b.value != 0) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_810_b.value), 2);
}
if (IsNumeric(document.frm.a_811_b.value) &&  document.frm.a_811_b.value != 0) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_811_b.value), 2);
}
<!--- END of 800 BUYERS series --->




<!--- 800 series SELLERS--->

if (IsNumeric(document.frm.a_801_c.value) &&  document.frm.a_801_c.value != 0) {
document.frm.a_1400_b.value = roundit(parseFloat(document.frm.a_1400_b.value) + parseFloat(document.frm.a_801_c.value), 2);
}
if (IsNumeric(document.frm.a_802_c.value) &&  document.frm.a_802_c.value != 0) {
document.frm.a_1400_b.value = roundit(parseFloat(document.frm.a_1400_b.value) + parseFloat(document.frm.a_802_c.value), 2);
}
if (IsNumeric(document.frm.a_803_c.value) &&  document.frm.a_803_c.value != 0) {
document.frm.a_1400_b.value = roundit(parseFloat(document.frm.a_1400_b.value) + parseFloat(document.frm.a_803_c.value), 2);
}
if (IsNumeric(document.frm.a_804_c.value) &&  document.frm.a_804_c.value != 0) {
document.frm.a_1400_b.value = roundit(parseFloat(document.frm.a_1400_b.value) + parseFloat(document.frm.a_804_c.value), 2);
}
if (IsNumeric(document.frm.a_805_d.value) &&  document.frm.a_805_d.value != 0) {
document.frm.a_1400_b.value = roundit(parseFloat(document.frm.a_1400_b.value) + parseFloat(document.frm.a_805_d.value), 2);
}
if (IsNumeric(document.frm.a_806_d.value) &&  document.frm.a_806_d.value != 0) {
document.frm.a_1400_b.value = roundit(parseFloat(document.frm.a_1400_b.value) + parseFloat(document.frm.a_806_d.value), 2);
}
if (IsNumeric(document.frm.a_807_d.value) &&  document.frm.a_807_d.value != 0) {
document.frm.a_1400_b.value = roundit(parseFloat(document.frm.a_1400_b.value) + parseFloat(document.frm.a_807_d.value), 2);
}
if (IsNumeric(document.frm.a_808_d.value) &&  document.frm.a_808_d.value != 0) {
document.frm.a_1400_b.value = roundit(parseFloat(document.frm.a_1400_b.value) + parseFloat(document.frm.a_808_d.value), 2);
}
if (IsNumeric(document.frm.a_809_d.value) &&  document.frm.a_809_d.value != 0) {
document.frm.a_1400_b.value = roundit(parseFloat(document.frm.a_1400_b.value) + parseFloat(document.frm.a_809_d.value), 2);
}
if (IsNumeric(document.frm.a_810_d.value) &&  document.frm.a_810_d.value != 0) {
document.frm.a_1400_b.value = roundit(parseFloat(document.frm.a_1400_b.value) + parseFloat(document.frm.a_810_d.value), 2);
}
if (IsNumeric(document.frm.a_811_d.value) &&  document.frm.a_811_d.value != 0) {
document.frm.a_1400_b.value = roundit(parseFloat(document.frm.a_1400_b.value) + parseFloat(document.frm.a_811_d.value), 2);
}
<!--- END of 800 SELLERS series --->




<!--- 900 Series BUYER --->
document.frm.a_901_d.value = '';
date1 = new Date();
date2 = new Date();
diff  = new Date();
date1temp = new Date(document.frm.a_901_a.value);
date1.setTime(date1temp.getTime());
date2temp = new Date(document.frm.a_901_b.value);
date2.setTime(date2temp.getTime());
// sets difference date to difference of first date and second date
diff.setTime(Math.abs(date1.getTime() - date2.getTime()));
timediff = diff.getTime();
days = Math.floor(timediff / (1000 * 60 * 60 * 24));
timediff -= days * (1000 * 60 * 60 * 24);
if (document.frm.a_901_a.value != '') {
if (!isDate(document.frm.a_901_a.value)) {
  document.frm.a_901_a.focus();
      return false;
 } }

if (document.frm.a_901_b.value != '') {
if (!isDate(document.frm.a_901_b.value)) {
  document.frm.a_901_b.focus();
      return false;
 } }

if (document.frm.a_901.value != '') {
if (!IsNumeric(document.frm.a_901.value)) {
 alert("Only numbers in this format XX or XX.XX are allowed in this field")
  document.frm.a_901.focus();
      return false;
 } }

 if ((document.frm.a_901_a.value != '') && (document.frm.a_901_b.value != '') && (document.frm.a_901.value != '')) {
 if (document.frm.a_901_d.value == '') {
 if (date1temp > date2temp) {
document.frm.a_901_d.value = -days * document.frm.a_901.value;
} else {
document.frm.a_901_d.value = days * document.frm.a_901.value;
}
}else {
 if (date1temp > date2temp) {
document.frm.a_901_d.value = -days * document.frm.a_901.value;
}else{
document.frm.a_901_d.value = days * document.frm.a_901.value;
}
}
}
else if (((document.frm.a_901_a.value == '')||(document.frm.a_901_b.value == '')||(document.frm.a_901.value == ''))&&(document.frm.a_901_d.value != '')) {
document.frm.a_901_d.value = '';
}

if (IsNumeric(document.frm.a_901_d.value) &&  document.frm.a_901_d.value != 0) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_901_d.value), 2);
}
if (IsNumeric(document.frm.a_902_c.value) &&  document.frm.a_902_c.value != 0) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_902_c.value), 2);
}
if (IsNumeric(document.frm.a_903_c.value) &&  document.frm.a_903_c.value != 0) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_903_c.value), 2);
}
if (IsNumeric(document.frm.a_904_b.value) &&  document.frm.a_904_b.value != 0) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_904_b.value), 2);
}
if (IsNumeric(document.frm.a_905_a.value) &&  document.frm.a_905_a.value != 0) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_905_a.value), 2);
}

<!--- end 900 series BUYER --->

<!--- 900 series SELLER --->
if (IsNumeric(document.frm.a_901_e.value) &&  document.frm.a_901_e.value != 0) {
document.frm.a_1400_b.value = roundit(parseFloat(document.frm.a_1400_b.value) + parseFloat(document.frm.a_901_e.value), 2);
}
if (IsNumeric(document.frm.a_902_d.value) &&  document.frm.a_902_d.value != 0) {
document.frm.a_1400_b.value = roundit(parseFloat(document.frm.a_1400_b.value) + parseFloat(document.frm.a_902_d.value), 2);
}
if (IsNumeric(document.frm.a_903_d.value) &&  document.frm.a_903_d.value != 0) {
document.frm.a_1400_b.value = roundit(parseFloat(document.frm.a_1400_b.value) + parseFloat(document.frm.a_903_d.value), 2);
}
if (IsNumeric(document.frm.a_904_d.value) &&  document.frm.a_904_d.value != 0) {
document.frm.a_1400_b.value = roundit(parseFloat(document.frm.a_1400_b.value) + parseFloat(document.frm.a_904_d.value), 2);
}
if (IsNumeric(document.frm.a_905_b.value) &&  document.frm.a_905_b.value != 0) {
document.frm.a_1400_b.value = roundit(parseFloat(document.frm.a_1400_b.value) + parseFloat(document.frm.a_905_b.value), 2);
}
<!--- end 900 series SELLER --->


<!--- 1000 series BUYER --->
if (document.frm.a_1001_a.value != '') {
if (!IsNumeric(document.frm.a_1001_a.value) && document.frm.a_1001_a.value != '') {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_1001_a.focus();
      return false;
 } }

 if (document.frm.a_1001_b.value != '') {
if (!IsNumeric(document.frm.a_1001_b.value) && document.frm.a_1001_b.value != '') {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_1001_b.focus();
      return false;
 } }


if ((document.frm.a_1001_a.value != '') && (document.frm.a_1001_b.value != '')) {
if (document.frm.a_1001_c.value == '') {
document.frm.a_1001_c.value = document.frm.a_1001_a.value * document.frm.a_1001_b.value;
}else {
document.frm.a_1001_c.value = document.frm.a_1001_a.value * document.frm.a_1001_b.value;
}
}
else if (((document.frm.a_1001_a.value == '')||(document.frm.a_1001_b.value == ''))&&(document.frm.a_1001_c.value != '')) {
document.frm.a_1001_c.value = '';
 }



 if (document.frm.a_1002_a.value != '') {
if (!IsNumeric(document.frm.a_1002_a.value) && document.frm.a_1002_a.value != '') {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_1002_a.focus();
      return false;
 } }

 if (document.frm.a_1002_b.value != '') {
if (!IsNumeric(document.frm.a_1002_b.value) && document.frm.a_1002_b.value != '') {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_1002_b.focus();
      return false;
 } }


if ((document.frm.a_1002_a.value != '') && (document.frm.a_1002_b.value != '')) {
if (document.frm.a_1002_c.value == '') {
document.frm.a_1002_c.value = document.frm.a_1002_a.value * document.frm.a_1002_b.value;
}else {
document.frm.a_1002_c.value = document.frm.a_1002_a.value * document.frm.a_1002_b.value;
}
}
else if (((document.frm.a_1002_a.value == '')||(document.frm.a_1002_b.value == ''))&&(document.frm.a_1002_c.value != '')) {
document.frm.a_1002_c.value = '';
 }






 if (document.frm.a_1003_a.value != '') {
if (!IsNumeric(document.frm.a_1003_a.value) && document.frm.a_1003_a.value != '') {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_1003_a.focus();
      return false;
 } }

 if (document.frm.a_1003_b.value != '') {
if (!IsNumeric(document.frm.a_1003_b.value) && document.frm.a_1003_b.value != '') {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_1003_b.focus();
      return false;
 } }


if ((document.frm.a_1003_a.value != '') && (document.frm.a_1003_b.value != '')) {
if (document.frm.a_1003_c.value == '') {
document.frm.a_1003_c.value = document.frm.a_1003_a.value * document.frm.a_1003_b.value;
}else {
document.frm.a_1003_c.value = document.frm.a_1003_a.value * document.frm.a_1003_b.value;
}
}
else if (((document.frm.a_1003_a.value == '')||(document.frm.a_1003_b.value == ''))&&(document.frm.a_1003_c.value != '')) {
document.frm.a_1003_c.value = '';
 }






 if (document.frm.a_1004_a.value != '') {
if (!IsNumeric(document.frm.a_1004_a.value) && document.frm.a_1004_a.value != '') {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_1004_a.focus();
      return false;
 } }

 if (document.frm.a_1004_b.value != '') {
if (!IsNumeric(document.frm.a_1004_b.value) && document.frm.a_1004_b.value != '') {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_1004_b.focus();
      return false;
 } }


if ((document.frm.a_1004_a.value != '') && (document.frm.a_1004_b.value != '')) {
if (document.frm.a_1004_c.value == '') {
document.frm.a_1004_c.value = document.frm.a_1004_a.value * document.frm.a_1004_b.value;
}else {
document.frm.a_1004_c.value = document.frm.a_1004_a.value * document.frm.a_1004_b.value;
}
}
else if (((document.frm.a_1004_a.value == '')||(document.frm.a_1004_b.value == ''))&&(document.frm.a_1004_c.value != '')) {
document.frm.a_1004_c.value = '';
 }





 if (document.frm.a_1005_a.value != '') {
if (!IsNumeric(document.frm.a_1005_a.value) && document.frm.a_1005_a.value != '') {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_1005_a.focus();
      return false;
 } }

 if (document.frm.a_1005_b.value != '') {
if (!IsNumeric(document.frm.a_1005_b.value) && document.frm.a_1005_b.value != '') {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_1005_b.focus();
      return false;
 } }


if ((document.frm.a_1005_a.value != '') && (document.frm.a_1005_b.value != '')) {
if (document.frm.a_1005_c.value == '') {
document.frm.a_1005_c.value = document.frm.a_1005_a.value * document.frm.a_1005_b.value;
}else {
document.frm.a_1005_c.value = document.frm.a_1005_a.value * document.frm.a_1005_b.value;
}
}
else if (((document.frm.a_1005_a.value == '')||(document.frm.a_1005_b.value == ''))&&(document.frm.a_1005_c.value != '')) {
document.frm.a_1005_c.value = '';
 }


if (IsNumeric(document.frm.a_1001_c.value) &&  document.frm.a_1001_c.value != 0) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_1001_c.value), 2);
}
if (IsNumeric(document.frm.a_1002_c.value) &&  document.frm.a_1002_c.value != 0) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_1002_c.value), 2);
}
if (IsNumeric(document.frm.a_1003_c.value) &&  document.frm.a_1003_c.value != 0) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_1003_c.value), 2);
}
if (IsNumeric(document.frm.a_1004_c.value) &&  document.frm.a_1004_c.value != 0) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_1004_c.value), 2);
}
if (IsNumeric(document.frm.a_1005_c.value) &&  document.frm.a_1005_c.value != 0) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_1005_c.value), 2);
}
if (IsNumeric(document.frm.a_1006_a.value) &&  document.frm.a_1006_a.value != 0) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_1006_a.value), 2);
}

<!--- end 1000 series BUYER --->

<!--- 1000 series SELLER --->

if (IsNumeric(document.frm.a_1001_d.value) &&  document.frm.a_1001_d.value != 0) {
document.frm.a_1400_b.value = roundit(parseFloat(document.frm.a_1400_b.value) + parseFloat(document.frm.a_1001_d.value), 2);
}
if (IsNumeric(document.frm.a_1002_d.value) &&  document.frm.a_1002_d.value != 0) {
document.frm.a_1400_b.value = roundit(parseFloat(document.frm.a_1400_b.value) + parseFloat(document.frm.a_1002_d.value), 2);
}
if (IsNumeric(document.frm.a_1003_d.value) &&  document.frm.a_1003_d.value != 0) {
document.frm.a_1400_b.value = roundit(parseFloat(document.frm.a_1400_b.value) + parseFloat(document.frm.a_1003_d.value), 2);
}
if (IsNumeric(document.frm.a_1004_d.value) &&  document.frm.a_1004_d.value != 0) {
document.frm.a_1400_b.value = roundit(parseFloat(document.frm.a_1400_b.value) + parseFloat(document.frm.a_1004_d.value), 2);
}
if (IsNumeric(document.frm.a_1005_d.value) &&  document.frm.a_1005_d.value != 0) {
document.frm.a_1400_b.value = roundit(parseFloat(document.frm.a_1400_b.value) + parseFloat(document.frm.a_1005_d.value), 2);
}
if (IsNumeric(document.frm.a_1006_b.value) &&  document.frm.a_1006_b.value != 0) {
document.frm.a_1400_b.value = roundit(parseFloat(document.frm.a_1400_b.value) + parseFloat(document.frm.a_1006_b.value), 2);
}
<!--- end 1000 series SELLER --->


<!--- 1100 series BUYER --->
if (IsNumeric(document.frm.a_1101_a.value) &&  document.frm.a_1101_a.value != 0) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_1101_a.value), 2);
}
if (IsNumeric(document.frm.a_1102_a.value) &&  document.frm.a_1102_a.value != 0) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_1102_a.value), 2);
}
if (IsNumeric(document.frm.a_1103_a.value) &&  document.frm.a_1103_a.value != 0) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_1103_a.value), 2);
}
if (IsNumeric(document.frm.a_1104_a.value) &&  document.frm.a_1104_a.value != 0) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_1104_a.value), 2);
}
if (IsNumeric(document.frm.a_1105_a.value) &&  document.frm.a_1105_a.value != 0) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_1105_a.value), 2);
}
if (IsNumeric(document.frm.a_1106_a.value) &&  document.frm.a_1106_a.value != 0) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_1106_a.value), 2);
}
if (IsNumeric(document.frm.a_1107_a.value) &&  document.frm.a_1107_a.value != 0) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_1107_a.value), 2);
}
if (IsNumeric(document.frm.a_1108_a.value) &&  document.frm.a_1108_a.value != 0) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_1108_a.value), 2);
}
if (IsNumeric(document.frm.a_1111_a.value) &&  document.frm.a_1111_a.value != 0) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_1111_a.value), 2);
}
if (IsNumeric(document.frm.a_1112_a.value) &&  document.frm.a_1112_a.value != 0) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_1112_a.value), 2);
}
if (IsNumeric(document.frm.a_1113_a.value) &&  document.frm.a_1113_a.value != 0) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_1113_a.value), 2);
}
if (IsNumeric(document.frm.a_1114_a.value) &&  document.frm.a_1114_a.value != 0) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_1114_a.value), 2);
}
<!--- end 1100 series BUYER --->


<!--- 1100 series SELLER --->
if (IsNumeric(document.frm.a_1101_b.value) &&  document.frm.a_1101_b.value != 0) {
document.frm.a_1400_b.value = roundit(parseFloat(document.frm.a_1400_b.value) + parseFloat(document.frm.a_1101_b.value), 2);
}
if (IsNumeric(document.frm.a_1102_b.value) &&  document.frm.a_1102_b.value != 0) {
document.frm.a_1400_b.value = roundit(parseFloat(document.frm.a_1400_b.value) + parseFloat(document.frm.a_1102_b.value), 2);
}
if (IsNumeric(document.frm.a_1103_b.value) &&  document.frm.a_1103_b.value != 0) {
document.frm.a_1400_b.value = roundit(parseFloat(document.frm.a_1400_b.value) + parseFloat(document.frm.a_1103_b.value), 2);
}
if (IsNumeric(document.frm.a_1104_b.value) &&  document.frm.a_1104_b.value != 0) {
document.frm.a_1400_b.value = roundit(parseFloat(document.frm.a_1400_b.value) + parseFloat(document.frm.a_1104_b.value), 2);
}
if (IsNumeric(document.frm.a_1105_b.value) &&  document.frm.a_1105_b.value != 0) {
document.frm.a_1400_b.value = roundit(parseFloat(document.frm.a_1400_b.value) + parseFloat(document.frm.a_1105_b.value), 2);
}
if (IsNumeric(document.frm.a_1106_b.value) &&  document.frm.a_1106_b.value != 0) {
document.frm.a_1400_b.value = roundit(parseFloat(document.frm.a_1400_b.value) + parseFloat(document.frm.a_1106_b.value), 2);
}
if (IsNumeric(document.frm.a_1107_b.value) &&  document.frm.a_1107_b.value != 0) {
document.frm.a_1400_b.value = roundit(parseFloat(document.frm.a_1400_b.value) + parseFloat(document.frm.a_1107_b.value), 2);
}
if (IsNumeric(document.frm.a_1108_b.value) &&  document.frm.a_1108_b.value != 0) {
document.frm.a_1400_b.value = roundit(parseFloat(document.frm.a_1400_b.value) + parseFloat(document.frm.a_1108_b.value), 2);
}
if (IsNumeric(document.frm.a_1111_b.value) &&  document.frm.a_1111_b.value != 0) {
document.frm.a_1400_b.value = roundit(parseFloat(document.frm.a_1400_b.value) + parseFloat(document.frm.a_1111_b.value), 2);
}
if (IsNumeric(document.frm.a_1112_b.value) &&  document.frm.a_1112_b.value != 0) {
document.frm.a_1400_b.value = roundit(parseFloat(document.frm.a_1400_b.value) + parseFloat(document.frm.a_1112_b.value), 2);
}
if (IsNumeric(document.frm.a_1113_b.value) &&  document.frm.a_1113_b.value != 0) {
document.frm.a_1400_b.value = roundit(parseFloat(document.frm.a_1400_b.value) + parseFloat(document.frm.a_1113_b.value), 2);
}
if (IsNumeric(document.frm.a_1114_b.value) &&  document.frm.a_1114_b.value != 0) {
document.frm.a_1400_b.value = roundit(parseFloat(document.frm.a_1400_b.value) + parseFloat(document.frm.a_1114_b.value), 2);
}
<!--- end 1100 series SELLER --->

<!--- 1200 series BUYER --->
document.frm.a_1201_d.value = 0;
document.frm.a_1202_d.value = 0;
document.frm.a_1203_d.value = 0;

if (IsNumeric(document.frm.a_1201_a.value) &&  document.frm.a_1201_a.value != 0) {
document.frm.a_1201_d.value = roundit(parseFloat(document.frm.a_1201_d.value) + parseFloat(document.frm.a_1201_a.value), 2);
}
if (IsNumeric(document.frm.a_1201_b.value) &&  document.frm.a_1201_b.value != 0) {
document.frm.a_1201_d.value = roundit(parseFloat(document.frm.a_1201_d.value) + parseFloat(document.frm.a_1201_b.value), 2);
}
if (IsNumeric(document.frm.a_1201_c.value) &&  document.frm.a_1201_c.value != 0) {
document.frm.a_1201_d.value = roundit(parseFloat(document.frm.a_1201_d.value) + parseFloat(document.frm.a_1201_c.value), 2);
}


if (IsNumeric(document.frm.a_1202_a.value) &&  document.frm.a_1202_a.value != 0) {
document.frm.a_1202_d.value = roundit(parseFloat(document.frm.a_1202_d.value) + parseFloat(document.frm.a_1202_a.value), 2);
}
if (IsNumeric(document.frm.a_1202_b.value) &&  document.frm.a_1202_b.value != 0) {
document.frm.a_1202_d.value = roundit(parseFloat(document.frm.a_1202_d.value) + parseFloat(document.frm.a_1202_b.value), 2);
}
if (IsNumeric(document.frm.a_1202_c.value) &&  document.frm.a_1202_c.value != 0) {
document.frm.a_1202_d.value = roundit(parseFloat(document.frm.a_1202_d.value) + parseFloat(document.frm.a_1202_c.value), 2);
}


if (IsNumeric(document.frm.a_1203_a.value) &&  document.frm.a_1203_a.value != 0) {
document.frm.a_1203_d.value = roundit(parseFloat(document.frm.a_1203_d.value) + parseFloat(document.frm.a_1203_a.value), 2);
}
if (IsNumeric(document.frm.a_1203_b.value) &&  document.frm.a_1203_b.value != 0) {
document.frm.a_1203_d.value = roundit(parseFloat(document.frm.a_1203_d.value) + parseFloat(document.frm.a_1203_b.value), 2);
}
if (IsNumeric(document.frm.a_1203_c.value) &&  document.frm.a_1203_c.value != 0) {
document.frm.a_1203_d.value = roundit(parseFloat(document.frm.a_1203_d.value) + parseFloat(document.frm.a_1203_c.value), 2);
}



if (IsNumeric(document.frm.a_1201_d.value) &&  document.frm.a_1201_d.value != 0) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_1201_d.value), 2);
}
if (IsNumeric(document.frm.a_1202_d.value) &&  document.frm.a_1202_d.value != 0) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_1202_d.value), 2);
}
if (IsNumeric(document.frm.a_1203_d.value) &&  document.frm.a_1203_d.value != 0) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_1203_d.value), 2);
}
if (IsNumeric(document.frm.a_1204_b.value) &&  document.frm.a_1204_b.value != 0) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_1204_b.value), 2);
}
if (IsNumeric(document.frm.a_1205_a.value) &&  document.frm.a_1205_a.value != 0) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_1205_a.value), 2);
}
<!--- end 1200 Series BUYER --->


<!--- 1200 Series SELLER --->
if (IsNumeric(document.frm.a_1201_e.value) &&  document.frm.a_1201_e.value != 0) {
document.frm.a_1400_b.value = roundit(parseFloat(document.frm.a_1400_b.value) + parseFloat(document.frm.a_1201_e.value), 2);
}
if (IsNumeric(document.frm.a_1202_e.value) &&  document.frm.a_1202_e.value != 0) {
document.frm.a_1400_b.value = roundit(parseFloat(document.frm.a_1400_b.value) + parseFloat(document.frm.a_1202_e.value), 2);
}
if (IsNumeric(document.frm.a_1203_e.value) &&  document.frm.a_1203_e.value != 0) {
document.frm.a_1400_b.value = roundit(parseFloat(document.frm.a_1400_b.value) + parseFloat(document.frm.a_1203_e.value), 2);
}
if (IsNumeric(document.frm.a_1204_c.value) &&  document.frm.a_1204_c.value != 0) {
document.frm.a_1400_b.value = roundit(parseFloat(document.frm.a_1400_b.value) + parseFloat(document.frm.a_1204_c.value), 2);
}
if (IsNumeric(document.frm.a_1205_b.value) &&  document.frm.a_1205_b.value != 0) {
document.frm.a_1400_b.value = roundit(parseFloat(document.frm.a_1400_b.value) + parseFloat(document.frm.a_1205_b.value), 2);
}
<!--- end 1200 Series SELLER --->


<!--- 1300 series BUYER --->
if (IsNumeric(document.frm.a_1301_a.value) &&  document.frm.a_1301_a.value != 0) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_1301_a.value), 2);
}
if (IsNumeric(document.frm.a_1302_a.value) &&  document.frm.a_1302_a.value != 0) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_1302_a.value), 2);
}
if (IsNumeric(document.frm.a_1303_a.value) &&  document.frm.a_1303_a.value != 0) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_1303_a.value), 2);
}
if (IsNumeric(document.frm.a_1304_a.value) &&  document.frm.a_1304_a.value != 0) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_1304_a.value), 2);
}
if (IsNumeric(document.frm.a_1305_a.value) &&  document.frm.a_1305_a.value != 0) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_1305_a.value), 2);
}
if (IsNumeric(document.frm.a_1306_b.value) &&  document.frm.a_1306_b.value != 0) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_1306_b.value), 2);
}
if (IsNumeric(document.frm.a_1307_b.value) &&  document.frm.a_1307_b.value != 0) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_1307_b.value), 2);
}
if (IsNumeric(document.frm.a_1308_b.value) &&  document.frm.a_1308_b.value != 0) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_1308_b.value), 2);
}
<!--- END 1300 series BUYER --->




<!--- 1300 series SELLER --->
if (IsNumeric(document.frm.a_1301_b.value) &&  document.frm.a_1301_b.value != 0) {
document.frm.a_1400_b.value = roundit(parseFloat(document.frm.a_1400_b.value) + parseFloat(document.frm.a_1301_b.value), 2);
}
if (IsNumeric(document.frm.a_1302_b.value) &&  document.frm.a_1302_b.value != 0) {
document.frm.a_1400_b.value = roundit(parseFloat(document.frm.a_1400_b.value) + parseFloat(document.frm.a_1302_b.value), 2);
}
if (IsNumeric(document.frm.a_1303_b.value) &&  document.frm.a_1303_b.value != 0) {
document.frm.a_1400_b.value = roundit(parseFloat(document.frm.a_1400_b.value) + parseFloat(document.frm.a_1303_b.value), 2);
}
if (IsNumeric(document.frm.a_1304_b.value) &&  document.frm.a_1304_b.value != 0) {
document.frm.a_1400_b.value = roundit(parseFloat(document.frm.a_1400_b.value) + parseFloat(document.frm.a_1304_b.value), 2);
}
if (IsNumeric(document.frm.a_1305_b.value) &&  document.frm.a_1305_b.value != 0) {
document.frm.a_1400_b.value = roundit(parseFloat(document.frm.a_1400_b.value) + parseFloat(document.frm.a_1305_b.value), 2);
}
if (IsNumeric(document.frm.a_1306_c.value) &&  document.frm.a_1306_c.value != 0) {
document.frm.a_1400_b.value = roundit(parseFloat(document.frm.a_1400_b.value) + parseFloat(document.frm.a_1306_c.value), 2);
}
if (IsNumeric(document.frm.a_1307_c.value) &&  document.frm.a_1307_c.value != 0) {
document.frm.a_1400_b.value = roundit(parseFloat(document.frm.a_1400_b.value) + parseFloat(document.frm.a_1307_c.value), 2);
}
if (IsNumeric(document.frm.a_1308_c.value) &&  document.frm.a_1308_c.value != 0) {
document.frm.a_1400_b.value = roundit(parseFloat(document.frm.a_1400_b.value) + parseFloat(document.frm.a_1308_c.value), 2);
}
<!--- END 1300 series SELLER --->


<!---  100 series --->
document.frm.a_120.value = 0;
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);

if (IsNumeric(document.frm.a_101.value) &&  document.frm.a_101.value != 0) {
document.frm.a_120.value = roundit(parseFloat(document.frm.a_120.value) + parseFloat(document.frm.a_101.value), 2);
}
if (IsNumeric(document.frm.a_102.value) &&  document.frm.a_102.value != 0) {
document.frm.a_120.value = roundit(parseFloat(document.frm.a_120.value) + parseFloat(document.frm.a_102.value), 2);
}
if (IsNumeric(document.frm.a_103.value) &&  document.frm.a_103.value != 0) {
document.frm.a_120.value = roundit(parseFloat(document.frm.a_120.value) + parseFloat(document.frm.a_103.value), 2);
}
if (IsNumeric(document.frm.a_104_b.value) &&  document.frm.a_104_b.value != 0) {
document.frm.a_120.value = roundit(parseFloat(document.frm.a_120.value) + parseFloat(document.frm.a_104_b.value), 2);
}

if (IsNumeric(document.frm.a_105_b.value) &&  document.frm.a_105_b.value != 0) {
document.frm.a_120.value = roundit(parseFloat(document.frm.a_120.value) + parseFloat(document.frm.a_105_b.value), 2);
}
if (IsNumeric(document.frm.a_106.value) &&  document.frm.a_106.value != 0) {
document.frm.a_120.value = roundit(parseFloat(document.frm.a_120.value) + parseFloat(document.frm.a_106.value), 2);
}
if (IsNumeric(document.frm.a_107.value) &&  document.frm.a_107.value != 0) {
document.frm.a_120.value = roundit(parseFloat(document.frm.a_120.value) + parseFloat(document.frm.a_107.value), 2);
}
if (IsNumeric(document.frm.a_108.value) &&  document.frm.a_108.value != 0) {
document.frm.a_120.value = roundit(parseFloat(document.frm.a_120.value) + parseFloat(document.frm.a_108.value), 2);
}
if (IsNumeric(document.frm.a_109_b.value) &&  document.frm.a_109_b.value != 0) {
document.frm.a_120.value = roundit(parseFloat(document.frm.a_120.value) + parseFloat(document.frm.a_109_b.value), 2);
}
if (IsNumeric(document.frm.a_110_b.value) &&  document.frm.a_110_b.value != 0) {
document.frm.a_120.value = roundit(parseFloat(document.frm.a_120.value) + parseFloat(document.frm.a_110_b.value), 2);
}
if (IsNumeric(document.frm.a_111_b.value) &&  document.frm.a_111_b.value != 0) {
document.frm.a_120.value = roundit(parseFloat(document.frm.a_120.value) + parseFloat(document.frm.a_111_b.value), 2);
}
if (IsNumeric(document.frm.a_112_b.value) &&  document.frm.a_112_b.value != 0) {
document.frm.a_120.value = roundit(parseFloat(document.frm.a_120.value) + parseFloat(document.frm.a_112_b.value), 2);
}
<!--- end of 100 series --->




<!--- this part adds up the 200 series --->
document.frm.a_220.value = 0
document.frm.a_302.value = 0

if (IsNumeric(document.frm.a_1601.value) &&  document.frm.a_1601.value != 0) {
document.frm.a_220.value = roundit(parseFloat(document.frm.a_220.value) + parseFloat(document.frm.a_1601.value), 2);
}
if (IsNumeric(document.frm.a_202.value) &&  document.frm.a_202.value != 0) {
document.frm.a_220.value = roundit(parseFloat(document.frm.a_220.value) + parseFloat(document.frm.a_202.value), 2);
}
if (IsNumeric(document.frm.a_203.value) &&  document.frm.a_203.value != 0) {
document.frm.a_220.value = roundit(parseFloat(document.frm.a_220.value) + parseFloat(document.frm.a_203.value), 2);
}
if (IsNumeric(document.frm.a_204_b.value) &&  document.frm.a_204_b.value != 0) {
document.frm.a_220.value = roundit(parseFloat(document.frm.a_220.value) + parseFloat(document.frm.a_204_b.value), 2);
}
if (IsNumeric(document.frm.a_205_b.value) &&  document.frm.a_205_b.value != 0) {
document.frm.a_220.value = roundit(parseFloat(document.frm.a_220.value) + parseFloat(document.frm.a_205_b.value), 2);
}
if (IsNumeric(document.frm.a_206_b.value) &&  document.frm.a_206_b.value != 0) {
document.frm.a_220.value = roundit(parseFloat(document.frm.a_220.value) + parseFloat(document.frm.a_206_b.value), 2);
}
if (IsNumeric(document.frm.a_207_b.value) &&  document.frm.a_207_b.value != 0) {
document.frm.a_220.value = roundit(parseFloat(document.frm.a_220.value) + parseFloat(document.frm.a_207_b.value), 2);
}
if (IsNumeric(document.frm.a_208_b.value) &&  document.frm.a_208_b.value != 0) {

document.frm.a_220.value = roundit(parseFloat(document.frm.a_220.value) + parseFloat(document.frm.a_208_b.value), 2);
}
if (IsNumeric(document.frm.a_209_b.value) &&  document.frm.a_209_b.value != 0) {
document.frm.a_220.value = roundit(parseFloat(document.frm.a_220.value) + parseFloat(document.frm.a_209_b.value), 2);
}
if (IsNumeric(document.frm.a_210.value) &&  document.frm.a_210.value != 0) {
document.frm.a_220.value = roundit(parseFloat(document.frm.a_220.value) + parseFloat(document.frm.a_210.value), 2);
}
if (IsNumeric(document.frm.a_211.value) &&  document.frm.a_211.value != 0) {
document.frm.a_220.value = roundit(parseFloat(document.frm.a_220.value) + parseFloat(document.frm.a_211.value), 2);
}
if (IsNumeric(document.frm.a_212.value) &&  document.frm.a_212.value != 0) {
document.frm.a_220.value = roundit(parseFloat(document.frm.a_220.value) + parseFloat(document.frm.a_212.value), 2);
}
if (IsNumeric(document.frm.a_213_b.value) &&  document.frm.a_213_b.value != 0) {
document.frm.a_220.value = roundit(parseFloat(document.frm.a_220.value) + parseFloat(document.frm.a_213_b.value), 2);
}
if (IsNumeric(document.frm.a_214_b.value) &&  document.frm.a_214_b.value != 0) {
document.frm.a_220.value = roundit(parseFloat(document.frm.a_220.value) + parseFloat(document.frm.a_214_b.value), 2);
}
if (IsNumeric(document.frm.a_215_b.value) &&  document.frm.a_215_b.value != 0) {
document.frm.a_220.value = roundit(parseFloat(document.frm.a_220.value) + parseFloat(document.frm.a_215_b.value), 2);
}
if (IsNumeric(document.frm.a_216_b.value) &&  document.frm.a_216_b.value != 0) {
document.frm.a_220.value = roundit(parseFloat(document.frm.a_220.value) + parseFloat(document.frm.a_216_b.value), 2);
}
if (IsNumeric(document.frm.a_217_b.value) &&  document.frm.a_217_b.value != 0) {
document.frm.a_220.value = roundit(parseFloat(document.frm.a_220.value) + parseFloat(document.frm.a_217_b.value), 2);
}
if (IsNumeric(document.frm.a_218_b.value) &&  document.frm.a_218_b.value != 0) {
document.frm.a_220.value = roundit(parseFloat(document.frm.a_220.value) + parseFloat(document.frm.a_218_b.value), 2);
}
if (IsNumeric(document.frm.a_219_b.value) &&  document.frm.a_219_b.value != 0) {
document.frm.a_220.value = roundit(parseFloat(document.frm.a_220.value) + parseFloat(document.frm.a_219_b.value), 2);
}
<!--- END of 200 series --->


<!--- Add up 300 series --->
document.frm.a_301.value = 0
if (IsNumeric(document.frm.a_120.value) &&  document.frm.a_120.value != 0) {
document.frm.a_301.value = roundit(parseFloat(document.frm.a_301.value) + parseFloat(document.frm.a_120.value), 2);
}
document.frm.a_302.value = 0
if (IsNumeric(document.frm.a_220.value) &&  document.frm.a_220.value != 0) {
document.frm.a_302.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_220.value), 2);
}
document.frm.a_303.value = 0
if (IsNumeric(document.frm.a_301.value) &&  document.frm.a_301.value != 0 && IsNumeric(document.frm.a_302.value) &&  document.frm.a_302.value != 0) {
document.frm.a_303.value = roundit(parseFloat(document.frm.a_301.value) - parseFloat(document.frm.a_302.value), 2);
}
<!--- END of 300 series --->


<!--- this part adds up the 400 series --->
document.frm.a_420.value = 0;

if (IsNumeric(document.frm.a_401.value) &&  document.frm.a_401.value != 0) {
document.frm.a_420.value = roundit(parseFloat(document.frm.a_420.value) + parseFloat(document.frm.a_AddUpvalue), 2);
}
if (IsNumeric(document.frm.a_402.value) &&  document.frm.a_402.value != 0) {
document.frm.a_420.value = roundit(parseFloat(document.frm.a_420.value) + parseFloat(document.frm.a_402.value), 2);
}
if (IsNumeric(document.frm.a_403_b.value) &&  document.frm.a_403_b.value != 0) {
document.frm.a_420.value = roundit(parseFloat(document.frm.a_420.value) + parseFloat(document.frm.a_403_b.value), 2);
}
if (IsNumeric(document.frm.a_404_b.value) &&  document.frm.a_404_b.value != 0) {
document.frm.a_420.value = roundit(parseFloat(document.frm.a_420.value) + parseFloat(document.frm.a_404_b.value), 2);
}
if (IsNumeric(document.frm.a_405_b.value) &&  document.frm.a_405_b.value != 0) {
document.frm.a_420.value = roundit(parseFloat(document.frm.a_420.value) + parseFloat(document.frm.a_405_b.value), 2);
}
if (IsNumeric(document.frm.a_406.value) &&  document.frm.a_406.value != 0) {
document.frm.a_420.value = roundit(parseFloat(document.frm.a_420.value) + parseFloat(document.frm.a_406.value), 2);
}
if (IsNumeric(document.frm.a_407.value) &&  document.frm.a_407.value != 0) {
document.frm.a_420.value = roundit(parseFloat(document.frm.a_420.value) + parseFloat(document.frm.a_407.value), 2);
}
if (IsNumeric(document.frm.a_408.value) &&  document.frm.a_408.value != 0) {
document.frm.a_420.value = roundit(parseFloat(document.frm.a_420.value) + parseFloat(document.frm.a_408.value), 2);
}
if (IsNumeric(document.frm.a_409_b.value) &&  document.frm.a_409_b.value != 0) {
document.frm.a_420.value = roundit(parseFloat(document.frm.a_420.value) + parseFloat(document.frm.a_409_b.value), 2);
}
if (IsNumeric(document.frm.a_410_b.value) &&  document.frm.a_410_b.value != 0) {
document.frm.a_420.value = roundit(parseFloat(document.frm.a_420.value) + parseFloat(document.frm.a_410_b.value), 2);
}
if (IsNumeric(document.frm.a_411_b.value) &&  document.frm.a_411_b.value != 0) {
document.frm.a_420.value = roundit(parseFloat(document.frm.a_420.value) + parseFloat(document.frm.a_411_b.value), 2);
}
if (IsNumeric(document.frm.a_412_b.value) &&  document.frm.a_412_b.value != 0) {
document.frm.a_420.value = roundit(parseFloat(document.frm.a_420.value) + parseFloat(document.frm.a_412_b.value), 2);
}
<!--- end of 400 series --->


<!--- this part adds up the 500 series --->
document.frm.a_520.value = 0

if (IsNumeric(document.frm.a_500.value) &&  document.frm.a_500.value != 0) {
document.frm.a_520.value = roundit(parseFloat(document.frm.a_520.value) + parseFloat(document.frm.a_500.value), 2);
}
if (IsNumeric(document.frm.a_1400_b.value) &&  document.frm.a_1400_b.value != 0) {
document.frm.a_502.value = roundit(parseFloat(document.frm.a_1400_b.value), 2);
document.frm.a_520.value = roundit(parseFloat(document.frm.a_520.value) + parseFloat(document.frm.a_1400_b.value), 2);
} else {
document.frm.a_502.value = 0;
}
if (IsNumeric(document.frm.a_503.value) &&  document.frm.a_503.value != 0) {
document.frm.a_520.value = roundit(parseFloat(document.frm.a_520.value) + parseFloat(document.frm.a_503.value), 2);
}
if (IsNumeric(document.frm.a_504.value) &&  document.frm.a_504.value != 0) {
document.frm.a_520.value = roundit(parseFloat(document.frm.a_520.value) + parseFloat(document.frm.a_504.value), 2);
}
if (IsNumeric(document.frm.a_505.value) &&  document.frm.a_505.value != 0) {
document.frm.a_520.value = roundit(parseFloat(document.frm.a_520.value) + parseFloat(document.frm.a_505.value), 2);
}
if (IsNumeric(document.frm.a_506_b.value) &&  document.frm.a_506_b.value != 0) {
document.frm.a_520.value = roundit(parseFloat(document.frm.a_520.value) + parseFloat(document.frm.a_506_b.value), 2);
}
if (IsNumeric(document.frm.a_507_b.value) &&  document.frm.a_507_b.value != 0) {
document.frm.a_520.value = roundit(parseFloat(document.frm.a_520.value) + parseFloat(document.frm.a_507_b.value), 2);
}
if (IsNumeric(document.frm.a_508_b.value) &&  document.frm.a_508_b.value != 0) {
document.frm.a_520.value = roundit(parseFloat(document.frm.a_520.value) + parseFloat(document.frm.a_508_b.value), 2);
}
if (IsNumeric(document.frm.a_509_b.value) &&  document.frm.a_509_b.value != 0) {
document.frm.a_520.value = roundit(parseFloat(document.frm.a_520.value) + parseFloat(document.frm.a_509_b.value), 2);
}
if (IsNumeric(document.frm.a_510.value) &&  document.frm.a_510.value != 0) {
document.frm.a_520.value = roundit(parseFloat(document.frm.a_520.value) + parseFloat(document.frm.a_510.value), 2);
}
if (IsNumeric(document.frm.a_511.value) &&  document.frm.a_511.value != 0) {
document.frm.a_520.value = roundit(parseFloat(document.frm.a_520.value) + parseFloat(document.frm.a_511.value), 2);
}
if (IsNumeric(document.frm.a_512.value) &&  document.frm.a_512.value != 0) {
document.frm.a_520.value = roundit(parseFloat(document.frm.a_520.value) + parseFloat(document.frm.a_512.value), 2);
}
if (IsNumeric(document.frm.a_513_b.value) &&  document.frm.a_513_b.value != 0) {
document.frm.a_520.value = roundit(parseFloat(document.frm.a_520.value) + parseFloat(document.frm.a_513_b.value), 2);
}
if (IsNumeric(document.frm.a_514_b.value) &&  document.frm.a_514_b.value != 0) {
document.frm.a_520.value = roundit(parseFloat(document.frm.a_520.value) + parseFloat(document.frm.a_514_b.value), 2);
}
if (IsNumeric(document.frm.a_515_b.value) &&  document.frm.a_515_b.value != 0) {
document.frm.a_520.value = roundit(parseFloat(document.frm.a_520.value) + parseFloat(document.frm.a_515_b.value), 2);
}
if (IsNumeric(document.frm.a_516_b.value) &&  document.frm.a_516_b.value != 0) {
document.frm.a_520.value = roundit(parseFloat(document.frm.a_520.value) + parseFloat(document.frm.a_516_b.value), 2);
}
if (IsNumeric(document.frm.a_517_b.value) &&  document.frm.a_517_b.value != 0) {
document.frm.a_520.value = roundit(parseFloat(document.frm.a_520.value) + parseFloat(document.frm.a_517_b.value), 2);
}
if (IsNumeric(document.frm.a_518_b.value) &&  document.frm.a_518_b.value != 0) {
document.frm.a_520.value = roundit(parseFloat(document.frm.a_520.value) + parseFloat(document.frm.a_518_b.value), 2);
}
if (IsNumeric(document.frm.a_519_b.value) &&  document.frm.a_519_b.value != 0) {
document.frm.a_520.value = roundit(parseFloat(document.frm.a_520.value) + parseFloat(document.frm.a_519_b.value), 2);
}
<!--- END adds up the 500 series --->


<!--- Add up 600 series --->
document.frm.a_601.value = 0
if (IsNumeric(document.frm.a_420.value) &&  document.frm.a_420.value != 0) {
document.frm.a_601.value = roundit(parseFloat(document.frm.a_601.value) + parseFloat(document.frm.a_420.value), 2);
}
document.frm.a_602.value = 0
if (IsNumeric(document.frm.a_520.value) &&  document.frm.a_520.value != 0) {
document.frm.a_602.value = roundit(parseFloat(document.frm.a_602.value) + parseFloat(document.frm.a_520.value), 2);
}
document.frm.a_603.value = 0
if (IsNumeric(document.frm.a_601.value) && IsNumeric(document.frm.a_602.value)) {
document.frm.a_603.value = roundit(parseFloat(document.frm.a_601.value) - parseFloat(document.frm.a_602.value), 2);
}
<!--- END of 600 series --->

}

</script>

<cfoutput><script type="text/javascript" language="javascript" src="https://#cgi.server_name#/admin_area/calendar/calendar.js"></script></cfoutput>



</HEAD>



<CFQUERY datasource="#request.dsn#" NAME="read_data">
			SELECT *
			FROM hud_form_title_pg1
			WHERE Title_ID = #rec_id#
		</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_data2">
			SELECT *
			FROM hud_form_title_pg2
			WHERE Title_ID = #rec_id#
		</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="get_titleid">
			SELECT *
			FROM title
			WHERE Title_ID = #rec_id#
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_insurance">
				SELECT * from Doc_Title_Insurance_Title
				where Title_ID = #rec_id#

			</CFQUERY>
			<cfif #get_insurance.recordcount# GT 0>
			<CFQUERY datasource="#request.dsn#" NAME="get_ins">
				SELECT * from title_companies
				where Title_co_ID = #get_insurance.insurance_co#

			</CFQUERY>
			<cfelse>
			<CFQUERY datasource="#request.dsn#" NAME="get_ins">
				SELECT * from title_companies
				where 0 = 1

			</CFQUERY>
			</cfif>
<CFQUERY datasource="#request.dsn#" NAME="get_billing_states">
		SELECT *
		FROM  Company_Billing_states
		WHERE company_id = #get_titleid.comp_id# AND a_states = '#get_titleid.pstate#'

</CFQUERY>
<cfif #get_billing_states.recordcount# GT "0">
<CFQUERY datasource="#request.dsn#" NAME="get_line_costs">
		SELECT *
		FROM Company_Billing_Values
		WHERE company_id = #get_titleid.comp_id# AND billing_id = #get_billing_states.billing_id#
	</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_agency">
		SELECT title_ft_agency_name
		FROM  company_agency_assoc
		WHERE billing_id = '#get_billing_states.billing_id#'

</CFQUERY>

<cfelse>
<cfset #read_agency.TITLE_FT_AGENCY_NAME# = "Agency N/A">
<cfset #get_line_costs.A_1111_TEXT# = "">
<cfset #get_line_costs.A_1112_TEXT# = "">
<cfset #get_line_costs.A_1113_TEXT# = "">
<cfset #get_line_costs.A_1114_TEXT# = "">
<cfset #get_line_costs.A_1205_TEXT# = "">
<cfset #get_line_costs.A_1303_TEXT# = "">
<cfset #get_line_costs.A_1304_TEXT# = "">
<cfset #get_line_costs.A_1305_TEXT# = "">
</cfif>
  <cfif #a_trigger# eq 2>
<CFQUERY datasource="#request.dsn#">
		update hud_form_title_pg2
		set print_date = '#DateFormat(Now(), "mmmmm dd, yyyy")#'
		WHERE Title_ID = #rec_id#

</CFQUERY>	</cfif>

<cfoutput><IFRAME STYLE="display:none;position:absolute;width:157;height:158;z-index=100" ID="CalFrame" MARGINHEIGHT=0 MARGINWIDTH=0 NORESIZE FRAMEBORDER=0 SCROLLING=NO SRC="https://#cgi.server_name#/calendar/popup_calendar.html"></IFRAME></cfoutput>

<BODY TEXT="#000000" LINK="#FF0000" VLINK="#800000" ALINK="#FF00FF" marginheight=0 marginwidth=0 topmargin=0 leftmargin=0 onLoad="AddUp();">

 <STYLE TYPE="text/css">
body {background-attachment:fixed;scrollbar-base-color:#708090}
.menu1 {color:#000000;font:normal bold 11px Arial, Helvetica, sans-serif;text-align:center;font-color:#000000}
.menu1:link    {text-decoration:none;color:#000000;font:normal bold 11px Arial, Helvetica, sans-serif;}
.menu1:visited {text-decoration:none;color:#000000;font:normal bold 11px Arial, Helvetica, sans-serif;}
.menu1:hover   {font:normal bold 11px Arial, Helvetica, sans-serif;text-decoration:none;color:#FFFFFF}
</style>

<STYLE TYPE="text/css"><!--
		A { color:#0033CC; text-decoration:none}
		BODY { font-family:arial,helvetica; margin-left:0; margin-top:0; margin-right:0;}
		A:hover,A:active { text-decoration:underline}
		TD { font-family:arial,helvetica;}

	--></STYLE>


<CFOUTPUT>
 <CFFORM name="frm" ACTION="./title_modify_hud_pg2_submit.cfm?uid=#uid#&rec_id=#rec_id#&a_trigger=1" onsubmit="javascript:return locate(this)" ENCTYPE="multipart/form-data" METHOD=POST>

<table align="center" width="98%" cellspacing=0 cellpadding=0>
   <tr>
      <td width="56%"><b><font face="Arial, Helvetica, sans-serif" size="1">A.
         </font><font face="Arial, Helvetica, sans-serif">Settlement Statement</font></b></td>
      <td  width="44%"><font face="Arial, Helvetica, sans-serif" size="1">US Department
         of Housing</font></td>
   </tr>
   <tr>
      <td width="56%"><font face="Arial, Helvetica, sans-serif" size="1">B. Type
         of Loan</font></td>
      <td width="44%"><font face="Arial, Helvetica, sans-serif" size="1">and Urban
         Development OMB No. 2502-0265</font></td>
   </tr>
</table>
   <table border="1" cellspacing=0 cellpadding=0 align = "center" width="98%" bordercolordark="666666" bordercolorlight="666666" bordercolor="666666">
      <tr>
         <td align="center">
            <table align="center" width="100%" cellspacing=0 cellpadding=0 border="1">
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">1.
                     <CFIF #read_data.a_1# EQ "FHA">
                     <img src="./images/checkbox_checked.gif">
                     <CFELSE>
                     <img src="./images/checkbox1.gif">
                     </CFIF>
                     FHA&nbsp;&nbsp;&nbsp;&nbsp;2.
                     <CFIF #read_data.a_1# EQ "FmHA">
                     <img src="./images/checkbox_checked.gif">
                     <CFELSE>
                     <img src="./images/checkbox1.gif">
                     </CFIF>
                     FmHA&nbsp;&nbsp;&nbsp;&nbsp;3.
                     <CFIF #read_data.a_1# EQ "Conventional">
                     <img src="./images/checkbox_checked.gif">
                     <CFELSE>
                     <img src="./images/checkbox1.gif">
                     </CFIF>
                     Conv. Unins.<br>
                     4.
                     <CFIF #read_data.a_1# EQ "VA">
                     <img src="./images/checkbox_checked.gif">
                     <CFELSE>
                     <img src="./images/checkbox1.gif">
                     </CFIF>
                     VA&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.
                     <CFIF #read_data.a_1# EQ "Conv. Ins.">
                     <img src="./images/checkbox_checked.gif">
                     <CFELSE>
                     <img src="./images/checkbox1.gif">
                     </CFIF>
                     Conv. Ins. </font></td>
                  <td width="17%"><font face="Arial, Helvetica, sans-serif" size="1">
                     6. File Number<br>
                     <b><font face="Arial, Helvetica, sans-serif" size="1" color="blue">#read_data.a_6#</font></b></font></td>
                  <td width="19%"><font face="Arial, Helvetica, sans-serif" size="1">7.
                     Loan Number<br>
                     <b><font face="Arial, Helvetica, sans-serif" size="1" color="blue">
					 <CFINPUT type="text" NAME="loan_number" SIZE=20 MAXLENGTH=199
							VALUE="#get_titleid.loan_number#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
							</font></b></font></td>
                  <td width="27%"><font face="Arial, Helvetica, sans-serif" size="1">8.
                     Mortgage Insurance Case Number<br>
                     <b><font face="Arial, Helvetica, sans-serif" size="1" color="blue"><cfif #read_data.a_8# neq "">
	  <INPUT  type="text" NAME="a_8" SIZE=20 MAXLENGTH=199
							VALUE="#read_data.a_8#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none; text-align:left;" >
							<cfelse>
							<INPUT type="text" NAME="a_8" SIZE=20 MAXLENGTH=199
							VALUE=""
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none; text-align:left;" >
							</cfif></font></b></font></td>
               </tr>
            </table>
         </td>
      </tr>
      <tr>
         <td align="center">
            <table align="center" cellspacing=0 cellpadding=0 width="100%">
               <tr valign="top">
                  <td width="43"><font face="Arial, Helvetica, sans-serif" size="1">
                     C. Note: </font></td>
                  <td width="671"><font face="Arial, Helvetica, sans-serif" size="1">This
                     form is furnished to give you a statement of the actual settlement
                     costs. Amounts paid by and to the settlement agent are shown.
                     Items marked "(p.o.c)" were paid outside the closing; they
                     are shown here for information purposes and are not included
                     in the totals. WARNING: It is a crime to knowingly make
                     false statements to the United States on this or any other
                     similar form. Penalties upon conviction can include a fine
                     and imprisonment. For details see; Title 18 U.S. Code Section
                     1001 and Section 1010. </font></td>
               </tr>
            </table>
         </td>
      </tr>
      <tr>
         <td align="center">
            <table align="center" cellspacing=0 cellpadding=0 width="100%">
          <tr valign="top">
            <td width="24%"><font size="1" face="Arial, Helvetica, sans-serif">D.
              NAME OF BORROWER:</font></td>
            <td width="76%"><b><font face="Arial, Helvetica, sans-serif" size="1" color="blue"><cfif get_titleid.company1 neq '' and get_titleid.company1 neq 'NULL'>#get_titleid.company1#<cfelse><cfif get_titleid.bfirstname1 neq '' and get_titleid.bfirstname1 neq 'NULL'>#get_titleid.bfirstname1#</cfif> <cfif get_titleid.bminame1 neq '' and get_titleid.bminame1 neq 'NULL'>#get_titleid.bminame1#.</cfif> <cfif get_titleid.blastname1 neq '' and get_titleid.blastname1 neq 'NULL'>#get_titleid.blastname1#</cfif><cfif get_titleid.bfirstname2 neq '' and get_titleid.bfirstname2 neq 'NULL'> and #get_titleid.bfirstname2#</cfif> <cfif get_titleid.bminame2 neq '' and get_titleid.bminame2 neq 'NULL'>#get_titleid.bminame2#.</cfif> <cfif get_titleid.blastname2 neq '' and get_titleid.blastname2 neq 'NULL'>#get_titleid.blastname2#</cfif> <cfif get_titleid.bfirstname3 neq '' and get_titleid.bfirstname3 neq 'NULL'> and #get_titleid.bfirstname3#</cfif> <cfif get_titleid.bminame3 neq '' and get_titleid.bminame3 neq 'NULL'>#get_titleid.bminame3#.</cfif> <cfif get_titleid.blastname3 neq '' and get_titleid.blastname3 neq 'NULL'>#get_titleid.blastname3#</cfif><cfif get_titleid.bfirstname4 neq '' and get_titleid.bfirstname4 neq 'NULL'> and #get_titleid.bfirstname4#</cfif> <cfif get_titleid.bminame4 neq '' and get_titleid.bminame4 neq 'NULL'>#get_titleid.bminame4#.</cfif> <cfif get_titleid.blastname4 neq '' and get_titleid.blastname4 neq 'NULL'>#get_titleid.blastname4#</cfif> <cfif (get_titleid.manner_of_title neq '' and get_titleid.manner_of_title neq 'NULL')>(#get_titleid.manner_of_title#)</cfif></cfif></font></b></td>
          </tr>
          <tr valign="top">
            <td width="24%"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;&nbsp;&nbsp;ADDRESS:</font></td>
            <td width="76%"><b><font face="Arial, Helvetica, sans-serif" size="1" color="blue"><cfif get_titleid.mailing_address neq '' and get_titleid.mailing_address neq 'NULL'>#get_titleid.mailing_address#<cfelse>#read_data.g_propaddr#</cfif></font></b></td>
          </tr>
        </table>
         </td>
      </tr>
      <tr>
         <td align="center" height="30">
            <table align="center" cellspacing=0 cellpadding=0 width="100%">
               <tr valign="top">
                  <td width="24%"><font face="Arial, Helvetica, sans-serif" size="1">E.
                     NAME OF SELLER:</font></td>
                  <td width="76%"><b><font face="Arial, Helvetica, sans-serif" size="1" color="blue"><cfif get_titleid.company2 neq '' and get_titleid.company2 neq 'NULL'>#get_titleid.company2#<cfelse><cfif get_titleid.comp_id neq 3276>#read_data.e_sname#</cfif></cfif></font></b></td>
               </tr>
               <tr valign="top">
                  <td width="24%"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;&nbsp;&nbsp;&nbsp;ADDRESS:</font></td>
                  <td width="76%"><b><font face="Arial, Helvetica, sans-serif" size="1" color="blue"><cfif get_titleid.company2 neq '' and get_titleid.company2 neq 'NULL'>#get_titleid.company2addr#<cfelse>#read_data.e_saddr#</cfif></font></b></td>
               </tr>
            </table>
         </td>
      </tr>
      <tr>
         <td align="center">
            <table align="center" cellspacing=0 cellpadding=0 width="100%">
               <tr valign="top">
                  <td width="24%"><font face="Arial, Helvetica, sans-serif" size="1">F.
                     NAME OF LENDER:</font></td>
                  <td width="76%"><b><font face="Arial, Helvetica, sans-serif" size="1" color="blue">#read_data.f_lname#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_titleid.insured#</font></b></td>
               </tr>
               <tr valign="top">
                  <td width="24%"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;&nbsp;&nbsp;&nbsp;ADDRESS:</font></td>
                  <td width="76%"><b><font face="Arial, Helvetica, sans-serif" size="1" color="blue">#read_data.f_laddr#</font></b></td>
               </tr>
            </table>
         </td>
      </tr>
      <tr>
         <td align="center">
            <table align="center" cellspacing=0 cellpadding=0 width="100%">
               <tr valign="top">
                  <td width="24%"><font face="Arial, Helvetica, sans-serif" size="1">G.
                     PROPERTY ADDRESS:</font></td>
                  <td width="76%"><b><font face="Arial, Helvetica, sans-serif" size="1" color="blue">#read_data.g_propaddr#</font></b></td>
               </tr>
            </table>
         </td>
      </tr>
      <tr>
         <td align="center">
            <table align="center" cellspacing=0 cellpadding=0 width="100%">
               <tr valign="top">
                  <td width="24%"><font face="Arial, Helvetica, sans-serif" size="1">H.
                     SETTLEMENT AGENT:</font></td>
                  <td width="76%"><b><font face="Arial, Helvetica, sans-serif" size="1" color="blue">#read_agency.title_FT_Agency_name#</font></b></td>
               </tr>
               <tr valign="top">
                  <td width="24%"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;&nbsp;&nbsp;&nbsp;PLACE
                     OF SETTLEMENT:</font></td>
<cfif NOT DateDiff("d", Now(), "1/30/2012")>
                  <td width="76%"><b><font face="Arial, Helvetica, sans-serif" size="1" color="blue">30
                     W. Gude Dr. Rockville, MD. 20850 - Montgomery County</font></b></td>
<cfelse>
                  <td width="76%"><b><font face="Arial, Helvetica, sans-serif" size="1" color="blue">30
                     7361 Calhoun Place, Suite 200, Rockville, MD. 20855 - Montgomery County</font></b></td>
</cfif>

               </tr>
            </table>
         </td>
      </tr>
      <tr>
         <td align="center">
            <table align="center" cellspacing=0 cellpadding=0 width="100%">
               <tr valign="top">
                  <td width="24%"><font face="Arial, Helvetica, sans-serif" size="1">I.
                     SETTLEMENT DATE:</font></td>
                  <td><b><font face="Arial, Helvetica, sans-serif" size="1" color="blue">
				  <CFINPUT type="text" NAME="i_settlementDate" SIZE=20 MAXLENGTH=199
							VALUE="#read_data.i_settlementDate#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
				  </font></b></td>
                   <td><font face="Arial, Helvetica, sans-serif" size="1">
                     DISBURSEMENT DATE:</font></td>
                  <td><b><font face="Arial, Helvetica, sans-serif" size="1" color="blue">
				  <CFINPUT type="text" NAME="dis_date" SIZE=20 MAXLENGTH=199
							VALUE="#read_data.dis_date#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
				  </font></b></td>
               </tr>
            </table>
         </td>
      </tr>
      <tr>
         <td align="center">
            <table align="center" cellspacing=0 cellpadding=0 width="100%" border="1">
               <tr valign="top" align="center">
                  <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="1"><b>J.
                     SUMMARY OF BORROWERS TRANSACTIONS:</b></font></td>
                  <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="1"><b>K.
                     SUMMARY OF SELLERS TRANSACTIONS:</b></font></td>
               </tr>
               <tr valign="top">
                  <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="1">100.
                     GROSS AMOUNT DUE FROM BORROWER</font></td>
                  <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="1">400.
                     GROSS AMOUNT DUE TO SELLER: </font></td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">101.
                     Contract Sales Price </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">
					<cfif #get_titleid.purchase# neq "">
					 <INPUT onFocus=cant_edit(this) type="text" NAME="a_101" SIZE=10 MAXLENGTH=199
							VALUE="#get_titleid.purchase#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_101" VALUE="0">
							</cfif>
					</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">401.
                     Contract Sales Price </font></td>
                  <td width="13%">
                     <div align="right"><cfif #get_titleid.purchase# neq "">
					 <INPUT onFocus=cant_edit(this) type="text" NAME="a_401" SIZE=10 MAXLENGTH=199
							VALUE="#get_titleid.purchase#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_401" VALUE="0">
							</cfif></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">102.
                     Personal Property </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue"><INPUT onBlur="AddUp();" type="text" NAME="a_102" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_102#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">402.
                     Personal Property </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue"><INPUT onBlur="AddUp();" type="text" NAME="a_402" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_402#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">103.
                     Settlement charges to buyer (line 1400) </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">

					<INPUT onblur="AddUp();" type="text" NAME="a_103" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_103#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >


					 </font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">403.
                     #read_data.a_403_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<INPUT onblur="AddUp();"  type="text" NAME="a_403_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_403_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">104.


				   <CFINPUT onBlur="AddUp();" type="text" NAME="a_104_a" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_104_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >

							 </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">

					 <INPUT onblur="AddUp();" type="text" NAME="a_104_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_104_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >

					 </font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">404.
                     #read_data.a_404_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue"><INPUT onblur="AddUp();" type="text" NAME="a_404_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_404_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">105.

				   <CFINPUT onBlur="AddUp();" type="text" NAME="a_105_a" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_105_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
							</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">

				   <INPUT onblur="AddUp();" type="text" NAME="a_105_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_105_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >

					 </font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">405.
                     #read_data.a_405_a#</font></td>
                  <td width="13%">
                     <div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_405_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_405_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>
                  </td>
               </tr>
               <tr valign="top">
<cfif get_titleid.comp_id eq 3276>
<td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">106.
                     Pre-payment Penalty </font></td>
                  <td width="13%">
                     <div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_106" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_106#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>
                  </td>
<cfelse>
                  <td colspan="2" align="center"><font face="Arial, Helvetica, sans-serif" size="1">Adjustments
                     for items paid by seller in advance </font></td>

</cfif>
                  <td colspan="2">
                     <div align="center"><font face="Arial, Helvetica, sans-serif" size="1">Adjustments
                        for items paid by seller in advance </font></div>
                  </td>
               </tr>
               <tr valign="top">
<cfif get_titleid.comp_id eq 3276>
                  <td colspan="2" align="center"><font face="Arial, Helvetica, sans-serif" size="1">Adjustments
                     for items paid by seller in advance </font></td>
<cfelse>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">106.
                     City / town taxes </font></td>
</cfif>
                  <td width="13%"><div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_106" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_106#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">406.
                     City / town taxes </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue"><INPUT onblur="AddUp();" type="text" NAME="a_406" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_406#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">107.
                     County Taxes </font></td>
                  <td width="13%">
                     <div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_107" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_107#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">407.
                     County Taxes </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue"><INPUT onblur="AddUp();" type="text" NAME="a_407" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_407#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">108.
                     Assessments </font></td>
                  <td width="13%">
                     <div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_108" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_108#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">408.
                     Assessments </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue"><INPUT onblur="AddUp();" type="text" NAME="a_408" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_408#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">109.
                     #read_data.a_109_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">
					<INPUT onblur="AddUp();" type="text" NAME="a_109_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_109_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >

					 </font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">409.
                     #read_data.a_409_a#</font></td>
                  <td width="13%">
                     <div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_409_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_409_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">110.
                     #read_data.a_110_a#</font></td>
                  <td width="13%">
                     <div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_110_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_110_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">410.
                     #read_data.a_410_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue"><INPUT onblur="AddUp();" type="text" NAME="a_410_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_410_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">111.
                     #read_data.a_111_a#</font></td>
                  <td width="13%">
                     <div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_111_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_111_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">411.
                     #read_data.a_411_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue"><INPUT onblur="AddUp();" type="text" NAME="a_411_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_411_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">112.
                     #read_data.a_112_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue"><INPUT onblur="AddUp();" type="text" NAME="a_112_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_112_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">412.
                     #read_data.a_412_a#</font></td>
                  <td width="13%">
                     <div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_412_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_412_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">120.
                     GROSS AMOUNT DUE FROM BORROWER </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">

				<INPUT onFocus=cant_edit(this) type="text" NAME="a_120" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_120#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >


					 </font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">420.
                     GROSS AMOUNT DUE TO SELLER </font></td>
                  <td width="13%">
                     <div align="right"><INPUT onFocus=cant_edit(this) type="text" NAME="a_420" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_420#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="1">200.
                     AMOUNTS PAID BY OR ON BEHALF OF BORROWER: </font> </td>
                  <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="1">500.
                     REDUCTIONS IN AMOUNT DUE TO SELLER: </font></td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">201.
                     Deposit or earnest money </font></td>
                  <td width="13%">

	<div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_1601" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_1601#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">501.
                     Excess deposit (see instructions) </font></td>
                  <td width="13%">
                     <div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_500" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_500#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">202.
                     Principal amount of new loan(s) </font></td>
                  <td width="13%">
                     <div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_202" SIZE=10 MAXLENGTH=199
							VALUE="#get_titleid.loanamt_float#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">502.
                     Settlement charges to seller (line 1400) </font></td>
                  <td width="13%">
                     <div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_502" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1400_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">203.
                     Existing loan(s) taken subject to </font></td>
                  <td width="13%">
                     <div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_203" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_203#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">503.
                     Existing loan(s) taken subject to </font></td>
                  <td width="13%">
                     <div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_503" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_503#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">204.
                     #read_data.a_204_a#</font></td>
                  <td width="13%">
                  <div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_204_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_204_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">504.
                     Payoff of First Mortgage Loan </font></td>
                  <td width="13%"> <div align="right">
                    <cfif #get_titleid.searchType# eq "Purchase">
					   <INPUT onblur="AddUp();" type="text" NAME="a_504" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_504#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
							<cfelse>
							<div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_504" SIZE=10 MAXLENGTH=199
							VALUE="0"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div></div>
					</cfif>
                  </td>
               </tr>
               <!-----<tr valign="top">
                  <td width="33%"><font face="Arial, Helvetica, sans-serif" size="1"></font></td>
                  <td width="17%">
                     <div align="right"><b><font face="Arial, Helvetica, sans-serif" size="1" color="blue"><font face="Arial, Helvetica, sans-serif"><font face="Arial, Helvetica, sans-serif"><font size="1"></font></font></font></font></b></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1"></font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif"><font face="Arial, Helvetica, sans-serif"><font size="1"><font size="1"><font color="blue"><b><font face="Arial, Helvetica, sans-serif"><font face="Arial, Helvetica, sans-serif"><font size="1"></font></font></font></b></font></font></font></font></font></div>
                  </td>
               </tr>----->
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">205.
                     #read_data.a_205_a#</font></td>
                  <td width="13%">
                    <div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_205_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_205_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">505.
                     Payoff of Second Mortgage Loan </font></td>
                  <td width="13%"><div align="right">
                 <cfif #get_titleid.searchType# eq "Purchase">
					  <INPUT onblur="AddUp();" type="text" NAME="a_505" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_505#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>
							<cfelse>
							<INPUT onblur="AddUp();" type="text" NAME="a_505" SIZE=10 MAXLENGTH=199
							VALUE="0"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
							</cfif></div>
                  </td>
               </tr>
              <!-----<tr valign="top">
                  <td width="33%"><font face="Arial, Helvetica, sans-serif" size="1"></font></td>
                  <td width="17%">
                     <div align="right"><b><font face="Arial, Helvetica, sans-serif" size="1" color="blue"><font face="Arial, Helvetica, sans-serif"><font face="Arial, Helvetica, sans-serif"><font size="1"></font></font></font></font></b></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1"></font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif"><font face="Arial, Helvetica, sans-serif"><font size="1"><font size="1"><font color="blue"><b><font face="Arial, Helvetica, sans-serif"><font face="Arial, Helvetica, sans-serif"><font size="1"></font></font></font></b></font></font></font></font></font></div>
                  </td>
               </tr>----->
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">206.
                     #read_data.a_206_a#</font></td>
                  <td width="13%">
                     <div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_206_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_206_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">506.
                     #read_data.a_506_a#</font></td>
                  <td width="13%">
                     <div align="right"><div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_506_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_506_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">207.
                     #read_data.a_207_a#</font></td>
                  <td width="13%">
                     <div align="right"><div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_207_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_207_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">507.
                     #read_data.a_507_a#</font></td>
                  <td width="13%">
                     <div align="right"><div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_507_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_507_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">208.
                     #read_data.a_208_a#</font></td>
                  <td width="13%">
                     <div align="right"><div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_208_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_208_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">508.
                     #read_data.a_508_a#</font></td>
                  <td width="13%">
                     <div align="right"><div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_508_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_508_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">209.
                     #read_data.a_209_a#</font></td>
                  <td width="13%">
                     <div align="right"><div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_209_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_209_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">509.
                     #read_data.a_509_a#</font></td>
                  <td width="13%">
                    <div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_509_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_509_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td colspan="2">
                     <div align="center"><font face="Arial, Helvetica, sans-serif" size="1">Adjustments
                        for items unpaid by seller </font></div>
                  </td>
                  <td colspan="2">
                     <div align="center"><font face="Arial, Helvetica, sans-serif" size="1">
                        Adjustments for items unpaid by seller </font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">210.
                     City / town taxes </font></td>
                  <td width="13%">
                     <div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_210" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_210#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">510.
                     City / town taxes </font></td>
                  <td width="13%">
                    <div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_510" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_510#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">211.
                     County Taxes </font></td>
                  <td width="13%">
                    <div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_211" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_211#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">511.
                     County Taxes </font></td>
                  <td width="13%">
                    <div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_511" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_511#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">212.
                     Assessments </font></td>
                  <td width="13%">
                    <div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_212" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_212#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">512.
                     Assessments </font></td>
                  <td width="13%">
                    <div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_512" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_512#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">213.
                     #read_data.a_213_a#</font></td>
                  <td width="13%">
                    <div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_213_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_213_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">513.
                     #read_data.a_513_a#</font></td>
                  <td width="13%">
                    <div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_513_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_513_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">214.
                     #read_data.a_214_a#</font></td>
                  <td width="13%">
                   <div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_214_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_214_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">514.
                     #read_data.a_514_a#</font></td>
                  <td width="13%">
                    <div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_514_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_514_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">215.
                     #read_data.a_215_a#</font></td>
                  <td width="13%">
                   <div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_215_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_215_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">515.
                     #read_data.a_515_a#</font></td>
                  <td width="13%">
                    <div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_515_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_515_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">216.
                     #read_data.a_216_a#</font></td>
                  <td width="13%">
                    <div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_216_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_216_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">516.
                     #read_data.a_516_a#</font></td>
                  <td width="13%">
                   <div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_516_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_516_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">217.
                     #read_data.a_217_a#</font></td>
                  <td width="13%">
                   <div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_217_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_217_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">517.
                     #read_data.a_517_a#</font></td>
                  <td width="13%">
                   <div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_517_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_517_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">218.
                     #read_data.a_218_a#</font></td>
                  <td width="13%">
                    <div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_218_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_218_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">518.
                     #read_data.a_518_a#</font></td>
                  <td width="13%">
                   <div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_518_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_518_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">219.
                     #read_data.a_219_a#</font></td>
                  <td width="13%">
                   <div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_219_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_219_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">519.
                     #read_data.a_519_a#</font></td>
                  <td width="13%">
                   <div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_519_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_519_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">220.
                     TOTAL PAID BY/FOR BORROWER </font></td>
                  <td width="13%">
                    <div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_220" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_220#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">520.
                     TOTAL REDUCTION AMOUNT DUE SELLER</font></td>
                  <td width="13%">
                     <div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_520" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_520#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="1">300.
                     CASH AT SETTLEMENT FROM OR TO BORROWER: </font> </td>
                  <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="1">600.
                     CASH AT SETTLEMENT TO OR FROM SELLER: </font></td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">301.
                     Gross amount due from borrower (line 120) </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">
							<div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_301" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_301#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>


					 </font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">601.
                     Gross amount due to seller (line 420) </font></td>
                  <td width="13%">
                    <div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_601" SIZE=10 MAXLENGTH=199
							VALUE="#get_titleid.purchase#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">302.
                     Less amounts paid by/for borrower (line 220) </font></td>
                  <td width="13%">
                     <div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_302" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_302#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">602.
                     Less reduction amount due seller (line 520)</font></td>
                  <td width="13%">
                   <div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_602" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_602#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><br>
                     <font face="Arial, Helvetica, sans-serif" size="1">303. CASH
                     FROM BORROWER </font></td>
                  <td width="13%"><br>
                    <div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_303" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_303#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>
                  </td>
                  <td width="37%"><br>
                     <font face="Arial, Helvetica, sans-serif" size="1">603. CASH
                     TO SELLER</font></td>
                  <td width="13%"><br>
                    <div align="right"><INPUT onblur="AddUp();" type="text" NAME="a_603" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_603#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: WHITE;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></div>
                  </td>
               </tr>
            </table>
         </td>
      </tr>

      <tr>
         <td ><br><font face="Arial, Helvetica, sans-serif" size="1"> SUBSTITUE FROM
            1099 SELLER STATEMENT: The information contained herein is important
            tax information and is being furnished to the Internal Revenue Service.
            If you are required to file a return, a negligence penalty or other
            sanction will be imposed on you if this item is required to be reported
            and the IRS determines that it has not been reported. The contract
            sales price described on line 401 above constitutes the gross proceeds
            of this transaction. </font></td>
      </tr>
      <tr>
         <td ><br><font face="Arial, Helvetica, sans-serif" size="1">SELLER INSTRUCTIONS:
            If this real estate was your principal residence, file form 2119 ,
            Sale or Exchange of PRincipal Residence, for any gain, with your income
            tax return: for other transactions, complete the applicable parts
            of Form 4797, Form 6252 and/or Schedule D (Form 1040) </font></td>
      </tr>
      <tr>
         <td ><br>
            <font face="Arial, Helvetica, sans-serif" size="1">You are required
            by law to provide the settlement agent (Fed. Tax ID No: <B><font color="blue" size="1">#read_data.Fed_tax_id_no#</font></B>)
            with your correct taxpayer identification number. If you do not provide
            your correct taxpayer identification number, you may be subject to
            civil or criminal penalties imposed by law. Under penalties of purjury,
            I certify that the number shown on this statement is my correct taxpayer
            identification number.</font></td>
      </tr>
      <tr>
         <td ><br>
            <font face="Arial, Helvetica, sans-serif" size="1">TIN: <B><font size="1" face="Arial, Helvetica, sans-serif" color="blue">#read_data.Fed_tax_id_no#</font></B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seller(s)
            Signature(s)____________________________________________________</font></td>
      </tr>
      <tr>
         <td ><br>
            <font face="Arial, Helvetica, sans-serif" size="1">SELLER(S) NEW MAILING
            ADDRESS: </font><B><font face="Arial, Helvetica, sans-serif" size="1" color="blue">#read_data.seller_new_addr#</font></B></td>
      </tr>
      <tr>
         <td ><br>
            <font face="Arial, Helvetica, sans-serif" size="1">SELLER(S)PHONE
            NUMBERS:(H) (W) &nbsp;&nbsp;<B><font color="blue" size="1" face="Arial, Helvetica, sans-serif">#read_data.seller_new_home_phone#</font></B><font size="1">(H)</font>&nbsp;&nbsp;&nbsp;&nbsp;
            <B><font color="blue" size="1" face="Arial, Helvetica, sans-serif">#read_data.seller_new_work_phone#</font></B><font size="1">(W)</font></font></td>
      </tr>
      <tr>
         <td ></td>
      </tr>

   </table>

   <!--------end of first page-------->
 <p>&nbsp;</p> <p>&nbsp;</p><p>&nbsp;</p><p><br>
 <p><hr size="1" color="dimgray" width="98%"></p>
<p>&nbsp;</p>

  <table border="1" cellspacing=0 cellpadding=0 align = "center" width="98%" bordercolordark="666666" bordercolorlight="666666" bordercolor="666666">
<tr><td colspan="3">
  <table align="center" width="100%">
    <tr>
      <td width="56%"><div align="center"><b><font face="Arial, Helvetica, sans-serif" size="1">U.S.
          DEPARTMET OF HOUSING AND URBAN DEVELOPMENT</font></b></div></td>
      <td  width="44%"><font face="Arial, Helvetica, sans-serif" size="1">File
        Number: <b>#read_data2.title_id#</b></font></td>
    </tr>
    <tr>
      <td width="56%"><div align="center"><b><font face="Arial, Helvetica, sans-serif" size="2">SETTLEMENT
          STATEMENT</font></b></div></td>
      <td  width="44%"><font face="Arial, Helvetica, sans-serif" size="1">PAGE
        2</font> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font face="Arial, Helvetica, sans-serif" size="1">FINAL</font>
      </td>
    </tr>
  </table>
</td>
</tr>
    <tr>
      <td width="70%"><font size="1" face="Arial, Helvetica, sans-serif">L. SETTLEMENT CHARGES</font></td>
         <td width="15%" rowspan="5" align="center"><font size="1" face="Arial, Helvetica, sans-serif">PAID
            FROM BORROWERS FUNDS AT SETTLEMENT</font></td>
         <td width="15%" rowspan="5" align="center"><font size="1" face="Arial, Helvetica, sans-serif">PAID
            FROM SELLERS FUNDS AT SETTLEMENT</font></td>
    </tr>
    <tr>
      <td><font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif">700. TOTAL SALES/BROKER'S COMMISSION based on price &nbsp;&nbsp;$
        <b><cfif #read_data2.a_700_a# neq "0"><INPUT onblur="AddUp();" type="text" NAME="a_700_a" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_700_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none; text-align:right;" >
							<cfelse>
							<INPUT onblur="AddUp();" type="text" NAME="a_700_a" SIZE=10 MAXLENGTH=199
							VALUE=""
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none; text-align:right;" >
							</cfif></b> &nbsp;&nbsp;&nbsp;@&nbsp;&nbsp;
        <b><cfif #read_data2.a_700_b# neq "0"><INPUT onblur="AddUp();" type="text" NAME="a_700_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_700_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none; text-align:right;" >
							<cfelse>
							<INPUT onblur="AddUp();"  type="text" NAME="a_700_b" SIZE=10 MAXLENGTH=199
							VALUE=""
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none; text-align:right;" >
							</cfif></b> <b><cfif #read_data2.a_700_c# neq "0"><INPUT onblur="AddUp();" type="text" NAME="a_700_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_700_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none; text-align:right;" >
							<cfelse>
							<INPUT onblur="AddUp();" type="text" NAME="a_700_c" SIZE=10 MAXLENGTH=199
							VALUE=""
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none; text-align:right;" >
							</cfif></b></font></td>
    </tr>
    <tr>
      <td><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Division
        of commission (line 700) as follows:</font></td>
    </tr>
    <tr>
      <td><font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">701. &nbsp;&nbsp;$<font color=blue><b><cfif #read_data2.a_701_a# neq "0"><INPUT onblur="AddUp();" type="text"  NAME="a_701_a" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_701_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none; text-align:right;" >
							<cfelse>
							<INPUT onblur="AddUp();" NAME="a_701_a" SIZE=10 MAXLENGTH=199
							VALUE=""
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none; text-align:right;" >
							</cfif></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>to
        <font color=blue> <b><cfif #read_data2.a_701_b# neq "0"><INPUT onblur="AddUp();" type="text" NAME="a_701_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_701_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none; text-align:right;" >
							<cfelse>
							<INPUT onblur="AddUp();" type="text" NAME="a_701_b" SIZE=10 MAXLENGTH=199
							VALUE=""
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none; text-align:right;" >
							</cfif></b></font></font></td>
    </tr>
    <tr>
      <td><font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">702. &nbsp;&nbsp;$<font color=blue> <b><cfif #read_data2.a_702_a# neq "0"><INPUT onblur="AddUp();" type="text" NAME="a_702_a" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_702_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none; text-align:right;" >
							<cfelse>
							<INPUT  onblur="AddUp();" type="text" NAME="a_702_a" SIZE=10 MAXLENGTH=199
							VALUE=""
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none; text-align:right;" >
							</cfif></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>to
        <font color=blue> <b><cfif #read_data2.a_702_b# neq "0"><INPUT onblur="AddUp();" type="text" NAME="a_702_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_702_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none; text-align:right;" >
							<cfelse>
							<INPUT onblur="AddUp();"  type="text" NAME="a_702_b" SIZE=10 MAXLENGTH=199
							VALUE=""
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none; text-align:right;" >
							</cfif></b></font></font></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">703. Commission paid at settlement </font></td>
      <td align="right"> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b><cfif #read_data2.a_703_a# neq "0"><INPUT type="text" onblur="AddUp();"  NAME="a_703_a" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_703_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none; text-align:right;" >
							<cfelse>
							<INPUT onblur="AddUp();" type="text" NAME="a_703_a" SIZE=10 MAXLENGTH=199
							VALUE=""
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none; text-align:right;" >
							</cfif></b> </font></td>
      <td align="right"> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b><cfif #read_data2.a_703_b# neq "0"><INPUT onblur="AddUp();" type="text" NAME="a_703_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_703_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none; text-align:right;" >
							<cfelse>
							<INPUT onblur="AddUp();"  type="text" NAME="a_703_b" SIZE=10 MAXLENGTH=199
							VALUE=""
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none; text-align:right;" >
							</cfif></b> </font></td>
    </tr>
    <tr>
      <td colspan=3> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">800. ITEMS PAYABLE IN CONNECTION WITH LOAN </font></td>
    </tr>


  <tr>

      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">801. Loan Origination Fee
	 &nbsp; <cfINPUT type="text" NAME="a_801_a" onBlur="document.frm.a_801_g.value = ''; AddUp();"  SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_801_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >%
							  &nbsp;
		<CFINPUT type="text" NAME="a_801_d" onBlur="AddUp();"  SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_801_d#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;

							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OR enter value here
		<CFINPUT type="text" onBlur="AddUp();"  VALUE="#read_data2.a_802_g#" NAME="a_801_g" SIZE=10 MAXLENGTH=199
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
							</font></td>
      <td align="right"> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>

		<INPUT onBlur="AddUp();" type="text" NAME="a_801_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_801_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >


							</b> </font>

		</td>


      <td align="right"><INPUT  onBlur="AddUp();" type="text" NAME="a_801_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_801_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >	</td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">802. Loan Discount &nbsp;
	<cfINPUT type="text" NAME="a_802_a" onBlur="document.frm.a_802_g.value = ''; AddUp();"  SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_802_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >%
							  &nbsp;
		<CFINPUT type="text" NAME="a_802_d" onBlur="AddUp();"  SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_802_d#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OR enter value here
		<CFINPUT type="text" onBlur="AddUp();"  NAME="a_802_g"  VALUE="#read_data2.a_802_g#" SIZE=10 MAXLENGTH=199
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
							</font></td>
      <td align="right"> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>

		<INPUT onBlur="AddUp();"  type="text" NAME="a_802_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_802_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >


							</b></font>
							</td>


      <td align="right"><INPUT  onBlur="AddUp();" type="text" NAME="a_802_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_802_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >	</td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">803. Appraisal Fee
	  <CFINPUT type="text"  onBlur="AddUp();" NAME="a_803_a" SIZE=50 MAXLENGTH=199
							VALUE="#read_data2.a_803_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
	  </font></td>
      <td align="right"> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>
		<INPUT  onBlur="AddUp();" type="text" NAME="a_803_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_803_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >

		</b> </font></td>
      <td align="right"><INPUT  onBlur="AddUp();" type="text" NAME="a_803_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_803_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">804. Credit Report
	  <CFINPUT type="text" onBlur="AddUp();" NAME="a_804_a" SIZE=50 MAXLENGTH=199
							VALUE="#read_data2.a_804_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
	  </font></td>
      <td align="right"> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>
		<INPUT  onBlur="AddUp();" type="text" NAME="a_804_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_804_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
		</b> </font></td>
      <td align="right"><INPUT  onBlur="AddUp();" type="text" NAME="a_804_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_804_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">805.
	   	 <CFINPUT type="text" onBlur="AddUp();" NAME="a_805_a" SIZE=33 MAXLENGTH=199
							VALUE="#read_data2.a_805_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
							&nbsp;&nbsp;
							 <CFINPUT onBlur="AddUp();" type="text" NAME="a_805_c" SIZE=33 MAXLENGTH=199
							VALUE="#read_data2.a_805_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
	   </font></td>
      <td align="right"> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>
		   <INPUT  onBlur="AddUp();" type="text" NAME="a_805_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_805_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
		</b> </font></td>
      <td align="right"><INPUT  onBlur="AddUp();" type="text" NAME="a_805_d" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_805_d#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">806.
	 <CFINPUT type="text" onBlur="AddUp();" NAME="a_806_a" SIZE=33 MAXLENGTH=199
							VALUE="#read_data2.a_806_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
							&nbsp;&nbsp;
							       <CFINPUT onBlur="AddUp();" type="text" NAME="a_806_c" SIZE=33 MAXLENGTH=199
							VALUE="#read_data2.a_806_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
	   </font></td>
      <td align="right"><INPUT  onBlur="AddUp();" type="text" NAME="a_806_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_806_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
      <td align="right"><INPUT  onBlur="AddUp();" type="text" NAME="a_806_d" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_806_d#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">807.
	     	<CFINPUT type="text" onBlur="AddUp();" NAME="a_807_a" SIZE=33 MAXLENGTH=199
							VALUE="#read_data2.a_807_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
							&nbsp;&nbsp;
							       <CFINPUT onBlur="AddUp();" type="text" NAME="a_807_c" SIZE=33 MAXLENGTH=199
							VALUE="#read_data2.a_807_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
	   </font></td>
      <td align="right"><INPUT  onBlur="AddUp();" type="text" NAME="a_807_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_807_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
      <td align="right"><INPUT  onBlur="AddUp();" type="text" NAME="a_807_d" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_807_d#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">808.
	<CFINPUT onBlur="AddUp();" type="text" NAME="a_808_a" SIZE=33 MAXLENGTH=199
							VALUE="#read_data2.a_808_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
							&nbsp;&nbsp;
							       <CFINPUT onBlur="AddUp();" type="text" NAME="a_808_c" SIZE=33 MAXLENGTH=199
							VALUE="#read_data2.a_808_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;

							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
	   </font></td>
      <td align="right"><INPUT  onBlur="AddUp();" type="text" NAME="a_808_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_808_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
      <td align="right"><INPUT  onBlur="AddUp();" type="text" NAME="a_808_d" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_808_d#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">809.
	  <CFINPUT type="text" onBlur="AddUp();" NAME="a_809_a" SIZE=33 MAXLENGTH=199
							VALUE="#read_data2.a_809_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
							&nbsp;&nbsp;
							       <CFINPUT onBlur="AddUp();"  type="text" NAME="a_809_c" SIZE=33 MAXLENGTH=199
							VALUE="#read_data2.a_809_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
	   </font></td>
      <td align="right"><INPUT  onBlur="AddUp();" type="text" NAME="a_809_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_809_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
		</b> </font></td>
      <td align="right"> <INPUT  onBlur="AddUp();" type="text" NAME="a_809_d" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_809_d#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">810.
	  	 <CFINPUT onBlur="AddUp();" type="text" NAME="a_810_a" SIZE=33 MAXLENGTH=199
							VALUE="#read_data2.a_810_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
							&nbsp;&nbsp;
							<CFINPUT onBlur="AddUp();"  type="text" NAME="a_810_c" SIZE=33 MAXLENGTH=199
							VALUE="#read_data2.a_810_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
	   </font></td>
      <td align="right"><INPUT  onBlur="AddUp();" type="text" NAME="a_810_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_810_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
      <td align="right"><INPUT  onBlur="AddUp();" type="text" NAME="a_810_d" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_810_d#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">811.
		<CFINPUT type="text" onBlur="AddUp();" NAME="a_811_a" SIZE=33 MAXLENGTH=199
							VALUE="#read_data2.a_811_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
							&nbsp;&nbsp;
							       <CFINPUT onBlur="AddUp();" type="text" NAME="a_811_c" SIZE=33 MAXLENGTH=199
							VALUE="#read_data2.a_811_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
	   </font></td>
      <td align="right"><INPUT  onBlur="AddUp();" type="text" NAME="a_811_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_811_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
      <td align="right"><INPUT  onBlur="AddUp();" type="text" NAME="a_811_d" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_811_d#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
    </tr>
    <tr>
      <td colspan=3> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">900. ITEMS REQUIRED BY LENDER TO BE PAID IN ADVANCE </font></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">901. Interest From
	  <INPUT  onBlur="AddUp();" type="text" NAME="a_901_a" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_901_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
							<A href="javascript:ShowCalendar(document.all('calpic'),document.all('a_901_a'),document.all('null'),'01/1/2009', '12/31/2009')" onclick="event.cancelBubble=true;"><img src="https://#cgi.server_name#/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic" style="POSITION: relative"></A>&nbsp;&nbsp;to

	  </b></font> <font color=blue> <b>
        <INPUT  onBlur="AddUp();" type="text" NAME="a_901_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_901_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
							<A href="javascript:ShowCalendar(document.all('calpic2'),document.all('a_901_b'),document.all('null'),'01/1/2009', '12/31/2009')" onclick="event.cancelBubble=true;"><img src="https://#cgi.server_name#/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic2" style="POSITION: relative"></A>&nbsp;&nbsp;@ $


		</b></font>
         <font color=blue> <b>

		    <INPUT  onBlur="AddUp();" type="text" NAME="a_901" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_901#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >

		</b> </font></font> <font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;/day
        </font></td>
      <td align="right"> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>

		<INPUT  onBlur="AddUp();" type="text" NAME="a_901_d" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_901_d#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >


							</b> </font></td>
      <td align="right"><INPUT  onBlur="AddUp();" type="text" NAME="a_901_e" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_901_e#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">902. Mortgage Insurance Premium for&nbsp;&nbsp;<font color=blue><b>
	  <CFINPUT type="text" onBlur="AddUp();" NAME="a_902_a" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_902_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
	  </b>
        </font>&nbsp;&nbsp;&nbsp; to <font color=blue> <b>
		 <INPUT  onBlur="AddUp();" type="text" NAME="a_902_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_902_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
		</b>
        </font></font></td>
      <td align="right"> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>
		 <INPUT  onBlur="AddUp();" type="text" NAME="a_902_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_902_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
		</b> </font></td>
      <td align="right"><INPUT  onBlur="AddUp();" type="text" NAME="a_902_d" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_902_d#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif">903. Hazard
        Insurance Premium for &nbsp;&nbsp;<font color="blue"> <b>
		 <CFINPUT onBlur="AddUp();" type="text" NAME="a_903_a" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_903_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
		</b>&nbsp;&nbsp;&nbsp;<font color="##000000">
        to</font> <b>
		 <CFINPUT onBlur="AddUp();" type="text" NAME="a_903_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_903_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
		</b></font> </font></td>
      <td align="right"> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>
		<INPUT  onBlur="AddUp();" type="text" NAME="a_903_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_903_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
		</b> </font></td>
      <td align="right"><INPUT  onBlur="AddUp();" type="text" NAME="a_903_d" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_903_d#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">904.
		<CFINPUT onBlur="AddUp();" type="text" NAME="a_904_a" SIZE=33 MAXLENGTH=199
							VALUE="#read_data2.a_904_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
							&nbsp;&nbsp;
							       <CFINPUT onBlur="AddUp();" type="text" NAME="a_904_c" SIZE=33 MAXLENGTH=199
							VALUE="#read_data2.a_904_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
	   </font></td>
      <td align="right"> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>
		<INPUT  onBlur="AddUp();" type="text" NAME="a_904_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_904_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
		</b> </font></td>
      <td align="right"><INPUT  onBlur="AddUp();" type="text" NAME="a_904_d" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_904_d#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">905. Lender's Inspection Fee </font></td>
      <td align="right"> <INPUT  onBlur="AddUp();" type="text" NAME="a_905_a" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_905_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
      <td align="right"><INPUT  onBlur="AddUp();" type="text" NAME="a_905_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_905_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
    </tr>
    <tr>
      <td colspan="3"> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">1000. RESERVES DEPOSITED WITH LENDER FOR </font></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">1001. Hazard Insurance&nbsp;&nbsp; <font color=blue> <b>
	   <INPUT  onBlur="AddUp();" type="text" NAME="a_1001_a" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1001_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
	  </b></font>mo.
        @ $&nbsp;&nbsp;<INPUT  onBlur="AddUp();" type="text" NAME="a_1001_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1001_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >&nbsp;&nbsp;/mo
        </font></td>
      <td align="right"> <font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>

		 <INPUT  onBlur="AddUp();" type="text" NAME="a_1001_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1001_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >


		</b></font> </td>
      <td align="right"><INPUT  onBlur="AddUp();" type="text" NAME="a_1001_d" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1001_d#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">1002. Mortgage Insurance&nbsp;&nbsp; <INPUT  onBlur="AddUp();" type="text" NAME="a_1002_a" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1002_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >mo.
        @ $&nbsp;&nbsp;<font color=blue> <b>
		 <INPUT  onBlur="AddUp();" type="text" NAME="a_1002_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1002_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
		</b></font>&nbsp;&nbsp;/mo
        </font></td>
      <td align="right"> <font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>


		<INPUT  onBlur="AddUp();" type="text" NAME="a_1002_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1002_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >

		</b></font> </td>
      <td align="right"><INPUT  onBlur="AddUp();" type="text" NAME="a_1002_d" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1002_d#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">1003. City Property Taxes&nbsp;&nbsp; <font color=blue> <b>
	   <INPUT  onBlur="AddUp();" type="text" NAME="a_1003_a" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1003_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
	  </b></font>mo.
        @ $&nbsp;&nbsp;<font color=blue> <b>
		   <INPUT  onBlur="AddUp();" type="text" NAME="a_1003_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1003_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
		</b></font>&nbsp;&nbsp;/mo
        </font></td>
      <td align="right"> <font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>

		 <INPUT  onBlur="AddUp();" type="text" NAME="a_1003_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1003_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >

		</b></font> </td>
      <td align="right"><INPUT  onBlur="AddUp();" type="text" NAME="a_1003_d" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1003_d#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">1004. County Property Taxes&nbsp;&nbsp; <INPUT  onBlur="AddUp();" type="text" NAME="a_1004_a" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1004_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >mo.
        @ $&nbsp;&nbsp;<font color=blue><b>
		 <INPUT  onBlur="AddUp();" type="text" NAME="a_1004_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1004_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
		</b></font>&nbsp;&nbsp;/mo</font></td>
      <td align="right"> <font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>

		<INPUT  onBlur="AddUp();" type="text" NAME="a_1004_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1004_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >

		</b></font> </td>
      <td align="right"><INPUT  onBlur="AddUp();" type="text" NAME="a_1004_d" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1004_d#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">1005. Annual Assessments&nbsp;&nbsp; <INPUT  onBlur="AddUp();" type="text" NAME="a_1005_a" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1005_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
	  </b></font>mo.
        @ $&nbsp;&nbsp;<INPUT  onBlur="AddUp();" type="text" NAME="a_1005_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1005_b#"
							style="font-size: 9;
							font-family: verdana;

							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >&nbsp;&nbsp;/mo
        </font></td>
      <td align="right"><INPUT  onBlur="AddUp();" type="text" NAME="a_1005_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1005_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >


		</b></font> </td>
      <td align="right"><INPUT  onBlur="AddUp();" type="text" NAME="a_1005_d" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1005_d#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">1006. Aggragate Analysis Adjustment &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to</font></td>
      <td align="right"><INPUT  onBlur="AddUp();" type="text" NAME="a_1006_a" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1006_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
      <td align="right"><INPUT  onBlur="AddUp();" type="text" NAME="a_1006_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1006_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" > </td>
    </tr>
    <tr>
      <td colspan="3"> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">1100. TITLE CHARGES </font></td>
    </tr>
    <tr>
      <td><font size="1" face="Arial, Helvetica, sans-serif">1101. Settlement
        or closing fee&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to
        <font color=blue><cfif #read_data2.a_1101_a# neq "0" OR #read_data2.a_1101_b# neq ""> <b>#read_agency.title_ft_agency_name#</b> </cfif></font></font></td>
      <td align="right"><font size=1 color=blue face="Arial, Helvetica, sans-serif"><INPUT  onBlur="AddUp();" type="text" NAME="a_1101_a" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1101_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
      <td align="right"><INPUT  onBlur="AddUp();" type="text" NAME="a_1101_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1101_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
    </tr>
    <tr>
      <td><font size="1" face="Arial, Helvetica, sans-serif">1102. Abstract or Title Search&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to
        <cfif get_titleid.comp_ID eq 202><b>ESS Solutions, LLC</b><cfelse><b>Abstracts USA, LLC</b></cfif></font></td>
      <td align="right"><font size=1 color=blue face="Arial, Helvetica, sans-serif"><INPUT  onBlur="AddUp();" type="text" NAME="a_1102_a" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1102_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
      <td align="right"><INPUT  onBlur="AddUp();" type="text" NAME="a_1102_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1102_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
    </tr>
    <tr valign="top">
      <td> <font size="1" face="Arial, Helvetica, sans-serif">1103. Title
        Examination&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to <font color=blue><b><cfif #read_data2.a_1103_a# neq "0" OR #read_data2.a_1103_b# neq "">#read_agency.title_ft_agency_name#</b> </cfif>
        </font></font></td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue> <INPUT  onBlur="AddUp();" type="text" NAME="a_1103_a" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1103_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif"><INPUT  onBlur="AddUp();" type="text" NAME="a_1103_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1103_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif">1104. Title
        Insurance Binder&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to
        <font color=blue> <cfif #read_data2.a_1104_a# neq "0" OR #read_data2.a_1104_b# neq ""><b>#read_agency.title_ft_agency_name#</b> </cfif></font></font></td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<INPUT  onBlur="AddUp();" type="text" NAME="a_1104_a" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1104_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<INPUT  onBlur="AddUp();" type="text" NAME="a_1104_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1104_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif">1105. Document
        Preparation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to <font color=blue>
      <cfif #read_data2.a_1105_a# neq "0" OR #read_data2.a_1105_b# neq "">  <b>#read_agency.title_ft_agency_name#</b> </cfif></font></font></td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<INPUT  onBlur="AddUp();" type="text" NAME="a_1105_a" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1105_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<INPUT  onBlur="AddUp();" type="text" NAME="a_1105_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1105_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
    </tr>
    <tr >
      <td> <font size="1" face="Arial, Helvetica, sans-serif">1106. NotaryFees&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to
        <font color=blue><b><cfif #read_data2.a_1106_a# neq "0" OR #read_data2.a_1106_b# neq "">#read_agency.title_ft_agency_name#</b> </cfif></font></font></td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<INPUT  onBlur="AddUp();" type="text" NAME="a_1106_a" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1106_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<INPUT  onBlur="AddUp();" type="text" NAME="a_1106_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1106_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1107. Attorney's Fees </font></font></td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<INPUT  onBlur="AddUp();" type="text" NAME="a_1107_a" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1107_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<INPUT  onBlur="AddUp();" type="text" NAME="a_1107_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1107_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
    </tr>
    <tr >
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(includes above items No.&nbsp;&nbsp;<font color=blue>
        <b><INPUT  onBlur="AddUp();" type="text" NAME="a_1107_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1107_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >)</td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
    </tr>
    <tr >
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1108. Title Insurance
	   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to
        <font color=blue> <cfif #read_data2.a_1108_a# neq "0" OR #read_data2.a_1108_b# neq ""><b>First Title/#get_ins.company#</b> </cfif></font></font></td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<INPUT  onBlur="AddUp();" type="text" NAME="a_1108_a" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1108_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<INPUT  onBlur="AddUp();" type="text" NAME="a_1108_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1108_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
    </tr>
    <tr >
      <td > <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(includes above items No.&nbsp;&nbsp;<INPUT  onBlur="AddUp();" type="text" NAME="a_1108_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1108_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >)</td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
    </tr>
    <tr >
      <td > <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1109. Lender's Coverage $ <font color=blue>
        <INPUT  onBlur="AddUp();" type="text" NAME="a_1109_a" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1109_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<cfif #read_data.a_206_b# neq "">#read_data2.first_ins_premium#(1st) + #read_data2.second_ins_premium#(2nd)</cfif>
        </font></font></font> </td>
      <td rowspan="2" align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
      <td rowspan="2" align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
    </tr>
    <tr >
      <td > <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1110. Owner's Coverage $ <font color=blue>
        <INPUT  onBlur="AddUp();" type="text" NAME="a_1110_a" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1110_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" > </td>
    </tr>
    <tr>
      <td ><font size="1" face="Arial, Helvetica, sans-serif">1111. <font color=blue>
                <cfif #get_titleid.pstate# eq "NV" or #get_titleid.pstate# eq "CA">
				Delivery
				<cfelse> <cfif #read_data2.a_1111_c# neq "">
	  <INPUT  onBlur="AddUp();" type="text" NAME="a_1111_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1111_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
							<cfelseif #get_line_costs.a_1111_text# neq "">
							<INPUT  onBlur="AddUp();" type="text" NAME="a_1111_c" SIZE=10 MAXLENGTH=199
							VALUE="#get_line_costs.a_1111_text#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
							<cfelse>
							<INPUT  onBlur="AddUp();" type="text" NAME="a_1111_c" SIZE=10 MAXLENGTH=199
							VALUE=""
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
							</cfif></cfif> <cfif #read_data2.a_1111_a# neq "0" OR #read_data2.a_1111_b# neq "">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>#read_agency.title_ft_agency_name#</b>
        </font></font></cfif></td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<INPUT  onBlur="AddUp();" type="text" NAME="a_1111_a" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1111_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<INPUT  onBlur="AddUp();" type="text" NAME="a_1111_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1111_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
    </tr>
    <tr >
      <td > <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1112. <font color=blue> <INPUT  onBlur="AddUp();" type="text" NAME="a_1112_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1112_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" > <cfif #read_data2.a_1112_a# neq "0" OR #read_data2.a_1112_b# neq ""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>#read_agency.title_ft_agency_name#</b>
        </font></font></font></cfif> </td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<INPUT  onBlur="AddUp();" type="text" NAME="a_1112_a" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1112_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
      <td align="right" ><INPUT  onBlur="AddUp();" type="text" NAME="a_1112_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1112_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
    </tr>
    <tr >
      <td > <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1113. <font color=blue> <INPUT  onBlur="AddUp();" type="text" NAME="a_1113_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1113_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ><cfif #read_data2.a_1113_a# neq "0" OR #read_data2.a_1113_b# neq "">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>#read_agency.title_ft_agency_name#</b>
        </font></font></font></cfif></td>
      <td align="right" ><INPUT  onBlur="AddUp();" type="text" NAME="a_1113_a" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1113_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<INPUT  onBlur="AddUp();" type="text" NAME="a_1113_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1113_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
    </tr>
	<tr >
      <td > <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1114. <font color=blue> <INPUT  onBlur="AddUp();" type="text" NAME="a_1114_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1114_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ><cfif #read_data2.a_1114_a# neq "0" AND #read_data2.a_1114_b# neq "">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>#read_agency.title_ft_agency_name#</b>
        </font></font></font></cfif></td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<INPUT  onBlur="AddUp();" type="text" NAME="a_1114_a" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1114_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<INPUT  onBlur="AddUp();" type="text" NAME="a_1114_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1114_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
    </tr>
    <tr >
      <td colspan="3"> <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1200. GOVERNMENT RECORDING AND TRANSFER CHARGES </font></font></td>
    </tr>
    <tr >
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1201. Recording Fees Deed $ &nbsp;&nbsp;<font color=blue>
        <INPUT  onBlur="AddUp();" type="text" NAME="a_1201_a" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1201_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >&nbsp;&nbsp; Mortgage $ &nbsp;&nbsp;<font color=blue>
        <INPUT  onBlur="AddUp();" type="text" NAME="a_1201_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1201_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >&nbsp;&nbsp;&nbsp;: Release $ <font color=blue>
       <INPUT  onBlur="AddUp();" type="text" NAME="a_1201_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1201_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<INPUT  onBlur="AddUp();" type="text" NAME="a_1201_d" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1201_d#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<INPUT  onBlur="AddUp();" type="text" NAME="a_1201_e" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1201_e#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1202. City/County tax/Stamps: &nbsp;&nbsp;<INPUT  onBlur="AddUp();" type="text" NAME="a_1202_a" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1202_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >&nbsp;&nbsp;Deed $ &nbsp;&nbsp;<font color=blue>
        <INPUT  onBlur="AddUp();" type="text" NAME="a_1202_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1202_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >&nbsp;&nbsp;: Mortgage $ <font color=blue>
        <INPUT  onBlur="AddUp();" type="text" NAME="a_1202_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1202_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <INPUT  onBlur="AddUp();" type="text" NAME="a_1202_d" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1202_d#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <INPUT  onBlur="AddUp();" type="text" NAME="a_1202_e" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1202_e#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
        </font></font> </td>
    </tr>
    <tr >
      <td > <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1203. State tax/Stamps: &nbsp;&nbsp;<INPUT  onBlur="AddUp();" type="text" NAME="a_1203_a" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1203_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >&nbsp;&nbsp;Deed $ &nbsp;&nbsp;<font color=blue>
        <INPUT  onBlur="AddUp();" type="text" NAME="a_1203_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1203_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >&nbsp;&nbsp;: Mortgage $ <font color=blue>
        <INPUT  onBlur="AddUp();" type="text" NAME="a_1203_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1203_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <INPUT  onBlur="AddUp();" type="text" NAME="a_1203_d" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1203_d#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
       <INPUT  onBlur="AddUp();" type="text" NAME="a_1203_e" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1203_e#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
        </font></font> </td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1204. <font color=blue>

         <INPUT  onBlur="AddUp();" type="text" NAME="a_1204_a" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1204_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<INPUT  onBlur="AddUp();" type="text" NAME="a_1204_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1204_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <INPUT  onBlur="AddUp();" type="text" NAME="a_1204_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1204_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
        </font></font> </td>
    </tr>
    <tr >
      <td > <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1205. <font color=blue>  <cfif #get_titleid.pstate# eq "NV" or #get_titleid.pstate# eq "CA">Procurement Releases<cfelse>#get_line_costs.a_1205_text#</cfif><cfif #read_data2.a_1205_a# neq "0" OR #read_data2.a_1205_b# neq "">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <b>#read_agency.title_ft_agency_name#</b> </font></font></font> </cfif></td>
      <td align="right" ><INPUT  onBlur="AddUp();" type="text" NAME="a_1205_a" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1205_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
      <INPUT  onBlur="AddUp();" type="text" NAME="a_1205_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1205_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
        </font></font> </td>
    </tr>
    <tr>
      <td colspan=3 > <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1300. ADDITIONAL SETTLEMENT CHARGES </font></font></td>
    </tr>
    <tr >
      <td ><font size="1" face="Arial, Helvetica, sans-serif">1301. <cfif #read_data2.a_1301_text# neq "">
	  <INPUT  type="text" NAME="a_1301_text" SIZE=60 MAXLENGTH=199
							VALUE="#read_data2.a_1301_text#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none; text-align:left;" >
							<cfelse>
							<INPUT   type="text" NAME="a_1301_text" SIZE=60 MAXLENGTH=199
							VALUE="Survey"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none; text-align:left;" >
							</cfif> </font></td>
      <td align="right" >&nbsp;<font color=blue size="1" face="Arial, Helvetica, sans-serif">
        <INPUT  onBlur="AddUp();" type="text" NAME="a_1301_a" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1301_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
      <td align="right" >&nbsp;<font color=blue size="1" face="Arial, Helvetica, sans-serif">
        <INPUT  onBlur="AddUp();" type="text" NAME="a_1301_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1301_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1302. <cfif #read_data2.a_1302_text# neq "">
	  <INPUT type="text" NAME="a_1302_text" SIZE=60 MAXLENGTH=199
							VALUE="#read_data2.a_1302_text#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none; text-align:left;" >
							<cfelse>
							<INPUT  type="text" NAME="a_1302_text" SIZE=60 MAXLENGTH=199
							VALUE="Pest Inspection"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none; text-align:left;" >
							</cfif> </font></font></td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <INPUT  onBlur="AddUp();" type="text" NAME="a_1302_a" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1302_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <INPUT  onBlur="AddUp();" type="text" NAME="a_1302_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1302_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
    </tr>
    <tr >
      <td ><font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1303. <font color=blue> <cfif #read_data2.a_1303_text# neq "">
	  <INPUT  type="text" NAME="a_1303_text" SIZE=60 MAXLENGTH=199
							VALUE="#read_data2.a_1303_text#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none; text-align:left;" >
							<cfelseif #get_line_costs.a_1303_text# neq "">
							<INPUT type="text" NAME="a_1303_text" SIZE=60 MAXLENGTH=199
							VALUE="#get_line_costs.a_1303_text#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none; text-align:left;" >
							<cfelse>
							<INPUT 	type="text" NAME="a_1303_text" SIZE=60 MAXLENGTH=199
							VALUE=""
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none; text-align:left;" >
							</cfif>
							<cfif #read_data2.a_1303_a# neq "0" OR #read_data2.a_1303_b# neq "">&nbsp;&nbsp;&nbsp;<b>#read_agency.title_ft_agency_name#</b></font></font></font> </cfif></td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <INPUT  onBlur="AddUp();" type="text" NAME="a_1303_a" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1303_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" > </td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
       <INPUT  onBlur="AddUp();" type="text" NAME="a_1303_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1303_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" > </td>
    </tr>
    <tr >
      <td ><font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1304. <font color=blue> <cfif #read_data2.a_1304_text# neq "">
	  <INPUT type="text" NAME="a_1304_text" SIZE=60 MAXLENGTH=199
							VALUE="#read_data2.a_1304_text#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none; text-align:left;" >
							<cfelseif #get_line_costs.a_1304_text# neq "">
							<INPUT type="text" NAME="a_1304_text" SIZE=60 MAXLENGTH=199
							VALUE="#get_line_costs.a_1304_text#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none; text-align:left;" >
							<cfelse>
							<INPUT type="text" NAME="a_1304_text" SIZE=60 MAXLENGTH=199
							VALUE=""
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none; text-align:left;" >
							</cfif>
							<cfif #read_data2.a_1304_a# neq "0" OR #read_data2.a_1304_b# neq "">&nbsp;&nbsp;
        <b>#read_agency.title_ft_agency_name#</b></font></font></font> </cfif></td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <INPUT  onBlur="AddUp();" type="text" NAME="a_1304_a" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1304_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" > </td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
       <INPUT  onBlur="AddUp();" type="text" NAME="a_1304_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1304_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
    </tr>
    <tr>
      <td ><font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1305. <font color=blue><cfif #read_data2.a_1305_text# neq "">
	  <INPUT type="text" NAME="a_1305_text" SIZE=60 MAXLENGTH=199
							VALUE="#read_data2.a_1305_text#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none; text-align:left;" >
							<cfelseif #get_line_costs.a_1305_text# neq "">
							<INPUT type="text" NAME="a_1305_text" SIZE=60 MAXLENGTH=199
							VALUE="#get_line_costs.a_1305_text#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none; text-align:left;" >
							<cfelse>
							<INPUT type="text" NAME="a_1305_text" SIZE=60 MAXLENGTH=199
							VALUE=""
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none; text-align:left;" >
							</cfif>
							<cfif #read_data2.a_1305_a# neq "0" OR #read_data2.a_1305_b# neq "">&nbsp;&nbsp;<b>#read_agency.title_ft_agency_name#</b></font></font></font></cfif> </td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <INPUT  onBlur="AddUp();" type="text" NAME="a_1305_a" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1305_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
       <INPUT  onBlur="AddUp();" type="text" NAME="a_1305_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1305_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
    </tr>
    <tr>
      <td ><font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1306. <font color=blue> <INPUT  onBlur="AddUp();" type="text" NAME="a_1306_a" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1306_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <INPUT  onBlur="AddUp();" type="text" NAME="a_1306_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1306_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <INPUT  onBlur="AddUp();" type="text" NAME="a_1306_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1306_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
    </tr>
    <tr >
      <td ><font size="1" face="Arial, Helvetica, sans-serif">1307.
        <INPUT  onBlur="AddUp();" type="text" NAME="a_1307_a" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1307_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color="blue">
        <INPUT  onBlur="AddUp();" type="text" NAME="a_1307_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1307_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color="blue">
        <INPUT  onBlur="AddUp();" type="text" NAME="a_1307_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1307_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
    </tr>
    <tr >
      <td > <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1308. Subtotal from line 1520 </font></font></td>
      <td align="right" > <font size=1 color=blue face="Arial, Helvetica, sans-serif">
	  &nbsp;
	 <INPUT  onBlur="AddUp();" type="text" NAME="a_1308_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1308_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></b></font><font size="1" face="Arial, Helvetica, sans-serif">
        </font></td>
      <td align="right" ><INPUT  onBlur="AddUp();" type="text" NAME="a_1308_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1308_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: black;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
    </tr>
    <tr>
      <td><font size="1" face="Arial, Helvetica, sans-serif"><br><font size="1" face="Arial, Helvetica, sans-serif">
        <font color=black>1400. TOTAL SETTLEMENT CHARGES &nbsp;&nbsp;&nbsp;&nbsp;(enter
        on lines 103, Section J and 502 Section K) </font></font></td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif"><br>
        <font color=blue> <b>

		<INPUT onFocus=cant_edit(this) type="text" NAME="a_1400_a" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1400_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >


							</b></font></font> </td>
      <td align="right" ><INPUT onFocus=cant_edit(this) type="text" NAME="a_1400_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1400_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></td>
    </tr>
  </table>

  <table align="center" width="98%" cellspacing=0 cellpadding=0>
    <tr valign="center">
      <td align="center" valign="middle"><br><!--- <p>&nbsp;</p> ---> <strong><font size=1 face="Arial, Helvetica, sans-serif">
        HUD CERTIFICATION OF BUYER AND SELLER <br></font></strong></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 face="Arial, Helvetica, sans-serif">I
        have carefully reviewed the HUD-1 Settlement Statement and to the best
        of my knowledge and belief, it is a true and accurate statement of all
        reciepts and disbursements made on my account or by me in this transaction.
        I further certify that I have recieved a copy of the HUD-1 Settlement
        Statement. I agree to further adjustments in the event of any errors or
        omissions and indemnify and hold harmless Settlement Agent against any
        such error or omissions </font></td>
    </tr>
    <tr>
      <td> <table align="center" width="100%" cellspacing=0 cellpadding=0>
          <tr>
            <td valign="middle" height="50">
              ________________________________________</td>
            <td valign="middle" height="50">
              ________________________________________</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td> <table align="center" width="100%" cellspacing=0 cellpadding=0>
          <tr>
            <td valign="middle" height="35">
              ________________________________________</td>
          </tr>
        </table></td>
    </tr>
	    <tr> <td>&nbsp;</td></tr>
    <tr>
      <td> <table>
          <tr>
            <td width="62%" align=left valign=top> <font size=1 face="Arial, Helvetica, sans-serif">WARNING:
              IT IS A CRIME TO KNOWINGLY MAKE FALSE STATEMENTS TO THE UNITED
              STATES ON THIS OR ANY OTHER SIMILAR FORM. PENALTIES UPON CONVICTION
              CAN INCLUDE A FINE AND IMPRISONMENT. FOR DETAILS SEE; TITLE 18 U.S.
              CODE SECTION 1001 AND SECTION 1010.</font> </td>
            <td width="2%">&nbsp;</td>
            <td width="36%" align=left valign=top><font size="1" face="Arial, Helvetica, sans-serif">
              The HUD-1 Settlement Statement which I have prepared is a true and
              accurate account of this transaction. I have caused or will cause
              the funds to be dispersed in accordance with this statement.</font></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td valign=top> <table align="center" width="100%" cellspacing=0 cellpadding=0>
          <tr valign="bottom">
            <td width="45%"><font size="1" face="Arial, Helvetica, sans-serif"><br>
              First Title and Escrow, Inc. -- <font color="FF0000">Printed <b>
           <cfif #read_data2.print_date# neq ""> #read_data2.print_date# </cfif><!--- June 21, 2001 at 14:30 ---></b></font></font></td>
            <td width="40%" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">By:______________________________________<br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DATE </font></td>
            <td width="15%"><font size="1" face="Arial, Helvetica, sans-serif">REV.
              HUD-1 (3/86)</font></td>
          </tr>
        </table></td>
    </tr>
  </table>



  <!-------LAST PAGE ---->
  <p>&nbsp;</p>
<table border="0" cellspacing=0 cellpadding=0 align = "center" width="98%" bordercolordark="666666" bordercolorlight="666666" bordercolor="666666">
<tr><td colspan="3">
  <table align="center" width="100%" cellspacing=0 cellpadding=0>
          <tr>
            <td width="54%" align="left"> <b><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;U.S.
              DEPARTMET OF HOUSING AND URBAN DEVELOPMENT</font></b></td>
            <td  width="27%"><font face="Arial, Helvetica, sans-serif" size="1">File
              Number: <b>#read_data2.title_id#</b></font></td>
            <td  width="19%" align="right"><font size="1" face="Arial, Helvetica, sans-serif">PAGE
              3</font></td>
          </tr>
          <tr>
            <td width="54%" align="left"> <b><font face="Arial, Helvetica, sans-serif" size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SETTLEMENT
              STATEMENT</font></b></td>
            <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="1">TitleExpress
              Settlement System Printed 09/15/2005 at 17:13 SJP</font></td>
          </tr>
        </table>
</td>
</tr>

<tr><td colspan="3" valign="top">
<table border="1" cellspacing=0 cellpadding=0 align = "center" width="100%" bordercolordark="666666" bordercolorlight="666666" bordercolor="666666">
          <tr>
            <td colspan="3"><p>&nbsp;</p>
              <br></td>
          </tr>
          <tr>
            <td align="center" colspan="3"><font face="Arial, Helvetica, sans-serif"><strong>ITEMIZATION
              OF HUD LINE 1308</strong></font></td>
          </tr>
          <tr>
            <td colspan="3"><p>&nbsp;</p>
              <br></td>
          </tr>
          <tr>
            <td><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1500.
              SCHEDULE OF DISBURSEMENTS</font></strong></td>
            <td align="center"><strong><font size="2" face="Arial, Helvetica, sans-serif">BUYER</font></strong></td>
            <td align="center"><strong><font size="2" face="Arial, Helvetica, sans-serif">SELLER</font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1501.  <CFINPUT type="text" NAME="a_1501_a" SIZE=50 MAXLENGTH=199
							VALUE="#read_data2.a_1501_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
							</font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;
			<CFINPUT type="text" onBlur="AddUp();" NAME="a_1501_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1501_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;
			<CFINPUT type="text"   onBlur="AddUp();" NAME="a_1501_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1501_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1502. <CFINPUT type="text" NAME="a_1502_a" SIZE=50 MAXLENGTH=199
							VALUE="#read_data2.a_1502_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;
			<CFINPUT type="text" onBlur="AddUp();" NAME="a_1502_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1502_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;
			<CFINPUT type="text" onBlur="AddUp();"  NAME="a_1502_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1502_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1503.
			  <CFINPUT type="text" NAME="a_1503_a" SIZE=50 MAXLENGTH=199
							VALUE="#read_data2.a_1503_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;
			<CFINPUT type="text" onBlur="AddUp();" NAME="a_1503_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1503_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;
			<CFINPUT  onBlur="AddUp();" type="text" NAME="a_1503_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1503_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1504.
			  <CFINPUT type="text" NAME="a_1504_a" SIZE=50 MAXLENGTH=199
							VALUE="#read_data2.a_1504_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;
			<CFINPUT type="text" onBlur="AddUp();" NAME="a_1504_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1504_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;
			<CFINPUT  onBlur="AddUp();" type="text" NAME="a_1504_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1504_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1505.
			  <CFINPUT type="text" NAME="a_1505_a" SIZE=50 MAXLENGTH=199
							VALUE="#read_data2.a_1505_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;
			<CFINPUT type="text" onBlur="AddUp();" NAME="a_1505_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1505_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;
			<CFINPUT type="text"  onBlur="AddUp();" NAME="a_1505_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1505_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1506.
			  <CFINPUT type="text" NAME="a_1506_a" SIZE=50 MAXLENGTH=199
							VALUE="#read_data2.a_1506_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;
			<CFINPUT type="text" onBlur="AddUp();" NAME="a_1506_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1506_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;
			<CFINPUT onBlur="AddUp();"  type="text" NAME="a_1506_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1506_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1507.
			  <CFINPUT type="text" NAME="a_1507_a" SIZE=50 MAXLENGTH=199
							VALUE="#read_data2.a_1507_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;
			<CFINPUT type="text"  onBlur="AddUp();" NAME="a_1507_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1507_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;
			<CFINPUT  onBlur="AddUp();"  type="text" NAME="a_1507_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1507_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1508.
			  <CFINPUT type="text" NAME="a_1508_a" SIZE=50 MAXLENGTH=199
							VALUE="#read_data2.a_1508_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;
			<CFINPUT type="text"  onBlur="AddUp();"  NAME="a_1508_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1508_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;
			<CFINPUT  onBlur="AddUp();" type="text" NAME="a_1508_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1508_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1509.
			  <CFINPUT type="text" NAME="a_1509_a" SIZE=50 MAXLENGTH=199
							VALUE="#read_data2.a_1509_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;
			<CFINPUT type="text" onBlur="AddUp();" NAME="a_1509_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1509_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;
			<CFINPUT  onBlur="AddUp();" type="text" NAME="a_1509_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1509_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1510.
			  <CFINPUT type="text" NAME="a_1510_a" SIZE=50 MAXLENGTH=199
							VALUE="#read_data2.a_1510_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;
			<CFINPUT type="text" onBlur="AddUp();" NAME="a_1510_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1510_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;
			<CFINPUT onBlur="AddUp();"  type="text" NAME="a_1510_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1510_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1511.
			  <CFINPUT type="text" NAME="a_1511_a" SIZE=50 MAXLENGTH=199
							VALUE="#read_data2.a_1511_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;

							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;
			<CFINPUT type="text" onBlur="AddUp();" NAME="a_1511_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1511_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;
			<CFINPUT  onBlur="AddUp();" type="text" NAME="a_1511_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1511_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1512.
			  <CFINPUT type="text" NAME="a_1512_a" SIZE=50 MAXLENGTH=199
							VALUE="#read_data2.a_1512_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;
			<CFINPUT type="text" onBlur="AddUp();" NAME="a_1512_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1512_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;
			<CFINPUT onBlur="AddUp();"  type="text" NAME="a_1512_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1512_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1513.
			  <CFINPUT type="text" NAME="a_1513_a" SIZE=50 MAXLENGTH=199
							VALUE="#read_data2.a_1513_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;
			<CFINPUT type="text" onBlur="AddUp();" NAME="a_1513_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1513_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;
			<CFINPUT  onBlur="AddUp();" type="text" NAME="a_1513_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1513_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1514.
			  <CFINPUT type="text" NAME="a_1514_a" SIZE=50 MAXLENGTH=199
							VALUE="#read_data2.a_1514_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;
			<CFINPUT type="text" onBlur="AddUp();" NAME="a_1514_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1514_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;
			<CFINPUT onBlur="AddUp();"  type="text" NAME="a_1514_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1514_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1515.
			  <CFINPUT type="text" NAME="a_1515_a" SIZE=50 MAXLENGTH=199
							VALUE="#read_data2.a_1515_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;
			<CFINPUT type="text" onBlur="AddUp();" NAME="a_1515_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1515_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;
			<CFINPUT onBlur="AddUp();"  type="text" NAME="a_1515_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1515_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1516.
			  <CFINPUT type="text" NAME="a_1516_a" SIZE=50 MAXLENGTH=199
							VALUE="#read_data2.a_1516_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;
			<CFINPUT type="text" onBlur="AddUp();" NAME="a_1516_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1516_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;
			<CFINPUT  onBlur="AddUp();" type="text" NAME="a_1516_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1516_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1517.
			  <CFINPUT type="text" NAME="a_1517_a" SIZE=50 MAXLENGTH=199
							VALUE="#read_data2.a_1517_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;
			<CFINPUT type="text" onBlur="AddUp();"  NAME="a_1517_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1517_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;
			<CFINPUT onBlur="AddUp();"  type="text" NAME="a_1517_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1517_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1518.
			  <CFINPUT type="text" NAME="a_1518_a" SIZE=50 MAXLENGTH=199
							VALUE="#read_data2.a_1518_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;
			<CFINPUT type="text" onBlur="AddUp();" NAME="a_1518_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1518_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;
			<CFINPUT onBlur="AddUp();"  type="text" NAME="a_1518_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1518_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1519. <CFINPUT type="text" NAME="a_1519_a" SIZE=50 MAXLENGTH=199
							VALUE="#read_data2.a_1519_a#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;
			<CFINPUT type="text" onBlur="AddUp();" NAME="a_1519_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1519_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;

							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;
			<CFINPUT  onBlur="AddUp();" type="text" NAME="a_1519_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1519_c#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></strong></td>
          </tr>
		  <tr>
            <td><p>&nbsp;</p><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1520.
              TOTAL HUD LINE 1308 EXPENSE:
			  <!--- <CFINPUT type="text" NAME="a_1520" SIZE=50 MAXLENGTH=199
							VALUE=""
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" > ---></font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;
			<cfif #read_data2.a_1520# neq "">
			<INPUT onFocus=cant_edit(this) type="text" NAME="a_1520" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1520#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
							<cfelse>
							<INPUT onFocus=cant_edit(this) type="text" NAME="a_1520" SIZE=10 MAXLENGTH=199
							VALUE="0"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
							</cfif></font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;
			<INPUT onFocus=cant_edit(this) NAME="a_1520_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1520_b#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: white;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" ></font></strong></td>
          </tr>
		  	<INPUT TYPE=HIDDEN NAME="temp" VALUE="A">
							<INPUT TYPE=HIDDEN NAME="temp1" VALUE="A">
							<INPUT TYPE=HIDDEN NAME="temp2" VALUE="A">
							<INPUT TYPE=HIDDEN NAME="temp3" VALUE="A">
							<INPUT TYPE=HIDDEN NAME="temp4" VALUE="A">
							<INPUT TYPE=HIDDEN NAME="temp5" VALUE="A">
							<INPUT TYPE=HIDDEN NAME="temp6" VALUE="A">
							<INPUT TYPE=HIDDEN NAME="temp7" VALUE="A">
							<INPUT TYPE=HIDDEN NAME="temp8" VALUE="A">
							<INPUT TYPE=HIDDEN NAME="temp9" VALUE="A">
							<INPUT TYPE=HIDDEN NAME="temp10" VALUE="A">
							<INPUT TYPE=HIDDEN NAME="temp11" VALUE="A">
							<INPUT TYPE=HIDDEN NAME="temp12" VALUE="A">
							<INPUT TYPE=HIDDEN NAME="temp104" VALUE="A">
							<INPUT TYPE=HIDDEN NAME="temp105" VALUE="A">
							<INPUT TYPE=HIDDEN NAME="temp106" VALUE="A">
							<INPUT TYPE=HIDDEN NAME="temp107" VALUE="A">
							<INPUT TYPE=HIDDEN NAME="temp108" VALUE="A">
							<INPUT TYPE=HIDDEN NAME="temp13" VALUE="A">
							<INPUT TYPE=HIDDEN NAME="temp14" VALUE="A">
							<INPUT TYPE=HIDDEN NAME="temp15" VALUE="A">
							<INPUT TYPE=HIDDEN NAME="temp16" VALUE="A">
							<INPUT TYPE=HIDDEN NAME="temp17" VALUE="A">
							<INPUT TYPE=HIDDEN NAME="temp18" VALUE="A">
							<INPUT TYPE=HIDDEN NAME="temp19" VALUE="A">
							<INPUT TYPE=HIDDEN NAME="temp20" VALUE="A">
							<INPUT TYPE=HIDDEN NAME="temp21" VALUE="A">
							<INPUT TYPE=HIDDEN NAME="temp22" VALUE="A">
							<INPUT TYPE=HIDDEN NAME="temp23" VALUE="A">
							<INPUT TYPE=HIDDEN NAME="temp24" VALUE="A">
							<INPUT TYPE=HIDDEN NAME="temp25" VALUE="A">
							<INPUT TYPE=HIDDEN NAME="temp26" VALUE="A">
							<INPUT TYPE=HIDDEN NAME="temp27" VALUE="A">
							<INPUT TYPE=HIDDEN NAME="temp28" VALUE="A">
							<INPUT TYPE=HIDDEN NAME="temp29" VALUE="A">
							<INPUT TYPE=HIDDEN NAME="temp30" VALUE="A">
							<INPUT TYPE=HIDDEN NAME="temp31" VALUE="A">
							<INPUT TYPE=HIDDEN NAME="temp1006" VALUE="A">
							<INPUT TYPE=HIDDEN NAME="temp1601" VALUE="A">
							<cfif #read_data2.a_803_b# eq "">
							<INPUT TYPE=HIDDEN NAME="a_803_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_803_val" VALUE="#read_data2.a_803_b#">
							</cfif>
							<cfif #read_data2.a_804_b# eq "">
							<INPUT TYPE=HIDDEN NAME="a_804_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_804_val" VALUE="#read_data2.a_804_b#">
							</cfif>
							<cfif #read_data2.a_805_b# eq "">
							<INPUT TYPE=HIDDEN NAME="a_805_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_805_val" VALUE="#read_data2.a_805_b#">
							</cfif>
							<cfif #read_data2.a_806_b# eq "">
							<INPUT TYPE=HIDDEN NAME="a_806_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_806_val" VALUE="#read_data2.a_806_b#">
							</cfif>
							<cfif #read_data2.a_807_b# eq "">
							<INPUT TYPE=HIDDEN NAME="a_807_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_807_val" VALUE="#read_data2.a_807_b#">
							</cfif>
							<cfif #read_data2.a_808_b# eq "">
							<INPUT TYPE=HIDDEN NAME="a_808_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_808_val" VALUE="#read_data2.a_808_b#">
							</cfif>
							<cfif #read_data2.a_809_b# eq "">
							<INPUT TYPE=HIDDEN NAME="a_809_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_809_val" VALUE="#read_data2.a_809_b#">
							</cfif>
							<cfif #read_data2.a_810_b# eq "">
							<INPUT TYPE=HIDDEN NAME="a_810_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_810_val" VALUE="#read_data2.a_810_b#">
							</cfif>
							<cfif #read_data2.a_811_b# eq "">
							<INPUT TYPE=HIDDEN NAME="a_811_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_811_val" VALUE="#read_data2.a_811_b#">
							</cfif>
								<cfif #read_data2.a_902_c# eq "">
							<INPUT TYPE=HIDDEN NAME="a_902_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_902_val" VALUE="#read_data2.a_902_c#">
							</cfif>
							<cfif #read_data2.a_903_c# eq "">
							<INPUT TYPE=HIDDEN NAME="a_903_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_903_val" VALUE="#read_data2.a_903_c#">
							</cfif>
								<cfif #read_data2.a_904_b# eq "">
							<INPUT TYPE=HIDDEN NAME="a_904_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_904_val" VALUE="#read_data2.a_904_b#">
							</cfif>
							<cfif #read_data2.a_905_a# eq "">
							<INPUT TYPE=HIDDEN NAME="a_905_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_905_val" VALUE="#read_data2.a_905_a#">
							</cfif>
							<cfif #read_data2.a_1006_a# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1006_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1006_val" VALUE="#read_data2.a_1006_a#">
							</cfif>
							<cfif #read_data.a_104_b# eq "">
							<INPUT TYPE=HIDDEN NAME="a_104_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_104_val" VALUE="#read_data.a_104_b#">
							</cfif>

							<cfif #read_data.a_105_b# eq "">
							<INPUT TYPE=HIDDEN NAME="a_105_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_105_val" VALUE="#read_data.a_105_b#">
							</cfif>

							<cfif #read_data.a_106# eq "">
							<INPUT TYPE=HIDDEN NAME="a_106_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_106_val" VALUE="#read_data.a_106#">
							</cfif>

							<cfif #read_data.a_107# eq "">
							<INPUT TYPE=HIDDEN NAME="a_107_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_107_val" VALUE="#read_data.a_107#">
							</cfif>

							<cfif #read_data.a_108# eq "">
							<INPUT TYPE=HIDDEN NAME="a_108_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_108_val" VALUE="#read_data.a_108#">
							</cfif>


							<cfif #read_data2.a_1101_a# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1101_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1101_val" VALUE="#read_data2.a_1101_a#">
							</cfif>
							<cfif #read_data2.a_1102_a# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1102_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1102_val" VALUE="#read_data2.a_1102_a#">
							</cfif>
							<cfif #read_data2.a_1103_a# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1103_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1103_val" VALUE="#read_data2.a_1103_a#">
							</cfif>
							<cfif #read_data2.a_1104_a# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1104_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1104_val" VALUE="#read_data2.a_1104_a#">
							</cfif>
							<cfif #read_data2.a_1105_a# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1105_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1105_val" VALUE="#read_data2.a_1105_a#">
							</cfif>
							<cfif #read_data2.a_1106_a# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1106_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1106_val" VALUE="#read_data2.a_1106_a#">
							</cfif>
							<cfif #read_data2.a_1107_a# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1107_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1107_val" VALUE="#read_data2.a_1107_a#">
							</cfif>
							<cfif #read_data2.a_1108_a# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1108_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1108_val" VALUE="#read_data2.a_1108_a#">
							</cfif>
							<cfif #read_data2.a_1109_a# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1109_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1109_val" VALUE="#read_data2.a_1109_a#">
							</cfif>
							<cfif #read_data2.a_1110_a# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1110_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1110_val" VALUE="#read_data2.a_1110_a#">
							</cfif>
							<cfif #read_data2.a_1111_a# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1111_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1111_val" VALUE="#read_data2.a_1111_a#">
							</cfif>
							<cfif #read_data2.a_1112_a# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1112_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1112_val" VALUE="#read_data2.a_1112_a#">
							</cfif>
							<cfif #read_data2.a_1113_a# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1113_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1113_val" VALUE="#read_data2.a_1113_a#">
							</cfif>
							<cfif #read_data2.a_1114_a# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1114_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1114_val" VALUE="#read_data2.a_1114_a#">
							</cfif>



							<cfif #read_data2.a_1201_d# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1201_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1201_val" VALUE="#read_data2.a_1201_d#">
							</cfif>



							<cfif #read_data2.a_1201_a# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1201_a_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1201_a_val" VALUE="#read_data2.a_1201_a#">
							</cfif>
							<cfif #read_data2.a_1201_b# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1201_b_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1201_b_val" VALUE="#read_data2.a_1201_b#">
							</cfif>
							<cfif #read_data2.a_1201_c# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1201_c_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1201_c_val" VALUE="#read_data2.a_1201_c#">
							</cfif>



							<cfif #read_data2.a_1202_d# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1202_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1202_val" VALUE="#read_data2.a_1202_d#">
							</cfif>



							<cfif #read_data2.a_1202_a# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1202_a_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1202_a_val" VALUE="#read_data2.a_1202_a#">
							</cfif>
							<cfif #read_data2.a_1202_b# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1202_b_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1202_b_val" VALUE="#read_data2.a_1202_b#">
							</cfif>
							<cfif #read_data2.a_1202_c# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1202_c_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1202_c_val" VALUE="#read_data2.a_1202_c#">
							</cfif>

							<cfif #read_data2.a_1203_d# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1203_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1203_val" VALUE="#read_data2.a_1203_d#">
							</cfif>




							<cfif #read_data2.a_1203_a# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1203_a_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1203_a_val" VALUE="#read_data2.a_1203_a#">
							</cfif>
							<cfif #read_data2.a_1203_b# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1203_b_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1203_b_val" VALUE="#read_data2.a_1203_b#">
							</cfif>
							<cfif #read_data2.a_1203_c# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1203_c_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1203_c_val" VALUE="#read_data2.a_1203_c#">
							</cfif>



							<cfif #read_data2.a_1204_b# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1204_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1204_val" VALUE="#read_data2.a_1204_b#">
							</cfif>

							<cfif #read_data2.a_1205_a# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1205_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1205_val" VALUE="#read_data2.a_1205_a#">
							</cfif>




							<cfif #read_data2.a_1301_a# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1301_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1301_val" VALUE="#read_data2.a_1301_a#">
							</cfif>
							<cfif #read_data2.a_1302_a# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1302_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1302_val" VALUE="#read_data2.a_1302_a#">
							</cfif>
							<cfif #read_data2.a_1303_a# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1303_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1303_val" VALUE="#read_data2.a_1303_a#">
							</cfif>
							<cfif #read_data2.a_1304_a# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1304_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1304_val" VALUE="#read_data2.a_1304_a#">
							</cfif>
							<cfif #read_data2.a_1305_a# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1305_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1305_val" VALUE="#read_data2.a_1305_a#">
							</cfif>
							<cfif #read_data2.a_1306_b# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1306_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1306_val" VALUE="#read_data2.a_1306_b#">
							</cfif>
							<cfif #read_data2.a_1307_b# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1307_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1307_val" VALUE="#read_data2.a_1307_b#">
							</cfif>


							<cfif #read_data2.a_1501_b# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1501_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1501_val" VALUE="#read_data2.a_1501_b#">
							</cfif>
							<cfif #read_data2.a_1502_b# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1502_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1502_val" VALUE="#read_data2.a_1502_b#">
							</cfif>
							<cfif #read_data2.a_1503_b# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1503_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1503_val" VALUE="#read_data2.a_1503_b#">
							</cfif>
							<cfif #read_data2.a_1504_b# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1504_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1504_val" VALUE="#read_data2.a_1504_b#">
							</cfif>
							<cfif #read_data2.a_1505_b# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1505_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1505_val" VALUE="#read_data2.a_1505_b#">
							</cfif>
							<cfif #read_data2.a_1506_b# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1506_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1506_val" VALUE="#read_data2.a_1506_b#">
							</cfif>
							<cfif #read_data2.a_1507_b# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1507_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1507_val" VALUE="#read_data2.a_1507_b#">
							</cfif>
							<cfif #read_data2.a_1508_b# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1508_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1508_val" VALUE="#read_data2.a_1508_b#">
							</cfif>
							<cfif #read_data2.a_1509_b# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1509_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1509_val" VALUE="#read_data2.a_1509_b#">
							</cfif>
								<cfif #read_data2.a_1510_b# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1510_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1510_val" VALUE="#read_data2.a_1510_b#">
							</cfif>
							<cfif #read_data2.a_1511_b# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1511_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1511_val" VALUE="#read_data2.a_1511_b#">
							</cfif>
								<cfif #read_data2.a_1512_b# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1512_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1512_val" VALUE="#read_data2.a_1512_b#">
							</cfif>
								<cfif #read_data2.a_1513_a# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1513_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1513_val" VALUE="#read_data2.a_1513_a#">
							</cfif>

							<cfif #read_data2.a_1514_b# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1514_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1514_val" VALUE="#read_data2.a_1514_b#">
							</cfif>

								<cfif #read_data2.a_1515_b# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1515_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1515_val" VALUE="#read_data2.a_1515_b#">
							</cfif>

							<cfif #read_data2.a_1516_b# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1516_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1516_val" VALUE="#read_data2.a_1516_b#">
							</cfif>
							<cfif #read_data2.a_1517_b# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1517_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1517_val" VALUE="#read_data2.a_1517_b#">
							</cfif>
							<cfif #read_data2.a_1518_b# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1518_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1518_val" VALUE="#read_data2.a_1518_b#">
							</cfif>
							<cfif #read_data2.a_1519_b# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1519_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1519_val" VALUE="#read_data2.a_1519_b#">
							</cfif>
							<cfif #read_data.a_1601# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1601_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1601_val" VALUE="#read_data.a_1601#">
							</cfif>

        </table>
</td></tr></table>
  <table align="center" width="98%" cellspacing=0 cellpadding=0 border = 1><tr><td width = "98%" bgcolor = "yellow" align = center>
 <NOBR><font size="3" color = "blue" face="Arial, Helvetica, sans-serif"><b>Click &nbsp;<input type=image border=0 src="./images/button_submit.gif">&nbsp; to save changes</b></font>&nbsp;&nbsp;&nbsp;&nbsp;</NOBR></td></tr>
<INPUT TYPE=HIDDEN NAME="loan" VALUE="#get_titleid.loanamt_float#">
<INPUT TYPE=HIDDEN NAME="user_id_1" VALUE="">

</cfform>
</CFOUTPUT>

<script type="text/javascript">



  var _gaq = _gaq || [];

  _gaq.push(['_setAccount', 'UA-195021-17']);

  _gaq.push(['_trackPageview']);



  (function() {

    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;

    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'https://www') + '.google-analytics.com/ga.js';

    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);

  })();



</script>

</body>
</html>
