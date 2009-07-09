/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.events
{
	
	import com.intridea.presentlyAIRClient.events.CheckDatabaseForUserSettingsEvent;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class CheckDatabaseForUserSettingsEventTest extends TestCase implements IEventTest
	{
			
		/**
	     *
	     */
		public function CheckDatabaseForUserSettingsEventTest( methodName : String = null )
		{	
			super( methodName );
		}
		
        /**
	     *
	     */
		public function testEventType() : void
		{	
			var event : CheckDatabaseForUserSettingsEvent = new CheckDatabaseForUserSettingsEvent( CheckDatabaseForUserSettingsEvent.EVENT );
			var expected : String = CheckDatabaseForUserSettingsEvent.EVENT;
			assertEquals( expected, event.type );
		}
	}
}