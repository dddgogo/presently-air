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
     * Generic event used to inform the application that the user settings SQLite database has
     * been successfully created.
     * 
     */
	public final class DatabaseCreatedEvent extends CairngormEvent
	{
	    /**
	     *
	     * Specific event type used to notify the application of successful database creation.
	     * 
	     */
		public static const EVENT : String = "com.intridea.presentlyAIRClient.events.DatabaseCreatedEvent";
		
		/**
		 *
		 * Instances of <code>DatabaseCreatedEvent</code> are typically created and dispatched by the view layer and 
		 * command classes. <code>DatabaseCreatedEvent</code> events are dispatched during application initialization.
		 * 
		 * @param type Specific event being instantiated.
		 * 
		 */
		public function DatabaseCreatedEvent( type : String = EVENT ) 
		{
			super( type );
		}
	}
}
