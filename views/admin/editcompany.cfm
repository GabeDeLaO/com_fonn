<cfoutput>
	
	<div id="uploadForm">
		
		#includePartial("uploader")#
		
	</div>
	
	<div id="feedback">
	
	</div>
	
	#startFormTag(
		id="edit-company-form",
		action="edit-company",
		key=params.key
	)#
	
		#textField(
			objectName="company",
			property="companyName",
			label="Company Name"
		)#
		
		#textField(
			objectName="company",
			property="address",
			label="address"
		)#
		
		#textField(
			objectName="company",
			property="city",
			label="city"
		)#
		
		#select(
			objectName="company",
			property="stateid",
			options=states,
			label="State"
		)#
		
		#textField(
			objectName="company",
			property="zipcode",
			label="Zip Code"
		)#
		
		#textField(
			objectName="company",
			property="phone",
			label="Phone"
		)#
		
		#textField(
			objectName="company",
			property="website",
			label="Website"
		)#
		
		#textField(
			objectName="company",
			property="email",
			label="email"
		)#
		
		#checkBox(
			objectName="company",
			property="active",
			label="Is Active"
		)#
		
		#submitTag(
			value="Edit Company",
			id="edit-companyBtn"
		)#
		
		<div id="image-section">
			
			<h2>Banners</h2>
			<a id="add-banner" href="">Add a banner</a>
			
			<ul>
				<li>
					<div class="banner-thumb"></div>
					<div class="banner-text"></div>
					<div class="actions">
						<a href="">Edit</a>
						<a href="">Remove</a>
					</div>
				</li>
			</ul>
			
		</div>
		
		<div class="clear"></div>
			
	#endFormTag()#
	

</cfoutput>