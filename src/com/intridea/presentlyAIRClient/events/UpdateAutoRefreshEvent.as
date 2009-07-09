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
     * Updates the user's auto refresh increment setting on the data model.
     * 
     * @see com.adobe.cairngorm.control.CairngormEvent
     * 
     */
	public final class UpdateAutoRefreshEvent extends CairngormEvent
	{
	    /**
	     *
	     * Specific event type used to update the auto refresh increment on the data model.
	     * 
	     */
		public static const EVENT : String = "com.intridea.presentlyAIRClient.events.UpdateAutoRefreshEvent";
		
		/**
		 * 
		 * The auto interval value entered by the user in the Settings view. Used to update the data model.
		 * 
		 * @see com.intridea.presentlyAIRClient.view.Settings
		 * 
		 */
		public var interval : int;
		
		/**
		 *
		 * Instances of <code>UpdateAutoRefreshEvent</code> are created and dispatched by the Settings view.
		 * 
		 * @param type Specific event being instantiated.
		 * @see com.intridea.presentlyAIRClient.view.Settings
		 * @see com.adobe.cairngorm.control.CairngormEvent
		 * 
		 */
		public function UpdateAutoRefreshEvent( type : String = EVENT ) 
		{
			super( type );
		}
	}
}
