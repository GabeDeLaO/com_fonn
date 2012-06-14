<cfoutput>
	
	<h1>Admin Users</h1>
	
	#linkTo(action="addAdminUser", text="Add an admin user")#
	
	<ul>
		
		<cfloop query="adminUsers" startRow="#startRow#" endRow="#endRow#">
			<li>
				#adminUsers.email# 
				- #linkTo(action="edit-admin-user", text="edit", key=adminUsers.id)# 
				- #linkTo(action="delete-admin-user", text="delete", key=adminUsers.id, class="ajaxLinkPost", confirm="Are you sure you want to delete this Admin User?", rel="admin-users-manager")#
			</li>
		</cfloop>
		
	</ul>
	
</cfoutput>