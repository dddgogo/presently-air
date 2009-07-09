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
	import com.intridea.presentlyAIRClient.model.domain.User;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.http.HTTPService;
	import mx.utils.Base64Encoder;
	
    /**
     * 
     * Makes the client to server call for the Present.ly messaging API. Optionally sends user generated
     * data with the request. Notifies the instantiating command instance of result and failures while
     * communicating with the Present.ly server.
     * 
     */
	public final class HTTPDelegate
	{
		/**
		 *
		 * Gets the appropriate URI pattern for each server call.
		 *  
		 */
		private static const locator : ServiceLocator = ServiceLocator.getInstance();
		
		/**
		 * 
		 * The service called by this delegate class.
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
		 * Provides account specific information for the current user making the service call.
		 * 
		 * @see com.intridea.presentlyAIRClient.model.domain.User
		 * 
		 */
		private var user : User;
			
		/**
		 *
		 * Assembles the URI pattern for the service call.
		 * 
		 * @param responder The concrete command that handles server responses.
		 * @param user Provides account information collected by the view.
		 * @param url URI fragment specific to this service call. 
		 * 
		 */
		public function HTTPDelegate( responder : IResponder, user : User, serviceID : String, url : String )
		{
			service = locator.getHTTPService( serviceID );
			service.url = ServiceUtils.getEndpoint( url );
			this.responder = responder;
			this.user = user;
		}
		
		/**
		 * 
		 * Makes the call out to the Present.ly server. Sets the concrete command that issued the request
		 * to handle result and failure responses from the Present.ly server.
		 * 
		 */
		public function callHTTPService( param : Object = null ) : void
		{			
			var encoderString : String = user.screenName + ":" + user.password;			
			var encoder : Base64Encoder = new Base64Encoder();
	        encoder.insertNewLines = false;
	        encoder.encode( encoderString );
	
	        service.headers = { Authorization : "Basic " + encoder.toString() };
			
            var token : AsyncToken;
            if ( param == null )
            {
            	token = service.send();
            }
            else
            {
            	token = service.send( param );
            }
            token.addResponder( responder );
		}
	}
}