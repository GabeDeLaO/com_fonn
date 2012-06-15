component extends="Controller"{

	function init(){
		
		filters(through="authCheck", except="");
		provides("html,json");
		
	}
	
	
	function index(){
		
		campaigns = model("campaign").findAll();
		
	}
	
	function add(){
		
		var results = structNew();
		var days = 0;
		
		timeSpans = model("couponTimeSpan").findAll();
		campaign = model("campaign").new();
		
		if( isAjax() && isPost() ){
			
			campaign = model("campaign").new(params.campaign);
			campaign.couponTimeSpan = params.couponExpirationTimeSpan;
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
		
		var results = structNew();
		var days = 0;
		
		timeSpans = model("couponTimeSpan").findAll();
		campaign = model("campaign").findByKey(params.key);
		
		if( isAjax() && isPost() ){
			
			campaign.update(params.campaign);
			campaign.couponTimeSpan = params.couponExpirationTimeSpan;
			
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