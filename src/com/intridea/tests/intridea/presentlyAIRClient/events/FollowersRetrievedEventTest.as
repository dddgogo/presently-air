/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.events
{
	
	import com.intridea.presentlyAIRClient.events.FollowersRetrievedEvent;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class FollowersRetrievedEventTest extends TestCase implements IEventTest
	{
		
		/**
	     *
	     */
		public function FollowersRetrievedEventTest( methodName : String = null )
		{	
			super( methodName );
		}
		
        /**
	     *
	     */
		public function testEventType() : void
		{	
			var event : FollowersRetrievedEvent = new FollowersRetrievedEvent( FollowersRetrievedEvent.EVENT );
			var expected : String = FollowersRetrievedEvent.EVENT;
			assertEquals( expected, event.type );
		}
	}
}