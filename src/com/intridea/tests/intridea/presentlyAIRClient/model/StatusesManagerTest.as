/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.model
{
	
	import com.intridea.presentlyAIRClient.utils.StatusesManager;
	import com.intridea.presentlyAIRClient.vo.Status;
	import com.intridea.tests.intridea.presentlyAIRClient.mocks.MockStatus;
	import com.intridea.tests.intridea.presentlyAIRClient.mocks.MockStatuses;
	
	import flash.xml.XMLDocument;
	
	import flexunit.framework.TestCase;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.xml.SimpleXMLDecoder;

	/**
     *
     */
	public final class StatusesManagerTest extends TestCase
	{	
		/**
	     *
	     */
		private var mockStatus : XML;
		
		/**
	     *
	     */
		private var mockStatuses : XML;
		
		/**
	     *
	     */
		private var manager : StatusesManager;
		
		/**
		 * 
		 */
		private var expectedStatusID : String;
		
		/**
		 * 
		 */
		private var expectedStatusText : String;
		
		/**
		 * 
		 */
		private var expectedStatusSource : String;
		
		/**
		 * 
		 */
		private var expectedStatusTruncated : Boolean;
		
		/**
		 * 
		 */
		private var expectedStatusInReplyToStatusID : String;
		
		/**
		 * 
		 */
		private var expectedInReplyToUserID : String;
		
		/**
		 * 
		 */
		private var expectedFavorited : Boolean;
 
		
		/**
	     *
	     */
		public function StatusesManagerTest( methodName : String = null )
		{	
			super( methodName );
		}
		
		/**
		 * 
		 */
		override public function setUp() : void
		{
			mockStatus = MockStatus.getMockStatus();
			mockStatuses = MockStatuses.getMockStatuses();
			manager = new StatusesManager();

			expectedStatusID = "181324";
			expectedStatusText = "another message test...";
			expectedStatusSource = "web";
			expectedStatusTruncated = true; 
			expectedInReplyToUserID = "";
			expectedFavorited = true;
			
		}
		
		/**
		 * 
		 */
		override public function tearDown() : void
		{
			mockStatus = null;
			mockStatuses = null;
			manager = null;
			
			expectedStatusID = null;
			expectedStatusText = null;
			expectedStatusSource = null;
			expectedStatusInReplyToStatusID = null;
			expectedInReplyToUserID = null;
		}
		
		/**
		 * 
		 */
		public function testStatusesManagerCreation() : void
		{
			assertNotNull(  "manager", manager );
		}
		
		/**
		 * 
		 */
		public function testAddAndGetStatuses() : void
		{
			var statusesArray : Array = convertXmlToArray( mockStatuses );
			manager.addStatuses( statusesArray );			
			var statuses : Array = manager.getStatuses();
			assertNotNull( statuses );
			assertEquals( statuses.length, 3 );
		}
		
		/**
		 * 
		 */
		public function testSerialize() : void
		{
			var status : Status = manager.serialize( mockStatus );			
			assertNotNull( status );
			assertEquals( status.ID, expectedStatusID );
			assertEquals( status.text, expectedStatusText );
			assertEquals( status.source, expectedStatusSource );
			
			
			assertEquals( status.truncated, expectedStatusTruncated );
			assertEquals( status.inReplyToStatusID, "" ); 
			assertEquals( status.inReplyToUserID, expectedInReplyToUserID );
			assertEquals( status.favorited, expectedFavorited );
		}
		
		/**
		 * 
		 */
		public function testGetStatus() : void
		{
			var statusesArray : Array = convertXmlToArray( mockStatuses );
			manager.addStatuses( statusesArray );
			var status : Status = manager.serialize( mockStatus );
			var statusFromGetMethod : Status = manager.getStatus( status );			
			assertNotNull( statusFromGetMethod );
			assertEquals( statusFromGetMethod.ID, expectedStatusID );
			assertEquals( statusFromGetMethod.text, expectedStatusText );
			assertEquals( statusFromGetMethod.source, expectedStatusSource );
			
			
			assertEquals( statusFromGetMethod.truncated, false );
			assertEquals( statusFromGetMethod.inReplyToStatusID, expectedStatusInReplyToStatusID ); 
			assertEquals( statusFromGetMethod.inReplyToUserID, null );
			assertEquals( statusFromGetMethod.favorited, false );
		}
		
		/**
		 * 
		 */
		public function testConvertXmlToArrayCollection() : void
		{
			var array : Array = convertXmlToArray( mockStatuses );
			assertNotNull( array );
			var length : int = array.length;
			// make sure something is in the array
			assertTrue( length > 0 );
		}
		
		/**
		 * 
		 */
		private function convertXmlToArray( file : String ) : Array 
		{
			var xml : XMLDocument = new XMLDocument( file );
			var decoder : SimpleXMLDecoder = new SimpleXMLDecoder();
			var data : Object = decoder.decodeXML( xml );
			return new ArrayCollection( data.statuses.status ).source;
		}
	}
}