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
     * Used to request the statuses of users that are being looked up by the <code>UserLookupView</code>.
     * 
     * @see com.intridea.presentlyAIRClient.view.UserLookupView
     * @see com.adobe.cairngorm.control.CairngormEvent  
     * 
     */
	public final class UserTimelineEvent extends CairngormEvent
	{
	    /**
	     *
	     * Specific event type used to request the statuses of users being looked up.
	     * 
	     */
		public static const EVENT : String = "com.intridea.presentlyAIRClient.events.UserTimelineEvent";		
		
		/**
		 * 
		 * Used to send requests for specific users.
		 * 
		 */
		public var id : String;
		
		/**
		 *
		 * Instances of <code>UserTimelineEvent</code> are created and dispatched by the
		 * <code>UserLookupView</code>.
		 * 
		 * @param type Specific event being instantiated.
		 * @see com.intridea.presentlyAIRClient.views.UserLookupView
		 * @see com.adobe.cairngorm.control.CairngormEvent
		 * 
		 */
		public function UserTimelineEvent( type : String = EVENT ) 
		{
			super( type );
		}
	}
}
