/*
	This is the parent controller file that all your controllers should extend.
	You can add functions to this file to make them globally available in all your controllers.
	Do not delete this file.
*/
component extends="Wheels"{
	
	/* Login Check. */
	function authCheck(){
		
		if( ! struckKeyExists(session, "authUser") ){
			
			flashInsert(info="Please log in to continue.");
			redirectTo(controller="auth", action="logIn");
			
		}
		
	}
	
	/* Role Check. */
	function roleRequired(){
	
		if ( structKeyExists(session, "authUser") ){
			
			if (!session.authUser.role_id IS 1){
			
				redirectTo(route="home");
			
			}
				
		}else{
		
			redirectTo(route="home");
		
		}
	
	}

}
