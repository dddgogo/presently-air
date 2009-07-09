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
	import com.intridea.presentlyAIRClient.events.FailedLoginEvent;
	import com.intridea.presentlyAIRClient.model.ModelLocator;
	import com.intridea.presentlyAIRClient.vo.LoginVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.http.HTTPService;
	import mx.utils.Base64Encoder;
	
    /**
     * 
     * Makes the service call to the Present.ly server to authenticate users.
     * 
     */
	public final class LoginDelegate
	{

		/**
		 *
		 * Gets the appropriate URI pattern for the authentication service call.
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
		 * Message presented to the user for failed authentication service calls do to invalid account information.
		 * 
		 */
		private var invalidUserAccountMessage : String = "Login cannot proceed, the user account has not been specified.";
		
		/**
		 * 
		 * Message presented to the user for failed authentication service calls do to invalid password.
		 * 
		 */
		private var invalidPasswordMessage : String = "Login cannot proceed, bogus password: ";
			
		/**
		 *
		 * Sets the concrete command to handle the authentication service call response. 
		 * 
		 * @param responder Concrete command that handles the authentication result and failure responses.
		 * 
		 */
		public function LoginDelegate( responder : IResponder )
		{
			this.responder = responder;
		}
		
		/**
		 * 
		 * Sets up service objects required to call the Present.ly server for authentication. Sends 
		 * notifications about invalid login credentials. Sends the login credentials along with the
		 * service call if the credentials are valid.
		 * 
		 * @param login Provides the current user's screen name and password for the service call. 
		 * 
		 */
		public function doLogin( login : LoginVO ) : void
		{
			
			if ( login.account == null )
			{
				new FailedLoginEvent( invalidUserAccountMessage ).dispatch();
			} 
			else if ( login.password != null && login.password.length <= 0 )
			{
				new FailedLoginEvent( invalidPasswordMessage ).dispatch();
			}
			else if ( login.account != null && login.password.length > 0 )
			{
				service = ServiceLocator.getInstance().getHTTPService( Services.LOGIN );
				service.url = ServiceUtils.getEndpoint( ServiceConfigurations.LOGIN_URL );

				var encoderString : String = login.username + ":" + login.password;			
				var encoder : Base64Encoder = new Base64Encoder();
	        	encoder.insertNewLines = false;
	        	encoder.encode( encoderString );
	
		        service.headers = { Authorization : "Basic " + encoder.toString() };
	        
				var param : Object = new Object();
				param.login = login.username;
				param.password = login.password;
								
	            var token : AsyncToken = service.send( param );
	            token.addResponder( responder );
			}
		}
	}
}