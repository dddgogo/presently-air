/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.presentlyAIRClient.context
{
	/**
	 * 
	 * Provides context for the various view states in the application.
	 * 
	 */
	public final class ApplicationContext
	{
		
		/**
		 * 
		 * Represents the login view.
		 * 
		 */
		public static const LOGIN_VIEW : int = 0;
		
		/**
		 * 
		 * Represents the StatusesTimeline view
		 * 
		 */
		public static const STATUSES_TIMELINE_VIEW : int = 1;
		
		/**
		 * 
		 * Represents the friends and followers view.
		 * 
		 */
		public static const FRIENDS_FOLLOWERS_VIEW : int = 2;
		
		/**
		 * 
		 * Represents the user lookup view.
		 * 
		 */
		public static const USER_LOOKUP_VIEW : int = 3;
		
		/**
		 * 
		 * Represents the settings view.
		 * 
		 */
		public static const SETTINGS_VIEW : int = 4;
		
		[Bindable]
		/**
		 * 
		 * Sets the login view to always display first. Provides management for the main view components.
		 * 
		 */
		public static var currentViewState : int = LOGIN_VIEW;
		
		/**
		 * 
		 * Provides a static reference to the various views used in the application.
		 * 
		 */
		public function ApplicationContext()
		{
		}

	}
}