
<!DOCTYPE html>
<html>
<head>
 <title>USPS Canned Tests</title>
 <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
 <title>Google AJAX Local Search API + Maps API v3 demo</title>
 <link href="https://www.google.com/uds/css/gsearch.css" rel="stylesheet" type="text/css"/>
 <link href="./places.css" rel="stylesheet" type="text/css"/>

    <script src="https://maps.google.com/maps/api/js?sensor=false"></script>
    <script src="https://www.google.com/uds/api?file=uds.js&amp;v=1.0&amp;key=ABQIAAAAjU0EJWnWPMv7oQ-jjS7dYxQ82LsCgTSsdpNEnBsExtoeJv4cdBSUkiLH6ntmAr_5O4EfjDwOa0oZBQ" type="text/javascript"></script>	

 <script type="text/javascript">
    //<![CDATA[

    // Our global state
    var gLocalSearch;
    var gMap;
    var gInfoWindow;
    var gSelectedResults = [];
    var gCurrentResults = [];
    var gSearchForm;

    // Create our "tiny" marker icon
    var gYellowIcon = new google.maps.MarkerImage(
      "http://labs.google.com/ridefinder/images/mm_20_yellow.png",
      new google.maps.Size(12, 20),
      new google.maps.Point(0, 0),
      new google.maps.Point(6, 20));
    var gRedIcon = new google.maps.MarkerImage(
      "http://labs.google.com/ridefinder/images/mm_20_red.png",
      new google.maps.Size(12, 20),
      new google.maps.Point(0, 0),
      new google.maps.Point(6, 20));
    var gSmallShadow = new google.maps.MarkerImage(
      "http://labs.google.com/ridefinder/images/mm_20_shadow.png",
      new google.maps.Size(22, 20),
      new google.maps.Point(0, 0),
      new google.maps.Point(6, 20));     
    
	
     // Set up the map and the local searcher.
    function OnLoad() { 
	
		  <cfif Isdefined("url.div") AND url.div eq "Address">
				document.getElementById('Address_div').style.display="block";
				document.getElementById('ViewMap').style.display="none";				
	 	  </cfif>
      // Initialize the map with default UI.
      gMap = new google.maps.Map(document.getElementById("map"), {
        center: new google.maps.LatLng(37.4419, -122.1419),
        zoom: 13,
        mapTypeId: 'roadmap'
      });
      // Create one InfoWindow to open when a marker is clicked.
      gInfoWindow = new google.maps.InfoWindow;
      google.maps.event.addListener(gInfoWindow, 'closeclick', function() {
        unselectMarkers();
      });

      // Initialize the local searcher
      gLocalSearch = new GlocalSearch();
      gLocalSearch.setSearchCompleteCallback(null, OnLocalSearch);
         
      <cfif isdefined("url.div") AND #url.div# eq 'Map'>
			doSearch();			
	  </cfif>	             
    }

    function unselectMarkers() {
      for (var i = 0; i < gCurrentResults.length; i++) {
        gCurrentResults[i].unselect();
      }
    }    
    
    function doSearch() {
       
      var query = document.getElementById("add1").value;
         var query1 = document.getElementById("City1").value;
         var query2 = document.getElementById("State1").value;
         var query3 = document.getElementById("Zip51").value;
         var query4 = document.getElementById("Zip41").value;
        
         var query5 = query.concat(query1,query2,query3,query4); 

         document.getElementById('ViewMap').style.display="block";
		
      gLocalSearch.setCenterPoint(gMap.getCenter());
      gLocalSearch.execute(query5);	  	
    }

    // Called when Local Search results are returned, we clear the old
    // results and load the new ones.

    function OnLocalSearch() {    
      if (!gLocalSearch.results) return;
      var searchWell = document.getElementById("searchwell");

      // Clear the map and the old search well
      searchWell.innerHTML = "";
      for (var i = 0; i < gCurrentResults.length; i++) {
        gCurrentResults[i].marker().setMap(null);
      }
      // Close the infowindow
      gInfoWindow.close();

      gCurrentResults = [];
      for (var i = 0; i < gLocalSearch.results.length; i++) {
        gCurrentResults.push(new LocalResult(gLocalSearch.results[i]));
      }

      var attribution = gLocalSearch.getAttribution();
      if (attribution) {
        document.getElementById("searchwell").appendChild(attribution);
      }

      // Move the map to the first result
      var first = gLocalSearch.results[0];
      gMap.setCenter(new google.maps.LatLng(parseFloat(first.lat),
                                            parseFloat(first.lng)));

    }

    // Cancel the form submission, executing an AJAX Search API search.
    function CaptureForm(searchForm) {
      gLocalSearch.execute(searchForm.input.value);
      return false;
    }



    // A class representing a single Local Search result returned by the
    // Google AJAX Search API.
    function LocalResult(result) {
      var me = this;
      me.result_ = result;
      me.resultNode_ = me.node();
      me.marker_ = me.marker();
      google.maps.event.addDomListener(me.resultNode_, 'mouseover', function() {
        // Highlight the marker and result icon when the result is
        // mouseovered.  Do not remove any other highlighting at this time.
        me.highlight(true);
      });
      google.maps.event.addDomListener(me.resultNode_, 'mouseout', function() {
        // Remove highlighting unless this marker is selected (the info
        // window is open).
        if (!me.selected_) me.highlight(false);
      });
      google.maps.event.addDomListener(me.resultNode_, 'click', function() {
        me.select();
      });
      document.getElementById("searchwell").appendChild(me.resultNode_);     
    }

    LocalResult.prototype.node = function() {
      if (this.resultNode_) return this.resultNode_;
      return this.html();
    };

    // Returns the GMap marker for this result, creating it with the given
    // icon if it has not already been created.
    LocalResult.prototype.marker = function() {
      var me = this;
      if (me.marker_) return me.marker_;
      var marker = me.marker_ = new google.maps.Marker({
        position: new google.maps.LatLng(parseFloat(me.result_.lat),
                                         parseFloat(me.result_.lng)),
        icon: gYellowIcon, shadow: gSmallShadow, map: gMap});
      google.maps.event.addListener(marker, "click", function() {
        me.select();
      });
      return marker;
    };

    // Unselect any selected markers and then highlight this result and
    // display the info window on it.
    LocalResult.prototype.select = function() {
      unselectMarkers();
      this.selected_ = true;
      this.highlight(true);
      gInfoWindow.setContent(this.html(true));
      gInfoWindow.open(gMap, this.marker());
    };

    LocalResult.prototype.isSelected = function() {
      return this.selected_;
    };

    // Remove any highlighting on this result.
    LocalResult.prototype.unselect = function() {
      this.selected_ = false;
      this.highlight(false);
    };

    // Returns the HTML we display for a result before it has been "saved"
    LocalResult.prototype.html = function() {
      var me = this;
      var container = document.createElement("div");
      container.className = "unselected";
      container.appendChild(me.result_.html.cloneNode(true));
      return container;
    }

    LocalResult.prototype.highlight = function(highlight) {
      this.marker().setOptions({icon: highlight ? gRedIcon : gYellowIcon});
      this.node().className = "unselected" + (highlight ? " red" : "");
    }

    GSearch.setOnLoadCallback(OnLoad);  
    
    //]]>
    </script>
	
