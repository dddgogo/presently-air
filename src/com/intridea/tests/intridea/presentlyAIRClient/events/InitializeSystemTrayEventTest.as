/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.events
{
	
	import com.intridea.presentlyAIRClient.events.InitializeSystemTrayEvent;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class InitializeSystemTrayEventTest extends TestCase implements IEventTest
	{
			
		/**
	     *
	     */
		public function InitializeSystemTrayEventTest( methodName : String = null )
		{	
			super( methodName );
		}
		
        /**
	     *
	     */
		public function testEventType() : void
		{	
			var event : InitializeSystemTrayEvent = new InitializeSystemTrayEvent( InitializeSystemTrayEvent.EVENT );
			var expected : String = InitializeSystemTrayEvent.EVENT;
			assertEquals( expected, event.type );
		}
	}
}