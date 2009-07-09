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
	import com.intridea.presentlyAIRClient.events.DatabaseCreatedEvent;
	import com.intridea.presentlyAIRClient.model.ModelLocator;
	
	import flash.data.SQLConnection;
	import flash.data.SQLMode;
	import flash.data.SQLStatement;
	import flash.events.SQLErrorEvent;
	import flash.events.SQLEvent;
	import flash.filesystem.File;
	import flash.utils.ByteArray;
	
	/**
     *
     * Creates a SQLite database to store the user's preference data.
     * 
     * @see com.adobe.cairngorm.commands.ICommand
     * 
     */
	public final class CreateUserSettingsDatabaseCommand implements ICommand
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
			sqlStatement.addEventListener( SQLEvent.RESULT, databaseCreated, false, 0, false );
			sqlStatement.addEventListener( SQLErrorEvent.ERROR, onSQLStatementError, false, 0, false );
			
			sqlConnection.addEventListener( SQLEvent.OPEN, createDatabase, false, 0, false );
			sqlConnection.addEventListener( SQLErrorEvent.ERROR, onSQLError, false, 0, false ); 
			sqlConnection.openAsync( file, SQLMode.CREATE, null, false, 1024 );
		}
		
		/**
		 * 
		 * Creates the SQLite database to store user preference information.
		 * 
		 */
		private function createDatabase( event : SQLEvent ) : void
		{
			var createDatabaseSQL : String = "CREATE TABLE IF NOT EXISTS UserData (" +
												"userID INTEGER PRIMARY KEY AUTOINCREMENT, " + 
												"rememberLoginInfo BOOLEAN, " +
												"screenName TEXT, " + 
												"password TEXT, " +
												"account TEXT, " +
												"autoUpdateInterval NUMBER, " +
												"isTransparencyEnabled BOOELAN, " +
												"transparency NUMBER, " +
												"isMinimizeToSystemTrayEnabled BOOLEAN, " + 
												"directMessagesNotificationsEnabled BOOLEAN, " + 
												"mainStreamNotificationsEnabled BOOLEAN)";
										
			sqlStatement.text = createDatabaseSQL;
			sqlStatement.execute();
		}
		
		/**
		 * 
		 * Capture the SQLite database creation and dispatch an event back to the view.
		 * 
		 * @param event Standard <code>SQLEvent</code>. Is not used by the method.
		 * 
		 */
		private function databaseCreated( event : SQLEvent ) : void
		{
			new DatabaseCreatedEvent( DatabaseCreatedEvent.EVENT ).dispatch();
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
			trace( ">>CreateUserSettingsDatabaseCommand::onSQLStatementError" );
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
			trace( ">>CreateUserSettingsDatabaseCommand::onSQLError" );
			trace( "Error message:" , event.error.message ); 
			trace( "Details:", event.error.details );
		}
	}
}