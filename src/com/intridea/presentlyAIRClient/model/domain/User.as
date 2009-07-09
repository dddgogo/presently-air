/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.presentlyAIRClient.model.domain
{
	[Bindable]
	/**
	 * 
	 * Provides storage and access to user related information.
	 * 
	 */
	public final class User
	{
		/**
		 *
		 * System generated ID, used for various service calls.
		 *  
		 */
		public var ID : String
		
		/**
		 * 
		 * Used to display the user's name in the view.
		 * 
		 */
		public var name : String;
		
		/**
		 * 
		 * Used to display the user's screen name in the view. Also used for various service 
		 * calls including authentication.
		 * 
		 */
		public var screenName : String;
		
		/**
		 * 
		 * Provided by the Present.ly server but not used in the application at this time.
		 * 
		 */
		public var location : String;
		
		/**
		 * 
		 * Used to display the user's description in the view.
		 * 
		 */
		public var description : String;
		
		/**
		 * 
		 * Used to display the user's URL in the view.
		 * 
		 */
		public var URL : String;
		
		/**
		 * 
		 * Provided by the Present.ly server however not used in the application at this time.
		 * 
		 */
		public var isProtected : Boolean;
		
		/**
		 * 
		 * Used to display the number of users following this <code>User</code> in the view.
		 * 
		 */
		public var followersCount : int;
		
		/**
		 * 
		 * The user's profile related information.
		 * 
		 * @see com.intridea.presentlyAIRClient.model.domain.Profile
		 * 
		 */
		public var profile : Profile = new Profile();
		
		/**
		 * 
		 * Used to display the number of users friend for this <code>User</code> in the view.
		 * 
		 */
		public var friendsCount : int;
		
		/**
		 * 
		 * Used to display the the timestamp of the user's creation date with the system.
		 * 
		 */
		public var createdAt : String
		
		/**
		 * 
		 * Used to display the user's time zone in the view.
		 * 
		 */
		public var timeZone : String;
		
		/**
		 * 
		 * Used to store an <code>Array</code> of <code>User</code> instances this <code>User</code> 
		 * is currently following.
		 * 
		 */
		public var following : Boolean;
		
		/**
		 * 
		 * 
		 * 
		 */
		public var notifications : Boolean;
		
		/**
		 * 
		 * Used to display the number of statuses this <code>User</code> has posted to the Present.ly server.
		 * 
		 */
		public var statusesCount : int;
		
		/**
		 * 
		 * Used for various service calls and to display this <code>User</code> instances account 
		 * information in the view.
		 * 
		 */
		public var account : String;
		
		/**
		 * 
		 * Used for various service calls including authentication.
		 * 
		 */
		public var password : String;
		
		/**
		 * 
		 * Defines the main participant in the application. Represents the current user interacting with the application.
		 * Also used to represent user's that this <code>User</code> interacts with.
		 * 
		 */
		public function User()
		{
		}
		
		/**
		 * 
		 * Used for diagnostics, testing, debugging and trace statements.
		 * 
		 */
		public function toString() : String
		{
			return  "ID: " + ID + ", " +
					"name: " + name + ", " +
					"screenName: " + screenName + ", " +
					"location: " + location + ", " +
					"description: " + description + ", " +
					"URL: " + URL + ", " +
					"isProtected: " + isProtected + ", " +
					"followersCount: " + followersCount + ", " +
					"profile.profileImageURL: " + profile.profileImageURL + ", " +
					"profile.profileBackgroundColor: " + profile.profileBackgroundColor + ", " +
					"profile.profileTextColor: " + profile.profileTextColor + ", " +
					"profile.profileLinkColor: " + profile.profileTextColor + ", " +
					"profile.profileSidebarFillColor: " + profile.profileSidebarFillColor + ", " +
					"profile.profileSidebarBorderColor: " + profile.profileSidebarBorderColor + ", " +
					"friendsCount: " + friendsCount + ", " +
					"createdAt: " + createdAt + ", " +
					"timeZone: " + timeZone + ", " +
					"following: " + following + ", " +
					"notifications: " + notifications + ", " +
					"statusesCount: " + statusesCount;
		}
	}
}