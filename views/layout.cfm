<cfoutput>
<!DOCTYPE HTML>
<html>
<head>
<title>Fonn.com</title>

#styleSheetLinkTag("reset")#
<link rel="stylesheet" href="/stylesheets/main.css" type="text/css" id="size-stylesheet"/>

</head>

<body>
	<div id="wrapper">
		<div id="header">
			<div id="logo">
				FONN.com
			</div>
			<div id="header-banner">
			
			</div>
		</div>
		<div class="ajaxLoader"></div>
		#includeContent()#
		#javascriptIncludeTag("jquery.min,main")#
	</div>
</body>

</html> 
</cfoutput>