/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.commands
{
	import com.intridea.presentlyAIRClient.commands.SetCurrentLookupUserScreenNameCommand;
	import com.intridea.presentlyAIRClient.events.SetCurrentLookupUserScreenNameEvent;
	import com.intridea.presentlyAIRClient.model.ModelLocator;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class SetCurrentLookupUserScreenNameCommandTest extends TestCase
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
		private var event : SetCurrentLookupUserScreenNameEvent;
		 
		/**
		 * 
		 */
		private var command : SetCurrentLookupUserScreenNameCommand;
		
		/**
		 * 
		 */
		private var currentLookupUserScreenNameEventProperty : String;
		
		/**
		 * 
		 */
		private var expectedCurrentLookupUserScreenName : String;
		
		/**
		 * 
		 */
		private var model : ModelLocator;
		
		/**
	     *
	     */
		public function SetCurrentLookupUserScreenNameCommandTest( methodName : String = null )
		{	
			super( methodName );
		}
		
		/**
		 * 
		 */
		override public function setUp() : void
		{
			currentLookupUserScreenNameEventProperty = "info";
			expectedCurrentLookupUserScreenName = "info";
			
			model = ModelLocator.instance;
			event = new SetCurrentLookupUserScreenNameEvent();
			command = new SetCurrentLookupUserScreenNameCommand();
			
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
        	
        	event.screenName = currentLookupUserScreenNameEventProperty;
			command.execute( event );
        	
        	testingTimer.start();
		}
		
		/**
		 * 
		 */
		private function verifyExecute( event : TimerEvent ) : void
		{
			assertEquals( model.currentLookupUserScreenName, expectedCurrentLookupUserScreenName );
		}
	}
}