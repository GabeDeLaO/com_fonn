component extends="Controller"{

	function init(){
		
		filters(through="authCheck", except="");
		provides("html,json");
		
	}
	
	
	function index(){
		
		bodyID = "admin";
		
	}
	
	/* Manage Users. */
	function users(){
		
		bodyID = "admin";
		
	}
	
	/* Manage Companies. */
	function companies(){
		
		bodyID = "admin";
		companies = model("company").findAll();
		startRow = 1;
		endRow = companies.recordcount;
		
	}
	
	function addCompany(){
		
		var results = structNew();
		
		bodyID = "admin";
		company = model("company").new();
		states = model("state").findAll();
		
		if( isaJAX() && isPost() ){
			
			newCompany = model("company").new(params.company);
			newCompany.adminCompanyID = session.authUser.adminCompanyID;
			
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
		
		if( structKeyExists(session,"currentEdit") ){
			structDelete(session, "currentEdit");
		}
		
		bodyID = "admin";
		
		var results = structNew();
		
		company = model("company").findByKey(params.key);
		states = model("state").findAll();
		
		//Set the session company being edited.
		session.currentEdit.companyID = params.key;
		
		bannersList = model("profileBanner").findAll(where="companyID=#params.key#");
		
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
		
		bodyID = "admin";
		
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
		
		bodyID = "admin";
		
		adminUsers = model("adminUser").findAll();
		startRow = 1;
		endRow = adminUsers.recordcount;
		
	}
	
	function addAdminUser(){
		
		bodyID = "admin";
		
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
		
		bodyID = "admin";
		
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
		
		bodyID = "admin";
		
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
		
		bodyID = "admin";
		
		
	}
	
	function banners(){
		
		var companyID = session.currentEdit.companyID;
		
		bannersList = model("profileBanner").findAll(where="companyID=#companyID#");
		
		renderPartial("banners");
		
	}
	
	function editBanner(){
		
		var results = structNew();
		
		if( isPost() AND isAjax() ){
			
			banner = model("profilebanners").findByKey(params.bannerID);
			banner.text = params.bannerText;
			
			if( banner.save() ){
				
				results.pass = true;
				results.message = "You have updated the banner!";
				
			}else{
				
				results.pass = false;
				results.message = "Something went wrong!";
				
			}
			
		}
		
		renderWith(results);
		
	}
	
	function removeBanner(){
		
		var results = structNew();
		
		if( isPost() AND isAjax() ){
			
			banner = model("profilebanner").findByKey(params.bannerID);
			fileDelete("#expandPath('/images/campaigns/big')#/#banner.banner#");
			
			banner.delete();
			
			results.pass = true;
			results.message = "You have removed the banner!";
			
		}
		
		renderWith(results);
		
	}

}