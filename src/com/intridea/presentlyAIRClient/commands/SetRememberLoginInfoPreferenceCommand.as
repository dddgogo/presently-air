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
	import com.intridea.presentlyAIRClient.events.SetRememberLoginInfoPreferenceEvent;
	import com.intridea.presentlyAIRClient.model.ModelLocator;
	
	/**
     *
     * Updates the reference on the data model to remember the user's login information including the account,
     * username, password and Present.ly URL.
     * 
     * @see com.adobe.cairngorm.commands.ICommand
     * 
     */
	public final class SetRememberLoginInfoPreferenceCommand implements ICommand
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
		 * Collects the user's preference to remember login info. Updates the data model with
		 * the user's preference.
		 * 
		 * @param event Contains the user's preference to remember login information.
		 * 
		 */
		public function execute( event : CairngormEvent ) : void
		{
			var setRememberLoginInfoPreferenceEvent : SetRememberLoginInfoPreferenceEvent = event as SetRememberLoginInfoPreferenceEvent;
			model.rememberLoginInfo = setRememberLoginInfoPreferenceEvent.rememberLoginInfo;
		}
	}
}