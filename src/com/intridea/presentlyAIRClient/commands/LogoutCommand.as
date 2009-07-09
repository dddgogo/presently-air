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
	import com.intridea.presentlyAIRClient.business.HTTPDelegate;
	import com.intridea.presentlyAIRClient.business.ServiceConfigurations;
	import com.intridea.presentlyAIRClient.business.Services;
	import com.intridea.presentlyAIRClient.context.ApplicationContext;
	import com.intridea.presentlyAIRClient.events.AuthenticationEvent;
	import com.intridea.presentlyAIRClient.utils.StatusesManager;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	/**
     *
     * Provides user authentication support for logging out of the Present.ly server.
     * 
     * @see com.intridea.presentlyAIRClient.commands.AbstractCommand
     * @see com.adobe.cairngorm.commands.ICommand
     * @see mx.rpc.IResponder
     * 
     */
	public final class LogoutCommand extends AbstractCommand implements ICommand, IResponder
	{
	
		/**
		 * 
		 * Creates the objects needed to log the current user out of the Present.ly server. Notifies user if they
		 * are not logged into the system and have requested to log out.
		 * 
		 * @param event Standard <code>AuthenticationEvent</code>. Not used in this method.
		 * 
		 */
		override public function execute( event : CairngormEvent ) : void
		{
			var logoutEvent : AuthenticationEvent = event as AuthenticationEvent;
			if( model.isAuthenticated )
			{
			    var delegate : HTTPDelegate = new HTTPDelegate( this, model.currentUser, Services.LOGOUT, ServiceConfigurations.LOGOUT_URL );
				delegate.callHTTPService();
			}
			else
			{
				Alert.show( "Cannot log out. You are not currently logged in!" );
				return;
			}
		}
		
		/**
		 * 
		 * Clears all properties on the data model associated with authentication to enable a new request. Updates the view state
		 * to display the login view to the user. Notifies registered listeners that the user has been logged out of the 
		 * Present.ly server.
		 * 
		 * @see import com.intridea.presentlyAIRClient.events.AuthenticationEvent
		 * 
		 */
		override public function result( event : Object ) : void
		{
			var resultEvent : ResultEvent = event as ResultEvent;			
			var bodyID : String = event.result.html.body.id;	

			if ( bodyID == "sessions_new" )
			{
				model.currentAccount = "";
				model.statusesManager = new StatusesManager();
				model.statusMessage = "Successfully logged out.";
				model.isAuthenticated = false;
				model.currentUser = null;
				ApplicationContext.currentViewState = ApplicationContext.LOGIN_VIEW;				
				
				new AuthenticationEvent( AuthenticationEvent.SUCCESSFUL_LOGOUT_EVENT ).dispatch();				
			}
			else
			{
				Alert.show( "Error logging out of system!" );
			}
	    } 
		
		/**
		 * 
		 * Notifies the user that their attempt to log out has failed using a standard Flex <code>Alert</code> control.
		 * 
		 * @param event fault Contains information from the server about the authentication failure.
		 * 
		 */
		override public function fault( event : Object ):void
		{
			var faultEvent : FaultEvent = FaultEvent( event );
			Alert.show( "System error: " + faultEvent.fault );
		}
	}
}