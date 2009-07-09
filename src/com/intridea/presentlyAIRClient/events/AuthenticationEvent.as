/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.presentlyAIRClient.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
    
    /**
     * 
     * Authenticates users against the Present.ly server.
     * 
     * @see com.adobe.cairngorm.control.CairngormEvent
     * 
     */
	public final class AuthenticationEvent extends CairngormEvent
	{
	    /**
	     *
	     * Used to log users into the Present.ly server. An account, screen name, password and 
	     * "Present.ly" URL <i>must</i> be set on the event object upon instantiation.
	     * 
	     */
		public static const LOGIN_EVENT : String = "com.intridea.presentlyAIRClient.events.LoginEvent";
		
		/**
		 *
		 * Used to log users out of the Present.ly server.
		 *  
		 */
		public static const LOGOUT_EVENT : String = "com.intridea.presentlyAIRClient.events.LogoutEvent";
		
		/**
	     *
	     * Used to inform the application that a user has been successfully logged into the Present.ly server.
	     * 
	     */
		public static const SUCCESSFUL_LOGIN_EVENT : String = "com.intridea.presentlyAIRClient.events.SuccessfulLoginEvent";
		
		/**
	     *
	     * Used to inform the application that a user has been successfully logged out of the Present.ly server.
	     * 
	     */
		public static const SUCCESSFUL_LOGOUT_EVENT : String = "com.intridea.presentlyAIRClient.events.SuccessfulLogoutEvent";

		/**
		 *
		 * Stores the current users <code>screenName</code>. Required to log users in and out of the system. 
		 * 
		 */
		public var username : String;
		
		/**
		 *
		 * Stores the current users <code>password</code>. Required to log users in and out of the system.
		 * 
		 */
		public var password : String;
		
		/**
		 *
		 * Stores the current users <code>account</code>. Required to log users in and out of the system.
		 * 
		 */
		public var account : String;

		/**
		 * 
		 * Stores the current users <code>presentlyBaseURL</code>. Required to log users in and out of the system.
		 * 
		 */
		public var presentlyBaseURL : String;
		
		/**
		 *
		 * Instances of <code>AuthenticationEvent</code> are typically created and dispatched by the view layer and 
		 * command classes. 
		 * 
		 * @param type Specific event being instantiated.
		 * @see com.adobe.cairngorm.control.CairngormEvent
		 * 
		 */
		public function AuthenticationEvent( type : String ) 
		{
			super( type );
		}
	}
}
