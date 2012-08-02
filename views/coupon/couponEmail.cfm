<cfoutput>

<table style="background:black;">
<tr>
<td>
<table>
	<tr>
		<td>
			<div id="logo" style="background: url(http://fonnbeta.irisevolution.com/images/logosmall.png) no-repeat;display: block;height: 50px;margin: 0 0 8px 0;width: 327px;"></div>
		</td>
	</tr>
</table>
<table>
	
	<tr>
		<td>
			<img src="http://fonnbeta.irisevolution.com/images/campaigns/big/#banner.banner#" width="800"/>
		</td>
	</tr>
	
	<tr>
		<td>
		<div id="profile-bar" style="background: ##ff0000;border: 1px solid ##ff0000;color: white;display: block;float: left;height: 55px;padding: 8px 5px 5px 8px;text-align: center;width: 785px;font-family: 'Folks-BoldFolks-Bold', Arial;font-size: 22px;">
			Congratulations <br/>Here is your Coupon
		</div>
		</td>
	</tr>
	
	
	
	<tr style="background:white">
		<td>
			<div id="body" style="background:white;text-align:center">

				<p class="company-name" style="font-size: 26px;font-weight: bold;">
					#campaign.company().companyName#<br/>
					#campaign.campaignName#
				</p>
				
				<p class="company-name" style="font-size: 26px;font-weight: bold;">
					Coupon Code:
				</p>
				
				<div class="coupon-code" style="border: 2px solid red;color: red;display: block;font-weight: bold;font-size: 38px;text-align: center;margin: 0 auto;min-width: 10px;width: 180px;">
					#coupon.couponCode#<br/>
					<span class="expires" style="color: blue;font-size: 12px;">Expires on #dateFormat(coupon.expirationDate,'MMMM dd, yyyy')#</span>
				</div>
				
				<p class="address" style="font-size: 14px;">
					#campaign.company().companyName#<br/>
					#campaign.company().address#<br/>
					#campaign.company().city#, #campaign.company().stateID# #campaign.company().zipcode#<br/>
					#campaign.company().phone#
				</p>
			</div>
		</td>
	</tr>
</table>
</td>
</tr>
<table>

</cfoutput>