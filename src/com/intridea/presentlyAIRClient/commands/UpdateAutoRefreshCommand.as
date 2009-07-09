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
	import com.intridea.presentlyAIRClient.events.UpdateAutoRefreshEvent;
	import com.intridea.presentlyAIRClient.model.ModelLocator;
	
	/**
     *
     * Updates the auto update interval setting on the data model.
     * 
     * @see com.adobe.cairngorm.commands.ICommand
     * 
     */
	public final class UpdateAutoRefreshCommand implements ICommand
	{
		
		/**
		 * 
		 * Defines a reference to the <code>ModelLocator</code> implementation.
		 * 
		 * @see com.intridea.presentlyAIRClient.model.ModelLocator
		 * 
		 */
		private static var model : ModelLocator = ModelLocator.instance;

		/**
		 * 
		 * Updates data model with the auto update interval provided by the user through the <code>Settings</code> view.
		 * Provides conversion to milliseconds required by the auto update logic.
		 * 
		 * @param event Provides the auto update interval set by the user in seconds format.
		 * @see com.intridea.presentlyAIRClient.view.Settings
		 * 
		 */
		public function execute( event : CairngormEvent ) : void
		{
			var updateAutoRefreshEvent : UpdateAutoRefreshEvent = event as UpdateAutoRefreshEvent;
			model.autoUpdateInterval = updateAutoRefreshEvent.interval * 100000;
		}
	}		

}