<cfset find_site.short_name = "ClosingCalc.com">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title><cfoutput>#find_site.short_name#</cfoutput></title>
<STYLE TYPE="text/css">
body {background-attachment:fixed;scrollbar-base-color:#708090}
.menu1 {color:#000000;font:normal bold 11px helvetica, geneva, sans serif;text-align:center;font-color:#000000}
.menu1:link    {text-decoration:none;color:#000000;font:normal bold 11px helvetica, geneva, sans serif;}
.menu1:visited {text-decoration:none;color:#000000;font:normal bold 11px helvetica, geneva, sans serif;}
.menu1:hover   {font:normal bold 11px helvetica, geneva, sans serif;text-decoration:none;color:#FFFFFF}
</style>
<script type="text/javascript" src="/CFIDE/scripts/cfform.js"></script>
<script type="text/javascript" src="/CFIDE/scripts/masks.js"></script>
<script type="text/javascript">
<!--
function  _CF_checkSearch(_CF_this)
{
//reset on submit
_CF_error_exists = false;
_CF_error_messages = new Array();
_CF_error_fields = new Object();
_CF_FirstErrorField = null;
//display error messages and return success
if( _CF_error_exists )
{
if( _CF_error_messages.length > 0 )
{
// show alert() message
_CF_onErrorAlert(_CF_error_messages);
// set focus to first form error, if the field supports js focus().
if( _CF_this[_CF_FirstErrorField].type == "text" )
{ _CF_this[_CF_FirstErrorField].focus(); }
}
return false;
}else {
return true;
}
}
//-->
</script>
<script type="text/javascript">
<!--
function  _CF_checkform(_CF_this)
{
//reset on submit
_CF_error_exists = false;
_CF_error_messages = new Array();
_CF_error_fields = new Object();
_CF_FirstErrorField = null;
//display error messages and return success
if( _CF_error_exists )
{
if( _CF_error_messages.length > 0 )
{
// show alert() message
_CF_onErrorAlert(_CF_error_messages);
// set focus to first form error, if the field supports js focus().
if( _CF_this[_CF_FirstErrorField].type == "text" )
{ _CF_this[_CF_FirstErrorField].focus(); }
}
return false;
}else {
return true;
}
}
//-->
</script>
</head>
<BODY BGCOLOR="FFFFFF" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0 >
<CENTER>
<CENTER>
<h1><cfoutput><font face="Arial, Helvetica, sans-serif">#find_site.short_name#</font></cfoutput></h1><br>
<h2><font face="Arial, Helvetica, sans-serif">Coming Soon! A closing cost calculator that is compliant with<br>
all of the new GFE Rules and Regulations.<br>
<br>
Be accurate in all of your transactions!<br>
<br>
Click <a href="https://www.firsttitleservices.com" target="_New">HERE</a> for more information about us.</font></h2><br>
<br>
The form below is only a sample.
<table width=780 border="0" cellpadding="0" cellspacing="0" style="border-color:#000000; border-width:1px; border-style:inset;">
<TBODY>
<tr>
<td align = "center">
<table><tr><td>
<style>
.adtext {font-family:Arial, Helvetica, sans-serif; font-size:12px; color:#330099;}
.maintext {font-family:Arial, Helvetica, sans-serif; font-size:14px; color:#000000;}
</style>

<br><br>
<span class="maintext">Please enter the Property and Loan Information below, and click on "Calculate Fees".<br>
<font color="#CC0000">All fields are required.</font></span><br>
</center>
<script language="javascript">
function submit_form() {
document.form.submit();
}
</script>
<style>
TD {font-family:Arial, Helvetica, sans-serif; font-size:9pt; color:#000033; font-weight:bold}
</style>
<script language="javascript">
function Validate_Form()
{
var message = "The Following fields must be completed:\n";
var complete = 1;
if (document.form.transaction_type.value=='') {
complete = 0
message = message + "Transction Type\n";
}
if (document.form.property_state.value=='') {
complete = 0
message = message + "State\n";
}
if (document.form.property_zip.value=='') {
complete = 0
message = message + "Zip Code\n";
}
if (document.form.property_county.value=='') {
complete = 0
message = message + "County\n";
}
if (document.form.property_city.value=='') {
complete = 0
message = message + "City\n";
}
if (document.form.transaction_type.value=="Refinance") {
if (document.form.loan_amount.value=='' || document.form.loan_amount.value==0) {
complete = 0
message = message + "Loan_amount\n";
}
}
if (document.form.transaction_type.value=="Purchase") {
if (document.form.purchase_price.value=='' || document.form.purchase_price.value==0) {
complete = 0
message = message + "Purchase Price\n";
}
}
if (document.form.transaction_type.value=='Refinance' || document.form.transaction_type.value=='Second Mortgage') {
if (document.form.property_state.value=='MD' || document.form.property_state.value=='TX' || document.form.property_state.value=='VA' || document.form.property_state.value=='PA') {
if (document.form.previous_loan_amount.value=='' || document.form.previous_loan_amount.value==0)  {
complete = 0
message = message + "Previous Loan Amount\n";
}
if (document.form.property_state.value=='TX') {
if (document.form.previous_loan_year.value=='')  {
complete = 0
message = message + "Previous Loan Year\n";
}
if (document.form.previous_loan_month.value=='')  {
complete = 0
message = message + "Previous Loan Month\n";
}
}
}
}
if (complete == 0) {
alert(message);
return false;
} else {
document.form.fee_submit.value='Calculate Fees';
submit_form()
}
}
</script>
<form name="form" action="/index_cc.cfm?comp_id=100&user_id_1=0&lo_id=0&company_id=100&emp=0" method="POST" onsubmit="return _CF_checkform(this)">
<input type="hidden" name="current_orders" value="0">
<input type="hidden" name="update_this_title_id" value="0">
<input type="hidden" name="update_this_prop_id" value="0">
<center>
<table cellpadding="1" cellspacing="0" bgcolor="#e9e9e9"><tr><td>
<table width="655" cellpadding="3" cellspacing="3" bgcolor="#FFFFFF">
<tr>
<td align="left" valign="top" width="110"  bgcolor="#e9e9e9">Transaction Type</td>
<td align="left" valign="top" width="60" bgcolor="#e9e9e9">State</td>
<td align="left" valign="top" width="60" bgcolor="#e9e9e9">Zip Code</td>
<td align="left" valign="top" width="160" bgcolor="#e9e9e9">County</td>
<td align="left" valign="top" width="120" bgcolor="#e9e9e9">City</td>
<td align="left" valign="top" width="140" bgcolor="#e9e9e9">Loan Amount</td>
</tr>
<tr>
<td align="left" valign="top"  bgcolor="#e9e9e9"><select name="transaction_type" onchange="submit_form();" style="font-size: 9;
font-family: verdana;
font-style: normal;
color: blue;
background-color: e6e6e6;
border-color: e6e6e6;
border-left-width: thin;
border-right-width: thin;
border-top-width: thin;
border-bottom-width: thin;
border-width: thin;
border-style: bar;
clear: none;width=100">
<option value="" selected>Select</option>
<option value="Purchase" >Purchase</option>
<option value="Refinance" selected>Refinance</option>
<option value="Second Mortgage" >2nd Mortgage</option>
<option value="Reverse Mortgage" >Reverse Mortgage</option>
</select></td>
<td align="left" valign="top"  bgcolor="#e9e9e9">
<select name="property_state" onchange="submit_form();" style="font-size: 9;
font-family: verdana;
font-style: normal;
color: blue;
background-color: e6e6e6;
border-color: e6e6e6;
border-left-width: thin;
border-right-width: thin;
border-top-width: thin;
border-bottom-width: thin;
border-width: thin;
border-style: bar;
clear: none; width=50">
<option value="">Select</option>
<option value="AK" >AK</option>
<option value="AL" >AL</option>
<option value="AR" >AR</option>
<option value="AZ" >AZ</option>
<option value="CA" >CA</option>
<option value="CO" >CO</option>
<option value="CT" >CT</option>
<option value="DC" >DC</option>
<option value="DE" >DE</option>
<option value="FL" selected>FL</option>
<option value="GA" >GA</option>
<option value="HI" >HI</option>
<option value="IA" >IA</option>
<option value="ID" >ID</option>
<option value="IL" >IL</option>
<option value="IN" >IN</option>
<option value="KS" >KS</option>
<option value="KY" >KY</option>
<option value="LA" >LA</option>
<option value="MA" >MA</option>
<option value="MD" >MD</option>
<option value="ME" >ME</option>
<option value="MI" >MI</option>
<option value="MN" >MN</option>
<option value="MO" >MO</option>
<option value="MS" >MS</option>
<option value="MT" >MT</option>
<option value="NC" >NC</option>
<option value="ND" >ND</option>
<option value="NE" >NE</option>
<option value="NH" >NH</option>
<option value="NJ" >NJ</option>
<option value="NM" >NM</option>
<option value="NV" >NV</option>
<option value="NY" >NY</option>
<option value="OH" >OH</option>
<option value="PA" >PA</option>
<option value="RI" >RI</option>
<option value="SC" >SC</option>
<option value="SD" >SD</option>
<option value="TN" >TN</option>
<option value="TX" >TX</option>
<option value="UT" >UT</option>
<option value="VA" >VA</option>
<option value="VT" >VT</option>
<option value="WI" >WI</option>
<option value="WV" >WV</option>
<option value="WY" >WY</option>
</td>
<td align="left" valign="top"  bgcolor="#e9e9e9">
<select name="property_zip" onchange="submit_form();" style="font-size: 9;
font-family: verdana;
font-style: normal;
color: blue;
background-color: e6e6e6;
border-color: e6e6e6;
border-left-width: thin;
border-right-width: thin;
border-top-width: thin;
border-bottom-width: thin;
border-width: thin;
border-style: bar;
clear: none; width=60">
<option value="">Select</option>
<option value="32003" >32003</option>
<option value="32004" >32004</option>
<option value="32006" >32006</option>
<option value="32007" >32007</option>
<option value="32008" >32008</option>
<option value="32009" >32009</option>
<option value="32011" >32011</option>
<option value="32013" >32013</option>
<option value="32024" >32024</option>
<option value="32025" >32025</option>
<option value="32026" >32026</option>
<option value="32030" >32030</option>
<option value="32033" >32033</option>
<option value="32034" >32034</option>
<option value="32035" >32035</option>
<option value="32038" >32038</option>
<option value="32040" >32040</option>
<option value="32041" >32041</option>
<option value="32042" >32042</option>
<option value="32043" selected>32043</option>
<option value="32044" >32044</option>
<option value="32046" >32046</option>
<option value="32050" >32050</option>
<option value="32052" >32052</option>
<option value="32053" >32053</option>
<option value="32054" >32054</option>
<option value="32055" >32055</option>
<option value="32056" >32056</option>
<option value="32058" >32058</option>
<option value="32059" >32059</option>
<option value="32060" >32060</option>
<option value="32061" >32061</option>
<option value="32062" >32062</option>
<option value="32063" >32063</option>
<option value="32064" >32064</option>
<option value="32065" >32065</option>
<option value="32066" >32066</option>
<option value="32067" >32067</option>
<option value="32068" >32068</option>
<option value="32071" >32071</option>
<option value="32072" >32072</option>
<option value="32073" >32073</option>
<option value="32079" >32079</option>
<option value="32080" >32080</option>
<option value="32081" >32081</option>
<option value="32082" >32082</option>
<option value="32083" >32083</option>
<option value="32084" >32084</option>
<option value="32085" >32085</option>
<option value="32086" >32086</option>
<option value="32087" >32087</option>
<option value="32091" >32091</option>
<option value="32092" >32092</option>
<option value="32094" >32094</option>
<option value="32095" >32095</option>
<option value="32096" >32096</option>
<option value="32097" >32097</option>
<option value="32099" >32099</option>
<option value="32102" >32102</option>
<option value="32105" >32105</option>
<option value="32110" >32110</option>
<option value="32111" >32111</option>
<option value="32112" >32112</option>
<option value="32113" >32113</option>
<option value="32114" >32114</option>
<option value="32115" >32115</option>
<option value="32116" >32116</option>
<option value="32117" >32117</option>
<option value="32118" >32118</option>
<option value="32119" >32119</option>
<option value="32120" >32120</option>
<option value="32121" >32121</option>
<option value="32122" >32122</option>
<option value="32123" >32123</option>
<option value="32124" >32124</option>
<option value="32125" >32125</option>
<option value="32126" >32126</option>
<option value="32127" >32127</option>
<option value="32128" >32128</option>
<option value="32129" >32129</option>
<option value="32130" >32130</option>
<option value="32131" >32131</option>
<option value="32132" >32132</option>
<option value="32133" >32133</option>
<option value="32134" >32134</option>
<option value="32135" >32135</option>
<option value="32136" >32136</option>
<option value="32137" >32137</option>
<option value="32138" >32138</option>
<option value="32139" >32139</option>
<option value="32140" >32140</option>
<option value="32141" >32141</option>
<option value="32142" >32142</option>
<option value="32145" >32145</option>
<option value="32147" >32147</option>
<option value="32148" >32148</option>
<option value="32149" >32149</option>
<option value="32157" >32157</option>
<option value="32158" >32158</option>
<option value="32159" >32159</option>
<option value="32160" >32160</option>
<option value="32162" >32162</option>
<option value="32163" >32163</option>
<option value="32164" >32164</option>
<option value="32168" >32168</option>
<option value="32169" >32169</option>
<option value="32170" >32170</option>
<option value="32173" >32173</option>
<option value="32174" >32174</option>
<option value="32175" >32175</option>
<option value="32176" >32176</option>
<option value="32177" >32177</option>
<option value="32178" >32178</option>
<option value="32179" >32179</option>
<option value="32180" >32180</option>
<option value="32181" >32181</option>
<option value="32182" >32182</option>
<option value="32183" >32183</option>
<option value="32185" >32185</option>
<option value="32187" >32187</option>
<option value="32189" >32189</option>
<option value="32190" >32190</option>
<option value="32192" >32192</option>
<option value="32193" >32193</option>
<option value="32195" >32195</option>
<option value="32198" >32198</option>
<option value="32201" >32201</option>
<option value="32202" >32202</option>
<option value="32203" >32203</option>
<option value="32204" >32204</option>
<option value="32205" >32205</option>
<option value="32206" >32206</option>
<option value="32207" >32207</option>
<option value="32208" >32208</option>
<option value="32209" >32209</option>
<option value="32210" >32210</option>
<option value="32211" >32211</option>
<option value="32212" >32212</option>
<option value="32214" >32214</option>
<option value="32215" >32215</option>
<option value="32216" >32216</option>
<option value="32217" >32217</option>
<option value="32218" >32218</option>
<option value="32219" >32219</option>
<option value="32220" >32220</option>
<option value="32221" >32221</option>
<option value="32222" >32222</option>
<option value="32223" >32223</option>
<option value="32224" >32224</option>
<option value="32225" >32225</option>
<option value="32226" >32226</option>
<option value="32227" >32227</option>
<option value="32228" >32228</option>
<option value="32229" >32229</option>
<option value="32230" >32230</option>
<option value="32231" >32231</option>
<option value="32232" >32232</option>
<option value="32233" >32233</option>
<option value="32234" >32234</option>
<option value="32235" >32235</option>
<option value="32236" >32236</option>
<option value="32237" >32237</option>
<option value="32238" >32238</option>
<option value="32239" >32239</option>
<option value="32240" >32240</option>
<option value="32241" >32241</option>
<option value="32244" >32244</option>
<option value="32245" >32245</option>
<option value="32246" >32246</option>
<option value="32247" >32247</option>
<option value="32250" >32250</option>
<option value="32254" >32254</option>
<option value="32255" >32255</option>
<option value="32256" >32256</option>
<option value="32257" >32257</option>
<option value="32258" >32258</option>
<option value="32259" >32259</option>
<option value="32260" >32260</option>
<option value="32266" >32266</option>
<option value="32277" >32277</option>
<option value="32290" >32290</option>
<option value="32301" >32301</option>
<option value="32302" >32302</option>
<option value="32303" >32303</option>
<option value="32304" >32304</option>
<option value="32305" >32305</option>
<option value="32306" >32306</option>
<option value="32307" >32307</option>
<option value="32308" >32308</option>
<option value="32309" >32309</option>
<option value="32310" >32310</option>
<option value="32311" >32311</option>
<option value="32312" >32312</option>
<option value="32313" >32313</option>
<option value="32314" >32314</option>
<option value="32315" >32315</option>
<option value="32316" >32316</option>
<option value="32317" >32317</option>
<option value="32318" >32318</option>
<option value="32320" >32320</option>
<option value="32321" >32321</option>
<option value="32322" >32322</option>
<option value="32323" >32323</option>
<option value="32324" >32324</option>
<option value="32326" >32326</option>
<option value="32327" >32327</option>
<option value="32328" >32328</option>
<option value="32329" >32329</option>
<option value="32330" >32330</option>
<option value="32331" >32331</option>
<option value="32332" >32332</option>
<option value="32333" >32333</option>
<option value="32334" >32334</option>
<option value="32335" >32335</option>
<option value="32336" >32336</option>
<option value="32337" >32337</option>
<option value="32340" >32340</option>
<option value="32341" >32341</option>
<option value="32343" >32343</option>
<option value="32344" >32344</option>
<option value="32345" >32345</option>
<option value="32346" >32346</option>
<option value="32347" >32347</option>
<option value="32348" >32348</option>
<option value="32350" >32350</option>
<option value="32351" >32351</option>
<option value="32352" >32352</option>
<option value="32353" >32353</option>
<option value="32355" >32355</option>
<option value="32356" >32356</option>
<option value="32357" >32357</option>
<option value="32358" >32358</option>
<option value="32359" >32359</option>
<option value="32360" >32360</option>
<option value="32361" >32361</option>
<option value="32362" >32362</option>
<option value="32395" >32395</option>
<option value="32399" >32399</option>
<option value="32401" >32401</option>
<option value="32402" >32402</option>
<option value="32403" >32403</option>
<option value="32404" >32404</option>
<option value="32405" >32405</option>
<option value="32406" >32406</option>
<option value="32407" >32407</option>
<option value="32408" >32408</option>
<option value="32409" >32409</option>
<option value="32410" >32410</option>
<option value="32411" >32411</option>
<option value="32412" >32412</option>
<option value="32413" >32413</option>
<option value="32417" >32417</option>
<option value="32420" >32420</option>
<option value="32421" >32421</option>
<option value="32422" >32422</option>
<option value="32423" >32423</option>
<option value="32424" >32424</option>
<option value="32425" >32425</option>
<option value="32426" >32426</option>
<option value="32427" >32427</option>
<option value="32428" >32428</option>
<option value="32430" >32430</option>
<option value="32431" >32431</option>
<option value="32432" >32432</option>
<option value="32433" >32433</option>
<option value="32434" >32434</option>
<option value="32435" >32435</option>
<option value="32437" >32437</option>
<option value="32438" >32438</option>
<option value="32439" >32439</option>
<option value="32440" >32440</option>
<option value="32442" >32442</option>
<option value="32443" >32443</option>
<option value="32444" >32444</option>
<option value="32445" >32445</option>
<option value="32446" >32446</option>
<option value="32447" >32447</option>
<option value="32448" >32448</option>
<option value="32449" >32449</option>
<option value="32452" >32452</option>
<option value="32455" >32455</option>
<option value="32456" >32456</option>
<option value="32457" >32457</option>
<option value="32459" >32459</option>
<option value="32460" >32460</option>
<option value="32461" >32461</option>
<option value="32462" >32462</option>
<option value="32463" >32463</option>
<option value="32464" >32464</option>
<option value="32465" >32465</option>
<option value="32466" >32466</option>
<option value="32501" >32501</option>
<option value="32502" >32502</option>
<option value="32503" >32503</option>
<option value="32504" >32504</option>
<option value="32505" >32505</option>
<option value="32506" >32506</option>
<option value="32507" >32507</option>
<option value="32508" >32508</option>
<option value="32509" >32509</option>
<option value="32511" >32511</option>
<option value="32512" >32512</option>
<option value="32513" >32513</option>
<option value="32514" >32514</option>
<option value="32516" >32516</option>
<option value="32520" >32520</option>
<option value="32521" >32521</option>
<option value="32522" >32522</option>
<option value="32523" >32523</option>
<option value="32524" >32524</option>
<option value="32526" >32526</option>
<option value="32530" >32530</option>
<option value="32531" >32531</option>
<option value="32533" >32533</option>
<option value="32534" >32534</option>
<option value="32535" >32535</option>
<option value="32536" >32536</option>
<option value="32537" >32537</option>
<option value="32538" >32538</option>
<option value="32539" >32539</option>
<option value="32540" >32540</option>
<option value="32541" >32541</option>
<option value="32542" >32542</option>
<option value="32544" >32544</option>
<option value="32547" >32547</option>
<option value="32548" >32548</option>
<option value="32549" >32549</option>
<option value="32550" >32550</option>
<option value="32559" >32559</option>
<option value="32560" >32560</option>
<option value="32561" >32561</option>
<option value="32562" >32562</option>
<option value="32563" >32563</option>
<option value="32564" >32564</option>
<option value="32565" >32565</option>
<option value="32566" >32566</option>
<option value="32567" >32567</option>
<option value="32568" >32568</option>
<option value="32569" >32569</option>
<option value="32570" >32570</option>
<option value="32571" >32571</option>
<option value="32572" >32572</option>
<option value="32577" >32577</option>
<option value="32578" >32578</option>
<option value="32579" >32579</option>
<option value="32580" >32580</option>
<option value="32583" >32583</option>
<option value="32588" >32588</option>
<option value="32590" >32590</option>
<option value="32591" >32591</option>
<option value="32592" >32592</option>
<option value="32601" >32601</option>
<option value="32602" >32602</option>
<option value="32603" >32603</option>
<option value="32604" >32604</option>
<option value="32605" >32605</option>
<option value="32606" >32606</option>
<option value="32607" >32607</option>
<option value="32608" >32608</option>
<option value="32609" >32609</option>
<option value="32610" >32610</option>
<option value="32611" >32611</option>
<option value="32612" >32612</option>
<option value="32613" >32613</option>
<option value="32614" >32614</option>
<option value="32615" >32615</option>
<option value="32616" >32616</option>
<option value="32617" >32617</option>
<option value="32618" >32618</option>
<option value="32619" >32619</option>
<option value="32621" >32621</option>
<option value="32622" >32622</option>
<option value="32625" >32625</option>
<option value="32626" >32626</option>
<option value="32627" >32627</option>
<option value="32628" >32628</option>
<option value="32631" >32631</option>
<option value="32633" >32633</option>
<option value="32634" >32634</option>
<option value="32635" >32635</option>
<option value="32639" >32639</option>
<option value="32640" >32640</option>


<option value="32641" >32641</option>
<option value="32643" >32643</option>
<option value="32644" >32644</option>
<option value="32648" >32648</option>
<option value="32653" >32653</option>
<option value="32654" >32654</option>
<option value="32655" >32655</option>
<option value="32656" >32656</option>
<option value="32658" >32658</option>
<option value="32662" >32662</option>
<option value="32663" >32663</option>
<option value="32664" >32664</option>
<option value="32666" >32666</option>
<option value="32667" >32667</option>
<option value="32668" >32668</option>
<option value="32669" >32669</option>
<option value="32680" >32680</option>
<option value="32681" >32681</option>
<option value="32683" >32683</option>
<option value="32686" >32686</option>
<option value="32692" >32692</option>
<option value="32693" >32693</option>
<option value="32694" >32694</option>
<option value="32696" >32696</option>
<option value="32697" >32697</option>
<option value="32701" >32701</option>
<option value="32702" >32702</option>
<option value="32703" >32703</option>
<option value="32704" >32704</option>
<option value="32706" >32706</option>
<option value="32707" >32707</option>
<option value="32708" >32708</option>
<option value="32709" >32709</option>
<option value="32710" >32710</option>
<option value="32712" >32712</option>
<option value="32713" >32713</option>
<option value="32714" >32714</option>
<option value="32715" >32715</option>
<option value="32716" >32716</option>
<option value="32718" >32718</option>
<option value="32719" >32719</option>
<option value="32720" >32720</option>
<option value="32721" >32721</option>
<option value="32722" >32722</option>
<option value="32723" >32723</option>
<option value="32724" >32724</option>
<option value="32725" >32725</option>
<option value="32726" >32726</option>
<option value="32727" >32727</option>
<option value="32728" >32728</option>
<option value="32730" >32730</option>
<option value="32732" >32732</option>
<option value="32733" >32733</option>
<option value="32735" >32735</option>
<option value="32736" >32736</option>
<option value="32738" >32738</option>
<option value="32739" >32739</option>
<option value="32744" >32744</option>
<option value="32745" >32745</option>
<option value="32746" >32746</option>
<option value="32747" >32747</option>
<option value="32750" >32750</option>
<option value="32751" >32751</option>
<option value="32752" >32752</option>
<option value="32753" >32753</option>
<option value="32754" >32754</option>
<option value="32756" >32756</option>
<option value="32757" >32757</option>
<option value="32759" >32759</option>
<option value="32762" >32762</option>
<option value="32763" >32763</option>
<option value="32764" >32764</option>
<option value="32765" >32765</option>
<option value="32766" >32766</option>
<option value="32767" >32767</option>
<option value="32768" >32768</option>
<option value="32771" >32771</option>
<option value="32772" >32772</option>
<option value="32773" >32773</option>
<option value="32774" >32774</option>
<option value="32775" >32775</option>
<option value="32776" >32776</option>
<option value="32777" >32777</option>
<option value="32778" >32778</option>
<option value="32779" >32779</option>
<option value="32780" >32780</option>
<option value="32781" >32781</option>
<option value="32782" >32782</option>
<option value="32783" >32783</option>
<option value="32784" >32784</option>
<option value="32789" >32789</option>
<option value="32790" >32790</option>
<option value="32791" >32791</option>
<option value="32792" >32792</option>
<option value="32793" >32793</option>
<option value="32794" >32794</option>
<option value="32795" >32795</option>
<option value="32796" >32796</option>
<option value="32798" >32798</option>
<option value="32799" >32799</option>
<option value="32801" >32801</option>
<option value="32802" >32802</option>
<option value="32803" >32803</option>
<option value="32804" >32804</option>
<option value="32805" >32805</option>
<option value="32806" >32806</option>
<option value="32807" >32807</option>
<option value="32808" >32808</option>
<option value="32809" >32809</option>
<option value="32810" >32810</option>
<option value="32811" >32811</option>
<option value="32812" >32812</option>
<option value="32814" >32814</option>
<option value="32815" >32815</option>
<option value="32816" >32816</option>
<option value="32817" >32817</option>
<option value="32818" >32818</option>
<option value="32819" >32819</option>
<option value="32820" >32820</option>
<option value="32821" >32821</option>
<option value="32822" >32822</option>
<option value="32824" >32824</option>
<option value="32825" >32825</option>
<option value="32826" >32826</option>
<option value="32827" >32827</option>
<option value="32828" >32828</option>
<option value="32829" >32829</option>
<option value="32830" >32830</option>
<option value="32831" >32831</option>
<option value="32832" >32832</option>
<option value="32833" >32833</option>
<option value="32834" >32834</option>
<option value="32835" >32835</option>
<option value="32836" >32836</option>
<option value="32837" >32837</option>
<option value="32839" >32839</option>
<option value="32853" >32853</option>
<option value="32854" >32854</option>
<option value="32855" >32855</option>
<option value="32856" >32856</option>
<option value="32857" >32857</option>
<option value="32858" >32858</option>
<option value="32859" >32859</option>
<option value="32860" >32860</option>
<option value="32861" >32861</option>
<option value="32862" >32862</option>
<option value="32867" >32867</option>
<option value="32868" >32868</option>
<option value="32869" >32869</option>
<option value="32872" >32872</option>
<option value="32877" >32877</option>
<option value="32878" >32878</option>
<option value="32885" >32885</option>
<option value="32886" >32886</option>
<option value="32887" >32887</option>
<option value="32890" >32890</option>
<option value="32891" >32891</option>
<option value="32893" >32893</option>
<option value="32896" >32896</option>
<option value="32897" >32897</option>
<option value="32898" >32898</option>
<option value="32899" >32899</option>
<option value="32901" >32901</option>
<option value="32902" >32902</option>
<option value="32903" >32903</option>
<option value="32904" >32904</option>
<option value="32905" >32905</option>
<option value="32906" >32906</option>
<option value="32907" >32907</option>
<option value="32908" >32908</option>
<option value="32909" >32909</option>
<option value="32910" >32910</option>
<option value="32911" >32911</option>
<option value="32912" >32912</option>
<option value="32919" >32919</option>
<option value="32920" >32920</option>
<option value="32922" >32922</option>
<option value="32923" >32923</option>
<option value="32924" >32924</option>
<option value="32925" >32925</option>
<option value="32926" >32926</option>
<option value="32927" >32927</option>
<option value="32931" >32931</option>
<option value="32932" >32932</option>
<option value="32934" >32934</option>
<option value="32935" >32935</option>
<option value="32936" >32936</option>
<option value="32937" >32937</option>
<option value="32940" >32940</option>
<option value="32941" >32941</option>
<option value="32948" >32948</option>
<option value="32949" >32949</option>
<option value="32950" >32950</option>
<option value="32951" >32951</option>
<option value="32952" >32952</option>
<option value="32953" >32953</option>
<option value="32954" >32954</option>
<option value="32955" >32955</option>
<option value="32956" >32956</option>
<option value="32957" >32957</option>
<option value="32958" >32958</option>
<option value="32959" >32959</option>
<option value="32960" >32960</option>
<option value="32961" >32961</option>
<option value="32962" >32962</option>
<option value="32963" >32963</option>
<option value="32964" >32964</option>
<option value="32965" >32965</option>
<option value="32966" >32966</option>
<option value="32967" >32967</option>

<option value="32968" >32968</option>
<option value="32969" >32969</option>
<option value="32970" >32970</option>
<option value="32971" >32971</option>
<option value="32976" >32976</option>
<option value="32978" >32978</option>
<option value="33001" >33001</option>
<option value="33002" >33002</option>
<option value="33004" >33004</option>
<option value="33008" >33008</option>
<option value="33009" >33009</option>
<option value="33010" >33010</option>
<option value="33011" >33011</option>
<option value="33012" >33012</option>
<option value="33013" >33013</option>
<option value="33014" >33014</option>
<option value="33015" >33015</option>
<option value="33016" >33016</option>
<option value="33017" >33017</option>
<option value="33018" >33018</option>
<option value="33019" >33019</option>
<option value="33020" >33020</option>
<option value="33021" >33021</option>
<option value="33022" >33022</option>
<option value="33023" >33023</option>
<option value="33024" >33024</option>
<option value="33025" >33025</option>
<option value="33026" >33026</option>
<option value="33027" >33027</option>
<option value="33028" >33028</option>
<option value="33029" >33029</option>
<option value="33030" >33030</option>
<option value="33031" >33031</option>
<option value="33032" >33032</option>
<option value="33033" >33033</option>
<option value="33034" >33034</option>
<option value="33035" >33035</option>
<option value="33036" >33036</option>
<option value="33037" >33037</option>
<option value="33039" >33039</option>
<option value="33040" >33040</option>
<option value="33041" >33041</option>
<option value="33042" >33042</option>
<option value="33043" >33043</option>
<option value="33045" >33045</option>
<option value="33050" >33050</option>
<option value="33051" >33051</option>
<option value="33052" >33052</option>
<option value="33054" >33054</option>
<option value="33055" >33055</option>
<option value="33056" >33056</option>
<option value="33060" >33060</option>
<option value="33061" >33061</option>
<option value="33062" >33062</option>
<option value="33063" >33063</option>
<option value="33064" >33064</option>
<option value="33065" >33065</option>
<option value="33066" >33066</option>
<option value="33067" >33067</option>
<option value="33068" >33068</option>
<option value="33069" >33069</option>
<option value="33070" >33070</option>
<option value="33071" >33071</option>
<option value="33072" >33072</option>
<option value="33073" >33073</option>
<option value="33074" >33074</option>
<option value="33075" >33075</option>
<option value="33076" >33076</option>
<option value="33077" >33077</option>
<option value="33081" >33081</option>
<option value="33082" >33082</option>
<option value="33083" >33083</option>
<option value="33084" >33084</option>
<option value="33090" >33090</option>
<option value="33092" >33092</option>
<option value="33093" >33093</option>
<option value="33097" >33097</option>
<option value="33101" >33101</option>
<option value="33102" >33102</option>
<option value="33107" >33107</option>
<option value="33109" >33109</option>
<option value="33110" >33110</option>
<option value="33111" >33111</option>
<option value="33112" >33112</option>
<option value="33114" >33114</option>
<option value="33116" >33116</option>
<option value="33119" >33119</option>
<option value="33121" >33121</option>
<option value="33122" >33122</option>
<option value="33124" >33124</option>
<option value="33125" >33125</option>
<option value="33126" >33126</option>
<option value="33127" >33127</option>
<option value="33128" >33128</option>
<option value="33129" >33129</option>
<option value="33130" >33130</option>
<option value="33131" >33131</option>
<option value="33132" >33132</option>
<option value="33133" >33133</option>
<option value="33134" >33134</option>
<option value="33135" >33135</option>
<option value="33136" >33136</option>
<option value="33137" >33137</option>
<option value="33138" >33138</option>
<option value="33139" >33139</option>

<option value="33140" >33140</option>
<option value="33141" >33141</option>
<option value="33142" >33142</option>
<option value="33143" >33143</option>
<option value="33144" >33144</option>
<option value="33145" >33145</option>
<option value="33146" >33146</option>
<option value="33147" >33147</option>
<option value="33148" >33148</option>
<option value="33149" >33149</option>
<option value="33150" >33150</option>
<option value="33151" >33151</option>
<option value="33152" >33152</option>
<option value="33153" >33153</option>
<option value="33154" >33154</option>
<option value="33155" >33155</option>
<option value="33156" >33156</option>
<option value="33157" >33157</option>
<option value="33158" >33158</option>
<option value="33159" >33159</option>
<option value="33160" >33160</option>
<option value="33161" >33161</option>
<option value="33162" >33162</option>
<option value="33163" >33163</option>
<option value="33164" >33164</option>
<option value="33165" >33165</option>
<option value="33166" >33166</option>
<option value="33167" >33167</option>
<option value="33168" >33168</option>
<option value="33169" >33169</option>
<option value="33170" >33170</option>
<option value="33172" >33172</option>
<option value="33173" >33173</option>
<option value="33174" >33174</option>
<option value="33175" >33175</option>
<option value="33176" >33176</option>
<option value="33177" >33177</option>
<option value="33178" >33178</option>
<option value="33179" >33179</option>
<option value="33180" >33180</option>
<option value="33181" >33181</option>
<option value="33182" >33182</option>
<option value="33183" >33183</option>
<option value="33184" >33184</option>
<option value="33185" >33185</option>
<option value="33186" >33186</option>
<option value="33187" >33187</option>
<option value="33188" >33188</option>
<option value="33189" >33189</option>
<option value="33190" >33190</option>
<option value="33193" >33193</option>
<option value="33194" >33194</option>
<option value="33195" >33195</option>
<option value="33196" >33196</option>
<option value="33197" >33197</option>
<option value="33199" >33199</option>
<option value="33222" >33222</option>
<option value="33231" >33231</option>
<option value="33233" >33233</option>
<option value="33234" >33234</option>
<option value="33238" >33238</option>
<option value="33239" >33239</option>
<option value="33242" >33242</option>
<option value="33243" >33243</option>
<option value="33245" >33245</option>
<option value="33247" >33247</option>
<option value="33255" >33255</option>
<option value="33256" >33256</option>
<option value="33257" >33257</option>
<option value="33261" >33261</option>
<option value="33265" >33265</option>
<option value="33266" >33266</option>
<option value="33269" >33269</option>
<option value="33280" >33280</option>
<option value="33283" >33283</option>
<option value="33296" >33296</option>
<option value="33299" >33299</option>
<option value="33301" >33301</option>
<option value="33302" >33302</option>
<option value="33303" >33303</option>
<option value="33304" >33304</option>
<option value="33305" >33305</option>
<option value="33306" >33306</option>
<option value="33307" >33307</option>
<option value="33308" >33308</option>
<option value="33309" >33309</option>
<option value="33310" >33310</option>
<option value="33311" >33311</option>
<option value="33312" >33312</option>
<option value="33313" >33313</option>
<option value="33314" >33314</option>
<option value="33315" >33315</option>
<option value="33316" >33316</option>
<option value="33317" >33317</option>
<option value="33318" >33318</option>
<option value="33319" >33319</option>
<option value="33320" >33320</option>
<option value="33321" >33321</option>
<option value="33322" >33322</option>
<option value="33323" >33323</option>
<option value="33324" >33324</option>
<option value="33325" >33325</option>
<option value="33326" >33326</option>
<option value="33327" >33327</option>
<option value="33328" >33328</option>

<option value="33329" >33329</option>
<option value="33330" >33330</option>
<option value="33331" >33331</option>
<option value="33332" >33332</option>
<option value="33334" >33334</option>
<option value="33335" >33335</option>
<option value="33336" >33336</option>
<option value="33337" >33337</option>
<option value="33338" >33338</option>
<option value="33339" >33339</option>
<option value="33340" >33340</option>
<option value="33345" >33345</option>
<option value="33346" >33346</option>
<option value="33348" >33348</option>
<option value="33349" >33349</option>
<option value="33351" >33351</option>
<option value="33355" >33355</option>
<option value="33359" >33359</option>
<option value="33388" >33388</option>
<option value="33394" >33394</option>
<option value="33401" >33401</option>
<option value="33402" >33402</option>
<option value="33403" >33403</option>
<option value="33404" >33404</option>
<option value="33405" >33405</option>
<option value="33406" >33406</option>
<option value="33407" >33407</option>
<option value="33408" >33408</option>
<option value="33409" >33409</option>
<option value="33410" >33410</option>
<option value="33411" >33411</option>
<option value="33412" >33412</option>
<option value="33413" >33413</option>
<option value="33414" >33414</option>
<option value="33415" >33415</option>
<option value="33416" >33416</option>
<option value="33417" >33417</option>
<option value="33418" >33418</option>
<option value="33419" >33419</option>
<option value="33420" >33420</option>
<option value="33421" >33421</option>
<option value="33422" >33422</option>
<option value="33424" >33424</option>
<option value="33425" >33425</option>
<option value="33426" >33426</option>
<option value="33427" >33427</option>
<option value="33428" >33428</option>
<option value="33429" >33429</option>
<option value="33430" >33430</option>
<option value="33431" >33431</option>
<option value="33432" >33432</option>
<option value="33433" >33433</option>
<option value="33434" >33434</option>
<option value="33435" >33435</option>
<option value="33436" >33436</option>
<option value="33437" >33437</option>
<option value="33438" >33438</option>
<option value="33439" >33439</option>
<option value="33440" >33440</option>
<option value="33441" >33441</option>
<option value="33442" >33442</option>
<option value="33443" >33443</option>
<option value="33444" >33444</option>
<option value="33445" >33445</option>
<option value="33446" >33446</option>
<option value="33447" >33447</option>
<option value="33448" >33448</option>
<option value="33449" >33449</option>
<option value="33454" >33454</option>
<option value="33455" >33455</option>
<option value="33458" >33458</option>
<option value="33459" >33459</option>
<option value="33460" >33460</option>
<option value="33461" >33461</option>
<option value="33462" >33462</option>
<option value="33463" >33463</option>
<option value="33464" >33464</option>
<option value="33465" >33465</option>
<option value="33466" >33466</option>
<option value="33467" >33467</option>
<option value="33468" >33468</option>
<option value="33469" >33469</option>
<option value="33470" >33470</option>
<option value="33471" >33471</option>
<option value="33472" >33472</option>
<option value="33473" >33473</option>
<option value="33474" >33474</option>
<option value="33475" >33475</option>
<option value="33476" >33476</option>
<option value="33477" >33477</option>
<option value="33478" >33478</option>
<option value="33480" >33480</option>
<option value="33481" >33481</option>
<option value="33482" >33482</option>
<option value="33483" >33483</option>
<option value="33484" >33484</option>
<option value="33486" >33486</option>
<option value="33487" >33487</option>
<option value="33488" >33488</option>
<option value="33493" >33493</option>
<option value="33496" >33496</option>
<option value="33497" >33497</option>
<option value="33498" >33498</option>
<option value="33499" >33499</option>
<option value="33503" >33503</option>
<option value="33508" >33508</option>
<option value="33509" >33509</option>
<option value="33510" >33510</option>
<option value="33511" >33511</option>
<option value="33513" >33513</option>
<option value="33514" >33514</option>
<option value="33521" >33521</option>
<option value="33523" >33523</option>
<option value="33524" >33524</option>
<option value="33525" >33525</option>
<option value="33526" >33526</option>
<option value="33527" >33527</option>
<option value="33530" >33530</option>
<option value="33534" >33534</option>
<option value="33537" >33537</option>
<option value="33538" >33538</option>
<option value="33539" >33539</option>
<option value="33540" >33540</option>
<option value="33541" >33541</option>
<option value="33542" >33542</option>
<option value="33543" >33543</option>
<option value="33544" >33544</option>
<option value="33545" >33545</option>
<option value="33547" >33547</option>
<option value="33548" >33548</option>
<option value="33549" >33549</option>
<option value="33550" >33550</option>
<option value="33556" >33556</option>
<option value="33558" >33558</option>
<option value="33559" >33559</option>
<option value="33563" >33563</option>
<option value="33564" >33564</option>
<option value="33565" >33565</option>
<option value="33566" >33566</option>
<option value="33567" >33567</option>
<option value="33568" >33568</option>
<option value="33569" >33569</option>
<option value="33570" >33570</option>
<option value="33571" >33571</option>
<option value="33572" >33572</option>
<option value="33573" >33573</option>
<option value="33574" >33574</option>
<option value="33575" >33575</option>
<option value="33576" >33576</option>
<option value="33578" >33578</option>
<option value="33579" >33579</option>
<option value="33583" >33583</option>
<option value="33584" >33584</option>
<option value="33585" >33585</option>
<option value="33586" >33586</option>
<option value="33587" >33587</option>
<option value="33592" >33592</option>
<option value="33593" >33593</option>
<option value="33594" >33594</option>
<option value="33595" >33595</option>
<option value="33596" >33596</option>
<option value="33597" >33597</option>
<option value="33598" >33598</option>
<option value="33601" >33601</option>
<option value="33602" >33602</option>
<option value="33603" >33603</option>
<option value="33604" >33604</option>
<option value="33605" >33605</option>
<option value="33606" >33606</option>
<option value="33607" >33607</option>
<option value="33608" >33608</option>
<option value="33609" >33609</option>
<option value="33610" >33610</option>
<option value="33611" >33611</option>
<option value="33612" >33612</option>
<option value="33613" >33613</option>
<option value="33614" >33614</option>
<option value="33615" >33615</option>
<option value="33616" >33616</option>
<option value="33617" >33617</option>
<option value="33618" >33618</option>
<option value="33619" >33619</option>
<option value="33620" >33620</option>
<option value="33621" >33621</option>
<option value="33622" >33622</option>
<option value="33623" >33623</option>
<option value="33624" >33624</option>
<option value="33625" >33625</option>
<option value="33626" >33626</option>
<option value="33629" >33629</option>
<option value="33630" >33630</option>
<option value="33631" >33631</option>
<option value="33633" >33633</option>
<option value="33634" >33634</option>
<option value="33635" >33635</option>
<option value="33637" >33637</option>
<option value="33646" >33646</option>
<option value="33647" >33647</option>
<option value="33650" >33650</option>
<option value="33651" >33651</option>
<option value="33655" >33655</option>
<option value="33660" >33660</option>
<option value="33661" >33661</option>
<option value="33662" >33662</option>
<option value="33663" >33663</option>
<option value="33664" >33664</option>
<option value="33672" >33672</option>
<option value="33673" >33673</option>
<option value="33674" >33674</option>
<option value="33675" >33675</option>
<option value="33677" >33677</option>
<option value="33679" >33679</option>
<option value="33680" >33680</option>
<option value="33681" >33681</option>
<option value="33682" >33682</option>
<option value="33684" >33684</option>
<option value="33685" >33685</option>
<option value="33686" >33686</option>
<option value="33687" >33687</option>
<option value="33688" >33688</option>
<option value="33689" >33689</option>
<option value="33690" >33690</option>
<option value="33694" >33694</option>
<option value="33701" >33701</option>
<option value="33702" >33702</option>
<option value="33703" >33703</option>
<option value="33704" >33704</option>
<option value="33705" >33705</option>
<option value="33706" >33706</option>
<option value="33707" >33707</option>
<option value="33708" >33708</option>
<option value="33709" >33709</option>
<option value="33710" >33710</option>
<option value="33711" >33711</option>
<option value="33712" >33712</option>
<option value="33713" >33713</option>
<option value="33714" >33714</option>
<option value="33715" >33715</option>
<option value="33716" >33716</option>
<option value="33729" >33729</option>
<option value="33730" >33730</option>
<option value="33731" >33731</option>
<option value="33732" >33732</option>
<option value="33733" >33733</option>
<option value="33734" >33734</option>
<option value="33736" >33736</option>
<option value="33737" >33737</option>
<option value="33738" >33738</option>
<option value="33740" >33740</option>
<option value="33741" >33741</option>
<option value="33742" >33742</option>
<option value="33743" >33743</option>
<option value="33744" >33744</option>
<option value="33747" >33747</option>
<option value="33755" >33755</option>
<option value="33756" >33756</option>
<option value="33757" >33757</option>
<option value="33758" >33758</option>
<option value="33759" >33759</option>
<option value="33760" >33760</option>
<option value="33761" >33761</option>
<option value="33762" >33762</option>
<option value="33763" >33763</option>
<option value="33764" >33764</option>
<option value="33765" >33765</option>
<option value="33766" >33766</option>
<option value="33767" >33767</option>
<option value="33769" >33769</option>
<option value="33770" >33770</option>
<option value="33771" >33771</option>
<option value="33772" >33772</option>
<option value="33773" >33773</option>
<option value="33774" >33774</option>
<option value="33775" >33775</option>
<option value="33776" >33776</option>
<option value="33777" >33777</option>
<option value="33778" >33778</option>
<option value="33779" >33779</option>
<option value="33780" >33780</option>
<option value="33781" >33781</option>
<option value="33782" >33782</option>
<option value="33784" >33784</option>
<option value="33785" >33785</option>
<option value="33786" >33786</option>
<option value="33801" >33801</option>
<option value="33802" >33802</option>
<option value="33803" >33803</option>
<option value="33804" >33804</option>
<option value="33805" >33805</option>
<option value="33806" >33806</option>
<option value="33807" >33807</option>
<option value="33809" >33809</option>
<option value="33810" >33810</option>
<option value="33811" >33811</option>
<option value="33812" >33812</option>
<option value="33813" >33813</option>
<option value="33815" >33815</option>
<option value="33820" >33820</option>
<option value="33823" >33823</option>
<option value="33825" >33825</option>
<option value="33826" >33826</option>
<option value="33827" >33827</option>
<option value="33830" >33830</option>
<option value="33831" >33831</option>
<option value="33834" >33834</option>
<option value="33835" >33835</option>
<option value="33836" >33836</option>
<option value="33837" >33837</option>
<option value="33838" >33838</option>
<option value="33839" >33839</option>
<option value="33840" >33840</option>
<option value="33841" >33841</option>
<option value="33843" >33843</option>
<option value="33844" >33844</option>
<option value="33845" >33845</option>
<option value="33846" >33846</option>
<option value="33847" >33847</option>
<option value="33848" >33848</option>
<option value="33849" >33849</option>
<option value="33850" >33850</option>
<option value="33851" >33851</option>
<option value="33852" >33852</option>
<option value="33853" >33853</option>
<option value="33854" >33854</option>
<option value="33855" >33855</option>
<option value="33856" >33856</option>
<option value="33857" >33857</option>
<option value="33858" >33858</option>
<option value="33859" >33859</option>
<option value="33860" >33860</option>
<option value="33862" >33862</option>
<option value="33863" >33863</option>
<option value="33865" >33865</option>
<option value="33867" >33867</option>
<option value="33868" >33868</option>
<option value="33870" >33870</option>
<option value="33871" >33871</option>
<option value="33872" >33872</option>
<option value="33873" >33873</option>
<option value="33875" >33875</option>
<option value="33876" >33876</option>
<option value="33877" >33877</option>
<option value="33880" >33880</option>
<option value="33881" >33881</option>
<option value="33882" >33882</option>
<option value="33883" >33883</option>
<option value="33884" >33884</option>
<option value="33885" >33885</option>
<option value="33888" >33888</option>
<option value="33890" >33890</option>
<option value="33896" >33896</option>
<option value="33897" >33897</option>
<option value="33898" >33898</option>
<option value="33900" >33900</option>
<option value="33901" >33901</option>
<option value="33902" >33902</option>
<option value="33903" >33903</option>
<option value="33904" >33904</option>
<option value="33905" >33905</option>
<option value="33906" >33906</option>
<option value="33907" >33907</option>
<option value="33908" >33908</option>
<option value="33909" >33909</option>
<option value="33910" >33910</option>
<option value="33911" >33911</option>
<option value="33912" >33912</option>
<option value="33913" >33913</option>
<option value="33914" >33914</option>
<option value="33915" >33915</option>
<option value="33916" >33916</option>
<option value="33917" >33917</option>
<option value="33918" >33918</option>
<option value="33919" >33919</option>
<option value="33920" >33920</option>
<option value="33921" >33921</option>
<option value="33922" >33922</option>
<option value="33924" >33924</option>
<option value="33927" >33927</option>
<option value="33928" >33928</option>
<option value="33929" >33929</option>
<option value="33930" >33930</option>
<option value="33931" >33931</option>
<option value="33932" >33932</option>
<option value="33935" >33935</option>
<option value="33936" >33936</option>
<option value="33938" >33938</option>
<option value="33944" >33944</option>
<option value="33945" >33945</option>
<option value="33946" >33946</option>
<option value="33947" >33947</option>
<option value="33948" >33948</option>
<option value="33949" >33949</option>
<option value="33950" >33950</option>
<option value="33951" >33951</option>
<option value="33952" >33952</option>
<option value="33953" >33953</option>
<option value="33954" >33954</option>
<option value="33955" >33955</option>
<option value="33956" >33956</option>
<option value="33957" >33957</option>
<option value="33960" >33960</option>
<option value="33965" >33965</option>
<option value="33966" >33966</option>
<option value="33967" >33967</option>
<option value="33970" >33970</option>
<option value="33971" >33971</option>
<option value="33972" >33972</option>
<option value="33973" >33973</option>
<option value="33974" >33974</option>
<option value="33975" >33975</option>
<option value="33976" >33976</option>
<option value="33980" >33980</option>
<option value="33981" >33981</option>
<option value="33982" >33982</option>
<option value="33983" >33983</option>
<option value="33990" >33990</option>
<option value="33991" >33991</option>
<option value="33993" >33993</option>
<option value="33994" >33994</option>
<option value="34101" >34101</option>

<option value="34102" >34102</option>
<option value="34103" >34103</option>
<option value="34104" >34104</option>
<option value="34105" >34105</option>
<option value="34106" >34106</option>
<option value="34107" >34107</option>
<option value="34108" >34108</option>
<option value="34109" >34109</option>
<option value="34110" >34110</option>
<option value="34112" >34112</option>
<option value="34113" >34113</option>
<option value="34114" >34114</option>
<option value="34116" >34116</option>
<option value="34117" >34117</option>
<option value="34119" >34119</option>
<option value="34120" >34120</option>
<option value="34133" >34133</option>
<option value="34134" >34134</option>
<option value="34135" >34135</option>
<option value="34136" >34136</option>
<option value="34137" >34137</option>
<option value="34138" >34138</option>
<option value="34139" >34139</option>
<option value="34140" >34140</option>
<option value="34141" >34141</option>
<option value="34142" >34142</option>
<option value="34143" >34143</option>
<option value="34145" >34145</option>
<option value="34146" >34146</option>
<option value="34201" >34201</option>
<option value="34202" >34202</option>
<option value="34203" >34203</option>
<option value="34204" >34204</option>
<option value="34205" >34205</option>
<option value="34206" >34206</option>
<option value="34207" >34207</option>
<option value="34208" >34208</option>
<option value="34209" >34209</option>
<option value="34210" >34210</option>
<option value="34211" >34211</option>
<option value="34212" >34212</option>
<option value="34215" >34215</option>
<option value="34216" >34216</option>
<option value="34217" >34217</option>
<option value="34218" >34218</option>
<option value="34219" >34219</option>
<option value="34220" >34220</option>
<option value="34221" >34221</option>
<option value="34222" >34222</option>
<option value="34223" >34223</option>
<option value="34224" >34224</option>
<option value="34228" >34228</option>
<option value="34229" >34229</option>
<option value="34230" >34230</option>
<option value="34231" >34231</option>
<option value="34232" >34232</option>
<option value="34233" >34233</option>
<option value="34234" >34234</option>
<option value="34235" >34235</option>
<option value="34236" >34236</option>
<option value="34237" >34237</option>
<option value="34238" >34238</option>
<option value="34239" >34239</option>
<option value="34240" >34240</option>
<option value="34241" >34241</option>
<option value="34242" >34242</option>
<option value="34243" >34243</option>
<option value="34250" >34250</option>
<option value="34251" >34251</option>
<option value="34260" >34260</option>
<option value="34264" >34264</option>
<option value="34265" >34265</option>
<option value="34266" >34266</option>
<option value="34267" >34267</option>
<option value="34268" >34268</option>
<option value="34269" >34269</option>
<option value="34270" >34270</option>
<option value="34272" >34272</option>
<option value="34274" >34274</option>
<option value="34275" >34275</option>
<option value="34276" >34276</option>
<option value="34277" >34277</option>
<option value="34278" >34278</option>
<option value="34280" >34280</option>
<option value="34281" >34281</option>
<option value="34282" >34282</option>
<option value="34284" >34284</option>
<option value="34285" >34285</option>
<option value="34286" >34286</option>
<option value="34287" >34287</option>
<option value="34288" >34288</option>
<option value="34289" >34289</option>
<option value="34290" >34290</option>
<option value="34291" >34291</option>
<option value="34292" >34292</option>
<option value="34293" >34293</option>
<option value="34295" >34295</option>
<option value="34420" >34420</option>
<option value="34421" >34421</option>
<option value="34423" >34423</option>
<option value="34428" >34428</option>
<option value="34429" >34429</option>
<option value="34430" >34430</option>
<option value="34431" >34431</option>
<option value="34432" >34432</option>
<option value="34433" >34433</option>
<option value="34434" >34434</option>
<option value="34436" >34436</option>
<option value="34442" >34442</option>
<option value="34445" >34445</option>
<option value="34446" >34446</option>
<option value="34447" >34447</option>
<option value="34448" >34448</option>
<option value="34449" >34449</option>
<option value="34450" >34450</option>
<option value="34451" >34451</option>
<option value="34452" >34452</option>
<option value="34453" >34453</option>
<option value="34460" >34460</option>
<option value="34461" >34461</option>
<option value="34464" >34464</option>
<option value="34465" >34465</option>
<option value="34470" >34470</option>
<option value="34471" >34471</option>
<option value="34472" >34472</option>
<option value="34473" >34473</option>
<option value="34474" >34474</option>
<option value="34475" >34475</option>
<option value="34476" >34476</option>
<option value="34477" >34477</option>
<option value="34478" >34478</option>
<option value="34479" >34479</option>
<option value="34480" >34480</option>
<option value="34481" >34481</option>
<option value="34482" >34482</option>
<option value="34483" >34483</option>
<option value="34484" >34484</option>
<option value="34487" >34487</option>
<option value="34488" >34488</option>
<option value="34489" >34489</option>
<option value="34491" >34491</option>
<option value="34492" >34492</option>
<option value="34498" >34498</option>
<option value="34601" >34601</option>
<option value="34602" >34602</option>
<option value="34603" >34603</option>
<option value="34604" >34604</option>
<option value="34605" >34605</option>
<option value="34606" >34606</option>
<option value="34607" >34607</option>
<option value="34608" >34608</option>
<option value="34609" >34609</option>
<option value="34610" >34610</option>
<option value="34611" >34611</option>
<option value="34613" >34613</option>
<option value="34614" >34614</option>
<option value="34636" >34636</option>
<option value="34637" >34637</option>
<option value="34638" >34638</option>
<option value="34639" >34639</option>
<option value="34652" >34652</option>
<option value="34653" >34653</option>
<option value="34654" >34654</option>
<option value="34655" >34655</option>
<option value="34656" >34656</option>
<option value="34660" >34660</option>
<option value="34661" >34661</option>
<option value="34667" >34667</option>
<option value="34668" >34668</option>
<option value="34669" >34669</option>
<option value="34673" >34673</option>
<option value="34674" >34674</option>
<option value="34677" >34677</option>
<option value="34679" >34679</option>
<option value="34680" >34680</option>
<option value="34681" >34681</option>
<option value="34682" >34682</option>
<option value="34683" >34683</option>
<option value="34684" >34684</option>
<option value="34685" >34685</option>
<option value="34688" >34688</option>
<option value="34689" >34689</option>
<option value="34690" >34690</option>
<option value="34691" >34691</option>
<option value="34692" >34692</option>
<option value="34695" >34695</option>
<option value="34697" >34697</option>
<option value="34698" >34698</option>
<option value="34705" >34705</option>
<option value="34711" >34711</option>
<option value="34712" >34712</option>
<option value="34713" >34713</option>
<option value="34714" >34714</option>
<option value="34715" >34715</option>
<option value="34729" >34729</option>
<option value="34731" >34731</option>
<option value="34734" >34734</option>
<option value="34736" >34736</option>
<option value="34737" >34737</option>
<option value="34739" >34739</option>
<option value="34740" >34740</option>
<option value="34741" >34741</option>
<option value="34742" >34742</option>
<option value="34743" >34743</option>
<option value="34744" >34744</option>
<option value="34745" >34745</option>
<option value="34746" >34746</option>
<option value="34747" >34747</option>
<option value="34748" >34748</option>
<option value="34749" >34749</option>
<option value="34753" >34753</option>
<option value="34755" >34755</option>
<option value="34756" >34756</option>
<option value="34758" >34758</option>
<option value="34759" >34759</option>
<option value="34760" >34760</option>
<option value="34761" >34761</option>
<option value="34762" >34762</option>
<option value="34769" >34769</option>
<option value="34770" >34770</option>
<option value="34771" >34771</option>
<option value="34772" >34772</option>
<option value="34773" >34773</option>
<option value="34777" >34777</option>
<option value="34778" >34778</option>
<option value="34785" >34785</option>
<option value="34786" >34786</option>
<option value="34787" >34787</option>
<option value="34788" >34788</option>
<option value="34789" >34789</option>
<option value="34797" >34797</option>
<option value="34945" >34945</option>
<option value="34946" >34946</option>
<option value="34947" >34947</option>
<option value="34948" >34948</option>
<option value="34949" >34949</option>
<option value="34950" >34950</option>
<option value="34951" >34951</option>
<option value="34952" >34952</option>
<option value="34953" >34953</option>
<option value="34954" >34954</option>
<option value="34956" >34956</option>
<option value="34957" >34957</option>
<option value="34958" >34958</option>
<option value="34972" >34972</option>
<option value="34973" >34973</option>
<option value="34974" >34974</option>
<option value="34979" >34979</option>
<option value="34981" >34981</option>
<option value="34982" >34982</option>
<option value="34983" >34983</option>
<option value="34984" >34984</option>
<option value="34985" >34985</option>
<option value="34986" >34986</option>
<option value="34987" >34987</option>
<option value="34988" >34988</option>
<option value="34990" >34990</option>
<option value="34991" >34991</option>
<option value="34992" >34992</option>
<option value="34994" >34994</option>
<option value="34995" >34995</option>
<option value="34996" >34996</option>
<option value="34997" >34997</option>
</td>
<td align="left" valign="top"  bgcolor="#e9e9e9"><select name="property_county" onchange="submit_form();" style="font-size: 9;
font-family: verdana;
font-style: normal;
color: blue;
background-color: e6e6e6;
border-color: e6e6e6;
border-left-width: thin;
border-right-width: thin;
border-top-width: thin;
border-bottom-width: thin;
border-width: thin;
border-style: bar;
clear: none;  width=150">
<option value="">Select</option>
<option value="Clay" selected>Clay</option>
</td>
<td align="left" valign="top"  bgcolor="#e9e9e9"><select name="property_city" onchange="submit_form();" style="font-size: 9;
font-family: verdana;
font-style: normal;
color: blue;
background-color: e6e6e6;
border-color: e6e6e6;
border-left-width: thin;
border-right-width: thin;
border-top-width: thin;
border-bottom-width: thin;
border-width: thin;
border-style: bar;
clear: none;  width=120">
<option value="">Select</option>
<option value="Green Cove Springs" selected>Green Cove Springs</option>
</td>
<td align="left" valign="top"  bgcolor="#e9e9e9"><input type="text" name="loan_amount" value="200000" style="font-size: 9;
font-family: verdana;
font-style: normal;
color: blue;
background-color: e6e6e6;
border-color: e6e6e6;
border-left-width: thin;
border-right-width: thin;
border-top-width: thin;
border-bottom-width: thin;
border-width: thin;
border-style: bar;
clear: none;  width=140"></td>
</tr>
<tr>
<td colspan="3">&nbsp;</td>
<td  bgcolor="#e9e9e9">Previous Loan Month</td>
<td  bgcolor="#e9e9e9">Previous Loan Year</td>
<td align="left"  bgcolor="#e9e9e9" width="140">Previous Loan Amount</td>
</tr>
<tr>
<td colspan="2"><input type="hidden" name="fee_submit" value="">
&nbsp;<input type="button" value="Calculate Fees" name="fee_submit_button"  style="font-size: 12;
font-family: verdana;
font-style: normal;
color: black;
border-color: gray;
border-left-width: thin;
border-right-width: thin;
border-top-width: thin;
border-bottom-width: thin;
border-width: thin;
border-style: bar;
clear: none; background-color:#ffcc66" onClick="document.form.current_orders.value = 0;document.form.update_this_title_id.value = 0;document.form.update_this_prop_id.value = 0;return Validate_Form();"></td>
<td width="60">&nbsp;</td>
<td align="left"  bgcolor="#e9e9e9"><select name="previous_loan_month" onchange="submit_form();" style="font-size: 9;
font-family: verdana;
font-style: normal;
color: blue;
background-color: e6e6e6;
border-color: e6e6e6;
border-left-width: thin;
border-right-width: thin;
border-top-width: thin;
border-bottom-width: thin;
border-width: thin;
border-style: bar;
clear: none;width=150">
<option value="" selected>Select</option>
<option value="1" selected>January</option>
<option value="2" >February</option>
<option value="3" >March</option>
<option value="4" >April</option>
<option value="5" >May</option>
<option value="6" >June</option>
<option value="7" >July</option>
<option value="8" >August</option>
<option value="9" >September</option>
<option value="10" >October</option>
<option value="11" >November</option>
<option value="12" >December</option>
</select></td>
<td align="left"  bgcolor="#e9e9e9"><input type="text" name="previous_loan_year" value="2006" style="font-size: 9;
font-family: verdana;
font-style: normal;
color: blue;
background-color: e6e6e6;
border-color: e6e6e6;
border-left-width: thin;
border-right-width: thin;
border-top-width: thin;
border-bottom-width: thin;
border-width: thin;
border-style: bar;
clear: none;  width=100"></td>
<td align="left"  bgcolor="#e9e9e9"><input type="text" name="previous_loan_amount" value="170000" style="font-size: 9;
font-family: verdana;
font-style: normal;
color: blue;
background-color: e6e6e6;
border-color: e6e6e6;
border-left-width: thin;
border-right-width: thin;
border-top-width: thin;
border-bottom-width: thin;
border-width: thin;
border-style: bar;
clear: none;  width=140"></td>
</tr>
<tr><td colspan="6" align="right">Was the previous policy issued to the same lender?&nbsp;&nbsp;<input type="radio" name="same_lender" value="1" checked>Yes&nbsp;&nbsp;&nbsp;<input type="radio" name="same_lender" value="0" >No
</td></tr>
<input type="hidden" name="reissue_rates" value="0">
<input type="hidden" name="jlp_policy" value="0">
</table>
</td></tr></table>
<br>
<table><tr>
<td valign="top"><input type="button" value="Apply This Calculation to a Current Order" name="apply_current_orders_button"  style="font-size: 12;
font-family: verdana;
font-style: normal;
color: black;
border-color: gray;
border-left-width: thin;
border-right-width: thin;
border-top-width: thin;
border-bottom-width: thin;
border-width: thin;
border-style: bar;
clear: none; background-color:#ffcc66; width:275px;" onClick="document.form.current_orders.value = 1;document.form.update_this_title_id.value = 0;document.form.update_this_prop_id.value = 0;return Validate_Form();"><br>
<td valign="top">
<input type="button" value="Create Good Faith Estimate" name="create_gfe"  style="font-size: 12;
font-family: verdana;
font-style: normal;
color: black;
border-color: gray;
border-left-width: thin;
border-right-width: thin;
border-top-width: thin;
border-bottom-width: thin;
border-width: thin;
border-style: bar;
clear: none; background-color:#ffcc66; width: 185px;" onClick="document.form.current_orders.value = 1;document.form.update_this_title_id.value = 0;document.form.update_this_prop_id.value = 0;document.calc_form.submit();">
<td valign="top">
<form action="index_cc.cfm" method="post" name="postform">
<input type="submit" value="Place Title Order" name="place_order"  style="font-size: 12;
font-family: verdana;
font-style: normal;
color: white;
border-color: gray;
border-left-width: thin;
border-right-width: thin;
border-top-width: thin;
border-bottom-width: thin;
border-width: thin;
border-style: bar;
clear: none; background-color:#990000" onclick="document.form.current_orders.value = 0; document.calc_form.action = 'index_cc.cfm';document.calc_form.submit();" >
</form>
</td>
<td align="left"></td>
</tr>
</table>
</td></tr></table>
</center>
</form>
<form name="calc_form" action="index_cc.cfm" method="post">
<input type="hidden" name="comp_id" value="100">
<input type="hidden" name="transaction_type" value="Refinance">
<input type="hidden" name="property_county" value="Clay">
<input type="hidden" name="property_city" value="Green Cove Springs">
<input type="hidden" name="property_state" value="FL">
<input type="hidden" name="property_zip" value="32043">
<input type="hidden" name="base_loan_amount" value="200000">
<input type="hidden" name="purchase_price" value="0">
<input type="hidden" name="previous_loan_amount" value="170000">
<input type="hidden" name="previous_loan_year" value="2006">
<input type="hidden" name="previous_loan_month" value="1">
<input type="hidden" name="property_use_type" value="1">
<input type="hidden" name="enhanced_coverage" value="1">
<input type="hidden" name="city_state" value="Green Cove Springs, FL">
<input type="hidden" name="same_lender" value="1">
<input type="hidden" name="reissue_rates" value="0">
<input type="hidden" name="jlp_policy" value="0">
</form>
<!--- 1201 release fee --->
<center>
<table width="500" cellpadding="3" cellspacing="0" border=1 style="border-color:#000000; border-width:1px; border-style:inset;">
<tr>
<td align="left" valign="top" bgcolor="#CCCCFF">HUD Line #</td>
<td align="left" valign="top" bgcolor="#CCCCFF">Description</td>
<td align="left" valign="top" bgcolor="#CCCCFF">Paid By:</td>
<td align="right" valign="top" bgcolor="#CCCCFF">Amount</td>
</tr>
<tr bgcolor="#FFFFFF">
<td align="left" valign="top">1101</td>
<td align="left" valign="top">Settlement or Closing Fee</td>
<td align="left" valign="top">Buyer</td>
<td align="right" valign="top">      350.00</td>
</tr>
<tr bgcolor="#FFFFFF">
<td align="left" valign="top">1103</td>
<td align="left" valign="top">Title Examination</td>
<td align="left" valign="top">Buyer</td>
<td align="right" valign="top">      195.00</td>
</tr>
<tr bgcolor="#FFFFFF">
<td align="left" valign="top">1109</td>
<td align="left" valign="top">Title Insurance Premium</td>
<td align="left" valign="top">Buyer</td>
<td align="right" valign="top">      189.00</td>
</tr>
<tr bgcolor="#FFFFFF">
<td align="left" valign="top">1111</td>
<td align="left" valign="top">Delivery/Courier</td>
<td align="left" valign="top">Buyer</td>
<td align="right" valign="top">       60.00</td>
</tr>
<tr bgcolor="#FFFFFF">
<td align="left" valign="top">1201</td>
<td align="left" valign="top">Mortgage Recording Fee</td>
<td align="left" valign="top">Buyer</td>
<td align="right" valign="top">      154.50</td>
</tr>
<tr bgcolor="#FFFFFF">
<td align="left" valign="top">1202</td>
<td align="left" valign="top">City Mortgage Stamps</td>
<td align="left" valign="top">Buyer</td>
<td align="right" valign="top">      700.00</td>
</tr>
<tr bgcolor="#FFFFFF">
<td align="left" valign="top">1204</td>
<td align="left" valign="top">Intangible Tax</td>
<td align="left" valign="top">Buyer</td>
<td align="right" valign="top">      400.00</td>
</tr>
<tr bgcolor="#FFFFFF">
<td align="left" valign="top">1205</td>
<td align="left" valign="top">Recording Service</td>
<td align="left" valign="top">Buyer</td>
<td align="right" valign="top">       45.00</td>
</tr>
<tr bgcolor="#FFFFFF">
<td align="left" valign="top">1303</td>
<td align="left" valign="top">Wire Fee</td>
<td align="left" valign="top">Buyer</td>
<td align="right" valign="top">       25.00</td>
</tr>
<tr bgcolor="#FFFFFF">
<td align="left" valign="top">1306</td>
<td align="left" valign="top">Alta 8.1 Endorsement fee</td>
<td align="left" valign="top">Buyer</td>
<td align="right" valign="top">       25.00</td>
</tr>
<tr bgcolor="#FFFFFF">
<td align="left" valign="top">1307</td>
<td align="left" valign="top">Alta 9 Endorsement fee</td>
<td align="left" valign="top">Buyer</td>
<td align="right" valign="top">       18.90</td>
</tr>
<tr bgcolor="#FFFFFF">
<td align="left" valign="top">803</td>
<td align="left" valign="top">Appraisal Fee to Norman Hubbard Associates, Appraisal Mgmt</td>
<td align="left" valign="top">Buyer</td>
<td align="right" valign="top">      200.00</td>
</tr>
<tr bgcolor="#FFFFFF">
<td align="left" valign="top">804</td>
<td align="left" valign="top">Tax Service to First American Tax</td>
<td align="left" valign="top">Buyer</td>
<td align="right" valign="top">       75.00</td>
</tr>
<tr bgcolor="#FFFFFF">
<td align="left" valign="top">805</td>
<td align="left" valign="top">Flood to First American Flood Data </td>
<td align="left" valign="top">Buyer</td>
<td align="right" valign="top">       18.00</td>
</tr>
<tr bgcolor="#FFFFFF">
<td align="left" valign="top">806</td>
<td align="left" valign="top">Admin Fee to Magellan Mortgage</td>
<td align="left" valign="top">Buyer</td>
<td align="right" valign="top">      300.00</td>
</tr>
<tr bgcolor="#FFFFFF">
<td align="left" valign="top">807</td>
<td align="left" valign="top">Underwriting Fee to Magellan Mortgage</td>
<td align="left" valign="top">Buyer</td>
<td align="right" valign="top">      350.00</td>
</tr>
<tr>
<td align="right" valign="top" bgcolor="#CCCCFF" colspan="4">Total (Buyer):&nbsp;&nbsp;&nbsp;     3,105.40</td>
</tr>
</table>
<br>
<table width="500" cellpadding="3" cellspacing="0" border=1 style="border-color:#000000; border-width:1px; border-style:inset;">
<tr>
<td align="center" valign="top" bgcolor="#FFFFFF" colspan="4">OPTIONAL ENDORSEMENTS FOR FL</td>
</tr>
<tr>
<td align="left" valign="top" bgcolor="#e9e9e9" colspan="2">Description</td>
<td align="left" valign="top" bgcolor="#e9e9e9">Paid By:</td>
<td align="right" valign="top" bgcolor="#e9e9e9">Amount</td>
</tr>
<tr>
<td align="left" valign="top" bgcolor="#FFFFFF" colspan="2">ALTA 4</td>
<td align="left" valign="top" bgcolor="#FFFFFF">Buyer</td>
<td align="right" valign="top" bgcolor="#FFFFFF">       25.00</td>
</tr>
<tr>
<td align="left" valign="top" bgcolor="#FFFFFF" colspan="2">ALTA 4.1</td>
<td align="left" valign="top" bgcolor="#FFFFFF">Buyer</td>
<td align="right" valign="top" bgcolor="#FFFFFF">       25.00</td>
</tr>
<tr>
<td align="left" valign="top" bgcolor="#FFFFFF" colspan="2">ALTA 5</td>
<td align="left" valign="top" bgcolor="#FFFFFF">Buyer</td>
<td align="right" valign="top" bgcolor="#FFFFFF">       25.00</td>
</tr>
<tr>
<td align="left" valign="top" bgcolor="#FFFFFF" colspan="2">ALTA 5.1</td>
<td align="left" valign="top" bgcolor="#FFFFFF">Buyer</td>
<td align="right" valign="top" bgcolor="#FFFFFF">       25.00</td>
</tr>
<tr>
<td align="left" valign="top" bgcolor="#FFFFFF" colspan="2">ALTA 6</td>
<td align="left" valign="top" bgcolor="#FFFFFF">Buyer</td>
<td align="right" valign="top" bgcolor="#FFFFFF">       25.00</td>
</tr>
<tr>
<td align="left" valign="top" bgcolor="#FFFFFF" colspan="2">ALTA 6.1</td>
<td align="left" valign="top" bgcolor="#FFFFFF">Buyer</td>
<td align="right" valign="top" bgcolor="#FFFFFF">       25.00</td>
</tr>
<tr>
<td align="left" valign="top" bgcolor="#FFFFFF" colspan="2">ALTA 6.2</td>
<td align="left" valign="top" bgcolor="#FFFFFF">Buyer</td>
<td align="right" valign="top" bgcolor="#FFFFFF">       25.00</td>
</tr>
<tr>
<td align="left" valign="top" bgcolor="#FFFFFF" colspan="2">ALTA 7</td>
<td align="left" valign="top" bgcolor="#FFFFFF">Buyer</td>
<td align="right" valign="top" bgcolor="#FFFFFF">       25.00</td>
</tr>
<tr>
<td align="right" valign="top" bgcolor="#e9e9e9" colspan="4">Optional Endorsements Total (Buyer):&nbsp;&nbsp;&nbsp;      200.00</td>
</tr>
</table>
</center>
<center>
<span class="adtext"><br>
The calculation above does not include any fees for municipal lien searches or estoppel letter<br> fees charged by HOA
or Condo Associations, as those fees vary by each individual property. <br>Please also note that the
fee calculator is an estimate of the fees and are subject to change.<br><br>
<br>

</span>
</center>


</td></tr></table>
</TD>
</TR>
</table>
</td> </TBODY></TABLE>
</tr></tbody></table>
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
</HTML>
