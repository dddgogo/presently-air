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
	import com.intridea.presentlyAIRClient.events.UpdateTransparencyEvent;
	import com.intridea.presentlyAIRClient.view.ViewUtils;
	
	import mx.core.Application;
	
	/**
     *
     * Updates the transparency for the overall application view and the associated <code>ViewUtils</code> property.
     * 
     * @see com.adobe.cairngorm.commands.ICommand
     * 
     */
	public final class UpdateTransparencyCommand implements ICommand
	{
		
		/**
		 *
		 * Updates the overall application view's transparency. Provides conversion to the range of 0.0-0.1.
		 * 
		 * @param event Provides the user's desired transparency value in the range of 1-100.    
		 *  
		 */
		public function execute( event : CairngormEvent ) : void
		{
			var updateTransparencyEvent : UpdateTransparencyEvent = event as UpdateTransparencyEvent;
			var transparency : Number = Math.round( updateTransparencyEvent.transparency );
			transparency = transparency / 100;
			ViewUtils.transparency = transparency;
		}	
	}
}