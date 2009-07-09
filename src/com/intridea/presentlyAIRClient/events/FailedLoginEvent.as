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
     * Used to indicate the user's attempt to log in to the Present.ly server has failed.
     * 
     */
	public final class FailedLoginEvent extends CairngormEvent
	{
	    /**
	     *
	     * Specific event type used to handle failed log in attempts.
	     * 
	     */
		public static const EVENT : String = "com.intridea.presentlyAIRClient.events.FailedLoginEvent";
		
		/**
		 * 
		 * Used to inform the view that the user's log in attempt has failed. The message is displayed to
		 * the user in an <code>Alert</code> control.
		 * 
		 */
		public var errorMessage : String;
		
		/**
		 *
		 * Instances of <code>FailedLoginEvent</code> are typically created and dispatched by the view layer and 
		 * command classes when the user's log in attempt has failed.
		 * 
		 * @param type Specific event being instantiated.
		 * 
		 */
		public function FailedLoginEvent( message : String ) 
		{
			super( EVENT );
			this.errorMessage = message;
		}
	}
}
