<cfoutput>

	<h1>Please login to continue</h1>
	
	<div id="feedback"></div>
	
	#startFormTag(
		action="login",
		id="login-form"
	)#
	
	
		#textFieldTag(
			name="email",
			label="Email",
			labelPlacement="before"
		)#
		
		#passwordFieldTag(
			name="password",
			label="Password",
			labelPlacement="before"
		)#
		
		#submitTag(
			value="Log In",
			id="login-btn"
		)#
	
	#endFormTag(
		id="btn-login"
	)#
	

</cfoutput>