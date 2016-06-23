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


function isNumeric(str)
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

function addCheck(form) {
 if (document.frm.a_801_a.value != '') {
if (!isNumeric(document.frm.a_801_a.value)) {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_801_a.focus();
      return false;
 } }


  if (document.frm.a_801_a.value != '') {

if (document.frm.a_801_b.value == '') {
document.frm.a_801_b.value = (document.frm.a_801_a.value * document.frm.loan.value)/100;
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_801_b.value), 2);
}else {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.a_801_b.value), 2);
document.frm.a_801_b.value = (document.frm.a_801_a.value * document.frm.loan.value)/100;
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_801_b.value), 2);
}

document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

} else if ((document.frm.a_801_a.value == '')&&(document.frm.a_801_b.value != '')) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.a_801_b.value), 2);
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.a_801_b.value = '';
 }
 }

 function addCheck801(form) {
 if (document.frm.a_801_g.value != '') {
if (!isNumeric(document.frm.a_801_g.value)) {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_801_g.focus();
      return false;
 } }


  if (document.frm.a_801_g.value != '') {

if (document.frm.a_801_b.value == '') {
document.frm.a_801_b.value = document.frm.a_801_g.value;
document.frm.a_801_a.value = '';
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_801_b.value), 2);
}else {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.a_801_b.value), 2);
document.frm.a_801_b.value = document.frm.a_801_g.value;
document.frm.a_801_a.value = '';
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_801_b.value), 2);
}
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

} else if ((document.frm.a_801_g.value == '')&&(document.frm.a_801_b.value != '')) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.a_801_b.value), 2);
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);
document.frm.a_801_b.value = '';
document.frm.a_801_a.value = '';
 }
 }

 function addCheck2(form) {
 if (document.frm.a_802_a.value != '') {
if (!isNumeric(document.frm.a_802_a.value)) {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_802_a.focus();
      return false;
 } }



 if (document.frm.a_802_a.value != '') {
 if (document.frm.a_802_b.value == '') {
document.frm.a_802_b.value = (document.frm.a_802_a.value * document.frm.loan.value)/100;
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_802_b.value), 2);
}else {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.a_802_b.value), 2);
document.frm.a_802_b.value = (document.frm.a_802_a.value * document.frm.loan.value)/100;
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_802_b.value), 2);
}
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);
}
else if ((document.frm.a_802_a.value == '')&&(document.frm.a_802_b.value != '')) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.a_802_b.value), 2);
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);
document.frm.a_802_b.value = '';
 }
}

 function addCheck802(form) {
 if (document.frm.a_802_g.value != '') {
if (!isNumeric(document.frm.a_802_g.value)) {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_802_g.focus();
      return false;
 } }


  if (document.frm.a_802_g.value != '') {

if (document.frm.a_802_b.value == '') {
document.frm.a_802_b.value = document.frm.a_802_g.value;
document.frm.a_802_a.value = '';
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_802_b.value), 2);
}else {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.a_802_b.value), 2);
document.frm.a_802_b.value = document.frm.a_802_g.value;
document.frm.a_802_a.value = '';
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_802_b.value), 2);
}
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);
} else if ((document.frm.a_802_g.value == '')&&(document.frm.a_802_b.value != '')) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.a_802_b.value), 2);
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.a_802_b.value = '';
document.frm.a_802_a.value = '';
 }
 }

function addCheck8(form) {

 if (document.frm.a_803_b.value != '') {
if (!isNumeric(document.frm.a_803_b.value)) {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_803_b.focus();
      return false;
 } }


if (document.frm.a_803_b.value != '') {
if (document.frm.temp.value == 'A') {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.a_803_val.value), 2);
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_803_b.value), 2);
}else{
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.temp.value), 2);
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_803_b.value), 2);
}
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);
document.frm.temp.value = document.frm.a_803_b.value;
} else if ((document.frm.a_803_b.value == '')&&(document.frm.temp.value == 'A')) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.a_803_val.value), 2);
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp.value = 0;
} else if ((document.frm.a_803_b.value == '')&&(document.frm.temp.value != 'A')) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.temp.value), 2);
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp.value = 0;
}
 }


 function addCheck9(form) {

 if (document.frm.a_804_b.value != '') {
if (!isNumeric(document.frm.a_804_b.value)) {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_804_b.focus();
      return false;
 } }


if (document.frm.a_804_b.value != '') {
if (document.frm.temp1.value == 'A') {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.a_804_val.value), 2);
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_804_b.value), 2);
}else{
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.temp1.value), 2);
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_804_b.value), 2);
}
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp1.value = document.frm.a_804_b.value;
} else if ((document.frm.a_804_b.value == '')&&(document.frm.temp1.value == 'A')) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.a_804_val.value), 2);
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp1.value = 0;
} else if ((document.frm.a_804_b.value == '')&&(document.frm.temp1.value != 'A')) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.temp1.value), 2);
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp1.value = 0;
}
 }

function addCheck10(form) {

 if (document.frm.a_805_b.value != '') {
if (!isNumeric(document.frm.a_805_b.value)) {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_805_b.focus();
      return false;
 } }


if (document.frm.a_805_b.value != '') {
if (document.frm.temp2.value == 'A') {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.a_805_val.value), 2);
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_805_b.value), 2);
}else{
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.temp2.value), 2);
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_805_b.value), 2);
}

document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp2.value = document.frm.a_805_b.value;
 } else if ((document.frm.a_805_b.value == '')&&(document.frm.temp2.value == 'A')) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.a_805_val.value), 2);
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp2.value = 0;
} else if ((document.frm.a_805_b.value == '')&&(document.frm.temp2.value != 'A')) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.temp2.value), 2);
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp2.value = 0;
}
 }

function addCheck11(form) {

 if (document.frm.a_806_b.value != '') {
if (!isNumeric(document.frm.a_806_b.value)) {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_806_b.focus();
      return false;
 } }


if (document.frm.a_806_b.value != '') {
if (document.frm.temp3.value == 'A') {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.a_806_val.value), 2);
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_806_b.value), 2);
}else{
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.temp3.value), 2);
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_806_b.value), 2);
}
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp3.value = document.frm.a_806_b.value;
  } else if ((document.frm.a_806_b.value == '')&&(document.frm.temp3.value == 'A')) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.a_806_val.value), 2);
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp3.value = 0;
} else if ((document.frm.a_806_b.value == '')&&(document.frm.temp3.value != 'A')) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.temp3.value), 2);
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp3.value = 0;
}
 }

 function addCheck12(form) {

 if (document.frm.a_807_b.value != '') {
if (!isNumeric(document.frm.a_807_b.value)) {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_807_b.focus();
      return false;
 } }


if (document.frm.a_807_b.value != '') {
if (document.frm.temp4.value == 'A') {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.a_807_val.value), 2);
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_807_b.value), 2);
}else{
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.temp4.value), 2);
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_807_b.value), 2);
}
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp4.value = document.frm.a_807_b.value;

} else if ((document.frm.a_807_b.value == '')&&(document.frm.temp4.value == 'A')) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.a_807_val.value), 2);
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp4.value = 0;
} else if ((document.frm.a_807_b.value == '')&&(document.frm.temp4.value != 'A')) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.temp4.value), 2);
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp4.value = 0;
}
 }


 function addCheck13(form) {

 if (document.frm.a_808_b.value != '') {
if (!isNumeric(document.frm.a_808_b.value)) {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_808_b.focus();
      return false;
 } }


if (document.frm.a_808_b.value != '') {
if (document.frm.temp5.value == 'A') {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.a_808_val.value), 2);
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_808_b.value), 2);
}else{
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.temp5.value), 2);
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_808_b.value), 2);
}
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp5.value = document.frm.a_808_b.value;
   } else if ((document.frm.a_808_b.value == '')&&(document.frm.temp5.value == 'A')) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.a_808_val.value), 2);
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp5.value = 0;
} else if ((document.frm.a_808_b.value == '')&&(document.frm.temp5.value != 'A')) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.temp5.value), 2);
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp5.value = 0;
}
 }


 function addCheck14(form) {

 if (document.frm.a_809_b.value != '') {
if (!isNumeric(document.frm.a_809_b.value)) {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_809_b.focus();
      return false;
 } }


if (document.frm.a_809_b.value != '') {
if (document.frm.temp6.value == 'A') {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.a_809_val.value), 2);
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_809_b.value), 2);
}else{
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.temp6.value), 2);
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_809_b.value), 2);
}
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp6.value = document.frm.a_809_b.value;
   } else if ((document.frm.a_809_b.value == '')&&(document.frm.temp6.value == 'A')) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.a_809_val.value), 2);
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp6.value = 0;
} else if ((document.frm.a_809_b.value == '')&&(document.frm.temp6.value != 'A')) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.temp6.value), 2);
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp6.value = 0;
}
 }

 function addCheck15(form) {

 if (document.frm.a_810_b.value != '') {
if (!isNumeric(document.frm.a_810_b.value)) {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_810_b.focus();
      return false;
 } }


if (document.frm.a_810_b.value != '') {
if (document.frm.temp7.value == 'A') {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.a_810_val.value), 2);
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_810_b.value), 2);
}else{
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.temp7.value), 2);
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_810_b.value), 2);
}
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp7.value = document.frm.a_810_b.value;
  } else if ((document.frm.a_810_b.value == '')&&(document.frm.temp7.value == 'A')) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.a_810_val.value), 2);
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp7.value = 0;
} else if ((document.frm.a_810_b.value == '')&&(document.frm.temp7.value != 'A')) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.temp7.value), 2);
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp7.value = 0;
}
 }


 function addCheck16(form) {

 if (document.frm.a_811_b.value != '') {
if (!isNumeric(document.frm.a_811_b.value)) {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_811_b.focus();
      return false;
 } }


if (document.frm.a_811_b.value != '') {
if (document.frm.temp8.value == 'A') {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.a_811_val.value), 2);
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_811_b.value), 2);
}else{
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.temp8.value), 2);
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_811_b.value), 2);
}
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp8.value = document.frm.a_811_b.value;
  } else if ((document.frm.a_811_b.value == '')&&(document.frm.temp8.value == 'A')) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.a_811_val.value), 2);
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp8.value = 0;
} else if ((document.frm.a_811_b.value == '')&&(document.frm.temp8.value != 'A')) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.temp8.value), 2);
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp8.value = 0;
}
 }



 function addCheck17(form) {

 if (document.frm.a_902_c.value != '') {
if (!isNumeric(document.frm.a_902_c.value)) {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_902_c.focus();
      return false;
 } }


if (document.frm.a_902_c.value != '') {
if (document.frm.temp9.value == 'A') {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.a_902_val.value), 2);
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_902_c.value), 2);
}else{
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.temp9.value), 2);
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_902_c.value), 2);
}
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp9.value = document.frm.a_902_c.value;
   } else if ((document.frm.a_902_c.value == '')&&(document.frm.temp9.value == 'A')) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.a_902_val.value), 2);
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp9.value = 0;
} else if ((document.frm.a_902_c.value == '')&&(document.frm.temp9.value != 'A')) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.temp9.value), 2);
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp9.value = 0;
}
 }



 function addCheck18(form) {

 if (document.frm.a_903_c.value != '') {
if (!isNumeric(document.frm.a_903_c.value)) {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_903_c.focus();
      return false;
 } }


if (document.frm.a_903_c.value != '') {
if (document.frm.temp10.value == 'A') {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.a_903_val.value), 2);
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_903_c.value), 2);
}else{
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.temp10.value), 2);
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_903_c.value), 2);
}
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp10.value = document.frm.a_903_c.value;
    } else if ((document.frm.a_903_c.value == '')&&(document.frm.temp10.value == 'A')) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.a_903_val.value), 2);
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp10.value = 0;
} else if ((document.frm.a_903_c.value == '')&&(document.frm.temp10.value != 'A')) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.temp10.value), 2);
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp10.value = 0;
}
 }

