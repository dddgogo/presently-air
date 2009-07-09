/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.events
{
	
	import com.intridea.presentlyAIRClient.events.UpdateTransparencyEvent;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class UpdateTransparencyEventTest extends TestCase implements IEventTest
	{
			
		/**
	     *
	     */
		public function UpdateTransparencyEventTest( methodName : String = null )
		{	
			super( methodName );
		}
		
        /**
	     *
	     */
		public function testEventType() : void
		{	
			var event : UpdateTransparencyEvent = new UpdateTransparencyEvent( UpdateTransparencyEvent.EVENT );
			var expected : String = UpdateTransparencyEvent.EVENT;
			assertEquals( expected, event.type );
		}
	}
}