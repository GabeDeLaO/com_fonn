<cfcomponent extends="Controller"><cfscript>

	function init(){
		provides("html,json");
	}

</cfscript>

<cffunction name="upload" access="public" returnType="any">
	
	<cfdump var="#params#" abort/>
	
	<cfif 1 IS 2>
		<cffile action="upload" accept="*" destination="#expandPath('/files')#" nameConflict="makeunique"> 
	<cfelse>
	
	 <cfset imagePath = "#expandPath('/images/campaigns/big')#/#params.name#"/>
	 <cfimage
            action = "write"
            source = "#fileReadBinary( params.file )#"
            destination = "#imagePath#"
            overwrite = "yes"
            />
                 
	</cfif>
	
	<cfset renderText("uploading")/>

</cffunction>

</cfcomponent>
