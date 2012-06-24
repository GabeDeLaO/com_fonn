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


#styleSheetLinkTag("reset")#
<link rel="stylesheet" href="/stylesheets/main.css" type="text/css" id="size-stylesheet"/>

</head>

<cfset bodyID = ( structKeyexists(variables,"bodyID") )? variables.bodyID: "" />
<body id="#bodyID#" onload="initialize()">
	<div id="wrapper">
		<div id="header">
			<div id="logo">Fonn.com</div>
			<div id="header-banner">
			
			</div>
		</div>
		<div id="main">
			<div class="ajaxLoader"></div>
			#includeContent()#
		</div>
		#javascriptIncludeTag("jquery.min,main")#
	</div>
</body>

</html> 
</cfoutput>