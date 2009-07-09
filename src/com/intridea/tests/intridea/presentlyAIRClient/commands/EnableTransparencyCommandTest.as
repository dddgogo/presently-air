/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.commands
{
	import com.intridea.presentlyAIRClient.commands.EnableTransparencyCommand;
	import com.intridea.presentlyAIRClient.events.EnableTransparencyEvent;
	import com.intridea.presentlyAIRClient.view.ViewUtils;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class EnableTransparencyCommandTest extends TestCase
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
		private var event : EnableTransparencyEvent;
		 
		/**
		 * 
		 */
		private var command : EnableTransparencyCommand;
		
		/**
		 * 
		 */
		private var enableTransparencyEventProperty : Boolean;
		
		/**
	     *
	     */
		public function EnableTransparencyCommandTest( methodName : String = null )
		{	
			super( methodName );
		}
		
		/**
		 * 
		 */
		override public function setUp() : void
		{
			enableTransparencyEventProperty = true;
			
			event = new EnableTransparencyEvent();
			command = new EnableTransparencyCommand();
			
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
        	
        	event.isEnabled = enableTransparencyEventProperty;
			command.execute( event );
        	
        	testingTimer.start();
		}
		
		/**
		 * 
		 */
		private function verifyExecute( event : TimerEvent ) : void
		{
			assertTrue( ViewUtils.isTransparencyEnabled );
		}
	}
}