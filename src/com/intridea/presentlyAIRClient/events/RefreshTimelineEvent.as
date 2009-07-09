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
     * Used to update the data on the timeline and in the view for the current service.
     * 
     * @see com.adobe.cairngorm.control.CairngormEvent
     * 
     */
	public final class RefreshTimelineEvent extends CairngormEvent
	{
	    /**
	     *
	     * Specific event type used to update the current service data.
	     * 
	     */
		public static const EVENT : String = "com.intridea.presentlyAIRClient.events.RefreshTimelineEvent";		
		
		/**
		 * 
		 * Used for the call out to the Present.ly server to update the timeline data and view.
		 * 
		 */
		public var currentService : String;
		
		/**
		 *
		 * Instances of <code>RefreshTimelineEvent</code> are typically created and dispatched by the view layer and 
		 * command classes.
		 * 
		 * @param type Specific event being instantiated.
		 * @see com.adobe.cairngorm.control.CairngormEvent
		 * 
		 */
		public function RefreshTimelineEvent( type : String = EVENT ) 
		{
			super( type );
		}
	}
}
