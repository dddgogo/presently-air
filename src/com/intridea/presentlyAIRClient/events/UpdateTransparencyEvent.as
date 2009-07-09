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
     * Updates the transparency of the overall application view. Data is updated on the data model.
     * 
     * @see com.adobe.cairngorm.control.CairngormEvent
     * 
     */
	public final class UpdateTransparencyEvent extends CairngormEvent
	{
	    /**
	     *
	     * Specific event type used to update the transparency setting for the overall application view. Data is
	     * updated on the data model. 
	     * 
	     */
		public static const EVENT : String = "com.intridea.presentlyAIRClient.events.UpdateTransparencyEvent";
		
		/**
		 * 
		 * The transparency value provided by the user in the Settings view.
		 * 
		 * @see com.intridea.presentlyAIRClient.view.Settings
		 * 
		 */
		public var transparency : int;	
		
		/**
		 *
		 * Instances of <code>UpdateTransparencyEvent</code> are created and dispatched by the Settings view.
		 * 
		 * @param type Specific event being instantiated.
		 * @see com.intridea.presentlyAIRClient.view.Settings
		 * @see com.adobe.cairngorm.control.CairngormEvent
		 * 
		 */
		public function UpdateTransparencyEvent( type : String = EVENT ) 
		{
			super( type );
		}
	}
}
