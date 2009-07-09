/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.events
{
	
	import com.intridea.presentlyAIRClient.events.SetRememberLoginInfoPreferenceEvent;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class SetRememberLoginInfoPreferenceEventTest extends TestCase implements IEventTest
	{
			
		/**
	     *
	     */
		public function SetRememberLoginInfoPreferenceEventTest( methodName : String = null )
		{	
			super( methodName );
		}
		
        /**
	     *
	     */
		public function testEventType() : void
		{	
			var event : SetRememberLoginInfoPreferenceEvent = new SetRememberLoginInfoPreferenceEvent( SetRememberLoginInfoPreferenceEvent.EVENT );
			var expected : String = SetRememberLoginInfoPreferenceEvent.EVENT;
			assertEquals( expected, event.type );
		}
	}
}