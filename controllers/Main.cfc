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
	
	/* Email checker. */
	function gaveUsEmail(){
		
		var results = structNew();
		
		if( structKeyExists(session.user.email) ){
		
			results.pass=true;
		
		}else{
			
			results.pass=false;
			
		}
		
	}
	
	function setUserEmail(){
		
		var results = structNew();
		var email = params.email;
		
		if( isEmail(email) ){
			session.authUser.email = email;			
			results.pass=true;
		}else{
			
			results.pass=false;
			
		}
	}

}