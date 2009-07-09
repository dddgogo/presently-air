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
     * Updates the user's preference to enable and disable showing notifications for the main timeline 
     * stream in the view.
     * 
     * @see com.adobe.cairngorm.control.CairngormEvent
     * 
     */
	public final class SetMainStreamNotificationsPrefEvent extends CairngormEvent
	{
	    /**
	     *
	     * Specific event type used to update the user's preference to show or hide notifications in the view for
	     * the main timeline stream.
	     * 
	     */
		public static const EVENT : String = "com.intridea.presentlyAIRClient.events.SetMainStreamNotificationsPrefEvent";
		
		/**
		 * 
		 * Used to store the user's preference to hide or show notifications in the view for the main timeline stream. 
		 * 
		 */
		public var mainStreamNotificationsEnabled : Boolean;
		
		/**
		 *
		 * Instances of <code>SetMainStreamNotificationsPrefEvent</code> are typically created and dispatched by 
		 * the view layer and command classes.
		 * 
		 * @param type Specific event being instantiated.
		 * @see com.adobe.cairngorm.control.CairngormEvent
		 * 
		 */
		public function SetMainStreamNotificationsPrefEvent( type : String = EVENT )
		{
			super( type );
		}
	}
}
