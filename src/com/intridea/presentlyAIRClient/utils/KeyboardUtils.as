/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.presentlyAIRClient.utils
{
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	/**
	 * 
	 * A common repository for keyboard functionality definitions and utilities.
	 * 
	 */
	public final class KeyboardUtils
	{
		/**
		 * 
		 * Provides a static reference to keyboard related functionality and utilities.
		 * 
		 */
		public function KeyboardUtils()
		{
		}
		
		/**
		 * 
		 * Manages Enter key interaction for user's in the view.
		 * 
		 */
		public static function isEnterEvent( event : KeyboardEvent ) : Boolean
		{
			var isEnterKey : Boolean = false;
			if ( event.keyCode == Keyboard.ENTER )
			{
				isEnterKey = true;
			}
			return isEnterKey;
		}
	}
}