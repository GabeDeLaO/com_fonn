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
		
		if( isaJAX() && isPost() ){
			
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
	
	/* Manage Campaigns. */
	function campaigns(){
		
		
		
	}

}