component extends="Controller"{

	function init(){
		
		provides("html,json");
		
	}
	
	
	/* Main Home Page. */
	function index(){
		
		campaigns = model("campaign").findAll();
		
	}
	
	
	/* Coupon/Campaign Profile. */
	function profile(){
		
		campaign = model("campaign").findByKey(params.key);
		
	}

}