/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */
 
package com.intridea.presentlyAIRClient.model
{
	import com.adobe.cairngorm.model.IModelLocator;
	import com.intridea.presentlyAIRClient.model.domain.User;
	import com.intridea.presentlyAIRClient.utils.ApplicationManager;
	import com.intridea.presentlyAIRClient.utils.StatusesManager;
	import com.intridea.presentlyAIRClient.utils.UserManager;

    [Bindable]
    /**
     *
     * Defines the application specific <code>ModelLocator</code> implementation.
     * 
     * <p>
     * The <code>ModelLocator</code> is a Singleton class which is utilized 
     * as a centralized data repository for the application.
     * </p>
     *
     */
	public final class ModelLocator implements IModelLocator
	{
		
		/**
		 *
		 * Defines the Singleton instance of the application specific
		 * <code>ModelLocator</code>.
		 *
		 */
		private static var _instance : ModelLocator;
		
		/**
		 * 
		 * Defines the external resource for signing up for the Present.ly service.
		 * 
		 */
		public const REGISTER_URL : String = "https://presentlyapp.com/accounts/new";
		
		/**
		 * 
		 * Represents the specific name of the local SQLite database used to persist user settings.
		 * 
		 */
		public const DATABASE_NAME : String = "presentlyairclient.db";
		
		/**
		 * 
		 * Represents the current system based status message displayed in the view.
		 * 
		 */
		private var _statusMessage : String = "Present.ly AIR [" + ApplicationManager.getAppVersion() + "]";
		
		public function get statusMessage() : String
		{
			return _statusMessage;
		}
		
		public function set statusMessage( message : String ) : void
		{
			_statusMessage = message;
		}
		
		/**
		 * 
		 * The current <code>User</code> interacting with the Present.ly AIR client.
		 * 
		 */
		private var _currentUser : User;
		
		public function get currentUser() : User
		{
			return _currentUser;
		}
		
		public function set currentUser( user : User ) : void
		{
			_currentUser = user;
		}
		
		/**
		 * 
		 * Represents the authentication state of the current <code>User</code>.
		 * 
		 */
		private var _isAuthenticated : Boolean = false;
		
		public function get isAuthenticated() : Boolean
		{
			return _isAuthenticated;
		}
		
		public function set isAuthenticated( authenticated : Boolean ) : void
		{
			_isAuthenticated = authenticated;
		}
		
		/**
		 * 
		 * Provides serialization methods for <code>Status</code> objects. Facilitates the updates
	 	 * of new <code>Status</code> objects.
		 * 
		 */
		private var _statusesManager : StatusesManager = new StatusesManager();
		
		public function get statusesManager() : StatusesManager
		{
			return _statusesManager;
		}
		
		public function set statusesManager( manager : StatusesManager ) : void
		{
			_statusesManager = manager;
		}
		
		/**
		 * 
		 * The account information associated with the current <code>User</code>.
		 * 
		 */
		private var _currentAccount : String;
		
		public function get currentAccount() : String
		{
			return _currentAccount;
		}
		
		public function set currentAccount( account : String ) : void
		{
			_currentAccount = account;
		}
		
		/**
		 * 
		 * The Present.ly service being called by the AIR client.
		 * 
		 */
		private var _currentService : String;
		
		public function get currentService() : String
		{
			return _currentService;
		}
		
		public function set currentService( service : String ) : void
		{
			_currentService = service;
		}
		
		/**
		 * 
		 * Represents a collection of friends for the current <code>User</code>. Friends are also <code>User</code> objects. 
		 * 
		 */
		private var _friends : Array;
		
		public function get friends() : Array
		{
			return _friends;
		}
		
		public function set friends( friendsArray : Array ) : void
		{
			// serialize all raw user Object objects into User objects specific to the application domain
			_friends = UserManager.serializeRawUserArray( friendsArray );
		}
		
		/**
		 * 
		 * The Present.ly URL associated with the current <code>User</code>. The default value is presentlyapp.com.
		 * 
		 */
		private var _presentlyBaseURL : String = "presentlyapp.com";
		
		public function get presentlyBaseURL() : String
		{
			return _presentlyBaseURL;
		}
		
		public function set presentlyBaseURL( url : String ) : void
		{
			_presentlyBaseURL = url;
		}
		
		/**
		 * 
		 * Represents a collection of followers for the current <code>User</code>. Friends are also <code>User</code> objects. 
		 * 
		 */
		private var _followers : Array;
		
		public function get followers() : Array
		{
			return _followers;
		}
		
		public function set followers( followersArray : Array ) : void
		{
			// serialize all raw user Object objects into User objects specific to the application domain
			_followers = UserManager.serializeRawUserArray( followersArray );
		}
		
		/**
		 * 
		 * The screen name of the <code>User</code> that's currently being looked up by the Present.ly server.
		 * 
		 */
		private var _currentLookupUserScreenName : String;
		
		public function get currentLookupUserScreenName() : String
		{
			return _currentLookupUserScreenName;
		}
		
		public function set currentLookupUserScreenName( screenName : String ) : void
		{
			_currentLookupUserScreenName = screenName;
		}
		
		/**
		 * 
		 * Defines the time in between service invocation calls to the Present.ly server.
		 * 
		 */
		private var _autoUpdateInterval : int;
		
		public function get autoUpdateInterval() : int
		{
			return _autoUpdateInterval;
		}
		
		public function set autoUpdateInterval( interval : int ) : void
		{
			_autoUpdateInterval = interval;
		}
		
		/**
		 * 
		 * Toggles the application to minmize to the system tray or the taskbar.
		 * 
		 */
		private var _isMinimizeToSystemTrayEnabled : Boolean;
		
		public function get isMinimizeToSystemTrayEnabled() : Boolean
		{
			return _isMinimizeToSystemTrayEnabled;
		}
		
		public function set isMinimizeToSystemTrayEnabled( isEnabled : Boolean ) : void
		{
			_isMinimizeToSystemTrayEnabled = isEnabled;
		}
		
		/**
		 * 
		 * Toggles between the applications ability to remember the current user's log in information
		 * between interactions with the program.
		 * 
		 */
		private var _rememberLoginInfo : Boolean;
		
		public function get rememberLoginInfo() : Boolean
		{
			return _rememberLoginInfo;
		}
		
		public function set rememberLoginInfo( isPersisted : Boolean ) : void
		{
			_rememberLoginInfo = isPersisted;
		}
		
		/**
		 * 
		 * Shows or hides the notification windows in the view for main stream timeline updates.
		 * 
		 */
		private var _mainStreamNotificationsEnabled : Boolean;
		
		public function get mainStreamNotificationsEnabled() : Boolean
		{
			return _mainStreamNotificationsEnabled;
		}
		
		public function set mainStreamNotificationsEnabled( isEnabled : Boolean ) : void
		{
			_mainStreamNotificationsEnabled = isEnabled;
		}
		
		/**
		 * 
		 * Shows or hides the notification windows in the view for direct messages updates.
		 * 
		 */
		private var _directMessagesNotificationsEnabled : Boolean;
		
		public function get directMessagesNotificationsEnabled() : Boolean
		{
			return _directMessagesNotificationsEnabled;
		}
		
		public function set directMessagesNotificationsEnabled( isEnabled : Boolean ) : void
		{
			_directMessagesNotificationsEnabled = isEnabled;
		}
				
		/**
		 *
		 * The <code>ModelLocator</code> constructor is never to be
		 * invoked from outside the class definition.
		 *
		 */
		public function ModelLocator( access : Private )
		{
			if ( access == null )
			{
				throw new Error( "ModelLocator" );
			}
		}

		/**
		 *
		 * Retrieves the Singleton instance of the BestPracticesExample application
		 * <code>ModelLocator</code>.
		 *
		 */
		public static function get instance() : ModelLocator
		{
			if ( _instance == null )
			{
				_instance = new ModelLocator( new Private() );
			}
			return _instance;
		}
	}
}

/**
 * 
 * Inner class which restricts Constructor access to private.
 * 
 */
class Private {}
