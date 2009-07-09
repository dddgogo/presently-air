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
     * Updates the user's preference to enable and disable showing notifications for direct messages in the view.
     * 
     * @see com.adobe.cairngorm.control.CairngormEvent
     * 
     */
	public final class SetDirectMessagesNotificationsPrefEvent extends CairngormEvent
	{
	    /**
	     *
	     * Specific event type used to update the user's preference to show or hide notifications in the view for
	     * direct messages. 
	     * 
	     */
		public static const EVENT : String = "com.intridea.presentlyAIRClient.events.SetDirectMessagesNotificationsPrefEvent";
		
		/**
		 * 
		 * Used to store the user's preference to hide or show notifications in the view for direct messages.
		 * 
		 */
		public var directMessagesNotificationsEnabled : Boolean;
		
		/**
		 *
		 * Instances of <code>SetDirectMessagesNotificationsPrefEvent</code> are typically created and dispatched by 
		 * the view layer and command classes.
		 * 
		 * @param type Specific event being instantiated.
		 * @see com.adobe.cairngorm.control.CairngormEvent
		 * 
		 */
		public function SetDirectMessagesNotificationsPrefEvent( type : String = EVENT )
		{
			super( type );
		}
	}
}
