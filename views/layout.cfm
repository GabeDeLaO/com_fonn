<cfoutput>
<!DOCTYPE HTML>
<html>
<head>
<title>Fonn.com</title>

<meta name="viewport" content="initial-scale=1.0, user-scalable=yes" />

<script type="text/javascript"
      src="http://maps.googleapis.com/maps/api/js?key=AIzaSyBwVCpncPOaSUgfQrO2V4tU-5a9JCXeV_g&sensor=true">
</script>
<script type="text/javascript">
  geocoder = new google.maps.Geocoder();
  function initialize() {
    var myOptions = {
      center: new google.maps.LatLng(-34.397, 150.644),
      zoom: 8,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map(document.getElementById("map_canvas"),
        myOptions);
  }
  function codeAddress() {
    var address = document.getElementById("address").value;
    geocoder.geocode( { 'address': address}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        map.setCenter(results[0].geometry.location);
        var marker = new google.maps.Marker({
            map: map, 
            position: results[0].geometry.location
        });
      } else {
        alert("Geocode was not successful for the following reason: " + status);
      }
    });
  }
</script>


#styleSheetLinkTag("reset,fonts")#
<link rel="stylesheet" href="/stylesheets/main.css" type="text/css" id="size-stylesheet"/>

<cfif params.controller IS "main" AND params.action IS "profile">
	<link rel="stylesheet" href="/miscellaneous/rotator/wt-rotator.css" type="text/css"/>
</cfif>

</head>

<cfset bodyID = ( structKeyexists(variables,"bodyID") )? variables.bodyID: "" />
<body id="#bodyID#" onload="initialize()">
	<div id="wrapper">
		<div id="header">
			<a href="/"><div id="logo">Fonn.com</div></a>
			<div id="header-banner">
			
			</div>
			<cfif params.controller IS 'Admin' OR params.controller IS 'campaign'>
				<ul id="adminMenu">
					<li>#linkTo(controller="admin",action="companies", text="Companies Manager", id="companies-manager")#</li>
					<li>#linkTo(controller="admin",action="admin-users-manager", text="Admin Users Manager", id="adminusers-manager")#</li>
					<li>#linkTo(controller="campaign", action="index", text="Manage Campaigns")#</li>
				</ul>
			</cfif>
		</div>
		<div id="main">
			<div class="ajaxLoader"></div>
			#includeContent()#
		</div>
		#javascriptIncludeTag("jquery.min,main")#
		<cfif params.controller IS "main" AND params.action IS "profile">
			<script type="text/javascript" src="/miscellaneous/rotator/js/jquery.easing.1.3.min.js"></script>
			<script type="text/javascript" src="/miscellaneous/rotator/js/jquery.wt-rotator.min.js"></script>
		</cfif>
	</div>
</body>

</html> 
</cfoutput>