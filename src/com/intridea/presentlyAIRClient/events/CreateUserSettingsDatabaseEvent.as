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
     * Creates the user settings SQLite database used to persist application preferences set by the user
     * during interactions with the application.
     * 
     */
	public final class CreateUserSettingsDatabaseEvent extends CairngormEvent
	{
	    /**
	     *
	     * Specific event type used to create the user settings database.
	     * 
	     */
		public static const EVENT : String = "com.intridea.presentlyAIRClient.events.CreateUserSettingsDatabaseEvent";
		
		/**
		 *
		 * Instances of <code>CheckDatabaseForUserSettingsEvent</code> are typically created and dispatched by the view layer and 
		 * command classes. <code>CheckDatabaseForUserSettingsEvent</code> events are dispatched during application initialization.
		 * 
		 * @param type Specific event being instantiated.
		 * 
		 */
		public function CreateUserSettingsDatabaseEvent( type : String = EVENT )
		{
			super( type );
		}
	}
}
