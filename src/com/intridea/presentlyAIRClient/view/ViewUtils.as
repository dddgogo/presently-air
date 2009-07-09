/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.presentlyAIRClient.view
{
	
	[Bindable]
	/**
	 * 
	 * View specific information that can be edited by the user at runtime to update the 
	 * visual appearance of the application.
	 * 
	 */
	public final class ViewUtils
	{
		
		/**
		 *
		 * Deafult width of avatar images for the current user.
		 *  
		 */
		public static var userProfileImageWidth : int = 55;
		
		/**
		 * 
		 * Deafult height of avatar images for the current user.
		 * 
		 */
		public static var userProfileImageHeight : int = 55;
		
		/**
		 * 
		 * Stores the overall transparency value supplied by the user view the <code>Settings</code> view.
		 * 
		 */
		public static var transparency : Number = 1.0;
		
		/**
		 * 
		 * Toggles the application's ability to update the transparency of the overall view. 
		 * 
		 */
		public static var isTransparencyEnabled : Boolean;
		
		/**
		 * 
		 * Provides a static reference to hold view specific settings at runtime.
		 * 
		 */
		public function ViewUtils()
		{
		}
	}
}