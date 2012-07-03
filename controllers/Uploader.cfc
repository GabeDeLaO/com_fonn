<cfcomponent extends="Controller"><cfscript>

	function init(){
		provides("html,json");
	}
	
	private function addImageToProfile(imageName){
		
		var companyID = session.currentEdit.companyID;
		
		var profileBanner = model("profilebanner").new();
		profileBanner.companyID = companyID;
		profileBanner.banner = arguments.imageName;
		
		profileBanner.save();
		
		return true;
			
	}

</cfscript>

<cffunction name="upload" access="public" returnType="any">
	
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
	
	<cfset addImageToProfile(params.name) />
	
	<cfset renderText("uploading")/>

</cffunction>

</cfcomponent>