function addCheck19(form) {

 if (document.frm.a_904_b.value != '') {
if (!isNumeric(document.frm.a_904_b.value)) {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_904_b.focus();
      return false;
 } }


if (document.frm.a_904_b.value != '') {
if (document.frm.temp11.value == 'A') {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.a_904_val.value), 2);
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_904_b.value), 2);
}else{
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.temp11.value), 2);
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_904_b.value), 2);
}

document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp11.value = document.frm.a_904_b.value;
    } else if ((document.frm.a_904_b.value == '')&&(document.frm.temp11.value == 'A')) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.a_904_val.value), 2);
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp11.value = 0;
} else if ((document.frm.a_904_b.value == '')&&(document.frm.temp11.value != 'A')) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.temp11.value), 2);
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp11.value = 0;
}
 }

function addCheck20(form) {

 if (document.frm.a_905_a.value != '') {
if (!isNumeric(document.frm.a_905_a.value)) {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_905_a.focus();
      return false;
 } }


if (document.frm.a_905_a.value != '') {
if (document.frm.temp12.value == 'A') {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.a_905_val.value), 2);
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_905_a.value), 2);
}else{
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.temp12.value), 2);
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_905_a.value), 2);
}

document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp12.value = document.frm.a_905_a.value;
    } else if ((document.frm.a_905_a.value == '')&&(document.frm.temp12.value == 'A')) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.a_905_val.value), 2);
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp12.value = 0;
} else if ((document.frm.a_905_a.value == '')&&(document.frm.temp12.value != 'A')) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.temp12.value), 2);
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp12.value = 0;
}
 }

 function addCheck1006(form) {

 if (document.frm.a_1006_a.value != '') {
if (!isNumeric(document.frm.a_1006_a.value)) {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_1006_a.focus();
      return false;
 } }


if (document.frm.a_1006_a.value != '') {
if (document.frm.temp1006.value == 'A') {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.a_1006_val.value), 2);
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_1006_a.value), 2);
}else{
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.temp1006.value), 2);
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_1006_a.value), 2);
}

document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp1006.value = document.frm.a_1006_a.value;
    } else if ((document.frm.a_1006_a.value == '')&&(document.frm.temp1006.value == 'A')) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.a_1006_val.value), 2);
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp1006.value = 0;
} else if ((document.frm.a_1006_a.value == '')&&(document.frm.temp1006.value != 'A')) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.temp1006.value), 2);
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp1006.value = 0;
}
 }

function addCheck3(form) {
 if (document.frm.a_1001_a.value != '') {
if (!isNumeric(document.frm.a_1001_a.value)) {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_1001_a.focus();
      return false;
 } }

 if (document.frm.a_1001_b.value != '') {
if (!isNumeric(document.frm.a_1001_b.value)) {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_1001_b.focus();
      return false;
 } }


if ((document.frm.a_1001_a.value != '') && (document.frm.a_1001_b.value != '')) {

if (document.frm.a_1001_c.value == '') {
document.frm.a_1001_c.value = document.frm.a_1001_a.value * document.frm.a_1001_b.value;
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_1001_c.value), 2);

}else {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.a_1001_c.value), 2);
document.frm.a_1001_c.value = document.frm.a_1001_a.value * document.frm.a_1001_b.value;
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_1001_c.value), 2);
}
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

}
else if (((document.frm.a_1001_a.value == '')||(document.frm.a_1001_b.value == ''))&&(document.frm.a_1001_c.value != '')) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.a_1001_c.value), 2);
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);
document.frm.a_1001_c.value = '';
 }
 }

 function addCheck4(form) {
 if (document.frm.a_1002_a.value != '') {
if (!isNumeric(document.frm.a_1002_a.value)) {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_1002_a.focus();
      return false;
 } }

 if (document.frm.a_1002_b.value != '') {
if (!isNumeric(document.frm.a_1002_b.value)) {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_1002_b.focus();
      return false;
 } }
  if ((document.frm.a_1002_a.value != '') && (document.frm.a_1002_b.value != '')) {
  if (document.frm.a_1002_c.value == '') {
document.frm.a_1002_c.value = document.frm.a_1002_a.value * document.frm.a_1002_b.value;
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_1002_c.value), 2);
} else {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.a_1002_c.value), 2);
document.frm.a_1002_c.value = document.frm.a_1002_a.value * document.frm.a_1002_b.value;
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_1002_c.value), 2);

}
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

}else if (((document.frm.a_1002_a.value == '')||(document.frm.a_1002_b.value == ''))&&(document.frm.a_1002_c.value != '')) {
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);
document.frm.a_1002_c.value = '';
 }
 }

  function addCheck5(form) {
 if (document.frm.a_1003_a.value != '') {
if (!isNumeric(document.frm.a_1003_a.value)) {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_1003_a.focus();
      return false;
 } }
 if (document.frm.a_1003_b.value != '') {
if (!isNumeric(document.frm.a_1003_b.value)) {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_1003_b.focus();
      return false;
 } }

  if ((document.frm.a_1003_a.value != '') && (document.frm.a_1003_b.value != '')) {
  if (document.frm.a_1003_c.value == '') {
document.frm.a_1003_c.value = document.frm.a_1003_a.value * document.frm.a_1003_b.value;
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_1003_c.value), 2);
} else {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.a_1003_c.value), 2);
document.frm.a_1003_c.value = document.frm.a_1003_a.value * document.frm.a_1003_b.value;
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_1003_c.value), 2);
}
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

}
else if (((document.frm.a_1003_a.value == '')||(document.frm.a_1003_b.value == ''))&&(document.frm.a_1003_c.value != '')) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.a_1003_c.value), 2);
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);
document.frm.a_1003_c.value = '';
 }
 }

  function addCheck6(form) {
 if (document.frm.a_1004_a.value != '') {
if (!isNumeric(document.frm.a_1004_a.value)) {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_1004_a.focus();
      return false;
 } }


 if (document.frm.a_1004_b.value != '') {
if (!isNumeric(document.frm.a_1004_b.value)) {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_1004_b.focus();
      return false;
 } }
  if ((document.frm.a_1004_a.value != '') && (document.frm.a_1004_b.value != '')) {
 if (document.frm.a_1004_c.value == '') {
document.frm.a_1004_c.value = document.frm.a_1004_a.value * document.frm.a_1004_b.value;
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_1004_c.value), 2);
} else {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.a_1004_c.value), 2);
document.frm.a_1004_c.value = document.frm.a_1004_a.value * document.frm.a_1004_b.value;
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_1004_c.value), 2);
}

document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);


}else if (((document.frm.a_1004_a.value == '')||(document.frm.a_1004_b.value == ''))&&(document.frm.a_1004_c.value != '')) {
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);
document.frm.a_1004_c.value = '';
 }
 }

  function addCheck7(form) {
 if (document.frm.a_1005_a.value != '') {
if (!isNumeric(document.frm.a_1005_a.value)) {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_1005_a.focus();
      return false;
 } }
 if (document.frm.a_1005_b.value != '') {
if (!isNumeric(document.frm.a_1005_b.value)) {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_1005_b.focus();
      return false;
 } }
  if ((document.frm.a_1005_a.value != '') && (document.frm.a_1005_b.value != '')) {

  if (document.frm.a_1005_c.value == '') {
document.frm.a_1005_c.value = document.frm.a_1005_a.value * document.frm.a_1005_b.value;
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_1005_c.value), 2);
} else {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.a_1005_c.value), 2);
document.frm.a_1005_c.value = document.frm.a_1005_a.value * document.frm.a_1005_b.value;
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_1005_c.value), 2);
}

