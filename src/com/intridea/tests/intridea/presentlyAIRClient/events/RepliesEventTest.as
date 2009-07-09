/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.events
{
	
	import com.intridea.presentlyAIRClient.events.RepliesEvent;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class RepliesEventTest extends TestCase implements IEventTest
	{
		
		/**
	     *
	     */
		public function RepliesEventTest( methodName : String = null )
		{	
			super( methodName );
		}
		
        /**
	     *
	     */
		public function testEventType() : void
		{	
			var event : RepliesEvent = new RepliesEvent( RepliesEvent.EVENT );
			var expected : String = RepliesEvent.EVENT;
			assertEquals( expected, event.type );
		}
	}
}