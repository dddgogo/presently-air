/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.events
{
	
	import com.intridea.presentlyAIRClient.events.SetDirectMessagesNotificationsPrefEvent;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class SetDirectMessagesNotificationsPrefEventTest extends TestCase implements IEventTest
	{
			
		/**
	     *
	     */
		public function SetDirectMessagesNotificationsPrefEventTest( methodName : String = null )
		{	
			super( methodName );
		}
		
        /**
	     *
	     */
		public function testEventType() : void
		{	
			var event : SetDirectMessagesNotificationsPrefEvent = new SetDirectMessagesNotificationsPrefEvent( SetDirectMessagesNotificationsPrefEvent.EVENT );
			var expected : String = SetDirectMessagesNotificationsPrefEvent.EVENT;
			assertEquals( expected, event.type );
		}
	}
}