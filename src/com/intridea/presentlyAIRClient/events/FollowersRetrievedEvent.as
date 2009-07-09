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
     * Used to inform the view followers data has been returned by the Present.ly server.
     * 
     */
	public final class FollowersRetrievedEvent extends CairngormEvent
	{
	    /**
	     *
	     * Specific event type used to inform the view that followers data has been returned by the Present.ly server.
	     * 
	     */
		public static const EVENT : String = "com.intridea.presentlyAIRClient.events.FollowersRetrievedEvent";		
		
		/**
		 *
		 * Instances of <code>FollowersRetrievedEvent</code> are created and dispatched by 
		 * <code>FollowersCommand<code> instances to notify the view that followers data has been returned
		 * by the Present.ly server.
		 * 
		 * @param type Specific event being instantiated. 
		 * 
		 */
		public function FollowersRetrievedEvent( type : String = EVENT ) 
		{
			super( type );
		}
	}
}
