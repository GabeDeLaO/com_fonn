component extends="Model"{

	function init(){

		//Associations.
		belongsTo("company");

		//Validations
		validatesPresenceOf(
			properties = "campaignName,startdate,enddate,couponslots,couponexpiration,couponTimeSpan,campaignValue",
			message = "Please make sure to fill everything out that is required."
		);
		
		validatesNumericalityOf(
			property = "couponSlots",
			message = "Please provide an available number of coupon slots.",
			allowBlank = true
		);
		
		validatesNumericalityOf(
			property = "campaignValue",
			message = "Please provide a valid campaign value.",
			allowBlank = true
		);		

	}	

}