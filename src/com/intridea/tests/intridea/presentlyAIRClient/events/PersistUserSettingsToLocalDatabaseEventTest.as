/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.events
{
	
	import com.intridea.presentlyAIRClient.events.PersistUserSettingsToLocalDatabaseEvent;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class PersistUserSettingsToLocalDatabaseEventTest extends TestCase implements IEventTest
	{
			
		/**
	     *
	     */
		public function PersistUserSettingsToLocalDatabaseEventTest( methodName : String = null )
		{	
			super( methodName );
		}
		
        /**
	     *
	     */
		public function testEventType() : void
		{	
			var event : PersistUserSettingsToLocalDatabaseEvent = new PersistUserSettingsToLocalDatabaseEvent( PersistUserSettingsToLocalDatabaseEvent.EVENT );
			var expected : String = PersistUserSettingsToLocalDatabaseEvent.EVENT;
			assertEquals( expected, event.type );
		}
	}
}