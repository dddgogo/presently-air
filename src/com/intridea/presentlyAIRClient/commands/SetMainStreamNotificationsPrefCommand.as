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
	import com.intridea.presentlyAIRClient.events.SetMainStreamNotificationsPrefEvent;
	import com.intridea.presentlyAIRClient.model.ModelLocator;
	
	/**
     *
     * Updates the user's preference to display notification windows in the view for main stream udpates.
     * 
     * @see com.adobe.cairngorm.commands.ICommand
     * 
     */
	public final class SetMainStreamNotificationsPrefCommand implements ICommand
	{
		/**
		 * 
		 */
		private static var model : ModelLocator = ModelLocator.instance;

		/**
		 * 
		 * Updates the data model with the user's preference to display or hide notification windows in the view.
		 * 
		 * @param event Provides the user's preference to hide or show the main stream notification windows.
		 * 
		 */
		public function execute( event : CairngormEvent ) : void
		{
			 var setMainStreamNotificationsPrefEvent : SetMainStreamNotificationsPrefEvent = event as SetMainStreamNotificationsPrefEvent;
			 model.mainStreamNotificationsEnabled = setMainStreamNotificationsPrefEvent.mainStreamNotificationsEnabled;
		}
	}
}