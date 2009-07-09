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
	import com.intridea.presentlyAIRClient.events.EnableTransparencyEvent;
	import com.intridea.presentlyAIRClient.events.UpdateTransparencyEvent;
	import com.intridea.presentlyAIRClient.model.ModelLocator;
	import com.intridea.presentlyAIRClient.view.ViewUtils;
	
	/**
     *
     * Sets the enabled property on the data model updating the overall transparency for the application view.
     * 
     * @see com.adobe.cairngorm.commands.ICommand
     * 
     */
	public final class EnableTransparencyCommand implements ICommand
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
		 * Updates the transparency property on the data model.
		 * 
		 * @param event Dispatched from the Settings view.
		 * 
		 */
		public function execute( event : CairngormEvent ) : void
		{
			var enableTransparencyEvent : EnableTransparencyEvent = event as EnableTransparencyEvent;
			ViewUtils.isTransparencyEnabled = enableTransparencyEvent.isEnabled;
			
			if ( !ViewUtils.isTransparencyEnabled )
			{
				var updateTransparencyEvent : UpdateTransparencyEvent = new UpdateTransparencyEvent( UpdateTransparencyEvent.EVENT );
				updateTransparencyEvent.transparency = 100;
				updateTransparencyEvent.dispatch();	
			}
		}	
	}
}