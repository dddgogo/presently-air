/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.events
{
	
	import com.intridea.presentlyAIRClient.events.DirectMessagesEvent;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class DirectMessagesEventTest extends TestCase implements IEventTest
	{
			
		/**
	     *
	     */
		public function DirectMessagesEventTest( methodName : String = null )
		{	
			super( methodName );
		}
		
        /**
	     *
	     */
		public function testEventType() : void
		{	
			var event : DirectMessagesEvent = new DirectMessagesEvent( DirectMessagesEvent.EVENT );
			var expected : String = DirectMessagesEvent.EVENT;
			assertEquals( expected, event.type );
		}
	}
}