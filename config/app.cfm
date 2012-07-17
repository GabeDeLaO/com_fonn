<!---
	Place settings that should go in the Application.cfc's "this" scope here.
	<cfset this.name = "MyAppName">
--->
<cfscript>
	THIS.NAME = "fonn_app";
	THIS.sessionManagement = TRUE;
	THIS.sessionTimeout = CreateTimeSpan( 0, 2, 0, 0 );
</cfscript>