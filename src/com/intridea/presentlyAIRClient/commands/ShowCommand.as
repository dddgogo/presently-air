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
	import com.intridea.presentlyAIRClient.business.ShowDelegate;
	import com.intridea.presentlyAIRClient.events.ShowEvent;
	import com.intridea.presentlyAIRClient.events.UserRetrievedEvent;
	import com.intridea.presentlyAIRClient.model.ModelLocator;
	import com.intridea.presentlyAIRClient.model.domain.User;
	import com.intridea.presentlyAIRClient.utils.UserManager;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	/**
     *
     * Requests information about specific user accounts. Used by <code>UserLookupView</code> to search
     * for users.
     * 
     * @see com.adobe.cairngorm.commands.ICommand
     * @see mx.rpc.IResponder
     * 
     */
	public final class ShowCommand implements ICommand, IResponder
	{

		/**
		 * 
		 * Creates objects required to call the Present.ly server to perform the user search.
		 * 
		 * @param event Provides the screen name of the user being looked up.
		 * 
		 */
		public function execute( event : CairngormEvent ) : void
		{
			var showEvent : ShowEvent = event as ShowEvent;
			var delegate : ShowDelegate = new ShowDelegate( this );
			delegate.search( showEvent.screenName );
		}
		
		/**
		 * 
		 * Captures the server response containing the user account information from the user search request.
		 * Manages tranforming the server response into object form and routing the user data to registered listeners
		 * of <code>UserRetrievedEvent</code> event notifications.
		 * 
		 * @param event Provides user information from the Present.ly server.
		 * 
		 */
		public function result( event : Object ) : void
		{
			var resultEvent : ResultEvent = event as ResultEvent;
			var user : User = UserManager.serialize( resultEvent.result.user );
			
			var userRetrievedEvent : UserRetrievedEvent = new UserRetrievedEvent( UserRetrievedEvent.EVENT );
			userRetrievedEvent.user = user;
			userRetrievedEvent.dispatch();
			
			ModelLocator.instance.statusMessage = "Users found matching your criteria.";
		}
		
		/**
		 * 
		 * Creates an Alert to notify the user that a problem has occured with the request for user account data 
		 * from the Present.ly server.
		 * 
		 * @param event Contains error information for failed user account requests.
		 * 
		 */
		public function fault( event : Object ):void
		{
			var faultEvent : FaultEvent = FaultEvent( event );			
			Alert.show("System error: " + faultEvent.fault );
		}
	}

}