component extends="Controller"{

	function init(){
		
		provides("html,json");
		
	}
	
	
	/* Requet coupon. */
	function requestCoupon(){
		
		//writeDump(var="#params#", abort="true");
		
		var results = structNew();
		var campaign = model("campaign").findByKey(params.key);
		var user = model("user").findOneByEmail("#session.user.email#");
		
		if( availableCouponCount(campaign.id) GTE 1){
			
			// Check that this user hasn't received this coupon already.
			if( notDuplicateCoupon(campaign.id,user.id) ){
			
				newCoupon = create(campaign.id, user.id);
				
				if( isObject(newCoupon) ){
				
					sendEmail(
						from="admin@fonn.com",
						to="#user.email#",
						template="couponEmail",
						subject="Your Deal For: #campaign.campaignName#",
						coupon=newCoupon
					);
				
					results.pass = true;
					results.message = "Your deal has been sent!";
				
				}else{
					
					results.pass = false;
					results.message = "Oops, something went wrong!";
					
				}
			
			}else{
				
				results.pass = false;
				results.message = "Oops, it seems you have already requested this coupon!";
				
			}
			
		}else{
			
			results.pass = false;
			results.message = "Sorry, but there aren't any coupons left.";
			
		}
		
		renderWith(results);
		
	}
	
	/* Creates a new coupon. */
	private function create(campaignid,userid){
		
		var campaign = model("campaign").findByKey(campaignid);
		
		if( campaign.couponTimeSpan IS 2 ){
			var days = campaign.couponTimeSpan * 7;
		}else{
			var days = campaign.couponTimeSpan;
		}
		
		newCoupon = model("coupon").new();
		
		newCoupon.campaignID = arguments.campaignid;
		newCoupon.userID = arguments.userid;
		newCoupon.couponCode = createUUID();
		newCoupon.issueDate = now();
		newCoupon.expirationDate = dateAdd('d', days, now());
		newCoupon.active = true;
		
		if( newCoupon.save() ){
			return newCoupon;
		}else{
			return false;
		}
		
	}
	
	/* Edit a coupon. */
	private function edit(){
		
		
		
	}
	
	/* Delete a coupon. */
	private function delete(){
		
			
		
	}
	
	/* Private. */
	private function availableCouponCount(campaignid){
		
		var couponCount = 0;
		var campaign = model("Campaign").findByKey(campaignid);
		var slots = campaign.couponSlots;
		var slotsTaken = model("Coupon").findAll(where="campaignid='#campaign.id#'");
		
		couponCount = slots - slotsTaken.recordCount;
		
		return couponCount;
		
		//renderNothing();
		
	}
	
	/* Not Duplicate Coupon. */
	private function notDuplicateCoupon(campaignid, userid){
		
		oCoupon = model("coupon").findAll(where="campaignid=#arguments.campaignid# AND userid=#arguments.userid#");
		
		if( oCoupon.recordCount GTE 1 ){
			
			return false;
			
		}else{
			
			return true;
			
		}
		
		
	}

}