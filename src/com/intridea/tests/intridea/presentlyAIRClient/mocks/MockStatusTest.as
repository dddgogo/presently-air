/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.mocks
{
	
	import com.intridea.tests.intridea.presentlyAIRClient.mocks.MockStatus;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class MockStatusTest extends TestCase
	{
		/**
	     *
	     */
		private var mockStatus : XML;
		
		/**
	     *
	     */
		public function MockStatusTest( methodName : String = null )
		{	
			super( methodName );
		}
		
		/**
		 * 
		 */
		override public function setUp() : void
		{
			mockStatus = MockStatus.getMockStatus();
		}
		
		/**
		 * 
		 */
		override public function tearDown() : void
		{
			mockStatus = null;
		}
		
        /**
	     *
	     */
		public function testMockStatus() : void
		{	
			assertNotNull( mockStatus );
		}
	}
}