document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

}else if (((document.frm.a_1005_a.value == '')||(document.frm.a_1005_b.value == ''))&&(document.frm.a_1005_c.value != '')) {
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);
document.frm.a_1005_c.value = '';

 }

 }

 function addCheck501(form) {

 if (document.frm.a_1501_b.value != '') {
if (!isNumeric(document.frm.a_1501_b.value)) {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_1501_b.focus();
      return false;
 } }


if (document.frm.a_1501_b.value != '') {
if (document.frm.temp13.value == 'A') {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.a_1501_val.value), 2);
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1501_b.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
}else{
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.temp13.value), 2);
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1501_b.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
}
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp13.value = document.frm.a_1501_b.value;
  } else if ((document.frm.a_1501_b.value == '')&&(document.frm.temp13.value == 'A')) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.a_1501_val.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp13.value = 0;
} else if ((document.frm.a_1501_b.value == '')&&(document.frm.temp13.value != 'A')) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.temp13.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp13.value = 0;
}
 }

    function addCheck502(form) {

 if (document.frm.a_1502_b.value != '') {
if (!isNumeric(document.frm.a_1502_b.value)) {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_1502_b.focus();
      return false;
 } }


if (document.frm.a_1502_b.value != '') {
if (document.frm.temp14.value == 'A') {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.a_1502_val.value), 2);
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1502_b.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
}else{
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.temp14.value), 2);
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1502_b.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
}
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp14.value = document.frm.a_1502_b.value;
  } else if ((document.frm.a_1502_b.value == '')&&(document.frm.temp14.value == 'A')) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.a_1502_val.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp14.value = 0;
} else if ((document.frm.a_1502_b.value == '')&&(document.frm.temp14.value != 'A')) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.temp14.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp14.value = 0;
}
 }

  function addCheck503(form) {

 if (document.frm.a_1503_b.value != '') {
if (!isNumeric(document.frm.a_1503_b.value)) {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_1503_b.focus();
      return false;
 } }


if (document.frm.a_1503_b.value != '') {
if (document.frm.temp15.value == 'A') {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.a_1503_val.value), 2);
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1503_b.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
}else{
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.temp15.value), 2);
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1503_b.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
}
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp15.value = document.frm.a_1503_b.value;
  } else if ((document.frm.a_1503_b.value == '')&&(document.frm.temp15.value == 'A')) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.a_1503_val.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp15.value = 0;
} else if ((document.frm.a_1503_b.value == '')&&(document.frm.temp15.value != 'A')) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.temp15.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp15.value = 0;
}
 }

 function addCheck504(form) {

 if (document.frm.a_1504_b.value != '') {
if (!isNumeric(document.frm.a_1504_b.value)) {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_1504_b.focus();
      return false;
 } }


if (document.frm.a_1504_b.value != '') {
if (document.frm.temp16.value == 'A') {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.a_1504_val.value), 2);
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1504_b.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
}else{
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.temp16.value), 2);
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1504_b.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
}
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp16.value = document.frm.a_1504_b.value;
  } else if ((document.frm.a_1504_b.value == '')&&(document.frm.temp16.value == 'A')) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.a_1504_val.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp16.value = 0;
} else if ((document.frm.a_1504_b.value == '')&&(document.frm.temp16.value != 'A')) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.temp16.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp16.value = 0;
}
 }


 function addCheck505(form) {

 if (document.frm.a_1505_b.value != '') {
if (!isNumeric(document.frm.a_1505_b.value)) {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_1505_b.focus();
      return false;
 } }


if (document.frm.a_1505_b.value != '') {
if (document.frm.temp17.value == 'A') {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.a_1505_val.value), 2);
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1505_b.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
}else{
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.temp17.value), 2);
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1505_b.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2)
}
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp17.value = document.frm.a_1505_b.value;
  } else if ((document.frm.a_1505_b.value == '')&&(document.frm.temp17.value == 'A')) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.a_1505_val.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp17.value = 0;
} else if ((document.frm.a_1505_b.value == '')&&(document.frm.temp17.value != 'A')) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.temp17.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp17.value = 0;
}
 }

 function addCheck506(form) {

 if (document.frm.a_1506_b.value != '') {
if (!isNumeric(document.frm.a_1506_b.value)) {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_1506_b.focus();
      return false;
 } }


if (document.frm.a_1506_b.value != '') {
if (document.frm.temp18.value == 'A') {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.a_1506_val.value), 2);
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1506_b.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
}else{
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.temp18.value), 2);
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1506_b.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
}
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp18.value = document.frm.a_1506_b.value;
  } else if ((document.frm.a_1506_b.value == '')&&(document.frm.temp18.value == 'A')) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.a_1506_val.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp18.value = 0;
} else if ((document.frm.a_1506_b.value == '')&&(document.frm.temp18.value != 'A')) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.temp18.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp18.value = 0;
}
 }

  function addCheck507(form) {

 if (document.frm.a_1507_b.value != '') {
if (!isNumeric(document.frm.a_1507_b.value)) {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_1507_b.focus();
      return false;
 } }


if (document.frm.a_1507_b.value != '') {
if (document.frm.temp19.value == 'A') {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.a_1507_val.value), 2);
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1507_b.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
}else{
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.temp19.value), 2);
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1507_b.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
}
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp19.value = document.frm.a_1507_b.value;
  } else if ((document.frm.a_1507_b.value == '')&&(document.frm.temp19.value == 'A')) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.a_1507_val.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp19.value = 0;
} else if ((document.frm.a_1507_b.value == '')&&(document.frm.temp19.value != 'A')) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.temp19.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp19.value = 0;
}
 }

  function addCheck508(form) {

 if (document.frm.a_1508_b.value != '') {
if (!isNumeric(document.frm.a_1508_b.value)) {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_1508_b.focus();
      return false;
 } }


if (document.frm.a_1508_b.value != '') {
if (document.frm.temp20.value == 'A') {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.a_1508_val.value), 2);
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1508_b.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
}else{
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.temp20.value), 2);
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1508_b.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
}
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp20.value = document.frm.a_1508_b.value;
  } else if ((document.frm.a_1508_b.value == '')&&(document.frm.temp20.value == 'A')) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.a_1508_val.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp20.value = 0;
} else if ((document.frm.a_1508_b.value == '')&&(document.frm.temp20.value != 'A')) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.temp20.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp20.value = 0;
}
 }

   function addCheck509(form) {

 if (document.frm.a_1509_b.value != '') {
if (!isNumeric(document.frm.a_1509_b.value)) {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_1509_b.focus();
      return false;
 } }


if (document.frm.a_1509_b.value != '') {
if (document.frm.temp21.value == 'A') {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.a_1509_val.value), 2);
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1509_b.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
}else{
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.temp21.value), 2);
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1509_b.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
}
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp21.value = document.frm.a_1509_b.value;
  } else if ((document.frm.a_1509_b.value == '')&&(document.frm.temp21.value == 'A')) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.a_1509_val.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp21.value = 0;
} else if ((document.frm.a_1509_b.value == '')&&(document.frm.temp21.value != 'A')) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.temp21.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp21.value = 0;
}
 }

  function addCheck510(form) {

 if (document.frm.a_1510_b.value != '') {
if (!isNumeric(document.frm.a_1510_b.value)) {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_1510_b.focus();
      return false;
 } }


if (document.frm.a_1510_b.value != '') {
if (document.frm.temp22.value == 'A') {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.a_1510_val.value), 2);
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1510_b.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
}else{
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.temp22.value), 2);
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1510_b.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
}
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp22.value = document.frm.a_1510_b.value;
  } else if ((document.frm.a_1510_b.value == '')&&(document.frm.temp22.value == 'A')) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.a_1510_val.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp22.value = 0;
} else if ((document.frm.a_1510_b.value == '')&&(document.frm.temp22.value != 'A')) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.temp22.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp22.value = 0;
}
 }

   function addCheck511(form) {

 if (document.frm.a_1511_b.value != '') {
if (!isNumeric(document.frm.a_1511_b.value)) {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_1511_b.focus();
      return false;
 } }


if (document.frm.a_1511_b.value != '') {
if (document.frm.temp23.value == 'A') {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.a_1511_val.value), 2);
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1511_b.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
}else{
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.temp23.value), 2);
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1511_b.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
}
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp23.value = document.frm.a_1511_b.value;
  } else if ((document.frm.a_1511_b.value == '')&&(document.frm.temp23.value == 'A')) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.a_1511_val.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp23.value = 0;
} else if ((document.frm.a_1511_b.value == '')&&(document.frm.temp23.value != 'A')) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.temp23.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp23.value = 0;
}
 }

  function addCheck512(form) {

 if (document.frm.a_1512_b.value != '') {
if (!isNumeric(document.frm.a_1512_b.value)) {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_1512_b.focus();
      return false;
 } }


if (document.frm.a_1512_b.value != '') {
if (document.frm.temp24.value == 'A') {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.a_1512_val.value), 2);
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1512_b.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
}else{
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.temp24.value), 2);
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1512_b.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
}
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp24.value = document.frm.a_1512_b.value;
  } else if ((document.frm.a_1512_b.value == '')&&(document.frm.temp24.value == 'A')) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.a_1512_val.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp24.value = 0;
} else if ((document.frm.a_1512_b.value == '')&&(document.frm.temp24.value != 'A')) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.temp24.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp24.value = 0;
}
 }

  function addCheck513(form) {

 if (document.frm.a_1513_b.value != '') {
if (!isNumeric(document.frm.a_1513_b.value)) {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_1513_b.focus();
      return false;
 } }


if (document.frm.a_1513_b.value != '') {
if (document.frm.temp25.value == 'A') {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.a_1513_val.value), 2);
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1513_b.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
}else{
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.temp25.value), 2);
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1513_b.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
}
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp25.value = document.frm.a_1513_b.value;
  } else if ((document.frm.a_1513_b.value == '')&&(document.frm.temp25.value == 'A')) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.a_1513_val.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp25.value = 0;
} else if ((document.frm.a_1513_b.value == '')&&(document.frm.temp25.value != 'A')) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.temp25.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp25.value = 0;
}
 }


  function addCheck514(form) {

 if (document.frm.a_1514_b.value != '') {
if (!isNumeric(document.frm.a_1514_b.value)) {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_1514_b.focus();
      return false;
 } }


if (document.frm.a_1514_b.value != '') {
if (document.frm.temp26.value == 'A') {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.a_1514_val.value), 2);
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1514_b.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
}else{
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.temp26.value), 2);
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1514_b.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
}
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp26.value = document.frm.a_1514_b.value;
  } else if ((document.frm.a_1514_b.value == '')&&(document.frm.temp26.value == 'A')) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.a_1514_val.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp26.value = 0;
} else if ((document.frm.a_1514_b.value == '')&&(document.frm.temp26.value != 'A')) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.temp26.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp26.value = 0;
}
 }

 function addCheck515(form) {

 if (document.frm.a_1515_b.value != '') {
if (!isNumeric(document.frm.a_1515_b.value)) {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_1515_b.focus();
      return false;
 } }


if (document.frm.a_1515_b.value != '') {
if (document.frm.temp27.value == 'A') {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.a_1515_val.value), 2);
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1515_b.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
}else{
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.temp27.value), 2);
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1515_b.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
}
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp27.value = document.frm.a_1515_b.value;
  } else if ((document.frm.a_1515_b.value == '')&&(document.frm.temp27.value == 'A')) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.a_1515_val.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp27.value = 0;
} else if ((document.frm.a_1515_b.value == '')&&(document.frm.temp27.value != 'A')) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.temp27.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp27.value = 0;
}
 }

 function addCheck516(form) {

 if (document.frm.a_1516_b.value != '') {
if (!isNumeric(document.frm.a_1516_b.value)) {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_1516_b.focus();
      return false;
 } }


if (document.frm.a_1516_b.value != '') {
if (document.frm.temp28.value == 'A') {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.a_1516_val.value), 2);
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1516_b.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
}else{
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.temp28.value), 2);
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1516_b.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
}
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp28.value = document.frm.a_1516_b.value;
  } else if ((document.frm.a_1516_b.value == '')&&(document.frm.temp28.value == 'A')) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.a_1516_val.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp28.value = 0;
} else if ((document.frm.a_1516_b.value == '')&&(document.frm.temp28.value != 'A')) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.temp28.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp28.value = 0;
}
 }

 function addCheck517(form) {

 if (document.frm.a_1517_b.value != '') {
if (!isNumeric(document.frm.a_1517_b.value)) {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_1517_b.focus();
      return false;
 } }


if (document.frm.a_1517_b.value != '') {
if (document.frm.temp29.value == 'A') {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.a_1517_val.value), 2);
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1517_b.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
}else{
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.temp29.value), 2);
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1517_b.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
}
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp29.value = document.frm.a_1517_b.value;
  } else if ((document.frm.a_1517_b.value == '')&&(document.frm.temp29.value == 'A')) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.a_1517_val.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp29.value = 0;
} else if ((document.frm.a_1517_b.value == '')&&(document.frm.temp29.value != 'A')) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.temp29.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp29.value = 0;
}
 }

 function addCheck518(form) {

 if (document.frm.a_1518_b.value != '') {
if (!isNumeric(document.frm.a_1518_b.value)) {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_1518_b.focus();
      return false;
 } }


if (document.frm.a_1518_b.value != '') {
if (document.frm.temp30.value == 'A') {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.a_1518_val.value), 2);
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1518_b.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
}else{
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.temp30.value), 2);
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1518_b.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
}
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp30.value = document.frm.a_1518_b.value;
  } else if ((document.frm.a_1518_b.value == '')&&(document.frm.temp30.value == 'A')) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.a_1518_val.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp30.value = 0;
} else if ((document.frm.a_1518_b.value == '')&&(document.frm.temp30.value != 'A')) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.temp30.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp30.value = 0;
}
 }

 function addCheck519(form) {

 if (document.frm.a_1519_b.value != '') {
if (!isNumeric(document.frm.a_1519_b.value)) {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_1519_b.focus();
      return false;
 } }


if (document.frm.a_1519_b.value != '') {
if (document.frm.temp31.value == 'A') {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.a_1519_val.value), 2);
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1519_b.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
}else{
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.temp31.value), 2);
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) + parseFloat(document.frm.a_1519_b.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
}
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp31.value = document.frm.a_1519_b.value;
  } else if ((document.frm.a_1519_b.value == '')&&(document.frm.temp31.value == 'A')) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.a_1519_val.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp31.value = 0;
} else if ((document.frm.a_1519_b.value == '')&&(document.frm.temp31.value != 'A')) {
document.frm.a_1520.value = roundit(parseFloat(document.frm.a_1520.value) - parseFloat(document.frm.temp31.value), 2);
document.frm.a_1308_b.value = roundit(parseFloat(document.frm.a_1520.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

document.frm.temp31.value = 0;
}
 }

function addCheck1601(form) {

 if (document.frm.a_1601.value != '') {
if (!isNumeric(document.frm.a_1601.value)) {
 alert("Only numbers in the format XXXX or XX.XX are allowed in this field!")
  document.frm.a_1601.focus();
      return false;
 } }


 if (document.frm.a_1601.value != '') {
if (document.frm.temp1601.value == 'A') {
document.frm.a_303.value = roundit(parseFloat(document.frm.a_303.value) - parseFloat(document.frm.a_1601_val.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_303.value) + parseFloat(document.frm.a_1601.value), 2);

}else{
document.frm.a_303.value = roundit(parseFloat(document.frm.a_303.value) - parseFloat(document.frm.temp1601.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_303.value) + parseFloat(document.frm.a_1601.value), 2);
}
document.frm.temp1601.value = document.frm.a_1601.value;
  } else if ((document.frm.a_1601.value == '')&&(document.frm.temp1601.value == 'A')) {
document.frm.a_303.value = roundit(parseFloat(document.frm.a_303.value) - parseFloat(document.frm.a_1601_val.value), 2);
document.frm.a_1601.value = 0;
document.frm.temp1601.value = 0;

} else if ((document.frm.a_1601.value == '')&&(document.frm.temp1601.value != 'A')) {

document.frm.a_303.value = roundit(parseFloat(document.frm.a_303.value) - parseFloat(document.frm.temp1601.value), 2);
document.frm.a_1601.value = 0;
document.frm.temp1601.value = 0;

}

 }

</script>

<script type="text/javascript" language="JavaScript">

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

function addCheckd(form) {

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



 if (document.frm.a_901_c.value != '') {
if (!isNumeric(document.frm.a_901_c.value)) {
 alert("Only numbers in this format XX or XX.XX are allowed in this field")
  document.frm.a_901_c.focus();
      return false;
 } }

 if ((document.frm.a_901_a.value != '') && (document.frm.a_901_b.value != '') && (document.frm.a_901_c.value != '')) {
 if (document.frm.a_901_d.value == '') {
 if (date1temp > date2temp) {
document.frm.a_901_d.value = -days * document.frm.a_901_c.value;
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_901_d.value), 2);
} else {
document.frm.a_901_d.value = days * document.frm.a_901_c.value;
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_901_d.value), 2);
}
}else {
 if (date1temp > date2temp) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.a_901_d.value), 2);
