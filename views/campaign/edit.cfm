<cfoutput>

	#startFormTag(action="edit", id="compaign-edit-form", class="ajaxForm", key=params.key)#
		
		#hiddenFieldTag(
			name="afterSubmission",
			value="relocate"	
		)#
		
		#hiddenFieldTag(
			name="goTo",
			value="campaign/index"
		)#
		
		#selectTag(
			name="companyid",
			options=companies,
			label="company",
			selected=campaign.companyId
		)#
		
		#textField(
			objectName="campaign",
			property="campaignName"
		)#
		
		#textField(
			objectName="campaign",
			property="startDate"
		)#
		
		#textField(
			objectName="campaign",
			property="endDate"
		)#
		
		#textArea(
			objectName="campaign",
			property="description"
		)#
		
		#textField(
			objectName="campaign",
			property="couponSlots"
		)#
		
		#textField(
			objectName="campaign",
			property="couponExpiration",
			label="User has"
		)#
		
		#selectTag(
			name="couponExpirationTimeSpan",
			options=timeSpans,
			selected=campaign.couponTimeSpan
		)#
		
		#textField(
			objectName="campaign",
			property="restrictions"
		)#
		
		#submitTag(
			value="Update Campaign"
		)#
	
	#endFormTag()#


</cfoutput>