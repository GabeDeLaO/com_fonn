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
		
		#submitTag(
			value="Update Campaign"
		)#
	
	#endFormTag()#


</cfoutput>