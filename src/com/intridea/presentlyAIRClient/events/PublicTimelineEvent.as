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
     * Used to request the public timeline data stream from the Present.ly server.
     * 
     * @see com.adobe.cairngorm.control.CairngormEvent
     * 
     */
	public final class PublicTimelineEvent extends CairngormEvent
	{
	    /**
	     *
	     * Specific event type used to request public timeline data from the Present.ly server.
	     * 
	     */
		public static const EVENT : String = "com.intridea.presentlyAIRClient.events.PublicTimelineEvent";		
		
		/**
		 *
		 * Instances of <code>DirectMessagesEvent</code> are typically created and dispatched by the view layer and 
		 * command classes.
		 * 
		 * @param type Specific event being instantiated.
		 * @see com.adobe.cairngorm.control.CairngormEvent
		 * 
		 */
		public function PublicTimelineEvent( type : String = EVENT ) 
		{
			super( type );
		}
	}
}
