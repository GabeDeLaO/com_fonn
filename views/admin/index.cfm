<cfoutput>

	<h1>Welcome to the Fonn.com Admin</h1>
	
	#linkTo(controller="auth",action="logout", text="Log Out", id="logout")#
	
	<div id="menu">
		
		#linkTo(controller="admin",action="companies", text="Companies Manager", id="companies-manager")#
		#linkTo(controller="admin",action="admin-users-manager", text="Admin Users Manager", id="adminusers-manager")#
		
		#linkTo(controller="campaign", action="index", text="Manage Campaigns")#
		
	</div>

</cfoutput>