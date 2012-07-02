<cfoutput>
	
	<div id="validationMessage"></div>
	
	#startFormTag(
		action="validator",
		id="validatorForm"
	)#
	
	#textFieldTag(
		id="couponCode",
		name="couponCode",
		value="",
		label="Code:"
	)#
	
	
	#hiddenFieldTag(
		id="key",
		name="key",
		value="#hash(session.authUser.adminCompanyID)#"
	)#
	
	#submitTag(
		value="Validate"
	)#
	
	#endFormTag()#

</cfoutput>