/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.events
{
	
	import com.intridea.presentlyAIRClient.events.SendTextUpdateEvent;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class SendTextUpdateEventTest extends TestCase implements IEventTest
	{
		
		/**
	     *
	     */
		public function SendTextUpdateEventTest( methodName : String = null )
		{	
			super( methodName );
		}
		
		/**
	     *
	     */
		public function testEventType() : void
		{	
			var event : SendTextUpdateEvent = new SendTextUpdateEvent( SendTextUpdateEvent.EVENT );
			var expected : String = SendTextUpdateEvent.EVENT;
			assertEquals( expected, event.type );
		}
	}
}