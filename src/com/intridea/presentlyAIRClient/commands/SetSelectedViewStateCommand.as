/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.presentlyAIRClient.commands
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.intridea.presentlyAIRClient.context.ApplicationContext;
	import com.intridea.presentlyAIRClient.events.SetSelectedViewStateEvent;

    /**
     *
     * Handles application's logic execution for <code>SetSelectedViewStateEvent</code> 
     * events. Updates the application model to display various view states in the UI.
     *
     * @see com.com.intridea.presentlyAIRClient.events.SetSelectedViewStateEvent
     * @see com.adobe.cairngorm.commands.ICommand
     *
     */
	public final class SetSelectedViewStateCommand implements ICommand
	{
	    /**
		 * 
		 * Main method used to handle the work for the <code>SetSelectedViewStateCommand</code> object.
		 * Uses arguments passed into the execute method to update the application data model's 
		 * <code>currentViewState</code> property.
		 * 
		 * @param event Provides the view state being requested by the user through the view.
		 * 
		 */
		public function execute( event : CairngormEvent ) : void
		{
			var evt : SetSelectedViewStateEvent = event as SetSelectedViewStateEvent;
			ApplicationContext.currentViewState = evt.state;
		}
	}
}
