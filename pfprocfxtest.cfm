<!-- Test transaction by passing all of the !-->
<!-- parameters though the Cold fusion tag. !-->

<CFX_PAYFLOWPRO QUERY          = "RESULT"
                HOSTADDRESS    = "test-payflow.verisign.com"
                HOSTPORT       = "443"
                TIMEOUT        = "30"
                PROXYADDRESS   = ""
                PROXYPORT      = ""
                PROXYLOGON     = ""
                PROXYPASSWORD  = ""
                TRXTYPE        = "S"
                TENDER         = "C"
                PARTNER        = "VeriSign"
                USER           = "YourTestAccountName"
                PWD            = "YourAccountPassword"
                ACCT           = "5105105105105100"
                EXPDATE        = "1209"
                AMT            = "27.33"
                COMMENT1       = "This is a comment - note that it is automatically escaped"
                COMMENT2       = "Embedded = and & work when escaped"
>

<!-- Parmlist not needed becuse we are passing all required !-->
<!-- VeriSign parameters though the Cold Fusion tag.        !-->


<!-- Returned in the Query -->
<CFOUTPUT QUERY="RESULT">
<hr>
<p><b>PARMLIST:</b> #PARMLIST#<BR>
<p><b>RESULTSTR:</b> #RESULTSTR#<BR>
<p><b>VERSION:</b> #VERSION#<BR><BR>
</CFOUTPUT>

<!-- Or access directly -->
<hr>

<CFOUTPUT QUERY="RESULT">

<CFIF result.result IS "0">
  Transaction <b>#result.respmsg#</b><br>
  Result: #result.result#<br>
  PNREF: #result.pnref#<br>
  AuthCode: #result.authcode#<BR>
<CFELSE>
  Transaction Declined: #result.respmsg#<br>
</CFIF>

</CFOUTPUT>

