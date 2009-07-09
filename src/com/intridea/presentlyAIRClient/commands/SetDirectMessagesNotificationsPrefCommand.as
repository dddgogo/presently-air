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
	import com.intridea.presentlyAIRClient.events.SetDirectMessagesNotificationsPrefEvent;
	import com.intridea.presentlyAIRClient.model.ModelLocator;
	
	/**
     *
     * Updates the user's preference to display notification windows in the view for direct messages udpates.
     * 
     * @see com.adobe.cairngorm.commands.ICommand
     * 
     */
	public final class SetDirectMessagesNotificationsPrefCommand implements ICommand
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
		 * Updates the data model with the user's preference to display or hide notification windows in the view.
		 * 
		 * @param event Provides the user's preference to hide or show the direct messages notification windows.
		 * 
		 */
		public function execute( event : CairngormEvent ) : void
		{
			 var setDirectMessagesNotificationsPrefEvent : SetDirectMessagesNotificationsPrefEvent = event as SetDirectMessagesNotificationsPrefEvent;
			 model.directMessagesNotificationsEnabled = setDirectMessagesNotificationsPrefEvent.directMessagesNotificationsEnabled;
		}
	}
}