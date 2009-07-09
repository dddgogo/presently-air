/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.events
{
	
	import com.intridea.presentlyAIRClient.events.UserLookupStatusesUpdatedEvent;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class UserLookupStatusesUpdatedEventTest extends TestCase implements IEventTest
	{
			
		/**
	     *
	     */
		public function UserLookupStatusesUpdatedEventTest( methodName : String = null )
		{	
			super( methodName );
		}
		
        /**
	     *
	     */
		public function testEventType() : void
		{	
			var event : UserLookupStatusesUpdatedEvent = new UserLookupStatusesUpdatedEvent( UserLookupStatusesUpdatedEvent.EVENT );
			var expected : String = UserLookupStatusesUpdatedEvent.EVENT;
			assertEquals( expected, event.type );
		}
	}
}