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
     * Updates the user's preference to remember log in information in between interactions with the application.
     * 
     * @see com.adobe.cairngorm.control.CairngormEvent
     * 
     */
	public final class SetRememberLoginInfoPreferenceEvent extends CairngormEvent
	{
	    /**
	     *
	     * Specific event type used to persist the user's preference to rememeber log in information. 
	     * 
	     */
		public static const EVENT : String = "com.intridea.presentlyAIRClient.events.SetRememberLoginInfoPreferenceEvent";
		
		/**
		 * 
		 * Stores the user's preference to remember log in information to be written to the SQLite database.
		 * 
		 */
		public var rememberLoginInfo : Boolean;
		
		/**
		 *
		 * Instances of <code>SetRememberLoginInfoPreferenceEvent</code> are typically created and dispatched by the view layer and 
		 * command classes.
		 * 
		 * @param type Specific event being instantiated.
		 * @see com.adobe.cairngorm.control.CairngormEvent
		 * 
		 */
		public function SetRememberLoginInfoPreferenceEvent( type : String = EVENT ) 
		{
			super( type );
		}
	}
}
