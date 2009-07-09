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
     * Notifies the view when a <code>Status</code> object has been returned from the 
     * Present.ly server and added to the <code>statuses</code> Array in the <code>StatusesManager</code> 
     * on the data model. 
     * 
     * @see com.intridea.presentlyAIRClientStatusesManager
     * @see com.adobe.cairngorm.control.CairngormEvent
     * 
     */
	public final class StatusAddedEvent extends CairngormEvent
	{
	    /**
	     *
	     * Specific event type used to notify the view that a Status object has been returned from the 
	     * Present.ly server and added to the <code>statuses</code> Array in the <code>StatusesManager</code> 
	     * on the data model. 
	     * 
	     */
		public static const EVENT : String = "com.intridea.presentlyAIRClient.events.StatusAddedEvent";
		
		/**
		 * 
		 * Stores the status returned by the Present.ly server.
		 * 
		 */
		public var status : Status;
		
		/**
		 *
		 * Instances of <code>StatusAddedEvent</code> are created and dispatched by the <code>StatusesManager</code> 
		 * object to notifiy the view that a status has been returned by the Present.ly server.
		 * 
		 * @param type Specific event being instantiated.
		 * @see com.adobe.cairngorm.control.CairngormEvent
		 * 
		 */
		public function StatusAddedEvent( type : String = EVENT ) 
		{
			super( type );
		}
	}
}
