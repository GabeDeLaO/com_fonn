<cfoutput>

	<h1>Campaigns</h1>
	
	#linkTo(action="add", text="Add Campaign")#
	
	<ul>
	<cfloop query="campaigns">
		<li>
			#campaigns.campaignName# -
			#linkTo(action="edit", text="edit", key=campaigns.id)# - 
			#linkTo(action="delete", text="delete", key=campaigns.id, class="ajaxLinkPost", rel="/index.cfm/campaign/index")#
		</li>
	</cfloop>
	</ul>

</cfoutput>