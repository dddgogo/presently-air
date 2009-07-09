/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.events
{
	
	import com.intridea.presentlyAIRClient.events.EnableTransparencyEvent;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class EnableTransparencyEventTest extends TestCase implements IEventTest
	{
			
		/**
	     *
	     */
		public function EnableTransparencyEventTest( methodName : String = null )
		{	
			super( methodName );
		}
		
        /**
	     *
	     */
		public function testEventType() : void
		{	
			var event : EnableTransparencyEvent = new EnableTransparencyEvent( EnableTransparencyEvent.EVENT );
			var expected : String = EnableTransparencyEvent.EVENT;
			assertEquals( expected, event.type );
		}
	}
}