document.frm.a_901_d.value = -days * document.frm.a_901_c.value;
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_901_d.value), 2);
}else{
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.a_901_d.value), 2);
document.frm.a_901_d.value = days * document.frm.a_901_c.value;
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) + parseFloat(document.frm.a_901_d.value), 2);

}
}

document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);

}
else if (((document.frm.a_901_a.value == '')||(document.frm.a_901_b.value == '')||(document.frm.a_901_c.value == ''))&&(document.frm.a_901_d.value != '')) {
document.frm.a_1400_a.value = roundit(parseFloat(document.frm.a_1400_a.value) - parseFloat(document.frm.a_901_d.value), 2);
document.frm.a_103.value = roundit(parseFloat(document.frm.a_1400_a.value), 2);
document.frm.a_303.value = roundit(parseFloat(document.frm.a_302.value) + parseFloat(document.frm.a_1601.value) - parseFloat(document.frm.a_103.value) - parseFloat(document.frm.a_1308_b.value), 2);
document.frm.a_901_d.value = '';
 }

}

</script>



<script type="text/javascript" language="JavaScript">

function cant_edit(box)
{
  alert("You can't edit text in this field.");
  box.blur();
  return true;
}

</script>


<cfoutput><script type="text/javascript" language="javascript" src="https://#cgi.server_name#/admin_area/calendar/calendar.js"></script></cfoutput>


</HEAD>



<CFQUERY datasource="#request.dsn#" NAME="read_data">
			SELECT *
			from hud_form_prop_pg1
			WHERE prop_ID = #rec_id#
		</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_data2">
			SELECT *
			from hud_form_prop_pg2
			WHERE prop_ID = #rec_id#
		</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="get_titleid">
			SELECT *
			FROM property
			WHERE prop_ID = #rec_id#
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_insurance">
				SELECT * from Doc_Title_Insurance_prop
				where prop_ID = #rec_id#

			</CFQUERY>
			<cfif #get_insurance.recordcount# GT 0>
			<CFQUERY datasource="#request.dsn#" NAME="get_ins">
				SELECT * from title_companies
				where Title_co_ID = '#get_insurance.insurance_co#'

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
		update hud_form_prop_pg2
		set print_date = '#DateFormat(Now(), "mmmmm dd, yyyy")#'
		WHERE prop_ID = #rec_id#

</CFQUERY>	</cfif>

<cfoutput><IFRAME STYLE="display:none;position:absolute;width:157;height:158;z-index=100" ID="CalFrame" MARGINHEIGHT=0 MARGINWIDTH=0 NORESIZE FRAMEBORDER=0 SCROLLING=NO SRC="https://#cgi.server_name#/calendar/popup_calendar.html"></IFRAME></cfoutput>


