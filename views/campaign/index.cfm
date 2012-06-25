<cfoutput>

	<h1>Campaigns</h1>
	
	<div id="admin-content">
	
	#linkTo(action="add", text="Add Campaign")#
	
	<ul>
	<cfloop query="campaigns">
		
		<cfset rowColor = (campaigns.currentRow MOD 2 IS 0)?"light":"dark"/>
		
		<li class="#rowColor#">
			#campaigns.campaignName# -
			#linkTo(action="edit", text="edit", key=campaigns.id)# - 
			#linkTo(action="delete", text="delete", key=campaigns.id, class="ajaxLinkPost", rel="/index.cfm/campaign/index")#
		</li>
	</cfloop>
	</ul>
	
	</div>

</cfoutput>