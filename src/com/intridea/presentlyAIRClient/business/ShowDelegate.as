/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.presentlyAIRClient.business
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.intridea.presentlyAIRClient.model.ModelLocator;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.http.HTTPService;
	import mx.utils.Base64Encoder;
	
    /**
     *
     * Makes the service call to the Present.ly server to request data for specific user's to enable user lookups.
     *  
     */
	public final class ShowDelegate
	{

		/**
		 * 
		 * Gets the appropriate URI pattern for the service call to request the specific user data.
		 * 
		 */
		private var service : HTTPService = ServiceLocator.getInstance().getHTTPService( Services.SHOW );
		
		/**
		 * 
		 * Processes server results or failures and updates the data model if needed. This will be
		 * a concrete command implementation at runtime.
		 * 
		 */
		private var responder : IResponder;
			
		/**
		 *
		 * Sets the concrete command to handle the service call response to request specific user data. 
		 * 
		 * @param responder Concrete command that handles the authentication result and failure responses.
		 * 
		 */
		public function ShowDelegate( responder : IResponder )
		{
			this.responder = responder;
		}
		
		/**
		 * 
		 * Makes the call out to the Present.ly server to request specific user data. Sets the concrete 
		 * command that issued the request to handle result and failure responses from the Present.ly server.
		 * 
		 */
		public function search( idArg : String ) : void
		{
			
			service.url = ServiceUtils.getEndpoint( ServiceConfigurations.SHOW_URL );
			
			if ( idArg )
			{
				service.request.id = idArg;
			}
			
			var encoderString : String = ModelLocator.instance.currentUser.screenName+":"+ModelLocator.instance.currentUser.password;
			
			var encoder:Base64Encoder = new Base64Encoder();
	        encoder.insertNewLines = false;
	        encoder.encode( encoderString );
	
	        service.headers = {Authorization:"Basic " + encoder.toString()};
			
            var token : AsyncToken = service.send();
            token.addResponder( responder );
		}
	}
}