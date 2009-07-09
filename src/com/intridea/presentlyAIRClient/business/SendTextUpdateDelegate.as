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
     * Makes the service call to the Present.ly server to send text messages entered into the view by the 
     * current user.
     * 
     */
	public final class SendTextUpdateDelegate
	{
		/**
		 * 
		 * Gets the appropriate URI pattern for the service call to send text messages.
		 * 
		 */
		private var service : HTTPService;
		
		/**
		 * 
		 * Processes server results or failures and updates the data model if needed. This will be
		 * a concrete command implementation at runtime.
		 * 
		 */
		private var responder : IResponder;
			
		/**
		 *
		 * Sets the concrete command to handle the service call response to send text messages. 
		 * 
		 * @param responder Concrete command that handles the authentication result and failure responses.
		 * 
		 */
		public function SendTextUpdateDelegate( responder : IResponder )
		{
			this.responder = responder;
		}
		
		/**
		 * 
		 * Makes the call out to the Present.ly server to send text messages. Sets the concrete command 
		 * that issued the request to handle result and failure responses from the Present.ly server.
		 * 
		 */
		public function callHTTPService( textUpdate : String ) : void
		{
			service = ServiceLocator.getInstance().getHTTPService( Services.SEND_UPDATE );	
			service.url = ServiceUtils.getEndpoint( ServiceConfigurations.SEND_UPDATE_URL );
				
			trace( "service.url: " + service.url );
				
			var encoderString : String = ModelLocator.instance.currentUser.screenName+":"+ModelLocator.instance.currentUser.password;
			var encoder:Base64Encoder = new Base64Encoder();
	        encoder.insertNewLines = false;
	        encoder.encode( encoderString );
	        service.headers = {Authorization:"Basic " + encoder.toString()};
	        var param : Object = new Object();
			param.status = textUpdate;
            var token : AsyncToken = service.send( param );
            token.addResponder( responder );
		}
	}
}