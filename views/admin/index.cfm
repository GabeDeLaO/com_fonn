<cfoutput>

	<h1>Welcome to the Fonn.com Admin</h1>
	
	#linkTo(controller="auth",action="logout", text="Log Out", id="logout")#
	
	<div id="menu">
		
		#linkTo(controller="admin",action="companies", text="Companies Manager", id="companies-manager")#
		
	</div>

</cfoutput>