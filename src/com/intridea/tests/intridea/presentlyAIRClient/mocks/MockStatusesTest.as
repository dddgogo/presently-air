/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.mocks
{
	
	import com.intridea.tests.intridea.presentlyAIRClient.mocks.MockStatuses;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class MockStatusesTest extends TestCase
	{
		/**
	     *
	     */
		private var mockStatuses : XML;
		
		/**
	     *
	     */
		public function MockStatusesTest( methodName : String = null )
		{	
			super( methodName );
		}
		
		/**
		 * 
		 */
		override public function setUp() : void
		{
			mockStatuses = MockStatuses.getMockStatuses();
		}
		
		/**
		 * 
		 */
		override public function tearDown() : void
		{
			mockStatuses = null;
		}
		
        /**
	     *
	     */
		public function testMockStatuses() : void
		{	
			assertNotNull( mockStatuses );
		}
	}
}