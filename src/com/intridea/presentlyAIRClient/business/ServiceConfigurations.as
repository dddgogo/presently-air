package com.intridea.presentlyAIRClient.business
{
	/**
	 * 
	 * Storage and lookup utility for all service based URI patterns for the application. 
	 * 
	 */
	public final class ServiceConfigurations
	{
		/**
		 *
		 * Provides a secure connection to the Present.ly server.
		 *  
		 */
		public static const URL_BASE : String = "https://";
		
		/**
		 * 
		 * Defines the service URI for logging users into the Present.ly server.
		 * 
		 */ 
		public static const LOGIN_URL : String = "api/twitter/account/verify_credentials.xml";
		
		/**
		 * 
		 * Defines the service URI for logging users out of the Present.ly server.
		 * 
		 */ 
		public static const LOGOUT_URL : String = "logout";
		
		/**
		 * 
		 * Defines the service URI for requesting the public timeline from the Present.ly server.
		 * 
		 */ 
		public static const PUBLIC_TIMELINE_URL : String = "api/twitter/statuses/public_timeline.xml";
		
		/**
		 * 
		 * Defines the service URI for requesting a specific user's timeline from the Present.ly server.
		 * 
		 */ 
		public static const USER_TIMELINE_URL : String = "api/twitter/statuses/user_timeline.xml";
		
		/**
		 * 
		 * Defines the service URI for requesting the friends timeline from the Present.ly server.
		 * 
		 */ 
		public static const FRIENDS_TIMELINE_URL : String = "api/twitter/statuses/friends_timeline.xml";
		
		/**
		 *
		 * Defines the service URI for sending text messages to the Present.ly server.
		 *  
		 */ 
		public static const SEND_UPDATE_URL : String = "api/twitter/statuses/update.xml";
		
		/**
		 *
		 * Defines the service URI for requesting replies from the Present.ly server.
		 *  
		 */ 
		public static const REPLIES_URL : String = "api/twitter/statuses/replies.xml";
		
		/**
		 * 
		 * Defines the service URI for requesting direct messages from the Present.ly server.
		 * 
		 */ 
		public static const DIRECT_MESSAGES_URL : String = "api/twitter/direct_messages.xml";
		
		/**
		 * 
		 * Defines the service URI for requesting the current user's friends from the Present.ly server.
		 * 
		 */ 
		public static const FRIENDS_URL : String = "api/twitter/statuses/friends.xml";
		
		/**
		 * 
		 * Defines the service URI for requesting the current user's followers from the Present.ly server.
		 * 
		 */ 
		public static const FOLLOWERS_URL : String = "api/twitter/statuses/followers.xml";
		
		/**
		 * 
		 * Defines the service URI for requesting a specific user's data from the Present.ly server.
		 * 
		 */ 
		public static const SHOW_URL : String = "api/twitter/users/show.xml";
		 
		/**
		 * 
		 * Provides a static reference to the various URI patterns used by the application.
		 * 
		 */
		public function ServiceConfigurations()
		{
		}
	}
}