<BODY BGCOLOR="white" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>
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
 <CFFORM name="frm" ACTION="./prop_modify_hud_A_submit.cfm?uid=#uid#&al=#al#&rec_id=#rec_id#&a_trigger=1" ENCTYPE="multipart/form-data" METHOD=POST>

<table width="100%" align="center" border="0" cellpadding="1" cellspacing="0">
  <tr>
    <td width="33%"><font size="2" face="Arial, Helvetica, sans-serif"><strong>SETTLEMENT
      STATEMENT</strong></font></td>
    <td width="33%"><font size="1" face="Arial, Helvetica, sans-serif">U.S. DEPARTMENT
      OF HOUSING</font></td>
    <td width="33%"><font size="1" face="Arial, Helvetica, sans-serif">File Number:
      &nbsp;&nbsp;<b>#get_titleid.prop_id#</b></font></td>
  </tr>
  <tr>
    <td><font size="1" face="Arial, Helvetica, sans-serif">Optional Form for</font></td>
    <td><font size="1" face="Arial, Helvetica, sans-serif">AND URBAN DEVELOPMENT</font></td>
    <td><font size="1" face="Arial, Helvetica, sans-serif">Loan Number: &nbsp;&nbsp;<b>#get_titleid.loan_number#</b></font></td>
  </tr>
  <tr>
    <td><font size="1" face="Arial, Helvetica, sans-serif">Transactions without
      Sellers</font></td>
    <td><font size="1" face="Arial, Helvetica, sans-serif">OMB Approval No. 2502-0491</font></td>
    <td><font size="1" face="Arial, Helvetica, sans-serif">Mtg. Ins. Case Number:
      &nbsp;&nbsp;<b>#read_data.a_8#</b></font></td>
  </tr>
</table>
<table width="100%" align="center" border="2" cellpadding="1" cellspacing="0" bordercolordark="333333" bordercolorlight="333333" bordercolor="333333">
  <tr>
    <td colspan="4"> <table width="100%" cellpadding="0" cellspacing="0" border="0">
        <tr>
          <td width="19%"> <font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;NAME
            OF BORROWER:&nbsp;&nbsp;&nbsp;<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ADDRESS:&nbsp;&nbsp;&nbsp;</font></td>
          <td width="81%"><strong><font size="1" face="Arial, Helvetica, sans-serif">#read_data.d_bname#<br>
            #read_data.g_propaddr#</font></strong></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td colspan="4"> <table width="100%" cellpadding="0" cellspacing="0" border="0">
        <tr>
          <td width="19%"> <font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;NAME
            OF LENDER:&nbsp;&nbsp;&nbsp;<b></b>&nbsp;&nbsp;&nbsp;<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ADDRESS:&nbsp;&nbsp;&nbsp;</font></td>
          <td width="81%"><strong><font size="1" face="Arial, Helvetica, sans-serif">#read_data.f_lname#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_titleid.insured#<br>
            #read_data.f_laddr#</font></strong></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td colspan="4"> <table width="100%" cellpadding="0" cellspacing="0" border="0">
        <tr>
          <td width="19%"> <font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;PROPERTY
            ADDRESS:&nbsp;&nbsp;&nbsp;&nbsp;</font></td>
          <td width="81%"><font size="1" face="Arial, Helvetica, sans-serif"><strong>#read_data.g_propaddr#</strong></font></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td colspan="4"> <table width="100%" cellpadding="0" cellspacing="0" border="0">
        <tr>
          <td width="19%"> <font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;SETTLEMENT
            AGENT:&nbsp;&nbsp;&nbsp;<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PLACE OF SETTLEMENT:&nbsp;&nbsp;&nbsp;</font></td>
          <td width="81%"><strong><font size="1" face="Arial, Helvetica, sans-serif">First
<cfif NOT DateDiff("d", Now(), "1/30/2012")>
            Title and Escrow, Inc.<br>
            30 West Gude Drive, suite 450, Rockville, MD 20850</font></strong></td>
<cfelse>
            Title and Escrow, Inc.<br>
           7361 Calhoun Place, Suite 200, Rockville, MD 20855</font></strong></td>
