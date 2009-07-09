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
	import com.intridea.presentlyAIRClient.events.SetCurrentLookupUserScreenNameEvent;
	import com.intridea.presentlyAIRClient.model.ModelLocator;
	
	/**
     *
     * Updates the reference on the data model to the current user being looked up.
     * 
     * @see com.adobe.cairngorm.commands.ICommand
     * 
     */
	public final class SetCurrentLookupUserScreenNameCommand implements ICommand
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
		 * Collects the screen name of the user the current user is requesting. Updates the data model with
		 * the screen name.
		 * 
		 * @param event Contains the screen name of the user being looked up.
		 * 
		 */
		public function execute( event : CairngormEvent ) : void
		{
			var setCurrentLookupUserEvent : SetCurrentLookupUserScreenNameEvent = event as SetCurrentLookupUserScreenNameEvent;
			model.currentLookupUserScreenName = setCurrentLookupUserEvent.screenName;
		}	
	}
}