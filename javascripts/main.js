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
fnn.uploadType			=	'';

pri = {};

// On doc ready.
$(function(){
	
	$.ajaxSetup({ cache: false });
	
	init();
	
});


function init(){
	
	fnn.browserDetection();
	fnn.loading();
	fnn.login();
	fnn.logout();
	fnn.addCompany();
	fnn.editCompany();
	fnn.deleteCompany();
	fnn.ajaxPostInterceptor();
	fnn.ajaxLinkDeleteInterceptor();
	fnn.couponLink();
	
	fnn.plupload();
	fnn.editBanner();
	fnn.removeBanner();
	fnn.googleMaps();
	
	if( $(".wt-rotator").length ){
		
		(function() {
			$(".container").wtRotator({
				width:960,
				height:300,
				thumb_width:24,
        		thumb_height:24,
				button_width:24,
				button_height:24,
				button_margin:5,
				auto_start:true,
				delay:5000,
				play_once:false,
				transition:"fade",
				transition_speed:800,
				auto_center:true,
				easing:"",
				cpanel_position:"inside",
				cpanel_align:"BR",
				timer_align:"top",
				display_thumbs:true,
				display_dbuttons:true,
				display_playbutton:true,
				display_thumbimg:false,
       			display_side_buttons:false,
				display_numbers:true,
				display_timer:true,
				mouseover_select:false,
				mouseover_pause:false,
				cpanel_mouseover:false,
				text_mouseover:false,
				text_effect:"fade",
				text_sync:true,
				tooltip_type:"text",
				shuffle:false,
				block_size:75,
				vert_size:55,
				horz_size:50,
				block_delay:25,
				vstripe_delay:75,
				hstripe_delay:180			
			});
		})();
		
	}
	
}

fnn.googleMaps = function(){
	
	if( $("#company-location").length ){
	
		var geocoder = new google.maps.Geocoder();
		var address = $("#address").text();
		var myOptions = {zoom: 8,mapTypeId: google.maps.MapTypeId.ROADMAP};
	    var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
	    
	    geocoder.geocode( { 'address': address}, function(results, status) {
	      if ( status == google.maps.GeocoderStatus.OK ) {
	        
	        var contentString = '<h2>'+$("#company-name").text()+'</h2>'+
	        '<br/>'+'<p>'+address+'</p>'+'<a href="http://maps.google.com/maps?saddr=&daddr='+address+'" target="_blank">Get Directions</a>';
	        
	        map.setCenter(results[0].geometry.location);
	        var infoBubble = new google.maps.InfoWindow({
		        content: contentString
	        });
	        var marker = new google.maps.Marker({
	            map: map, 
	            position: results[0].geometry.location,
	            title: $("#company-name").text()
	        });
	        
	        google.maps.event.addListener(marker, 'click', function() {
			  infoBubble.open(map,marker);
			});
	        
	      }else{
	        alert("Geocode was not successful for the following reason: " + status);
	      }
	    });     
     }
	
}


fnn.removeBanner = function(){
	
	$("body #remove-banner").on("click",function(e){
		
		e.preventDefault();
		
		var bannerID = $(this).attr("rel");
		
		if(confirm("Are you sure you want to delete this banner?")){

			//remove the banner.
			$.ajax({				
				type: 'post',
				url: '/index.cfm/admin/removeBanner'+'?format=json',
				data: {bannerID:bannerID},
				error: function(xhr,type,exception){
					alert("Oops, something went wrong.");
				},
				success: function(response){
					
					if( response.PASS == true ){
					
						$("#feedback").text(response.message);
						$("li#"+bannerID).remove();
					
					}else{
						
						$("#feedback").text(response.message);
						
					}
					
				}
			});
		
		}
	
	});
}

