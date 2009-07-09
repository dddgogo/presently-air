/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.events
{
	
	import com.intridea.presentlyAIRClient.events.SetSystemTrayPreferenceEvent;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class SetSystemTrayPreferenceEventTest extends TestCase implements IEventTest
	{
			
		/**
	     *
	     */
		public function SetSystemTrayPreferenceEventTest( methodName : String = null )
		{	
			super( methodName );
		}
		
        /**
	     *
	     */
		public function testEventType() : void
		{	
			var event : SetSystemTrayPreferenceEvent = new SetSystemTrayPreferenceEvent( SetSystemTrayPreferenceEvent.EVENT );
			var expected : String = SetSystemTrayPreferenceEvent.EVENT;
			assertEquals( expected, event.type );
		}
	}
}