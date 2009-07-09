/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.utils
{
	import com.intridea.presentlyAIRClient.model.domain.User;
	import com.intridea.presentlyAIRClient.utils.UserManager;
	import com.intridea.tests.intridea.presentlyAIRClient.mocks.MockUser;
	import com.intridea.tests.intridea.presentlyAIRClient.mocks.MockUsers;
	
	import flash.xml.XMLDocument;
	
	import flexunit.framework.TestCase;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.xml.SimpleXMLDecoder;
	
	/**
     *
     */
	public final class UserManagerTest extends TestCase
	{	
		
		/**
	     *
	     */
		private var mockUser : XML;
		
		/**
	     *
	     */
		private var mockUsers : XML;
		
		/**
	     *
	     */
		public function UserManagerTest( methodName : String = null )
		{	
			super( methodName );
		}
		
		/**
		 * 
		 */
		override public function setUp() : void
		{
			mockUser = MockUser.getMockUser();
			mockUsers = MockUsers.getMockUsers();
		}
		
		/**
		 * 
		 */
		override public function tearDown() : void
		{
			mockUser = null;
			mockUsers = null;
		}
		
		/**
		 * 
		 */
		private function convertUserXmlToArray( file : String ) : Array 
		{
			var xml : XMLDocument = new XMLDocument( file );
			var decoder : SimpleXMLDecoder = new SimpleXMLDecoder();
			var data : Object = decoder.decodeXML( xml );
			return new ArrayCollection( data.users.user ).source;  
		}
		
		/**
		 * 
		 */
		public function testConvertXmlToArrayCollection() : void
		{
			var array : Array = convertUserXmlToArray( mockUsers );
			assertNotNull( array );
			var length : int = array.length;
			// make sure something is in the array
			assertTrue( length > 0 );
		}
		
		/**
		 * 
		 */
		public function testSerializeRawUserArray() : void
		{
			var mockUsersArray : Array = convertUserXmlToArray( mockUsers );
			var users : Array = UserManager.serializeRawUserArray( mockUsersArray );			
			assertNotNull( users );
			
			var expectedUserCount : int = 2;
			assertEquals( expectedUserCount, users.length );
		}
		
		/**
		 * 
		 */
		public function testSerializedID() : void		
		{		
			var user : User = UserManager.serialize( mockUser );
			var expectedID : String = "6022";			
			assertEquals( expectedID, user.ID );
		}
		
		/**
		 * 
		 */
		public function testSerializedName() : void		
		{
			var user : User = UserManager.serialize( mockUser );
			var expectedName : String = "Sean Moore";
			assertEquals( expectedName, user.name );
		}
		
		/**
		 * 
		 */
		public function testSerializedScreenName() : void		
		{
			var user : User = UserManager.serialize( mockUser );
			var expectedScreenName : String = "sean";
			assertEquals( expectedScreenName, user.screenName );
		}
		
		/**
		 * 
		 */
		public function testSerializedLocation() : void		
		{
			var user : User = UserManager.serialize( mockUser );
			var expectedLocation : String = "San Diego";
			assertEquals( expectedLocation, user.location );
		}
		
		/**
		 * 
		 */
		public function testSerializedDescription() : void		
		{
			var user : User = UserManager.serialize( mockUser );
			var expectedDescription : String = "Senior Flex Developer";
			assertEquals( expectedDescription, user.description );
		}
		
		/**
		 * 
		 */
		public function testSerializedFollowersCount() : void		
		{
			var user : User = UserManager.serialize( mockUser );
			var expectedFollowersCount : int = 1;
			assertEquals( expectedFollowersCount, user.followersCount );
		}
		
		/**
		 * 
		 */
		public function testSerializedIsProtected() : void		
		{
			var user : User = UserManager.serialize( mockUser );
			assertFalse( user.isProtected );
		}
		
		/**
		 * 
		 */
		public function testSerializedFriendsCount() : void		
		{
			var user : User = UserManager.serialize( mockUser );
			var expectedFriendsCount : int = 1;
			assertEquals( expectedFriendsCount, user.friendsCount );
		}
		
		/**
		 * 
		 */
		public function testSerializedCreatedAt() : void		
		{
			var user : User = UserManager.serialize( mockUser );
			var expectedCreatedAt : String = "Mon Apr 06 08:22:33 -0700 2009";
			assertEquals( expectedCreatedAt, user.createdAt );
		}

		/**
		 * 
		 */
		public function testSerializedExpectedTimeZone() : void		
		{
			var user : User = UserManager.serialize( mockUser );
			var expectedTimeZone : String = "Pacific Time (US & Canada)";
			assertEquals( expectedTimeZone, user.timeZone );
		}
		
		/**
		 * 
		 */
		public function testSerializedIsFollowing() : void		
		{
			var user : User = UserManager.serialize( mockUser );
			assertTrue( user.following );
		}
		
		/**
		 * 
		 */
		public function testSerializedNotifications() : void		
		{
			var user : User = UserManager.serialize( mockUser );
			assertFalse( user.notifications );
		}
		
		/**
		 * 
		 */
		public function testSerializedStatusesCount() : void		
		{
			var user : User = UserManager.serialize( mockUser );
			var expectedStatusesCount : int = 49;
			assertEquals( expectedStatusesCount, user.statusesCount );
		}
		
		/**
		 * 
		 */
		public function testSerializedProfileURL() : void		
		{
			var user : User = UserManager.serialize( mockUser );
			var expectedProfileURL : String = "http://s3.amazonaws.com/intridea-presently-production/kannopy/avatars/users/sean/small.png";
			assertEquals( expectedProfileURL, user.profile.profileImageURL );
		}
		
		/**
		 * 
		 */
		public function testSerializedProfileImageURL() : void		
		{
			var user : User = UserManager.serialize( mockUser );
			var expectedProfileImageURL : String = "http://s3.amazonaws.com/intridea-presently-production/kannopy/avatars/users/sean/small.png";
			assertEquals( expectedProfileImageURL, user.profile.profileImageURL );
		}
		
		/**
		 * 
		 */
		public function testSerializedProfileBackgroundColor() : void		
		{
			var user : User = UserManager.serialize( mockUser );
			var expectedProfileBackgroundColor : String = "94CBF0";
			assertEquals( expectedProfileBackgroundColor, user.profile.profileBackgroundColor );
		}
		
		/**
		 * 
		 */
		public function testSerializedProfileTextColor() : void		
		{
			var user : User = UserManager.serialize( mockUser );
			var expectedProfileTextColor : String = "000000";
			assertEquals( expectedProfileTextColor, user.profile.profileTextColor );
		}
		
		/**
		 * 
		 */
		public function testSerializedProfileLinkColor() : void		
		{
			var user : User = UserManager.serialize( mockUser );
			var expectedProfileLinkColor : String = "22608A";
			assertEquals( expectedProfileLinkColor, user.profile.profileLinkColor );
		}
		
		/**
		 * 
		 */
		public function testSerializedProfileSidebarFillColor() : void		
		{
			var user : User = UserManager.serialize( mockUser );
			var expectedProfileSidebarFillColor : String = "FFF18C";
			assertEquals( expectedProfileSidebarFillColor, user.profile.profileSidebarFillColor );
		}
		
		/**
		 * 
		 */
		public function testSerializedProfileSidebarBorderColor() : void		
		{
			var user : User = UserManager.serialize( mockUser );
			var expectedProfileSidebarBorderColor : String = "5D5D5D";
			assertEquals( expectedProfileSidebarBorderColor, user.profile.profileSidebarBorderColor );
		}		
		
	}
}