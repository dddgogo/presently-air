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
	import com.intridea.presentlyAIRClient.events.SetSystemTrayPreferenceEvent;
	import com.intridea.presentlyAIRClient.model.ModelLocator;
	
	/**
     *
     * Updates the reference on the data model to remember the user's login information including the account,
     * username, password and Present.ly URL.
     * 
     * @see com.adobe.cairngorm.commands.ICommand
     * 
     */
	public final class SetSystemTrayPreferenceCommand implements ICommand
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
		 * Collects the user's preference to move the application to the system tray or the taskbar when minimized. 
		 * Updates the data model with the user's preference.
		 * 
		 * @param event Contains the user's preference to minmize the application to the system tray or the taskbar.
		 * 
		 */
		public function execute( event : CairngormEvent ) : void
		{
			var setSystemTrayPreferenceEvent : SetSystemTrayPreferenceEvent = event as SetSystemTrayPreferenceEvent;
			model.isMinimizeToSystemTrayEnabled = setSystemTrayPreferenceEvent.isMinimizeToSystemTrayEnabled;
		}
	}
}