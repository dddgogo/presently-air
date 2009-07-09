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
	
	import mx.collections.ArrayCollection;
    
    /**
     *
     * Persists the user's preferences to the local SQLite database.
     * @see com.adobe.cairngorm.control.CairngormEvent
     * 
     */
	public final class PersistUserSettingsToLocalDatabaseEvent extends CairngormEvent
	{
	    /**
	     *
	     * Specific event type used to save the user's preferences to the local SQLite database.
	     * 
	     */
		public static const EVENT : String = "com.intridea.presentlyAIRClient.events.PersistUserSettingsToLocalDatabaseEvent";
		
		/**
		 *
		 * Instances of <code>PersistUserSettingsToLocalDatabaseEvent</code> are typically created and dispatched by the view layer and 
		 * command classes.
		 * 
		 * @param type Specific event being instantiated.
		 * @see com.adobe.cairngorm.control.CairngormEvent
		 * 
		 */
		public function PersistUserSettingsToLocalDatabaseEvent( type : String = EVENT )
		{
			super( type );
		}
	}
}
