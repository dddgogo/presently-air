/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.events
{
	
	import com.intridea.presentlyAIRClient.events.CreateUserSettingsDatabaseEvent;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class CreateUserSettingsDatabaseEventTest extends TestCase implements IEventTest
	{
			
		/**
	     *
	     */
		public function CreateUserSettingsDatabaseEventTest( methodName : String = null )
		{	
			super( methodName );
		}
		
        /**
	     *
	     */
		public function testEventType() : void
		{	
			var event : CreateUserSettingsDatabaseEvent = new CreateUserSettingsDatabaseEvent( CreateUserSettingsDatabaseEvent.EVENT );
			var expected : String = CreateUserSettingsDatabaseEvent.EVENT;
			assertEquals( expected, event.type );
		}
	}
}