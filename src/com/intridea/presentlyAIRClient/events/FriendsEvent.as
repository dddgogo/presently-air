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
     * Used to request the friends data stream from the Present.ly server for the current user.
     * 
     */
	public final class FriendsEvent extends CairngormEvent
	{
	    /**
	     *
	     * Specific event type used to request the current user's friends from the Present.ly server.
	     * 
	     */
		public static const EVENT : String = "com.intridea.presentlyAIRClient.events.FriendsEvent";		
		
		/**
		 *
		 * Instances of <code>FollowersEvent</code> are typically created and dispatched by the view layer and 
		 * command classes.
		 * 
		 * @param type Specific event being instantiated.
		 * 
		 */
		public function FriendsEvent( type : String = EVENT ) 
		{
			super( type );
		}
	}
}
