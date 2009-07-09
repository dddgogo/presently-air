/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */
 
package com.intridea.presentlyAIRClient.commands
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.intridea.presentlyAIRClient.business.LoginDelegate;
	import com.intridea.presentlyAIRClient.events.AuthenticationEvent;
	import com.intridea.presentlyAIRClient.events.FailedLoginEvent;
	import com.intridea.presentlyAIRClient.events.InitializeAutoUpdateIntervalEvent;
	import com.intridea.presentlyAIRClient.model.domain.User;
	import com.intridea.presentlyAIRClient.vo.LoginVO;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	/**
     *
     * Provides user authentication support for logging into the Present.ly server.
     * 
     * @see com.intridea.presentlyAIRClient.commands.AbstractCommand
     * @see com.adobe.cairngorm.commands.ICommand
     * @see mx.rpc.IResponder
     * 
     */
	public final class LoginCommand extends AbstractCommand implements ICommand, IResponder
	{

		/**
		 * 
		 * Contains the account, screen name, and password for the user authenticating into Present.ly server.
		 * 
		 * @see com.intridea.presentlyAIRClient.vo.Login 
		 * 
		 */
		private var login : LoginVO;
		
		/**
		 * 
		 * Message displayed to user if thier log in attempt fails.
		 * 
		 */
		private var failedLoginMessage : String = "Your attempt to login has failed. Please try again.";
		
		/**
		 * 
		 * Creates the objects need to makes the call to the Present.ly server for authentication. Collects the authentication
		 * information provided by the user from the <code>Login</code> instance passed to the method through the 
		 * <code>AuthenticationEvent</code> parameter. Notifies the user if they are trying to log in to the system if they 
		 * have already been authenticated.
		 * 
		 * @param event Contains the <code>Login</code> instance created by the user on the <code>LoginView</code>.
		 * 
		 * @see com.intridea.presentlyAIRClient.events.AuthenticationEvent
		 * @see com.intridea.presentlyAIRClient.view.LoginView
		 * 
		 */
		override public function execute( event : CairngormEvent ) : void
		{
			var loginEvent : AuthenticationEvent = event as AuthenticationEvent;
			model.currentAccount = loginEvent.account;
			model.presentlyBaseURL = loginEvent.presentlyBaseURL;
			login = new LoginVO( loginEvent.account, loginEvent.username, loginEvent.password );
			if( !model.isAuthenticated )
			{				
			    var delegate : LoginDelegate = new LoginDelegate( this );
			    delegate.doLogin( login );
			}
			else
			{
				Alert.show( "Already authenticated!! Logout and log back in as a different user." );
				return;
			}			
		}
		
		/**
		 * 
		 * Creates <code>User</code> instance and assigns it to the data model. Sets authenticated flag on the data model
		 * for used throughout the application's codebase. Dispatches the auto interval statuses update utility. Notifies
		 * the view that the user's authentication request was sucessful or if it failed.
		 * 
		 * @see import com.intridea.presentlyAIRClient.events.AuthenticationEvent;
		 * @see import com.intridea.presentlyAIRClient.events.FailedLoginEvent
		 * @see import com.intridea.presentlyAIRClient.events.InitializeAutoUpdateIntervalEvent
		 * 
		 */
		override public function result( event : Object ) : void	
		{
			var resultEvent : ResultEvent = event as ResultEvent;
			
			if ( resultEvent.result.user )
			{
				if ( !model.currentUser )
				{
					var user : User = new User();				
					user.account = login.account;
					user.screenName = login.username;
					user.password = login.password;
					model.currentUser = user;	
				}
				
				// sets the users global authentication presence to true for this session
				model.isAuthenticated = true;			
				model.statusMessage = "Successfully logged in.";
				
				new InitializeAutoUpdateIntervalEvent( InitializeAutoUpdateIntervalEvent.EVENT ).dispatch();
				new AuthenticationEvent( AuthenticationEvent.SUCCESSFUL_LOGIN_EVENT ).dispatch();
			}
			else
			{
				new FailedLoginEvent( failedLoginMessage ).dispatch();
			}
	    } 
		
		/**
		 * 
		 * Notifies the user that their log in attempt has failed using a standard Flex <code>Alert</code> control.
		 * 
		 * @param event fault Contains information from the server about the authentication failure.
		 * 
		 */
		override public function fault( event : Object ) : void
		{
			var faultEvent : FaultEvent = FaultEvent( event );			
			var message : String = "Authentication error: " + faultEvent.fault.message;
			new FailedLoginEvent( message ).dispatch();
		}
	}

}