/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.presentlyAIRClient.utils
{
	import flash.desktop.NativeApplication;
	
	/**
	 * 
	 * Used for collecting application specific information.
	 * 
	 */
	public final class ApplicationManager
	{
		/**
		 * 
		 * Provides a static reference to collect application specific information.
		 * 
		 */
		public function ApplicationManager()
		{
		}
		
		/**
		 * 
		 * Used to display the application version collected from the application descriptor in the view.
		 * 
		 */
		public static function getAppVersion() : String
		{
			var applicationDescriptor : XML = NativeApplication.nativeApplication.applicationDescriptor;
			var descriptorNamespace : Namespace = applicationDescriptor.namespace();
			return applicationDescriptor.descriptorNamespace::version[0];
		}

	}
}