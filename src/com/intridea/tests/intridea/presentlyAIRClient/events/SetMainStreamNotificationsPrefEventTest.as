/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.events
{
	
	import com.intridea.presentlyAIRClient.events.SetMainStreamNotificationsPrefEvent;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class SetMainStreamNotificationsPrefEventTest extends TestCase implements IEventTest
	{
			
		/**
	     *
	     */
		public function SetMainStreamNotificationsPrefEventTest( methodName : String = null )
		{	
			super( methodName );
		}
		
        /**
	     *
	     */
		public function testEventType() : void
		{	
			var event : SetMainStreamNotificationsPrefEvent = new SetMainStreamNotificationsPrefEvent( SetMainStreamNotificationsPrefEvent.EVENT );
			var expected : String = SetMainStreamNotificationsPrefEvent.EVENT;
			assertEquals( expected, event.type );
		}
	}
}