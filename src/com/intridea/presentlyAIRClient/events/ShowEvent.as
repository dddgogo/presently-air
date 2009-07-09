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
     * Used to request information about users being looked up by the current user.
     * 
     * @see com.adobe.cairngorm.control.CairngormEvent
     * 
     */
	public final class ShowEvent extends CairngormEvent
	{
	    /**
	     *
	     * Specific event type used to request information about users being looked up.
	     * 
	     */
		public static const EVENT : String = "com.intridea.presentlyAIRClient.events.ShowEvent";		
		
		/**
		 * 
		 * The screen name for the user that's being looked up.
		 * 
		 */
		public var screenName : String;
		
		/**
		 *
		 * Instances of <code>SetSystemTrayPreferenceEvent</code> are typically created and dispatched by the view layer and 
		 * command classes.
		 * 
		 * @param type Specific event being instantiated.
		 * @see com.adobe.cairngorm.control.CairngormEvent
		 * 
		 */
		public function ShowEvent( type : String = EVENT ) 
		{
			super( type );
		}
	}
}
