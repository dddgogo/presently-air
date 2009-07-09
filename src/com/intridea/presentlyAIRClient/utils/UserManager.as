/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.presentlyAIRClient.utils
{
	import com.intridea.presentlyAIRClient.model.domain.User;
	
	/**
	 * 
	 * Provides serialization methods for <code>User</code> objects. Intended to house all <code>User</code> related
	 * tasks and functionality.
	 * 
	 */
	public final class UserManager
	{
		/**
		 * 
		 * Provides serialization methods for <code>User</code> objects. Intended to house all <code>User</code> related
		 * tasks and functionality.
		 * 
		 * @see com.intridea.presentlyAIRClient.model.domain.User
		 * 
		 */
		public function UserManager()
		{
		}
		
		/**
		 * 
		 * The client side collection of binary <code>User</code> instances. 
		 * 
		 * @param rawUserArray Collection of XML based <code>User</code> objects.
		 * @return serializedUserArray The collection of binary ActionScript based <code>User</code> objects.
		 * 
		 */
		public static function serializeRawUserArray( rawUserArray : Array ) : Array
		{
			var serializedUserArray : Array = new Array();
			for ( var i:int=0;i<rawUserArray.length;i++ )
			{
				serializedUserArray.push( UserManager.serialize( rawUserArray[i] ) );	
			}
			return serializedUserArray;
		}
		
		/**
		 * 
		 * Converts an XML representation of a Present.ly user to a binary ActionScript object available for
		 * use in the Present.ly AIR Client.
		 * 
		 * @param rawUser The XML user representation returned by the Present.ly server.
		 * @return user The binary ActionScript <code>User</code> object.
		 * @see com.intridea.presentlyAIRClient.model.domain.User
		 * 
		 */
		public static function serialize( rawUser : Object ) : User
		{
			var user : User = new User();
			
			if ( !rawUser )
			{
				throw new Error( "No raw user data supplied. Empty User object being created and returned." );
			}
			else
			{
				user.ID = rawUser.id;
				user.name = rawUser.name;
				user.screenName = rawUser.screen_name;
				user.location = rawUser.location;
				user.description = rawUser.description;
				user.URL = rawUser.url;
				user.isProtected = ( rawUser.protected == "true" ) ? true : false;
				user.followersCount = rawUser.followers_count;
				user.profile.profileImageURL = rawUser.profile_image_url;
				user.profile.profileBackgroundColor = rawUser.profile_background_color;
				user.profile.profileTextColor = rawUser.profile_text_color;
				user.profile.profileLinkColor = rawUser.profile_link_color;
				user.profile.profileSidebarFillColor = rawUser.profile_sidebar_fill_color;
				user.profile.profileSidebarBorderColor = rawUser.profile_sidebar_border_color;
				user.friendsCount = rawUser.friends_count;
				user.createdAt = rawUser.created_at;
				user.timeZone = rawUser.time_zone;
				user.following = rawUser.following;
				user.notifications = ( rawUser.notifications == "true" ) ? true : false;
				user.statusesCount = rawUser.statuses_count;
			}
			
			return user;				
		}

	}
}