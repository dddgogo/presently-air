/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.events
{
	
	import com.intridea.presentlyAIRClient.events.ClearCurrentLookupUserScreenNameEvent;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class ClearCurrentLookupUserScreenNameEventTest extends TestCase implements IEventTest
	{
			
		/**
	     *
	     */
		public function ClearCurrentLookupUserScreenNameEventTest( methodName : String = null )
		{	
			super( methodName );
		}
		
        /**
	     *
	     */
		public function testEventType() : void
		{	
			var event : ClearCurrentLookupUserScreenNameEvent = new ClearCurrentLookupUserScreenNameEvent( ClearCurrentLookupUserScreenNameEvent.EVENT );
			var expected : String = ClearCurrentLookupUserScreenNameEvent.EVENT;
			assertEquals( expected, event.type );
		}
	}
}