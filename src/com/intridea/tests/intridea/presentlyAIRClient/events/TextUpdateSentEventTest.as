/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.events
{
	
	import com.intridea.presentlyAIRClient.events.TextUpdateSentEvent;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class TextUpdateSentEventTest extends TestCase implements IEventTest
	{
		
		/**
	     *
	     */
		public function TextUpdateSentEventTest( methodName : String = null )
		{	
			super( methodName );
		}
		
        /**
	     *
	     */
		public function testEventType() : void
		{	
			var event : TextUpdateSentEvent = new TextUpdateSentEvent( TextUpdateSentEvent.EVENT );
			var expected : String = TextUpdateSentEvent.EVENT;
			assertEquals( expected, event.type );
		}
	}
}