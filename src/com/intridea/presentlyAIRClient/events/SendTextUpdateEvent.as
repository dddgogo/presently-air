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
     * Sends message text entered by user's to the Present.ly server.
     * 
     * @see com.adobe.cairngorm.control.CairngormEvent
     * 
     */
	public final class SendTextUpdateEvent extends CairngormEvent
	{
	    /**
	     *
	     * Specific event type used to send the user's message text to the Present.ly server.
	     * 
	     */
		public static const EVENT : String = "com.intridea.presentlyAIRClient.events.SendTextUpdateEvent";		
		
		/**
		 * 
		 * Stores the data entered into the view by the user so it can be passed to the
		 * <code>SendTextUpdateCommand</code> and passed to the Present.ly server. 
		 * 
		 */
		public var textUpdate : String;
		
		/**
		 *
		 * Instances of <code>RepliesEvent</code> are typically created and dispatched by the view layer and 
		 * command classes.
		 * 
		 * @param type Specific event being instantiated.
		 * @see com.adobe.cairngorm.control.CairngormEvent
		 * 
		 */
		public function SendTextUpdateEvent( type : String = EVENT ) 
		{
			super( type );
		}
	}
}