</cfif>

        </tr>
      </table></td>
  </tr>
  <tr>
    <td colspan="4"> <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="23%"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;Loan
            Number:&nbsp;&nbsp;&nbsp;<b><CFINPUT type="text" NAME="loan_number" SIZE=20 MAXLENGTH=199
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
							clear: none;" ></b></font></td>
          <td width="77%"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;SETTLEMENT
            DATE:&nbsp;&nbsp;&nbsp;<b><CFINPUT type="text" NAME="i_settlementDate" SIZE=20 MAXLENGTH=199
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
							clear: none;" ></b></font>
							</td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td colspan="2"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;L.
      Settlement Charges</strong></font></td>
    <td colspan="2"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;M.
      Disbursement to Others </strong></font></td>
  </tr>
  <tr>
    <td width="46%" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;800.
      Items Payable In Connection with Loan </strong></font></td>
    <td width="8%" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;</strong></font></td>
    <td width="38%" rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1501.&nbsp;&nbsp;
	<CFINPUT type="text" NAME="a_1501_a" SIZE=50 MAXLENGTH=199
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
    <td width="8%" rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;
	<CFINPUT type="text" onBlur=addCheck501(this.form) NAME="a_1501_b" SIZE=10 MAXLENGTH=199
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
							clear: none;" >
							</strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">801.
      Loan Origination Fee <cfINPUT type="text" NAME="a_801_a" onBlur=addCheck(this.form) SIZE=10 MAXLENGTH=199
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
							clear: none;" >% to
							<CFINPUT type="text" NAME="a_801_d" onBlur=addCheck(this.form) SIZE=10 MAXLENGTH=199
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
							&nbsp;&nbsp; OR enter
		<CFINPUT type="text" onBlur=addCheck801(this.form) NAME="a_801_g" SIZE=10 MAXLENGTH=199
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
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;
	<INPUT  onFocus=cant_edit(this) type="text" NAME="a_801_b" SIZE=10 MAXLENGTH=199
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
							clear: none;" >	</strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">802.
      Loan Discount &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <cfINPUT type="text" NAME="a_802_a" onBlur=addCheck2(this.form) SIZE=10 MAXLENGTH=199
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
							clear: none;" >% to
							<CFINPUT type="text" NAME="a_802_d" onBlur=addCheck2(this.form) SIZE=10 MAXLENGTH=199
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
							&nbsp;&nbsp; OR enter
		<CFINPUT type="text" onBlur=addCheck802(this.form) NAME="a_802_g" SIZE=10 MAXLENGTH=199
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
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;
		<INPUT  onFocus=cant_edit(this) type="text" NAME="a_802_b" SIZE=10 MAXLENGTH=199
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
							clear: none;" >	</strong></font></td>
    <td rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1502.&nbsp;&nbsp;
	<CFINPUT type="text" NAME="a_1502_a" SIZE=50 MAXLENGTH=199
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
							clear: none;" >
							</font></td>
    <td rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;
	<CFINPUT type="text" onBlur=addCheck502(this.form) NAME="a_1502_b" SIZE=10 MAXLENGTH=199
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
							clear: none;" ></strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;803.
      Appraisal Fee&nbsp;&nbsp;&nbsp;&nbsp;
	  <CFINPUT type="text" NAME="a_803_a" SIZE=55 MAXLENGTH=199
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
							clear: none;" ></font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;
	<CFINPUT type="text" onBlur=addCheck8(this.form) NAME="a_803_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_803_b#"
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
							clear: none;" >	</strong></font>
							</td>
  </tr>
  <tr>
    <td width="46%" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;804.
      Credit Report &nbsp;&nbsp;&nbsp;&nbsp;
	  <CFINPUT type="text"  NAME="a_804_a" SIZE=55 MAXLENGTH=199
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
							clear: none;" ></font></td>
    <td width="8%" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;
	<CFINPUT type="text" onBlur=addCheck9(this.form) NAME="a_804_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_804_b#"
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
							clear: none;" >	</strong></font>
							</td>
    <td width="38%" rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1503.&nbsp;&nbsp;
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
    <td width="8%" rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;
	<CFINPUT type="text" onBlur=addCheck503(this.form) NAME="a_1503_b" SIZE=10 MAXLENGTH=199
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
							clear: none;" ></strong></font>
							</td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;805.
      	 <CFINPUT type="text" NAME="a_805_a" SIZE=33 MAXLENGTH=199
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
							 <CFINPUT type="text" NAME="a_805_c" SIZE=33 MAXLENGTH=199
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
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;
	 <CFINPUT type="text" onBlur=addCheck10(this.form) NAME="a_805_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_805_b#"
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
							clear: none;" >	</strong></font>
							</td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;806.
       <CFINPUT type="text" NAME="a_806_a" SIZE=33 MAXLENGTH=199
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
							       <CFINPUT type="text" NAME="a_806_c" SIZE=33 MAXLENGTH=199
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
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;
	 <CFINPUT type="text" onBlur=addCheck11(this.form) NAME="a_806_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_806_b#"
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
							clear: none;" >	</strong></font></td>
    <td rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1504.&nbsp;&nbsp;
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
							clear: none;" ></font>
							</td>
    <td rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;
	<CFINPUT type="text" onBlur=addCheck504(this.form) NAME="a_1504_b" SIZE=10 MAXLENGTH=199
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
							clear: none;" ></strong></font>
							</td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;807.
      	<CFINPUT type="text" NAME="a_807_a" SIZE=33 MAXLENGTH=199
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
							       <CFINPUT type="text" NAME="a_807_c" SIZE=33 MAXLENGTH=199
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
							clear: none;" >  </font>
							</td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;
	<CFINPUT type="text" onBlur=addCheck12(this.form) NAME="a_807_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_807_b#"
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
							clear: none;" >	</strong></font></td>
  </tr>
  <tr>
    <td width="46%" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;808.
	 <CFINPUT type="text" NAME="a_808_a" SIZE=33 MAXLENGTH=199
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
							       <CFINPUT type="text" NAME="a_808_c" SIZE=33 MAXLENGTH=199
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
    <td width="8%" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;
	 <CFINPUT type="text" onBlur=addCheck13(this.form) NAME="a_808_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_808_b#"
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
							clear: none;" >	</strong></font></td>
    <td width="38%" rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1505.&nbsp;&nbsp;
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
    <td width="8%" rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;
	<CFINPUT type="text" onBlur=addCheck505(this.form) NAME="a_1505_b" SIZE=10 MAXLENGTH=199
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
							clear: none;" ></strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;809.
	  <CFINPUT type="text" NAME="a_809_a" SIZE=33 MAXLENGTH=199
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
							       <CFINPUT type="text" NAME="a_809_c" SIZE=33 MAXLENGTH=199
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
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;
	 <CFINPUT type="text" onBlur=addCheck14(this.form) NAME="a_809_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_809_b#"
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
							clear: none;" >	</strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;810.
	 <CFINPUT type="text" NAME="a_810_a" SIZE=33 MAXLENGTH=199
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
							<CFINPUT type="text" NAME="a_810_c" SIZE=33 MAXLENGTH=199
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
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;
	 <cfif #read_data2.a_810_b# neq "0">
		 <CFINPUT type="text" onBlur=addCheck15(this.form) NAME="a_810_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_810_b#"
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
							<cfelse>
					 <CFINPUT type="text" onBlur=addCheck15(this.form) NAME="a_810_b" SIZE=10 MAXLENGTH=199
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
							clear: none;" >
							</cfif></strong></font></td>
    <td rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1506.&nbsp;&nbsp;
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
    <td rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;
	<CFINPUT type="text" onBlur=addCheck506(this.form) NAME="a_1506_b" SIZE=10 MAXLENGTH=199
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
							clear: none;" ></strong></font>
							</td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;811.
	<CFINPUT type="text" NAME="a_811_a" SIZE=33 MAXLENGTH=199
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
							       <CFINPUT type="text" NAME="a_811_c" SIZE=33 MAXLENGTH=199
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
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;
	 <cfif #read_data2.a_811_b# neq "0">
		 <CFINPUT type="text" onBlur=addCheck16(this.form) NAME="a_811_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_811_b#"
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
							<cfelse>
								 <CFINPUT type="text" onBlur=addCheck16(this.form) NAME="a_811_b" SIZE=10 MAXLENGTH=199
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
							clear: none;" >
							</cfif></strong></font></td>
  </tr>
  <tr>
    <td width="46%" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;900.
      Items Required by Lender to be Paid in Advance </strong></font></td>
    <td width="8%" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;</strong></font></td>
    <td width="38%" rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1507.&nbsp;&nbsp;
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
    <td width="8%" rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;
	<CFINPUT type="text" onBlur=addCheck507(this.form) NAME="a_1507_b" SIZE=10 MAXLENGTH=199
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
							clear: none;" ></strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;901.
      Interest From
	  <cfINPUT type="text" NAME="a_901_a" onBlur=addCheckd(this.form) SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_901_a#"
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
							<A href="javascript:ShowCalendar(document.all('calpic'),document.all('a_901_a'),document.all('null'),'01/1/2003', '12/31/2009')" onclick="event.cancelBubble=true;"><img src="https://#cgi.server_name#/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic" style="POSITION: relative"></A>&nbsp;&nbsp;to
							 <cfINPUT type="text" NAME="a_901_b" onBlur=addCheckd(this.form) SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_901_b#"
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
							<A href="javascript:ShowCalendar(document.all('calpic2'),document.all('a_901_b'),document.all('null'),'01/1/2003', '12/31/2009')" onclick="event.cancelBubble=true;"><img src="https://#cgi.server_name#/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic2" style="POSITION: relative"></A>&nbsp;&nbsp;@$
							 <cfINPUT type="text" NAME="a_901_c" onBlur=addCheckd(this.form) SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_901_c#"
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
							clear: none;" > per day </font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;
	<INPUT onFocus=cant_edit(this) type="text" NAME="a_901_d" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_901_d#"
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
							clear: none;" ></strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;902.
      Mortgage Insurance Premium for
	  <CFINPUT type="text" NAME="a_902_a" SIZE=10 MAXLENGTH=199
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
							clear: none;" > to
							 <CFINPUT type="text" NAME="a_902_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_902_b#"
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
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;
	 <CFINPUT type="text" onBlur=addCheck17(this.form) NAME="a_902_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_902_c#"
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
							clear: none;" ></strong></font></td>
    <td rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1508.&nbsp;&nbsp;
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
    <td rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;
	<CFINPUT type="text" onBlur=addCheck508(this.form) NAME="a_1508_b" SIZE=10 MAXLENGTH=199
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
							clear: none;" ></strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;903.
      Hazard Insurance Premium for &nbsp;&nbsp;&nbsp;
	   <CFINPUT type="text" NAME="a_903_a" SIZE=10 MAXLENGTH=199
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
							clear: none;" > to
							 <CFINPUT type="text" NAME="a_903_b" SIZE=10 MAXLENGTH=199
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
							clear: none;" ></font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;
	<CFINPUT type="text" onBlur=addCheck18(this.form) NAME="a_903_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_903_c#"
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
							clear: none;" ></strong></font>
							</td>
  </tr>
  <tr>
    <td width="46%" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;904.
	<CFINPUT type="text" NAME="a_904_a" SIZE=33 MAXLENGTH=199
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
							       <CFINPUT type="text" NAME="a_904_c" SIZE=33 MAXLENGTH=199
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
    <td width="8%" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;
	<CFINPUT type="text" onBlur=addCheck19(this.form) NAME="a_904_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_904_b#"
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
							clear: none;" ></strong></font></td>
    <td width="38%" rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1509.&nbsp;&nbsp;
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
							clear: none;" >
      </font></td>
    <td width="8%" rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;
	<CFINPUT type="text" onBlur=addCheck509(this.form) NAME="a_1509_b" SIZE=10 MAXLENGTH=199
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
							clear: none;" ></strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;1000.
      Reserves Deposited with Lender </strong></font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;</strong></font></td>
  </tr>
  <tr>
    <td valign="top"> <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
          <td width="47%"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1001.
            Hazard Insurance</font></td>
          <td width="12%"><font size="1" face="Arial, Helvetica, sans-serif">
		   <CFINPUT type="text" NAME="a_1001_a" onBlur=addCheck3(this.form) SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1001_a#"
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
							clear: none;" >mo.@$</font></td>
          <td width="20%"><strong><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;
		   <CFINPUT type="text" NAME="a_1001_b" onBlur=addCheck3(this.form) SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1001_b#"
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
							clear: none;" >	</font></strong></td>
          <td width="21%"><font size="1" face="Arial, Helvetica, sans-serif">per
            month</font></td>
        </tr>
      </table></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;
	 <INPUT onFocus=cant_edit(this) type="text" NAME="a_1001_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1001_c#"
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
							clear: none;" >	</strong></font></td>
    <td rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1510.&nbsp;&nbsp;
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
    <td rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;
		<CFINPUT type="text" onBlur=addCheck510(this.form) NAME="a_1510_b" SIZE=10 MAXLENGTH=199
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
							clear: none;" ></strong></font></td>
  </tr>
  <tr>
    <td valign="top"> <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
          <td width="47%"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1002.
            Mortgage Insurance</font></td>
          <td width="12%"><font size="1" face="Arial, Helvetica, sans-serif">
		    <CFINPUT type="text" NAME="a_1002_a" onBlur=addCheck4(this.form) SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1002_a#"
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
							clear: none;" >mo.@$</font></td>
          <td width="20%"><strong><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;
		 <CFINPUT type="text" NAME="a_1002_b" onBlur=addCheck4(this.form) SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1002_b#"
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
          <td width="21%"><font size="1" face="Arial, Helvetica, sans-serif">per
            month</font></td>
        </tr>
      </table></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;
	 <INPUT onFocus=cant_edit(this) type="text" NAME="a_1002_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1002_c#"
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
							clear: none;" >	</strong></font></td>
  </tr>
  <tr>
    <td valign="top"> <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
          <td width="47%"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1003.
            City Property Taxes</font></td>
          <td width="12%"><font size="1" face="Arial, Helvetica, sans-serif">
		   <CFINPUT type="text" NAME="a_1003_a" onBlur=addCheck5(this.form) SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1003_a#"
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
							clear: none;" >mo.@$</font></td>
          <td width="20%"><strong><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;
		   <CFINPUT type="text" NAME="a_1003_b" onBlur=addCheck5(this.form) SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1003_b#"
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
							clear: none;" >	</font></strong></td>
          <td width="21%"><font size="1" face="Arial, Helvetica, sans-serif">per
            month</font></td>
        </tr>
      </table></td>
    <td width="8%" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;
	 <INPUT onFocus=cant_edit(this) type="text" NAME="a_1003_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1003_c#"
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
							clear: none;" >	</strong></font></td>
    <td width="38%" rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1511.&nbsp;&nbsp;
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
							clear: none;" >
      </font></td>
    <td width="8%" rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;
	<CFINPUT type="text" onBlur=addCheck511(this.form) NAME="a_1511_b" SIZE=10 MAXLENGTH=199
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
							clear: none;" ></strong></font></td>
  </tr>
  <tr>
    <td valign="top"> <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
          <td width="47%"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1004.
            County Property Taxes </font></td>
          <td width="12%"><font size="1" face="Arial, Helvetica, sans-serif">
		  <CFINPUT type="text" NAME="a_1004_a" onBlur=addCheck6(this.form) SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1004_a#"
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
							clear: none;" >mo.@$</font></td>
          <td width="20%"><strong><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;
		   <CFINPUT type="text" NAME="a_1004_b" onBlur=addCheck6(this.form) SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1004_b#"
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
							clear: none;" >	</font></strong></td>
          <td width="21%"><font size="1" face="Arial, Helvetica, sans-serif">per
            month</font></td>
        </tr>
      </table></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;
	 <INPUT onFocus=cant_edit(this) type="text" NAME="a_1004_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1004_c#"
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
							clear: none;" >	</strong></font></td>
  </tr>
  <tr>
    <td valign="top"> <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
          <td width="47%"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1005.
            Annual Assessments</font></td>
          <td width="12%"><font size="1" face="Arial, Helvetica, sans-serif">
		     <CFINPUT type="text" NAME="a_1005_a" onBlur=addCheck7(this.form) SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1005_a#"
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
							clear: none;" >mo.@$</font></td>
          <td width="20%"><strong><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;
		  <CFINPUT type="text" NAME="a_1005_b" onBlur=addCheck7(this.form) SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1005_b#"
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
							clear: none;" >	</font></strong></td>
          <td width="21%"><font size="1" face="Arial, Helvetica, sans-serif">per
            month</font></td>
        </tr>
      </table></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;
	<INPUT onFocus=cant_edit(this) type="text" NAME="a_1005_c" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1005_c#"
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
							clear: none;" >	</strong></font></td>
    <td rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1512.&nbsp;&nbsp;
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
							clear: none;" >
							</font></td>
    <td rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;
		<CFINPUT type="text" onBlur=addCheck512(this.form) NAME="a_1512_b" SIZE=10 MAXLENGTH=199
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
							clear: none;" ></strong></font></td>
  </tr>
  <tr>
    <td valign="top"> <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
          <td width="47%"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1006. Aggragate Analysis Adjustment
            </font></td>
          <td width="12%"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;
            </font></td>
          <td width="20%"><strong><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;
		   </font></strong></td>
          <td width="21%"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
        </tr>
      </table></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;
	<CFINPUT type="text" onBlur=addCheck1006(this.form) NAME="a_1006_a" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1006_a#"
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
	</strong></font></td>
  </tr>
  <tr>
    <td valign="top"> <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
          <td><font size="1" face="Arial, Helvetica, sans-serif">1007.

							</td>



        </tr>
      </table></td>
    <td width="8%" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;

							</td>
    <td width="38%" rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1513.&nbsp;&nbsp;
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
							clear: none;" >
      </font></td>
    <td width="8%" rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;
	<CFINPUT type="text" onBlur=addCheck513(this.form) NAME="a_1513_b" SIZE=10 MAXLENGTH=199
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
							clear: none;" ></strong></font></td>
  </tr>
  <tr>
    <td valign="top"> <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
          <td><font size="1" face="Arial, Helvetica, sans-serif">1008.

							</td>

        </tr>
      </table></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;
