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
     * Used to change the applications view state.
     *
     * @see com.adobe.cairngorm.control.CairngormEvent
     *
     */
	public final class SetSelectedViewStateEvent extends CairngormEvent
	{
	    /**
	     *
	     * Specific event type used to change the application view state.
	     *
	     * @see com.adobe.cairngorm.control.CairngormEvent
	     *
	     */
		public static const EVENT : String = "com.intridea.presentlyAIRClient.events.SetSelectedViewStateEvent";
		
		/**
		 * 
		 * Holds the view state the user has requested to navigate to. Updates the 
		 * <code>ApplicationViewState.currentView</code> property.
		 * 
		 */
		public var state : int;
		
		/**
		 *
		 * Passes internal EVENT property to base class. Assigns internal state property
		 * with value from the methods parameter. This integer value represents a view
		 * state within the application.
		 * 
		 * @see EVENT;
		 *
		 */
		public function SetSelectedViewStateEvent( state : int ) 
		{
			super( EVENT );
			this.state = state;
 		}
	}
}
