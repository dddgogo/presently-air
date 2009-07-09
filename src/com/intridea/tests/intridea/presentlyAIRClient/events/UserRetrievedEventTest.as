/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.events
{
	
	import com.intridea.presentlyAIRClient.events.UserRetrievedEvent;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class UserRetrievedEventTest extends TestCase implements IEventTest
	{
			
		/**
	     *
	     */
		public function UserRetrievedEventTest( methodName : String = null )
		{	
			super( methodName );
		}
		
        /**
	     *
	     */
		public function testEventType() : void
		{	
			var event : UserRetrievedEvent = new UserRetrievedEvent( UserRetrievedEvent.EVENT );
			var expected : String = UserRetrievedEvent.EVENT;
			assertEquals( expected, event.type );
		}
	}
}