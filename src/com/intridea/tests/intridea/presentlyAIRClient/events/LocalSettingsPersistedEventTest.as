/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.events
{
	
	import com.intridea.presentlyAIRClient.events.LocalSettingsPersistedEvent;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class LocalSettingsPersistedEventTest extends TestCase implements IEventTest
	{
			
		/**
	     *
	     */
		public function LocalSettingsPersistedEventTest( methodName : String = null )
		{	
			super( methodName );
		}
		
        /**
	     *
	     */
		public function testEventType() : void
		{	
			var event : LocalSettingsPersistedEvent = new LocalSettingsPersistedEvent( LocalSettingsPersistedEvent.EVENT );
			var expected : String = LocalSettingsPersistedEvent.EVENT;
			assertEquals( expected, event.type );
		}
	}
}