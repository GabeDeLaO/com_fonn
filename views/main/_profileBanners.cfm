<cfoutput>

<div class="container">
	<div class="wt-rotator">
    	<div class="screen">
            <noscript>
            	<!-- placeholder 1st image when javascript is off -->
                <img src="/miscellaneous/rotator/images/madness_arch2.jpg"/>
            </noscript>
      	</div>
        <div class="c-panel">
      		<div class="thumbnails">
                <ul>
                	<cfloop query="banners">
                    <li>
                    	<a href="/images/campaigns/big/#banners.banner#" title="#campaign.campaignName#"></a>
                        <a href="" target="_blank"></a>                        
                        <div style="top:5px; left:484px; width:336px; height:0; color:##FFF; background-color:##000;">
                           <h1>#campaign.campaignName#</h1>
                           #banners.text#
                       	</div>
                    </li>
                	</cfloop>
                	
                    <!---<li>
                        <a href="/miscellaneous/rotator/images/triworks_abstract17.jpg" title="3D abstract art"><img src="/miscellaneous/rotator/images/thumbs/triworks_abstract17.jpg"/></a>
                        <a href="" target="_blank"></a>                        
                        <div style="top:5px; left:5px; width:350px; height:0; color:##FFF; background-color:##000;">
                            <h1>JQuery Banner Rotator</h1>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                            Sed sed elit eget purus consequat tempor eu ac mauris. Nulla facilisi. 
                            Vivamus consectetur molestie ipsum ac sollicitudin. 
                            Sed venenatis est sit amet nibh molestie vel pharetra velit commodo. 
                            Ut eros orci, sollicitudin sit amet ultricies vitae, varius ac quam. Pellentesque euismod.
                      	</div>
                    </li>  --->  
              	</ul>
          	</div>     
  			<div class="buttons">
            	<div class="prev-btn"></div>
                <div class="play-btn"></div>    
            	<div class="next-btn"></div>               
            </div>
        </div>
    </div>	
</div>


</cfoutput>