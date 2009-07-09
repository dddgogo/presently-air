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
     * Updates the data model to enable transparency for the overall application view.
     * 
     */
	public final class EnableTransparencyEvent extends CairngormEvent
	{
	    /**
	     *
	     * Specific event type used to update the users application view transparency preference.
	     * 
	     */
		public static const EVENT : String = "com.intridea.presentlyAIRClient.events.EnableTransparencyEvent";
		
		/**
		 * 
		 * Used to update the data model's transparency property.
		 * 
		 */
		public var isEnabled : Boolean;	
		
		/**
		 *
		 * Instances of <code>EnableTransparencyEvent</code> are typically created and dispatched by the view layer and 
		 * command classes.
		 * 
		 * @param type Specific event being instantiated.
		 * 
		 */
		public function EnableTransparencyEvent( type : String = EVENT ) 
		{
			super( type );
		}
	}
}
