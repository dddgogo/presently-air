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
     * Updates the user's preference to minimize the application to the system tray or the taskbar.
     * 
     * @see com.adobe.cairngorm.control.CairngormEvent
     * 
     */
	public final class SetSystemTrayPreferenceEvent extends CairngormEvent
	{
	    /**
	     *
	     * Specific event type used to persist the user's preference to minimize the application to the system tray.
	     * 
	     */
		public static const EVENT : String = "com.intridea.presentlyAIRClient.events.SetSystemTrayPreferenceEvent";
		
		/**
		 * 
		 * Stores the user's preference to minimize the application to the system tray. This value is written to the data
		 * model by <code>SetSystemTrayPreferenceCommand</code> instances.
		 * 
		 */
		public var isMinimizeToSystemTrayEnabled : Boolean;
		
		/**
		 *
		 * Instances of <code>SetSystemTrayPreferenceEvent</code> are typically created and dispatched by the view layer and 
		 * command classes.
		 * 
		 * @param type Specific event being instantiated.
		 * @see com.adobe.cairngorm.control.CairngormEvent
		 * 
		 */
		public function SetSystemTrayPreferenceEvent( type : String = EVENT ) 
		{
			super( type );
		}
	}
}
