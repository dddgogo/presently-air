/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.events
{
	
	import com.intridea.presentlyAIRClient.events.FollowersEvent;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class FollowersEventTest extends TestCase implements IEventTest
	{
		
		/**
	     *
	     */
		public function FollowersEventTest( methodName : String = null )
		{	
			super( methodName );
		}
		
        /**
	     *
	     */
		public function testEventType() : void
		{	
			var event : FollowersEvent = new FollowersEvent( FollowersEvent.EVENT );
			var expected : String = FollowersEvent.EVENT;
			assertEquals( expected, event.type );
		}
	}
}