<cfoutput>

<ul id="banners-list">
	<cfloop query="bannersList">
	<li id="#bannersList.id#">
		<div class="banner-thumb"><img src="/images/campaigns/big/#bannersList.banner#" width="200"/></div>
		<div class="banner-text">
			<div class="bannerTextDisplay">#bannersList.text#</div>
			<textarea class="bannerText" id="bannerText#bannersList.id#">#bannersList.text#</textarea>
		</div>
		<div class="actions">
			<a href="##edit" id="edit-banner" rel="#bannersList.id#">Edit</a>
			<a href="##save" id="save-banner" rel="#bannersList.id#">Save</a>
			<a href="" id="remove-banner" rel="#bannersList.id#">Remove</a>
		</div>
	</li>
	</cfloop>
</ul>

</cfoutput>