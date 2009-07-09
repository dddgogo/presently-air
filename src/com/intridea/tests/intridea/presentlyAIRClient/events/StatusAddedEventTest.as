/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.events
{
	
	import com.intridea.presentlyAIRClient.events.StatusAddedEvent;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class StatusAddedEventTest extends TestCase implements IEventTest
	{
		
		/**
	     *
	     */
		public function StatusAddedEventTest( methodName : String = null )
		{	
			super( methodName );
		}
		
        /**
	     *
	     */
		public function testEventType() : void
		{	
			var event : StatusAddedEvent = new StatusAddedEvent( StatusAddedEvent.EVENT );
			var expected : String = StatusAddedEvent.EVENT;
			assertEquals( expected, event.type );
		}
	}
}