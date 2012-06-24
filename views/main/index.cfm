<cfoutput>

<cfif isDefined("session.user") AND session.user.email NEQ "">
	<h2>Welcome, #session.user.email#
</cfif>


<ul>
	
	<cfloop query="campaigns">
		<li class="coupon-box">
			<div class="coupon-image">
				
			</div>
			#campaigns.campaignName# #DollarFormat(campaigns.campaignValue)#
			- #linkTo(action="profile", text="view", key=campaigns.id)#
		</li>
	</cfloop>
	
</ul>


</cfoutput>