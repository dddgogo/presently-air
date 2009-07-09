/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.events
{
	
	import com.intridea.presentlyAIRClient.events.AuthenticationEvent;

	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class AuthenticationEventTest extends TestCase
	{
		
		/**
	     *
	     */
		public function AuthenticationEventTest( methodName : String = null )
		{	
			super( methodName );
		}
		
        /**
	     *
	     */
		public function testLoginEventType() : void
		{	
			var event : AuthenticationEvent = new AuthenticationEvent( AuthenticationEvent.LOGIN_EVENT );
			var expected : String = AuthenticationEvent.LOGIN_EVENT;
			assertEquals( expected, event.type );
		}
		
		/**
	     *
	     */
		public function testLogoutEventType() : void
		{	
			var event : AuthenticationEvent = new AuthenticationEvent( AuthenticationEvent.LOGOUT_EVENT );
			var expected : String = AuthenticationEvent.LOGOUT_EVENT;
			assertEquals( expected, event.type );
		}
		
		/**
	     *
	     */
		public function testSuccessfulLoginEventType() : void
		{	
			var event : AuthenticationEvent = new AuthenticationEvent( AuthenticationEvent.SUCCESSFUL_LOGIN_EVENT );
			var expected : String = AuthenticationEvent.SUCCESSFUL_LOGIN_EVENT;
			assertEquals( expected, event.type );
		}
		
		/**
	     *
	     */
		public function testSuccessfulLogoutEventType() : void
		{	
			var event : AuthenticationEvent = new AuthenticationEvent( AuthenticationEvent.SUCCESSFUL_LOGOUT_EVENT );
			var expected : String = AuthenticationEvent.SUCCESSFUL_LOGOUT_EVENT;
			assertEquals( expected, event.type );
		}
		
	}
}