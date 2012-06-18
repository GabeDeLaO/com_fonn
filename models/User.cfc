component extends="Model"{

	function init(){

		//Associations.

		//Validations.
		/*validatesFormatOf(
			
			property = "email",
			type = "email",
			message = "Please provide a valid email address.",
			regEx = "^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$"
			
		);*/
		
		validatesUniquenessOf(
			
			property = "email",
			allowBlank = true,
			message = "Sorry, but this email has already been registered. Forgot email?"
			
		);		

	}	

}