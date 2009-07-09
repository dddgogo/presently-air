/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.commands
{
	import com.intridea.presentlyAIRClient.commands.PresentlyURLChangeCommand;
	import com.intridea.presentlyAIRClient.events.PresentlyURLChangeEvent;
	import com.intridea.presentlyAIRClient.model.ModelLocator;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class PresentlyURLChangeCommandTest extends TestCase
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
		private var event : PresentlyURLChangeEvent;
		 
		/**
		 * 
		 */
		private var command : PresentlyURLChangeCommand;
		
		/**
		 * 
		 */
		private var presentlyURLEventProperty : String;
		
		/**
		 * 
		 */
		private var expectedPresentlyURL : String;
		
		/**
		 * 
		 */
		private var model : ModelLocator;
		
		/**
	     *
	     */
		public function PresentlyURLChangeCommandTest( methodName : String = null )
		{	
			super( methodName );
		}
		
		/**
		 * 
		 */
		override public function setUp() : void
		{
			presentlyURLEventProperty = "presentlyapp.com";
			expectedPresentlyURL = "presentlyapp.com";
			
			model = ModelLocator.instance;
			event = new PresentlyURLChangeEvent();
			command = new PresentlyURLChangeCommand();
			
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
        	
        	event.url = presentlyURLEventProperty;
			command.execute( event );
        	
        	testingTimer.start();
		}
		
		/**
		 * 
		 */
		private function verifyExecute( event : TimerEvent ) : void
		{
			assertEquals( model.presentlyBaseURL, expectedPresentlyURL );
		}
	}
}