</td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;1100.
      Title Charges </strong></font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;</strong></font></td>
    <td rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1514.&nbsp;&nbsp;
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
    <td rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;
	<CFINPUT type="text" onBlur=addCheck514(this.form) NAME="a_1514_b" SIZE=10 MAXLENGTH=199
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
							clear: none;" ></strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1101.
      Closing Fee to <cfif #read_data2.a_1101_a# neq "0" OR #read_data2.a_1101_b# neq ""> <b>#read_agency.title_ft_agency_name#</b> </cfif></font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;<cfif #read_data2.a_1101_a# neq "0">#read_data2.a_1101_a#</CFIF></strong></font></td>
  </tr>
  <tr>
    <td width="46%" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1102.
      Abstract to Abstracts USA, LLC </font></td>
    <td width="8%" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;<cfif #read_data2.a_1102_a# neq "0">
          <b>#read_data2.a_1102_a#</b>
        </cfif></font></td>
    <td width="38%" rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1515.&nbsp;&nbsp;
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
							clear: none;" >
      </font></td>
    <td width="8%" rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;
	<CFINPUT type="text" onBlur=addCheck515(this.form) NAME="a_1515_b" SIZE=10 MAXLENGTH=199
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
							clear: none;" ></strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1103.
      Title Examination to <cfif #read_data2.a_1103_a# neq "0" OR #read_data2.a_1103_b# neq "">#read_agency.title_ft_agency_name#</b> </cfif> </font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;<cfif #read_data2.a_1103_a# neq "0">
        <b>#read_data2.a_1103_a#</b></cfif></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1104.
      Title insurance binder </font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;<cfif #read_data2.a_1104_a# neq "0">
        <b>#read_data2.a_1104_a#</b></cfif></font></td>
    <td rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1516.&nbsp;&nbsp;
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
    <td rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;
	<CFINPUT type="text" onBlur=addCheck516(this.form) NAME="a_1516_b" SIZE=10 MAXLENGTH=199
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
							clear: none;" ></strong></font>
							</td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1105.
      Document Preparation </font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;<cfif #read_data2.a_1105_a# neq "0">
        <b>#read_data2.a_1105_a#</b></cfif></strong></font></td>
  </tr>
  <tr>
    <td width="46%" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1106.
      Notary Fees </font></td>
    <td width="8%" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;<cfif #read_data2.a_1106_a# neq "0">
        <b>#read_data2.a_1106_a#</b></cfif></strong></font></td>
    <td width="38%" rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1517.&nbsp;&nbsp;
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
							clear: none;" >
      </font></td>
    <td width="8%" rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;
	<CFINPUT type="text" onBlur=addCheck517(this.form) NAME="a_1517_b" SIZE=10 MAXLENGTH=199
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
							clear: none;" ></strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1107.
      Attorney's fees<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(includes
      above items No. ) </font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;<cfif #read_data2.a_1107_a# neq "0">
        <b>#read_data2.a_1107_a#</b></cfif></strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1108.
      Title Insurance to <cfif #read_data2.a_1108_a# neq "0" OR #read_data2.a_1108_b# neq ""><b>First Title/#get_ins.company#</b> </cfif><br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(includes
      above items No. ) </font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;<cfif #read_data2.a_1108_a# neq "0">
        <b>#read_data2.a_1108_a#</b></cfif></strong></font></td>
    <td rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1518.&nbsp;&nbsp;
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
    <td rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;
	<CFINPUT type="text" onBlur=addCheck518(this.form) NAME="a_1518_b" SIZE=10 MAXLENGTH=199
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
							clear: none;" ></strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1109.
      Lender's coverage $  <cfif #read_data2.a_1109_a# neq "0">
          <b>#read_data2.a_1109_a#</b>
        </cfif> </font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;</strong></font></td>
  </tr>
  <tr>
    <td width="46%" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1110.
      Owner's coverage $ -  <cfif #read_data2.a_1110_a# neq "0">
          <b>#read_data2.a_1110_a#</b>
        </cfif></font></td>
    <td width="8%" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;</strong></font></td>
    <td width="38%" rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1519.&nbsp;&nbsp;
	<CFINPUT type="text" NAME="a_1519_a" SIZE=50 MAXLENGTH=199
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
							clear: none;" >
      </font></td>
    <td width="8%" rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;
	<CFINPUT type="text" onBlur=addCheck519(this.form) NAME="a_1519_b" SIZE=10 MAXLENGTH=199
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
							clear: none;" ></strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1111. #get_line_costs.a_1111_text# <cfif #read_data2.a_1111_a# neq "0" OR #read_data2.a_1111_b# neq "">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>#read_agency.title_ft_agency_name#</b>
        </cfif>
      </font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;<cfif #read_data2.a_1111_a# neq "0">
        <b>#read_data2.a_1111_a#</b></cfif></strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1112. #get_line_costs.a_1112_text# <cfif #read_data2.a_1112_a# neq "0">
        <b>#read_data2.a_1112_a#</b></cfif>
      </font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;<cfif #read_data2.a_1112_b# neq "0"><b>#read_data2.a_1112_b#</b>
       </cfif></strong></font></td>
    <td rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;1520.
      TOTAL DISBURSED <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(enter
      on line 1603) </strong></font></td>
    <td rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;
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
							</cfif></strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1113. #get_line_costs.a_1113_text#<cfif #read_data2.a_1113_a# neq "0" OR #read_data2.a_1113_b# neq "">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>#read_agency.title_ft_agency_name#</b>
       </cfif> </font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;</strong></font></td>
  </tr>
  <tr>
    <td width="46%" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;1200.
      Government Recording and Transfer Charges </strong></font></td>
    <td width="8%" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;</strong></font></td>
    <td width="38%" rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;N.
      NET SETTLEMENT </strong></font></td>
    <td width="8%" rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;</strong></font></td>
  </tr>
 <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1201.
     <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>Recording Fees Deed $ &nbsp;&nbsp;<font color=blue>
        <cfif #read_data2.a_1201_a# neq "0">
          <b>#read_data2.a_1201_a#</b>
        </cfif>
        </font>&nbsp;&nbsp; Mortgage $ &nbsp;&nbsp;<font color=blue>
        <cfif #read_data2.a_1201_b# neq "0">
          <b>#read_data2.a_1201_b#</b>
        </cfif>
        </font>&nbsp;&nbsp;&nbsp;: Release $ <font color=blue>
        <cfif #read_data2.a_1201_c# neq "0">
          <b>#read_data2.a_1201_c#</b>
        </cfif>
        </font></font></font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;<cfif #read_data2.a_1201_d# neq "0">
        &nbsp;<b>#read_data2.a_1201_d#</b></cfif></strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1202.
      <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>City/County tax/Stamps: &nbsp;&nbsp;<font color=blue>
        <cfif #read_data2.a_1202_a# neq "0">
          <b>#read_data2.a_1202_a#</b>
        </cfif>
        </font>&nbsp;&nbsp;Deed $ &nbsp;&nbsp;<font color=blue>
        <cfif #read_data2.a_1202_b# neq "0">
          <b>#read_data2.a_1202_b#</b>
        </cfif>
        </font>&nbsp;&nbsp;: Mortgage $ <font color=blue>
        <cfif #read_data2.a_1202_c# neq "0">
          <b>#read_data2.a_1202_c#</b>
        </cfif>
        </font></font></font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;<font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <cfif #read_data2.a_1202_d# neq "0">
          <b>#read_data2.a_1202_d#</b>
        </cfif>
        </font></font></strong></font></td>
    <td rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1600.
      <strong>Loan Amount</strong></font></td>
    <td rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;
	  <INPUT onFocus=cant_edit(this) type="text" NAME="a_302" SIZE=10 MAXLENGTH=199
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
							clear: none;" >
	</strong></font></td>
  </tr>
   <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1203.
