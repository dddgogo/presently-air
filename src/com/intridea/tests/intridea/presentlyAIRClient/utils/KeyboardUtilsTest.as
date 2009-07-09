/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.utils
{
	import com.intridea.presentlyAIRClient.utils.KeyboardUtils;
	
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class KeyboardUtilsTest extends TestCase
	{
		/**
		 * 
		 */
		private var enterKeyEvent : KeyboardEvent;
		
		/**
		 * 
		 */
		private var backspaceKeyEvent : KeyboardEvent;

		/**
	     *
	     */
		public function KeyboardUtilsTest( methodName : String = null )
		{	
			super( methodName );
		}
		
		/**
		 * 
		 */
		override public function setUp() : void
		{
			enterKeyEvent = new KeyboardEvent(KeyboardEvent.KEY_DOWN, true, false, Keyboard.ENTER, Keyboard.ENTER );
			backspaceKeyEvent = new KeyboardEvent(KeyboardEvent.KEY_DOWN, true, false, Keyboard.BACKSPACE, Keyboard.BACKSPACE );
		}
		
		/**
		 * 
		 */
		override public function tearDown() : void
		{
			enterKeyEvent = null;
			backspaceKeyEvent = null;
		}
		
		/**
		 * 
		 */
		public function testIsEnterKeyEvent() : void
		{
			assertTrue( KeyboardUtils.isEnterEvent( enterKeyEvent ) );
		}
		
		/**
		 * 
		 */
		public function testIsNotEnterKeyEvent() : void
		{
			assertFalse( KeyboardUtils.isEnterEvent( backspaceKeyEvent ) );
		}
	}
}