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
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.intridea.presentlyAIRClient.events.LocalSettingsPersistedEvent;
	import com.intridea.presentlyAIRClient.events.PersistUserSettingsToLocalDatabaseEvent;
	import com.intridea.presentlyAIRClient.model.ModelLocator;
	
	import flash.desktop.NativeApplication;
	
	/**
     * 
     * Exits and closes the applicaiton. Saves user preference data before closing.
     * 
     * @see com.adobe.cairngorm.commands.ICommand
     * 
     */
	public final class ExitApplicationCommand implements ICommand
	{
		/**
		 *
		 * Get a reference to the system wide event notifier. 
		 * 
		 * @see com.adobe.cairngorm.control.CairngormEventDispatcher 
		 *  
		 */
		private static const dispatcher : CairngormEventDispatcher = CairngormEventDispatcher.getInstance();
			
		/**
		 * 
		 * Creates and dispatches a <code>PersistUserSettingsToLocalDatabaseEvent</code> to save user preference data
		 * to the user settings SQLite database.
		 * 
		 * @param event Standard <code>CairngormEvent</code>. Not used in this method.
		 * 
		 */
		public function execute( event : CairngormEvent ) : void
		{
			new PersistUserSettingsToLocalDatabaseEvent( PersistUserSettingsToLocalDatabaseEvent.EVENT ).dispatch();
			dispatcher.addEventListener( LocalSettingsPersistedEvent.EVENT, onLocalSettingsPersistedEvent, false, 0, false );
		}
		
		/**
		 * 
		 * Called after the user preferences have been saved to the database. Makes the system call to exit the application.
		 * 
		 * @param Standard <code>LocalSettingsPersistedEvent</code>. Not used in this method.
		 * 
		 */
		private function onLocalSettingsPersistedEvent( event : LocalSettingsPersistedEvent ) : void
		{
			NativeApplication.nativeApplication.exit();
		}
	}
}