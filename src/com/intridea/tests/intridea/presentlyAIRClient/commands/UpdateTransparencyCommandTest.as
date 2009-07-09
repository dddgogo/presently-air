/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.commands
{
	import com.intridea.presentlyAIRClient.commands.UpdateTransparencyCommand;
	import com.intridea.presentlyAIRClient.events.UpdateTransparencyEvent;
	import com.intridea.presentlyAIRClient.view.ViewUtils;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class UpdateTransparencyCommandTest extends TestCase
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
		private var event : UpdateTransparencyEvent;
		 
		/**
		 * 
		 */
		private var command : UpdateTransparencyCommand;
		
		/**
		 * 
		 */
		private var expectedTransparency : Number;
		
		/**
		 * 
		 */
		private var transparencyEventProperty : Number;
		
		/**
	     *
	     */
		public function UpdateTransparencyCommandTest( methodName : String = null )
		{	
			super( methodName );
		}
		
		/**
		 * 
		 */
		override public function setUp() : void
		{
			expectedTransparency = 0.7;
			transparencyEventProperty = 70;
			
			event = new UpdateTransparencyEvent();
			command = new UpdateTransparencyCommand();
			
		}
		
		/**
		 * 
		 */
		override public function tearDown() : void
		{
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
        	
        	event.transparency = transparencyEventProperty;
			command.execute( event );
        	
        	testingTimer.start();
		}
		
		/**
		 * 
		 */
		private function verifyExecute( event : TimerEvent ) : void
		{
			assertEquals( ViewUtils.transparency, expectedTransparency );
		}
	}
}