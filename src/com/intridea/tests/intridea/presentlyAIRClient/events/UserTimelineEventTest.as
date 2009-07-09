/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.events
{
	
	import com.intridea.presentlyAIRClient.events.UserTimelineEvent;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class UserTimelineEventTest extends TestCase implements IEventTest
	{
		
		/**
	     *
	     */
		public function UserTimelineEventTest( methodName : String = null )
		{	
			super( methodName );
		}
		
        /**
	     *
	     */
		public function testEventType() : void
		{	
			var event : UserTimelineEvent = new UserTimelineEvent( UserTimelineEvent.EVENT );
			var expected : String = UserTimelineEvent.EVENT;
			assertEquals( expected, event.type );
		}
	}
}