</head>

<body>
<script type='text/javascript'>
	
	function BackToParentWithData(withData)
	{
		if(withData == 'True')
		{
		   if (Check_option())
		   	 {
			   <cfif find("title_report_modify",CGI.HTTP_REFERER) eq 0> 
				
				var parentwin=window.opener.frm;
					
				parentwin.paddress.value= document.getElementById("Address").value;			
				if(document.getElementsByName('choosetype')[0].checked)
				{
					var text=document.getElementById("City").value +", " + document.getElementById("State").value+ " " + document.getElementById("Zip").value;
				
					window.opener.document.getElementById("cityStateZip").innerHTML= "<font face=verdana size=1 color=blue><b><NOBR>" + text + "</NOBR></b></font>";
				}
				
				if (document.getElementsByName('choosetype')[1].checked)
				{
					var text=document.getElementById("City1").value +", " + document.getElementById("State1").value+ " " + document.getElementById("Zip41").value;
				
					parentwin.paddress.value=document.getElementById("add1").value;
					
					window.opener.document.getElementById("cityStateZip").innerHTML= "<font face=verdana size=1 color=blue><b><NOBR>" + text + "</NOBR></b></font>";
				}
			   <cfelse>
			   
			   		if(document.getElementsByName('choosetype')[0].checked)
					{
						var parentwin=window.opener.frm;
			   			parentwin.paddress.value= document.getElementById("Address").value;
			   			parentwin.pcity.value= document.getElementById("City").value;
			   			parentwin.pstate.value=document.getElementById("State").value;
			   			parentwin.pzip.value=document.getElementById("Zip").value;
					}
				
					if (document.getElementsByName('choosetype')[1].checked)
					{
						var parentwin=window.opener.frm;
						parentwin.paddress.value= document.getElementById("add1").value;
				   		parentwin.pcity.value= document.getElementById("City1").value;
				   		parentwin.pstate.value=document.getElementById("State1").value;
				   		parentwin.pzip.value=document.getElementById("Zip41").value;
					}
							   		
			   </cfif>
			   	window.close();
			   }
			   			 			 
			}	
			
		}
	
	function Check_option()
	{
		var option_selected=document.getElementsByName('choosetype');
		
		if (option_selected[0].checked || option_selected[1].checked)
			{
				return true;
			}
		else
			{
				alert("Choose a type before you proceed!!");
				return false;				
			}
	}
		
