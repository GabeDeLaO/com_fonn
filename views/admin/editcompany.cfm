<cfoutput>
	
	<div id="uploadForm">
		
		<form method="post" action="dump.php">
			<h1>Events example</h1>
		
			<p>Shows how to bind and use all available events.</p>
		
			<h3>Log messages</h3>
			<textarea id="log" style="width: 100%; height: 150px; font-size: 11px" spellcheck="false" wrap="off"></textarea>
		
			<h3>Queue widget</h3>
			<div id="uploader" style="width: 450px; height: 330px;">You browser doesn't support upload.</div>
			<a id="clear" href="##">Clear queue</a>
		</form>
		
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
			<a href="">Add a banner</a>
			
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