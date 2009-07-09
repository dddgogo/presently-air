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
     * Sets the screen name of the user being looked up that the current user has requested additional
     * information about.
     * 
     * @see com.adobe.cairngorm.control.CairngormEvent
     * 
     */
	public final class SetCurrentLookupUserScreenNameEvent extends CairngormEvent
	{
	    /**
	     *
	     * Specific event type used to set the screen name of the user being looked up.
	     * 
	     */
		public static const EVENT : String = "com.intridea.presentlyAIRClient.events.SetCurrentLookupUserScreenNameEvent";		
		
		/**
		 * 
		 * Stores the screen name of the user being looked up to be passed to the 
		 * <code>SetCurrentLookupUserScreenNameEvent</code>.
		 * 
		 */
		public var screenName : String;
		
		/**
		 *
		 * Instances of <code>SetCurrentLookupUserScreenNameEvent</code> are typically created and dispatched by the view layer and 
		 * command classes.
		 * 
		 * @param type Specific event being instantiated.
		 * @see com.adobe.cairngorm.control.CairngormEvent
		 * 
		 */
		public function SetCurrentLookupUserScreenNameEvent( type : String = EVENT ) 
		{
			super( type );
		}
	}
}
