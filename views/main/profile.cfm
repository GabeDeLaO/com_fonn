<cfoutput>
	
	<div id="company-banner">
	</div>
	
	<div id="campaign-info">
		<p>#campaign.company.companyName#</p>
	</div>
	
	<div id="profile-bar">
		<div class="left">
			<h2 id="deal-title">#campaign.campaignName#</h2>
			<div id="signUp">
				#linkTo(controller="coupon", action="requestCoupon", text="Send me this coupon", key=campaign.id, id="couponLink")#
				
				<div id="email-box">
		
					#startFormTag(action="setUserEmail", class="ajaxForm")#
						
						#textFieldTag(
							name="email",
							label="Please provide your email"
						)#
						
						#hiddenFieldTag(
							name="afterSubmission",
							value="rerender"	
						)#
						
						#hiddenFieldTag(
							name="goTo",
							value="couponLink"
						)#
						
						#submitTag(
							value="Send me my gift!",
							id="btnSendCoupon"
						)#
						
					#endFormTag()#
					
				</div>
				
			</div>
		</div>
		<div class="right">
			
		</div>
	</div>
	
	<div id="content">
		<div class="left">
		<div id="feedback"></div>
		
		<p class="fine-print">*#campaign.restrictions#</p>	
		
		<h5>Overview</h5>
		<p class="overview">#campaign.description#</p>
		</div>
		
		<div class="right">
			<div id="company-location">
				#campaign.company.companyName#<br/>
				<span id="address">#campaign.company.address# #campaign.company.city#, #campaign.company.state# #campaign.company.zipcode#</span><br/>
				#campaign.company.phone#
			</div>
			
			<!---<script type="text/javascript">
				codeAddress();
			</script>--->
			
			<div id="map_canvas" style="width:100%; height:250px;display:block"></div>
			
		</div>
	</div>
	
</cfoutput>