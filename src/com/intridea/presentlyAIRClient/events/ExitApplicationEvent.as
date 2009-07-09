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
     * Handles user requests to close and exit the application.
     * 
     */
	public final class ExitApplicationEvent extends CairngormEvent
	{
	    /**
	     *
	     * Specific event type used to handle user requests to close and exit the application.
	     * 
	     */
		public static const EVENT : String = "com.intridea.presentlyAIRClient.events.ExitApplicationEvent";
		
		/**
		 * 
		 * Used to update the users preference to remember screen name, password, account and presently URL 
		 * information in between separate interactions with the application.
		 * 
		 */
		public var rememberLoginInfo : Boolean;
		
		/**
		 *
		 * Instances of <code>ExitApplicationEvent</code> are typically created and dispatched by the view layer and 
		 * command classes when the user requests to close and exit the application.
		 * 
		 * @param type Specific event being instantiated.
		 * 
		 */
		public function ExitApplicationEvent( type : String = EVENT ) 
		{
			super( type );
		}
	}
}
