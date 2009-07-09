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
     * Opens the user settings SQLite database and checks for values to set on the data model
     * supplied by a user during previous interactions with the application.
     * 
     */
	public final class CheckDatabaseForUserSettingsEvent extends CairngormEvent
	{
	    /**
	     *
	     * Specific event type used to prevent collisions with other events in the system.
	     * 
	     */
		public static const EVENT : String = "com.intridea.presentlyAIRClient.events.CheckDatabaseForUserSettingsEvent";
		
		/**
		 * 
		 * Instances of <code>CheckDatabaseForUserSettingsEvent</code> are typically created and dispatched by the view layer and 
		 * command classes. 
		 * 
		 * @param type Specific event being instantiated.
		 * 
		 */
		public function CheckDatabaseForUserSettingsEvent( type : String = EVENT ) 
		{
			super( type );
		}
	}
}
