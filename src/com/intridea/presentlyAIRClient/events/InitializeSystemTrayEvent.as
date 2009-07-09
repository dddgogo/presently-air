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
     * Sets up the system tray so the application icon will display and enables the user to minimize the application 
     * to the system tray.
     * 
     * @see com.adobe.cairngorm.control.CairngormEvent
     * 
     */
	public final class InitializeSystemTrayEvent extends CairngormEvent
	{
	    /**
	     *
	     * Specific event type used to set up the icon to display and the application to the system tray.
	     * 
	     */
		public static const EVENT : String = "com.intridea.presentlyAIRClient.events.InitializeSystemTrayEvent";
		
		/**
		 *
		 * Instances of <code>PersistUserSettingsToLocalDatabaseEvent</code> are typically created and dispatched by the view layer and 
		 * command classes.
		 * 
		 * @param type Specific event being instantiated.
		 * @see com.adobe.cairngorm.control.CairngormEvent
		 * 
		 */
		public function InitializeSystemTrayEvent( type : String = EVENT ) 
		{
			super( type );
		}
	}
}
