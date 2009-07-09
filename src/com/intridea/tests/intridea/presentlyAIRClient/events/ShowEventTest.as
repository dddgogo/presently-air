/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.events
{
	
	import com.intridea.presentlyAIRClient.events.ShowEvent;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class ShowEventTest extends TestCase implements IEventTest
	{
				
		/**
	     *
	     */
		public function ShowEventTest( methodName : String = null )
		{	
			super( methodName );
		}
		
        /**
	     *
	     */
		public function testEventType() : void
		{	
			var event : ShowEvent = new ShowEvent( ShowEvent.EVENT );
			var expected : String = ShowEvent.EVENT;
			assertEquals( expected, event.type );
		}
	}
}