</script>
<form id="frm" action="" method="post">
  <body bgcolor="tan">
<cfparam name ="API9" default=""> 
<cfparam name ="add9" default="">
<cfparam name ="City9" default="">
<cfparam name ="State9" default="">
<cfparam name ="Zip49" default="">
<cfparam name ="Zip59" default="">
       
<cfif isdefined("url.Address") >
<cfset add9=url.Address>
<cfset City9 =url.City>
<cfset State9 =url.State>
<cfset Zip49 =url.Zip>
<cfset Zip59 =url.Zip>
<cfset API9="verify">
<cfoutput>

<cfscript>
variables.uspsUserID = '123FIRST0747';
variables.usps = New usps(isProduction=True, isSecure=false, uspsUserID=variables.uspsUserID);

// USPS Canned Test: This test cleanses an address and provides the ZIP+4 value.
//variables.Verify1 = variables.usps.AddressValidate(
//       Address2 = '6406 Ivy Lane',
//       City = 'Greenbelt',
//       State = 'MD'
//);

//variables.Verify1="";
variables.Verify1 = variables.usps.AddressValidate(Address2='#url.Address#',City='#url.City#',State='#url.State#', Zip4='#url.Zip#', Zip5='#url.Zip#');
//WriteDump(var="#variables.Verify1#" label="Verify1");
</cfscript>
</cfoutput>
</cfif>	
	<div id="Address_div" style="display:none">
		<div id="user">
			<span><input type="radio" name="choosetype" value="1" />User entered address Information</span>
			<table border="0" width="500px">	      			      		
	      		<tr>	      			
	      			<td>Address:</td>
	      			<td>City:</td>
	      			<td>State:</td>
	      			<td>Zip Code:</td>	      			
	      		</tr>	      		
	      		<tr>
		      		<td><input type="text" name="Address" id="Address" autocorrect="off" value= "<cfoutput>#url.Address#</cfoutput>" ></td>
	      			<td><input type="text" name="City" id="City" autocorrect="off"  value= "<cfoutput>#url.City#</cfoutput>" ></td>
	      			<td><input type="text" name="State" id="State" autocorrect="off" value= "<cfoutput>#url.State#</cfoutput>" ></td>
	      			<td><input type="text" name="Zip" id="Zip" autocorrect="off" value= "<cfoutput>#url.Zip#</cfoutput>" ></td>	      			
		      	</tr>		      	
			</table>	
		</div>
		<br />
		<div id="usps">		 
			<table border="0" width="500px">
				<cfif isdefined("variables.Verify1.AddressValidateResponse") >
	         			<cfif not isdefined("variables.Verify1.AddressValidateResponse.Address.Error")>
	           				<cfset ValidatedResponse=variables.Verify1.AddressValidateResponse.Address />
	           			<span><input type="radio" name="choosetype" value="2" />Information from US Postal Service</span>	           			
	           			<tr>		          			
							<td> Address:</td>
				            <td>City:</td>
				            <td> State:</td>
				            <td> Zip code:</td>
				            <!--- <td> Zip5:</td> --->
		         		</tr>	
		         		<tr>
			         		<cfoutput>
			         		<td> <input type="text" name="add1" id="add1" value="#ValidatedResponse.Address2.XmlText#"></td>
							<td><input type="text" name="City1" id="City1" value="#ValidatedResponse.City.XmlText#"></td>
							<td><input type="text" name="State1" id="State1" value="#ValidatedResponse.State.XmlText#"></td>
							<td><input type="text" name="Zip41" id="Zip41" value="#ValidatedResponse.Zip5.XmlText#"></td>
							<td><input type="hidden" name="Zip51" id="Zip51" value="#ValidatedResponse.Zip4.XmlText#"></td>	
							</cfoutput>			         	
						<cfelse>
							<cfif isdefined("variables.Verify1.AddressValidateResponse.Address.Error")>																		
								<td colspan="5">
									<cfoutput><b>#variables.Verify1.AddressValidateResponse.Address.Error.Description# Please refine your Search....</b></cfoutput>
								</td>																				
							</cfif>
						</tr>
						</cfif>
						<cfelse>
							<cfif isdefined("variables.Verify1.AddressValidateResponse.Address.Error")>																		
								<td colspan="5">
									<cfoutput><b>#variables.Verify1.AddressValidateResponse.Address.Error.Description# Please refine your Search....</b></cfoutput>
								</td>			
																					
							</cfif>
					</cfif>		      			
	      		</tr>   
			</table>						
		</div>
			<table>
				<tr>	      			
	      			<td><input type="button" id="btn_use" value="Use the selected address value" onclick="BackToParentWithData('True')"></td>
	      			<td><input type="button" id="btn_cancel" value="cancel" onclick="BackToParentWithData('False')"></td>
	      		</tr>
			</table>
	</div>
	<div id="ViewMap" style="width: 500px;">
      <div style="margin-bottom: 5px;">
 
             <!---  <input type="button" value="viewmap" onclick="doSearch()"/> --->
      </div>
         
      <div style="position: absolute; left: 540px;">
        <div id="searchwell"></div>
      </div>
      <div id="map" style="height: 350px; border: 1px solid #979797;"></div>
    </div>
