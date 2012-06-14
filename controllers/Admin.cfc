component extends="Controller"{

	function init(){
		
		filters(through="authCheck", except="");
		provides("html,json");
		
	}
	
	
	function index(){
		
		
		
	}
	
	/* Manage Users. */
	function users(){
		
		
		
	}
	
	/* Manage Companies. */
	function companies(){
		
		companies = model("company").findAll();
		startRow = 1;
		endRow = companies.recordcount;
		
	}
	
	function addCompany(){
		
		var results = structNew();
		
		company = model("company").new();
		
		if( isaJAX() && isPost() ){
			
			newCompany = model("company").new(params.company);
			
			if( newCompany.save() ){
				
				results.pass = true;
				results.message = "";
				
			}else{
				
				results.pass = false;
				results.message = errorMessagesFor(objectName="newCompany", showDuplicates="false");
			}
			
			renderWith(results);
			
		}
		
	}
	
	function editCompany(){
		
		var results = structNew();
		
		company = model("company").findByKey(params.key);
		
		if( isAjax() && isPost() ){
			
			company.update(params.company);
			
			if( company.save() ){
				
				results.pass = true;
				results.message = "";
				
			}else{
				
				results.pass = false;
				results.message = errorMessagesFor(objectName="newCompany", showDuplicates="false");
			}
			
			renderWith(results);
			
		}
		
	}
	
	function removeCompany(){
		
		var results = structNew();
		
		if( isAjax() && isPost() ){
		
			company = model("company").findByKey(params.key);
			company.delete();
			
			results.pass = true;
			results.message = "Company has been successfully deleted!";
		
		}
		
		renderWith(results);
		
	}
	
	/* Manage Admin Users. */
	function adminUsersManager(){
		
		adminUsers = model("adminUser").findAll();
		startRow = 1;
		endRow = adminUsers.recordcount;
		
	}
	
	function addAdminUser(){
		
		adminUser = model("adminUser").new();
		
		if( isAjax() && isPost() ){
			
			adminUser.email = params.adminUser.email;
			adminUser.password = hash(params.adminUser.password);
			adminUser.role = 2;
			
			if( adminUser.save() ){
				
				results.pass = true;
				results.message = "";
				
			}else{
				
				results.pass = false;
				results.message = errorMessagesFor(objectName="adminUser", showDuplicates="false");
			}
			
			renderWith(results);
		
		}
		
		
	}
	
	function editAdminUser(){
		
		adminUser = model("adminUser").findByKey(params.key);
		
		if( isAjax() && isPost() ){
			
			adminUser.email = params.adminUser.email;
			
			// Only change the password if it's actually being changed.
			if( adminUser.password NEQ params.adminUser.password && hash(params.adminUser.password) NEQ adminUser.password ){
			
				adminUser.password = hash(params.adminUser.password);
				
			}
			
			adminUser.role = 2;
			
			if( adminUser.save() ){
				
				results.pass = true;
				results.message = "";
				
			}else{
				
				results.pass = false;
				results.message = errorMessagesFor(objectName="adminUser", showDuplicates="false");
			}
			
			renderWith(results);
		
		}
		
	}
	
	function deleteAdminUser(){
		
		var results = structNew();
		
		if( isAjax() && isPost() ){
		
			adminUser = model("adminUser").findByKey(params.key);
			adminUser.delete();
			
			results.pass = true;
			results.message = "User has been successfully deleted!";
		
		}
		
		renderWith(results);
		
	}
	
	/* Manage Campaigns. */
	function campaigns(){
		
		
		
	}

}