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
	import com.intridea.presentlyAIRClient.model.ModelLocator;
	import com.intridea.presentlyAIRClient.model.domain.User;
	
	/**
     *
     * Clears the screen name from the data model for the last user look up.
     * 
     * @see com.adobe.cairngorm.commands.ICommand
     * 
     */
	public final class ClearCurrentLookupUserScreenNameCommand implements ICommand
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
		 * Clears the screen name for the last user look up.
		 * 
		 * @param event No event is passed into the execute method for this class.
		 * 
		 */
		public function execute( event : CairngormEvent ) : void
		{
			model.currentLookupUserScreenName = "";
		}	
	}
}