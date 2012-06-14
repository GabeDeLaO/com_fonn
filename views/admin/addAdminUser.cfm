<cfoutput>
	
	#startFormTag(
		action="add-admin-user", 
		class="ajaxForm"
	)#
	
		#hiddenFieldTag(
			name="afterSubmission",
			value="relocate"	
		)#
		
		#hiddenFieldTag(
			name="goTo",
			value="admin-users-manager"
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
			value="Add Admin User",
			id="add-adminUserBtn"
		)#
	
	
	#endFormTag()#

</cfoutput>