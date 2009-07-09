/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.events
{
	
	import com.intridea.presentlyAIRClient.events.UpdateAutoRefreshEvent;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class UpdateAutoRefreshEventTest extends TestCase implements IEventTest
	{
			
		/**
	     *
	     */
		public function UpdateAutoRefreshEventTest( methodName : String = null )
		{	
			super( methodName );
		}
		
        /**
	     *
	     */
		public function testEventType() : void
		{	
			var event : UpdateAutoRefreshEvent = new UpdateAutoRefreshEvent( UpdateAutoRefreshEvent.EVENT );
			var expected : String = UpdateAutoRefreshEvent.EVENT;
			assertEquals( expected, event.type );
		}
	}
}