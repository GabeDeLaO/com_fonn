component extends="Controller"{

	function init(){
		
		provides("html,json");
		
	}
	
	function logIn(){
		
		var results = structNew();
		
		if( isAjax() && isPost() ){
			
			//Try to authenticate the user.
			
			authUser = model("adminUser").findOne(where="email='#params.email#'");
			
			if( isObject(authUser) ){
				
				if( authUser.password IS hash(params.password) ){
					
					//writeDump(var="#authUser#", abort="true");
					
					//Create the session.
					session.authUser = structNew();
					session.authUser.id = authUser.id;
					session.authUser.email = authUser.email;
					session.authUser.role = authUser.role;
					session.authUser.adminCompanyID = authUser.adminCompanyID;
					session.authUser.token = hash(authUser.adminCompanyID);
					session.authUser.superAdmin = (authUser.adminCompanyID IS 1)? TRUE : FALSE;
					
					results.pass = true;
					results.message = "";
					
				}else{
					
					results.pass = false;
					results.message = "Looks like the password doesn't match our records.";
					
				}
				
			}else{
					
					results.pass = false;
					results.message = "Looks like the email provided is incorrect.";
					
				}
			
			renderWith(results);
			
		}
		
	}
	
	
	function logOut(){
	
		var results = structNew();
		
		if( isAjax() ){
			
			//Clear out the session.
			structDelete(session, "authUser");
			
			results.pass = true;
			
		}else{
			
			//Clear out the session & redirect.
			structDelete(session, "authUser");
			redirectTo(action="login");
			
		}
		
		renderWith(results);
	
	}

}