component extends="Controller"{

	function init(){
		
		provides("html,json");
		
	}
	
	
	/* Main Home Page. */
	function index(){
		
		campaigns = model("campaign").findAll(include="company", where="enddate > '#now()#'");
		
	}
	
	
	/* Coupon/Campaign Profile. */
	function profile(){
		
		bodyID = "profile";
		today = dateFormat(now(),"yyyy-mm-dd");
		campaign = model("campaign").findByKey(key=params.key,include="company");
		if( campaign.endDate >= today ){
			state = model("state").findByKey(campaign.company.stateid);
			banners = model("profileBanner").findAll(where="companyID=#campaign.company.id#");
		}else{
			redirectTo(action="index");
		}
	}
	
	/* Email checker. */
	function gaveUsEmail(){
		
		var results = structNew();
		
		if( structKeyExists(session, "user") AND session.user.email NEQ ""){
		
			results.pass=true;
		
		}else{
			
			results.pass=false;
			
		}
		
		renderWith(results);
		
	}
	
	function setUserEmail(){
		
		var results = structNew();
		var email = params.email;
		
		results.pass=true;
		
		if( structKeyExists(params, "email") AND params.email NEQ "" ){
		
			// Look up the account, first. 
			oUser = model("user").findOneByEmail(params.email);
			
			if( isObject(oUser) ){
				
				session.user.email = oUser.email;
				
			}else{
				
				nUser = model("user").new(email="#params.email#");
				
				if( nUser.save() ){
					
					session.user.email = nUser.email;
					
				}else{
				
					results.pass = false;
					results.message = errorMessagesFor(objectName="nUser", showDuplicates="false");
				}
				
			}
			
			//session.authUser.email = email;
		
		}else{
			
			results.pass=false;
			
		}
		
		renderWith(results);
	}

}