</form>
</body>
</html>

<!--- <!DOCTYPE html>
<html lang="en-US">
<head>
       <title>USPS Canned Tests</title>
       
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <title>Google AJAX Local Search API + Maps API v3 demo</title>
    <link href="http://www.google.com/uds/css/gsearch.css" rel="stylesheet" type="text/css"/>
    <link href="./places.css" rel="stylesheet" type="text/css"/>

    <script src="http://maps.google.com/maps/api/js?sensor=false"></script>
    <script src="http://www.google.com/uds/api?file=uds.js&amp;v=1.0&amp;key=ABQIAAAAjU0EJWnWPMv7oQ-jjS7dYxQ82LsCgTSsdpNEnBsExtoeJv4cdBSUkiLH6ntmAr_5O4EfjDwOa0oZBQ" type="text/javascript"></script>
    <script type="text/javascript">
    //<![CDATA[

    // Our global state
    var gLocalSearch;
    var gMap;
    var gInfoWindow;
    var gSelectedResults = [];
    var gCurrentResults = [];
    var gSearchForm;

    // Create our "tiny" marker icon
    var gYellowIcon = new google.maps.MarkerImage(
      "http://labs.google.com/ridefinder/images/mm_20_yellow.png",
      new google.maps.Size(12, 20),
      new google.maps.Point(0, 0),
      new google.maps.Point(6, 20));
    var gRedIcon = new google.maps.MarkerImage(
      "http://labs.google.com/ridefinder/images/mm_20_red.png",
      new google.maps.Size(12, 20),
      new google.maps.Point(0, 0),
      new google.maps.Point(6, 20));
    var gSmallShadow = new google.maps.MarkerImage(
      "http://labs.google.com/ridefinder/images/mm_20_shadow.png",
      new google.maps.Size(22, 20),
      new google.maps.Point(0, 0),
      new google.maps.Point(6, 20));

     // Set up the map and the local searcher.
    function OnLoad() {

      // Initialize the map with default UI.
      gMap = new google.maps.Map(document.getElementById("map"), {
        center: new google.maps.LatLng(37.4419, -122.1419),
        zoom: 13,
        mapTypeId: 'roadmap'
      });
      // Create one InfoWindow to open when a marker is clicked.
      gInfoWindow = new google.maps.InfoWindow;
      google.maps.event.addListener(gInfoWindow, 'closeclick', function() {
        unselectMarkers();
      });

      // Initialize the local searcher
      gLocalSearch = new GlocalSearch();
      gLocalSearch.setSearchCompleteCallback(null, OnLocalSearch);
      document.getElementById("ViewMap").style.visibility='hidden';
      document.getElementById("btn_viewmap").style.display='none';
      
      <cfif isdefined("form.Address")>
			document.getElementById("btn_viewmap").style.display='block';
	  </cfif>             
    }

    function unselectMarkers() {
      for (var i = 0; i < gCurrentResults.length; i++) {
        gCurrentResults[i].unselect();
      }
    }    
    
    function doSearch() {
       
      var query = document.getElementById("add1").value;
         var query1 = document.getElementById("City1").value;
         var query2 = document.getElementById("State1").value;
         var query3 = document.getElementById("Zip5").value;
         var query4 = document.getElementById("Zip4").value;
        
         var query5 = query.concat(query1,query2,query3,query4); 

         document.getElementById("ViewMap").style.visibility='visible';
		
      gLocalSearch.setCenterPoint(gMap.getCenter());
      gLocalSearch.execute(query5);	  	
    }

    // Called when Local Search results are returned, we clear the old
    // results and load the new ones.

    function OnLocalSearch() {    
      if (!gLocalSearch.results) return;
      var searchWell = document.getElementById("searchwell");

      // Clear the map and the old search well
      searchWell.innerHTML = "";
      for (var i = 0; i < gCurrentResults.length; i++) {
        gCurrentResults[i].marker().setMap(null);
      }
      // Close the infowindow
      gInfoWindow.close();

      gCurrentResults = [];
      for (var i = 0; i < gLocalSearch.results.length; i++) {
        gCurrentResults.push(new LocalResult(gLocalSearch.results[i]));
      }

      var attribution = gLocalSearch.getAttribution();
      if (attribution) {
        document.getElementById("searchwell").appendChild(attribution);
      }

      // Move the map to the first result
      var first = gLocalSearch.results[0];
      gMap.setCenter(new google.maps.LatLng(parseFloat(first.lat),
                                            parseFloat(first.lng)));

    }

    // Cancel the form submission, executing an AJAX Search API search.
    function CaptureForm(searchForm) {
      gLocalSearch.execute(searchForm.input.value);
      return false;
    }



    // A class representing a single Local Search result returned by the
    // Google AJAX Search API.
    function LocalResult(result) {
      var me = this;
      me.result_ = result;
      me.resultNode_ = me.node();
      me.marker_ = me.marker();
      google.maps.event.addDomListener(me.resultNode_, 'mouseover', function() {
        // Highlight the marker and result icon when the result is
        // mouseovered.  Do not remove any other highlighting at this time.
        me.highlight(true);
      });
      google.maps.event.addDomListener(me.resultNode_, 'mouseout', function() {
        // Remove highlighting unless this marker is selected (the info
        // window is open).
        if (!me.selected_) me.highlight(false);
      });
      google.maps.event.addDomListener(me.resultNode_, 'click', function() {
        me.select();
      });
      document.getElementById("searchwell").appendChild(me.resultNode_);     
    }

    LocalResult.prototype.node = function() {
      if (this.resultNode_) return this.resultNode_;
      return this.html();
    };

    // Returns the GMap marker for this result, creating it with the given
    // icon if it has not already been created.
    LocalResult.prototype.marker = function() {
      var me = this;
      if (me.marker_) return me.marker_;
      var marker = me.marker_ = new google.maps.Marker({
        position: new google.maps.LatLng(parseFloat(me.result_.lat),
                                         parseFloat(me.result_.lng)),
        icon: gYellowIcon, shadow: gSmallShadow, map: gMap});
      google.maps.event.addListener(marker, "click", function() {
        me.select();
      });
      return marker;
    };

    // Unselect any selected markers and then highlight this result and
    // display the info window on it.
    LocalResult.prototype.select = function() {
      unselectMarkers();
      this.selected_ = true;
      this.highlight(true);
      gInfoWindow.setContent(this.html(true));
      gInfoWindow.open(gMap, this.marker());
    };

    LocalResult.prototype.isSelected = function() {
      return this.selected_;
    };

    // Remove any highlighting on this result.
    LocalResult.prototype.unselect = function() {
      this.selected_ = false;
      this.highlight(false);
    };

    // Returns the HTML we display for a result before it has been "saved"
    LocalResult.prototype.html = function() {
      var me = this;
      var container = document.createElement("div");
      container.className = "unselected";
      container.appendChild(me.result_.html.cloneNode(true));
      return container;
    }

    LocalResult.prototype.highlight = function(highlight) {
      this.marker().setOptions({icon: highlight ? gRedIcon : gYellowIcon});
      this.node().className = "unselected" + (highlight ? " red" : "");
    }

    GSearch.setOnLoadCallback(OnLoad);  
    
    //]]>
    </script>
