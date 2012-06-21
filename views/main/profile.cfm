<cfoutput>
	
	<div id="company-banner"></div>
	
	<div id="feedback"></div>
	
	<h1>#campaign.campaignName#</h1>
	
	<p>#campaign.company.companyName#</p>
	
	<p>#campaign.restrictions#</p>
	
	<p>#campaign.description#</p>
	
	#linkTo(controller="coupon", action="requestCoupon", text="Send me this coupon", key=campaign.id, id="couponLink")#
	
	<div id="email-box">
		
		<p>Please provide your email.</p>
		
		#startFormTag(action="setUserEmail", class="ajaxForm")#
			
			#textFieldTag(
				name="email",
				label="email"
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
				value="Save Email"
			)#
			
		#endFormTag()#
		
	</div>
	
</cfoutput>