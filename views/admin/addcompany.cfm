<cfoutput>
	
	<div id="feedback">
	
	</div>
	
	#startFormTag(
		id="add-company-form",
		action="add-company"
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
			value="Add Company",
			id="add-companyBtn"
		)#
		
		<div class="clear"></div>
	
	#endFormTag()#

</cfoutput>