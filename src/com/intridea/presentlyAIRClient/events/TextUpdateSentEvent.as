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
     * Notifies the view when a text message entered into the view by the user has been sent to the Present.ly server.
     * 
     * @see com.intridea.presentlyAIRClient.commands.SendTextUpdateCommand
     * @see com.adobe.cairngorm.control.CairngormEvent
     * 
     */
	public final class TextUpdateSentEvent extends CairngormEvent
	{
	    /**
	     *
	     * Specific event type used to the view that text messages entered into the view have been sent to the
	     * Present.ly server.
	     * 
	     */
		public static const EVENT : String = "com.intridea.presentlyAIRClient.events.TextUpdateSentEvent";
		
		/**
		 *
		 * Instances of <code>TextUpdateSentEvent</code> are created and dispatched by <code>SendTextUpdateCommand</code>
		 * instances when text messages entered into the view are sent to the Present.ly server. 
		 * 
		 * @param type Specific event being instantiated.
		 * @see com.intridea.presentlyAIRClient.commands.SendTextUpdateCommand
		 * @see com.adobe.cairngorm.control.CairngormEvent
		 * 
		 */
		public function TextUpdateSentEvent( type : String = EVENT ) 
		{
			super( type );
		}
	}
}
