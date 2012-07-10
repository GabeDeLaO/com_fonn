<cfcomponent extends="Controller"><cfscript>

	function init(){
		provides("html,json");
	}
	
	private function addImageToProfile(imageName,type){
		
		var companyID = session.currentEdit.companyID;
		
		if( arguments.type IS "banner" ){
			var profileBanner = model("profilebanner").new();
			profileBanner.companyID = companyID;
			profileBanner.banner = arguments.imageName;
			
			profileBanner.save();
		}else{
			var company = model("company").findByKey(companyID);
			company.smallImage = arguments.imageName;
			
			company.save();
		}
		
		return true;
			
	}

</cfscript>

<cffunction name="upload" access="public" returnType="any">
	
	<cfif params.type IS "banner">
		<cfset var fileDirPath = "#expandPath('/images/campaigns/big')#/#params.name#" />
	<cfelse>
		<cfset var fileDirPath = "#expandPath('/images/campaigns/small')#/#params.name#" />
	</cfif>
	
	<cfif 1 IS 2>
		<cffile action="upload" accept="*" destination="#expandPath('/files')#" nameConflict="makeunique"> 
	<cfelse>
	
	 <cfset imagePath = "#fileDirPath#"/>
	 <cfimage
            action = "write"
            source = "#fileReadBinary( params.file )#"
            destination = "#imagePath#"
            overwrite = "yes"
            />
                 
	</cfif>
	
	<cfset addImageToProfile(imageName=params.name,type=params.type) />
	
	<cfset renderText(params.name)/>

</cffunction>

</cfcomponent>
