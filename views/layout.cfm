<cfoutput>
<!DOCTYPE HTML>
<html>
<head>
<title>Fonn.com</title>

#styleSheetLinkTag("main")#

</head>

<body>
	<div class="ajaxLoader"></div>
	#includeContent()#
	#javascriptIncludeTag("jquery.min,main")#
</body>

</html> 
</cfoutput>