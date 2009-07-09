/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.commands
{	
	import com.intridea.presentlyAIRClient.commands.ClearCurrentLookupUserScreenNameCommand;
	import com.intridea.presentlyAIRClient.events.ClearCurrentLookupUserScreenNameEvent;
	import com.intridea.presentlyAIRClient.model.ModelLocator;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class ClearCurrentLookupUserScreenNameCommandTest extends TestCase
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
		private var event : ClearCurrentLookupUserScreenNameEvent;
		 
		/**
		 * 
		 */
		private var command : ClearCurrentLookupUserScreenNameCommand;
		
		/**
		 * 
		 */
		private var model : ModelLocator;
		
		/**
		 * 
		 */
		private var expectedCurrentLookupUserScreenName : String;
		
		/**
	     *
	     */
		public function ClearCurrentLookupUserScreenNameCommandTest( methodName : String = null )
		{	
			super( methodName );
		}
		
		/**
		 * 
		 */
		override public function setUp() : void
		{	
			expectedCurrentLookupUserScreenName = "";
			model = ModelLocator.instance;
			event = new ClearCurrentLookupUserScreenNameEvent();
			command = new ClearCurrentLookupUserScreenNameCommand();
			
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