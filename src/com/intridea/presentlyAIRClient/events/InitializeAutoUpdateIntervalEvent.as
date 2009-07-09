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
     * Starts the auto interval requests to the Present.ly server to retrieve the data stream of 
     * the current service that's set on the data model.
     * @see com.adobe.cairngorm.control.CairngormEvent 
     * 
     */
	public final class InitializeAutoUpdateIntervalEvent extends CairngormEvent
	{
	    /**
	     *
	     * Specific event type used to start the auto interval requests to the Present.ly server.
	     * 
	     */
		public static const EVENT : String = "com.intridea.presentlyAIRClient.events.InitializeAutoUpdateIntervalEvent";		
		
		/**
		 *
		 * Instances of <code>InitializeAutoUpdateIntervalEvent</code> are typically created and dispatched by the view layer and 
		 * command classes.
		 * 
		 * @param type Specific event being instantiated.
		 * @see com.adobe.cairngorm.control.CairngormEvent
		 * 
		 */
		public function InitializeAutoUpdateIntervalEvent( type : String = EVENT ) 
		{
			super( type );
		}
	}
}
