<cfoutput>

<cffunction name="upload" access="public" returnType="any">
	
	<cfif params.type IS "banner">
		<cfset var fileDirPath = "#expandPath('/campaigns/big')#/#params.name#" />
	<cfelse>
		<cfset var fileDirPath = "#expandPath('/campaigns/small')#/#params.name#" />
	</cfif>
	
	<cfif 1 IS 2>
		<cffile action="upload" accept="*" destination="#expandPath('/files')#" nameConflict="makeunique"> 
	<cfelse>
	
	 <cfimage
            action = "write"
            source = "#fileReadBinary( params.file )#"
            destination = "#expandPath('/campaigns/big')#/#params.name#"
            overwrite = "yes"
            />
	
	</cfif>
	
	<cfset renderText("uploading")/>

</cffunction>


</cfoutput>