fnn.editBanner = function(){
	
	$("body #edit-banner").on("click",function(e){
		
		e.preventDefault();
		var bannerID = $(this).attr("rel");
		var li = $("li#"+bannerID);
		var bannerTextField = li.find($("#bannerText"+bannerID));
		var bannerTextDisp = li.find($(".bannerTextDisplay"));
		var saveBannerLink = $("#save-banner[rel='"+bannerID+"']");
		var editBannerLink = $("#edit-banner[rel='"+bannerID+"']");
		
		bannerTextDisp.hide("fast",function(){
			
			bannerTextField.show().focus();	
			
		});
		
		$(this).hide("fast",function(){
			
			saveBannerLink.show("slow", function(){
				
				$(this).click(function(e){
					
					e.preventDefault();
					
					//Post the edits.
					$.ajax({				
						type: 'post',
						url: '/index.cfm/admin/editBanner'+'?format=json',
						data: {bannerID:bannerID, bannerText:bannerTextField.val()},
						error: function(xhr,type,exception){
							alert("Oops, something went wrong.");
						},
						success: function(response){
							
							if( response.PASS == true ){
								
								bannerTextDisp.text(bannerTextField.val());
								
								bannerTextField.fadeOut("fast",function(){
									
									bannerTextDisp.fadeIn("fast",function(){
										
										saveBannerLink.hide("fast",function(){
											
											editBannerLink.show();
											
										});
										
									});
									
								});
								
							}
						}
					});
					
				});
				
			});
			
		});
			
	});
	
}

