package com.intridea.presentlyAIRClient.model.domain
{
	[Bindable]
	public final class Profile
	{
		/**
		 * 
		 * Used to display the user's avatar image in the view.
		 * 
		 */
		public var profileImageURL : String;
		
		/**
		 * 
		 * Provided by the server but not used in the application at this time.
		 * 
		 */
		public var profileBackgroundColor : String;
		
		/**
		 *
		 * Provided by the server but not used in the application at this time.
		 *  
		 */
		public var profileTextColor : String;
		
		/**
		 * 
		 * Provided by the server but not used in the application at this time.
		 * 
		 */
		public var profileLinkColor : String;
		
		/**
		 *
		 * Provided by the server but not used in the application at this time. 
		 *  
		 */
		public var profileSidebarFillColor : String;
		
		/**
		 * 
		 * Provided by the server but not used in the application at this time.
		 * 
		 */
		public var profileSidebarBorderColor : String;
		
		/**
		 * 
		 * Provides access and storage for the user's profile related information 
		 * returned from the Present.ly server.
		 * 
		 */
		public function Profile()
		{
		}

	}
}