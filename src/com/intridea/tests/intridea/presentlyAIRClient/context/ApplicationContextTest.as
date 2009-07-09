/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.context
{
	
	import com.intridea.presentlyAIRClient.context.ApplicationContext;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class ApplicationContextTest extends TestCase
	{
		/**
		 * 
		 */
		private var updatedViewState : int;		
				
		/**
	     *
	     */
		public function ApplicationContextTest( methodName : String = null )
		{	
			super( methodName );
		}
		
		/**
		 * 
		 */
		override public function setUp() : void
		{			
		}
		
		/**
		 * 
		 */
		override public function tearDown() : void
		{
		}
	
		/**
	     *
	     */
		public function testInitialViewState() : void
		{	
			var expected : int = ApplicationContext.LOGIN_VIEW;
			assertEquals( expected, ApplicationContext.currentViewState );
		}
	
		/**
	     *
	     */
		public function testLoginViewState() : void
		{	
			var expected : int = 0;
			assertEquals( expected, ApplicationContext.LOGIN_VIEW );
		}
	
		/**
	     *
	     */
		public function testStatusesTimelineViewState() : void
		{	
			var expected : int = 1;
			assertEquals( expected, ApplicationContext.STATUSES_TIMELINE_VIEW );
		}
		
		/**
	     *
	     */
		public function testFriendsFollowersViewState() : void
		{	
			var expected : int = 2;
			assertEquals( expected, ApplicationContext.FRIENDS_FOLLOWERS_VIEW );
		}
	}
}