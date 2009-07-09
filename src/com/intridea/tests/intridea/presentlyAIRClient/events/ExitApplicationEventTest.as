/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.events
{
	
	import com.intridea.presentlyAIRClient.events.ExitApplicationEvent;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class ExitApplicationEventTest extends TestCase implements IEventTest
	{
			
		/**
	     *
	     */
		public function ExitApplicationEventTest( methodName : String = null )
		{	
			super( methodName );
		}
		
        /**
	     *
	     */
		public function testEventType() : void
		{	
			var event : ExitApplicationEvent = new ExitApplicationEvent( ExitApplicationEvent.EVENT );
			var expected : String = ExitApplicationEvent.EVENT;
			assertEquals( expected, event.type );
		}
	}
}