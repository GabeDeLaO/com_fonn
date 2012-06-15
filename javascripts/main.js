// Namespaces.
fnn = {};

fnn.loginForm 			= 	$("#login-form");
fnn.loginBtn 			= 	$("#login-btn");
fnn.feedback			=	$("#feedback");
fnn.logoutLink			=	$("#logout");
fnn.addCompanyForm 		= 	$("#add-company-form");
fnn.addCompanyBtn		=	$("#add-companyBtn");
fnn.editCompanyForm 	= 	$("#edit-company-form");
fnn.editCompanyBtn		=	$("#edit-companyBtn");
fnn.ajaxLoader			=	$(".ajaxLoader");
fnn.deleteCompanyBtn	=	$(".delete-companyBtn");
fnn.addAdminUserBtn		=	$("#add-adminUserBtn");

// On doc ready.
$(function(){
	
	$.ajaxSetup({ cache: false });
	
	init();
	
});


function init(){
	
	fnn.loading();
	fnn.login();
	fnn.logout();
	fnn.addCompany();
	fnn.editCompany();
	fnn.deleteCompany();
	fnn.ajaxPostInterceptor();
	fnn.ajaxLinkDeleteInterceptor();
	
}


// Functions.

fnn.loading = function(){
	
	fnn.ajaxLoader.ajaxStart(function(){
		
		$(this).show();
		
	});
	
	fnn.ajaxLoader.ajaxComplete(function(){
		
		$(this).fadeOut("slow");
		
	});
	
}

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
					
					window.location.href = '/index.cfm/auth/log-in';
					
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


fnn.addCompany = function(){
	
	fnn.addCompanyBtn.click(function(e){
		
		e.preventDefault();
		
		addCompanyRequest = $.ajax({
			
			type:'post',
			url: '/index.cfm/admin/addCompany?format=json',
			data: fnn.addCompanyForm.serialize(),
			error: function(xhr,type,exception){
				//alert("Error:" + type);
				alert("Oops, something went wrong. Please try your request again.");
			},
			success: function(response){
				//window.location.href = '/index.cfm/admin/index';
				if( response.PASS == true ){
					
					window.location.href = '/index.cfm/admin/companies';
					
				}else{
					
					//alert("Oops, something went wrong.");
					fnn.feedback.hide().html(response.MESSAGE).fadeIn("slow");
					
				}
				
			},
			complete: function(){
				addCompanyRequest = null;
			}	
			
		});
		
	});
	
}

fnn.editCompany = function(){
	
	fnn.editCompanyBtn.click(function(e){
		
		e.preventDefault();
		
		addCompanyRequest = null;
		
		if( addCompanyRequest == null ){
		
			addCompanyRequest = $.ajax({
				
				type:'post',
				url: fnn.editCompanyForm.attr("action")+'?format=json',
				data: fnn.editCompanyForm.serialize(),
				error: function(xhr,type,exception){
					//alert("Error:" + type);
					alert("Oops, something went wrong. Please try your request again.");
				},
				success: function(response){
					//window.location.href = '/index.cfm/admin/index';
					if( response.PASS == true ){
						
						window.location.href = '/index.cfm/admin/companies';
						
					}else{
						
						//alert("Oops, something went wrong.");
						fnn.feedback.hide().html(response.MESSAGE).fadeIn("slow");
						
					}
					
				},
				complete: function(){
					addCompanyRequest = null;
				}	
				
			});
		
		}
		
	});
	
}

fnn.deleteCompany = function(){
	
	$(".delete-companyBtn").each(function(){
		
		$(this).click(function(e){
		
			e.preventDefault();
			
			$.ajax({
				
				type: 'post',
				url: $(this).attr("href")+'?format=json',
				error: function(xhr,type,exception){
					alert("Oops, something went wrong.");
				},
				success: function(response){
					
					if( response.PASS == true ){
						
						window.location.href = '/index.cfm/admin/companies';
						
					}
					
				}
				
			});
			
		});
		
	});
}


fnn.ajaxPostInterceptor = function(){
	
	// Find an ajax form.
	$(".ajaxForm").on("submit", function(e){
		
		e.preventDefault();
		
		var afterSubmission = $("input[name='afterSubmission']").val();
		var goTo = '/index.cfm/'+$("input[name='goTo']").val();
		
		
		$.ajax({
			
			type: 'post',
			url: $(this).attr("action")+'?format=json',
			data: $(this).serialize(),
			error: function(xhr,type,exception){
				alert("Oops, something went wrong");
			},
			success: function(response){
				
				if( response.PASS == true ){
					
					if( afterSubmission == 'relocate' ){
						
						window.location.href = goTo;
						
					}else{
						
						fnn.feedback.hide().html(response.MESSAGE).fadeIn("slow");	
						
					}
					
				}else{
					
					fnn.feedback.hide().html(response.MESSAGE).fadeIn("slow");
					
				}
				
			}
			
		});
		
		
	});
	
}


fnn.ajaxLinkDeleteInterceptor = function(){
	
	$(".ajaxLinkPost").on("click",function(e){
		
		e.preventDefault();
		
		var afterClick = 'reload';
		var goTo = $(this).attr("rel");
		
		if(confirm("Are you sure you want to delete this?")){
		
			$.ajax({
				
				type: 'post',
				url: $(this).attr("href")+'?format=json',
				error: function(xhr,type,exception){
					alert("Oops, something went wrong");
				},
				success: function(response){
					
					if( response.PASS == true ){
						
						if( afterClick == 'reload' ){
							
							window.location.href = goTo;
							
						}else{
							
							fnn.feedback.hide().html(response.MESSAGE).fadeIn("slow");	
							
						}
						
					}else{
						
						fnn.feedback.hide().html(response.MESSAGE).fadeIn("slow");
						
					}
					
				}
				
			});
		
		}
		
		
	})
	
}

