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
     * Clears the last screen name set on the data model when the users performs lookup actions.
     * 
     */
	public final class ClearCurrentLookupUserScreenNameEvent extends CairngormEvent
	{
	    /**
	     *
	     * Specific event type used to clear the last screen name set on the data model.
	     * 
	     */
		public static const EVENT : String = "com.intridea.presentlyAIRClient.events.ClearCurrentLookupUserScreenNameEvent";		
		
		/**
		 *
		 * Instances of <code>CheckDatabaseForUserSettingsEvent</code> are typically created and dispatched by the view layer and 
		 * command classes. 
		 * 
		 * @param type Specific event being instantiated.
		 * 
		 */
		public function ClearCurrentLookupUserScreenNameEvent( type : String = EVENT ) 
		{
			super( type );
		}
	}
}
