<cfoutput>

<h1>Fonn.com</h1>

<cfif isDefined("session.user") AND session.user.email NEQ "">
	<h2>Welcome, #session.user.email#
</cfif>

<h3>Today's Deals</h3>

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