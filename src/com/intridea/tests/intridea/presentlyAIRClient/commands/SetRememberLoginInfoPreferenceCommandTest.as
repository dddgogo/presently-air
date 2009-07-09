/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.commands
{
	import com.intridea.presentlyAIRClient.commands.SetRememberLoginInfoPreferenceCommand;
	import com.intridea.presentlyAIRClient.events.SetRememberLoginInfoPreferenceEvent;
	import com.intridea.presentlyAIRClient.model.ModelLocator;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class SetRememberLoginInfoPreferenceCommandTest extends TestCase
	{
		/**
		 * 
		 */
		public static const CALL_TIMEOUT : int = 3000;
		
		/**
		 * 
		 */
		private var testingTimer : Timer;
		
		/**
		 * 
		 */
		private var event : SetRememberLoginInfoPreferenceEvent;
		 
		/**
		 * 
		 */
		private var command : SetRememberLoginInfoPreferenceCommand;
		
		/**
		 * 
		 */
		private var rememberLoginInfoPreferenceEventProperty : Boolean;
		
		/**
		 * 
		 */
		private var model : ModelLocator;
		
		/**
	     *
	     */
		public function SetRememberLoginInfoPreferenceCommandTest( methodName : String = null )
		{	
			super( methodName );
		}
		
		/**
		 * 
		 */
		override public function setUp() : void
		{
			rememberLoginInfoPreferenceEventProperty = true;
			
			model = ModelLocator.instance;
			event = new SetRememberLoginInfoPreferenceEvent();
			command = new SetRememberLoginInfoPreferenceCommand();
			
		}
		
		/**
		 * 
		 */
		override public function tearDown() : void
		{
			model = null;
			event = null;
			command = null;	
		}
		
		/**
		 * 
		 */
		public function testExecute() : void
		{
			testingTimer = new Timer( CALL_TIMEOUT, 1 );
        	testingTimer.addEventListener( TimerEvent.TIMER_COMPLETE, addAsync( verifyExecute, CALL_TIMEOUT ) );
        	
        	event.rememberLoginInfo = rememberLoginInfoPreferenceEventProperty;
			command.execute( event );
        	
        	testingTimer.start();
		}
		
		/**
		 * 
		 */
		private function verifyExecute( event : TimerEvent ) : void
		{
			assertTrue( model.rememberLoginInfo );
		}
	}
}