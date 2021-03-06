/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.events
{
	
	import com.intridea.presentlyAIRClient.events.FriendsTimelineEvent;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class FriendsTimelineEventTest extends TestCase implements IEventTest
	{		
		/**
	     *
	     */
		public function FriendsTimelineEventTest( methodName : String = null )
		{	
			super( methodName );
		}
		
		/**
	     *
	     */
		public function testEventType() : void
		{	
			var event : FriendsTimelineEvent = new FriendsTimelineEvent( FriendsTimelineEvent.EVENT );
			var expected : String = FriendsTimelineEvent.EVENT;
			assertEquals( expected, event.type );
		}
	}
}