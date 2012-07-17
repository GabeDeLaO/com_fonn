component extends="controller"{
	
	function init(){
		
		provides("html,json");
		
	}
	
	function expired(){
		
		var results = structNew();
		
		if( structKeyExists(url,"token") AND url.token IS hash('fonn') ){
		
			var today = dateFormat(now(),"yyyy-mm-dd");
			// Grab all the coupons that expired today and soft delete them, so other users can use the newly available coupons.
			results.couponsUpdated = model("coupon").findAll(where="expirationDate < '#today#' AND redeemDate IS NULL");
			expiredCoupons = model("coupon").updateAll(deletedat=now(),where="expirationDate < '#today#' AND redeemDate IS NULL");		
			
			var results.message = "Expired #expiredCoupons# coupons on #dateFormat(now(),'yyyy-mm-dd')# #timeFormat(now(),'full')#";
			
			writeDump(var="#results#", output="#expandPath('/miscellaneous/logs.txt')#", abort="false");
			
		}
		
		renderNothing();
		
	}
	
}