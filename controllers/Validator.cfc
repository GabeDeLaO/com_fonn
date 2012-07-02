component extends="Controller"{

	function init(){
		
		filters(through="authCheck", except="");
		provides("html,json");
		
	}
	
	
	function index(){
		
		
		
	}
	
	
	function validate(){
		
		var results = structNew();
		
		if( isAjax() && isPost() ){
			
			//First let's check the access key.
			if( hasAccess(params.key) ){
				
				// Validate the coupon, provided that they have access to this coupon.
				if(validateCoupon(params.couponCode)){
					
					results.pass = true;
					results.message = "";
					
				}else{
					
					results.pass = false;
					results.message = "Could not validate the coupon code.";
					
				}
				
			}else{
				
				results.pass = false;
				results.message = "Looks like you don't have access to validate this coupon code.\";
				
			}
			
		}
		
		renderWith(results);
		
	}
	
	
	private function validateCoupon(code){
		
		var coupon = model("coupon").findOneByCouponcode(arguments.code);
		var companyID = "";
		
		
		if( isObject(coupon) ){
			
			//Grab the campaign.
			campaign = model("campaign").findByKey(coupon.campaignID);
			
			if( isObject(campaign) ){
				
				companyID = campaign.companyID;
				
				if( hash(session.authUser.adminCompanyID) IS hash(companyID) OR session.authUser.superAdmin IS 1){
					
					//Validate the coupon. Only if the coupon has not been redeemed already.
					if( !isDate(coupon.redeemDate) ){
					
						coupon.redeemDate = now();
					
						if(coupon.save()){
							
							return true;
							
						}else{
						
							return false;
						
						}
					
					}else{
						
						return false;
						
					}
					
				}else{
					
					return false;
				}
				
				
			}else{
				
				return false;
				
			}
			
			
		}else{
		
			return false;
			
		}
		
	}
	
	
	private function hasAccess(key){
		
		//Grab the session companyID. 
		var companyID = ( structKeyExists(session, "authUser") && structKeyExists(session.authUser, "adminCompanyID") )? session.authUser.adminCompanyID: 0;
		var company = "";
		var accessKey = "";
		
		if( companyID NEQ 0 OR companyID NEQ "" ){
			
			company = model("admincompany").findByKey(companyID);
			
			if( isObject(company) ){
				
				accessKey = company.key;
				
				if( arguments.key IS accessKey ){
					
					return true;
					
				}
				
			}else{
			
				return false;
				
			}	
			
		}
			
	}

}