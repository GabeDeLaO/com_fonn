<cfoutput>

	<h1>Companies List</h1>
	
	<div id="admin-content">
	
	<cfif companies.recordCount >
		
		<p>
			#linkTo(action="add-company", text="Add Company")#
		</p>
		
		<ul>
			
			<cfloop query="companies" startRow="#startRow#" endRow="#endRow#">
				
				<cfset rowColor = (companies.currentRow MOD 2 IS 0)?"light":"dark"/>
				
				<li class="#rowColor#">
					#companies.companyName#
					- #linkTo(action="edit-company", text="edit", key=companies.id)#
					| #linkTo(action="remove-company", text="delete", key=companies.id,class="ajaxLinkPost", rel="companies")#
				</li>
				
			</cfloop>
			
		</ul>
		
	<cfelse>
		
		<p>
			There seem to be no companies, would you like to add one?
			#linkTo(action="add-company", text="Add Company")#
		</p>
		
	</cfif>
	
	</div>

</cfoutput>