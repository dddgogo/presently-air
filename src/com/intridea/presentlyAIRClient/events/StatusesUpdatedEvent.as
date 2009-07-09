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
	import com.intridea.presentlyAIRClient.vo.Status;
    
    /**
     *
     * Notifies the view when statuses have been returned from the Present.ly server.
     * 
     * @see com.intridea.presentlyAIRClientStatusesManager
     * @see com.adobe.cairngorm.control.CairngormEvent
     * 
     */
	public final class StatusesUpdatedEvent extends CairngormEvent
	{
	    /**
	     *
	     * Specific event type used to notify the view when statuses have been returned by the Present.ly server.
	     * 
	     */
		public static const EVENT : String = "com.intridea.presentlyAIRClient.events.StatusesUpdateEvent";
		
		/**
		 *
		 * Instances of <code>StatusesUpdatedEvent</code> are created and dispatched by the <code>StatusesManager</code> 
		 * object to notifiy the view that statuses have been returned by the Present.ly server.
		 * 
		 * @param type Specific event being instantiated.
		 * @see com.adobe.cairngorm.control.CairngormEvent
		 * 
		 */
		public function StatusesUpdatedEvent( type : String = EVENT ) 
		{
			super( type );
		}
	}
}
