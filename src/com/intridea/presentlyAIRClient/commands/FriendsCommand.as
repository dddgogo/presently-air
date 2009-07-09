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
	import com.intridea.presentlyAIRClient.events.FriendsEvent;
	import com.intridea.presentlyAIRClient.events.FriendsRetrievedEvent;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	/**
     *
     * Retrieves the current user's friends from the Present.ly server and updates the data model.
     * 
     * @see com.intridea.presentlyAIRClient.commands.AbstractCommand
     * @see com.adobe.cairngorm.commands.ICommand
     * @see mx.rpc.IResponder
     * 
     */
	public final class FriendsCommand extends AbstractCommand implements ICommand, IResponder
	{
		
		/**
		 * 
		 * Sets the current service on the data model. Creates a delegate to gather the current user's friends
		 * from the Present.ly server.
		 * 
		 * @param event Dispatched from the view to run this command. Not used in this method.
		 * 
		 */
		override public function execute( event : CairngormEvent ) : void
		{
			
			model.currentService = "friends";
			
			var friendsEvent : FriendsEvent = event as FriendsEvent;
			var delegate : HTTPDelegate = new HTTPDelegate( this, model.currentUser, Services.FRIENDS, ServiceConfigurations.FRIENDS_URL );
			delegate.callHTTPService();
		}
		
		/**
		 * 
		 * Used to handle response from service layer and update the application
		 * data model with the results.
		 * 
		 */
		override public function result( event : Object ) : void
		{
			var resultEvent : ResultEvent = event as ResultEvent;
			
			// TODO: need to handle the case where there is only 1 user in resultEvent.result.users.user
			// the result cannot be cast to an ArrayCollection in that case. it is just an Object object
			var friends : ArrayCollection = resultEvent.result.users.user as ArrayCollection;
			
			if ( friends != null )
			{
				model.friends = friends.source;
				
				model.statusMessage = "Friends received from server.";
			
				new FriendsRetrievedEvent( FriendsRetrievedEvent.EVENT ).dispatch();
			}
		}
		
		/**
		 * 
		 * Creates an Alert to notify the user that a problem has occured with the request for the user's friends 
		 * from the Present.ly server.
		 * 
		 * @param event Contains error information for failed friends requests.
		 * 
		 */
		override public function fault( event : Object ):void
		{
			var faultEvent : FaultEvent = FaultEvent( event );			
			Alert.show("System error: " + faultEvent.fault );
		}
	}

}