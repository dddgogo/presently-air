/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.events
{
	
	import com.intridea.presentlyAIRClient.events.FriendsRetrievedEvent;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class FriendsRetrievedEventTest extends TestCase implements IEventTest
	{
		
		/**
	     *
	     */
		public function FriendsRetrievedEventTest( methodName : String = null )
		{	
			super( methodName );
		}
		
        /**
	     *
	     */
		public function testEventType() : void
		{	
			var event : FriendsRetrievedEvent = new FriendsRetrievedEvent( FriendsRetrievedEvent.EVENT );
			var expected : String = FriendsRetrievedEvent.EVENT;
			assertEquals( expected, event.type );
		}
	}
}