</head>

<body bgcolor="tan">
<cfparam name ="API9" default=""> 
<cfparam name ="add9" default="">
<cfparam name ="City9" default="">
<cfparam name ="State9" default="">
<cfparam name ="Zip49" default="">
<cfparam name ="Zip59" default="">
       
<cfif isdefined("form.Address") >
<cfset add9=form.Address>
<cfset City9 =form.City>
<cfset State9 =form.State>
<cfset Zip49 =form.Zip4>
<cfset Zip59 =form.Zip5>
<cfset API9=form.API>
<cfoutput>

<cfscript>
variables.uspsUserID = '123FIRST0747';
variables.usps = New usps(isProduction=true, isSecure=false, uspsUserID=variables.uspsUserID);


// USPS Canned Test: This test cleanses an address and provides the ZIP+4 value.
//variables.Verify1 = variables.usps.AddressValidate(
       //Address2 = '6406 Ivy Lane',
       //City = 'Greenbelt',
       //State = 'MD'
//);

variables.Verify1="";
variables.Verify1 = variables.usps.AddressValidate(Address1='', Address2='#form.Address#',City='#form.City#',State='#form.State#', Zip4='form.Zip4', Zip5='form.Zip5');
//WriteDump(var="#variables.Verify1#" label="Verify1");
</cfscript>
</cfoutput>
</cfif>

