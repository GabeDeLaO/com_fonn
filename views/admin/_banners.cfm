<cfoutput>

<ul>
	<cfloop query="bannersList">
	<li>
		<div class="banner-thumb"><img src="/images/campaigns/big/#bannersList.banner#" width="200"/></div>
		<div class="banner-text">#bannersList.text#
			<textarea class="bannerText" id="bannerText#bannersList.id#">#bannersList.text#</textarea>
		</div>
		<div class="actions">
			<a href="##edit" id="edit-banner" rel="#bannersList.id#">Edit</a>
			<a href="" id="remove-banner">Remove</a>
		</div>
	</li>
	</cfloop>
</ul>

</cfoutput>