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
     * Used to inform the view friends data has been returned by the Present.ly server.
     * @see com.adobe.cairngorm.control.CairngormEvent
     * 
     */
	public final class FriendsRetrievedEvent extends CairngormEvent
	{
	    /**
	     *
	     * Specific event type used to inform the view that friends data has been returned by the Present.ly server.
	     * 
	     */
		public static const EVENT : String = "com.intridea.presentlyAIRClient.events.FriendsRetrievedEvent";		
		
		/**
		 *
		 * Instances of <code>FriendsRetrievedEvent</code> are created and dispatched by 
		 * <code>FriendsCommand<code> instances to notify the view that friends data has been returned
		 * by the Present.ly server.
		 * 
		 * @param type Specific event being instantiated.
		 * @see com.adobe.cairngorm.control.CairngormEvent
		 * 
		 */
		public function FriendsRetrievedEvent( type : String = EVENT ) 
		{
			super( type );
		}
	}
}
