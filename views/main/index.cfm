<cfoutput>

<cfif isDefined("session.user") AND session.user.email NEQ "">
	<h2 class="greeting">Welcome, #session.user.email#</h2>
</cfif>


<ul>
	
	<cfloop query="campaigns">
		<a href="index.cfm/main/profile/#campaigns.id#">
			<li class="coupon-box">
				<div class="coupon-image">
					<img src="/images/campaigns/small/#campaigns.smallImage#"/>
				</div>
				<!---#campaigns.campaignName#---> <center>
				  <h7>#DollarFormat(campaigns.campaignValue)#</h7>
				</center>
		</li>
		</a>
	</cfloop>
	
</ul>


</cfoutput>