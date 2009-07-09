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
     * Used to send notifications that the user's preferences have been saved to the SQLite database.
     * @see com.adobe.cairngorm.control.CairngormEvent
     * 
     */
	public final class LocalSettingsPersistedEvent extends CairngormEvent
	{
	    /**
	     *
	     * Specific event type used to send notifications that the user's preference have been saved to the
	     * locate SQLite database.
	     * 
	     */
		public static const EVENT : String = "com.intridea.presentlyAIRClient.events.LocalSettingsPersistedEvent";
		
		/**
		 *
		 * Instances of <code>LocalSettingsPersistedEvent</code> are created and dispatched by
		 * <code>PersistUserSettingsToLocalDatabaseCommand</code> instances to inform the view that the user's
		 * preferences have been saved to the SQLite database.
		 * 
		 * @param type Specific event being instantiated.
		 * @see com.adobe.cairngorm.control.CairngormEvent
		 * 
		 */
		public function LocalSettingsPersistedEvent( type : String = EVENT )
		{
			super( type );
		}
	}
}
