/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.events
{
	
	import com.intridea.presentlyAIRClient.events.DatabaseCreatedEvent;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class DatabaseCreatedEventTest extends TestCase implements IEventTest
	{
			
		/**
	     *
	     */
		public function DatabaseCreatedEventTest( methodName : String = null )
		{	
			super( methodName );
		}
		
        /**
	     *
	     */
		public function testEventType() : void
		{	
			var event : DatabaseCreatedEvent = new DatabaseCreatedEvent( DatabaseCreatedEvent.EVENT );
			var expected : String = DatabaseCreatedEvent.EVENT;
			assertEquals( expected, event.type );
		}
	}
}