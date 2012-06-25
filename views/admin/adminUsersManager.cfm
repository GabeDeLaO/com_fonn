<cfoutput>
	
	<h1>Admin Users</h1>
	
	<div id="admin-content">
	
	#linkTo(action="addAdminUser", text="Add an admin user")#
	
	<ul>
		
		<cfloop query="adminUsers" startRow="#startRow#" endRow="#endRow#">
			
			<cfset rowColor = (adminUsers.currentRow MOD 2 IS 0)?"light":"dark"/>
			
			<li class="#rowColor#">
				#adminUsers.email# 
				- #linkTo(action="edit-admin-user", text="edit", key=adminUsers.id)# 
				- #linkTo(action="delete-admin-user", text="delete", key=adminUsers.id, class="ajaxLinkPost", rel="admin-users-manager")#
			</li>
		</cfloop>
		
	</ul>
	
	</div>
	
</cfoutput>