package com.intridea.tests.intridea.presentlyAIRClient.commands
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.intridea.presentlyAIRClient.commands.LoginCommand;
	import com.intridea.presentlyAIRClient.events.AuthenticationEvent;
	import com.intridea.presentlyAIRClient.model.ModelLocator;
	import com.intridea.presentlyAIRClient.model.domain.User;
	import com.intridea.presentlyAIRClient.vo.LoginVO;
	import com.intridea.tests.intridea.presentlyAIRClient.mocks.MockTestUser;
	
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import flexunit.framework.TestCase;
	
	public final class LoginCommandTest extends TestCase
	{
		
		/**
		 * 
		 */
		private static const CALL_TIMEOUT : int = 3000;

		/**
		 * 
		 */
		private var model : ModelLocator;
		
		/**
		 * 
		 */
		private var testingTimer : Timer;
		
		/**
		 * 
		 */
		private var command : LoginCommand;
		
		/**
		 * 
		 */
		private var event : AuthenticationEvent;
		
		/**
		 * 
		 */
		private var testUser : User;
		
		/**
		 * 
		 */
		private var login : LoginVO;
		
		/**
		 * 
		 */
		public function LoginCommandTest( methodName : String = null )
		{
			super( methodName );
		}
		
		/**
		 * 
		 */
		override public function setUp() : void
		{
			model = ModelLocator.instance;
			
			testUser = MockTestUser.getUser();
			login = new LoginVO( testUser.account, testUser.screenName, testUser.password );
			
			event = new AuthenticationEvent( AuthenticationEvent.LOGIN_EVENT );
        	event.account = testUser.account;
        	event.username = testUser.screenName;
        	event.password = testUser.password;
        	event.presentlyBaseURL = model.presentlyBaseURL;
			
		}
		
		/**
		 * 
		 */
		override public function tearDown() : void
		{
			testingTimer.stop();
            testingTimer = null;
            testUser = null;
            command = null;
            model = null;
            login = null;
		}
		
		/**
		 * 
		 */
		public function testLoginCommand() : void
		{        	
        	testingTimer = new Timer( CALL_TIMEOUT, 1 );
			testingTimer.addEventListener( TimerEvent.TIMER_COMPLETE, addAsync( verifyServiceCall, CALL_TIMEOUT ));
        	testingTimer.start();
        	
        	command = new LoginCommand();
        	command.execute( event as CairngormEvent );
  		}
        
        /**
		 *
		 */
        public function verifyServiceCall( event : Event ) : void
        {
        	testingTimer.removeEventListener( TimerEvent.TIMER_COMPLETE, verifyServiceCall );        	
        	       	
        	assertTrue( model.isAuthenticated );
        	
        	assertNotNull( model.currentUser );
        	
        	var actualAccount : String = model.currentUser.account;
			var expectedAccount : String = login.account;
			assertEquals( actualAccount, expectedAccount );
			
			var actualScreenName : String = model.currentUser.screenName;
			var expectedScreenName : String = login.username;
			assertEquals( actualScreenName, expectedScreenName );
			
			var actualPassword : String = model.currentUser.password;
			var expectedPassword : String = login.password;
			assertEquals( actualPassword, expectedPassword );
  	
        }
	}
}