<cfform action="" id="" method="post" >       

 <div>
	      <table border="0" width="500px">	      		
	      		<tr><td align="center" colspan="5">User Entered Information</td><tr>
	      		<tr>
	      			<td>API:</td>
	      			<td>Address:</td>
	      			<td>City:</td>
	      			<td>State:</td>
	      			<td>Zip4:</td>
	      			<td>Zip5:</td>
	      		</tr>	      		
	      		<tr>
		      		<td><input type="text" name="API" id="API" autocorrect="off" autocapitalize="off" value="<cfoutput>#API9#</cfoutput>" ></td>
	      			<td><input type="text" name="Address" id="Address" autocorrect="off" value= "<cfoutput>#add9#</cfoutput>" ></td>
	      			<td><input type="text" name="City" id="City" autocorrect="off"  value= "<cfoutput>#City9#</cfoutput>" ></td>
	      			<td><input type="text" name="State" id="State" autocorrect="off" value= "<cfoutput>#State9#</cfoutput>" ></td>
	      			<td><input type="text" name="Zip4" id="Zip4" autocorrect="off" value= "<cfoutput>#Zip49#</cfoutput>"  ></td>
	      			<td><input type="text" name="Zip5" id="Zip5" autocorrect="off" value= "<cfoutput>#Zip59#</cfoutput>"  ></td>
		      	</tr>
		      	<tr>
	      			<td colspan="6"><br>
	      			<td></td>
	      		</tr>
		      	<cfif isdefined("variables.Verify1.AddressValidateResponse") >
	         			<cfif not isdefined("variables.Verify1.AddressValidateResponse.Address.Error")>
	           				<cfset ValidatedResponse=variables.Verify1.AddressValidateResponse.Address />
	           			<tr><td align="center" colspan="5">Validated Address Information</td></tr>
	           			<tr>		          			
							<td> Address:</td>
				            <td>City:</td>
				            <td> State:</td>
				            <td> Zip4:</td>
				            <td> Zip5:</td>
		         		</tr>	
		         		<tr>
			         		<cfoutput>
			         		<td> <input type="text" name="add1" id="add1" value="#ValidatedResponse.Address2.XmlText#"></td>
							<td><input type="text" name="City1" id="City1" value="#ValidatedResponse.City.XmlText#"></td>
							<td><input type="text" name="State1" id="State1" value="#ValidatedResponse.State.XmlText#"></td>
							<td><input type="text" name="Zip41" id="Zip41" value="#ValidatedResponse.Zip4.XmlText#"></td>
							<td><input type="text" name="Zip51" id="Zip51" value="#ValidatedResponse.Zip5.XmlText#"></td>	
							</cfoutput>			         	
						<cfelse>
							<cfif isdefined("variables.Verify1.AddressValidateResponse.Address.Error")>																		
								<td colspan="5">
								Address Not Found. Refine your Search....
								</td>										
												<!--- #variables.Verify1.AddressValidateResponse.Address.Error.Description# --->									
							</cfif>
						</tr>
						</cfif>
						<cfelse>
							<cfif isdefined("variables.Verify1.AddressValidateResponse.Address.Error")>																		
								<td colspan="5">
								Address Not Found. Refine your Search....
								</td>										
												<!--- #variables.Verify1.AddressValidateResponse.Address.Error.Description# --->									
							</cfif>
					</cfif>		      			
	      		</tr>      		
	      		
	      		<tr>
	      			<td><input type="submit" id="submit" value="Submit"></td><td><input id="btn_viewmap" type="button" value="viewmap" onclick="doSearch()"/></td>
	      		</tr>
	      </table>
 </div>


<div id="ViewMap" style="width: 500px;">
      <div style="margin-bottom: 5px;">
 
             <!---  <input type="button" value="viewmap" onclick="doSearch()"/> --->
      </div>
         
      <div style="position: absolute; left: 540px;">
        <div id="searchwell"></div>
      </div>
      <div id="map" style="height: 350px; border: 1px solid #979797;"></div>
    </div>
       
</cfform>
</body>
</html> --->

