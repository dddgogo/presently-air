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
     * Updates the user's Present.ly URL on the data model.
     * @see com.adobe.cairngorm.control.CairngormEvent
     * 
     */
	public final class PresentlyURLChangeEvent extends CairngormEvent
	{
	    /**
	     *
	     * Specific event type used to update the Present.ly URL.
	     * 
	     */
		public static const EVENT : String = "com.intridea.presentlyAIRClient.events.PresentlyURLChangeEvent";		
		
		/**
		 * 
		 * Used to update the Present.ly URL on the data model.
		 * 
		 */
		public var url : String;
		
		/**
		 *
		 * Instances of <code>PresentlyURLChangeEvent</code> are typically created and dispatched by the view layer and 
		 * command classes.
		 * 
		 * @param type Specific event being instantiated.
		 * @see com.adobe.cairngorm.control.CairngormEvent
		 * 
		 */
		public function PresentlyURLChangeEvent( type : String = EVENT ) 
		{
			super( type );
		}
	}
}
