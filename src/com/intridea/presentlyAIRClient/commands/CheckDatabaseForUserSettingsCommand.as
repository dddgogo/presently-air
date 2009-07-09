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
	import com.intridea.presentlyAIRClient.view.ViewUtils;
	
	import flash.data.SQLConnection;
	import flash.data.SQLMode;
	import flash.data.SQLResult;
	import flash.data.SQLStatement;
	import flash.events.SQLErrorEvent;
	import flash.events.SQLEvent;
	import flash.filesystem.File;
	import flash.utils.ByteArray;
	
	/**
     *
     * Interrogates the SQLite database for user preferences.
     * 
     * @see com.adobe.cairngorm.commands.ICommand
     * 
     */
	public final class CheckDatabaseForUserSettingsCommand implements ICommand
	{
		/**
		 * 
		 * Defines a reference to the <code>ModelLocator</code> implementation.
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
			sqlStatement.addEventListener( SQLEvent.RESULT, userSettingsRetrieved, false, 0, false );
			sqlStatement.addEventListener( SQLErrorEvent.ERROR, onSQLStatementError, false, 0, false );
			
			sqlConnection.addEventListener( SQLEvent.OPEN, onSQLOpen, false, 0, false );
			sqlConnection.addEventListener( SQLErrorEvent.ERROR, onSQLError, false, 0, false ); 
			sqlConnection.openAsync( file, SQLMode.CREATE, null, false, 1024 );
		}
		
		/**
		 * 
		 * Prepares and executes the SQL statement used to query the user settings SQLite database.
		 * 
		 * @param event Standard <code>SQLEvent</code>. Not used in this method.  
		 * 
		 */
		private function onSQLOpen( event : SQLEvent ) : void
		{
			var selectUserDataSQL : String = "SELECT * FROM UserData";
			sqlStatement.text = selectUserDataSQL;
			sqlStatement.execute();
		}
		
		/**
		 * 
		 * Handles result events dispatched by the <code>sqlStatement</code> instance. Retrieves data from
		 * the user settings SQLite database and populates the data model and <code>ViewUtils</code> 
		 * properties with user preference data.
		 * 
		 * @param event Contains result information from the sqlStatement query.
		 * @see com.intridea.presentlyAIRClient.view.ViewUtils 
		 * 
		 */
		private function userSettingsRetrieved( event : SQLEvent ) : void
		{
			var result : SQLResult = sqlStatement.getResult();
			
			if ( result.data != null )
			{
				
				var recordCount : int = result.data.length;
				if ( recordCount > 0 )
				{
					recordCount = recordCount - 1;
				}
				var userSettings : Object = result.data[ recordCount ];
				if ( userSettings != null )
				{
					if ( userSettings.rememberLoginInfo )
					{
						model.currentUser = new User();
						model.rememberLoginInfo = userSettings.rememberLoginInfo;
						model.currentUser.screenName = userSettings.screenName;
						model.currentUser.password = userSettings.password;
						model.currentUser.account = userSettings.account;
						model.currentAccount = userSettings.account;
					}
					model.autoUpdateInterval = userSettings.autoUpdateInterval;
					ViewUtils.isTransparencyEnabled = userSettings.isTransparencyEnabled;				
					ViewUtils.transparency = userSettings.transparency;
					model.isMinimizeToSystemTrayEnabled = userSettings.isMinimizeToSystemTrayEnabled; 
					model.mainStreamNotificationsEnabled = userSettings.mainStreamNotificationsEnabled; 
					model.directMessagesNotificationsEnabled = userSettings.directMessagesNotificationsEnabled;
				}
			}
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
			trace( ">>CheckDatabaseForUserSettingsCommand::onSQLStatementError" );
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