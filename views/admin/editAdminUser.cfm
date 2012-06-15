<cfoutput>
	
	#startFormTag(
		action="edit-admin-user", 
		class="ajaxForm",
		key=params.key
	)#
	
		#hiddenFieldTag(
			name="afterSubmission",
			value="relocate"	
		)#
		
		#hiddenFieldTag(
			name="goTo",
			value="admin/admin-users-manager"
		)#
	
		#textField(
			objectName="adminUser",
			property="email",
			label="Email"
		)#
		
		#passwordField(
			objectName="adminUser",
			property="password",
			label="Password"
		)#
		
		#submitTag(
			value="Edit Admin User",
			id="edit-adminUserBtn"
		)#
	
	
	#endFormTag()#

</cfoutput>