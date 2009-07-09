/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.business
{
	
	import com.intridea.presentlyAIRClient.business.ServiceConfigurations;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class ServiceConfigurationsTest extends TestCase
	{
			
		/**
	     *
	     */
		public function ServiceConfigurationsTest( methodName : String = null )
		{	
			super( methodName );
		}
		
        /**
	     *
	     */
		public function testURLBase() : void
		{	
			var url : String = ServiceConfigurations.URL_BASE;
			var expected : String = "https://";
			assertEquals( expected, url );
		}

		/**
	     *
	     */
		public function testLoginURL() : void
		{	
			var url : String = ServiceConfigurations.LOGIN_URL;
			var expected : String = "api/twitter/account/verify_credentials.xml";
			assertEquals( expected, url );
		}
		
		/**
	     *
	     */
		public function testLogoutURL() : void
		{	
			var url : String = ServiceConfigurations.LOGOUT_URL;
			var expected : String = "logout";
			assertEquals( expected, url );
		}
		
		/**
	     *
	     */
		public function testPublicTimelineURL() : void
		{	
			var url : String = ServiceConfigurations.PUBLIC_TIMELINE_URL;
			var expected : String = "api/twitter/statuses/public_timeline.xml";
			assertEquals( expected, url );
		}
		
		/**
	     *
	     */
		public function testUserTimelineURL() : void
		{	
			var url : String = ServiceConfigurations.USER_TIMELINE_URL;
			var expected : String = "api/twitter/statuses/user_timeline.xml";
			assertEquals( expected, url );
		}
		
		/**
	     *
	     */
		public function testFriendsTimelineURL() : void
		{	
			var url : String = ServiceConfigurations.FRIENDS_TIMELINE_URL;
			var expected : String = "api/twitter/statuses/friends_timeline.xml";
			assertEquals( expected, url );
		}
		
		/**
	     *
	     */
		public function testSendUpdateURL() : void
		{	
			var url : String = ServiceConfigurations.SEND_UPDATE_URL;
			var expected : String = "api/twitter/statuses/update.xml";
			assertEquals( expected, url );
		}
		
		/**
	     *
	     */
		public function testRepliesURL() : void
		{	
			var url : String = ServiceConfigurations.REPLIES_URL;
			var expected : String = "api/twitter/statuses/replies.xml";
			assertEquals( expected, url );
		}
		
		/**
	     *
	     */
		public function testDirectMessagesURL() : void
		{	
			var url : String = ServiceConfigurations.DIRECT_MESSAGES_URL;
			var expected : String = "api/twitter/direct_messages.xml";
			assertEquals( expected, url );
		}
		
		/**
	     *
	     */
		public function testFriendsURL() : void
		{	
			var url : String = ServiceConfigurations.FRIENDS_URL;
			var expected : String = "api/twitter/statuses/friends.xml";
			assertEquals( expected, url );
		}
		
		/**
	     *
	     */
		public function testFollowersURL() : void
		{	
			var url : String = ServiceConfigurations.FOLLOWERS_URL;
			var expected : String = "api/twitter/statuses/followers.xml";
			assertEquals( expected, url );
		}
		
		/**
	     *
	     */
		public function testShowURL() : void
		{	
			var url : String = ServiceConfigurations.SHOW_URL;
			var expected : String = "api/twitter/users/show.xml";
			assertEquals( expected, url );
		}
	}
}