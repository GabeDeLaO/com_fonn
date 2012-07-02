$(function(){
	
	$.ajaxSetup({ cache: false });
	
	//Handle the validator form submission.
	
	(function(){
		
		$("#validatorForm").submit(function(e){
			
			e.preventDefault();
			
			$.ajax({
				
				type: 'post',
				url: '/index.cfm/validator/validate?format=json',
				data: $("#validatorForm").serialize(),
				error: function(xhr,type,exception){
					//alert("Error:" + type);
					alert("Oops, something went wrong. Please try your request again.");
				},
				success: function(response){
				
					if( response.PASS == true ){
						
					}else{
						
						$("#validationMessage").text(response.MESSAGE);
						
					}
					
				},
				complete: function(){
				}	
					
			});
			
		});
		
	})();
	
	
});