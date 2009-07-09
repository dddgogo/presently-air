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
	import com.intridea.presentlyAIRClient.events.LocalSettingsPersistedEvent;
	import com.intridea.presentlyAIRClient.model.ModelLocator;
	import com.intridea.presentlyAIRClient.view.ViewUtils;
	
	import flash.data.SQLConnection;
	import flash.data.SQLMode;
	import flash.data.SQLStatement;
	import flash.events.SQLErrorEvent;
	import flash.events.SQLEvent;
	import flash.filesystem.File;
	import flash.utils.ByteArray;
	
	/**
     *
     * Saves all user preferences collected through the application to the user settings SQLite database.
     * 
     * @see com.adobe.cairngorm.commands.ICommand
     * 
     */
	public final class PersistUserSettingsToLocalDatabaseCommand implements ICommand
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
		 * Used to open the user settings SQLite database.
		 * 
		 */
		private var sqlConnection : SQLConnection = new SQLConnection();
		
		/**
		 * 
		 * Used to execute SQL statements against the user settings SQLite database.
		 * 
		 */
		private var sqlStatement : SQLStatement = new SQLStatement();
		
		/**
		 *
		 * A reference to the user settings SQLite database. The path to the database is stored
		 * in the data model.
		 *  
		 */
		private var file : File = File.applicationStorageDirectory.resolvePath( model.DATABASE_NAME ); 

		/**
		 * 
		 * Creates the <code>SQLConnection</code> instance, adds database event listeners and opens the user
		 * settings SQLite database.
		 * 
		 * @param event The associated event used to execute this command.
		 * 
		 */
		public function execute( event : CairngormEvent ) : void
		{	
			sqlStatement.sqlConnection = sqlConnection;
			sqlStatement.addEventListener( SQLErrorEvent.ERROR, onSQLStatementError, false, 0, false );
			
			sqlConnection.addEventListener( SQLEvent.OPEN, persistUserData, false, 0, false );
			sqlConnection.addEventListener( SQLErrorEvent.ERROR, onSQLError, false, 0, false );
			sqlConnection.openAsync( file, SQLMode.CREATE, null, false, 1024 );
		}
		
		/**
		 * 
		 * Saves the user preferences collected through the view to the user settings SQLite database.
		 * 
		 * @param event Standard <code>SQLEvent</code>. Not used in this method. 
		 * 
		 */
		private function persistUserData( event : SQLEvent ) : void
		{
			if ( model.currentUser == null )
			{
				new LocalSettingsPersistedEvent( LocalSettingsPersistedEvent.EVENT ).dispatch();
			}
			else
			{
				var insertUserSettingSQL : String = "INSERT INTO UserData " + 
													"(rememberLoginInfo, " +
													"screenName, " + 
													"password, " + 
													"account, " + 
													"autoUpdateInterval, " + 
													"isTransparencyEnabled, " + 
													"transparency, " + 
													"isMinimizeToSystemTrayEnabled, " + 
													"mainStreamNotificationsEnabled, " + 
													"directMessagesNotificationsEnabled) " + 
													"VALUES (" +
													model.rememberLoginInfo + ", " +
													"'" + model.currentUser.screenName + "', " +
													"'" + model.currentUser.password + "', " +
													"'" + model.currentUser.account + "', " +
													model.autoUpdateInterval + ", " +
													ViewUtils.isTransparencyEnabled + ", " +
													ViewUtils.transparency + ", " +
													model.isMinimizeToSystemTrayEnabled + ", " +
													model.mainStreamNotificationsEnabled + ", " +
													model.directMessagesNotificationsEnabled + ")";
				
				sqlStatement.addEventListener( SQLEvent.RESULT, userSettingsPersisted );
				sqlStatement.text = insertUserSettingSQL;
				sqlStatement.execute();
			}
		}
		
		/**
		 *
		 * Notifies the view that the user's preferences have been saved to the user settings SQLite database.
		 * 
		 * @param event Standard <code>SQLEvent</code>. Not used in this method.
		 *  
		 */
		private function userSettingsPersisted( event : SQLEvent ) : void
		{
			new LocalSettingsPersistedEvent( LocalSettingsPersistedEvent.EVENT ).dispatch();
		}
		
		/**
		 * 
		 * Handles error events dispatched by the <code>sqlStatement</code> instance. Event data will contain
		 * error messages outlining the source of the problem. 
		 * 
		 * @param event Contains information about the error. The information is written to the output window.
		 * 
		 */
		private function onSQLStatementError( event : SQLErrorEvent ) : void
		{
			trace( ">>PersistUserSettingsToLocalDatabaseCommand::onSQLStatementError" );
			trace( "event.error: " + event.error );
		}
		
		/**
		 * 
		 * Handles error events dispatched by the <code>sqlConnection</code> instance. Event data will contain
		 * error messages outlining the source of the problem. 
		 * 
		 * @param event Contains information about the error. The information is written to the output window. 
		 * 
		 */
		private function onSQLError( event : SQLErrorEvent ) : void 
		{
			trace( "Error message:" , event.error.message ); 
			trace( "Details:", event.error.details );
		}
	}
}