/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.events
{
	
	import com.intridea.presentlyAIRClient.events.InitializeAutoUpdateIntervalEvent;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class InitializeAutoUpdateIntervalEventTest extends TestCase implements IEventTest
	{
			
		/**
	     *
	     */
		public function InitializeAutoUpdateIntervalEventTest( methodName : String = null )
		{	
			super( methodName );
		}
		
        /**
	     *
	     */
		public function testEventType() : void
		{	
			var event : InitializeAutoUpdateIntervalEvent = new InitializeAutoUpdateIntervalEvent( InitializeAutoUpdateIntervalEvent.EVENT );
			var expected : String = InitializeAutoUpdateIntervalEvent.EVENT;
			assertEquals( expected, event.type );
		}
	}
}