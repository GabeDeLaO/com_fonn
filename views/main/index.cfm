<cfoutput>

<h1>Fonn.com</h1>

<h3>Today's Deals</h3>

<ul>
	
	<cfloop query="campaigns">
		<li>
			#campaigns.campaignName#
			- #linkTo(action="profile", text="view", key=campaigns.id)#
		</li>
	</cfloop>
	
</ul>


</cfoutput>