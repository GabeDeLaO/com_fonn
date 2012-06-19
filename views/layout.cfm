<cfoutput>
<!DOCTYPE HTML>
<html>
<head>
<title>Fonn.com</title>

#styleSheetLinkTag("reset,main")#

</head>

<body>
	<div id="wrapper">
		<div id="header">
			FONN.com
		</div>
		<div class="ajaxLoader"></div>
		#includeContent()#
		#javascriptIncludeTag("jquery.min,main")#
	</div>
</body>

</html> 
</cfoutput>