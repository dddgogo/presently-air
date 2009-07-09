/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.commands
{
	import com.intridea.presentlyAIRClient.commands.SetSelectedViewStateCommand;
	import com.intridea.presentlyAIRClient.context.ApplicationContext;
	import com.intridea.presentlyAIRClient.events.SetSelectedViewStateEvent;
	import com.intridea.presentlyAIRClient.model.ModelLocator;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class SetSelectedViewStateCommandTest extends TestCase
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
		private var event : SetSelectedViewStateEvent;
		 
		/**
		 * 
		 */
		private var command : SetSelectedViewStateCommand;
		
		/**
		 * 
		 */
		private var expectedViewState : int;
		
		/**
		 * 
		 */
		private var viewStateEventArgument : int;
		
		/**
		 * 
		 */
		private var model : ModelLocator;
		
		/**
	     *
	     */
		public function SetSelectedViewStateCommandTest( methodName : String = null )
		{	
			super( methodName );
		}
		
		/**
		 * 
		 */
		override public function setUp() : void
		{
			expectedViewState = 3;
			viewStateEventArgument = 3;
			
			event = new SetSelectedViewStateEvent( viewStateEventArgument );
			command = new SetSelectedViewStateCommand();
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
        	
			command.execute( event );
        	
        	testingTimer.start();
		}
		
		/**
		 * 
		 */
		private function verifyExecute( event : TimerEvent ) : void
		{
			assertEquals( ApplicationContext.currentViewState, expectedViewState );
		}
	}
}