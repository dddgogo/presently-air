/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.events
{
	
	import com.intridea.presentlyAIRClient.events.StatusesUpdatedEvent;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class StatusesUpdatedEventTest extends TestCase implements IEventTest
	{
		
		/**
	     *
	     */
		public function StatusesUpdatedEventTest( methodName : String = null )
		{	
			super( methodName );
		}
		
        /**
	     *
	     */
		public function testEventType() : void
		{	
			var event : StatusesUpdatedEvent = new StatusesUpdatedEvent( StatusesUpdatedEvent.EVENT );
			var expected : String = StatusesUpdatedEvent.EVENT;
			assertEquals( expected, event.type );
		}
	}
}