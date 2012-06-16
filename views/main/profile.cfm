<cfoutput>

	<h1>#campaign.campaignName#</h1>
	
	<p>#campaign.description#</p>
	
	#linkTo(action="requestCoupon", text="Send me this coupon", key=campaign.id, id="couponLink")#
	
</cfoutput>