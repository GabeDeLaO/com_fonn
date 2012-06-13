// Namespaces.
fnn = {};

fnn.loginForm 	= 	$("#login-form");
fnn.loginBtn 	= 	$("#login-btn");
fnn.feedback	=	$("#feedback");
fnn.logoutLink	=	$("#logout");

// On doc ready.
$(function(){
	
	$.ajaxSetup({ cache: false });
	
	init();
	
});


function init(){
	
	fnn.login();
	
}


// Functions.

fnn.login = function(email,password){

	fnn.loginBtn.click(function(e){
		
		e.preventDefault();
			
		loginRequest = $.ajax({
			
			type:'post',
			url: '/index.cfm/auth/login?format=json',
			data: fnn.loginForm.serialize(),
			error: function(xhr,type,exception){
				//alert("Error:" + type);
				alert("Oops, something went wrong. Please try your request again.");
			},
			success: function(response){
				//window.location.href = '/index.cfm/admin/index';
				if( response.PASS == true ){
					
					window.location.href = '/index.cfm/admin/index';
					
				}else{
					
					fnn.feedback.text(response.MESSAGE);
					console.log(response.MESSAGE);	
				}
				
			},
			complete: function(){
				loginRequest = null;
			}	
			
		});
	
	});
	
}

fnn.logout = function(){
	
	fnn.logoutLink.click(function(e){
		
		e.preventDefault();
		
		logoutRequest = $.ajax({
			
			type:'post',
			url: '/index.cfm/auth/logout?format=json',
			error: function(xhr,type,exception){
				//alert("Error:" + type);
				alert("Oops, something went wrong. Please try your request again.");
			},
			success: function(response){
				//window.location.href = '/index.cfm/admin/index';
				if( response.PASS == true ){
					
					window.location.href = '/index.cfm/login/index';
					
				}else{
					
					alert("Oops, something went wrong.");
					
				}
				
			},
			complete: function(){
				logoutRequest = null;
			}	
			
		});
		
	});
	
}