// Browser width detection.
fnn.browserDetection = function(){
	
	if ( parseInt($(window).width()) < 480 ){
		$("#size-stylesheet").attr("href", "/stylesheets/mobile.css");
    } else {
       $("#size-stylesheet").attr("href", "/stylesheets/main.css"); 
    }
	
	
	$(window).resize(function() {
	  	
	    width = parseInt($(this).width());
	    
	    if (width < 480) {
	        $("#size-stylesheet").attr("href", "/stylesheets/mobile.css");
	    } else {
	       $("#size-stylesheet").attr("href", "/stylesheets/main.css"); 
	    }
    
    });
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
						
					}else if( afterSubmission == 'rerender' ){
						
						$("#couponLink").trigger("click");
						
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

fnn.couponLink = function(){
	
	$("#couponLink").on("click",function(e){
		
		e.preventDefault();
		
		//Check for session.
		$.ajax({
			
			type: 'post',
			url: '/index.cfm/main/gaveUsEmail?format=json',
			error: function(xhr,type,exception){
				alert("Oops, something went wrong");
			},
			success: function(response){
				
				if( response.PASS == true ){
					
					//Request the coupon.
					pri.SendCoupon($("#couponLink").attr("href"));
					
				}else{
					
					// Provide us the email.
					$("#couponLink").hide();
					pri.ProvideEmail();
					
				}
				
			}
			
		});
		
	});
	
}

pri.ProvideEmail = function(){
	
	$("#email-box").fadeIn("slow");
	
}

pri.SendCoupon = function(couponRequest){

	//Request the coupon.
	$.ajax({
			
		type: 'post',
		url: couponRequest+'?format=json',
		error: function(xhr,type,exception){
			alert("Oops, something went wrong");
		},
		success: function(response){
			
			if( response.PASS == true ){
				
				fnn.feedback.hide().html(response.MESSAGE).fadeIn("slow");
				
			}else{
				
				fnn.feedback.hide().html(response.MESSAGE).fadeIn("slow");
				
			}
			
		}
		
	});
	
}

fnn.plupload = function(){
	
	$("#uploadForm").hide();
	
	$("#add-banner").click(function(e){
		
		e.preventDefault();
		fnn.uploadType = 'banner';
		
		$("#uploadForm").fadeIn("fast");
		fnn.uploadAction("banner");
		
	});
	
	$("#add-profile-pic").click(function(e){
		
		e.preventDefault();
		fnn.uploadType = 'profile';
		
		$("#uploadForm").fadeIn("fast");
		fnn.uploadAction("profile");
		
	});
	
}

fnn.uploadAction = function(uploadType){
	
	$(function() {
		function log() {
			var str = "";
	
			plupload.each(arguments, function(arg) {
				var row = "";
	
				if (typeof(arg) != "string") {
					plupload.each(arg, function(value, key) {
						// Convert items in File objects to human readable form
						if (arg instanceof plupload.File) {
							// Convert status to human readable
							switch (value) {
								case plupload.QUEUED:
									value = 'QUEUED';
									break;
	
								case plupload.UPLOADING:
									value = 'UPLOADING';
									break;
	
								case plupload.FAILED:
									value = 'FAILED';
									break;
	
								case plupload.DONE:
									value = 'DONE';
									break;
							}
						}
	
						if (typeof(value) != "function") {
							row += (row ? ', ': '') + key + '=' + value;
						}
					});
	
					str += row + " ";
				} else { 
					str += arg + " ";
				}
			});
	
			//$('#log').val($('#log').val() + str + "\r\n");
		}
	
		$("#uploader").pluploadQueue({
			// General settings
			runtimes: 'html5,gears,browserplus,silverlight,flash,html4',
			url: '/index.cfm/uploader/upload?type='+uploadType,
			max_file_size: '10mb',
			chunk_size: '1mb',
			unique_names: true,
	
			// Resize images on clientside if we can
			//resize: {width: 320, height: 240, quality: 90},
	
			// Specify what files to browse for
			filters: [
				{title: "Image files", extensions: "jpg,gif,png"},
				{title: "Zip files", extensions: "zip"}
			],
	
			// Flash/Silverlight paths
			flash_swf_url: 'miscellaneous/plupload/js/plupload.flash.swf',
			silverlight_xap_url: 'miscellaneous/plupload/js/plupload.silverlight.xap',
	
			// PreInit events, bound before any internal events
			preinit: {
				Init: function(up, info) {
					log('[Init]', 'Info:', info, 'Features:', up.features);
				},
	
				UploadFile: function(up, file) {
					log('[UploadFile]', file);
	
					// You can override settings before the file is uploaded
					// up.settings.url = 'upload.php?id=' + file.id;
					//up.settings.multipart_params = { param2: 'value2'};
				}
			},
	
			// Post init events, bound after the internal events
			init: {
				Refresh: function(up) {
					// Called when upload shim is moved
					log('[Refresh]');
				},
	
				StateChanged: function(up) {
					// Called when the state of the queue is changed
					log('[StateChanged]', up.state == plupload.STARTED ? "STARTED": "STOPPED");
				},
	
				QueueChanged: function(up) {
					// Called when the files in queue are changed by adding/removing files
					log('[QueueChanged]');
				},
	
				UploadProgress: function(up, file) {
					// Called while a file is being uploaded
					log('[UploadProgress]', 'File:', file, "Total:", up.total);
				},
	
				FilesAdded: function(up, files) {
					// Callced when files are added to queue
					log('[FilesAdded]');
	
					plupload.each(files, function(file) {
						log('  File:', file);
					});
				},
	
				FilesRemoved: function(up, files) {
					// Called when files where removed from queue
					log('[FilesRemoved]');
	
					plupload.each(files, function(file) {
						log('  File:', file);
					});
				},
	
				FileUploaded: function(up, file, info) {
					// Called when a file has finished uploading
					log('[FileUploaded] File:', file, "Info:", info);
					// Reload the partial.
					if( uploadType == "banner" ){
						$("#bannersList").load("/index.cfm/admin/banners",function(){
							
							//Re-attach the events.
							fnn.editBanner();
							fnn.removeBanner();
							
						});
					}else{
						//$("#profile-pic-preview").find("img").attr("src","/images/campaigns/small/"+file.name);
						window.location.reload();
					}
					
				},
	
				ChunkUploaded: function(up, file, info) {
					// Called when a file chunk has finished uploading
					log('[ChunkUploaded] File:', file, "Info:", info);
				},
	
				Error: function(up, args) {
					// Called when a error has occured
	
					// Handle file specific error and general error
					if (args.file) {
						log('[error]', args, "File:", args.file);
					} else {
						log('[error]', args);
					}
				}
			}
		});
	
		$('#log').val('');
		$('#clear').click(function(e) {
			e.preventDefault();
			$("#uploader").pluploadQueue().splice();
		});
		$('#close').click(function(e){
			e.preventDefault();
			$("#uploadForm").fadeOut("fast",function(){
				$("#uploader").pluploadQueue().splice();
			});
			
		});
	});
	
}

