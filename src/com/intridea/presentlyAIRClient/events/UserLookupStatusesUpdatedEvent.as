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
     * Retrives statuses for the current user being looked up.
     * 
     * @see com.adobe.cairngorm.control.CairngormEvent
     * 
     */
	public final class UserLookupStatusesUpdatedEvent extends CairngormEvent
	{
	    /**
	     *
	     * Specific event type used to request statuses for user lookups.
	     * 
	     */
		public static const EVENT : String = "com.intridea.presentlyAIRClient.events.UserLookupStatusesUpdatedEvent";
		
		/**
		 * 
		 * The status objects being returned by the Present.ly server for user lookup requests.
		 * 
		 */
		public var statuses : ArrayCollection;
		
		/**
		 *
		 * Instances of <code>UserLookupStatusesUpdatedEvent</code> are created and dispatched by 
		 * <code>UserTimelineCommand</code> instances.
		 * 
		 * @param type Specific event being instantiated.
		 * @see com.intridea.presentlyAIRClient.commands.UserTimelineCommand
		 * @see com.adobe.cairngorm.control.CairngormEvent
		 * 
		 */
		public function UserLookupStatusesUpdatedEvent( type : String = EVENT ) 
		{
			super( type );
		}
	}
}
