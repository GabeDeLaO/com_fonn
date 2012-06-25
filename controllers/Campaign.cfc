component extends="Controller"{

	function init(){
		
		filters(through="authCheck", except="");
		provides("html,json");
		
	}
	
	
	function index(){
		
		bodyID = "admin";
		campaigns = model("campaign").findAll();
		
	}
	
	function add(){
		
		bodyID = "admin";
		var results = structNew();
		var days = 0;
		
		timeSpans = model("couponTimeSpan").findAll();
		
		userPermission = model("adminuser").findByKey(session.authUser.id);
		
		if( userPermission.role IS 1 ){
			companies = model("company").findAll();
		}else{
			companies = model("company").findAll(where="id=session.authUser.companyid");
		}
		campaign = model("campaign").new();
		
		if( isAjax() && isPost() ){
			
			campaign = model("campaign").new(params.campaign);
			campaign.couponTimeSpan = params.couponExpirationTimeSpan;
			campaign.companyId = params.companyid;
			campaign.approved = false;
			
			if( campaign.save() ){
				
				results.pass = true;
				results.message = "";
				
			}else{
				
				results.pass = false;
				results.message = errorMessagesFor(objectName="campaign", showDuplicates="false");
			}
			
			renderWith(results);
				
		}
		
	}
	
	function edit(){
		
		bodyID = "admin";
		var results = structNew();
		var days = 0;
		
		timeSpans = model("couponTimeSpan").findAll();
		
		userPermission = model("adminuser").findByKey(session.authUser.id);
		
		if( userPermission.role IS 1 ){
			companies = model("company").findAll();
		}else{
			companies = model("company").findAll(where="id=session.authUser.companyid");
		}
		
		campaign = model("campaign").findByKey(params.key);
		
		if( isAjax() && isPost() ){
			
			campaign.update(params.campaign);
			campaign.couponTimeSpan = params.couponExpirationTimeSpan;
			campaign.companyId = params.companyid;
			
			if( campaign.save() ){
				
				results.pass = true;
				results.message = "";
				
			}else{
				
				results.pass = false;
				results.message = errorMessagesFor(objectName="campaign", showDuplicates="false");
			}
			
			renderWith(results);
				
		}
		
	}
	
	/* Remove a campaign. */
	function delete(){
		
		bodyID = "admin";
		var results = structNew();
		
		if( isAjax() && isPost() ){
		
			campaign = model("campaign").findByKey(params.key);
			campaign.delete();
			
			results.pass = true;
			results.message = "Campaign has been successfully deleted!";
		
		}
		
		renderWith(results);
		
	}

}