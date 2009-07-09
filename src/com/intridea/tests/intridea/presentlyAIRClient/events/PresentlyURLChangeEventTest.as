/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.events
{
	
	import com.intridea.presentlyAIRClient.events.PresentlyURLChangeEvent;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class PresentlyURLChangeEventTest extends TestCase implements IEventTest
	{
			
		/**
	     *
	     */
		public function PresentlyURLChangeEventTest( methodName : String = null )
		{	
			super( methodName );
		}
		
        /**
	     *
	     */
		public function testEventType() : void
		{	
			var event : PresentlyURLChangeEvent = new PresentlyURLChangeEvent( PresentlyURLChangeEvent.EVENT );
			var expected : String = PresentlyURLChangeEvent.EVENT;
			assertEquals( expected, event.type );
		}
	}
}