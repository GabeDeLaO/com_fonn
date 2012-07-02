<cfoutput>
<!DOCTYPE HTML>
<html>
<head>
<title>Fonn.com Coupon Validator</title>

#styleSheetLinkTag("reset,validator")#

</head>

<body>
	<div id="wrapper">
		#includeContent()#
	</div>
	#javascriptIncludeTag("jquery.min,validator")#
</body>

</html> 
</cfoutput>