</font><font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>State tax/Stamps: &nbsp;&nbsp;<font color=blue>
        <cfif #read_data2.a_1203_a# neq "0">
          <b>#read_data2.a_1203_a#</b>
        </cfif>
        </font>&nbsp;&nbsp;Deed $ &nbsp;&nbsp;<font color=blue>
        <cfif #read_data2.a_1203_b# neq "0">
          <b>#read_data2.a_1203_b#</b>
        </cfif>
        </font>&nbsp;&nbsp;: Mortgage $ <font color=blue>
        <cfif #read_data2.a_1203_c# neq "0">
          <b>#read_data2.a_1203_c#</b>
        </cfif>
        </font></font></font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>
	<font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <cfif #read_data2.a_1203_d# neq "0">
          <b>#read_data2.a_1203_d#</b>
        </cfif>
        </font></font> </strong></font></td>
  </tr>
  <tr>
    <td width="46%" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1204.
      </font></td>
    <td width="8%" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;</strong></font></td>
    <td width="38%" rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;
      1601. <strong>PLUS</strong> Cash/Check from Borrower </font></td>
    <td width="8%" rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;
	<cfif #read_data.a_1601# eq "">
	<CFINPUT type="text" onBlur=addCheck1601(this.form) NAME="a_1601" SIZE=10 MAXLENGTH=199
							VALUE="0"
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
	<cfelse>
	<CFINPUT type="text" onBlur=addCheck1601(this.form) NAME="a_1601" SIZE=10 MAXLENGTH=199
							VALUE="#read_data.a_1601#"
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
		</cfif>
	</strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1205. #get_line_costs.a_1205_text#<cfif #read_data2.a_1205_a# neq "0" OR #read_data2.a_1205_b# neq "">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <b>#read_agency.title_ft_agency_name#</b> </cfif>
      </font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;<cfif #read_data2.a_1205_a# neq "0">
          <b>#read_data2.a_1205_a#</b>
        </cfif></strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;1300.
      Additional Settlement Charges </strong></font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;</strong></font></td>
    <td rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1602.
      <strong>MINUS</strong> Total Settlement Charges<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(line
      1400) </font></td>
    <td rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;
	 <INPUT onFocus=cant_edit(this) type="text" NAME="a_103" SIZE=10 MAXLENGTH=199
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
	</strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1301.
      Survey </font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;<cfif #read_data2.a_1301_a# neq "0">
          <b>#read_data2.a_1301_a#</b>
        </cfif></strong></font></td>
  </tr>
  <tr>
    <td width="46%" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1302.
      Pest Inspection </font></td>
    <td width="8%" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;<cfif #read_data2.a_1302_a# neq "0">
          <b>#read_data2.a_1302_a#</b>
        </cfif></strong></font></td>
    <td width="38%" rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1603.
      <strong>MINUS</strong> Total Disbursements to Others<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(line
      1520) </font></td>
    <td width="8%" rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;
	  <cfif #read_data2.a_1308_b# neq "">
	  <INPUT onFocus=cant_edit(this) type="text" NAME="a_1308_b" SIZE=10 MAXLENGTH=199
							VALUE="#read_data2.a_1308_b#"
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
							<INPUT onFocus=cant_edit(this) type="text" NAME="a_1308_b" SIZE=10 MAXLENGTH=199
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
							</cfif>
	</strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1303. #get_line_costs.a_1303_text#<cfif #read_data2.a_1303_a# neq "0" OR #read_data2.a_1303_b# neq "">&nbsp;&nbsp;&nbsp;<b>#read_agency.title_ft_agency_name#</b></cfif>
      </font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;  <cfif #read_data2.a_1303_a# neq "0">
          <b>#read_data2.a_1303_a#</b>
        </cfif></strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1304. #get_line_costs.a_1304_text#<cfif #read_data2.a_1304_a# neq "0" OR #read_data2.a_1304_b# neq "">&nbsp;&nbsp;
        <b>#read_agency.title_ft_agency_name#</b></cfif>
      </font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp; <cfif #read_data2.a_1304_a# neq "0">
          <b>#read_data2.a_1304_a#</b>
        </cfif></strong></font></td>
    <td rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1604.
      <strong>EQUALS</strong> Disbursements to Borrower<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(after
      expiration of any applicable <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;rescission
      period required by law) </font></td>
    <td rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;

					  <INPUT onFocus=cant_edit(this) type="text" NAME="a_303" SIZE=10 MAXLENGTH=199
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
							clear: none;" >

	</strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1305. #get_line_costs.a_1305_text#<cfif #read_data2.a_1305_a# neq "0" OR #read_data2.a_1305_b# neq "">&nbsp;&nbsp;<b>#read_agency.title_ft_agency_name#</b></cfif></font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp; <cfif #read_data2.a_1305_a# neq "0">
          <b>#read_data2.a_1305_a#</b>
        </cfif></strong></font></td>
  </tr>
  <tr>
    <td width="46%" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1306. <cfif #read_data2.a_1306_a# neq "0"> #read_data2.a_1306_a#</cfif>
      </font></td>
    <td width="8%" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;<cfif #read_data2.a_1306_b# neq "0"> #read_data2.a_1306_b#</cfif></strong></font></td>
    <td width="38%" rowspan="2" valign="top"></td>
    <td width="8%" rowspan="2" valign="top"></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1307.  <cfif #read_data2.a_1307_a# neq "0">
          #read_data2.a_1307_a#
        </cfif>
      </font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp; <cfif #read_data2.a_1307_b# neq "0">
          <b>#read_data2.a_1307_b#</b>
        </cfif></strong></font></td>
  </tr>
  <tr>
    <td width="46%" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1308.
      </font></td>
    <td width="8%" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;</strong></font></td>
    <td width="38%" rowspan="2" valign="top"></td>
    <td width="8%" rowspan="2" valign="top"></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;1400.
      Total Settlement Charges (enter on line 1602) </strong></font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;
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
							clear: none;" >	</strong></font></td>
  </tr>
</table>
<p>
<table border="0" cellpadding="0" cellspacing="0" width="95%" align="center">
  <tr>
    <td><font face="Arial, Helvetica, sans-serif" size="1"> I have carefully reviewed the
      HUD-1A Settlement Statement and to the best of my knowledge and belief,
      it is a true and accurate statement of all receipts and disbursements made
      on my account or by me in this transaction. I further certify that I have
      received a copy of the HUD-1A Settlement Statement. <br>
      &nbsp;
      <p>_________________________________________________________________<br>
        Fees
      <p>The HUD-1A Settlement Statement which I have prepared is a true and accurate
        account of this transaction. I have caused or will cause the funds to
        be disbursed in accordance with this statement. </font> <table border="0" cellpadding="0" cellspacing="0" width="75%" align="center">
        <tr>
          <td align="left"><font face="Arial, Helvetica, sans-serif" size="1">SETTLEMENT
            AGENT By:</font></td>
        </tr>
        <tr>
          <td align="right"><font face="Arial, Helvetica, sans-serif" size="1">_____________________________________DATE</font></td>
        </tr>
      </table>
     <br> <!--- &nbsp; --->
      <table border="0" cellpadding="0" cellspacing="0" width="95%" align="center">
        <tr>
          <td align="left"><strong><font face="Arial, Helvetica, sans-serif" size="1">First Title
            Settlement System Printed 11/05/2003 at 17:14 HEI</font></strong></td>
          <td align="right"><strong><font face="Arial, Helvetica, sans-serif" size="1">form
            HUD-1A (2/94) ref. RESPA</font></strong></td>
        </tr>
      </table></td>

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
							<!--- <INPUT TYPE=HIDDEN NAME="temp1007" VALUE="A">
							<INPUT TYPE=HIDDEN NAME="temp1008" VALUE="A"> --->

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
								<!--- <cfif #read_data2.a_1007_c# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1007_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1007_val" VALUE="#read_data2.a_1007_c#">
							</cfif>
								<cfif #read_data2.a_1008_c# eq "">
							<INPUT TYPE=HIDDEN NAME="a_1008_val" VALUE="0">
							<cfelse>
							<INPUT TYPE=HIDDEN NAME="a_1008_val" VALUE="#read_data2.a_1008_c#">
							</cfif>   --->
        </table>
</td></tr></table>
  <table align="center" width="98%" cellspacing=0 cellpadding=0 border = 1><tr><td width = "98%" bgcolor = "yellow" align = center>
 <NOBR><font size="3" color = "blue" face="Arial, Helvetica, sans-serif"><b>Click &nbsp;<input type=image border=0 src="./images/button_submit.gif">&nbsp; to save changes</b></font>&nbsp;&nbsp;&nbsp;&nbsp;</NOBR></td></tr>
<INPUT TYPE=HIDDEN NAME="loan" VALUE="#get_titleid.loanamt_float#">


</cfform>
</CFOUTPUT>
</table>
  </body>
</html>
