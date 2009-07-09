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
	import com.intridea.presentlyAIRClient.events.PresentlyURLChangeEvent;
	import com.intridea.presentlyAIRClient.model.ModelLocator;
	
	/**
     *
     * Updates the URL used to connect to the Present.ly server for service requests.
     * 
     * @see com.adobe.cairngorm.commands.ICommand
     * 
     */
	public final class PresentlyURLChangeCommand implements ICommand
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
		 * Update the URL used to connect to the Present.ly server.
		 * 
		 * @param event Has a reference to the updated Present.ly URL. Updates the data model with value provied 
		 * by the user through the <code>Settings</code> view.
		 * 
		 * @see com.intridea.presentlyAIRClient.events.PresentlyURLChangeEvent
		 * 
		 */
		public function execute( event : CairngormEvent ) : void
		{
			var presentlyURLChangeEvent : PresentlyURLChangeEvent = event as PresentlyURLChangeEvent;
			model.presentlyBaseURL = presentlyURLChangeEvent.url;
		}
	}
}