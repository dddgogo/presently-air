/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.events
{
	
	import com.intridea.presentlyAIRClient.events.FriendsEvent;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class FriendsEventTest extends TestCase implements IEventTest
	{
		
		/**
	     *
	     */
		public function FriendsEventTest( methodName : String = null )
		{	
			super( methodName );
		}
		
        /**
	     *
	     */
		public function testEventType() : void
		{	
			var event : FriendsEvent = new FriendsEvent( FriendsEvent.EVENT );
			var expected : String = FriendsEvent.EVENT;
			assertEquals( expected, event.type );
		}
	}
}