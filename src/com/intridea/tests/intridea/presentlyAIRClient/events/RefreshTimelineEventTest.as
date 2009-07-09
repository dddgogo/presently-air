/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.events
{
	
	import com.intridea.presentlyAIRClient.events.RefreshTimelineEvent;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class RefreshTimelineEventTest extends TestCase implements IEventTest
	{
			
		/**
	     *
	     */
		public function RefreshTimelineEventTest( methodName : String = null )
		{	
			super( methodName );
		}
		
        /**
	     *
	     */
		public function testEventType() : void
		{	
			var event : RefreshTimelineEvent = new RefreshTimelineEvent( RefreshTimelineEvent.EVENT );
			var expected : String = RefreshTimelineEvent.EVENT;
			assertEquals( expected, event.type );
		}
	}
}