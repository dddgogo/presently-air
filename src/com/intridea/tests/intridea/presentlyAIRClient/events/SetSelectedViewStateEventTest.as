/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.events
{
	
	import com.intridea.presentlyAIRClient.events.SetSelectedViewStateEvent;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class SetSelectedViewStateEventTest extends TestCase implements IEventTest
	{
		
		/**
	     *
	     */
		public function SetSelectedViewStateEventTest( methodName : String = null )
		{	
			super( methodName );
		}
		
        /**
	     *
	     */
		public function testEventType() : void
		{	
			var state : int = 1;
			var event : SetSelectedViewStateEvent = new SetSelectedViewStateEvent( state );
			var expected : int = 1;
			assertEquals( expected, event.state );
		}
	}
}