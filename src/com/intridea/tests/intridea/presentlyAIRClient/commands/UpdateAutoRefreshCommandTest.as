/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.commands
{
	import com.intridea.presentlyAIRClient.commands.UpdateAutoRefreshCommand;
	import com.intridea.presentlyAIRClient.events.UpdateAutoRefreshEvent;
	import com.intridea.presentlyAIRClient.model.ModelLocator;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class UpdateAutoRefreshCommandTest extends TestCase
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
		private var event : UpdateAutoRefreshEvent;
		 
		/**
		 * 
		 */
		private var command : UpdateAutoRefreshCommand;
		
		/**
		 * 
		 */
		private var expectedAutoRefresh : Number;
		
		/**
		 * 
		 */
		private var autoRefreshEventProperty : Number;
		
		/**
		 * 
		 */
		private var model : ModelLocator;
		
		/**
	     *
	     */
		public function UpdateAutoRefreshCommandTest( methodName : String = null )
		{	
			super( methodName );
		}
		
		/**
		 * 
		 */
		override public function setUp() : void
		{
			expectedAutoRefresh = 500000;
			autoRefreshEventProperty = 5;
			
			model = ModelLocator.instance;
			event = new UpdateAutoRefreshEvent();
			command = new UpdateAutoRefreshCommand();
			
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
        	
        	event.interval = autoRefreshEventProperty;
			command.execute( event );
        	
        	testingTimer.start();
		}
		
		/**
		 * 
		 */
		private function verifyExecute( event : TimerEvent ) : void
		{
			assertEquals( model.autoUpdateInterval, expectedAutoRefresh  );
		}
	}
}