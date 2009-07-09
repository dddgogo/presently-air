/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.model
{
	
	import com.intridea.presentlyAIRClient.model.ModelLocator;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class ModelLocatorTest extends TestCase
	{
		
		/**
		 * 
		 */
		private var model : ModelLocator;
		
		/**
		 * 
		 */
		private var registerURL : String;
		
		/**
		 * 
		 */
		private var databaseName : String;
		
		/**
		 * 
		 */
		private var presentlyBaseURL : String;
		
		/**
	     *
	     */
		public function ModelLocatorTest( methodName : String = null )
		{	
			super( methodName );
		}
		
		/**
		 * 
		 */
		override public function setUp() : void
		{
			model = ModelLocator.instance;
			registerURL = "https://presentlyapp.com/accounts/new";
			databaseName = "presentlyairclient.db";
			presentlyBaseURL = "presentlyapp.com";
		}
		
		/**
		 * 
		 */
		override public function tearDown() : void
		{
			model = null;
			registerURL = null;
			databaseName = null;
			presentlyBaseURL = null;
		}
		
		/**
		 * 
		 */
		public function testModel() : void
		{
			assertNotNull( model );
		}
		
		/**
		 * 
		 */
		public function testRegisterURL() : void
		{
			assertEquals( model.REGISTER_URL, registerURL );
		}
		
		/**
		 * 
		 */
		public function testDatabaseName() : void
		{
			assertEquals( model.DATABASE_NAME, databaseName );
		}
		
		/**
		 * 
		 */
		public function testStatusMessage() : void
		{
			assertNotNull( model.statusMessage );
		}
		
		/**
		 * 
		 */
		public function testCurrentUser() : void
		{
			assertNull( model.currentUser );
			assertNull( model.currentAccount );
			assertFalse( model.isAuthenticated );
			assertNotNull( model.statusesManager );
		}
		
		/**
		 * 
		 */
		public function testInitialAuthentication() : void
		{
			assertFalse( model.isAuthenticated );
		}
		
		/**
		 * 
		 */
		public function testStatusesManager() : void
		{
			assertNotNull( model.statusesManager );
		}
		
		/**
		 * 
		 */
		public function testAccount() : void
		{
			assertNull( model.currentAccount );
		}
		
		/**
		 * 
		 */
		public function testCurrentService() : void
		{
			assertNull( model.currentService );
		}
		
		/**
		 * 
		 */
		public function testFriends() : void
		{
			assertNull ( model.friends );
		}
		 
		/**
		 * 
		 */
		public function testPresentlyBaseURL() : void
		{
			assertEquals( model.presentlyBaseURL, presentlyBaseURL );
		}
		
		/**
		 * 
		 */
		public function testFollowers() : void
		{
			assertNull( model.followers );
		}
		
		/**
		 * 
		 */
		public function testCurrentLookupUserScreenName() : void
		{
			assertNull( model.currentLookupUserScreenName );
		}
		
		/**
		 * 
		 */
		public function testAutoUpdateInterval() : void
		{
			assertEquals( model.autoUpdateInterval, 0 );
		}
		
		/**
		 * 
		 */
		public function testIsMinimizeToSystemTrayEnabled() : void
		{
			assertEquals( model.isMinimizeToSystemTrayEnabled, false );
		}
		
		/**
		 * 
		 */
		public function testRememberLoginInfo() : void
		{
			assertEquals( model.rememberLoginInfo, false );
		}
		
		/**
		 * 
		 */
		public function testMainStreamNotificationsEnabled() : void
		{
			assertEquals( model.mainStreamNotificationsEnabled, false );
		}
		
		/**
		 * 
		 */
		public function testDirectMessagesNotificationsEnabled() : void
		{
			assertEquals( model.directMessagesNotificationsEnabled, false );
		}
	}
}