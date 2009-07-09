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
	import com.intridea.presentlyAIRClient.model.domain.User;
    
    /**
     *
     * Notifies the <code>UserLookupView</code> that the requested user data has been returned by the Present.ly server.
     * 
     * @see com.intridea.presentlyAIRClient.view.UserLookupView
     * @see com.adobe.cairngorm.control.CairngormEvent
     * 
     */
	public final class UserRetrievedEvent extends CairngormEvent
	{
	    /**
	     *
	     * Specific event type used to notifiy the view that user data has been returned by the Present.ly server. 
	     * 
	     */
		public static const EVENT : String = "com.intridea.presentlyAIRClient.events.UserRetrievedEvent";		
		
		/**
		 * 
		 * User data provided by the server used for populating the <code>UserLookupView</code> for user lookups. 
		 * 
		 * @see com.intridea.presentlyAIRClient.model.domain.User
		 * 
		 */
		public var user : User; 
		
		/**
		 *
		 * Instances of <code>UserRetrievedEvent</code> are created and dispatched by 
		 * <code>ShowCommand</code> instances.
		 * 
		 * @param type Specific event being instantiated.
		 * @see com.intridea.presentlyAIRClient.commands.ShowCommand
		 * @see com.adobe.cairngorm.control.CairngormEvent
		 * 
		 */
		public function UserRetrievedEvent( type : String = EVENT ) 
		{
			super( type );
		}
	}
}
